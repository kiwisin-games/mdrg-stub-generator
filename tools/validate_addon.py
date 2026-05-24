from __future__ import annotations

import argparse
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "data"
LIBRARY = ROOT / "library"
EXTERN = ROOT / "extern"
LEGACY_RUNTIME = LIBRARY / "mdrg_legacy_runtime_aliases.d.lua"
PACKAGE_MANIFEST = ROOT / "tools" / "package_manifest.json"
REQUIRED_DATA_FILES = [
    DATA / "csharp_index.json",
    DATA / "lua_usage_index.json",
    DATA / "runtime_callback_evidence.json",
    DATA / "runtime_probe_index.json",
    DATA / "unity_main_scene_index.json",
    DATA / "source_manifest.json",
]
RAW_TRACKING_DENYLIST = [
    "dump",
    "rawdump",
    "examples/mods_mixed.lua",
]
TRACKED_RESEARCH_CORPUS = [
    "luas",
]
PACKAGE_EXCLUDE_REQUIRED = [
    "dump/**",
    "rawdump/**",
    "luas/**",
    "probe/**",
    "analysis/**",
    "examples/callback_debug_mod_real/**",
    "examples/mods_mixed.lua",
]


def fail(errors: list[str], message: str) -> None:
    errors.append(message)


def library_files() -> list[Path]:
    return sorted(LIBRARY.glob("*.d.lua"))


def validate_meta(files: list[Path], errors: list[str]) -> None:
    for path in files:
        first = path.read_text(encoding="utf-8").splitlines()[0:1]
        if first != ["---@meta"]:
            fail(errors, f"{path.relative_to(ROOT)} does not start with ---@meta")


def collect_classes_and_aliases(files: list[Path], errors: list[str]) -> tuple[set[str], set[str]]:
    classes: dict[str, list[str]] = {}
    aliases: dict[str, list[str]] = {}
    parents: list[tuple[str, str, str]] = []

    for path in files:
        for line_no, line in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
            class_match = re.match(r"^---@class\s+([A-Za-z_][A-Za-z0-9_]*)(?::\s*([A-Za-z_][A-Za-z0-9_]*))?", line)
            if class_match:
                name = class_match.group(1)
                parent = class_match.group(2)
                classes.setdefault(name, []).append(f"{path.relative_to(ROOT)}:{line_no}")
                if parent:
                    parents.append((name, parent, f"{path.relative_to(ROOT)}:{line_no}"))
                continue

            alias_match = re.match(r"^---@alias\s+([A-Za-z_][A-Za-z0-9_]*)", line)
            if alias_match:
                aliases.setdefault(alias_match.group(1), []).append(f"{path.relative_to(ROOT)}:{line_no}")

    for name, locations in sorted(classes.items()):
        if len(locations) > 1:
            fail(errors, f"duplicate class {name}: {', '.join(locations)}")
    for name, locations in sorted(aliases.items()):
        if len(locations) > 1:
            fail(errors, f"duplicate alias {name}: {', '.join(locations)}")

    defined = set(classes) | set(aliases)
    for child, parent, location in parents:
        if child == parent:
            fail(errors, f"self-parent class {child} at {location}")
        if parent not in defined:
            fail(errors, f"class {child} has missing parent {parent} at {location}")

    return set(classes), set(aliases)


def validate_usage_alias_references(files: list[Path], defined_names: set[str], errors: list[str]) -> None:
    for path in files:
        for line_no, line in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
            for name in re.findall(r"\bMdrg[A-Za-z0-9_]*\b", line):
                if name not in defined_names:
                    fail(errors, f"missing MDRG alias {name} referenced at {path.relative_to(ROOT)}:{line_no}")


def validate_legacy_runtime(errors: list[str]) -> None:
    if not LEGACY_RUNTIME.exists():
        fail(errors, "library/mdrg_legacy_runtime_aliases.d.lua is missing")
        return

    allowed_assignments = {"gv = GameVariables", "flowchart = flowchart"}
    for line_no, line in enumerate(LEGACY_RUNTIME.read_text(encoding="utf-8").splitlines(), start=1):
        stripped = line.strip()
        if not stripped or stripped.startswith("--"):
            continue
        if stripped not in allowed_assignments:
            fail(errors, f"unexpected legacy runtime statement at {LEGACY_RUNTIME.relative_to(ROOT)}:{line_no}: {stripped}")


def validate_module_absent(errors: list[str]) -> None:
    if (ROOT / "module").exists():
        fail(errors, "module/ must not be recreated")


def validate_required_data(errors: list[str]) -> None:
    for path in REQUIRED_DATA_FILES:
        if not path.exists():
            fail(errors, f"required curated data file missing: {path.relative_to(ROOT)}")
            continue
        try:
            json.loads(path.read_text(encoding="utf-8"))
        except json.JSONDecodeError as exc:
            fail(errors, f"invalid JSON in {path.relative_to(ROOT)}: {exc}")


def validate_package_manifest_policy(errors: list[str]) -> None:
    if not PACKAGE_MANIFEST.exists():
        fail(errors, f"package manifest missing: {PACKAGE_MANIFEST.relative_to(ROOT)}")
        return
    try:
        manifest = json.loads(PACKAGE_MANIFEST.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        fail(errors, f"invalid JSON in {PACKAGE_MANIFEST.relative_to(ROOT)}: {exc}")
        return

    include_patterns = set(manifest.get("include", [])) | set(manifest.get("optional_include", []))
    exclude_patterns = set(manifest.get("exclude", []))
    for pattern in PACKAGE_EXCLUDE_REQUIRED:
        if pattern not in exclude_patterns:
            fail(errors, f"package manifest must exclude {pattern}")
        if pattern in include_patterns:
            fail(errors, f"package manifest must not include {pattern}")

    for pattern in include_patterns:
        normalized = pattern.replace("\\", "/")
        if normalized.startswith(("dump/", "rawdump/", "luas/", "probe/", "analysis/")):
            fail(errors, f"package manifest includes research/output path: {pattern}")


def validate_external_stubs(errors: list[str]) -> None:
    if not EXTERN.exists():
        return

    for source in sorted(EXTERN.glob("*.d.lua")):
        first = source.read_text(encoding="utf-8").splitlines()[0:1]
        if first != ["---@meta"]:
            fail(errors, f"external stub {source.relative_to(ROOT)} does not start with ---@meta")
            continue

        target = LIBRARY / source.name
        if not target.exists():
            fail(errors, f"external stub {source.relative_to(ROOT)} was not copied to library/")
            continue
        if source.read_bytes() != target.read_bytes():
            fail(errors, f"external stub copy differs: {source.relative_to(ROOT)} -> {target.relative_to(ROOT)}")


def tracked_files(paths: list[str]) -> list[str]:
    if not (ROOT / ".git").exists() or not shutil.which("git"):
        return []
    result = subprocess.run(
        ["git", "ls-files", *paths],
        cwd=ROOT,
        check=False,
        capture_output=True,
        text=True,
    )
    if result.returncode:
        return []
    return [line.strip() for line in result.stdout.splitlines() if line.strip()]


def validate_raw_sources_untracked(errors: list[str]) -> None:
    tracked = tracked_files(RAW_TRACKING_DENYLIST)
    if tracked:
        fail(
            errors,
            "raw/local sources must not be tracked: " + ", ".join(tracked[:10]) + (" ..." if len(tracked) > 10 else ""),
        )

    # `luas/` is a small tracked research corpus, not a package payload. It is
    # allowed in Git so callback and usage tooling can run without raw dumps.
    # The package manifest policy above keeps it out of distribution builds.


def count_pattern(files: list[Path], pattern: str) -> int:
    total = 0
    regex = re.compile(pattern)
    for path in files:
        total += sum(1 for line in path.read_text(encoding="utf-8").splitlines() if regex.match(line))
    return total


def data_alias_count(path: Path) -> int:
    if not path.exists():
        return 0
    data = json.loads(path.read_text(encoding="utf-8"))
    return len(data.get("aliases", []))


def runtime_probe_count(path: Path, key: str) -> int:
    if not path.exists():
        return 0
    data = json.loads(path.read_text(encoding="utf-8"))
    return len(data.get(key, []))


def health_report(files: list[Path], errors: list[str]) -> None:
    classes = count_pattern(files, r"^---@class\s+")
    aliases = count_pattern(files, r"^---@alias\s+")
    placeholders = count_pattern([LIBRARY / "mdrg_types.d.lua"], r"^---@class\s+") if (LIBRARY / "mdrg_types.d.lua").exists() else 0
    total_bytes = sum(path.stat().st_size for path in files)
    lua_aliases = data_alias_count(DATA / "lua_usage_index.json")
    unity_aliases = data_alias_count(DATA / "unity_main_scene_index.json")
    runtime_aliases = runtime_probe_count(DATA / "runtime_probe_index.json", "runtime_aliases")
    runtime_symbols = runtime_probe_count(DATA / "runtime_probe_index.json", "present_symbols")
    external_stubs = len(list(EXTERN.glob("*.d.lua"))) if EXTERN.exists() else 0
    tracked_research = tracked_files(TRACKED_RESEARCH_CORPUS)
    lua_ls = shutil.which("lua-language-server")

    print("Project health:")
    print(f"- Definition files: {len(files)}")
    print(f"- Classes: {classes}")
    print(f"- Aliases: {aliases}")
    print(f"- Type/fallback classes in mdrg_types.d.lua: {placeholders}")
    print(f"- Generated library size: {total_bytes} bytes")
    print(f"- Lua usage aliases in curated data: {lua_aliases}")
    print(f"- Unity legacy aliases in curated data: {unity_aliases}")
    print(f"- Runtime probe aliases in curated data: {runtime_aliases}")
    print(f"- Runtime probe present symbols: {runtime_symbols}")
    print(f"- External stubs: {external_stubs}")
    print(f"- Tracked research corpus files: {len(tracked_research)}")
    print(f"- LuaLS: {lua_ls if lua_ls else 'not in PATH (warning only)'}")
    print(f"- Validation errors: {len(errors)}")


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Validate the generated MDRG LuaLS addon.")
    parser.add_argument("--health", action="store_true", help="print a short project health report")
    return parser


def main() -> int:
    args = build_parser().parse_args()
    errors: list[str] = []
    files = library_files()
    if not files:
        fail(errors, "library/ has no .d.lua files")
    validate_meta(files, errors)
    classes, aliases = collect_classes_and_aliases(files, errors)
    validate_usage_alias_references(files, classes | aliases, errors)
    validate_legacy_runtime(errors)
    validate_external_stubs(errors)
    validate_module_absent(errors)
    validate_required_data(errors)
    validate_package_manifest_policy(errors)
    validate_raw_sources_untracked(errors)

    if args.health:
        health_report(files, errors)

    if errors:
        print("Addon validation failed:")
        for error in errors:
            print(f"- {error}")
        return 1

    print(
        "Addon validation passed: "
        f"{len(files)} definition files, no duplicate classes/aliases, "
        "valid parents, valid MDRG alias references, legacy runtime isolated."
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())

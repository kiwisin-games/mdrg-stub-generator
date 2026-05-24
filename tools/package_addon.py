from __future__ import annotations

import argparse
import json
import subprocess
import sys
import zipfile
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "tools" / "package_manifest.json"
DEFAULT_OUTPUT = ROOT / "dist" / "mdrg-luals-addon.zip"
REPORT = ROOT / "dist" / "package_report.md"


@dataclass
class PackagePlan:
    included: list[Path]
    warnings: list[str]


def load_manifest() -> dict[str, list[str]]:
    return json.loads(MANIFEST.read_text(encoding="utf-8"))


def expand_patterns(patterns: list[str]) -> list[Path]:
    files: set[Path] = set()
    for pattern in patterns:
        for path in ROOT.glob(pattern):
            if path.is_file():
                files.add(path)
    return sorted(files, key=lambda path: path.relative_to(ROOT).as_posix().lower())


def dangerous_include(path: Path) -> str | None:
    rel = path.relative_to(ROOT).as_posix()
    if rel.startswith("probe/"):
        return "runtime probe output must not be packaged"
    if rel.startswith("luas/"):
        return "tracked Lua research corpus must not be packaged"
    if rel.startswith("json/mdrg_jsondump_tools/all_mods_dump/"):
        return "raw json dump must not be packaged"
    if rel == "examples/mods_mixed.lua":
        return "large mixed mod research file must not be packaged"
    if path.suffix.lower() == ".txt" and path.stat().st_size > 1024 * 1024:
        return "large text file over 1 MB"
    if path.suffix.lower() == ".lua" and not rel.startswith("library/") and path.stat().st_size > 1024 * 1024:
        return "large lua file over 1 MB outside library"
    return None


def build_plan(include_dev_docs: bool) -> PackagePlan:
    manifest = load_manifest()
    patterns = list(manifest.get("include", []))
    if include_dev_docs:
        patterns.extend(manifest.get("optional_include", []))
    included = expand_patterns(patterns)
    warnings: list[str] = []
    for path in included:
        reason = dangerous_include(path)
        if reason:
            warnings.append(f"{path.relative_to(ROOT).as_posix()}: {reason}")
    return PackagePlan(included, warnings)


def validate_addon() -> None:
    result = subprocess.run([sys.executable, str(ROOT / "tools" / "validate_addon.py")], cwd=ROOT)
    if result.returncode:
        raise SystemExit(result.returncode)


def write_zip(files: list[Path], output: Path) -> None:
    output.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(output, "w", compression=zipfile.ZIP_DEFLATED) as archive:
        for path in files:
            archive.write(path, path.relative_to(ROOT).as_posix())


def render_report(output: Path, plan: PackagePlan) -> str:
    size = output.stat().st_size if output.exists() else 0
    lines = [
        "# Package report",
        "",
        f"- Output: `{output.relative_to(ROOT).as_posix()}`",
        f"- Size bytes: {size}",
        f"- Included files: {len(plan.included)}",
        f"- Warnings: {len(plan.warnings)}",
        "",
        "## Included files",
        "",
        *[f"- `{path.relative_to(ROOT).as_posix()}` ({path.stat().st_size} bytes)" for path in plan.included],
        "",
        "## Warnings",
        "",
    ]
    if plan.warnings:
        lines.extend(f"- {warning}" for warning in plan.warnings)
    else:
        lines.append("- None")
    return "\n".join(lines) + "\n"


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Create a clean MDRG LuaLS addon package.")
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--include-dev-docs", action="store_true")
    parser.add_argument("--skip-validate", action="store_true")
    return parser


def main() -> int:
    args = build_parser().parse_args()
    output = args.output if args.output.is_absolute() else ROOT / args.output
    if not args.skip_validate:
        validate_addon()
    plan = build_plan(args.include_dev_docs)
    if plan.warnings:
        print("Package warnings:")
        for warning in plan.warnings:
            print(f"- {warning}")
    write_zip(plan.included, output)
    REPORT.parent.mkdir(parents=True, exist_ok=True)
    REPORT.write_text(render_report(output, plan), encoding="utf-8")
    print(f"Packaged {len(plan.included)} files: {output.relative_to(ROOT)} ({output.stat().st_size} bytes)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

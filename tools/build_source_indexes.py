from __future__ import annotations

import hashlib
import json
from datetime import UTC, datetime
from pathlib import Path

import generate_luals_addon as luals
from lua_usage_index import build_lua_usage_index, save_lua_usage_index
from probe_runtime_index import build_runtime_probe_index, save_runtime_probe_index
from unity_usage_index import build_unity_usage_index, save_unity_usage_index


ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "data"
SOURCE_MANIFEST = DATA / "source_manifest.json"


def sha256(path: Path) -> str | None:
    if not path.exists() or not path.is_file():
        return None
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def count_files(path: Path, pattern: str = "*") -> int:
    if not path.exists():
        return 0
    return sum(1 for item in path.rglob(pattern) if item.is_file())


def filtered_csharp_docs(csharp_docs: luals.CSharpDocIndex, class_names: set[str]) -> luals.CSharpDocIndex:
    filtered = luals.CSharpDocIndex()
    for key, docs in csharp_docs.fields.items():
        if key[0] in class_names:
            filtered.fields[key].extend(docs)
    return filtered


def filtered_csharp_methods(
    csharp_methods: dict[tuple[str, str], list[luals.CSharpMethodInfo]],
    class_names: set[str],
) -> dict[tuple[str, str], list[luals.CSharpMethodInfo]]:
    return {
        key: infos
        for key, infos in csharp_methods.items()
        if key[0] in class_names
    }


def build_csharp_index() -> tuple[int, int, int]:
    globals_, enums, classes = luals.parse_docs()
    name_map = luals.assign_lua_names(globals_, enums, classes)
    luals.parse_members(classes)

    known_names = {info.lua_name for info in enums.values()} | {info.lua_name for info in classes.values()}
    converter = luals.TypeConverter(name_map, known_names)

    class_names: set[str] = set()
    for cls in classes.values():
        class_names.update(luals.class_doc_names(cls))

    csharp_docs = filtered_csharp_docs(luals.build_csharp_doc_index(), class_names)
    csharp_inheritance = luals.build_csharp_inheritance_index()
    csharp_methods = filtered_csharp_methods(luals.build_csharp_method_index(converter), class_names)
    luals.save_csharp_indexes(luals.CSHARP_INDEX, csharp_docs, csharp_inheritance, csharp_methods)
    return (
        sum(len(items) for items in csharp_docs.fields.values()),
        len(csharp_inheritance),
        sum(len(items) for items in csharp_methods.values()),
    )


def write_manifest(
    csharp_counts: tuple[int, int, int],
    lua_aliases: int,
    unity_aliases: int,
    runtime_probe: dict,
) -> None:
    manifest = {
        "schema_version": 1,
        "generated_at_utc": datetime.now(UTC).replace(microsecond=0).isoformat(),
        "policy": "curated reproducible indexes; raw dumps remain local/ignored",
        "inputs": {
            "docs.txt": {
                "sha256": sha256(ROOT / "docs.txt"),
                "bytes": (ROOT / "docs.txt").stat().st_size if (ROOT / "docs.txt").exists() else 0,
            },
            "documented_functions.md": {
                "sha256": sha256(ROOT / "documented_functions.md"),
                "bytes": (ROOT / "documented_functions.md").stat().st_size
                if (ROOT / "documented_functions.md").exists()
                else 0,
            },
            "dump": {
                "files": count_files(ROOT / "dump", "*.cs"),
            },
            "rawdump": {
                "files": count_files(ROOT / "rawdump", "*.cs"),
            },
            "luas": {
                "files": count_files(ROOT / "luas"),
            },
            "unity": {
                "mainScene.txt_sha256": sha256(ROOT / "unity" / "mainScene.txt"),
                "mainScene.md_sha256": sha256(ROOT / "unity" / "mainScene.md"),
            },
            "probe": {
                "source_report": runtime_probe.get("source_report"),
                "source_timestamp": runtime_probe.get("source_timestamp"),
                "source_sha256": runtime_probe.get("source_sha256"),
            },
            "extern": {
                "d_lua_files": count_files(ROOT / "extern", "*.d.lua"),
                "md_files": count_files(ROOT / "extern", "*.md"),
            },
        },
        "outputs": {
            "csharp_index.json": {
                "field_docs": csharp_counts[0],
                "inheritance_edges": csharp_counts[1],
                "method_entries": csharp_counts[2],
            },
            "lua_usage_index.json": {
                "aliases": lua_aliases,
            },
            "unity_main_scene_index.json": {
                "aliases": unity_aliases,
            },
            "runtime_probe_index.json": {
                "present_symbols": len(runtime_probe.get("present_symbols", [])),
                "runtime_aliases": len(runtime_probe.get("runtime_aliases", [])),
                "callables": len(runtime_probe.get("callables", [])),
                "enum_like_userdata": len(runtime_probe.get("enum_like_userdata", [])),
                "field_probes": len(runtime_probe.get("field_probes", [])),
                "enum_value_probes": len(runtime_probe.get("enum_value_probes", [])),
                "safe_io_present": runtime_probe.get("safe_io", {}).get("io_present"),
            },
        },
    }
    SOURCE_MANIFEST.write_text(json.dumps(manifest, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def main() -> None:
    DATA.mkdir(parents=True, exist_ok=True)
    csharp_counts = build_csharp_index()

    lua_usage = build_lua_usage_index(ROOT)
    save_lua_usage_index(lua_usage, luals.LUA_USAGE_INDEX)

    unity_usage = build_unity_usage_index(ROOT)
    save_unity_usage_index(unity_usage, luals.UNITY_USAGE_INDEX)

    runtime_probe = build_runtime_probe_index(ROOT)
    save_runtime_probe_index(runtime_probe, luals.RUNTIME_PROBE_INDEX)

    write_manifest(csharp_counts, len(lua_usage.aliases), len(unity_usage.aliases), runtime_probe)
    print(
        "Built source indexes: "
        f"csharp fields={csharp_counts[0]}, "
        f"inheritance={csharp_counts[1]}, "
        f"methods={csharp_counts[2]}, "
        f"lua aliases={len(lua_usage.aliases)}, "
        f"unity aliases={len(unity_usage.aliases)}, "
        f"runtime aliases={len(runtime_probe.get('runtime_aliases', []))}."
    )


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Process MDRG JSON dump files and infer schemas/statistics.

Inputs expected from the PowerShell dumper:
- mod_json_dump.txt       blocks delimited by ===== BEGIN/END FILE
- texture_json_dump.txt   blocks delimited by ===== BEGIN/END FILE
- png_asset_list.txt      usually a path list; may contain more than PNGs depending on the dumper

Outputs:
- analysis/assets.schema.json
- analysis/mod.schema.json
- analysis/jsondump_summary.md
- analysis/texture_schema_findings.json
- analysis/mod_schema_findings.json
- analysis/texture_asset_validation.md

The schemas are intentionally tolerant because dumps may contain mods from older game versions.
"""
from __future__ import annotations

import argparse
import json
import re
from collections import Counter, defaultdict
from dataclasses import dataclass
from pathlib import Path, PureWindowsPath
from typing import Any, Iterable

BEGIN_RE = re.compile(r"^===== BEGIN FILE: (.*?) =====\s*$")
END_PREFIX = "===== END FILE: "


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8-sig", errors="replace")


@dataclass
class JsonBlock:
    path: str
    content: str
    json_obj: Any | None = None
    error: str | None = None


def parse_dump_blocks(path: Path) -> list[JsonBlock]:
    """Parse dump blocks. Tolerates Windows paths and malformed JSON."""
    lines = read_text(path).splitlines()
    blocks: list[JsonBlock] = []
    current_path: str | None = None
    buf: list[str] = []

    for line in lines:
        m = BEGIN_RE.match(line)
        if m:
            if current_path is not None:
                blocks.append(JsonBlock(current_path, "\n".join(buf), error="missing END marker"))
            current_path = m.group(1).strip()
            buf = []
            continue

        if current_path is not None and line.startswith(END_PREFIX):
            content = "\n".join(buf).strip()
            block = JsonBlock(current_path, content)
            try:
                block.json_obj = json.loads(content)
            except Exception as exc:  # noqa: BLE001 - report only
                block.error = str(exc)
            blocks.append(block)
            current_path = None
            buf = []
            continue

        if current_path is not None:
            buf.append(line)

    if current_path is not None:
        blocks.append(JsonBlock(current_path, "\n".join(buf), error="missing END marker at EOF"))

    return blocks


def norm_path(path: str) -> str:
    return path.replace("\\", "/").strip("/")


def parent_dir(path: str) -> str:
    return str(PureWindowsPath(path).parent).replace("\\", "/")


def join_sibling(path: str, name: str) -> str:
    return norm_path(str(PureWindowsPath(path).parent / name))


def maybe_mod_root(path: str) -> str:
    # Useful heuristic: everything up to the directory containing mod.json, or first two segments under Mods.
    p = norm_path(path)
    parts = p.split("/")
    if len(parts) >= 2 and parts[0].lower() == "mods":
        return "/".join(parts[:2])
    if "mod.json" in parts:
        return "/".join(parts[: parts.index("mod.json")])
    return parts[0] if parts else ""


def type_name(v: Any) -> str:
    if v is None:
        return "null"
    if isinstance(v, bool):
        return "boolean"
    if isinstance(v, int) and not isinstance(v, bool):
        return "integer"
    if isinstance(v, float):
        return "number"
    if isinstance(v, str):
        return "string"
    if isinstance(v, list):
        return "array"
    if isinstance(v, dict):
        return "object"
    return type(v).__name__


def json_schema_type(types: Iterable[str]) -> str | list[str]:
    mapping = {
        "null": "null",
        "boolean": "boolean",
        "integer": "integer",
        "number": "number",
        "string": "string",
        "array": "array",
        "object": "object",
    }
    out = sorted({mapping.get(t, "string") for t in types})
    return out[0] if len(out) == 1 else out


def collect_field_stats(objects: Iterable[dict[str, Any]]) -> dict[str, Any]:
    count = 0
    keys = Counter()
    type_counts: dict[str, Counter] = defaultdict(Counter)
    samples: dict[str, list[Any]] = defaultdict(list)

    for obj in objects:
        count += 1
        keys.update(obj.keys())
        for k, v in obj.items():
            type_counts[k][type_name(v)] += 1
            if len(samples[k]) < 5:
                samples[k].append(v)

    return {
        "count": count,
        "keys": dict(keys),
        "type_counts": {k: dict(v) for k, v in type_counts.items()},
        "samples": samples,
    }


def infer_texture_schema(texture_blocks: list[JsonBlock]) -> tuple[dict[str, Any], dict[str, Any]]:
    root_keys = Counter()
    pt_keys = Counter()
    pd_keys = Counter()
    rect_keys = Counter()
    pt_type_counts: dict[str, Counter] = defaultdict(Counter)
    pd_type_counts: dict[str, Counter] = defaultdict(Counter)
    rect_type_counts: dict[str, Counter] = defaultdict(Counter)

    targets = Counter()
    layers = Counter()
    color_indices = Counter()
    drawable_types = Counter()
    bypass = Counter()
    dont_include = Counter()
    pt_counts = Counter()
    pd_counts = Counter()
    invalid_blocks = []
    empty_packed = []

    all_pts: list[dict[str, Any]] = []
    all_pds: list[dict[str, Any]] = []
    all_rects: list[dict[str, Any]] = []

    for b in texture_blocks:
        if b.error or not isinstance(b.json_obj, dict):
            invalid_blocks.append({"path": b.path, "error": b.error or "root is not object"})
            continue
        root_keys.update(b.json_obj.keys())
        pts = b.json_obj.get("PackedTextures")
        if not isinstance(pts, list):
            invalid_blocks.append({"path": b.path, "error": "missing/non-array PackedTextures"})
            continue
        if not pts:
            empty_packed.append(b.path)
        pt_counts[len(pts)] += 1
        for pt in pts:
            if not isinstance(pt, dict):
                continue
            all_pts.append(pt)
            pt_keys.update(pt.keys())
            for k, v in pt.items():
                pt_type_counts[k][type_name(v)] += 1
            if isinstance(pt.get("Layer"), int):
                layers[pt["Layer"]] += 1
            if isinstance(pt.get("Targets"), list):
                for target in pt["Targets"]:
                    targets[str(target)] += 1
            if "DontIncludeVanillaLayers" in pt:
                dont_include[str(pt.get("DontIncludeVanillaLayers"))] += 1

            pds = pt.get("PackedDrawables")
            if isinstance(pds, list):
                pd_counts[len(pds)] += 1
                for pd in pds:
                    if not isinstance(pd, dict):
                        continue
                    all_pds.append(pd)
                    pd_keys.update(pd.keys())
                    for k, v in pd.items():
                        pd_type_counts[k][type_name(v)] += 1
                    if isinstance(pd.get("ColorIndex"), int):
                        color_indices[pd["ColorIndex"]] += 1
                    if isinstance(pd.get("DrawableType"), int):
                        drawable_types[pd["DrawableType"]] += 1
                    if "BypassColorScaler" in pd:
                        bypass[str(pd.get("BypassColorScaler"))] += 1
                    rect = pd.get("RectInt")
                    if isinstance(rect, dict):
                        all_rects.append(rect)
                        rect_keys.update(rect.keys())
                        for k, v in rect.items():
                            rect_type_counts[k][type_name(v)] += 1

    # Tolerant schema: core old+new fields required; version-dependent fields optional.
    schema = {
        "$schema": "https://json-schema.org/draft/2020-12/schema",
        "title": "MDRG PackedTextures asset schema (inferred, tolerant)",
        "type": "object",
        "additionalProperties": True,
        "required": ["PackedTextures"],
        "properties": {
            "PackedTextures": {
                "type": "array",
                "items": {
                    "type": "object",
                    "additionalProperties": True,
                    "required": ["TextureName", "Layer", "PackedDrawables"],
                    "properties": {
                        "TextureName": {"type": "string", "minLength": 1},
                        "Layer": {"type": "integer"},
                        "PackedDrawables": {
                            "type": "array",
                            "items": {
                                "type": "object",
                                "additionalProperties": True,
                                "required": ["Name", "RectInt", "ColorIndex"],
                                "properties": {
                                    "Name": {"type": "string", "minLength": 1},
                                    "RectInt": {
                                        "type": "object",
                                        "additionalProperties": True,
                                        "required": ["x", "y", "width", "height"],
                                        "properties": {
                                            "x": {"type": "integer"},
                                            "y": {"type": "integer"},
                                            "width": {"type": "integer"},
                                            "height": {"type": "integer"},
                                        },
                                    },
                                    "ColorIndex": {"type": "integer"},
                                    "DrawableType": {"type": "integer"},
                                    "BypassColorScaler": {"type": "boolean"},
                                },
                            },
                        },
                        "Targets": {
                            "type": "array",
                            "items": {"type": "string"},
                            "description": "Observed values include doggy, missionary, interaction, blowjob, cowgirl. Kept open for older/future mods.",
                        },
                        "DontIncludeVanillaLayers": {"type": "boolean"},
                        "Texture": {
                            "type": "object",
                            "additionalProperties": True,
                            "description": "Observed in older mods as a Unity object reference. Do not require in new assets.",
                        },
                    },
                },
            }
        },
        "description": "Generated from dumps. Mods from older game versions may omit Targets/DrawableType/BypassColorScaler/DontIncludeVanillaLayers and may include Texture object refs.",
    }

    findings = {
        "block_count": len(texture_blocks),
        "invalid_blocks": invalid_blocks,
        "empty_packed_textures": empty_packed[:100],
        "root_keys": dict(root_keys),
        "packed_texture_keys": dict(pt_keys),
        "packed_drawable_keys": dict(pd_keys),
        "rect_int_keys": dict(rect_keys),
        "packed_texture_type_counts": {k: dict(v) for k, v in pt_type_counts.items()},
        "packed_drawable_type_counts": {k: dict(v) for k, v in pd_type_counts.items()},
        "rect_int_type_counts": {k: dict(v) for k, v in rect_type_counts.items()},
        "targets": dict(targets),
        "layers": dict(sorted(layers.items())),
        "color_indices": dict(sorted(color_indices.items())),
        "drawable_types": dict(sorted(drawable_types.items())),
        "bypass_color_scaler": dict(bypass),
        "dont_include_vanilla_layers": dict(dont_include),
        "packed_textures_per_file": dict(pt_counts),
        "packed_drawables_per_packed_texture": dict(pd_counts),
        "notes": [
            "Targets is absent in many older PackedTextures entries; treat absence as warning, not fatal.",
            "DrawableType and BypassColorScaler are absent in many older PackedDrawables entries; treat absence as warning unless current loader requires them.",
            "Texture object refs appear in older mods; keep schema additionalProperties=true.",
        ],
    }
    return schema, findings


def infer_mod_schema(mod_blocks: list[JsonBlock]) -> tuple[dict[str, Any], dict[str, Any]]:
    mods: list[dict[str, Any]] = []
    invalid = []
    for b in mod_blocks:
        if b.error or not isinstance(b.json_obj, dict):
            invalid.append({"path": b.path, "error": b.error or "root is not object"})
        else:
            mods.append(b.json_obj)

    root_stats = collect_field_stats(mods)
    on_stats = collect_field_stats(
        o.get("OnGameStart") for o in mods if isinstance(o.get("OnGameStart"), dict)
    )
    protected_stats = collect_field_stats(
        o.get("doNotChangeVariablesBelowThis")
        for o in mods
        if isinstance(o.get("doNotChangeVariablesBelowThis"), dict)
    )

    target_versions = Counter(str(o.get("targetVersion", "<missing>")) for o in mods)
    mod_versions = Counter(str(o.get("modVersion", "<missing>")) for o in mods)
    language_codes = Counter(str(o.get("languageCode", "<missing>")) for o in mods)
    lua_file_counts = Counter()
    lua_script_present = 0
    for o in mods:
        ogs = o.get("OnGameStart")
        if isinstance(ogs, dict):
            lf = ogs.get("luaFiles")
            if isinstance(lf, list):
                lua_file_counts[len(lf)] += 1
            if "luaScript" in ogs:
                lua_script_present += 1

    schema = {
        "$schema": "https://json-schema.org/draft/2020-12/schema",
        "title": "MDRG mod.json schema (inferred, tolerant)",
        "type": "object",
        "additionalProperties": True,
        "required": ["name", "description", "OnGameStart", "targetVersion", "doNotChangeVariablesBelowThis"],
        "properties": {
            "name": {"type": "string"},
            "description": {"type": "string"},
            "modVersion": {"type": "string"},
            "languageCode": {"type": "string"},
            "targetVersion": {"type": "string"},
            "OnGameStart": {
                "type": "object",
                "additionalProperties": True,
                "required": ["luaFiles"],
                "properties": {
                    "luaFiles": {"type": "array", "items": {"type": "string"}},
                    "luaScript": {
                        "type": "string",
                        "description": "Observed in many older mods, often empty. Keep optional.",
                    },
                },
            },
            "doNotChangeVariablesBelowThis": {
                "type": "object",
                "additionalProperties": True,
                "required": ["timeCreated", "guid"],
                "properties": {
                    "timeCreated": {"type": "integer"},
                    "guid": {
                        "type": "object",
                        "additionalProperties": True,
                        "required": ["serializedGuid"],
                        "properties": {
                            "serializedGuid": {
                                "type": "string",
                                "pattern": "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$",
                            }
                        },
                    },
                },
            },
        },
        "description": "Generated from mod_json_dump.txt. Kept tolerant because older mods exist in the corpus.",
    }

    findings = {
        "block_count": len(mod_blocks),
        "valid_mods": len(mods),
        "invalid_blocks": invalid,
        "root_stats": root_stats,
        "on_game_start_stats": on_stats,
        "protected_stats": protected_stats,
        "target_versions": dict(target_versions),
        "mod_versions": dict(mod_versions),
        "language_codes": dict(language_codes),
        "lua_file_counts": dict(lua_file_counts),
        "lua_script_present_count": lua_script_present,
        "notes": [
            "modVersion and languageCode were rare in the supplied dump; keep optional.",
            "OnGameStart.luaScript appeared in many older mods; keep optional and do not treat empty string as error.",
        ],
    }
    return schema, findings


def validate_assets(texture_blocks: list[JsonBlock], path_list_file: Path | None) -> dict[str, Any]:
    all_paths: set[str] = set()
    png_paths: set[str] = set()
    json_paths: set[str] = set()
    if path_list_file and path_list_file.exists():
        for line in read_text(path_list_file).splitlines():
            p = norm_path(line.strip().lstrip("\ufeff"))
            if not p:
                continue
            all_paths.add(p)
            suffix = PureWindowsPath(p).suffix.lower()
            if suffix == ".png":
                png_paths.add(p)
            elif suffix == ".json":
                json_paths.add(p)

    referenced_pngs: Counter[str] = Counter()
    missing_pngs: list[dict[str, str]] = []
    invalid_rects: list[dict[str, Any]] = []
    missing_targets: list[str] = []
    empty_arrays: list[dict[str, str]] = []
    path_warnings: list[str] = []

    for b in texture_blocks:
        if b.error or not isinstance(b.json_obj, dict):
            continue
        pts = b.json_obj.get("PackedTextures")
        if not isinstance(pts, list):
            continue
        if not pts:
            empty_arrays.append({"path": b.path, "field": "PackedTextures"})
        for i, pt in enumerate(pts):
            if not isinstance(pt, dict):
                continue
            tex = pt.get("TextureName")
            if isinstance(tex, str) and tex:
                ref = join_sibling(b.path, tex)
                referenced_pngs[ref] += 1
                if png_paths and ref not in png_paths:
                    # Path list may come from a broad dump and still be valid. Missing is actionable if path list includes PNGs.
                    missing_pngs.append({"asset_json": b.path, "texture_name": tex, "expected_png": ref})
            targets = pt.get("Targets")
            if "Targets" not in pt:
                missing_targets.append(f"{b.path}#PackedTextures[{i}]")
            elif isinstance(targets, list) and not targets:
                empty_arrays.append({"path": b.path, "field": f"PackedTextures[{i}].Targets"})
            pds = pt.get("PackedDrawables")
            if isinstance(pds, list):
                if not pds:
                    empty_arrays.append({"path": b.path, "field": f"PackedTextures[{i}].PackedDrawables"})
                for j, pd in enumerate(pds):
                    if not isinstance(pd, dict):
                        continue
                    rect = pd.get("RectInt")
                    if isinstance(rect, dict):
                        w, h = rect.get("width"), rect.get("height")
                        if isinstance(w, int) and isinstance(h, int) and (w <= 0 or h <= 0):
                            invalid_rects.append({"path": b.path, "pt": i, "drawable": j, "width": w, "height": h})

    orphan_pngs = []
    if png_paths:
        orphan_pngs = sorted(png_paths - set(referenced_pngs))[:500]

    return {
        "path_list_total": len(all_paths),
        "path_list_png_count": len(png_paths),
        "path_list_json_count": len(json_paths),
        "referenced_png_count": len(referenced_pngs),
        "missing_pngs": missing_pngs[:500],
        "missing_png_count": len(missing_pngs),
        "orphan_pngs_sample": orphan_pngs,
        "orphan_png_count": len(png_paths - set(referenced_pngs)) if png_paths else None,
        "invalid_rects": invalid_rects[:500],
        "invalid_rect_count": len(invalid_rects),
        "missing_targets_sample": missing_targets[:500],
        "missing_targets_count": len(missing_targets),
        "empty_arrays": empty_arrays[:500],
        "empty_arrays_count": len(empty_arrays),
        "notes": [
            "missing Targets is common in older mods; treat as warning unless current loader requires Targets.",
            "orphan PNGs are warnings, not fatal errors.",
            "png_asset_list.txt may contain non-PNG entries if generated by a broad file lister; this tool filters by extension.",
        ],
    }


def write_json(path: Path, data: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, indent=2, ensure_ascii=False, sort_keys=False), encoding="utf-8")


def top(counter: dict[str, int] | Counter, n: int = 20) -> list[tuple[Any, int]]:
    if isinstance(counter, Counter):
        return counter.most_common(n)
    return Counter(counter).most_common(n)


def write_summary(out: Path, mod_findings: dict[str, Any], tex_findings: dict[str, Any], validation: dict[str, Any]) -> None:
    lines: list[str] = []
    lines.append("# MDRG JSON Dump Summary")
    lines.append("")
    lines.append("## Inputs processed")
    lines.append(f"- mod.json blocks: {mod_findings.get('block_count', 0)}")
    lines.append(f"- valid mod.json blocks: {mod_findings.get('valid_mods', 0)}")
    lines.append(f"- PackedTextures JSON blocks: {tex_findings.get('block_count', 0)}")
    lines.append("")
    lines.append("## Important findings")
    lines.append("- The texture dump includes older mods; schema inference must be tolerant and version-aware.")
    lines.append("- `TextureName`, `Layer`, and `PackedDrawables` were present in every observed PackedTexture entry.")
    lines.append("- `Targets`, `DrawableType`, `BypassColorScaler`, and `DontIncludeVanillaLayers` are not universal in the dump; treat absence as warning unless the current loader requires them.")
    lines.append("- Some older PackedTexture entries contain a `Texture` object reference; keep `additionalProperties: true`.")
    lines.append("- `modVersion` and `languageCode` are rare in the mod dump; keep them optional.")
    lines.append("- `OnGameStart.luaScript` appears in many older mods, often as an empty string; keep optional.")
    lines.append("")
    lines.append("## mod.json versions")
    for version, count in sorted(mod_findings.get("target_versions", {}).items(), key=lambda x: (-x[1], x[0]))[:25]:
        lines.append(f"- `{version}`: {count}")
    lines.append("")
    lines.append("## Texture root/key stats")
    lines.append(f"- Root keys: `{tex_findings.get('root_keys', {})}`")
    lines.append(f"- PackedTexture keys: `{tex_findings.get('packed_texture_keys', {})}`")
    lines.append(f"- PackedDrawable keys: `{tex_findings.get('packed_drawable_keys', {})}`")
    lines.append(f"- RectInt keys: `{tex_findings.get('rect_int_keys', {})}`")
    lines.append("")
    lines.append("## Observed targets")
    for key, count in sorted(tex_findings.get("targets", {}).items(), key=lambda x: (-x[1], x[0])):
        lines.append(f"- `{key}`: {count}")
    lines.append("")
    lines.append("## Asset validation summary")
    lines.append(f"- Path list total entries: {validation.get('path_list_total')}")
    lines.append(f"- Path list PNG entries: {validation.get('path_list_png_count')}")
    lines.append(f"- Referenced PNG count: {validation.get('referenced_png_count')}")
    lines.append(f"- Missing referenced PNGs: {validation.get('missing_png_count')}")
    lines.append(f"- Orphan PNGs: {validation.get('orphan_png_count')}")
    lines.append(f"- Invalid RectInt dimensions: {validation.get('invalid_rect_count')}")
    lines.append(f"- Missing Targets warnings: {validation.get('missing_targets_count')}")
    lines.append(f"- Empty array warnings/errors: {validation.get('empty_arrays_count')}")
    lines.append("")
    lines.append("## Generated files")
    lines.append("- `assets.schema.json`: tolerant schema for PackedTextures JSON assets.")
    lines.append("- `mod.schema.json`: tolerant schema for mod.json files.")
    lines.append("- `texture_schema_findings.json`: field/key/value statistics for texture JSONs.")
    lines.append("- `mod_schema_findings.json`: field/key/value statistics for mod.json files.")
    lines.append("- `texture_asset_validation.md`: human-readable validation summary.")
    lines.append("")
    out.write_text("\n".join(lines), encoding="utf-8")


def write_validation_md(out: Path, validation: dict[str, Any]) -> None:
    lines = ["# MDRG Texture Asset Validation", ""]
    lines.append("## Summary")
    for k in [
        "path_list_total",
        "path_list_png_count",
        "path_list_json_count",
        "referenced_png_count",
        "missing_png_count",
        "orphan_png_count",
        "invalid_rect_count",
        "missing_targets_count",
        "empty_arrays_count",
    ]:
        lines.append(f"- {k}: {validation.get(k)}")
    lines.append("")
    lines.append("## Notes")
    for note in validation.get("notes", []):
        lines.append(f"- {note}")
    lines.append("")
    if validation.get("missing_pngs"):
        lines.append("## Missing referenced PNGs (sample)")
        for item in validation["missing_pngs"][:100]:
            lines.append(f"- `{item['asset_json']}` -> `{item['expected_png']}`")
        lines.append("")
    if validation.get("invalid_rects"):
        lines.append("## Invalid RectInt dimensions (sample)")
        for item in validation["invalid_rects"][:100]:
            lines.append(f"- `{item['path']}` pt={item['pt']} drawable={item['drawable']} width={item['width']} height={item['height']}")
        lines.append("")
    if validation.get("missing_targets_sample"):
        lines.append("## Missing Targets warnings (sample)")
        for item in validation["missing_targets_sample"][:100]:
            lines.append(f"- `{item}`")
        lines.append("")
    if validation.get("orphan_pngs_sample"):
        lines.append("## Orphan PNG warnings (sample)")
        for item in validation["orphan_pngs_sample"][:100]:
            lines.append(f"- `{item}`")
        lines.append("")
    out.write_text("\n".join(lines), encoding="utf-8")


def main() -> int:
    ap = argparse.ArgumentParser(description="Infer MDRG mod/asset schemas from dump txt files.")
    ap.add_argument("--input-dir", default=".", help="Directory containing *_dump.txt files")
    ap.add_argument("--output-dir", default="analysis_jsondump", help="Directory for generated schemas/reports")
    ap.add_argument("--mod-dump", default="mod_json_dump.txt")
    ap.add_argument("--texture-dump", default="texture_json_dump.txt")
    ap.add_argument("--path-list", default="png_asset_list.txt", help="Path list file; may contain more than PNGs")
    args = ap.parse_args()

    input_dir = Path(args.input_dir)
    out_dir = Path(args.output_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    mod_dump = input_dir / args.mod_dump
    texture_dump = input_dir / args.texture_dump
    path_list = input_dir / args.path_list

    if not mod_dump.exists():
        raise SystemExit(f"Missing mod dump: {mod_dump}")
    if not texture_dump.exists():
        raise SystemExit(f"Missing texture dump: {texture_dump}")

    mod_blocks = parse_dump_blocks(mod_dump)
    texture_blocks = parse_dump_blocks(texture_dump)

    mod_schema, mod_findings = infer_mod_schema(mod_blocks)
    tex_schema, tex_findings = infer_texture_schema(texture_blocks)
    validation = validate_assets(texture_blocks, path_list if path_list.exists() else None)

    write_json(out_dir / "mod.schema.json", mod_schema)
    write_json(out_dir / "assets.schema.json", tex_schema)
    write_json(out_dir / "mod_schema_findings.json", mod_findings)
    write_json(out_dir / "texture_schema_findings.json", tex_findings)
    write_json(out_dir / "texture_asset_validation.json", validation)
    write_summary(out_dir / "jsondump_summary.md", mod_findings, tex_findings, validation)
    write_validation_md(out_dir / "texture_asset_validation.md", validation)

    print(f"Processed {len(mod_blocks)} mod blocks and {len(texture_blocks)} texture blocks.")
    print(f"Wrote reports to: {out_dir}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

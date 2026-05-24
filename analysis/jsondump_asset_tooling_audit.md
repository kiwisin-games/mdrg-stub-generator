# JSON dump and asset tooling audit

## Tools

| Tool | Inputs | Outputs | Role |
|---|---|---|---|
| `tools/validate_realmod_assets.py` | `mod/realmod`, debug mod roots, packed texture JSONs | `analysis/packed_textures.schema.json`, `analysis/realmod_*` reports | strict/compat validation for real mod assets |
| `json/mdrg_jsondump_tools/process_mdrg_json_dumps.py` | large json dump research files | `json/mdrg_jsondump_tools/output/*` | research summarizer for mass dumps |

## Current decision

The tools stay separate for this pass. `validate_realmod_assets.py` is the
authoritative validator for mod/debug packed texture assets and supports:

- `--mode strict`: modern fields are required.
- `--mode compat`: legacy/missing `Targets`, `DrawableType`,
  `BypassColorScaler`, `DontIncludeVanillaLayers` become compatibility
  warnings, and legacy `Texture` can stand in for `TextureName`.

The jsondump processor remains a research tool. Its large input/output folders
are ignored and excluded from addon packaging.

## Divergence risks

- The research dump output can infer broader schemas than a real mod needs.
- The realmod validator checks local PNG paths; jsondump research may not have
  matching file layout.
- `analysis/packed_textures.schema.json` is the tracked schema output for the
  project; `json/mdrg_jsondump_tools/output/` is treated as local research
  output.

## Future refactor option

If schema logic grows further, create `tools/asset_schema.py` with strict and
compat schema constants plus shared validation helpers, then import it from both
tools. That refactor was intentionally deferred to avoid changing behavior while
the runtime/debug tooling is being finalized.

# MDRG JSON Dump Summary

## Inputs processed
- mod.json blocks: 203
- valid mod.json blocks: 203
- PackedTextures JSON blocks: 4051

## Important findings
- The texture dump includes older mods; schema inference must be tolerant and version-aware.
- `TextureName`, `Layer`, and `PackedDrawables` were present in every observed PackedTexture entry.
- `Targets`, `DrawableType`, `BypassColorScaler`, and `DontIncludeVanillaLayers` are not universal in the dump; treat absence as warning unless the current loader requires them.
- Some older PackedTexture entries contain a `Texture` object reference; keep `additionalProperties: true`.
- `modVersion` and `languageCode` are rare in the mod dump; keep them optional.
- `OnGameStart.luaScript` appears in many older mods, often as an empty string; keep optional.

## mod.json versions
- `0.86.3`: 45
- `0.85.69`: 32
- `0.90.15`: 27
- `0.87.11`: 24
- `0.87.8`: 12
- `0.90.13`: 11
- `0.90.16`: 9
- `0.90.8`: 8
- `0.86.0`: 7
- `0.90.7`: 7
- `0.90.6`: 5
- `0.80 beta`: 3
- `0.85.1`: 2
- `0.86.2`: 2
- `0.87.1`: 2
- `0.90.10`: 2
- `0.87.10`: 1
- `0.87.6`: 1
- `0.87.7`: 1
- `0.95.15`: 1
- `0.95.5`: 1

## Texture root/key stats
- Root keys: `{'PackedTextures': 4051}`
- PackedTexture keys: `{'TextureName': 7639, 'Layer': 7639, 'PackedDrawables': 7639, 'Targets': 5662, 'DontIncludeVanillaLayers': 1240, 'Texture': 1977}`
- PackedDrawable keys: `{'Name': 22832, 'RectInt': 22832, 'ColorIndex': 22832, 'DrawableType': 18840, 'BypassColorScaler': 18840}`
- RectInt keys: `{'x': 22832, 'y': 22832, 'width': 22832, 'height': 22832}`

## Observed targets
- `interaction`: 2070
- `missionary`: 1917
- `doggy`: 1876
- `cowgirl`: 1814
- `blowjob`: 1509

## Asset validation summary
- Path list total entries: 14059
- Path list PNG entries: 8605
- Referenced PNG count: 7473
- Missing referenced PNGs: 0
- Orphan PNGs: 1132
- Invalid RectInt dimensions: 0
- Missing Targets warnings: 1977
- Empty array warnings/errors: 2

## Generated files
- `assets.schema.json`: tolerant schema for PackedTextures JSON assets.
- `mod.schema.json`: tolerant schema for mod.json files.
- `texture_schema_findings.json`: field/key/value statistics for texture JSONs.
- `mod_schema_findings.json`: field/key/value statistics for mod.json files.
- `texture_asset_validation.md`: human-readable validation summary.

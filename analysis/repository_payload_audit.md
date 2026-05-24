# Repository payload audit

This audit separates distributable addon files from research inputs and local
runtime output. It intentionally does not delete or move files.

| Path | Size | Category | Recommendation |
|---|---:|---|---|
| `json/mdrg_jsondump_tools/all_mods_dump/texture_json_dump.txt` | ~11.6 MB | raw-research-input | keep local/ignored; do not package |
| `rawdump/` large C# dump files | >1 MB each | raw-research-input | keep local/ignored |
| `examples/mods_mixed.lua` | ~5.7 MB | raw-research-input | keep local/ignored; use curated indexes instead |
| `data/csharp_index.json` | ~2.0 MB | curated-index | track; needed for regeneration |
| `json/mdrg_jsondump_tools/all_mods_dump/png_asset_list.txt` | ~1.1 MB | raw-research-input | keep local/ignored |
| `mod/realmod/**/*.png` large assets | several >500 KB | debug-example/research-corpus | read-only; do not package addon |
| `documented_functions.md` | ~659 KB | source-of-truth | track; documentation input |
| `docs.txt` | ~419 KB | source-of-truth | track; authoritative API input |
| `probe/report-*.txt` | runtime sized | runtime-probe-output | ignore; summarize through tools when needed |

## Directory categories

| Directory | Category | Recommendation |
|---|---|---|
| `library/` | generated-stub | package |
| `config.json`, `info.json`, `README.md` | addon-core | package |
| `extern/` | source-of-truth | optional package/dev docs |
| `tools/` | tooling | track, do not package normal addon |
| `analysis/` | generated-report/manual-analysis | track selected reports, do not package |
| `probe/` | runtime-probe-output | ignore |
| `dump/`, `rawdump/` | raw-research-input | ignore |
| `luas/` | compact tracked research corpus | track, but exclude from package |
| `archive/`, `old/` | archive-prompt/history | do not package |
| `dist/` | generated-package-output | ignore |

## Proposed layout

Future cleanup can move research inputs under `research/`:

```text
research/json_dumps/
research/mods_mixed/
research/runtime_probes/
archive/prompts/
analysis/generated/
dist/
```

No move is performed by this audit. The packaging tool now excludes raw and
runtime output paths explicitly.

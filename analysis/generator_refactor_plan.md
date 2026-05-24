# Generator refactor plan

`tools/generate_luals_addon.py` remains the entrypoint. This pass documents the
split points and adds output hashing, without moving generation logic yet.

## Responsibilities

| Responsibility | Examples in current generator | Candidate module |
|---|---|---|
| paths/config | repo paths, output names, file groups | `tools/generator/paths.py` |
| models | parsed docs, methods, fields, enums | `tools/generator/models.py` |
| docs parsing | `docs.txt` parsing and member extraction | `tools/generator/docs_parser.py` |
| type normalization | C# to LuaLS type conversion | `tools/generator/type_normalization.py` |
| comments/docs | manual docs, documented functions, cleanup filters | `tools/generator/comments.py` |
| indexes | `data/*.json`, runtime probe, lua/unity usage | `tools/generator/indexes.py` |
| rendering | LuaCATS classes, fields, overloads, aliases | `tools/generator/render_luacats.py` |
| extern stubs | copy/validate `extern/*.d.lua` | `tools/generator/extern_stubs.py` |
| reports | analysis markdown/json reports | `tools/generator/reports.py` |

## Safe first extraction candidates

1. Path constants and generated file grouping.
2. Pure type normalization helpers.
3. External stub copy/validation helpers.
4. Markdown report rendering.

## Behavior protection

Use `tools/hash_generated_library.py` before and after refactors:

```powershell
python tools\hash_generated_library.py --output analysis\generator_output_snapshot_before.json
python tools\generate_luals_addon.py
python tools\hash_generated_library.py --output analysis\generator_output_snapshot_after.json
```

The expected result for a pure refactor is identical hashes for every
`library/*.d.lua`.

## Deferred

No logic was moved in this pass. The generator is large, and the current task
also changes runtime/debug tooling; keeping output stable is more important than
a broad refactor here.

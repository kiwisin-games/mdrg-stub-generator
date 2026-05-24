# Repository layout policy

| Path | Purpose | Tracked? | Packaged? | Notes |
|---|---|---:|---:|---|
| `library/` | LuaLS stubs | yes | yes | generated, do not edit manually |
| `extern/` | external plugin/bridge stubs | yes | optional | source for copied stubs such as safe IO |
| `data/` | curated indexes | yes | no | required for regeneration, not runtime addon |
| `tools/` | generation, validation and packaging tools | yes | no | development only |
| `docs.txt` | authoritative public API source | yes | no | regeneration input |
| `documented_functions.md` | reviewed comments | yes | no | regeneration input |
| `examples/test.lua` | small LuaLS smoke sample | yes | yes | safe to ship |
| `examples/callback_debug_mod_real/` | opt-in runtime debug mod | yes | no | development/test harness only |
| `examples/mods_mixed.lua` | large mixed mod research corpus | no | no | ignored; keep local |
| `luas/` | compact generated Lua research corpus | yes | no | tracked for usage/callback tooling; excluded from package |
| `probe/` | runtime reports and runtime tests | no | no | generated local evidence |
| `dump/`, `rawdump/` | raw C#/dnSpy/CPP2IL dumps | no | no | local rebuild input only |
| `mod/realmod/` | real mod corpus/assets | yes/read-only | no | never edit in tasks |
| `json/mdrg_jsondump_tools/all_mods_dump/` | large raw json dump | no | no | ignored research input |
| `analysis/` | reports, schemas and audits | mixed | no | generated reports should include provenance |
| `archive/`, `old/` | historical prompts/plans | optional | no | does not affect build |
| `dist/` | generated addon packages | no | no | ignored output |

## Decisions

- `luas/` is tracked as compact research corpus so usage/callback tools work without raw dumps. It is still excluded from package payload.
- `probe/` is generated runtime output and is ignored, including `runtime_test_*` folders.
- `json/mdrg_jsondump_tools/all_mods_dump/` is raw research input and is ignored.
- `TODO.md` remains historical context; `STATUS.md` is the current short status file.

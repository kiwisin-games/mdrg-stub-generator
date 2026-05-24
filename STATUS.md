# MDRG LuaLS Addon Status

This file records the current maintenance state after the callback/runtime debug
work.

## Current state

- `library/` remains the generated LuaLS addon output.
- `docs.txt` and `data/*.json` remain the regeneration sources.
- `extern/*.d.lua` contains tracked external bridge stubs copied into `library/`.
- `luas/` is tracked research corpus for callback/usage analysis, not package payload.
- `data/runtime_callback_evidence.json` stores reviewed runtime callback evidence, generated from local callback reports.
- `examples/callback_debug_mod_real/` is an opt-in runtime debug harness.
- `probe/` contains local runtime output and should not be packaged.
- `TODO.md` is retained as historical execution context for the v4 callback work.

## Normal checks

```powershell
python tools\dev.py check
python tools\validate_debug_mod_real.py --root examples\callback_debug_mod_real
python tools\sync_example_helpers.py --check
python tools\build_runtime_callback_evidence.py --root probe
```

## Packaging

```powershell
python tools\package_addon.py
```

Packaging validation should pass normally. The package excludes `luas/`,
`probe/`, debug mods, raw dumps, tools and analysis reports.

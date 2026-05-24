# TODO - Debug Callback/Lifetime MDRG

Status tracking for the callback/lifetime debug implementation.

## Phases

- [done] 1. TODO.md and base docs/analysis.
- [done] 2. Validate/analyze `mod/realmod` and asset schema.
- [done] 3. Improve `mdrg_env_probe.lua` and `probe_runtime_index.py`.
- [done] 4. Catalog callbacks.
- [done] 5. Create callback helper.
- [done] 6. Create opt-in real debug mod.
- [done] 7. Final validations and diff summary.

## Files To Create

- `analysis/runtime_context_notes.md`
- `analysis/lifecycle_event_clues.md`
- `analysis/debug_mod_real_plan.md`
- `analysis/packed_textures.schema.json`
- `analysis/realmod_structure.md`
- `analysis/realmod_asset_schema.md`
- `analysis/realmod_item_patterns.md`
- `analysis/realmod_asset_validation.md`
- `analysis/lua_callback_contexts.md`
- `analysis/callback_debug_cases.md`
- `analysis/debug_mod_real_asset_requirements.md`
- `tools/validate_realmod_assets.py`
- `tools/catalog_lua_callbacks.py`
- `tools/validate_debug_mod_real.py`
- `examples/mdrg_callback_context_probe.lua`
- `examples/callback_debug_mod_real/README.md`
- `examples/callback_debug_mod_real/mod.json`
- `examples/callback_debug_mod_real/script.lua`
- `examples/callback_debug_mod_real/mdrg_callback_context_probe.lua`

## Files To Modify

- `AGENTS.md`
- `SKILL.md`
- `examples/mdrg_env_probe.lua`
- `tools/probe_runtime_index.py`
- `analysis/mdrg_luadoc_comentarios_baseados_relatorios.md` (safety-check wording only)

## Guardrails

- Do not edit `mod/realmod/**`.
- Do not edit `library/*.d.lua` manually.
- Do not run the game.
- Do not change `data/*.json` unless explicitly regenerating indexes.
- Keep debug and callback flags disabled by default.
- Do not generate calls to dangerous APIs.

## Validation Commands

- `python -m py_compile tools\validate_realmod_assets.py tools\catalog_lua_callbacks.py tools\validate_debug_mod_real.py tools\probe_runtime_index.py`
- `python tools\validate_realmod_assets.py --root mod\realmod`
- `python tools\catalog_lua_callbacks.py`
- `python tools\validate_debug_mod_real.py --root examples\callback_debug_mod_real`
- `rg` safety checks from the implementation plan.

## Validation Results

- `python -m py_compile tools\validate_realmod_assets.py tools\catalog_lua_callbacks.py tools\validate_debug_mod_real.py tools\probe_runtime_index.py`: passed.
- `python tools\validate_realmod_assets.py --root mod\realmod`: passed with `asset_jsons=162`, `pngs=170`, `errors=0`, `warnings=0`.
- `python tools\catalog_lua_callbacks.py`: passed with `stub_entries=105`, `lua_sources=8`.
- `python tools\validate_debug_mod_real.py --root examples\callback_debug_mod_real`: passed with `lua_files=2`, `packed_texture_paths=1`, `errors=0`, `warnings=0`.
- Safety `rg` checks for lifecycle/probe/callback markers: passed.
- Safety `rg` check for forbidden call syntax returned no matches.

## Diff Notes

- `mod/realmod/script.lua` and deleted prompt/debug archive files were already present in the working tree status and were not edited as part of this implementation.
- No `library/*.d.lua` files were edited manually.
- No `data/*.json` files were regenerated or edited.

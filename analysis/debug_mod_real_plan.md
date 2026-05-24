# Debug Mod Real Plan

The debug mod will be created under `examples/callback_debug_mod_real/` and will be opt-in by default.

## Defaults

- `ENABLE_DEBUG_ITEMS = false`
- `ENABLE_CALLBACK_PROBE = false`
- `DEBUG_ADD_TO_SHOP = false`
- `DEBUG_SHOP_ID = "clothier"`

## Planned Cases

- Food nutrition callback item.
- Fish edible callback item.
- Cooking ingredient callback item.
- One clothing/module item using real packed texture assets.

## Asset Strategy

Use a minimal copied asset set from `mod/realmod`, with paths adjusted so `script.lua` only points to files present inside the debug mod. The preferred minimal asset source is `Piercing de anel no septo` because it has small JSON/PNG pairs.

## Safety

- Do not reuse the `mod/realmod` GUID.
- Do not edit `mod/realmod`.
- Do not register items unless both debug item flags are explicitly enabled.
- Do not call save, browser, UI-changing or destructive APIs.
- Do not call callbacks artificially; only wrap callbacks that the game later invokes.


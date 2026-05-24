# Lifecycle / Event Clues

This file records local evidence for Lua lifecycle hooks and callback boundaries.

## Confirmed From Local Files

- `mod.json` in `mod/realmod` uses `OnGameStart.luaFiles` with `script.lua`.
- `ItemPrefab.OnUse` and `ItemPrefab.OnUnpack` exist in `docs.txt` and generated stubs as callback fields.
- `ItemPrefab.SpecialEffectAction`, `RandomItemPostProcessing`, `ItemModiferAdditionFunction` and related callback fields exist in `docs.txt`.
- `EdibleItemPrefabData.CreateInstance(..., getNutritionProfile)` accepts a nutrition profile callback.
- `ModUtilities.StartCoroutine` accepts a MoonSharp closure and optional finish callback.
- Multiple story/UI/Fungus APIs accept `Action`/`Func` callbacks in `docs.txt`.

## Not Confirmed

- No direct Lua-level `OnSaveLoad` hook is confirmed from the current local files.
- No C# or MelonLoader bridge for a new Lua lifecycle event is part of this task.

## Debug Guidance

- Treat every Lua callback accepted by the MDRG API as a possible lifecycle boundary.
- OnGameStart-like context is suitable for registering callbacks, not for proving callback invocation context.
- LuaExec/Fungus reports are useful for scene/save inspection, but should not be treated as normal mod startup.
- Callback reports should record arguments and runtime context at invocation time.


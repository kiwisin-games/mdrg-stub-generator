# Runtime Context Notes

These notes describe observed MDRG/MoonSharp runtime contexts. They are evidence for debugging and documentation; they do not create API guarantees.

## Context Matrix

| Context | CurrentModGuid | GameVariables | gv | flowchart | Typical use |
|---|---:|---:|---:|---:|---|
| mod startup / OnGameStart-like | yes | usually no | no | no | register items, prefabs, shops and callbacks |
| mod startup + safe IO | yes | usually no | no | no | startup registration plus file reports through LuaPatch safe IO |
| LuaExec scene/Fungus | usually no | no | yes | yes | inspect live scene/save context through injected objects |
| callback: food nutrition filler | unknown | unknown | unknown | unknown | receives `item` and `nutritionProfile` at use/runtime |
| callback: item OnUse | unknown | unknown | unknown | unknown | receives runtime item/use context |
| callback: story condition/action | unknown | unknown | unknown | maybe | story/Fungus context, if invoked by story runtime |

## Interpretation Rules

- `CurrentModGuid` present usually means the script is running in a real mod context.
- `CurrentModGuid` missing with `gv` and `flowchart` present usually means LuaExec/Fungus/scene context.
- `GameVariables` missing during mod startup does not mean the API is absent; save context may not be loaded.
- `gv` is a legacy/internal alias for `GameVariables` when present.
- `flowchart` is a Fungus object injected in scene/internal contexts when present.
- Safe IO is plugin-provided bridge API and should not be treated as native MDRG.
- Presence of a callable does not mean it is safe to call.
- Absence in one lifetime does not prove absence in every lifetime.
- Callbacks should be probed by wrapping the callback itself, not by calling it manually.


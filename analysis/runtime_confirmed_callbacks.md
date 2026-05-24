# Runtime confirmed callbacks

Generated from `probe/runtime_test_*`.

## Confirmed

| Callback | Count | Contexts | Args | Notes |
|---|---:|---|---|---|
| `EdibleItemPrefabData.CreateInstance` | 28 | callback-invocation-with-safe-io (28) | item: userdata, nutritionProfile: userdata | Lua assignment/runtime invocation observed in callback report. |
| `EdibleItemPrefabData.CreateInstanceDish` | 52 | callback-invocation-with-safe-io (52) | item: userdata, nutritionProfile: userdata | Lua assignment/runtime invocation observed in callback report. |
| `ItemPrefab.OnUse` | 14 | callback-invocation-with-safe-io (14) | item: userdata | Lua assignment/runtime invocation observed in callback report. |
| `ItemPrefab.SetRandomItemPostProcessing` | 108 | callback-invocation-with-safe-io (108) | item: userdata | Lua assignment/runtime invocation observed in callback report. |
| `ItemPrefab.SpecialEffectAction` | 9 | callback-invocation-with-safe-io (9) | item: userdata, value: boolean | Lua assignment/runtime invocation observed in callback report. |
| `ItemScopeConditionCustom.CreateInstance` | 29 | callback-invocation-with-safe-io (29) | item: userdata | Lua assignment/runtime invocation observed in callback report. |
| `ModUtilities.AddSingleBuyItemToShop.availabilityFunc` | 75 | callback-invocation-with-safe-io (75) | arg1: nil | Lua assignment/runtime invocation observed in callback report. |
| `ModUtilities.StartCoroutine` | 2 | callback-invocation-with-safe-io (2) | arg1: nil | Lua assignment/runtime invocation observed in callback report. |
| `TextureOverriderManager.GetSpecialEffectsAction` | 8 | callback-invocation-with-safe-io (8) | item: userdata, value: boolean | Lua assignment/runtime invocation observed in callback report. |

## Registered but not triggered

| Callback | Reason |
|---|---|
| `ItemPrefab.TurnIntoPersonalityModule` | Wait for runtime callback report before applying stub notes. |
| `LuaPersonalityModuleDefinition.PrepareContainer` | Wait for runtime callback report before applying stub notes. |
| `ModUtilities.AddGenericItemToShop.availabilityFunc` | Wait for runtime callback report before applying stub notes. |
| `ModUtilities.PrepareNewPersonalityDefinition` | Wait for runtime callback report before applying stub notes. |
| `StoryBotDialogueBranch.__new` | Wait for runtime callback report before applying stub notes. |
| `StoryCondition.Delegate` | Wait for runtime callback report before applying stub notes. |
| `StoryCondition.Lua` | Wait for runtime callback report before applying stub notes. |

## Not assignable from plain Lua

| Callback | Reason |
|---|---|
| `ItemPrefab.OnUnpack` | Runtime field is System.Func<Item, Item[]>; MoonSharp cannot convert a plain Lua function/table return into CLR Item[] without a C# bridge. |

## Requires C# bridge

| Callback | Reason |
|---|---|
| `ItemPrefab.OnUnpack` | Runtime field is System.Func<Item, Item[]>; MoonSharp cannot convert a plain Lua function/table return into CLR Item[] without a C# bridge. |

## Manual/contextual

| Callback | Reason |
|---|---|
| `UiOverlay.*` | UI callbacks need explicit scene/UI interaction and should not be opened automatically. |

## Requires runtime instance

| Callback | Reason |
|---|---|
| _none_ | - |

## Dangerous/state-sensitive

| Callback | Reason |
|---|---|
| `ItemManager.*events` | Manager events require lifecycle ownership and unsubscribe policy before runtime use. |

## Unknown

| Callback | Reason |
|---|---|
| `ItemPrefab.SetCustomShader` | Requires asset/runtime context; no automatic stub change.; No shader asset is copied into this debug mod. |

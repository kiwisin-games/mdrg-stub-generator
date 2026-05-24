# Runtime Tests Summary

| Test | Reports | Contexts | Confirmed callbacks | Items | Errors |
|---|---:|---|---|---|---:|
| `runtime_test_001_debug_mod_real` | 325 | callback-invocation-with-safe-io | ItemPrefab.SetRandomItemPostProcessing, ModUtilities.AddSingleBuyItemToShop.availabilityFunc, EdibleItemPrefabData.CreateInstanceDish, ItemScopeConditionCustom.CreateInstance, EdibleItemPrefabData.CreateInstance, ItemPrefab.OnUse, ItemPrefab.SpecialEffectAction, TextureOverriderManager.GetSpecialEffectsAction, ModUtilities.StartCoroutine | callback probe FoodCookedDish, callback probe Fish, callback probe Clothing, callback probe ModulesPersonality, callback probe Food, callback probe AnonEquip, callback probe CookingIngredient, callback probe Soap, callback probe Modules, callback probe FishingTrash, callback probe Package, callback probe Other, callback probe Room, callback probe Usable, callback probe Meds | 100 |

## Runtime callback evidence

- Evidence callbacks: `20`
- Runtime-confirmed callbacks: `9`
- Stub-relevant findings: `17`

### Confirmed callbacks

- `EdibleItemPrefabData.CreateInstance`: 28 report context(s)
- `EdibleItemPrefabData.CreateInstanceDish`: 52 report context(s)
- `ItemPrefab.OnUse`: 14 report context(s)
- `ItemPrefab.SetRandomItemPostProcessing`: 108 report context(s)
- `ItemPrefab.SpecialEffectAction`: 9 report context(s)
- `ItemScopeConditionCustom.CreateInstance`: 29 report context(s)
- `ModUtilities.AddSingleBuyItemToShop.availabilityFunc`: 75 report context(s)
- `ModUtilities.StartCoroutine`: 2 report context(s)
- `TextureOverriderManager.GetSpecialEffectsAction`: 8 report context(s)

### Stub-relevant findings

- `EdibleItemPrefabData.CreateInstance`: `runtime-confirmed`
- `EdibleItemPrefabData.CreateInstanceDish`: `runtime-confirmed`
- `ItemPrefab.OnUnpack`: `not-assignable-from-plain-lua`
- `ItemPrefab.OnUse`: `runtime-confirmed`
- `ItemPrefab.SetRandomItemPostProcessing`: `runtime-confirmed`
- `ItemPrefab.SpecialEffectAction`: `runtime-confirmed`
- `ItemPrefab.TurnIntoPersonalityModule`: `registered-but-not-triggered`
- `ItemScopeConditionCustom.CreateInstance`: `runtime-confirmed`
- `LuaPersonalityModuleDefinition.PrepareContainer`: `registered-but-not-triggered`
- `ModUtilities.AddGenericItemToShop.availabilityFunc`: `registered-but-not-triggered`
- `ModUtilities.AddSingleBuyItemToShop.availabilityFunc`: `runtime-confirmed`
- `ModUtilities.PrepareNewPersonalityDefinition`: `registered-but-not-triggered`
- `ModUtilities.StartCoroutine`: `runtime-confirmed`
- `StoryBotDialogueBranch.__new`: `registered-but-not-triggered`
- `StoryCondition.Delegate`: `registered-but-not-triggered`
- `StoryCondition.Lua`: `registered-but-not-triggered`
- `TextureOverriderManager.GetSpecialEffectsAction`: `runtime-confirmed`

Detailed review files:
- `data/runtime_callback_evidence.json`
- `analysis/runtime_confirmed_callbacks.md`
- `analysis/runtime_stub_findings.md`
- `analysis/suggested_stub_updates.md`

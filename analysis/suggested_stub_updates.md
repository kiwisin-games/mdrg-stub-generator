# Suggested stub updates

Do not apply blindly. Review each suggestion manually.

## Safe documentation-only notes

### `EdibleItemPrefabData.CreateInstance`

Suggested note:
```lua
---Runtime-confirmed Lua callback in 28 report(s).
```

Evidence:
- Reports: 28
- Tests: probe/runtime_test_001_debug_mod_real

### `EdibleItemPrefabData.CreateInstanceDish`

Suggested note:
```lua
---Runtime-confirmed Lua callback in 52 report(s).
```

Evidence:
- Reports: 52
- Tests: probe/runtime_test_001_debug_mod_real

### `ItemPrefab.OnUse`

Suggested note:
```lua
---Runtime-confirmed Lua callback in 14 report(s).
```

Evidence:
- Reports: 14
- Tests: probe/runtime_test_001_debug_mod_real

### `ItemPrefab.SetRandomItemPostProcessing`

Suggested note:
```lua
---Runtime-confirmed Lua callback in 108 report(s).
```

Evidence:
- Reports: 108
- Tests: probe/runtime_test_001_debug_mod_real

### `ItemPrefab.SpecialEffectAction`

Suggested note:
```lua
---Runtime-confirmed Lua callback in 9 report(s).
```

Evidence:
- Reports: 9
- Tests: probe/runtime_test_001_debug_mod_real

### `ItemScopeConditionCustom.CreateInstance`

Suggested note:
```lua
---Runtime-confirmed Lua callback in 29 report(s).
```

Evidence:
- Reports: 29
- Tests: probe/runtime_test_001_debug_mod_real

### `ModUtilities.AddSingleBuyItemToShop.availabilityFunc`

Suggested note:
```lua
---Runtime-confirmed Lua callback in 75 report(s).
```

Evidence:
- Reports: 75
- Tests: probe/runtime_test_001_debug_mod_real

### `ModUtilities.StartCoroutine`

Suggested note:
```lua
---Runtime-confirmed Lua callback in 2 report(s).
```

Evidence:
- Reports: 2
- Tests: probe/runtime_test_001_debug_mod_real

### `TextureOverriderManager.GetSpecialEffectsAction`

Suggested note:
```lua
---Runtime-confirmed Lua callback in 8 report(s).
```

Evidence:
- Reports: 8
- Tests: probe/runtime_test_001_debug_mod_real

## Caution notes

### `ItemPrefab.OnUnpack`

Suggested note:
```lua
---Document as requiring a C# bridge or native helper before plain Lua assignment is recommended.
```

Evidence:
- Status: `not-assignable-from-plain-lua`
- Reports: 0
- Notes: Runtime field is System.Func<Item, Item[]>; MoonSharp cannot convert a plain Lua function/table return into CLR Item[] without a C# bridge.

## Possible type refinements

### `EdibleItemNutritionProfile`

Suggested:
- Consider documenting `Satiation` only if additional source evidence agrees.

Do not add without future reports:
- `Health` (error)
- `MentalHealth` (error)
- `Stamina` (error)

### `Item`

Suggested:
- Consider documenting `CanBeUnpacked` only if additional source evidence agrees.
- Consider documenting `CanBeUsed` only if additional source evidence agrees.
- Consider documenting `GetCount` only if additional source evidence agrees.
- Consider documenting `GetDescription` only if additional source evidence agrees.
- Consider documenting `GetItemPrefab` only if additional source evidence agrees.
- Consider documenting `GetName` only if additional source evidence agrees.
- Consider documenting `GetPrice` only if additional source evidence agrees.
- Consider documenting `IsEquipped` only if additional source evidence agrees.

### `nutritionProfile.Satiation`

Suggested:
- Consider documenting `Value` only if additional source evidence agrees.

Do not add without future reports:
- `MaxValue` (error)
- `MinValue` (error)


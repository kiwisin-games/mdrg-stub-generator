# mods_mixed.lua usage analysis

Source: `examples/mods_mixed.lua`
Generated: 2026-04-29 00:10:16

Original file was not modified. This report scans a sanitized in-memory copy where string and comment bodies are hidden, so it keeps API shapes without copying mod dialogue/content.

## Summary

- Lines scanned: 105105
- Script sections detected: 537
- Generated API variables inferred: 1293
- Unique API/member calls after type inference: 88
- ItemPrefab factory variables detected: 62
- Function definitions inside mixed mods: 360 total, 77 unique names
- Field gaps against current typed stubs: 0

## Most Common API/Member Calls

| API | Count | Style | Evidence lines |
|---|---:|---|---|
| `ModUtilities.GetPackedTexture` | 7676 | .:7676 | 187, 191, 215, 219, 243 |
| `ItemPrefab.AddTexture` | 7676 | .:7676 | 189, 193, 217, 221, 245 |
| `ColorSlot.CreateInstance` | 4218 | .:4218 | 150, 181, 209, 237, 265 |
| `ColorPaletteManager.GetColorPaletteByName` | 4195 | .:4195 | 150, 181, 209, 237, 265 |
| `StoryBotDialogueBranch.__new` | 3199 | .:3199 | 31, 32, 33, 34, 35 |
| `LuaPersonalityModuleDefinition.PrepareContainer` | 3175 | .:3175 | 31, 32, 33, 34, 35 |
| `ModUtilities.CreateNewItemAutoAssignId` | 2842 | .:2842 | 26, 159, 195, 223, 251 |
| `ModUtilities.CreateItemPrefab` | 2837 | .:2837 | 8, 139, 170, 198, 226 |
| `ModUtilities.GetController` | 2240 | .:2240 | 910, 916, 921, 958, 962 |
| `ModUtilities.AddSingleBuyItemToShop` | 1392 | .:1392 | 27, 160, 346, 706, 765 |
| `ModUtilities.GetSpriteReference` | 1038 | .:1038 | 1518, 1549, 2808, 4019, 5598 |
| `TextureOverriderManager.RoomManager.SetSprite` | 1013 | .:1013 | 133, 1497, 1527, 2787, 3998 |
| `coroutine.yield` | 895 | .:895 | 22708, 22718, 22725, 22732, 39306 |
| `ModUtilities.WaitForSeconds` | 893 | .:893 | 22708, 22718, 22725, 22732, 77091 |
| `Item.GetUniqueGuid` | 893 | .:893 | 77089, 77092, 77095, 77098, 77101 |
| `SusModifier.CreateInstance` | 869 | .:869 | 741, 741, 741, 741, 788 |
| `SlotEquipData.CreateInstance` | 266 | .:266 | 726, 773, 822, 2430, 2491 |
| `Item.IsEquipped` | 144 | .:144 | 132, 1496, 1526, 2786, 3997 |
| `TextureOverriderManager.RoomManager.RestoreSprite` | 138 | .:138 | 135, 1499, 1529, 2789, 4000 |
| `ItemPrefab.MakeSet` | 130 | .:130 | 344, 1361, 1746, 2251, 5043 |
| `UiOverlay.OkPopup` | 116 | .:116 | 2828, 2843, 2858, 2873, 2888 |
| `ModUtilities.AddGenericItemToShop` | 97 | .:97 | 376, 405, 2833, 2848, 2863 |
| `ItemPrefab.MakePair` | 89 | .:89 | 15304, 15386, 15468, 15542, 15624 |
| `ColorPaletteEntry.CreateInstanceFromString` | 89 | .:89 | 30521, 30521, 32781, 32782, 32783 |
| `ModUtilities.GetSprite` | 62 | .:62 | 5852, 5853, 6998, 10668, 10669 |
| `ModUtilities.PrepareNewPersonalityDefinition` | 55 | .:55 | 30, 1982, 2054, 2125, 2197 |
| `ItemPrefab.TurnIntoPersonalityModule` | 55 | .:55 | 121, 2029, 2101, 2172, 2244 |
| `StoryCondition.Delegate` | 46 | .:46 | 18506, 18508, 18511, 18519, 18520 |
| `TextureOverriderManager.RoomManager.GetSpecialEffectsAction` | 32 | .:32 | 28615, 28639, 28663, 28687, 28711 |
| `Item.GetCount` | 26 | .:26 | 2828, 2843, 2858, 2873, 2888 |
| `ColorPalette.CreateInstance` | 23 | .:23 | 30521, 30521, 32780, 32786, 32790 |
| `SlotEquipData.SetRequiredSlotsString` | 22 | .:22 | 729, 776, 825, 5326, 16547 |
| `math.random` | 20 | .:20 | 3384, 3385, 3388, 3428, 3429 |
| `SlotEquipData.SetForbiddenSlotsString` | 18 | .:18 | 730, 777, 826, 5327, 16548 |
| `GameId.CreateVanilla` | 17 | .:17 | 11809, 11810, 11811, 11812, 11813 |
| `ModUtilities.StartCoroutine` | 15 | .:15 | 22736, 40434, 40446, 77845, 78016 |
| `UiOverlay.CloseUiOverlay` | 14 | .:14 | 2827, 2842, 2857, 2872, 2887 |
| `ModUtilities.GetInteractController` | 14 | .:14 | 14450, 14481, 17439, 34849, 39954 |
| `ModUtilities.GetMissionaryController` | 14 | .:14 | 14454, 14485, 17443, 34853, 39958 |
| `ModUtilities.GetDoggyController` | 14 | .:14 | 14458, 14489, 17447, 34857, 39962 |
| `ModUtilities.StopCoroutine` | 12 | .:12 | 77849, 78020, 78941, 79073, 82537 |
| `math.floor` | 11 | .:11 | 2905, 2906, 2925, 2926, 39270 |
| `Item.SetColorIntoAdditionalData` | 9 | .:9 | 39277, 39280, 39299, 78778, 78781 |
| `ItemPrefab.ColorSlotId` | 9 | .:9 | 39277, 39280, 39292, 78778, 78781 |
| `FishItemPrefabData.CreateInstance` | 8 | .:8 | 78091, 78126, 78169, 78212, 78261 |

## Documentation Candidates

These are repeated patterns that look useful for hover docs. They should still be checked against `dump/` before going into the generator.

| API | Uses | Candidate note |
|---|---:|---|
| `GameUtilities.WaitForSecondsYield` | 3 | Produces a coroutine yield object for delaying Lua coroutine execution. |
| `Item.GetCount` | 26 | Returns the stack count for the runtime Item passed to OnUse-style callbacks. |
| `Item.GetUniqueGuid` | 893 | Returns the unique Guid for a runtime Item instance, used to scope sprite overrides. |
| `Item.GetMainColorFromAdditionalData` | 6 | Reads the runtime Item main color stored in additional data. |
| `Item.IsEquipped` | 144 | Checks whether the runtime Item passed to a callback is currently equipped. |
| `Item.SetColorIntoAdditionalData` | 9 | Writes a color into a runtime Item additional-data color slot. |
| `ItemPrefab.AddTexture` | 7676 | Attaches a packed texture to an item prefab for a scene/sprite slot. |
| `ItemPrefab.TurnIntoPersonalityModule` | 55 | Marks a registered item prefab as a personality module backed by a LuaPersonalityModuleDefinition. |
| `Live2DControllerSingleton.LuaInstance.UpdateAllTextures` | 3 | Forces Live2D texture refresh after script-side texture/color changes. |
| `LuaPersonalityModuleDefinition.PrepareContainer` | 3175 | Gets or creates a dialogue container keyed by a game dialogue/event id. |
| `ModUtilities.AddSingleBuyItemToShop` | 1392 | Adds a registered item GameId to a shop table using a shop identifier string. |
| `ModUtilities.CreateItemPrefab` | 2837 | Creates an ItemPrefab object that scripts configure by assigning fields before registering it. |
| `ModUtilities.CreateNewItemAutoAssignId` | 2842 | Registers an ItemPrefab for the current mod and returns a GameId used by shop/lookup calls. |
| `ModUtilities.GetAsSprite` | 7 | Loads a mod asset as a Sprite, commonly for UI icons or room overlays. |
| `ModUtilities.GetPackedTexture` | 7676 | Loads a packed texture asset from the current mod package by path. |
| `ModUtilities.PrepareNewPersonalityDefinition` | 55 | Creates a personality module definition; scripts add dialogue branches, then attach it to an item prefab. |
| `ModUtilities.StartCoroutine` | 15 | Starts a Lua/MoonSharp closure as a coroutine through the mod runtime. |
| `ModUtilities.StopCoroutine` | 12 | Stops a coroutine previously started through the mod runtime. |
| `ModUtilities.WaitForSeconds` | 893 | Produces a coroutine wait object used with coroutine.yield in older scripts. |
| `StoryBotDialogueBranch.__new` | 3199 | Constructs a dialogue branch from dialogue text, current mod guid, and a numeric branch id. |
| `TextureOverriderManager.RoomManager.GetSpecialEffectsAction` | 32 | Builds a SpecialEffectAction-style callback for swapping a target sprite when an item is active. |
| `TextureOverriderManager.RoomManager.RestoreSprite` | 138 | Restores a named room sprite previously overridden by a mod. |
| `TextureOverriderManager.RoomManager.SetSprite` | 1013 | Overrides a named room sprite with a Sprite loaded by the mod. |
| `UiOverlay.CloseUiOverlay` | 14 | Closes the currently open UI overlay if one is active. |
| `UiOverlay.OkPopup` | 116 | Shows a simple modal popup with title/message text. |

## ItemPrefab Field Usage

Fields assigned on variables inferred from `ModUtilities.CreateItemPrefab()`.

| Field | Count | Known in stubs | Compact values |
|---|---:|---|---|
| `Name` | 2840 | yes |  |
| `Description` | 2840 | yes |  |
| `Price` | 2840 | yes | `31250` (618); `10000` (281); `400` (153); `1000` (143) |
| `ColorSlots` | 2656 | yes | `{ColorSlot.CreateInstance('Main color', ColorPaletteManager.GetColorPaletteBy...` (864); `{ColorSlot.CreateInstance('Main Color', ColorPaletteManager.GetColorPaletteBy...` (608); `{}` (226); `{ColorSlot.CreateInstance('main', ColorPaletteManager.GetColorPaletteByName('...` (201) |
| `IsStackable` | 2617 | yes | `false` (2515); `true` (98); `isStackable` (4) |
| `Category` | 2605 | yes | `ItemCategory.Modules` (1409); `ItemCategory.Clothing` (832); `ItemCategory.Room` (178); `ItemCategory.Other` (83) |
| `CanChangeColor` | 2532 | yes | `true` (2138); `false` (391); `canChangeColor` (3) |
| `IsIllegal` | 2526 | yes | `false` (2195); `true` (328); `isIllegal` (3) |
| `HasQuality` | 2526 | yes | `false` (2508); `true` (18) |
| `ScratchType` | 2526 | yes | `ScratchTextureType.Universal` (2378); `ScratchTextureType.Hard` (148) |
| `SusModifiers` | 2523 | yes | `{}` (1780); `{SusModifier.CreateInstance(SusArea.Skin, 0.5)}` (206); `{SusModifier.CreateInstance(SusArea.UpperBody, 0.8)}` (108); `{SusModifier.CreateInstance(SusArea.LegL, 1)}` (87) |
| `PossibleEquipmentSlots` | 2242 | yes | `{'HairMain'}` (104); `{'Back hair'}` (88); `{'Hair behind ears'}` (88); `{'hairclip'}` (82) |
| `Partners` | 1765 | yes | `{}` (1744); `{'Diabete'}` (8); `{'Luxe'}` (3); `{'Stilou'}` (2) |
| `RequiredSlots` | 1488 | yes | `{}` (1370); `{'ArmL', 'ArmR'}` (35); `{'NeckAccessory'}` (28); `{'LegL'}` (10) |
| `OverrideIcon` | 565 | yes | `iconheadwings` (112); `iconhairaccs` (72); `iconears` (46); `iconbackhair` (44) |
| `ThrowingOutForbidden` | 284 | yes | `false` (282); `true` (2) |
| `SlotData` | 266 | yes |  |
| `SpecialEffectAction` | 176 | yes | `function(value, item) seAction(value, item) end` (32); `Changeplush` (25); `catSpecialEffect` (9); `Changerug` (8) |
| `ControllerElementOverrides` | 147 | yes |  |
| `OnUse` | 98 | yes | `OnUse` (94); `Sawcondeeznuts()` (1); `Estus_Flask()` (1); `Trade_Offer()` (1) |
| `IsPersonalityModule` | 55 | yes | `true` (55) |
| `FishData` | 8 | yes |  |
| `EdibleData` | 7 | yes |  |
| `ItemModifiableVariables` | 3 | yes |  |
| `AllowedModifiersData` | 1 | yes |  |
| `FishingRodItemPrefabData` | 1 | yes |  |
| `ItemModifiableVariablesRequirements` | 1 | yes |  |

## Field Gaps

No missing generated fields were found for objects whose type could be inferred.

## Dot vs Colon Evidence

All frequent generated-API calls in this sample use dot syntax. This is evidence for static-style declarations when the C# dump agrees.

| API | Dot calls | Colon calls | Evidence lines |
|---|---:|---:|---|
| `ModUtilities.GetPackedTexture` | 7676 | 0 | 187, 191, 215, 219, 243 |
| `ItemPrefab.AddTexture` | 7676 | 0 | 189, 193, 217, 221, 245 |
| `LuaPersonalityModuleDefinition.PrepareContainer` | 3175 | 0 | 31, 32, 33, 34, 35 |
| `ModUtilities.CreateNewItemAutoAssignId` | 2842 | 0 | 26, 159, 195, 223, 251 |
| `ModUtilities.CreateItemPrefab` | 2837 | 0 | 8, 139, 170, 198, 226 |
| `ModUtilities.GetController` | 2240 | 0 | 910, 916, 921, 958, 962 |
| `ModUtilities.AddSingleBuyItemToShop` | 1392 | 0 | 27, 160, 346, 706, 765 |
| `ModUtilities.GetSpriteReference` | 1038 | 0 | 1518, 1549, 2808, 4019, 5598 |
| `TextureOverriderManager.RoomManager.SetSprite` | 1013 | 0 | 133, 1497, 1527, 2787, 3998 |
| `ModUtilities.WaitForSeconds` | 893 | 0 | 22708, 22718, 22725, 22732, 77091 |
| `Item.GetUniqueGuid` | 893 | 0 | 77089, 77092, 77095, 77098, 77101 |
| `Item.IsEquipped` | 144 | 0 | 132, 1496, 1526, 2786, 3997 |
| `TextureOverriderManager.RoomManager.RestoreSprite` | 138 | 0 | 135, 1499, 1529, 2789, 4000 |
| `ItemPrefab.MakeSet` | 130 | 0 | 344, 1361, 1746, 2251, 5043 |
| `ModUtilities.AddGenericItemToShop` | 97 | 0 | 376, 405, 2833, 2848, 2863 |
| `ItemPrefab.MakePair` | 89 | 0 | 15304, 15386, 15468, 15542, 15624 |
| `ModUtilities.GetSprite` | 62 | 0 | 5852, 5853, 6998, 10668, 10669 |
| `ModUtilities.PrepareNewPersonalityDefinition` | 55 | 0 | 30, 1982, 2054, 2125, 2197 |
| `ItemPrefab.TurnIntoPersonalityModule` | 55 | 0 | 121, 2029, 2101, 2172, 2244 |
| `TextureOverriderManager.RoomManager.GetSpecialEffectsAction` | 32 | 0 | 28615, 28639, 28663, 28687, 28711 |
| `Item.GetCount` | 26 | 0 | 2828, 2843, 2858, 2873, 2888 |
| `ModUtilities.StartCoroutine` | 15 | 0 | 22736, 40434, 40446, 77845, 78016 |
| `ModUtilities.GetInteractController` | 14 | 0 | 14450, 14481, 17439, 34849, 39954 |
| `ModUtilities.GetMissionaryController` | 14 | 0 | 14454, 14485, 17443, 34853, 39958 |
| `ModUtilities.GetDoggyController` | 14 | 0 | 14458, 14489, 17447, 34857, 39962 |
| `ModUtilities.StopCoroutine` | 12 | 0 | 77849, 78020, 78941, 79073, 82537 |
| `Item.SetColorIntoAdditionalData` | 9 | 0 | 39277, 39280, 39299, 78778, 78781 |
| `ItemPrefab.ColorSlotId` | 9 | 0 | 39277, 39280, 39292, 78778, 78781 |
| `ModUtilities.GetAsSprite` | 7 | 0 | 155, 17255, 17292, 62310, 62436 |
| `Item.GetMainColorFromAdditionalData` | 6 | 0 | 39275, 39289, 78776, 78790, 92397 |
| `transform.GetChild` | 0 | 1 | 40322 |
| `modelObject.GetComponent` | 0 | 1 | 40341 |

## Callback Evidence

| Assignment | Count | Evidence lines |
|---|---:|---|
| `ItemPrefab.OnUse -> OnUse` | 94 | 374, 403, 2831, 2846, 2861 |
| `ItemPrefab.SpecialEffectAction -> function` | 32 | 28616, 28640, 28664, 28688, 28712 |
| `ItemPrefab.SpecialEffectAction -> Changeplush` | 25 | 4017, 27101, 27131, 27162, 27192 |
| `ItemPrefab.SpecialEffectAction -> catSpecialEffect` | 9 | 77893, 82581, 83516, 84195, 85172 |
| `ItemPrefab.SpecialEffectAction -> Changerug` | 8 | 2806, 45855, 46213, 47483, 63046 |
| `ItemPrefab.SpecialEffectAction -> Changedoor` | 8 | 9571, 44977, 46040, 47655, 57177 |
| `ItemPrefab.SpecialEffectAction -> Changedesk` | 8 | 12129, 46004, 47693, 50778, 54841 |
| `ItemPrefab.SpecialEffectAction -> ChangeBack` | 8 | 40550, 45892, 47270, 49337, 99629 |
| `ItemPrefab.SpecialEffectAction -> Changewindow` | 8 | 45819, 46499, 47342, 69203, 99665 |
| `ItemPrefab.SpecialEffectAction -> ChangeTV` | 7 | 1516, 45752, 47378, 67393, 99701 |
| `ItemPrefab.SpecialEffectAction -> ChangeTVlight` | 7 | 1547, 45783, 47409, 67424, 99732 |
| `ItemPrefab.SpecialEffectAction -> ChangePC` | 7 | 5596, 46079, 47559, 59462, 100109 |
| `ItemPrefab.SpecialEffectAction -> ChangePCrgb` | 7 | 5658, 46141, 47621, 59524, 100140 |
| `ItemPrefab.SpecialEffectAction -> Changecupboard` | 7 | 14416, 43775, 45966, 47729, 50867 |
| `ItemPrefab.SpecialEffectAction -> Changesofa` | 7 | 17214, 45928, 47232, 47445, 100212 |
| `ItemPrefab.SpecialEffectAction -> Changebed` | 7 | 45716, 47306, 48051, 86583, 100322 |
| `ItemPrefab.SpecialEffectAction -> ChangePClight` | 6 | 5627, 46110, 47590, 59493, 100605 |
| `ItemPrefab.SpecialEffectAction -> Changebat` | 3 | 153, 88369, 100359 |
| `ItemPrefab.SpecialEffectAction -> ChangeLightMultiply` | 2 | 17253, 62308 |
| `ItemPrefab.SpecialEffectAction -> ChangeMorningLight` | 2 | 17290, 62434 |
| `ItemPrefab.SpecialEffectAction -> UpdateMoon` | 2 | 39341, 92463 |
| `ItemPrefab.SpecialEffectAction -> ChangewindowLight` | 1 | 47196 |
| `ItemPrefab.SpecialEffectAction -> EHCP` | 1 | 78045 |
| `ItemPrefab.OnUse -> Sawcondeeznuts` | 1 | 78487 |
| `ItemPrefab.OnUse -> Estus_Flask` | 1 | 78524 |
| `ItemPrefab.OnUse -> Trade_Offer` | 1 | 78559 |
| `ItemPrefab.SpecialEffectAction -> EHCCum` | 1 | 78842 |
| `ItemPrefab.SpecialEffectAction -> EHCH` | 1 | 78966 |
| `ItemPrefab.SpecialEffectAction -> EHCE` | 1 | 79098 |
| `ItemPrefab.OnUse -> OnUseLucky` | 1 | 81430 |
| `ItemPrefab.SpecialEffectAction -> RSChangesofa1` | 1 | 82650 |

## Legacy/Nested Runtime Calls

These are seen in old mixed scripts or through singleton fields. Verify exact current support in `dump/` before documenting as first-class API.

| Raw call | Count | Evidence lines | Note |
|---|---:|---|---|
| `TextureOverriderManager.RoomManager.SetSprite` | 1013 | 133, 1497, 1527, 2787, 3998 | Overrides a named room sprite with a Sprite loaded by the mod. |
| `TextureOverriderManager.RoomManager.RestoreSprite` | 138 | 135, 1499, 1529, 2789, 4000 | Restores a named room sprite previously overridden by a mod. |
| `UiOverlay.OkPopup` | 116 | 2828, 2843, 2858, 2873, 2888 | Shows a simple modal popup with title/message text. |
| `TextureOverriderManager.RoomManager.GetSpecialEffectsAction` | 32 | 28615, 28639, 28663, 28687, 28711 | Builds a SpecialEffectAction-style callback for swapping a target sprite when an item is active. |
| `UiOverlay.CloseUiOverlay` | 14 | 2827, 2842, 2857, 2872, 2887 | Closes the currently open UI overlay if one is active. |
| `fungus.luaenvironment.RunLuaFunction` | 3 | 39284, 78785, 92406 | old-script or nested runtime access; confirm in dump |
| `Live2DControllerSingleton.LuaInstance.UpdateAllTextures` | 3 | 39303, 78813, 92425 | Forces Live2D texture refresh after script-side texture/color changes. |

## Unmatched API-Like Calls

This list excludes Lua built-ins and common lowercase locals. Some entries may still be old APIs, chained return values, or scope artifacts.

| Call | Count | Evidence lines |
|---|---:|---|
| `Item.SetColorIntoAdditionalData` | 9 | 39277, 39280, 39299, 78778, 78781 |
| `ItemPrefab.ColorSlotId` | 9 | 39277, 39280, 39292, 78778, 78781 |
| `Item.GetMainColorFromAdditionalData` | 6 | 39275, 39289, 78776, 78790, 92397 |
| `fungus.luaenvironment.RunLuaFunction` | 3 | 39284, 78785, 92406 |

## Frequent Script-Defined Functions

These names are defined inside mods and are useful mainly for recognizing callback patterns.

| Function | Count |
|---|---:|
| `OnUse` | 97 |
| `Changeplush` | 25 |
| `Available` | 19 |
| `Coroutine` | 12 |
| `catSpecialEffect` | 9 |
| `Changerug` | 8 |
| `Changedoor` | 8 |
| `Changedesk` | 8 |
| `ChangeBack` | 8 |
| `Changewindow` | 8 |
| `ChangeTV` | 7 |
| `ChangeTVlight` | 7 |
| `ChangePC` | 7 |
| `ChangePCrgb` | 7 |
| `Changecupboard` | 7 |
| `Changesofa` | 7 |
| `Changebed` | 7 |
| `ChangePClight` | 6 |
| `CreateItem` | 4 |
| `Endurance` | 4 |
| `Changebat` | 3 |
| `createEyeItem` | 3 |
| `createItemPackage` | 3 |
| `computeLevel` | 3 |
| `Brunchly` | 2 |
| `Cigarette` | 2 |
| `Beer` | 2 |
| `Wine` | 2 |
| `Lubricant` | 2 |
| `Pill` | 2 |
| `SleepPill` | 2 |
| `Tea` | 2 |
| `Bread` | 2 |
| `Burger` | 2 |
| `Poison` | 2 |
| `SuperFood` | 2 |
| `SempillX` | 2 |
| `Vitalisen` | 2 |
| `FortuneCookie` | 2 |
| `LotteryTicket` | 2 |
| `SexyPhotosOfLandlord` | 2 |
| `Kazy` | 2 |
| `ChangeLightMultiply` | 2 |
| `ChangeMorningLight` | 2 |
| `Grime` | 2 |
| `Treatables` | 2 |
| `Drippycheese` | 2 |
| `setcisu` | 2 |
| `addcisu` | 2 |
| `botskill` | 2 |
| `Aphrochocolate` | 2 |
| `Chocorepellent` | 2 |
| `UpdateMoon` | 2 |
| `OnUseDebug` | 2 |
| `buildClips` | 1 |
| `buildCategoryActions` | 1 |
| `startCummingSupervisor` | 1 |
| `supervisor` | 1 |
| `addBranch` | 1 |
| `simpleContainer` | 1 |
| `makeSimpleOffset` | 1 |
| `makeInteractionOffset` | 1 |
| `makeArmAttachOffset` | 1 |
| `findChildByName` | 1 |
| `Vector3` | 1 |
| `applyEnlargementToModel` | 1 |
| `applyBreastEnlargement` | 1 |
| `ChangewindowLight` | 1 |
| `EHCP` | 1 |
| `Sawcondeeznuts` | 1 |
| `Estus_Flask` | 1 |
| `Trade_Offer` | 1 |
| `EHCCum` | 1 |
| `EHCH` | 1 |
| `EHCE` | 1 |
| `OnUseLucky` | 1 |
| `RSChangesofa1` | 1 |

## Practical Takeaways

- The file is very useful as usage evidence for docs, especially item creation, texture registration, room sprite overrides, UI popups, coroutines, and personality modules.
- It should not be treated as authoritative by itself because it mixes old generated scripts and current scripts.
- The strongest next step is to verify the documentation candidates in `dump/`, then add only confirmed notes to `tools/generate_luals_addon.py`.
- The scan found no new missing ItemPrefab fields beyond what the current stubs already expose.

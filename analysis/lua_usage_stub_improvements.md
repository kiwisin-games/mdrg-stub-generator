# Lua usage stub improvements

Generated from `luas/*.lua` and `luas/*.md`.

## Input summary

- Lua files: 7 (`clothes.lua, dump.lua, foods.lua, modules.lua, new_modules.lua, personalities.lua, personalityDefinition.lua`)
- Markdown files: 6 (`clothes.md, foods.md, modules.md, personalities.md, personalityDefinition.md, script_lua_documentacao_util.md`)
- Paired markdown files: 5
- Guide-only markdown files: 1 (`script_lua_documentacao_util.md`)
- LuaDoc suggestion blocks found in markdown: 81

## Most frequent calls

- `ItemPrefab.AddTexture`: 472
- `ModUtilities.GetPackedTexture`: 472
- `ModUtilities.AddSingleBuyItemToShop`: 151
- `ModUtilities.CreateItemPrefab`: 151
- `ModUtilities.CreateNewItemAutoAssignId`: 151
- `SlotEquipData.CreateInstance`: 113
- `ColorPaletteManager.GetColorPaletteByName`: 102
- `ColorSlot.CreateInstance`: 102
- `LuaPersonalityModuleDefinition.PrepareContainer`: 49
- `StoryBotDialogueBranch.__new`: 49
- `StoryBotDialogueBranchContainer.AddBranch`: 49
- `EdibleItemPrefabData.CreateInstance`: 34
- `SimpleLocalizedString.CreateInstanceReplacement`: 30
- `SusModifier.CreateInstance`: 30
- `ItemModifiableVariableFactory.CreateInstanceFloatVariable`: 18
- `ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable`: 12
- `ItemScopeConditionSpecialVariable.CreateInstance`: 12
- `coroutine.yield`: 11
- `GameUtilities.WaitForSecondsYield`: 11
- `gv.CheckFlag`: 4
- `SlotEquipData.SetRequiredSlotsString`: 4
- `UiOverlay.OpenBrowser`: 4
- `AtLeastOneBoolVariableTrueRequirement.CreateInstance`: 3
- `browser.ChangeWebsite`: 3
- `browser.SelectEmail`: 2
- `GameId.CreateVanilla`: 2
- `newsDataManager.Force`: 2
- `SlotEquipData.SetForbiddenSlotsString`: 2
- `gv.BotCleanWithRagEffect`: 1
- `gv.CheckFlagAfterRelative`: 1

## Most frequent assigned fields

- `ItemPrefab.CanChangeColor`: 151
- `ItemPrefab.Category`: 151
- `ItemPrefab.ColorSlots`: 151
- `ItemPrefab.Description`: 151
- `ItemPrefab.HasQuality`: 151
- `ItemPrefab.IsIllegal`: 151
- `ItemPrefab.IsStackable`: 151
- `ItemPrefab.Name`: 151
- `ItemPrefab.Partners`: 151
- `ItemPrefab.Price`: 151
- `ItemPrefab.ScratchType`: 151
- `ItemPrefab.SusModifiers`: 151
- `ItemPrefab.ThrowingOutForbidden`: 151
- `ItemPrefab.SlotData`: 113
- `ItemPrefab.EdibleData`: 34
- `SlotEquipData.TargetSlotString`: 27
- `SlotEquipData.ControllerElementOverride`: 26
- `ItemPrefab.ItemModifiableVariables`: 18
- `ItemPrefab.SubCategory`: 13
- `ItemPrefab.IsPersonalityModule`: 10
- `ItemPrefab.ItemModifiableVariablesRequirements`: 3
- `SlotEquipData.ElementActiveConditions`: 3
- `SlotEquipData.TextureActiveConditions`: 3

## Generated aliases

- `MdrgKnownColorSlotName`: 24 values from luas/*.lua
- `MdrgKnownControllerElementOverride`: 31 values from luas/*.lua
- `MdrgKnownControllerId`: 6 values from luas/*.lua
- `MdrgKnownDialogueContainerId`: 49 values from luas/*.lua
- `MdrgKnownDialogueDirective`: 3 values from luas/*.lua
- `MdrgKnownDialoguePlaceholder`: 2 values from luas/*.lua
- `MdrgKnownEquipmentSlotId`: 40 values from luas/*.lua
- `MdrgKnownPaletteName`: 3 values from luas/*.lua
- `MdrgKnownShopId`: 2 values from luas/*.lua

## Accepted documentation changes

- `field ItemPrefab.EdibleData`
- `field ItemPrefab.IsPersonalityModule`
- `field ItemPrefab.ItemModifiableVariables`
- `field ItemPrefab.ItemModifiableVariablesRequirements`
- `field ItemPrefab.SlotData`
- `field SlotEquipData.ControllerElementOverride`
- `field SlotEquipData.ElementActiveConditions`
- `field SlotEquipData.TargetSlotString`
- `field SlotEquipData.TextureActiveConditions`
- `method AtLeastOneBoolVariableTrueRequirement.CreateInstance`
- `method ColorPaletteManager.GetColorPaletteByName`
- `method ColorSlot.CreateInstance`
- `method EdibleItemPrefabData.CreateInstance`
- `method ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable`
- `method ItemModifiableVariableFactory.CreateInstanceFloatVariable`
- `method ItemPrefab.AddTexture`
- `method ItemPrefab.TurnIntoPersonalityModule`
- `method ItemScopeConditionSpecialVariable.CreateInstance`
- `method LuaPersonalityModuleDefinition.PrepareContainer`
- `method ModUtilities.AddSingleBuyItemToShop`
- `method ModUtilities.CreateItemPrefab`
- `method ModUtilities.CreateNewItemAutoAssignId`
- `method ModUtilities.GetController`
- `method ModUtilities.GetPackedTexture`
- `method ModUtilities.PrepareNewPersonalityDefinition`
- `method SimpleLocalizedString.CreateInstanceReplacement`
- `method SlotEquipData.CreateInstance`
- `method SlotEquipData.SetForbiddenSlotsString`
- `method SlotEquipData.SetRequiredSlotsString`
- `method StoryBotDialogueBranch.__new`
- `method StoryBotDialogueBranchContainer.AddBranch`

## Rejected documentation candidates

- None

## Accepted type/autocomplete overrides

- `field type SlotEquipData.ControllerElementOverride`
- `field type SlotEquipData.TargetSlotString`
- `param ColorPaletteManager.GetColorPaletteByName.name`
- `param ColorSlot.CreateInstance.name`
- `param LuaPersonalityModuleDefinition.PrepareContainer.tagId`
- `param ModUtilities.AddSingleBuyItemToShop.shopId`
- `param ModUtilities.GetController.id`
- `param SlotEquipData.CreateInstance.slotString`
- `param SlotEquipData.SetForbiddenSlotsString.forbiddenSlots`
- `param SlotEquipData.SetRequiredSlotsString.requiredSlots`

## Rejected type/autocomplete overrides

- None

## Validation notes

- Documentation candidates are applied only when the class/member exists in `docs.txt` generated classes.
- Alias values come from generated Lua scripts, not from free-form markdown suggestions.
- Type overrides keep `|string` fallbacks for custom mod values.

# Runtime probe stub improvements

Generated from MDRG runtime probe report. This report is evidence only; docs.txt remains authoritative.

## Source

- Report: `probe/report-20260506-190713.txt`
- Timestamp: `20260506-190713`
- SHA256: `45a3a7f599780a077999c832d5b7012fa33567fac42c1a88a8f91bfe2f2410e7`

## Runtime

- Lua version: `MoonSharp 2.0.0.0`
- MoonSharp version: `2.0.0.0`
- MoonSharp platform: `limited.unity.dll.mono.clr4.aot`
- Unity: `True`
- Safe IO / `io` present: `False` (None)
- `io.open` present: `None`
- `io.popen` present: `None`
- Safe IO likely injected: `None`

## Runtime aliases

- `flowchart` -> `Flowchart` (userdata, Userdata Globals)
- `gv` -> `GameVariables` (userdata, Userdata Globals)

## Present symbols not already listed as normal runtime stubs

Known in docs.txt:
- `AllowedModifiers` (userdata)
- `AtLeastOneBoolVariableTrueRequirement` (userdata)
- `CommonAllowedModifiersEnum` (userdata)
- `CookingSong` (userdata)
- `CookingSongRuntimeData` (userdata)
- `EdibleItemNutritionProfile` (userdata)
- `EdibleTypeEnum` (userdata)
- `FinishedType` (userdata)
- `FishingBaitItemPrefabData` (userdata)
- `FishingCatchBehaviourType` (userdata)
- `FishingRodItemPrefabData` (userdata)
- `FishItemPrefabData` (userdata)
- `FishPreferences` (userdata)
- `GlobalFlag` (userdata)
- `ItemModifiableVariableFactory` (userdata)
- `ItemModifiableVariablesRequirement` (userdata)
- `ItemScopeCondition` (userdata)
- `ItemScopeConditionAlwaysTrueCondition` (userdata)
- `ItemScopeConditionCustom` (userdata)
- `ItemScopeConditionSpecialVariable` (userdata)
- `ItemSubCategory` (userdata)
- `Live2DControllerSingleton` (userdata)
- `NewsId` (userdata)
- `NoteButtonTypeEnum` (userdata)
- `pack` (function)
- `R` (userdata)
- `Recipe` (userdata)
- `Result` (userdata)
- `Shop` (userdata)
- `ShopItem` (userdata)
- `ShopManager` (userdata)
- `SingleArgumentComparators` (userdata)
- `SlotManager` (userdata)
- `SoundSingleton` (userdata)
- `StoryAutoBranch` (userdata)
- `StoryBlockTarget` (userdata)
- `StoryBotContainerTypeEnum` (userdata)
- `StoryBranchTarget` (userdata)
- `StoryEnumeratorTarget` (userdata)
- `StoryLocalizedConversationBranchTarget` (userdata)
- `StoryMenuBranch` (userdata)
- `StorySingleton` (userdata)
- `SusArea` (userdata)
- `SusModifier` (userdata)
- `TimeCheckType` (userdata)
- `TwoArgumentComparators` (userdata)
- `unpack` (function)
- `ViewSingleton` (userdata)

Not in docs.txt:
- `flowchart` (userdata)
- `gv` (userdata)

## Enum-like userdata

- `CheckType`: known enum from stubs
- `ColorSlot`: enum-like userdata
- `CommonAllowedModifiersEnum`: enum-like userdata
- `ControllerEnum`: known enum from stubs
- `EdibleTypeEnum`: enum-like userdata
- `FinishedType`: enum-like userdata
- `FishingBaitType`: known enum from stubs
- `FishingCatchBehaviourType`: enum-like userdata
- `GlobalFlag`: enum-like userdata
- `ItemCategory`: known enum from stubs
- `ItemEnum`: known enum from stubs
- `ItemSlot`: enum-like userdata
- `ItemSubCategory`: enum-like userdata
- `NoteButtonTypeEnum`: enum-like userdata
- `ScratchTextureType`: known enum from stubs
- `SlotType`: known enum from stubs
- `StoryBotContainerTypeEnum`: enum-like userdata
- `TimeCheckType`: enum-like userdata

## Callable safety summary

- `Context-dependent`: 6
- `Dangerous/Destructive`: 1
- `Read-only`: 71
- `State-changing`: 9
- `Unknown`: 10

## Probe field/value checks

- Known field probes: `0`
- Enum value probes: `0`
- Unconfirmed enum candidates: `0`
- Callback context rows: `0`
- Callback args: `0`
- Callback fields: `0`
- Callback access errors: `0`

## Rejected automatic changes

- No methods, fields or classes are created automatically from the probe.
- Missing `GameVariables` global is treated as console/plugin context, not API absence.
- Enum userdata presence confirms runtime exposure, but values still come from docs/dumps.

---@meta

-- MDRG MoonSharp Lua API definitions for LuaLS.
-- Generated from docs.txt and curated data/*.json.
-- These files describe exposed types and signatures only; comments avoid undocumented runtime behavior.

---@class AllowedModifiers
---@field MaxModifierCountClamped integer
---@field FishingRodAllowedModifiers AllowedModifiers
AllowedModifiers = {}

---@param commonAllowedModifiersEnum CommonAllowedModifiersEnum
---@return AllowedModifiers
function AllowedModifiers.GetCommon(commonAllowedModifiersEnum) end

---@return AllowedModifiers_Builder
function AllowedModifiers.CreateBuilder() end

---@overload fun(self: AllowedModifiers, item: Item)
---@param item Item
function AllowedModifiers.SetRandomModifiers(item) end

---@overload fun(self: AllowedModifiers): string
---@return string
function AllowedModifiers.ToLuaString() end

---@class AllowedModifiers_Builder
AllowedModifiers_Builder = {}

---@return AllowedModifiers_Builder
function AllowedModifiers_Builder.__new() end

---@overload fun(self: AllowedModifiers_Builder, lottery: table<GameId, number>): AllowedModifiers_Builder
---@param lottery table<GameId, number>
---@return AllowedModifiers_Builder
function AllowedModifiers_Builder.WithItemModifiers(lottery) end

---@overload fun(self: AllowedModifiers_Builder, odds: number): AllowedModifiers_Builder
---@param odds number
---@return AllowedModifiers_Builder
function AllowedModifiers_Builder.WithNoModifierOdds(odds) end

---@overload fun(self: AllowedModifiers_Builder, odds: number): AllowedModifiers_Builder
---@param odds number
---@return AllowedModifiers_Builder
function AllowedModifiers_Builder.WithMultipleModifierOdds(odds) end

---@overload fun(self: AllowedModifiers_Builder, count: integer): AllowedModifiers_Builder
---@param count integer
---@return AllowedModifiers_Builder
function AllowedModifiers_Builder.WithMaxModifierCount(count) end

---@overload fun(self: AllowedModifiers_Builder): AllowedModifiers
---@return AllowedModifiers
function AllowedModifiers_Builder.Build() end

---@class AnnalieShopPopup: PrefabPopup_AnnalieShopPopup_
---@field OverlayColor Color
---@field DontDrawPrevious boolean
---@field AlwaysDraw boolean
---@field IsNotStatic boolean
---@field destroyCancellationToken CancellationToken
---@field useGUILayout boolean
---@field didStart boolean
---@field didAwake boolean
---@field enabled boolean
---@field isActiveAndEnabled boolean
---@field transform Transform
---@field transformHandle TransformHandle
---@field gameObject GameObject
---@field tag string
---@field name string
---@field hideFlags HideFlags
---@field sortOrder integer
---@field noScaleFadeIn boolean
AnnalieShopPopup = {}

---@return AnnalieShopPopup
function AnnalieShopPopup.__new() end

---@overload fun(self: AnnalieShopPopup, onFinished: fun(), isWithBot: boolean)
---@param onFinished fun()
---@param isWithBot boolean
function AnnalieShopPopup.Open(onFinished, isWithBot) end

---@overload fun(self: AnnalieShopPopup): boolean
---@return boolean
function AnnalieShopPopup.CloseInner() end

---@class CatBellLive2DControllerItemModifier: Live2DControllerItemModifier
---@field SourceItem Item
CatBellLive2DControllerItemModifier = {}

---@return CatBellLive2DControllerItemModifier
function CatBellLive2DControllerItemModifier.__new() end

---@overload fun(self: CatBellLive2DControllerItemModifier, live2DController: Live2DController, type: UpdateTexturesFromCurrentlyEquippedTypeEnum)
---@param live2DController Live2DController
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function CatBellLive2DControllerItemModifier.Activate(live2DController, type) end

---@overload fun(self: CatBellLive2DControllerItemModifier, live2DController: Live2DController)
---@param live2DController Live2DController
function CatBellLive2DControllerItemModifier.FixedUpdate(live2DController) end

---@overload fun(self: CatBellLive2DControllerItemModifier, live2DController: Live2DController)
---@param live2DController Live2DController
function CatBellLive2DControllerItemModifier.Deactivate(live2DController) end

---Colecao de cores configuraveis usada por slots de cor.
---@class ColorPalette
---@field Entries ColorPaletteEntry[]
---@field Id string
---@field Name string
---@field LocalizationEntryReference TupleReference
---@field ShouldBeVisible boolean
ColorPalette = {}

---@param id string
---@param name string
---@param entries ColorPaletteEntry[]
---@return ColorPalette
function ColorPalette.CreateInstance(id, name, entries) end

---@overload fun(self: ColorPalette): ColorPaletteEntry
---@return ColorPaletteEntry
function ColorPalette.GetRandomColor() end

---@overload fun(self: ColorPalette, color: ColorPaletteEntry)
---@param color ColorPaletteEntry
function ColorPalette.AddColor(color) end

---@overload fun(self: ColorPalette): string
---@return string
function ColorPalette.GetRawName() end

---@overload fun(self: ColorPalette): string
---@return string
function ColorPalette.GetLocalizedName() end

---@overload fun(self: ColorPalette): string
---@return string
function ColorPalette.ToString() end

---@class ColorPaletteEntry
---@field Color Color32
---@field LocalizationEntryReference TupleReference
ColorPaletteEntry = {}

---@param name string
---@param color Color32
---@return ColorPaletteEntry
function ColorPaletteEntry.CreateInstance(name, color) end

---Cria instance from string e retorna ColorPaletteEntry.
---@param str string
---@return ColorPaletteEntry
function ColorPaletteEntry.CreateInstanceFromString(str) end

---@param c ColorPaletteEntry
---@return Color32
function ColorPaletteEntry.__toColor32(c) end

---@param c ColorPaletteEntry
---@return Color
function ColorPaletteEntry.__toColor(c) end

---@overload fun(self: ColorPaletteEntry): string
---@return string
function ColorPaletteEntry.GetRawName() end

---@overload fun(self: ColorPaletteEntry): string
---@return string
function ColorPaletteEntry.GetLocalizedName() end

---Acesso a paletas de cor registradas pelo jogo.
---@class ColorPaletteManager
---@field AllColors ColorPaletteEntry[]
---@field AllPalettes ColorPalette[]
---@field AllVisiblePalettes ColorPalette[]
---@field OldPlainWhite ColorPaletteEntry
---@field OldSadGrey ColorPaletteEntry
---@field OldCuteMagenta ColorPaletteEntry
---@field OldUglyBlue ColorPaletteEntry
---@field OldDreamyCyan ColorPaletteEntry
---@field OldGrassyGreen ColorPaletteEntry
---@field OldFakeGold ColorPaletteEntry
---@field OldBloodyRed ColorPaletteEntry
---@field OldSpecialTurquoise ColorPaletteEntry
---@field OldToxicGreen ColorPaletteEntry
---@field OldKitsunePiku ColorPaletteEntry
---@field OldAsphalt ColorPaletteEntry
---@field OldPartPalette ColorPalette
---@field JunsGrey ColorPaletteEntry
---@field JunsMagenta ColorPaletteEntry
---@field JunsPupils ColorPaletteEntry
---@field JunsIrises ColorPaletteEntry
---@field DefaultSkin ColorPaletteEntry
---@field JunsFlesh ColorPaletteEntry
---@field JunsBlush ColorPaletteEntry
---@field JunPalette ColorPalette
---@field White ColorPaletteEntry
---@field LightGrey ColorPaletteEntry
---@field Grey ColorPaletteEntry
---@field DarkGrey ColorPaletteEntry
---@field VeryDarkGrey ColorPaletteEntry
---@field Black ColorPaletteEntry
---@field GrayScalePalette ColorPalette
---@field UnicornGalaxy ColorPaletteEntry
---@field CuteMagenta ColorPaletteEntry
---@field StrawberyMilk ColorPaletteEntry
---@field ToxicPurple ColorPaletteEntry
---@field MidnightBlue ColorPaletteEntry
---@field BasicBlack ColorPaletteEntry
---@field BasicWhite ColorPaletteEntry
---@field BloodyRed ColorPaletteEntry
---@field Miku ColorPaletteEntry
---@field FakeGold ColorPaletteEntry
---@field DreamyCyan ColorPaletteEntry
---@field UglyBlue ColorPaletteEntry
---@field EBPurple ColorPaletteEntry
---@field EBBlue ColorPaletteEntry
---@field EBGreen ColorPaletteEntry
---@field EBYellow ColorPaletteEntry
---@field EBOrange ColorPaletteEntry
---@field EBRed ColorPaletteEntry
---@field Bastille ColorPaletteEntry
---@field Mirage ColorPaletteEntry
---@field Toledo ColorPaletteEntry
---@field Bunker ColorPaletteEntry
---@field HippiePink ColorPaletteEntry
---@field LinkWater ColorPaletteEntry
---@field TurquoiseBlue ColorPaletteEntry
---@field Amethyst ColorPaletteEntry
---@field Fern ColorPaletteEntry
---@field DarkPink ColorPaletteEntry
---@field AnnaliesViolet ColorPaletteEntry
---@field DefaultPartPalette ColorPalette
---@field VolksAutoGrey ColorPaletteEntry
---@field NavyGreen ColorPaletteEntry
---@field TempleCyan ColorPaletteEntry
---@field AvocadoGreen ColorPaletteEntry
---@field LunarPrincessGrey ColorPaletteEntry
---@field SatinBlack ColorPaletteEntry
---@field StilouBlue ColorPaletteEntry
---@field StilouRed ColorPaletteEntry
---@field StilouYellow ColorPaletteEntry
---@field MonizmedBurgundy ColorPaletteEntry
---@field MonizmedPurple ColorPaletteEntry
---@field DiabetePurple ColorPaletteEntry
---@field DiabeteGold ColorPaletteEntry
---@field DiabeteColaRed ColorPaletteEntry
---@field DiabeteColaYellow ColorPaletteEntry
---@field DiabeteColaBlue ColorPaletteEntry
---@field DiabeteDrSugarRed ColorPaletteEntry
---@field DiabeteDrSugarBlue ColorPaletteEntry
---@field DiabeteSweetPotatoBrown ColorPaletteEntry
---@field DiabeteSweetPotatoOrange ColorPaletteEntry
---@field CazinoGreen ColorPaletteEntry
---@field CazinoBrown ColorPaletteEntry
---@field OtherPalette ColorPalette
---@field EbonyClay ColorPaletteEntry
---@field Rope ColorPaletteEntry
---@field Leather ColorPaletteEntry
---@field CopperRust ColorPaletteEntry
---@field MellowApricot ColorPaletteEntry
---@field InkBlue ColorPaletteEntry
---@field DarkLeather ColorPaletteEntry
---@field BlackLeather ColorPaletteEntry
---@field WeatheredGray ColorPaletteEntry
---@field Burgundy ColorPaletteEntry
---@field LeatherPalette ColorPalette
---@field DarkUmber ColorPaletteEntry
---@field Sienna ColorPaletteEntry
---@field Sandstone ColorPaletteEntry
---@field Almond ColorPaletteEntry
---@field LightPeach ColorPaletteEntry
---@field DeepMahogany ColorPaletteEntry
---@field Bronze ColorPaletteEntry
---@field GoldenHoney ColorPaletteEntry
---@field WarmIvory ColorPaletteEntry
---@field PalePorcelain ColorPaletteEntry
---@field GoblinGreen ColorPaletteEntry
---@field SoftClay ColorPaletteEntry
---@field Rosewood ColorPaletteEntry
---@field Tawny ColorPaletteEntry
---@field BurntSienna ColorPaletteEntry
---@field EarthBrown ColorPaletteEntry
---@field PaleDoomer ColorPaletteEntry
---@field SkinTonePalette ColorPalette
---@field HotPinkPalette ColorPalette
---@field XoulionMainPalette ColorPalette
---@field XoulionLogoPalette ColorPalette
ColorPaletteManager = {}

---@return ColorPaletteManager
function ColorPaletteManager.__new() end

---Busca uma paleta de cores pelo nome usado nos scripts gerados.
---@param name MdrgKnownPaletteName|string
---@return ColorPalette
function ColorPaletteManager.GetColorPaletteByName(name) end

---@param color Color32
---@param colorPaletteEntry ColorPaletteEntry
---@return boolean
function ColorPaletteManager.TryFindEntry(color, colorPaletteEntry) end

---@param color Color32
---@return string
function ColorPaletteManager.FindName(color) end

---Define um slot de cor editavel de item, normalmente associado a uma paleta.
---@class ColorSlot
---@field Name string
---@field Palette ColorPalette
ColorSlot = {}

---@overload fun(name: string, palette: ColorPalette): ColorSlot
---@param name string
---@return ColorSlot
function ColorSlot.__new(name) end

---Cria um slot de cor configuravel usando um nome exibido e uma paleta.
---@overload fun(name: MdrgKnownColorSlotName|string, palette: ColorPalette): ColorSlot
---@param name MdrgKnownColorSlotName|string
---@return ColorSlot
function ColorSlot.CreateInstance(name) end

---@overload fun(self: ColorSlot): string
---@return string
function ColorSlot.ToLuaString() end

---@overload fun(self: ColorSlot): ColorSlot
---@return ColorSlot
function ColorSlot.Clone() end

---@class DelayItemManagerCallback
---@field Source string
DelayItemManagerCallback = {}

---@return DelayItemManagerCallback
function DelayItemManagerCallback.__new() end

---@overload fun(self: DelayItemManagerCallback, source: string)
---@param source string
function DelayItemManagerCallback.FillData(source) end

---@overload fun(self: DelayItemManagerCallback)
function DelayItemManagerCallback.Dispose() end

---@class EdibleItemNutritionProfile: GameStatContainer
---@field IsSafeToEat GameStat
---@field EatSound GameStat
---@field Satiation GameStatFixedValue
---@field RawHealthChange GameStatFixedValue
---@field StaminaChange GameStatFixedValue
---@field MentalHealthChange GameStatFixedValue
---@field MaxSafeCumChange GameStatFixedValue
---@field MaxUnsafeCumChange GameStatFixedValue
---@field CurrentCumChange GameStatFixedValue
---@field CurrentCumChangePercentMaxCum GameStatFixedValue
---@field Pool NutritionProfilePool
EdibleItemNutritionProfile = {}

---@return EdibleItemNutritionProfile
function EdibleItemNutritionProfile.__new() end

---@overload fun(self: EdibleItemNutritionProfile, gameVariables: GameVariables)
---@param gameVariables GameVariables
function EdibleItemNutritionProfile.Apply(gameVariables) end

---@overload fun(self: EdibleItemNutritionProfile, subItemProfile: EdibleItemNutritionProfile, count: integer)
---@param subItemProfile EdibleItemNutritionProfile
---@param count integer
function EdibleItemNutritionProfile.AddDishSubItem(subItemProfile, count) end

---@overload fun(self: EdibleItemNutritionProfile, dishQuality: number, itemPriceSum: integer, itemCount: integer)
---@param dishQuality number
---@param itemPriceSum integer
---@param itemCount integer
function EdibleItemNutritionProfile.FinishDishCalculation(dishQuality, itemPriceSum, itemCount) end

---@overload fun(self: EdibleItemNutritionProfile, stringBuilder: StringBuilder)
---@param stringBuilder StringBuilder
function EdibleItemNutritionProfile.AppendDescribeEffects(stringBuilder) end

---Dados especificos de comida/consumivel associados a ItemPrefab.EdibleData.
---@class EdibleItemPrefabData
---@field EdibleType EdibleTypeEnum
---@field NutritionProfileFiller fun(arg1: Item, arg2: EdibleItemNutritionProfile)
EdibleItemPrefabData = {}

---@param edibleType EdibleTypeEnum
---@param nutritionProfileFiller fun(arg1: Item, arg2: EdibleItemNutritionProfile)
---@return EdibleItemPrefabData
function EdibleItemPrefabData.__new(edibleType, nutritionProfileFiller) end

---Cria dados de item comestivel; o callback preenche o perfil nutricional do item.
---@param edibleTypeEnum EdibleTypeEnum
---@param getNutritionProfile fun(arg1: Item, arg2: EdibleItemNutritionProfile)
---@return EdibleItemPrefabData
function EdibleItemPrefabData.CreateInstance(edibleTypeEnum, getNutritionProfile) end

---@param getNutritionProfile? fun(arg1: Item, arg2: EdibleItemNutritionProfile)
---@return EdibleItemPrefabData
function EdibleItemPrefabData.CreateInstanceDish(getNutritionProfile) end

---@param item Item
---@param profile EdibleItemNutritionProfile
function EdibleItemPrefabData.DefaultDishNutritionProfileCalculator(item, profile) end

---@overload fun(self: EdibleItemPrefabData, item: Item, profile: EdibleItemNutritionProfile)
---@param item Item
---@param profile EdibleItemNutritionProfile
function EdibleItemPrefabData.FillNutritionProfile(item, profile) end

---@overload fun(self: EdibleItemPrefabData): string
---@return string
function EdibleItemPrefabData.ToLuaString() end

---@overload fun(self: EdibleItemPrefabData): EdibleItemPrefabData
---@return EdibleItemPrefabData
function EdibleItemPrefabData.Clone() end

---Dados especificos de peixe associados a ItemPrefab.FishData.
---@class FishItemPrefabData
---@field AverageWeightKg number
---@field SizeDistribution01 number
---@field MaxWeightKg number
---@field StrengthMultiplier number
---@field BehaviourType FishingCatchBehaviourType
---@field FishPreferences FishPreferences
---@field FishMinWeight number
---@field FishMaxWeight number
FishItemPrefabData = {}

---@return FishItemPrefabData
function FishItemPrefabData.__new() end

---@overload fun(sizeDistribution01: number, maxWeight: number, fishPreferences: FishPreferences, behaviourType: FishingCatchBehaviourType, strengthMultiplier: number): FishItemPrefabData
---@return FishItemPrefabData
function FishItemPrefabData.CreateInstance() end

---@overload fun(self: FishItemPrefabData): string
---@return string
function FishItemPrefabData.ToLuaString() end

---@overload fun(self: FishItemPrefabData, throwValue: number, fishItem: Item, fishingGameStats: FishingGameStats, fishingLocationData: FishingLocationData)
---@param throwValue number
---@param fishItem Item
---@param fishingGameStats FishingGameStats
---@param fishingLocationData FishingLocationData
function FishItemPrefabData.FillFishData(throwValue, fishItem, fishingGameStats, fishingLocationData) end

---@overload fun(self: FishItemPrefabData, weight: number): number
---@param weight number
---@return number
function FishItemPrefabData.DetermineFishPercentile(weight) end

---@overload fun(self: FishItemPrefabData): FishItemPrefabData
---@return FishItemPrefabData
function FishItemPrefabData.Clone() end

---@class FishPreferences
---@field FishingBaitTypesPreference table<FishingBaitType, number>
---@field SpecificFishingBaitItemPreference table<GameId, number>
---@field MostActiveTimeHour integer
---@field MostActiveHourRange integer
---@field MostActiveHourStrength01 number
---@field PredatoryFishPreferences FishPreferences
---@field BottomFeedersAndScavengersPreferences FishPreferences
---@field BenthicFeedersPreferences FishPreferences
---@field OmnivorousFishPreferences FishPreferences
FishPreferences = {}

---@return FishPreferences
function FishPreferences.__new() end

---@overload fun(fishingBaitTypesPreference: table<FishingBaitType, number>, specificFishingBaitItemPreference: table<GameId, number>): FishPreferences
---@return FishPreferences
function FishPreferences.CreateInstance() end

---@overload fun(self: FishPreferences, currentHour: integer): number
---@param currentHour integer
---@return number
function FishPreferences.DetermineActiveHourModifier(currentHour) end

---@overload fun(self: FishPreferences): string
---@return string
function FishPreferences.ToLuaString() end

---@overload fun(self: FishPreferences): FishPreferences
---@return FishPreferences
function FishPreferences.Clone() end

---@class FisherSellFishPopup: PrefabPopup_FisherSellFishPopup_
---@field OverlayColor Color
---@field DontDrawPrevious boolean
---@field AlwaysDraw boolean
---@field IsNotStatic boolean
---@field destroyCancellationToken CancellationToken
---@field useGUILayout boolean
---@field didStart boolean
---@field didAwake boolean
---@field enabled boolean
---@field isActiveAndEnabled boolean
---@field transform Transform
---@field transformHandle TransformHandle
---@field gameObject GameObject
---@field tag string
---@field name string
---@field hideFlags HideFlags
---@field sortOrder integer
---@field noScaleFadeIn boolean
FisherSellFishPopup = {}

---@return FisherSellFishPopup
function FisherSellFishPopup.__new() end

---@overload fun(self: FisherSellFishPopup, onFinished: fun())
---@param onFinished fun()
function FisherSellFishPopup.Open(onFinished) end

---@overload fun(self: FisherSellFishPopup): boolean
---@return boolean
function FisherSellFishPopup.CloseInner() end

---@class FishingBackgroundsContainer
---@field microplastic_coast SerializableAutomaticReference
---@field polluted_lake SerializableAutomaticReference
---@field premium_farm SerializableAutomaticReference
---@field trashed_river SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
FishingBackgroundsContainer = {}

---@return FishingBackgroundsContainer
function FishingBackgroundsContainer.__new() end

---@class FishingBaitItemPrefabData
---@field FishingBaitComposition table<FishingBaitType, number>
FishingBaitItemPrefabData = {}

---@param fishingBaitComposition table<FishingBaitType, number>
---@return FishingBaitItemPrefabData
function FishingBaitItemPrefabData.__new(fishingBaitComposition) end

---@overload fun(fishingBaitType: FishingBaitType, fishingBaitStrength: number): FishingBaitItemPrefabData
---@param fishingBaitComposition table<FishingBaitType, number>
---@return FishingBaitItemPrefabData
function FishingBaitItemPrefabData.CreateInstance(fishingBaitComposition) end

---@overload fun(self: FishingBaitItemPrefabData): string
---@return string
function FishingBaitItemPrefabData.ToLuaString() end

---@overload fun(self: FishingBaitItemPrefabData): FishingBaitItemPrefabData
---@return FishingBaitItemPrefabData
function FishingBaitItemPrefabData.Clone() end

---@class FishingRodItemPrefabData
---@field FishingRodSize01 number
---@field FishingRodAcceleration01 number
---@field ReelingSpeed01 number
---@field MaxEffectiveFishWeightKg number
FishingRodItemPrefabData = {}

---@param fishingRodSize01 number
---@param fishingRodAcceleration01 number
---@param fishReelingSpeed01 number
---@param maxEffectiveFishWeightKg number
---@return FishingRodItemPrefabData
function FishingRodItemPrefabData.CreateInstance(fishingRodSize01, fishingRodAcceleration01, fishReelingSpeed01, maxEffectiveFishWeightKg) end

---@overload fun(self: FishingRodItemPrefabData): string
---@return string
function FishingRodItemPrefabData.ToLuaString() end

---@overload fun(self: FishingRodItemPrefabData): FishingRodItemPrefabData
---@return FishingRodItemPrefabData
function FishingRodItemPrefabData.Clone() end

---@class GameStatFixedValue
---@field DefaultValue number
---@field Value number
GameStatFixedValue = {}

---@param defaultValue number
---@return GameStatFixedValue
function GameStatFixedValue.__new(defaultValue) end

---@overload fun(self: GameStatFixedValue, value: number)
---@param value number
function GameStatFixedValue.SetValue(value) end

---@overload fun(self: GameStatFixedValue)
function GameStatFixedValue.ResetStat() end

---@overload fun(self: GameStatFixedValue, add: number): number
---@overload fun(self: GameStatFixedValue): number
---@param add? number
---@return number
function GameStatFixedValue.Calculate(add) end

---@overload fun(self: GameStatFixedValue): string
---@return string
function GameStatFixedValue.ToString() end

---@class GameStatPercentBoost
---@field MinAllowedPercent number
---@field MaxAllowedPercent number
---@field Percent number
GameStatPercentBoost = {}

---@param minAllowedPercent number
---@param maxAllowedPercent number
---@return GameStatPercentBoost
function GameStatPercentBoost.__new(minAllowedPercent, maxAllowedPercent) end

---@overload fun(self: GameStatPercentBoost)
function GameStatPercentBoost.ResetStat() end

---@overload fun(self: GameStatPercentBoost, value: number): number
---@param value number
---@return number
function GameStatPercentBoost.CalculateBoosted(value) end

---@overload fun(self: GameStatPercentBoost, value: integer): integer
---@param value integer
---@return integer
function GameStatPercentBoost.CalculateBoostedInt(value) end

---@overload fun(self: GameStatPercentBoost): string
---@return string
function GameStatPercentBoost.ToString() end

---@class GameStatRandomPercentage
---@field DefaultValue number
---@field DefaultMultiply number
---@field Value number
---@field Multiply number
GameStatRandomPercentage = {}

---@param defaultValue number
---@param defaultMultiply number
---@return GameStatRandomPercentage
function GameStatRandomPercentage.__new(defaultValue, defaultMultiply) end

---@overload fun(self: GameStatRandomPercentage)
function GameStatRandomPercentage.ResetStat() end

---@overload fun(self: GameStatRandomPercentage, add: number, multi: number): number
---@overload fun(self: GameStatRandomPercentage, add: number): number
---@overload fun(self: GameStatRandomPercentage): number
---@param add? number
---@param multi? number
---@return number
function GameStatRandomPercentage.Calculate(add, multi) end

---@overload fun(self: GameStatRandomPercentage, add: number, multi: number): boolean
---@overload fun(self: GameStatRandomPercentage, add: number): boolean
---@overload fun(self: GameStatRandomPercentage): boolean
---@param add? number
---@param multi? number
---@return boolean
function GameStatRandomPercentage.Check(add, multi) end

---@overload fun(self: GameStatRandomPercentage): string
---@return string
function GameStatRandomPercentage.ToString() end

---Instancia runtime de um item no inventario/equipamento, usada em callbacks como OnUse e SpecialEffectAction.
---@class Item: SpecialVariablesHolder
---@field Quality number
---@field NormalizedQuality number
---@field InverseNormalizedQuality number
---@field GameId GameId
---@field EquippedSlot string
---@field CurrentSpecialEffectsActionItem Item
---@field IsIllegal boolean
---@field HasColor boolean
---@field CanChangeColor boolean
---@field IsStackable boolean
---@field IsEdible boolean
---@field ItemLocation ItemLocationEnum
---@field IsFishingRod boolean
---@field FishingRodSize01 number
---@field FishingRodAcceleration01 number
---@field FishingRodReelingSpeed01 number
---@field FishingRodMaxEffectiveFishWeightKg number
---@field IsFish boolean
---@field FishWeight number
---@field FishUnsafeToEatAtAll boolean
---@field FishPollution number
---@field FishNutrition number
---@field IsDish boolean
---@field DishQuality number
---@field ItemModifiers ItemModifier[]
---@field HasAnyItemModifiers boolean
---@field MinQuality number
---@field MinQualityForNewItem number
---@field MaxQuality number
---@field QualityDescriptors QualityDescriptor[]
---@field IsFavourite boolean
---@field SafeFishPollutionLevel number
Item = {}

---@overload fun(id: ItemEnum, quality: number): Item
---@param id GameId
---@param quality number
---@return Item
function Item.__new(id, quality) end

---@param gameId GameId
---@param allowModifiers? boolean
---@return Item
function Item.CreateRandomItem(gameId, allowModifiers) end

---@param gameId GameId
---@return Item
function Item.CreateDefaultItemForLive2DController(gameId) end

---@overload fun(self: Item): SimpleLocalizedString
---@return SimpleLocalizedString
function Item.GetRawNameSls() end

---@overload fun(self: Item, stringBuilder: StringBuilder, itemNameInclude: ItemNameIncludeEnum): StringBuilder
---@overload fun(self: Item, stringBuilder: StringBuilder): StringBuilder
---@param stringBuilder StringBuilder
---@param itemNameInclude? ItemNameIncludeEnum
---@return StringBuilder
function Item.GetNameStringBuilder(stringBuilder, itemNameInclude) end

---@overload fun(self: Item, itemNameInclude: ItemNameIncludeEnum): string
---@overload fun(self: Item): string
---@param itemNameInclude? ItemNameIncludeEnum
---@return string
function Item.GetName(itemNameInclude) end

---@overload fun(self: Item, stringBuilder: StringBuilder)
---@param stringBuilder StringBuilder
function Item.GetDescriptionStringBuilder(stringBuilder) end

---@overload fun(self: Item): string
---@return string
function Item.GetDescription() end

---@overload fun(self: Item): string
---@return string
function Item.ToString() end

---@overload fun(self: Item): boolean
---@return boolean
function Item.CanBeUsed() end

---@overload fun(self: Item): boolean
---@return boolean
function Item.CanBeUnpacked() end

---@overload fun(self: Item, count: integer): boolean
---@param count integer
---@return boolean
function Item.SetCount(count) end

---Retorna a quantidade empilhada da instancia runtime do item.
---@overload fun(self: Item): integer
---@return integer
function Item.GetCount() end

---@overload fun(self: Item): integer
---@return integer
function Item.GetPrice() end

---@overload fun(self: Item, quality: number)
---@param quality number
function Item.SetQuality(quality) end

---@overload fun(): string
---@overload fun(self: Item): string
---@param quality number
---@return string
function Item.GetQualityString(quality) end

---@param quality number
---@return QualityDescriptor
function Item.GetQualityDescriptor(quality) end

---@overload fun(self: Item): ItemEnum
---@return ItemEnum
function Item.GetVanillaItemEnum() end

---@param index integer
---@return string
function Item.ColorSlotId(index) end

---@overload fun(self: Item)
function Item.OnBeforeSerialize() end

---@overload fun(self: Item)
function Item.OnAfterDeserialize() end

---Retorna o Guid unico da instancia runtime do item.
---@overload fun(self: Item): Guid
---@return Guid
function Item.GetUniqueGuid() end

---@overload fun(self: Item): Guid
---@return Guid
function Item.GetSourceOrThisUniqueGuid() end

---@overload fun(self: Item, uniqueIdOfOriginal: Guid): boolean
---@param uniqueIdOfOriginal Guid
---@return boolean
function Item.TryGetSourceUniqueId(uniqueIdOfOriginal) end

---@overload fun(self: Item, uniqueIdOfOriginal: Guid): boolean
---@param uniqueIdOfOriginal Guid
---@return boolean
function Item.IsSameSource(uniqueIdOfOriginal) end

---@overload fun(self: Item, slot: ItemSlot): boolean
---@param slot ItemSlot
---@return boolean
function Item.CanGoInto(slot) end

---Retorna se a instancia runtime do item esta equipada.
---@overload fun(self: Item): boolean
---@return boolean
function Item.IsEquipped() end

---@overload fun(self: Item): boolean
---@return boolean
function Item.IsWronglyEquipped() end

---@overload fun(self: Item, value: boolean)
---@param value boolean
function Item.CallSpecialEffectsAction(value) end

---@overload fun(self: Item): Result
---@return Result
function Item.CanBeRepaired() end

---@overload fun(self: Item, repairAmount: number): number
---@param repairAmount number
---@return number
function Item.PriceChangeByRepairAmount(repairAmount) end

---@overload fun(self: Item, amount: number)
---@param amount number
function Item.Repair(amount) end

---Retorna o ItemPrefab associado a esta instancia runtime do item.
---@overload fun(self: Item): ItemPrefab
---@return ItemPrefab
function Item.GetItemPrefab() end

---@overload fun(self: Item, tag: ItemPrefabTag): boolean
---@param tag ItemPrefabTag
---@return boolean
function Item.HasTag(tag) end

---@overload fun(self: Item, index: integer): Color
---@param index integer
---@return Color
function Item.GetColor(index) end

---@overload fun(self: Item, index: integer, color: Color)
---@param index integer
---@param color Color
function Item.SetColor(index, color) end

---@overload fun(self: Item, colors: Color[])
---@param colors Color[]
function Item.SetColors(colors) end

---@overload fun(self: Item): Color[]
---@return Color[]
function Item.GetColors() end

---@overload fun(self: Item): Color
---@return Color
function Item.GetMainColor() end

---@overload fun(self: Item): Item[]
---@return Item[]
function Item.GetDishItems() end

---@overload fun(self: Item, dishQuality: number, executionItems: Item[])
---@param dishQuality number
---@param executionItems Item[]
function Item.FillDishData(dishQuality, executionItems) end

---@param dishQuality number
---@return string
function Item.GetDishQualityDescription(dishQuality) end

---@overload fun(self: Item)
function Item.ClearItemModifiers() end

---@overload fun(self: Item, itemModifierIds: GameId[])
---@param itemModifierIds GameId[]
function Item.SetItemModifiers(itemModifierIds) end

---@overload fun(itemModifier: ItemModifier)
---@overload fun(self: Item, itemModifierId: GameId)
---@overload fun(self: Item, itemModifier: ItemModifier)
---@param itemModifierId GameId
function Item.AddItemModifier(itemModifierId) end

---@overload fun(self: Item, gameStatModifiers: IGameStatModifier[])
---@param gameStatModifiers IGameStatModifier[]
function Item.PopulateGameStatModifierList(gameStatModifiers) end

---@overload fun(self: Item, item2: Item): boolean
---@param item2 Item
---@return boolean
function Item.Equals_IdAndEqualsColorsAndQuality(item2) end

---@overload fun(self: Item, item2: Item): boolean
---@param item2 Item
---@return boolean
function Item.Equals_IdAndColors(item2) end

---@overload fun(self: Item, item2: Item): boolean
---@param item2 Item
---@return boolean
function Item.Equals_ColorsChangeNotPossible(item2) end

---@overload fun(self: Item, item2: Item): boolean
---@param item2 Item
---@return boolean
function Item.Equals_UniqueGuid(item2) end

---@overload fun(self: Item, item2: Item, enforceUniqueId: boolean, checkColors: boolean): boolean
---@param item2 Item
---@param enforceUniqueId boolean
---@param checkColors boolean
---@return boolean
function Item.Equals_Complex(item2, enforceUniqueId, checkColors) end

---@overload fun(self: Item, id: GameId): Item
---@param id GameId
---@return Item
function Item.UnpackClone(id) end

---@overload fun(self: Item): Item
---@return Item
function Item.Clone() end

---@overload fun(self: Item, _itemStatsButtonList: IModificationPeriodButtonList, itemUIAllowedButtons: ItemUIAllowedButtons)
---@overload fun(self: Item, _itemStatsButtonList: IModificationPeriodButtonList)
---@param _itemStatsButtonList IModificationPeriodButtonList
---@param itemUIAllowedButtons? ItemUIAllowedButtons
function Item.FillUIButtons(_itemStatsButtonList, itemUIAllowedButtons) end

---@class ItemCondition: StoryCondition
---@field RelatedItem GameId
---@field ItemComparisonType ItemComparisonTypeEnum
ItemCondition = {}

---@param relatedItem GameId
---@param itemComparisonType ItemComparisonTypeEnum
---@param negate boolean
---@return ItemCondition
function ItemCondition.__new(relatedItem, itemComparisonType, negate) end

---@overload fun(self: ItemCondition): string
---@return string
function ItemCondition.Explain() end

---@overload fun(self: ItemCondition): string
---@return string
function ItemCondition.GenerateCode() end

---@overload fun(obj: any): boolean
---@overload fun(self: ItemCondition, other: ItemCondition): boolean
---@overload fun(self: ItemCondition, obj: any): boolean
---@param other ItemCondition
---@return boolean
function ItemCondition.Equals(other) end

---@overload fun(self: ItemCondition): integer
---@return integer
function ItemCondition.GetHashCode() end

---@class ItemInSlotCondition: StoryCondition
---@field Slot string
ItemInSlotCondition = {}

---@param negate boolean
---@param slot string
---@return ItemInSlotCondition
function ItemInSlotCondition.__new(negate, slot) end

---@overload fun(self: ItemInSlotCondition): string
---@return string
function ItemInSlotCondition.Explain() end

---@overload fun(self: ItemInSlotCondition): string
---@return string
function ItemInSlotCondition.GenerateCode() end

---@overload fun(obj: any): boolean
---@overload fun(self: ItemInSlotCondition, other: ItemInSlotCondition): boolean
---@overload fun(self: ItemInSlotCondition, obj: any): boolean
---@param other ItemInSlotCondition
---@return boolean
function ItemInSlotCondition.Equals(other) end

---@overload fun(self: ItemInSlotCondition): integer
---@return integer
function ItemInSlotCondition.GetHashCode() end

---@class ItemManager: GameVariablesSubClass
---@field Sets EquipmentSet[]
---@field NunBusyWithRepair boolean
---@field ClothierOrders ItemOrder[]
---@field ShopManager ShopManager
---@field RelatedGameVariables GameVariables
ItemManager = {}

---@return ItemManager
function ItemManager.__new() end

---@return ItemManager
function ItemManager.CreateInstance() end

---@overload fun(self: ItemManager, item: Item): Item[]
---@param item Item
---@return Item[]
function ItemManager.UnpackItem(item) end

---@overload fun(self: ItemManager, item: Item)
---@param item Item
function ItemManager.UseItem(item) end

---@overload fun(item: Item, count: integer, outCopy: Item): boolean
---@overload fun(self: ItemManager, item: Item, count: integer): boolean
---@overload fun(self: ItemManager, item: Item, count: integer, outCopy: Item): boolean
---@param item Item
---@param count integer
---@return boolean
function ItemManager.ConsumeItem(item, count) end

---@overload fun(self: ItemManager): table[]
---@return table[]
function ItemManager.InventoryDebugStrings() end

---@overload fun(self: ItemManager): table<any, any>
---@return table<any, any>
function ItemManager.AllEquippedItemsDictionary() end

---@overload fun(self: ItemManager): Item[]
---@return Item[]
function ItemManager.AllEquippedItems() end

---@overload fun(self: ItemManager): Item[]
---@return Item[]
function ItemManager.AllEquippedItemsInEquipmentOrder() end

---@overload fun(self: ItemManager): Item[]
---@return Item[]
function ItemManager.BotEquippedItems() end

---@overload fun(slot: ItemSlot, _items: Item[]): boolean
---@overload fun(self: ItemManager, slot: string, _items: Item[]): boolean
---@overload fun(self: ItemManager, slot: ItemSlot, _items: Item[]): boolean
---@param slot string
---@param _items Item[]
---@return boolean
function ItemManager.TryGetItemsAtSlot(slot, _items) end

---@overload fun(self: ItemManager, slot: ItemSlot, item: Item): boolean
---@param slot ItemSlot
---@param item Item
---@return boolean
function ItemManager.TryGetItemAtSlot(slot, item) end

---@overload fun(self: ItemManager, slot: ItemSlot): boolean
---@param slot ItemSlot
---@return boolean
function ItemManager.HasItemAtSlot(slot) end

---@overload fun(self: ItemManager, slot: string): Item
---@param slot string
---@return Item
function ItemManager.GetFirstItemAtSlot(slot) end

---@overload fun(self: ItemManager, slot: string, tag: ItemPrefabTag): boolean
---@param slot string
---@param tag ItemPrefabTag
---@return boolean
function ItemManager.FirstItemAtSlotHasTag(slot, tag) end

---@overload fun(self: ItemManager, item: Item, slot: string): boolean
---@param item Item
---@param slot string
---@return boolean
function ItemManager.AllItemRequiredSlotsEquipped(item, slot) end

---@overload fun(self: ItemManager, itemToRemove: Item): Item[]
---@param itemToRemove Item
---@return Item[]
function ItemManager.GetItemsThatRequireThisEquipped(itemToRemove) end

---@overload fun(newItem: Item, slotId: string, forceRemoveForbidden: boolean): EquipResults
---@overload fun(newItem: Item, slotId: string): EquipResults
---@overload fun(newItem: Item, slot: ItemSlot, forceRemoveForbidden: boolean, infoStringBuilder: StringBuilder): EquipResults
---@overload fun(newItem: Item, slot: ItemSlot, forceRemoveForbidden: boolean): EquipResults
---@overload fun(newItem: Item, slot: ItemSlot): EquipResults
---@overload fun(self: ItemManager, item: Item, forceRemoveForbidden: boolean): EquipResults
---@overload fun(self: ItemManager, newItem: Item, slotId: string, forceRemoveForbidden: boolean): EquipResults
---@overload fun(self: ItemManager, newItem: Item, slotId: string): EquipResults
---@overload fun(self: ItemManager, newItem: Item, slot: ItemSlot, forceRemoveForbidden: boolean, infoStringBuilder: StringBuilder): EquipResults
---@overload fun(self: ItemManager, newItem: Item, slot: ItemSlot, forceRemoveForbidden: boolean): EquipResults
---@overload fun(self: ItemManager, newItem: Item, slot: ItemSlot): EquipResults
---@param item Item
---@param forceRemoveForbidden boolean
---@return EquipResults
function ItemManager.Equip(item, forceRemoveForbidden) end

---@overload fun(self: ItemManager)
function ItemManager.UnequipAllBotClothes() end

---@overload fun(item: Item)
---@overload fun(self: ItemManager, slot: string)
---@overload fun(self: ItemManager, item: Item)
---@param slot string
function ItemManager.UnequipItemWithDependencies(slot) end

---@overload fun(self: ItemManager, slot: string)
---@param slot string
function ItemManager.UnequipAllItemsAtSlotWithDependencies(slot) end

---@overload fun(self: ItemManager, slot: string, withDependencies: boolean): Result
---@overload fun(self: ItemManager, slot: string): Result
---@param slot string
---@param withDependencies? boolean
---@return Result
function ItemManager.UnequipItem(slot, withDependencies) end

---@overload fun(self: ItemManager)
function ItemManager.UnequipAllBotItems() end

---@overload fun(self: ItemManager, predicate: fun(arg1: Item): boolean)
---@param predicate fun(arg1: Item): boolean
function ItemManager.UnequipAllByPredicate(predicate) end

---@overload fun(self: ItemManager, item: Item, withDependencies: boolean): Result
---@overload fun(self: ItemManager, item: Item): Result
---@param item Item
---@param withDependencies? boolean
---@return Result
function ItemManager.UnequipItemDescription(item, withDependencies) end

---@overload fun(self: ItemManager, value: fun(arg1: string, arg2: Item))
---@param value fun(arg1: string, arg2: Item)
function ItemManager.add_OnItemEquipped(value) end

---@overload fun(self: ItemManager, value: fun(arg1: string, arg2: Item))
---@param value fun(arg1: string, arg2: Item)
function ItemManager.remove_OnItemEquipped(value) end

---@overload fun(self: ItemManager, value: fun(arg1: string, arg2: Item))
---@param value fun(arg1: string, arg2: Item)
function ItemManager.add_OnItemUnequipped(value) end

---@overload fun(self: ItemManager, value: fun(arg1: string, arg2: Item))
---@param value fun(arg1: string, arg2: Item)
function ItemManager.remove_OnItemUnequipped(value) end

---@overload fun(self: ItemManager, logSb: StringBuilder)
---@param logSb StringBuilder
function ItemManager.ReloadTexturesInAllEquippedItems(logSb) end

---@overload fun(self: ItemManager, value: boolean)
---@param value boolean
function ItemManager.ToggleSpecialEffects(value) end

---@overload fun(self: ItemManager, item: Item, itemLocationEnum: ItemLocationEnum)
---@overload fun(self: ItemManager, item: Item)
---@param item Item
---@param itemLocationEnum? ItemLocationEnum
function ItemManager.AddItem(item, itemLocationEnum) end

---@overload fun(self: ItemManager, item: Item)
---@param item Item
function ItemManager.RemoveItem(item) end

---@overload fun(self: ItemManager, index: integer, item: Item)
---@param index integer
---@param item Item
function ItemManager.RemoveItemAt(index, item) end

---@overload fun(self: ItemManager, target: Item, source: Item): boolean
---@param target Item
---@param source Item
---@return boolean
function ItemManager.MoveItemToOtherItemsPosition(target, source) end

---@overload fun(self: ItemManager, value: fun())
---@param value fun()
function ItemManager.add_OnItemsModified(value) end

---@overload fun(self: ItemManager, value: fun())
---@param value fun()
function ItemManager.remove_OnItemsModified(value) end

---@overload fun(self: ItemManager, value: fun())
---@param value fun()
function ItemManager.add_OnEquippedItemsModified(value) end

---@overload fun(self: ItemManager, value: fun())
---@param value fun()
function ItemManager.remove_OnEquippedItemsModified(value) end

---@overload fun(self: ItemManager, source: string): DelayItemManagerCallback
---@param source string
---@return DelayItemManagerCallback
function ItemManager.DelayCallbacks(source) end

---@overload fun(self: ItemManager, item: Item)
---@param item Item
function ItemManager.ReportChangeInItemData(item) end

---@overload fun(self: ItemManager, shopItem: ShopItem)
---@param shopItem ShopItem
function ItemManager.BorrowItemFromShop(shopItem) end

---@overload fun(self: ItemManager)
function ItemManager.MoveCarriedToHome() end

---@overload fun(self: ItemManager)
function ItemManager.MoveBotEquippedToCarried() end

---@overload fun(self: ItemManager, shopId: string): integer
---@param shopId string
---@return integer
function ItemManager.ReturnAllBorrowedItems(shopId) end

---@overload fun(self: ItemManager, shopId: string, itemToReturn: Item)
---@param shopId string
---@param itemToReturn Item
function ItemManager.ReturnItemToShop(shopId, itemToReturn) end

---@overload fun(self: ItemManager, slot: ItemSlot): boolean
---@param slot ItemSlot
---@return boolean
function ItemManager.TryEquippingARandomItemAtSlot(slot) end

---@overload fun(self: ItemManager, gameId: GameId, gameIdItems: Item[]): boolean
---@param gameId GameId
---@param gameIdItems Item[]
---@return boolean
function ItemManager.TryGetItemsByGameId(gameId, gameIdItems) end

---@overload fun(self: ItemManager, gameId: GameId, items: Item[]): boolean
---@param gameId GameId
---@param items Item[]
---@return boolean
function ItemManager.AppendItemsByGameId(gameId, items) end

---@overload fun(gameId: GameId): boolean
---@overload fun(self: ItemManager, item: ItemEnum): boolean
---@overload fun(self: ItemManager, gameId: GameId): boolean
---@param item ItemEnum
---@return boolean
function ItemManager.IsEquipped(item) end

---@overload fun(predicate: fun(arg1: Item): boolean): boolean
---@overload fun(self: ItemManager, gameId: GameId): boolean
---@overload fun(self: ItemManager, predicate: fun(arg1: Item): boolean): boolean
---@param gameId GameId
---@return boolean
function ItemManager.HasItem(gameId) end

---@overload fun(self: ItemManager, gameId: GameId): integer
---@param gameId GameId
---@return integer
function ItemManager.GetItemCount(gameId) end

---@overload fun(self: ItemManager, item: Item, enforceUniqueId: boolean, checkColors: boolean): boolean
---@param item Item
---@param enforceUniqueId boolean
---@param checkColors boolean
---@return boolean
function ItemManager.IsEquippedComplex(item, enforceUniqueId, checkColors) end

---@overload fun(self: ItemManager, partnerId: string): boolean
---@param partnerId string
---@return boolean
function ItemManager.IsEquippedMerch(partnerId) end

---@overload fun(self: ItemManager, partnerId: string): boolean
---@param partnerId string
---@return boolean
function ItemManager.HasAnyMerch(partnerId) end

---@overload fun(self: ItemManager, partnerId: string): integer
---@param partnerId string
---@return integer
function ItemManager.MerchCount(partnerId) end

---@overload fun(self: ItemManager): Item[]
---@return Item[]
function ItemManager.GetAllRepairableItems() end

---@overload fun(self: ItemManager): Item[]
---@return Item[]
function ItemManager.GetAllFishes() end

---@overload fun(self: ItemManager): number
---@return number
function ItemManager.CalculateStreamingBonus() end

---@overload fun(self: ItemManager): Item[]
---@return Item[]
function ItemManager.AllItemsReadonlyCollection() end

---@overload fun(self: ItemManager): Item[]
---@return Item[]
function ItemManager.AllItemsEnumerable() end

---@overload fun(self: ItemManager, slot: ItemSlot, slotItems: Item[]): Item[]
---@param slot ItemSlot
---@param slotItems Item[]
---@return Item[]
function ItemManager.GetAllItemsAtSlot(slot, slotItems) end

---@overload fun(self: ItemManager, slot1: ItemSlot, slot2: ItemSlot, slotItems: Item[]): Item[]
---@param slot1 ItemSlot
---@param slot2 ItemSlot
---@param slotItems Item[]
---@return Item[]
function ItemManager.GetAllPairsAtSlots(slot1, slot2, slotItems) end

---@overload fun(self: ItemManager, groups: ItemPairContainer[]): ItemPairContainer[]
---@param groups ItemPairContainer[]
---@return ItemPairContainer[]
function ItemManager.GetAllPairedItems(groups) end

---@overload fun(self: ItemManager, slot: ItemSlot, bestItem: Item): boolean
---@param slot ItemSlot
---@param bestItem Item
---@return boolean
function ItemManager.TryFindBestItemForSlot(slot, bestItem) end

---@overload fun(self: ItemManager, newSet: EquipmentSet)
---@param newSet EquipmentSet
function ItemManager.AddEquipmentSet(newSet) end

---@overload fun(self: ItemManager, value: EquipmentSet)
---@param value EquipmentSet
function ItemManager.RemoveEquipmentSet(value) end

---@overload fun(self: ItemManager, itemRepairOrder: ItemRepairOrder): boolean
---@param itemRepairOrder ItemRepairOrder
---@return boolean
function ItemManager.TryGetCurrentNunRepairOrder(itemRepairOrder) end

---@overload fun(self: ItemManager): Result
---@return Result
function ItemManager.FinishCurrentNunRepairOrder() end

---@overload fun(self: ItemManager, item: Item)
---@param item Item
function ItemManager.MakeNunRepairOrder(item) end

---@overload fun(self: ItemManager, itemOrder: ItemOrder)
---@param itemOrder ItemOrder
function ItemManager.AddClothierOrder(itemOrder) end

---@overload fun(self: ItemManager, itemOrder: ItemOrder)
---@param itemOrder ItemOrder
function ItemManager.RemoveOrder(itemOrder) end

---@overload fun(self: ItemManager)
function ItemManager.OnBeforeSerialize() end

---@overload fun(self: ItemManager)
function ItemManager.OnAfterDeserialize() end

---@overload fun(self: ItemManager, slot: string)
---@param slot string
function ItemManager.DeleteSlot(slot) end

---@class ItemModifiableVariable
---@field VarId string
---@field NameSls SimpleLocalizedString
ItemModifiableVariable = {}

---@overload fun(self: ItemModifiableVariable): string
---@return string
function ItemModifiableVariable.GetLocalizedName() end

---@overload fun(self: ItemModifiableVariable): string
---@return string
function ItemModifiableVariable.ToLuaString() end

---@overload fun(self: ItemModifiableVariable, item: Item, stringBuilder: StringBuilder)
---@param item Item
---@param stringBuilder StringBuilder
function ItemModifiableVariable.GetLocalizedDescription(item, stringBuilder) end

---@overload fun(self: ItemModifiableVariable): ItemModifiableVariable
---@return ItemModifiableVariable
function ItemModifiableVariable.Clone() end

---Factory de variaveis modificaveis associadas a itens e condicoes de elementos visuais.
---@class ItemModifiableVariableFactory
ItemModifiableVariableFactory = {}

---@return ItemModifiableVariableFactory
function ItemModifiableVariableFactory.__new() end

---Cria uma variavel booleana modificavel usada por condicoes de elementos/texturas.
---@param variableName string
---@param localizedString SimpleLocalizedString
---@param defaultValue? boolean
---@return ItemModifiableVariableIntBackedBool
function ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(variableName, localizedString, defaultValue) end

---Cria uma variavel numerica modificavel usada por sliders e ajustes visuais.
---@param variableName string
---@param localizedString SimpleLocalizedString
---@param defaultValue? number
---@return ItemModifiableVariableFloat01Percent
function ItemModifiableVariableFactory.CreateInstanceFloatVariable(variableName, localizedString, defaultValue) end

---@class ItemModifiableVariableFloat01Percent: ItemModifiableVariable
---@field DefaultValue number
---@field VarId string
---@field NameSls SimpleLocalizedString
ItemModifiableVariableFloat01Percent = {}

---@param varId string
---@param nameSls SimpleLocalizedString
---@param defaultValue number
---@return ItemModifiableVariableFloat01Percent
function ItemModifiableVariableFloat01Percent.__new(varId, nameSls, defaultValue) end

---@overload fun(self: ItemModifiableVariableFloat01Percent): string
---@return string
function ItemModifiableVariableFloat01Percent.ToLuaString() end

---@overload fun(self: ItemModifiableVariableFloat01Percent, item: Item): number
---@param item Item
---@return number
function ItemModifiableVariableFloat01Percent.GetValue(item) end

---@overload fun(self: ItemModifiableVariableFloat01Percent, item: Item, value: number)
---@param item Item
---@param value number
function ItemModifiableVariableFloat01Percent.SetValue(item, value) end

---@overload fun(self: ItemModifiableVariableFloat01Percent, item: Item, stringBuilder: StringBuilder)
---@param item Item
---@param stringBuilder StringBuilder
function ItemModifiableVariableFloat01Percent.GetLocalizedDescription(item, stringBuilder) end

---@overload fun(self: ItemModifiableVariableFloat01Percent): ItemModifiableVariable
---@return ItemModifiableVariable
function ItemModifiableVariableFloat01Percent.Clone() end

---@class ItemModifiableVariableIntBackedBool: ItemModifiableVariable
---@field DefaultValue boolean
---@field VarId string
---@field NameSls SimpleLocalizedString
ItemModifiableVariableIntBackedBool = {}

---@param varId string
---@param nameSls SimpleLocalizedString
---@param defaultValue boolean
---@return ItemModifiableVariableIntBackedBool
function ItemModifiableVariableIntBackedBool.__new(varId, nameSls, defaultValue) end

---@overload fun(self: ItemModifiableVariableIntBackedBool): string
---@return string
function ItemModifiableVariableIntBackedBool.ToLuaString() end

---@overload fun(self: ItemModifiableVariableIntBackedBool, item: Item): boolean
---@param item Item
---@return boolean
function ItemModifiableVariableIntBackedBool.GetValue(item) end

---@overload fun(self: ItemModifiableVariableIntBackedBool, item: Item, value: boolean)
---@param item Item
---@param value boolean
function ItemModifiableVariableIntBackedBool.SetValueRaw(item, value) end

---@overload fun(self: ItemModifiableVariableIntBackedBool, item: Item, stringBuilder: StringBuilder)
---@param item Item
---@param stringBuilder StringBuilder
function ItemModifiableVariableIntBackedBool.GetLocalizedDescription(item, stringBuilder) end

---@overload fun(self: ItemModifiableVariableIntBackedBool): ItemModifiableVariable
---@return ItemModifiableVariable
function ItemModifiableVariableIntBackedBool.Clone() end

---@class ItemModifiableVariablesRequirement
ItemModifiableVariablesRequirement = {}

---@overload fun(self: ItemModifiableVariablesRequirement, item: Item, itemPrefab: ItemPrefab, lastModified: integer)
---@param item Item
---@param itemPrefab ItemPrefab
---@param lastModified integer
function ItemModifiableVariablesRequirement.Enforce(item, itemPrefab, lastModified) end

---@overload fun(self: ItemModifiableVariablesRequirement, item: Item, itemPrefab: ItemPrefab, modifiableVariableIndex: integer, newValue: boolean): boolean
---@param item Item
---@param itemPrefab ItemPrefab
---@param modifiableVariableIndex integer
---@param newValue boolean
---@return boolean
function ItemModifiableVariablesRequirement.IsBoolChangeAllowed(item, itemPrefab, modifiableVariableIndex, newValue) end

---@overload fun(self: ItemModifiableVariablesRequirement): string
---@return string
function ItemModifiableVariablesRequirement.ToLuaString() end

---@overload fun(self: ItemModifiableVariablesRequirement): ItemModifiableVariablesRequirement
---@return ItemModifiableVariablesRequirement
function ItemModifiableVariablesRequirement.Clone() end

---@class ItemPairContainer
---@field Valid boolean
---@field Left Item[]
---@field Right Item[]
ItemPairContainer = {}

---@return ItemPairContainer
function ItemPairContainer.__new() end

---@overload fun(self: ItemPairContainer, i1: Item, i2: Item): boolean
---@param i1 Item
---@param i2 Item
---@return boolean
function ItemPairContainer.TryGetRandomPairMatchColor(i1, i2) end

---@overload fun(self: ItemPairContainer): ValueTuple
---@return ValueTuple
function ItemPairContainer.GetRandomPair() end

---@overload fun(self: ItemPairContainer)
function ItemPairContainer.Prepare() end

---@overload fun(self: ItemPairContainer)
function ItemPairContainer.Dispose() end

---@overload fun(self: ItemPairContainer): string
---@return string
function ItemPairContainer.ToString() end

---Modelo configuravel de item antes/depois do registro no jogo; scripts normalmente preenchem campos, anexam texturas/dados opcionais e registram o item via ModUtilities.
---@class ItemPrefab
---@field Name string
---@field Description string
---@field Price integer
---Variaveis configuraveis do item usadas por condicoes e ajustes visuais.
---@field ItemModifiableVariables ItemModifiableVariable[]
---Regras aplicadas sobre as variaveis modificaveis do item.
---@field ItemModifiableVariablesRequirements ItemModifiableVariablesRequirement[]
---@field AllowedModifiersData AllowedModifiers
---Dados modernos de slot/equipamento usados para roupas, modulos e itens equipaveis.
---@field SlotData SlotEquipData
---@field OnUse fun(arg1: Item): boolean
---@field OnUnpack fun(arg1: Item): Item[]
---@field OnUnpackGameIdHint GameId[]
---@field SpecialEffectAction fun(arg1: boolean, arg2: Item)
---@field RandomItemPostProcessing fun(arg1: Item)
---@field ItemModiferAdditionFunction fun(arg1: Live2DController, arg2: Item): Live2DControllerItemModifier
---@field FillGameStatsModifiersAction fun(arg1: Item, arg2: IGameStatModifier[])
---@field IsIllegal boolean
---@field CanChangeColor boolean
---@field HasQuality boolean
---@field ExpectedInShop boolean
---Marca o prefab como item de modulo de personalidade.
---@field IsPersonalityModule boolean
---@field IsMissingItem boolean
---@field ThrowingOutForbidden boolean
---@field IsStove boolean
---@field ColorSlots ColorSlot[]
---@field ScratchType ScratchTextureType
---@field IsStackable boolean
---@field Category ItemCategory
---@field SubCategory ItemSubCategory
---@field Partners string[]
---@field SusModifiers SusModifier[]
---@field FishData FishItemPrefabData
---@field FishingRodItemPrefabData FishingRodItemPrefabData
---@field FishingBaitItemPrefabData FishingBaitItemPrefabData
---Dados que tornam o item comestivel e definem o callback de perfil nutricional.
---@field EdibleData EdibleItemPrefabData
---@field Textures PackedTexturesContainer[]
---@field HasAnyTextures boolean
---@field Tags ItemPrefabTag[]
---@field OverrideIconReference IReference
---@field ShillingLinkId string
---@field CustomShaderType CustomShaderTypeEnum
---@field CustomShader IReference
---@field CustomShaderMaterialPostProcessing fun(arg1: Material, arg2: any[])
---@field IsDefault boolean
---@field ControllerElementOverrides string[][]
---@field Equipable boolean
---@field EquipableByBot boolean
---@field Usable boolean
---@field HasAnyModifiableVariables boolean
---@field HasColor boolean
---Deprecated: Deprecated C# member. Prefer SlotData.
---@field ForbiddenSlots string[]
---Deprecated: Deprecated C# member. Prefer OverrideIconReference.
---@field OverrideIcon Sprite
---Deprecated: Deprecated C# member. Prefer AddRequiredSlot or SlotData.
---@field PossibleEquipmentSlots string[]
---Deprecated: Deprecated C# member. Prefer AddRequiredSlot or SlotData.
---@field RequiredSlots string[]
ItemPrefab = {}

---@param name string
---@param description string
---@param possibleSlot ItemSlot
---@param price integer
---@param onUse fun(arg1: Item): boolean
---@return ItemPrefab
function ItemPrefab.__new(name, description, possibleSlot, price, onUse) end

---@param slot ItemSlot
---@param defaultColors Color[]
---@return ItemPrefab
function ItemPrefab.CreateDefault(slot, defaultColors) end

---@overload fun(self: ItemPrefab, slotEquipData: SlotEquipData): boolean
---@param slotEquipData SlotEquipData
---@return boolean
function ItemPrefab.IsEquipable(slotEquipData) end

---@overload fun(self: ItemPrefab, item: Item, variableIndex: integer, newValue: boolean): boolean
---@param item Item
---@param variableIndex integer
---@param newValue boolean
---@return boolean
function ItemPrefab.BoolModifiableVariableChangeAllowed(item, variableIndex, newValue) end

---@overload fun(self: ItemPrefab, item: Item, variable: ItemModifiableVariableIntBackedBool, newValue: boolean): boolean
---@param item Item
---@param variable ItemModifiableVariableIntBackedBool
---@param newValue boolean
---@return boolean
function ItemPrefab.SetBoolModifiableVariableRespectRequirements(item, variable, newValue) end

---@overload fun(self: ItemPrefab): ItemPrefab
---@return ItemPrefab
function ItemPrefab.Clone() end

---@overload fun(self: ItemPrefab, allControllers: ModCreationLive2DControllersContainer): ItemPrefab
---@param allControllers ModCreationLive2DControllersContainer
---@return ItemPrefab
function ItemPrefab.CloneWithTextures(allControllers) end

---@overload fun(self: ItemPrefab): string
---@return string
function ItemPrefab.ToString() end

---@overload fun(self: ItemPrefab, prefabVar: string, script: StringBuilder)
---@param prefabVar string
---@param script StringBuilder
function ItemPrefab.ToLua(prefabVar, script) end

---@overload fun(self: ItemPrefab, partnerId: string): boolean
---@param partnerId string
---@return boolean
function ItemPrefab.IsMadeByPartner(partnerId) end

---@overload fun(slot: ItemSlot): boolean
---@overload fun(self: ItemPrefab, slot: string): boolean
---@overload fun(self: ItemPrefab, slot: ItemSlot): boolean
---@param slot string
---@return boolean
function ItemPrefab.CanGoInto(slot) end

---@overload fun(self: ItemPrefab, tag: ItemPrefabTag): boolean
---@param tag ItemPrefabTag
---@return boolean
function ItemPrefab.HasTag(tag) end

---@overload fun(self: ItemPrefab, name: string, description: string, price: integer): ItemPrefab
---@param name string
---@param description string
---@param price integer
---@return ItemPrefab
function ItemPrefab.ChangeNameDescriptionAndPrice(name, description, price) end

---@overload fun(colorSlots: string[], palette: ColorPalette): ItemPrefab
---@overload fun(colorSlots: string[]): ItemPrefab
---@overload fun(count: integer, palette: ColorPalette): ItemPrefab
---@overload fun(count: integer): ItemPrefab
---@overload fun(self: ItemPrefab, colorSlots: ColorSlot[]): ItemPrefab
---@overload fun(self: ItemPrefab, colorSlots: string[], palette: ColorPalette): ItemPrefab
---@overload fun(self: ItemPrefab, colorSlots: string[]): ItemPrefab
---@overload fun(self: ItemPrefab, count: integer, palette: ColorPalette): ItemPrefab
---@overload fun(self: ItemPrefab, count: integer): ItemPrefab
---@param colorSlots ColorSlot[]
---@return ItemPrefab
function ItemPrefab.SetDefaultColorSlots(colorSlots) end

---Marca dois itens como par/conjunto relacionado.
---@overload fun(i1: GameId, i2: GameId, registerAsMatching: boolean): ItemPrefab
---@overload fun(self: ItemPrefab, i1: GameId, i2: GameId): ItemPrefab
---@overload fun(self: ItemPrefab, i1: GameId, i2: GameId, registerAsMatching: boolean): ItemPrefab
---@param i1 GameId
---@param i2 GameId
---@return ItemPrefab
function ItemPrefab.MakePair(i1, i2) end

---Marca ou cria associacao de conjunto entre itens relacionados.
---@overload fun(self: ItemPrefab, id: GameId[]): ItemPrefab
---@param id GameId[]
---@return ItemPrefab
function ItemPrefab.MakeSet(id) end

---@overload fun(self: ItemPrefab, area: SusArea, cover: number): ItemPrefab
---@param area SusArea
---@param cover number
---@return ItemPrefab
function ItemPrefab.AddSusModifier(area, cover) end

---Anexa uma textura empacotada ao prefab; o overload com controller limita a textura a uma cena/controller.
---@overload fun(packed: PackedTexturesContainer): ItemPrefab
---@overload fun(target: ControllerEnum, packed: PackedTexturesContainer): ItemPrefab
---@overload fun(self: ItemPrefab, holder: SpecialTextureHolder): ItemPrefab
---@overload fun(self: ItemPrefab, packed: PackedTexturesContainer): ItemPrefab
---@overload fun(self: ItemPrefab, target: ControllerEnum, packed: PackedTexturesContainer): ItemPrefab
---@param holder SpecialTextureHolder
---@return ItemPrefab
function ItemPrefab.AddTexture(holder) end

---Adiciona configuracoes de logos modificaveis ao prefab.
---@overload fun(self: ItemPrefab, drawables: table[], spriteReference: IReference, colorIndex: integer, layer: integer): ItemPrefab
---@overload fun(self: ItemPrefab, drawables: table[], spriteReference: IReference, colorIndex: integer): ItemPrefab
---@overload fun(self: ItemPrefab, drawables: table[], spriteReference: IReference): ItemPrefab
---@param drawables table[]
---@param spriteReference IReference
---@param colorIndex? integer
---@param layer? integer
---@return ItemPrefab
function ItemPrefab.AddModdableLogos(drawables, spriteReference, colorIndex, layer) end

---@overload fun(self: ItemPrefab, textureReference: IReference, colorIndex: integer, layer: integer): ItemPrefab
---@overload fun(self: ItemPrefab, textureReference: IReference, colorIndex: integer): ItemPrefab
---@overload fun(self: ItemPrefab, textureReference: IReference): ItemPrefab
---@param textureReference IReference
---@param colorIndex? integer
---@param layer? integer
---@return ItemPrefab
function ItemPrefab.AddPantiesLogoTexture(textureReference, colorIndex, layer) end

---Adiciona uma textura de logo modificavel para hoodie/roupa compativel.
---@overload fun(self: ItemPrefab, textureReference: IReference, colorIndex: integer, layer: integer): ItemPrefab
---@overload fun(self: ItemPrefab, textureReference: IReference, colorIndex: integer): ItemPrefab
---@overload fun(self: ItemPrefab, textureReference: IReference): ItemPrefab
---@param textureReference IReference
---@param colorIndex? integer
---@param layer? integer
---@return ItemPrefab
function ItemPrefab.AddHoodieLogoTexture(textureReference, colorIndex, layer) end

---@overload fun(self: ItemPrefab, textureReference: IReference, colorIndex: integer, layer: integer): ItemPrefab
---@overload fun(self: ItemPrefab, textureReference: IReference, colorIndex: integer): ItemPrefab
---@overload fun(self: ItemPrefab, textureReference: IReference): ItemPrefab
---@param textureReference IReference
---@param colorIndex? integer
---@param layer? integer
---@return ItemPrefab
function ItemPrefab.AddShirtLogoTextureAll(textureReference, colorIndex, layer) end

---@overload fun(self: ItemPrefab, textureReference: IReference, colorIndex: integer, layer: integer): ItemPrefab
---@overload fun(self: ItemPrefab, textureReference: IReference, colorIndex: integer): ItemPrefab
---@overload fun(self: ItemPrefab, textureReference: IReference): ItemPrefab
---@param textureReference IReference
---@param colorIndex? integer
---@param layer? integer
---@return ItemPrefab
function ItemPrefab.AddShirtLogoTextureAllMirroredSleeve(textureReference, colorIndex, layer) end

---@overload fun(self: ItemPrefab, textureReference: IReference, colorIndex: integer, layer: integer): ItemPrefab
---@overload fun(self: ItemPrefab, textureReference: IReference, colorIndex: integer): ItemPrefab
---@overload fun(self: ItemPrefab, textureReference: IReference): ItemPrefab
---@param textureReference IReference
---@param colorIndex? integer
---@param layer? integer
---@return ItemPrefab
function ItemPrefab.AddShirtLogoTextureMainOnly(textureReference, colorIndex, layer) end

---@overload fun(self: ItemPrefab, textureReference: IReference, colorIndex: integer, layer: integer): ItemPrefab
---@overload fun(self: ItemPrefab, textureReference: IReference, colorIndex: integer): ItemPrefab
---@overload fun(self: ItemPrefab, textureReference: IReference): ItemPrefab
---@param textureReference IReference
---@param colorIndex? integer
---@param layer? integer
---@return ItemPrefab
function ItemPrefab.AddShirtLogoTextureSleeveOnly(textureReference, colorIndex, layer) end

---@overload fun(self: ItemPrefab, randomItemPostprocessing: fun(arg1: Item)): ItemPrefab
---@param randomItemPostprocessing fun(arg1: Item)
---@return ItemPrefab
function ItemPrefab.SetRandomItemPostProcessing(randomItemPostprocessing) end

---@overload fun(self: ItemPrefab, randomItemColors: Color[]): ItemPrefab
---@param randomItemColors Color[]
---@return ItemPrefab
function ItemPrefab.SetRandomItemForcedColor(randomItemColors) end

---@overload fun(item: Item, colorSet: BrandColorsSet)
---@param item Item
function ItemPrefab.SetBrandColor(item) end

---@overload fun(self: ItemPrefab): ItemPrefab
---@return ItemPrefab
function ItemPrefab.SetPartnerBrandColorForcedColor() end

---@overload fun(self: ItemPrefab, forcedBrandColorsSet: BrandColorsSet): ItemPrefab
---@overload fun(self: ItemPrefab): ItemPrefab
---@param forcedBrandColorsSet? BrandColorsSet
---@return ItemPrefab
function ItemPrefab.SetBrandColorSetForcedColor(forcedBrandColorsSet) end

---@overload fun(self: ItemPrefab, linkId: string): ItemPrefab
---@param linkId string
---@return ItemPrefab
function ItemPrefab.SetShillingLinkId(linkId) end

---@overload fun(self: ItemPrefab): ItemPrefab
---@return ItemPrefab
function ItemPrefab.SetNotExpectedInShop() end

---@overload fun(self: ItemPrefab, partnerId: string): ItemPrefab
---@param partnerId string
---@return ItemPrefab
function ItemPrefab.SetPartnerId(partnerId) end

---@overload fun(self: ItemPrefab, partnerId: string, forcedLogo: IReference, forcedBrandColorsSet: BrandColorsSet, name: string, description: string): ItemPrefab
---@overload fun(self: ItemPrefab, partnerId: string, forcedLogo: IReference, forcedBrandColorsSet: BrandColorsSet, name: string): ItemPrefab
---@overload fun(self: ItemPrefab, partnerId: string, forcedLogo: IReference, forcedBrandColorsSet: BrandColorsSet): ItemPrefab
---@overload fun(self: ItemPrefab, partnerId: string, forcedLogo: IReference): ItemPrefab
---@overload fun(self: ItemPrefab, partnerId: string): ItemPrefab
---@param partnerId string
---@param forcedLogo? IReference
---@param forcedBrandColorsSet? BrandColorsSet
---@param name? string
---@param description? string
---@return ItemPrefab
function ItemPrefab.MakeShirtMerch(partnerId, forcedLogo, forcedBrandColorsSet, name, description) end

---@overload fun(self: ItemPrefab, partnerId: string, forcedLogo: IReference, forcedBrandColorsSet: BrandColorsSet, name: string, description: string): ItemPrefab
---@overload fun(self: ItemPrefab, partnerId: string, forcedLogo: IReference, forcedBrandColorsSet: BrandColorsSet, name: string): ItemPrefab
---@overload fun(self: ItemPrefab, partnerId: string, forcedLogo: IReference, forcedBrandColorsSet: BrandColorsSet): ItemPrefab
---@overload fun(self: ItemPrefab, partnerId: string, forcedLogo: IReference): ItemPrefab
---@overload fun(self: ItemPrefab, partnerId: string): ItemPrefab
---@param partnerId string
---@param forcedLogo? IReference
---@param forcedBrandColorsSet? BrandColorsSet
---@param name? string
---@param description? string
---@return ItemPrefab
function ItemPrefab.MakeHoodieMerch(partnerId, forcedLogo, forcedBrandColorsSet, name, description) end

---@overload fun(slot: ItemSlot): ItemPrefab
---@overload fun(self: ItemPrefab, slot: string): ItemPrefab
---@overload fun(self: ItemPrefab, slot: ItemSlot): ItemPrefab
---@param slot string
---@return ItemPrefab
function ItemPrefab.AddRequiredSlot(slot) end

---@overload fun(self: ItemPrefab, shader: IReference, customShaderPostProcessing: fun(arg1: Material, arg2: any[]), customShaderType: CustomShaderTypeEnum): ItemPrefab
---@overload fun(self: ItemPrefab, shader: IReference, customShaderPostProcessing: fun(arg1: Material, arg2: any[])): ItemPrefab
---@overload fun(self: ItemPrefab, shader: IReference): ItemPrefab
---@param shader IReference
---@param customShaderPostProcessing? fun(arg1: Material, arg2: any[])
---@param customShaderType? CustomShaderTypeEnum
---@return ItemPrefab
function ItemPrefab.SetCustomShader(shader, customShaderPostProcessing, customShaderType) end

---@overload fun(self: ItemPrefab, customShaderType: CustomShaderTypeEnum): ItemPrefab
---@overload fun(self: ItemPrefab): ItemPrefab
---@param customShaderType? CustomShaderTypeEnum
---@return ItemPrefab
function ItemPrefab.SetRainbowShader(customShaderType) end

---@overload fun(self: ItemPrefab, customShaderType: CustomShaderTypeEnum): ItemPrefab
---@overload fun(self: ItemPrefab): ItemPrefab
---@param customShaderType? CustomShaderTypeEnum
---@return ItemPrefab
function ItemPrefab.SetRayMarchingShader(customShaderType) end

---@overload fun(self: ItemPrefab): ItemPrefab
---@return ItemPrefab
function ItemPrefab.MakeHypercamo() end

---Liga um item registrado a uma definicao de personality module.
---@overload fun(self: ItemPrefab, id: GameId, personalityDefinition: PersonalityModuleDefinition)
---@param id GameId
---@param personalityDefinition PersonalityModuleDefinition
function ItemPrefab.TurnIntoPersonalityModule(id, personalityDefinition) end

---@overload fun(self: ItemPrefab, textureReference: IReference, shaderType: CustomShaderTypeEnum): ItemPrefab
---@overload fun(self: ItemPrefab, textureReference: IReference): ItemPrefab
---@overload fun(self: ItemPrefab): ItemPrefab
---@param textureReference? IReference
---@param shaderType? CustomShaderTypeEnum
---@return ItemPrefab
function ItemPrefab.SetMovingTextureShader(textureReference, shaderType) end

---@overload fun(self: ItemPrefab, equippedSlot: string): ItemSlot[]
---@param equippedSlot string
---@return ItemSlot[]
function ItemPrefab.GetRequiredSlots(equippedSlot) end

---@overload fun(self: ItemPrefab, equippedSlot: string): integer
---@param equippedSlot string
---@return integer
function ItemPrefab.GetRequiredSlotCount(equippedSlot) end

---@overload fun(self: ItemPrefab, equippedSlot: string): ItemSlot[]
---@param equippedSlot string
---@return ItemSlot[]
function ItemPrefab.GetForbiddenSlots(equippedSlot) end

---@overload fun(self: ItemPrefab, equippedSlot: string): integer
---@param equippedSlot string
---@return integer
function ItemPrefab.GetForbiddenSlotCount(equippedSlot) end

---@overload fun(self: ItemPrefab, element: string[]): ItemPrefab
---@param element string[]
---@return ItemPrefab
function ItemPrefab.SetControllerElementOverride(element) end

---@overload fun(self: ItemPrefab, slot: ItemSlot, element: string[]): ItemPrefab
---@param slot ItemSlot
---@param element string[]
---@return ItemPrefab
function ItemPrefab.SetSlotAndOverride(slot, element) end

---Adiciona uma variavel modificavel booleana ao prefab.
---@overload fun(self: ItemPrefab, Id: string, simpleLocalizedString: SimpleLocalizedString, defaultValue: boolean): ItemPrefab
---@param Id string
---@param simpleLocalizedString SimpleLocalizedString
---@param defaultValue boolean
---@return ItemPrefab
function ItemPrefab.AddBoolModifiableVariable(Id, simpleLocalizedString, defaultValue) end

---Adiciona um requisito baseado nas variaveis modificaveis do item.
---@overload fun(self: ItemPrefab, itemModifiableVariablesRequirement: ItemModifiableVariablesRequirement): ItemPrefab
---@param itemModifiableVariablesRequirement ItemModifiableVariablesRequirement
---@return ItemPrefab
function ItemPrefab.AddItemModifiableVariablesRequirement(itemModifiableVariablesRequirement) end

---Adiciona requisito para que pelo menos uma variavel modificavel do item esteja habilitada.
---@overload fun(self: ItemPrefab): ItemPrefab
---@return ItemPrefab
function ItemPrefab.AddAtLeastOneEnabledAllModifiableVariablesRequirement() end

---@overload fun(self: ItemPrefab): ItemPrefab
---@return ItemPrefab
function ItemPrefab.AddOnlyOneEnabledAllModifiableVariablesRequirement() end

---@overload fun(self: ItemPrefab, indices: integer[]): ItemPrefab
---@param indices integer[]
---@return ItemPrefab
function ItemPrefab.AddOnlyOneEnabledModifiableVariablesRequirement(indices) end

---Adiciona requisito para que pelo menos uma das variaveis modificaveis indicadas esteja habilitada.
---@overload fun(self: ItemPrefab, indices: integer[]): ItemPrefab
---@param indices integer[]
---@return ItemPrefab
function ItemPrefab.AddAtLeastOneEnabledModifiableVariablesRequirement(indices) end

---@overload fun(self: ItemPrefab): boolean
---@return boolean
function ItemPrefab.HasAtLeastOneBoolVariableTrueRequirement() end

---@overload fun(self: ItemPrefab, index: integer, condition: ItemScopeCondition): ItemPrefab
---@param index integer
---@param condition ItemScopeCondition
---@return ItemPrefab
function ItemPrefab.SetElementAtIndexCondition(index, condition) end

---@overload fun(self: ItemPrefab, index: integer, condition: ItemScopeCondition): ItemPrefab
---@param index integer
---@param condition ItemScopeCondition
---@return ItemPrefab
function ItemPrefab.SetTextureAtIndexCondition(index, condition) end

---@overload fun(self: ItemPrefab, index: integer, variableId: string, variableSls: SimpleLocalizedString, defaultValue: boolean): ItemPrefab
---@overload fun(self: ItemPrefab, index: integer, variableId: string, variableSls: SimpleLocalizedString): ItemPrefab
---@param index integer
---@param variableId string
---@param variableSls SimpleLocalizedString
---@param defaultValue? boolean
---@return ItemPrefab
function ItemPrefab.SetElementAtIndexConditionBoolModifiableVariable(index, variableId, variableSls, defaultValue) end

---@overload fun(self: ItemPrefab, index: integer, variableId: string, variableSls: SimpleLocalizedString, defaultValue: boolean): ItemPrefab
---@overload fun(self: ItemPrefab, index: integer, variableId: string, variableSls: SimpleLocalizedString): ItemPrefab
---@param index integer
---@param variableId string
---@param variableSls SimpleLocalizedString
---@param defaultValue? boolean
---@return ItemPrefab
function ItemPrefab.SetTextureAtIndexConditionBoolModifiableVariable(index, variableId, variableSls, defaultValue) end

---@overload fun(self: ItemPrefab): Sprite
---@return Sprite
function ItemPrefab.GetIcon() end

---@overload fun(self: ItemPrefab, logSb: StringBuilder)
---@param logSb StringBuilder
function ItemPrefab.ReloadTextures(logSb) end

---@overload fun(self: ItemPrefab, gameId: GameId): boolean
---@param gameId GameId
---@return boolean
function ItemPrefab.TryGetItemGameId(gameId) end

---@class ItemPrefabManager
---@field AllNonDefaultItems table[]
---@field AllItems table[]
---@field AllEquipableItems table[]
---@field AllVanillaItems table[]
ItemPrefabManager = {}

---@return ItemPrefabManager
function ItemPrefabManager.__new() end

---@param gameId1 GameId
---@param gameId2 GameId
function ItemPrefabManager.RegisterItemPair(gameId1, gameId2) end

---@param item Item
---@param itemPairIndex integer
---@return boolean
function ItemPrefabManager.TryGetItemPairIndex(item, itemPairIndex) end

---@param guid Guid
---@return boolean
function ItemPrefabManager.HasAnyItems(guid) end

---@param guid Guid
---@return table[]
function ItemPrefabManager.AllPrefabsFromSource(guid) end

---@param itemId GameId
---@return ItemPrefab
function ItemPrefabManager.GetItemById(itemId) end

function ItemPrefabManager.CreateLocalizationEntries() end

---@param item Item
---@return SimpleLocalizedString
function ItemPrefabManager.GetItemNameSls(item) end

---@param guid Guid
---@param itemPrefab ItemPrefab
---@param id? integer
---@return GameId
function ItemPrefabManager.AddModItem(guid, itemPrefab, id) end

---@return UniTask
function ItemPrefabManager.PrepareItems() end

---Base de condicoes de escopo de item usadas por requisitos e elementos dependentes de variaveis.
---@class ItemScopeCondition
ItemScopeCondition = {}

---@overload fun(self: ItemScopeCondition, item: Item): boolean
---@param item Item
---@return boolean
function ItemScopeCondition.IsActive(item) end

---@overload fun(self: ItemScopeCondition): string
---@return string
function ItemScopeCondition.ToLuaString() end

---@overload fun(self: ItemScopeCondition): ItemScopeCondition
---@return ItemScopeCondition
function ItemScopeCondition.Clone() end

---@class ItemScopeConditionAlwaysTrueCondition: ItemScopeCondition
---@field Instance ItemScopeConditionAlwaysTrueCondition
ItemScopeConditionAlwaysTrueCondition = {}

---@return ItemScopeConditionAlwaysTrueCondition
function ItemScopeConditionAlwaysTrueCondition.__new() end

---@overload fun(self: ItemScopeConditionAlwaysTrueCondition, item: Item): boolean
---@param item Item
---@return boolean
function ItemScopeConditionAlwaysTrueCondition.IsActive(item) end

---@overload fun(self: ItemScopeConditionAlwaysTrueCondition): string
---@return string
function ItemScopeConditionAlwaysTrueCondition.ToLuaString() end

---@overload fun(self: ItemScopeConditionAlwaysTrueCondition): ItemScopeCondition
---@return ItemScopeCondition
function ItemScopeConditionAlwaysTrueCondition.Clone() end

---@class ItemScopeConditionCustom: ItemScopeCondition
---@field ConditionFunc fun(arg1: Item): boolean
ItemScopeConditionCustom = {}

---@param conditionFunc fun(arg1: Item): boolean
---@return ItemScopeConditionCustom
function ItemScopeConditionCustom.CreateInstance(conditionFunc) end

---@overload fun(self: ItemScopeConditionCustom, item: Item): boolean
---@param item Item
---@return boolean
function ItemScopeConditionCustom.IsActive(item) end

---@overload fun(self: ItemScopeConditionCustom): string
---@return string
function ItemScopeConditionCustom.ToLuaString() end

---@overload fun(self: ItemScopeConditionCustom): ItemScopeCondition
---@return ItemScopeCondition
function ItemScopeConditionCustom.Clone() end

---Condicao de escopo de item baseada em variavel especial/modificavel.
---@class ItemScopeConditionSpecialVariable: ItemScopeCondition
---@field VariableName string
ItemScopeConditionSpecialVariable = {}

---@param variableName string
---@return ItemScopeConditionSpecialVariable
function ItemScopeConditionSpecialVariable.__new(variableName) end

---Cria uma condicao baseada no nome de uma variavel modificavel do item.
---@param variableName string
---@return ItemScopeConditionSpecialVariable
function ItemScopeConditionSpecialVariable.CreateInstance(variableName) end

---@overload fun(self: ItemScopeConditionSpecialVariable, item: Item): boolean
---@param item Item
---@return boolean
function ItemScopeConditionSpecialVariable.IsActive(item) end

---@overload fun(self: ItemScopeConditionSpecialVariable): string
---@return string
function ItemScopeConditionSpecialVariable.ToLuaString() end

---@overload fun(self: ItemScopeConditionSpecialVariable): ItemScopeCondition
---@return ItemScopeCondition
function ItemScopeConditionSpecialVariable.Clone() end

---@class ItemSlot
---@field IdComparer IComparer
---@field FriendlyName string
---@field Needed ItemSlot[]
---@field NeedThis ItemSlot[]
---@field AllowedMultipleItems boolean
---@field Id string
---@field FriendlyNameSls SimpleLocalizedString
---@field Type SlotType
ItemSlot = {}

---@param id string
---@param friendlyName SimpleLocalizedString
---@param type? SlotType
---@return ItemSlot
function ItemSlot.CreateInstance(id, friendlyName, type) end

---@overload fun(slot: string): boolean
---@param slotType SlotType
---@return boolean
function ItemSlot.IsBotSlot(slotType) end

---@overload fun(self: ItemSlot)
function ItemSlot.AllowMultipleItems() end

---@overload fun(self: ItemSlot, on: ItemSlot)
---@param on ItemSlot
function ItemSlot.MakeDependent(on) end

---@overload fun(self: ItemSlot, slotName: string): boolean
---@param slotName string
---@return boolean
function ItemSlot.IsDependantOn(slotName) end

---@class ItemWithCurrentData
---@field Item Item
---@field Prefab ItemPrefab
---@field ScratchPartData ScratchPartData
---@field ActiveElements string[]
---@field ActiveTextures PackedTexture[]
---@field VanillaActive boolean
ItemWithCurrentData = {}

---@param item Item
---@return ItemWithCurrentData
function ItemWithCurrentData.__new(item) end

---@overload fun(self: ItemWithCurrentData, controller: string)
---@param controller string
function ItemWithCurrentData.UpdateData(controller) end

---@overload fun(self: ItemWithCurrentData)
function ItemWithCurrentData.Dispose() end

---@class Live2DControllerItemModifier
---@field SourceItem Item
Live2DControllerItemModifier = {}

---@overload fun(self: Live2DControllerItemModifier, item: Item)
---@param item Item
function Live2DControllerItemModifier.SetSourceItem(item) end

---@overload fun(self: Live2DControllerItemModifier, live2DController: Live2DController, type: UpdateTexturesFromCurrentlyEquippedTypeEnum)
---@param live2DController Live2DController
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function Live2DControllerItemModifier.Activate(live2DController, type) end

---@overload fun(self: Live2DControllerItemModifier, live2DController: Live2DController, type: UpdateTexturesFromCurrentlyEquippedTypeEnum)
---@param live2DController Live2DController
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function Live2DControllerItemModifier.OnReactivate(live2DController, type) end

---@overload fun(self: Live2DControllerItemModifier, live2DController: Live2DController)
---@param live2DController Live2DController
function Live2DControllerItemModifier.FixedUpdate(live2DController) end

---@overload fun(self: Live2DControllerItemModifier, live2DController: Live2DController)
---@param live2DController Live2DController
function Live2DControllerItemModifier.Deactivate(live2DController) end

---@class ParameterLive2DControllerItemModifier: Live2DControllerItemModifier
---@field SourceItem Item
ParameterLive2DControllerItemModifier = {}

---@param parameters Data[]
---@return ParameterLive2DControllerItemModifier
function ParameterLive2DControllerItemModifier.__new(parameters) end

---@overload fun(self: ParameterLive2DControllerItemModifier, live2DController: Live2DController)
---@param live2DController Live2DController
function ParameterLive2DControllerItemModifier.FixedUpdate(live2DController) end

---@overload fun(self: ParameterLive2DControllerItemModifier, live2DController: Live2DController, type: UpdateTexturesFromCurrentlyEquippedTypeEnum)
---@param live2DController Live2DController
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function ParameterLive2DControllerItemModifier.OnReactivate(live2DController, type) end

---@overload fun(self: ParameterLive2DControllerItemModifier, live2DController: Live2DController, type: UpdateTexturesFromCurrentlyEquippedTypeEnum)
---@param live2DController Live2DController
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function ParameterLive2DControllerItemModifier.Activate(live2DController, type) end

---@overload fun(self: ParameterLive2DControllerItemModifier, live2DController: Live2DController)
---@param live2DController Live2DController
function ParameterLive2DControllerItemModifier.Deactivate(live2DController) end

---@class Shop: SerializedPart_String__ShopPrefab_
---@field ShopItems ShopItem[]
---@field Name string
---@field MoneySpent integer
---@field ItemsBought integer
---@field Key string
---@field Id string
---@field Prefab ShopPrefab
Shop = {}

---@overload fun(id: string, prefab: ShopPrefab): Shop
---@return Shop
function Shop.__new() end

---@overload fun(self: Shop)
function Shop.Clear() end

---@overload fun(self: Shop, item: ShopItem, count: integer): integer
---@overload fun(self: Shop, item: ShopItem): integer
---@param item ShopItem
---@param count? integer
---@return integer
function Shop.GetPrice(item, count) end

---@overload fun(self: Shop, item: ShopItem)
---@param item ShopItem
function Shop.AddItem(item) end

---@overload fun(self: Shop, originalId: Guid, shopItemOut: ShopItem): boolean
---@param originalId Guid
---@param shopItemOut ShopItem
---@return boolean
function Shop.TryGetItemByGuid(originalId, shopItemOut) end

---@overload fun(self: Shop, gameId: GameId): integer
---@param gameId GameId
---@return integer
function Shop.GetCompensationData(gameId) end

---@overload fun(self: Shop)
function Shop.ShuffleShop() end

---@overload fun(self: Shop, shopItem: ShopItem, count: integer, OnPaid: fun(arg1: integer), OnNotBuy: fun(), OnNoMoney: fun())
---@overload fun(self: Shop, shopItem: ShopItem, count: integer, OnPaid: fun(arg1: integer), OnNotBuy: fun())
---@overload fun(self: Shop, shopItem: ShopItem, count: integer, OnPaid: fun(arg1: integer))
---@param shopItem ShopItem
---@param count integer
---@param OnPaid fun(arg1: integer)
---@param OnNotBuy? fun()
---@param OnNoMoney? fun()
function Shop.ShowBuyPopup(shopItem, count, OnPaid, OnNotBuy, OnNoMoney) end

---@overload fun(self: Shop, shopItem: ShopItem, count: integer, pricePaid: integer): Item
---@param shopItem ShopItem
---@param count integer
---@param pricePaid integer
---@return Item
function Shop.BuyItem(shopItem, count, pricePaid) end

---@class ShopDictionary
---@field Count integer
---@field Keys string[]
---@field Values Shop[]
ShopDictionary = {}

---@return ShopDictionary
function ShopDictionary.__new() end

---@class ShopItem
---@field Item Item
---@field ItemType ShopItemType
ShopItem = {}

---@param item Item
---@param itemType ShopItemType
---@return ShopItem
function ShopItem.__new(item, itemType) end

---@overload fun(self: ShopItem, count: integer): Item
---@overload fun(self: ShopItem): Item
---@param count? integer
---@return Item
function ShopItem.CloneTargetItem(count) end

---@class ShopManager
ShopManager = {}

---@return ShopManager
function ShopManager.CreateInstance() end

---@overload fun(self: ShopManager, name: string, shop: Shop): boolean
---@param name string
---@param shop Shop
---@return boolean
function ShopManager.TryGetShop(name, shop) end

---Retorna shop.
---@overload fun(self: ShopManager, name: string): Shop
---@param name string
---@return Shop
function ShopManager.GetShop(name) end

---@overload fun(self: ShopManager, name: string): ShopItem[]
---@param name string
---@return ShopItem[]
function ShopManager.GetItems(name) end

---@overload fun(self: ShopManager)
function ShopManager.ShuffleShops() end

---@overload fun(self: ShopManager)
function ShopManager.OnBeforeSerialize() end

---@overload fun(self: ShopManager)
function ShopManager.OnAfterDeserialize() end

---@overload fun(self: ShopManager)
function ShopManager.FillPrefabData() end

---Dados modernos de equipamento/slot para ItemPrefab, incluindo slots possiveis, obrigatorios e proibidos.
---@class SlotEquipData
---@field IsValidSlot boolean
---@field TargetSlot ItemSlot
---Nome textual do slot alvo onde o item sera equipado.
---@field TargetSlotString MdrgKnownEquipmentSlotId|string
---Elementos especificos do controller que este item substitui ou ativa.
---@field ControllerElementOverride (MdrgKnownControllerElementOverride|string)[]
---Condicoes que controlam a ativacao de elementos visuais.
---@field ElementActiveConditions ItemScopeCondition[]
---Condicoes que controlam a ativacao de texturas.
---@field TextureActiveConditions ItemScopeCondition[]
---@field RequiredSlots HashSet
---@field ForbiddenSlots HashSet
SlotEquipData = {}

---@return SlotEquipData
function SlotEquipData.__new() end

---Cria dados de slot/equipamento; quando informado, define o slot alvo do item.
---@param slotString? MdrgKnownEquipmentSlotId|string
---@return SlotEquipData
function SlotEquipData.CreateInstance(slotString) end

---@overload fun(self: SlotEquipData, itemWithCurrentData: ItemWithCurrentData, controllerEnumId: string)
---@param itemWithCurrentData ItemWithCurrentData
---@param controllerEnumId string
function SlotEquipData.FillCurrent(itemWithCurrentData, controllerEnumId) end

---@overload fun(bodySizeModuleSlots: ItemSlot[]): boolean
---@overload fun(slot1: ItemSlot, slot2: ItemSlot): boolean
---@overload fun(slot1: ItemSlot, slot2: ItemSlot, slot3: ItemSlot): boolean
---@overload fun(self: SlotEquipData, slot1: ItemSlot): boolean
---@overload fun(self: SlotEquipData, bodySizeModuleSlots: ItemSlot[]): boolean
---@overload fun(self: SlotEquipData, slot1: ItemSlot, slot2: ItemSlot): boolean
---@overload fun(self: SlotEquipData, slot1: ItemSlot, slot2: ItemSlot, slot3: ItemSlot): boolean
---@param slot1 ItemSlot
---@return boolean
function SlotEquipData.CanGoInto(slot1) end

---@overload fun(self: SlotEquipData, requiredSlot: string)
---@param requiredSlot string
function SlotEquipData.AddRequiredSlotString(requiredSlot) end

---@overload fun(self: SlotEquipData, requiredSlots: string[])
---@param requiredSlots string[]
function SlotEquipData.AddRequiredSlotsString(requiredSlots) end

---Define os slots que precisam estar presentes ou compativeis para este equipamento.
---@overload fun(self: SlotEquipData, requiredSlots: (MdrgKnownEquipmentSlotId|string)[])
---@param requiredSlots (MdrgKnownEquipmentSlotId|string)[]
function SlotEquipData.SetRequiredSlotsString(requiredSlots) end

---@overload fun(self: SlotEquipData, forbiddenSlot: string)
---@param forbiddenSlot string
function SlotEquipData.AddForbiddenSlotString(forbiddenSlot) end

---@overload fun(self: SlotEquipData, forbiddenSlots: string[])
---@param forbiddenSlots string[]
function SlotEquipData.AddForbiddenSlotsString(forbiddenSlots) end

---Define os slots incompativeis ou proibidos para este equipamento.
---@overload fun(self: SlotEquipData, forbiddenSlots: (MdrgKnownEquipmentSlotId|string)[])
---@param forbiddenSlots (MdrgKnownEquipmentSlotId|string)[]
function SlotEquipData.SetForbiddenSlotsString(forbiddenSlots) end

---@overload fun(self: SlotEquipData, elements: string[]): string[]
---@param elements string[]
---@return string[]
function SlotEquipData.FillActiveElementsDefaultPooled(elements) end

---@overload fun(self: SlotEquipData, output: string[])
---@param output string[]
function SlotEquipData.FillActiveElementsDefault(output) end

---@overload fun(self: SlotEquipData): string
---@return string
function SlotEquipData.ToLuaString() end

---@overload fun(self: SlotEquipData): SlotEquipData
---@return SlotEquipData
function SlotEquipData.Clone() end

---Modificador de cobertura/suspeita associado a areas visuais de um item.
---@class SusModifier
---@field Area SusArea
---@field Modifier number
SusModifier = {}

---@param area SusArea
---@param coverPercentage number
---@return SusModifier
function SusModifier.CreateInstance(area, coverPercentage) end

---@overload fun(self: SusModifier): SusModifier
---@return SusModifier
function SusModifier.Clone() end

---@overload fun(self: SusModifier): string
---@return string
function SusModifier.ToLuaString() end

---@class TailLive2DControllerItemModifier: Live2DControllerItemModifier
---@field SourceItem Item
TailLive2DControllerItemModifier = {}

---@param speedMulti number
---@return TailLive2DControllerItemModifier
function TailLive2DControllerItemModifier.__new(speedMulti) end

---@overload fun(self: TailLive2DControllerItemModifier, live2DController: Live2DController)
---@param live2DController Live2DController
function TailLive2DControllerItemModifier.FixedUpdate(live2DController) end

---@overload fun(self: TailLive2DControllerItemModifier, live2DController: Live2DController, type: UpdateTexturesFromCurrentlyEquippedTypeEnum)
---@param live2DController Live2DController
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function TailLive2DControllerItemModifier.Activate(live2DController, type) end

---@overload fun(self: TailLive2DControllerItemModifier, live2DController: Live2DController)
---@param live2DController Live2DController
function TailLive2DControllerItemModifier.Deactivate(live2DController) end

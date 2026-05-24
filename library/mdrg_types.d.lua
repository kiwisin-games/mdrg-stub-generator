---@meta

-- MDRG MoonSharp Lua API definitions for LuaLS.
-- Generated from docs.txt and curated data/*.json.
-- These files describe exposed types and signatures only; comments avoid undocumented runtime behavior.

---@class AdditionalDataHolder
---@field slots AdditionalDataSlot[]
AdditionalDataHolder = {}

---@return AdditionalDataHolder
function AdditionalDataHolder.__new() end

---@class AdditionalDataSlot
---@field SlotId string
---@field Data string
AdditionalDataSlot = {}

---@return AdditionalDataSlot
function AdditionalDataSlot.__new() end

---@overload fun(self: AdditionalDataSlot): Color
---@return Color
function AdditionalDataSlot.GetDataAsColor() end

---@overload fun(self: AdditionalDataSlot): AdditionalDataSlot
---@return AdditionalDataSlot
function AdditionalDataSlot.Clone() end

---@class AllDefinedPersonalities
---@field TsunTsunPersonality TsunTsunPersonalityDefinition
---@field CatgirlPersonality CatgirlPersonalityDefinition
---@field DriverPersonality DriverPersonalityDefinition
---@field RobotPersonality RobotPersonalityDefinition
---@field YanderePersonality YanderePersonalityDefinition
---@field SlutPersonality SlutPersonalityDefinition
---@field FemcelPersonality FemcelPersonalityDefinition
---@field HimederePersonality HimederePersonalityDefinition
---@field SillyCatPersonality SillyCatPersonalityDefinition
---@field AraAraPersonality AraAraPersonalityDefinition
AllDefinedPersonalities = {}

---@param storySingleton StorySingleton
---@return AllDefinedPersonalities
function AllDefinedPersonalities.__new(storySingleton) end

---@class AltBackgroundsContainer
---@field Bat_Banner SerializableAutomaticReference
---@field Ghost_Background SerializableAutomaticReference
---@field Pumpkin_Mat SerializableAutomaticReference
---@field SpiderPlushy SerializableAutomaticReference
---@field Blink_Halloween SerializableAutomaticReference
---@field Decoration_Halloween SerializableAutomaticReference
---@field Halloween_Cat SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
AltBackgroundsContainer = {}

---@return AltBackgroundsContainer
function AltBackgroundsContainer.__new() end

---@class AndCondition: StoryCondition
---@field Operands StoryCondition[]
AndCondition = {}

---@param operands StoryCondition[]
---@param negate boolean
---@return AndCondition
function AndCondition.__new(operands, negate) end

---@overload fun(self: AndCondition): string
---@return string
function AndCondition.Explain() end

---@overload fun(self: AndCondition): string
---@return string
function AndCondition.GenerateCode() end

---@overload fun(obj: any): boolean
---@overload fun(self: AndCondition, other: AndCondition): boolean
---@overload fun(self: AndCondition, obj: any): boolean
---@param other AndCondition
---@return boolean
function AndCondition.Equals(other) end

---@overload fun(self: AndCondition): integer
---@return integer
function AndCondition.GetHashCode() end

---@class AnonWrapper
AnonWrapper = {}

---@return AnonWrapper
function AnonWrapper.__new() end

---@class AraAraPersonalityDefinition: ConversationContainerPersonalityModuleDefinition_AraAraPersonalityModuleConversations_
AraAraPersonalityDefinition = {}

---@param storySingleton StorySingleton
---@return AraAraPersonalityDefinition
function AraAraPersonalityDefinition.__new(storySingleton) end

---@class ArtistsContainer
---@field Celestyn SerializableAutomaticReference
---@field Debussy SerializableAutomaticReference
---@field DreemChxsr SerializableAutomaticReference
---@field FlowerKidV SerializableAutomaticReference
---@field Kaedo SerializableAutomaticReference
---@field Kukidoe SerializableAutomaticReference
---@field LightM SerializableAutomaticReference
---@field Mad_Joram SerializableAutomaticReference
---@field Nitrori SerializableAutomaticReference
---@field Rad_Pechi SerializableAutomaticReference
---@field RottingSteel SerializableAutomaticReference
---@field Sheep SerializableAutomaticReference
---@field SJ68 SerializableAutomaticReference
---@field SMYLexclamation SerializableAutomaticReference
---@field Toni_S SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
ArtistsContainer = {}

---@return ArtistsContainer
function ArtistsContainer.__new() end

---@class BlowjobCockInsertionFuckAxis: InsertionHandlerFuckAxis
---@field IsInside boolean
---@field IsAfterOutside boolean
---@field CurrentDepth number
---@field Owner InsertionHandler
---@field Controller Live2DController
---@field FuckingSpeedSum number
---@field FuckingSpeedThrust number
---@field FuckingSpeedReciprocating number
BlowjobCockInsertionFuckAxis = {}

---@param controller Live2DBlowjobController
---@return BlowjobCockInsertionFuckAxis
function BlowjobCockInsertionFuckAxis.__new(controller) end

---@overload fun(self: BlowjobCockInsertionFuckAxis, penisInfo: IPenisInfo)
---@param penisInfo IPenisInfo
function BlowjobCockInsertionFuckAxis.Start(penisInfo) end

---@overload fun(self: BlowjobCockInsertionFuckAxis): IPenisInfo
---@return IPenisInfo
function BlowjobCockInsertionFuckAxis.GetPenisInfo() end

---@overload fun(self: BlowjobCockInsertionFuckAxis): number
---@return number
function BlowjobCockInsertionFuckAxis.GetAngleX() end

---@overload fun(self: BlowjobCockInsertionFuckAxis): number
---@return number
function BlowjobCockInsertionFuckAxis.GetAngleY() end

---@overload fun(self: BlowjobCockInsertionFuckAxis)
function BlowjobCockInsertionFuckAxis.Reset() end

---@overload fun(self: BlowjobCockInsertionFuckAxis): boolean
---@return boolean
function BlowjobCockInsertionFuckAxis.CanThrustForward() end

---@overload fun(self: BlowjobCockInsertionFuckAxis): boolean
---@return boolean
function BlowjobCockInsertionFuckAxis.CanThrustBackwards() end

---@overload fun(self: BlowjobCockInsertionFuckAxis)
function BlowjobCockInsertionFuckAxis.Update() end

---@overload fun(self: BlowjobCockInsertionFuckAxis)
function BlowjobCockInsertionFuckAxis.FixedUpdate() end

---@overload fun(self: BlowjobCockInsertionFuckAxis): number
---@return number
function BlowjobCockInsertionFuckAxis.GetCurrentRealInsertionPosition() end

---@overload fun(self: BlowjobCockInsertionFuckAxis): number
---@return number
function BlowjobCockInsertionFuckAxis.GetCurrentInsertionPosition() end

---@overload fun(self: BlowjobCockInsertionFuckAxis)
function BlowjobCockInsertionFuckAxis.ResetAccumulatedMovementToCurrentPosition() end

---@overload fun(self: BlowjobCockInsertionFuckAxis, direction: number)
---@param direction number
function BlowjobCockInsertionFuckAxis.ThrustBot(direction) end

---@class Burst
---@field time number
---@field count MinMaxCurve
---@field cycleCount integer
---@field repeatInterval number
---@field probability number
Burst = {}

---@return Burst
function Burst.__new() end

---@class CardsCasinoContainer
---@field _50 SerializableAutomaticReference
---@field _51 SerializableAutomaticReference
---@field _32 SerializableAutomaticReference
---@field _43 SerializableAutomaticReference
---@field _33 SerializableAutomaticReference
---@field _42 SerializableAutomaticReference
---@field _30 SerializableAutomaticReference
---@field _41 SerializableAutomaticReference
---@field _31 SerializableAutomaticReference
---@field _25 SerializableAutomaticReference
---@field _40 SerializableAutomaticReference
---@field _36 SerializableAutomaticReference
---@field _24 SerializableAutomaticReference
---@field _47 SerializableAutomaticReference
---@field _37 SerializableAutomaticReference
---@field _27 SerializableAutomaticReference
---@field _46 SerializableAutomaticReference
---@field _34 SerializableAutomaticReference
---@field _26 SerializableAutomaticReference
---@field _45 SerializableAutomaticReference
---@field _35 SerializableAutomaticReference
---@field _21 SerializableAutomaticReference
---@field _44 SerializableAutomaticReference
---@field _20 SerializableAutomaticReference
---@field _23 SerializableAutomaticReference
---@field _38 SerializableAutomaticReference
---@field _22 SerializableAutomaticReference
---@field _49 SerializableAutomaticReference
---@field _39 SerializableAutomaticReference
---@field _48 SerializableAutomaticReference
---@field _29 SerializableAutomaticReference
---@field _28 SerializableAutomaticReference
---@field cardBackWhite SerializableAutomaticReference
---@field _18 SerializableAutomaticReference
---@field _19 SerializableAutomaticReference
---@field _14 SerializableAutomaticReference
---@field _15 SerializableAutomaticReference
---@field _16 SerializableAutomaticReference
---@field _17 SerializableAutomaticReference
---@field _10 SerializableAutomaticReference
---@field _11 SerializableAutomaticReference
---@field _12 SerializableAutomaticReference
---@field _13 SerializableAutomaticReference
---@field _5 SerializableAutomaticReference
---@field _4 SerializableAutomaticReference
---@field _7 SerializableAutomaticReference
---@field _6 SerializableAutomaticReference
---@field _1 SerializableAutomaticReference
---@field cardBackBlack SerializableAutomaticReference
---@field _0 SerializableAutomaticReference
---@field _3 SerializableAutomaticReference
---@field _2 SerializableAutomaticReference
---@field _9 SerializableAutomaticReference
---@field _8 SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
CardsCasinoContainer = {}

---@return CardsCasinoContainer
function CardsCasinoContainer.__new() end

---@class CardsMainContainer
---@field CardBack SerializableAutomaticReference
---@field CardShadow SerializableAutomaticReference
---@field Clovers_2_white SerializableAutomaticReference
---@field Clovers_3_white SerializableAutomaticReference
---@field Clovers_4_white SerializableAutomaticReference
---@field Clovers_5_white SerializableAutomaticReference
---@field Clovers_6_white SerializableAutomaticReference
---@field Clovers_7_white SerializableAutomaticReference
---@field Clovers_8_white SerializableAutomaticReference
---@field Clovers_9_white SerializableAutomaticReference
---@field Clovers_10_white SerializableAutomaticReference
---@field Clovers_A_white SerializableAutomaticReference
---@field Clovers_Jack_white SerializableAutomaticReference
---@field Clovers_King_white SerializableAutomaticReference
---@field Clovers_Queen_white SerializableAutomaticReference
---@field Hearts_2_white SerializableAutomaticReference
---@field Hearts_3_white SerializableAutomaticReference
---@field Hearts_4_white SerializableAutomaticReference
---@field Hearts_5_white SerializableAutomaticReference
---@field Hearts_6_white SerializableAutomaticReference
---@field Hearts_7_white SerializableAutomaticReference
---@field Hearts_8_white SerializableAutomaticReference
---@field Hearts_9_white SerializableAutomaticReference
---@field Hearts_10_white SerializableAutomaticReference
---@field Hearts_A_white SerializableAutomaticReference
---@field Hearts_Jack_white SerializableAutomaticReference
---@field Hearts_King_white SerializableAutomaticReference
---@field Hearts_Queen_white SerializableAutomaticReference
---@field Pikes_2_white SerializableAutomaticReference
---@field Pikes_3_white SerializableAutomaticReference
---@field Pikes_4_white SerializableAutomaticReference
---@field Pikes_5_white SerializableAutomaticReference
---@field Pikes_6_white SerializableAutomaticReference
---@field Pikes_7_white SerializableAutomaticReference
---@field Pikes_8_white SerializableAutomaticReference
---@field Pikes_9_white SerializableAutomaticReference
---@field Pikes_10_white SerializableAutomaticReference
---@field Pikes_A_white SerializableAutomaticReference
---@field Pikes_Jack_white SerializableAutomaticReference
---@field Pikes_King_white SerializableAutomaticReference
---@field Pikes_Queen_white SerializableAutomaticReference
---@field Tiles_2_white SerializableAutomaticReference
---@field Tiles_3_white SerializableAutomaticReference
---@field Tiles_4_white SerializableAutomaticReference
---@field Tiles_5_white SerializableAutomaticReference
---@field Tiles_6_white SerializableAutomaticReference
---@field Tiles_7_white SerializableAutomaticReference
---@field Tiles_8_white SerializableAutomaticReference
---@field Tiles_9_white SerializableAutomaticReference
---@field Tiles_10_white SerializableAutomaticReference
---@field Tiles_A_white SerializableAutomaticReference
---@field Tiles_Jack_white SerializableAutomaticReference
---@field Tiles_King_white SerializableAutomaticReference
---@field Tiles_Queen_white SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
CardsMainContainer = {}

---@return CardsMainContainer
function CardsMainContainer.__new() end

---@class CatgirlPersonalityDefinition: ConversationContainerPersonalityModuleDefinition_CatgirlPersonalityModuleConversations_
CatgirlPersonalityDefinition = {}

---@param storySingleton StorySingleton
---@return CatgirlPersonalityDefinition
function CatgirlPersonalityDefinition.__new(storySingleton) end

---@class CharArrayConsoleLine: ConsoleLine
---@field PrintType CharArrayPrintTypesEnum
---@field Colors Color32[]
---@field HasTextInfoProcessing boolean
---@field Width integer
---@field Height integer
---@field CharArray string[]
---@field LoadedChar string
---@field NotLoadedChar string
CharArrayConsoleLine = {}

---@overload fun(width: integer, printType: CharArrayPrintTypesEnum): CharArrayConsoleLine
---@overload fun(charArray: string[], width: integer, height: integer, printType: CharArrayPrintTypesEnum): CharArrayConsoleLine
---@param charArray string[]
---@return CharArrayConsoleLine
function CharArrayConsoleLine.__new(charArray) end

---@overload fun(startIndex: integer, endIndex: integer, percent: number, loadedChar: string, notLoadedChar: string)
---@overload fun(startIndex: integer, endIndex: integer, percent: number, loadedChar: string)
---@overload fun(startIndex: integer, endIndex: integer, percent: number)
---@overload fun(self: CharArrayConsoleLine, percent: number, loadedChar: string, notLoadedChar: string)
---@overload fun(self: CharArrayConsoleLine, percent: number, loadedChar: string)
---@overload fun(self: CharArrayConsoleLine, percent: number)
---@overload fun(self: CharArrayConsoleLine, startIndex: integer, endIndex: integer, percent: number, loadedChar: string, notLoadedChar: string)
---@overload fun(self: CharArrayConsoleLine, startIndex: integer, endIndex: integer, percent: number, loadedChar: string)
---@overload fun(self: CharArrayConsoleLine, startIndex: integer, endIndex: integer, percent: number)
---@param percent number
---@param loadedChar? string
---@param notLoadedChar? string
function CharArrayConsoleLine.SetAsProgress(percent, loadedChar, notLoadedChar) end

---@overload fun(self: CharArrayConsoleLine, linkIndex: integer, _consoleText: TextMeshProUGUI)
---@param linkIndex integer
---@param _consoleText TextMeshProUGUI
function CharArrayConsoleLine.DoTextInfoProcessing(linkIndex, _consoleText) end

---@overload fun(self: CharArrayConsoleLine, popup: BotStatusAppPopup): integer
---@param popup BotStatusAppPopup
---@return integer
function CharArrayConsoleLine.GetApproximateLineCount(popup) end

---@overload fun(self: CharArrayConsoleLine, consoleStringBuilder: StringBuilder, _popup: BotStatusAppPopup)
---@param consoleStringBuilder StringBuilder
---@param _popup BotStatusAppPopup
function CharArrayConsoleLine.PrintTo(consoleStringBuilder, _popup) end

---@class CockTwitchManager: GameVariablesSubClass
---@field FollowerMemory integer[]
---@field RelatedGameVariables GameVariables
CockTwitchManager = {}

---@return CockTwitchManager
function CockTwitchManager.__new() end

---@return CockTwitchManager
function CockTwitchManager.CreateInstance() end

---@param num integer
---@return string
function CockTwitchManager.FormatViewers(num) end

---@overload fun(self: CockTwitchManager)
function CockTwitchManager.InitializeNewGame() end

---@overload fun(self: CockTwitchManager, count: integer): StreamInfo[]
---@overload fun(self: CockTwitchManager): StreamInfo[]
---@param count? integer
---@return StreamInfo[]
function CockTwitchManager.GetActiveStreamers(count) end

---@overload fun(self: CockTwitchManager, count: integer): Streamer[]
---@param count integer
---@return Streamer[]
function CockTwitchManager.GetTopStreamers(count) end

---@overload fun(self: CockTwitchManager)
function CockTwitchManager.MinutePassed() end

---@overload fun(self: CockTwitchManager)
function CockTwitchManager.EndOfDay() end

---@overload fun(self: CockTwitchManager, dayOfTheWeek: integer, hour: integer): number
---@param dayOfTheWeek integer
---@param hour integer
---@return number
function CockTwitchManager.CalculateViewerShipTimeMultiplier(dayOfTheWeek, hour) end

---@overload fun(self: CockTwitchManager)
function CockTwitchManager.OnBeforeSerialize() end

---@overload fun(self: CockTwitchManager)
function CockTwitchManager.OnAfterDeserialize() end

---@class CocktractManager: GameVariablesSubClass
---@field CurrentCocktractContract CocktractContract
---@field HasActiveContract boolean
---@field AllContracts CocktractContract[]
---@field GlobalRespect number
---@field CocktractPartners CocktractPartner[]
---@field PartnersInitialized boolean
---@field CocktractsUnlocked boolean
---@field RelatedGameVariables GameVariables
---@field AvailableContracts CocktractContract[]
---@field TargetAvailableContractCount integer
---@field CurrentContracts CocktractContract[]
---@field PastContracts CocktractContract[]
CocktractManager = {}

---@return CocktractManager
function CocktractManager.__new() end

---@return CocktractManager
function CocktractManager.CreateInstance() end

---@overload fun(self: CocktractManager, contract: CocktractContract)
---@param contract CocktractContract
function CocktractManager.AddPastContract(contract) end

---@overload fun(self: CocktractManager, cocktractContract: CocktractContract): ValueTuple
---@param cocktractContract CocktractContract
---@return ValueTuple
function CocktractManager.GetSource(cocktractContract) end

---@overload fun(self: CocktractManager, source: string, index: integer, cocktractContract: CocktractContract): boolean
---@param source string
---@param index integer
---@param cocktractContract CocktractContract
---@return boolean
function CocktractManager.TryGetContract(source, index, cocktractContract) end

---@overload fun(self: CocktractManager)
function CocktractManager.ShowCurrentContract() end

---@overload fun(self: CocktractManager, cocktractContract: CocktractContract)
---@param cocktractContract CocktractContract
function CocktractManager.AcceptContract(cocktractContract) end

---@overload fun(self: CocktractManager, cocktractContract: CocktractContract)
---@param cocktractContract CocktractContract
function CocktractManager.RejectContract(cocktractContract) end

---@overload fun(self: CocktractManager, cocktractContract: CocktractContract)
---@param cocktractContract CocktractContract
function CocktractManager.AbandonContract(cocktractContract) end

---@overload fun(self: CocktractManager, cocktractContract: CocktractContract)
---@param cocktractContract CocktractContract
function CocktractManager.CompleteContract(cocktractContract) end

---@overload fun(self: CocktractManager, respect: number)
---@param respect number
function CocktractManager.AddRespect(respect) end

---@overload fun(self: CocktractManager)
function CocktractManager.FillPrefabData() end

---@overload fun(self: CocktractManager, key: string, partner: CocktractPartner): boolean
---@param key string
---@param partner CocktractPartner
---@return boolean
function CocktractManager.TryGetPartnerById(key, partner) end

---@overload fun(self: CocktractManager)
function CocktractManager.UpdatePartners() end

---@overload fun(self: CocktractManager)
function CocktractManager.GenerateAllContracts() end

---@overload fun(self: CocktractManager, multi: number): integer
---@param multi number
---@return integer
function CocktractManager.GenerateRandomMoneyReward(multi) end

---@overload fun(self: CocktractManager)
function CocktractManager.HourlyUpdate() end

---@overload fun(self: CocktractManager)
function CocktractManager.EndOfDay() end

---@class CommonConditionsContainer
---@field SympathyDetest DataCondition
---@field SympathyHate DataCondition
---@field SympathyDislike DataCondition
---@field SympathyPositive DataCondition
---@field LikeStart integer
---@field AffectionStart integer
---@field LoveStart integer
---@field SuperLoveStart integer
---@field NotHorny DataCondition
---@field Horny DataCondition
---@field VeryHorny DataCondition
---@field NoLust DataCondition
---@field HighLust DataCondition
---@field VeryHighLust DataCondition
---@field ExtremelyLust DataCondition
---@field SympathyLike DataCondition
---@field SympathyAffection DataCondition
---@field SympathyLove DataCondition
---@field SympathySuperLove DataCondition
---@field SympathyBeforeLikeOnly DataCondition
---@field SympathyLikeOnly DataCondition
---@field SympathyAffectionOnly DataCondition
---@field SympathyLoveOnly DataCondition
---@field SympathySuperLoveOnly DataCondition
---@field ItsEvening DataCondition
---@field ItsNight DataCondition
---@field ItsMorning DataCondition
---@field ItsDay DataCondition
---@field ItsNotNight DataCondition
---@field LandlordNotAsleep DataCondition
---@field LateAtNight DataCondition
---@field NotLateAtNight DataCondition
---@field LandlordKnowsAboutBot StoryCondition
---@field LandlordKnowsBotIsYourGirlfriend StoryCondition
---@field FisherAtMicroplasticCoast DataCondition
---@field LowMentalHealth DataCondition
---@field RiotsActive DataCondition
---@field RiotsNotActive DataCondition
---@field RiotsEndingSoon DataCondition
---@field AfterRiots DataCondition
---@field SleepTogetherUnlocked FlagConditionBasic
---@field EverStartedStream StoryCondition
---@field CanStartStream StoryCondition
---@field FreshTime integer
---@field UsuallyLeavesCumAfterSex DataCondition
---@field UsuallyCleansCumAfterSex DataCondition
---@field VeryHighLonging DataCondition
---@field EnoughNutForSex DataCondition
---@field CanDoCowgirl DataCondition
---@field RecentlyWokeUp DataCondition
---@field RecentlySex DataCondition
---@field LastSleptWithBot DataCondition
---@field LastSleptAlone DataCondition
---@field IsBotSmart DataCondition
---@field EverFuckedBot DataCondition
---@field Melissa4Before5 AndCondition
---@field Melissa4Before5NotRejection AndCondition
---@field Melissa5Done FlagConditionSpecialWithTime
---@field Melissa5NotDone FlagConditionSpecialWithTime
---@field MelissaRejection StoryCondition
---@field MelissaAlive StoryCondition
---@field MelissaNotInShop StoryCondition
---@field MelissaAnyEnding StoryCondition
---@field AnnalieRunwayReady StoryCondition
---@field ChurchAnyEndingDone StoryCondition
---@field JoinUsDAKDanger StoryCondition
---@field CanGoOutsideWithBot StoryCondition
---@field HasTheOptionToGoOutsideWithBot StoryCondition
---@field HasLegsAndOneArm StoryCondition
---@field MadeNoiseLastSex StoryCondition
---@field CanStartIslandEnding StoryCondition
---@field CanStartPoorReturnHomeFoodEvent StoryCondition
---@field CanStartAnyReturnHomeFoodEvent StoryCondition
---@field BotMetAnnalie StoryCondition
---@field HasAnnalieHairstyle StoryCondition
---@field CanBotStartDateFromRoom StoryCondition
CommonConditionsContainer = {}

---@return CommonConditionsContainer
function CommonConditionsContainer.__new() end

---@class ConsoleLine
---@field HasTextInfoProcessing boolean
ConsoleLine = {}

---@overload fun(self: ConsoleLine, popup: BotStatusAppPopup): integer
---@param popup BotStatusAppPopup
---@return integer
function ConsoleLine.GetApproximateLineCount(popup) end

---@overload fun(self: ConsoleLine, linkIndex: integer, _consoleText: TextMeshProUGUI)
---@param linkIndex integer
---@param _consoleText TextMeshProUGUI
function ConsoleLine.DoTextInfoProcessing(linkIndex, _consoleText) end

---@overload fun(self: ConsoleLine, consoleStringBuilder: StringBuilder, _popup: BotStatusAppPopup)
---@param consoleStringBuilder StringBuilder
---@param _popup BotStatusAppPopup
function ConsoleLine.PrintTo(consoleStringBuilder, _popup) end

---@overload fun(sb: StringBuilder): ConsoleLine
---@param s string
---@return ConsoleLine
function ConsoleLine.__toConsoleLine(s) end

---@class ConstCondition: StoryCondition
ConstCondition = {}

---@param negate boolean
---@return ConstCondition
function ConstCondition.__new(negate) end

---@overload fun(self: ConstCondition): string
---@return string
function ConstCondition.Explain() end

---@overload fun(self: ConstCondition): string
---@return string
function ConstCondition.GenerateCode() end

---@overload fun(obj: any): boolean
---@overload fun(self: ConstCondition, other: ConstCondition): boolean
---@overload fun(self: ConstCondition, obj: any): boolean
---@param other ConstCondition
---@return boolean
function ConstCondition.Equals(other) end

---@overload fun(self: ConstCondition): integer
---@return integer
function ConstCondition.GetHashCode() end

---@class CowgirlCockInsertionFuckAxis: InsertionHandlerFuckAxis
---@field BotBodyMovementYParameter Live2DParameter
---@field ThrustParameter Live2DParameter
---@field DisableDickAngle boolean
---@field IsInsideCowgirl boolean
---@field IsInside boolean
---@field IsAfterOutside boolean
---@field Owner InsertionHandler
---@field Controller Live2DController
---@field FuckingSpeedSum number
---@field FuckingSpeedThrust number
---@field FuckingSpeedReciprocating number
CowgirlCockInsertionFuckAxis = {}

---@param cowgirlController Live2DCowgirlController
---@param botBodyMovementYParameter Live2DParameter
---@param paramCockInside Live2DParameter
---@param thrustParameter Live2DParameter
---@param dickAngleYParameter Live2DParameter
---@param dickAngleXParameter Live2DParameter
---@return CowgirlCockInsertionFuckAxis
function CowgirlCockInsertionFuckAxis.__new(cowgirlController, botBodyMovementYParameter, paramCockInside, thrustParameter, dickAngleYParameter, dickAngleXParameter) end

---@overload fun(self: CowgirlCockInsertionFuckAxis)
function CowgirlCockInsertionFuckAxis.PutInside() end

---@overload fun(self: CowgirlCockInsertionFuckAxis, penisInfo: IPenisInfo)
---@param penisInfo IPenisInfo
function CowgirlCockInsertionFuckAxis.Start(penisInfo) end

---@overload fun(self: CowgirlCockInsertionFuckAxis): IPenisInfo
---@return IPenisInfo
function CowgirlCockInsertionFuckAxis.GetPenisInfo() end

---@overload fun(self: CowgirlCockInsertionFuckAxis): number
---@return number
function CowgirlCockInsertionFuckAxis.GetAngleX() end

---@overload fun(self: CowgirlCockInsertionFuckAxis): number
---@return number
function CowgirlCockInsertionFuckAxis.GetAngleY() end

---@overload fun(self: CowgirlCockInsertionFuckAxis)
function CowgirlCockInsertionFuckAxis.Reset() end

---@overload fun(self: CowgirlCockInsertionFuckAxis): boolean
---@return boolean
function CowgirlCockInsertionFuckAxis.CanThrustForward() end

---@overload fun(self: CowgirlCockInsertionFuckAxis): boolean
---@return boolean
function CowgirlCockInsertionFuckAxis.CanThrustBackwards() end

---@overload fun(self: CowgirlCockInsertionFuckAxis)
function CowgirlCockInsertionFuckAxis.Update() end

---@overload fun(self: CowgirlCockInsertionFuckAxis): number
---@return number
function CowgirlCockInsertionFuckAxis.GetCurrentRealInsertionPosition() end

---@overload fun(self: CowgirlCockInsertionFuckAxis): number
---@return number
function CowgirlCockInsertionFuckAxis.GetCurrentInsertionPosition() end

---@overload fun(self: CowgirlCockInsertionFuckAxis)
function CowgirlCockInsertionFuckAxis.ResetAccumulatedMovementToCurrentPosition() end

---@class CreditsTextContainer
---@field Credits SerializableAutomaticReference
---@field Credits2 SerializableAutomaticReference
---@field Credits3 SerializableAutomaticReference
---@field CreditsTranslation SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
CreditsTextContainer = {}

---@return CreditsTextContainer
function CreditsTextContainer.__new() end

---@class Data
Data = {}

---@param floatVariable ItemModifiableVariableFloat01Percent
---@param parameterGetter fun(arg1: Live2DController): Live2DParameter
---@return Data
function Data.__new(floatVariable, parameterGetter) end

---@overload fun(self: Data, controller: Live2DController, sourceItem: Item, type: UpdateTexturesFromCurrentlyEquippedTypeEnum)
---@param controller Live2DController
---@param sourceItem Item
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function Data.Activate(controller, sourceItem, type) end

---@overload fun(self: Data)
function Data.Deactivate() end

---@overload fun(self: Data, controller: Live2DController, sourceItem: Item)
---@param controller Live2DController
---@param sourceItem Item
function Data.ApplyValue(controller, sourceItem) end

---@overload fun(self: Data)
function Data.FinishMove() end

---@class DelegateCondition: StoryCondition
---@field Condition fun(): boolean
DelegateCondition = {}

---@param condition fun(): boolean
---@param negate boolean
---@return DelegateCondition
function DelegateCondition.__new(condition, negate) end

---@overload fun(self: DelegateCondition): string
---@return string
function DelegateCondition.Explain() end

---@overload fun(self: DelegateCondition): string
---@return string
function DelegateCondition.GenerateCode() end

---@overload fun(obj: any): boolean
---@overload fun(self: DelegateCondition, other: DelegateCondition): boolean
---@overload fun(self: DelegateCondition, obj: any): boolean
---@param other DelegateCondition
---@return boolean
function DelegateCondition.Equals(other) end

---@overload fun(self: DelegateCondition): integer
---@return integer
function DelegateCondition.GetHashCode() end

---@class DriverPersonalityDefinition: ConversationContainerPersonalityModuleDefinition_DriverPersonalityModuleConversations_
DriverPersonalityDefinition = {}

---@param storySingleton StorySingleton
---@return DriverPersonalityDefinition
function DriverPersonalityDefinition.__new(storySingleton) end

---@class EmitParams
---@field applyShapeToPosition boolean
---@field velocity Vector3
---@field startLifetime number
EmitParams = {}

---@return EmitParams
function EmitParams.__new() end

---@class FemcelPersonalityDefinition: ConversationContainerPersonalityModuleDefinition_FemcelPersonalityModuleConversations_
FemcelPersonalityDefinition = {}

---@param storySingleton StorySingleton
---@return FemcelPersonalityDefinition
function FemcelPersonalityDefinition.__new(storySingleton) end

---@class Flag
---@field Name string
---@field LastTimeAdded integer
---@field FirstTimeAdded integer
---@field TimesSet integer
Flag = {}

---@param _name string
---@param _firstTimeAdded integer
---@return Flag
function Flag.__new(_name, _firstTimeAdded) end

---@overload fun(self: Flag, time: integer)
---@param time integer
function Flag.Report(time) end

---@overload fun(self: Flag)
function Flag.EnsureValid() end

---@class FlagConditionBasic: StoryCondition
---@field Flag string
FlagConditionBasic = {}

---@param flag string
---@param negate boolean
---@return FlagConditionBasic
function FlagConditionBasic.__new(flag, negate) end

---@overload fun(self: FlagConditionBasic): string
---@return string
function FlagConditionBasic.Explain() end

---@overload fun(self: FlagConditionBasic): string
---@return string
function FlagConditionBasic.GenerateCode() end

---@overload fun(obj: any): boolean
---@overload fun(self: FlagConditionBasic, other: FlagConditionBasic): boolean
---@overload fun(self: FlagConditionBasic, obj: any): boolean
---@param other FlagConditionBasic
---@return boolean
function FlagConditionBasic.Equals(other) end

---@overload fun(self: FlagConditionBasic): integer
---@return integer
function FlagConditionBasic.GetHashCode() end

---@class FlagConditionSpecialWithTime: StoryCondition
FlagConditionSpecialWithTime = {}

---@param flag string
---@param checkType CheckType
---@param timePeriod integer
---@param timeCheck TimeCheckType
---@param negate boolean
---@return FlagConditionSpecialWithTime
function FlagConditionSpecialWithTime.__new(flag, checkType, timePeriod, timeCheck, negate) end

---@overload fun(self: FlagConditionSpecialWithTime): string
---@return string
function FlagConditionSpecialWithTime.Explain() end

---@overload fun(self: FlagConditionSpecialWithTime): string
---@return string
function FlagConditionSpecialWithTime.GenerateCode() end

---@overload fun(obj: any): boolean
---@overload fun(self: FlagConditionSpecialWithTime, other: FlagConditionSpecialWithTime): boolean
---@overload fun(self: FlagConditionSpecialWithTime, obj: any): boolean
---@param other FlagConditionSpecialWithTime
---@return boolean
function FlagConditionSpecialWithTime.Equals(other) end

---@overload fun(self: FlagConditionSpecialWithTime): integer
---@return integer
function FlagConditionSpecialWithTime.GetHashCode() end

---@class FlagConditionWithTime: StoryCondition
FlagConditionWithTime = {}

---@param flag string
---@param timePeriod integer
---@param timeCheck TimeCheckType
---@param negate boolean
---@return FlagConditionWithTime
function FlagConditionWithTime.__new(flag, timePeriod, timeCheck, negate) end

---@overload fun(self: FlagConditionWithTime): string
---@return string
function FlagConditionWithTime.Explain() end

---@overload fun(self: FlagConditionWithTime): string
---@return string
function FlagConditionWithTime.GenerateCode() end

---@overload fun(obj: any): boolean
---@overload fun(self: FlagConditionWithTime, other: FlagConditionWithTime): boolean
---@overload fun(self: FlagConditionWithTime, obj: any): boolean
---@param other FlagConditionWithTime
---@return boolean
function FlagConditionWithTime.Equals(other) end

---@overload fun(self: FlagConditionWithTime): integer
---@return integer
function FlagConditionWithTime.GetHashCode() end

---Fungus flowchart object exposed through the game API.
---@class Flowchart
---@field CachedFlowcharts Flowchart[]
---@field ScrollPos Vector2
---@field VariablesScrollPos Vector2
---@field VariablesExpanded boolean
---@field BlockViewHeight number
---@field Zoom number
---@field ScrollViewRect Rect
---@field SelectedBlock Block
---@field SelectedBlocks Block[]
---@field SelectedCommands Command[]
---@field Variables Variable[]
---@field VariableCount integer
---@field Description string
---@field StepPause number
---@field ColorCommands boolean
---@field SaveSelection boolean
---@field LocalizationId string
---@field ShowLineNumbers boolean
---Fungus Lua environment attached to this flowchart.
---@field LuaEnv LuaEnvironment
---@field LuaBindingName string
---@field CenterPosition Vector2
---@field Version integer
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
---@field SubstituteVariableRegexString string
---@field SubstituteVariableRegex Regex
Flowchart = {}

---@return Flowchart
function Flowchart.__new() end

---@overload fun(self: Flowchart)
function Flowchart.CheckItemIds() end

---@overload fun(self: Flowchart): boolean
---@return boolean
function Flowchart.IsActive() end

---@overload fun(self: Flowchart): string
---@return string
function Flowchart.GetName() end

---@overload fun(self: Flowchart): integer
---@return integer
function Flowchart.NextItemId() end

---@overload fun(self: Flowchart, position: Vector2, blockName: string): Block
---@param position Vector2
---@param blockName string
---@return Block
function Flowchart.CreateBlock(position, blockName) end

---@overload fun(self: Flowchart, blockName: string, block: Block): boolean
---@param blockName string
---@param block Block
---@return boolean
function Flowchart.TryGetBlock(blockName, block) end

---@overload fun(self: Flowchart, blockName: string): boolean
---@param blockName string
---@return boolean
function Flowchart.HasBlock(blockName) end

---@overload fun(self: Flowchart, blockName: string): boolean
---@param blockName string
---@return boolean
function Flowchart.ExecuteIfHasBlock(blockName) end

---@overload fun(block: Block, commandIndex: integer, onComplete: fun()): boolean
---@overload fun(self: Flowchart, blockName: string)
---@overload fun(self: Flowchart, block: Block, commandIndex: integer, onComplete: fun()): boolean
---@param blockName string
function Flowchart.ExecuteBlock(blockName) end

---@overload fun(self: Flowchart, blockName: string)
---@param blockName string
function Flowchart.StopBlock(blockName) end

---@overload fun(self: Flowchart)
function Flowchart.StopAllBlocks() end

---@overload fun(self: Flowchart, originalKey: string, ignoreVariable: Variable): string
---@param originalKey string
---@param ignoreVariable Variable
---@return string
function Flowchart.GetUniqueVariableKey(originalKey, ignoreVariable) end

---@overload fun(self: Flowchart, originalKey: string, ignoreBlock: Block): string
---@param originalKey string
---@param ignoreBlock Block
---@return string
function Flowchart.GetUniqueBlockKey(originalKey, ignoreBlock) end

---@overload fun(self: Flowchart, originalKey: string, ignoreLabel: Label): string
---@param originalKey string
---@param ignoreLabel Label
---@return string
function Flowchart.GetUniqueLabelKey(originalKey, ignoreLabel) end

---@overload fun(self: Flowchart, key: string): Variable
---@param key string
---@return Variable
function Flowchart.GetVariable(key) end

---@overload fun(self: Flowchart, key: string): boolean
---@param key string
---@return boolean
function Flowchart.HasVariable(key) end

---@overload fun(self: Flowchart): string[]
---@return string[]
function Flowchart.GetVariableNames() end

---@overload fun(self: Flowchart): Variable[]
---@return Variable[]
function Flowchart.GetPublicVariables() end

---@overload fun(self: Flowchart, key: string): boolean
---@param key string
---@return boolean
function Flowchart.GetBooleanVariable(key) end

---Define uma variavel booleana em um flowchart Fungus.
---@overload fun(self: Flowchart, key: string, value: boolean)
---@param key string
---@param value boolean
function Flowchart.SetBooleanVariable(key, value) end

---@overload fun(self: Flowchart, key: string): integer
---@param key string
---@return integer
function Flowchart.GetIntegerVariable(key) end

---Define uma variavel inteira em um flowchart Fungus.
---@overload fun(self: Flowchart, key: string, value: integer)
---@param key string
---@param value integer
function Flowchart.SetIntegerVariable(key, value) end

---@overload fun(self: Flowchart, key: string): number
---@param key string
---@return number
function Flowchart.GetFloatVariable(key) end

---@overload fun(self: Flowchart, key: string, value: number)
---@param key string
---@param value number
function Flowchart.SetFloatVariable(key, value) end

---@overload fun(self: Flowchart, key: string): string
---@param key string
---@return string
function Flowchart.GetStringVariable(key) end

---@overload fun(self: Flowchart, key: string, value: string)
---@param key string
---@param value string
function Flowchart.SetStringVariable(key, value) end

---@overload fun(self: Flowchart, key: string): GameObject
---@param key string
---@return GameObject
function Flowchart.GetGameObjectVariable(key) end

---@overload fun(self: Flowchart, key: string, value: GameObject)
---@param key string
---@param value GameObject
function Flowchart.SetGameObjectVariable(key, value) end

---@overload fun(self: Flowchart, key: string): Transform
---@param key string
---@return Transform
function Flowchart.GetTransformVariable(key) end

---@overload fun(self: Flowchart, key: string, value: Transform)
---@param key string
---@param value Transform
function Flowchart.SetTransformVariable(key, value) end

---@overload fun(self: Flowchart)
function Flowchart.UpdateHideFlags() end

---@overload fun(self: Flowchart)
function Flowchart.ClearSelectedCommands() end

---@overload fun(self: Flowchart, command: Command)
---@param command Command
function Flowchart.AddSelectedCommand(command) end

---@overload fun(self: Flowchart)
function Flowchart.ClearSelectedBlocks() end

---@overload fun(self: Flowchart, block: Block)
---@param block Block
function Flowchart.AddSelectedBlock(block) end

---@overload fun(self: Flowchart, block: Block): boolean
---@param block Block
---@return boolean
function Flowchart.DeselectBlock(block) end

---@overload fun(self: Flowchart, b: Block)
---@param b Block
function Flowchart.DeselectBlockNoCheck(b) end

---@overload fun(self: Flowchart)
function Flowchart.UpdateSelectedCache() end

---@overload fun(self: Flowchart)
function Flowchart.ReverseUpdateSelectedCache() end

---@overload fun(self: Flowchart, resetCommands: boolean, resetVariables: boolean)
---@param resetCommands boolean
---@param resetVariables boolean
function Flowchart.Reset(resetCommands, resetVariables) end

---@overload fun(self: Flowchart, commandInfo: CommandInfoAttribute): boolean
---@param commandInfo CommandInfoAttribute
---@return boolean
function Flowchart.IsCommandSupported(commandInfo) end

---@overload fun(self: Flowchart): boolean
---@return boolean
function Flowchart.HasExecutingBlocks() end

---@overload fun(self: Flowchart): Block[]
---@return Block[]
function Flowchart.GetExecutingBlocks() end

---@overload fun(self: Flowchart): Block[]
---@return Block[]
function Flowchart.GetAllBlocks() end

---@overload fun(self: Flowchart, input: string): string
---@param input string
---@return string
function Flowchart.SubstituteVariables(input) end

---@overload fun(self: Flowchart, str: string, vars: Variable[])
---@param str string
---@param vars Variable[]
function Flowchart.DetermineSubstituteVariables(str, vars) end

---@overload fun(self: Flowchart, block: Block)
---@param block Block
function Flowchart.UpdateBlockCommandIndicesNextFrame(block) end

---@class Guid
---@field Empty Guid
Guid = {}

---@overload fun(b: integer[]): Guid
---@overload fun(g: string): Guid
---@overload fun(a: integer, b: integer, c: integer, d: integer, e: integer, f: integer, g: integer, h: integer, i: integer, j: integer, k: integer): Guid
---@return Guid
function Guid.__new() end

---@return Guid
function Guid.NewGuid() end

---@overload fun(input: string[]): Guid
---@param input string
---@return Guid
function Guid.Parse(input) end

---@overload fun(input: string[], result: Guid): boolean
---@param input string
---@param result Guid
---@return boolean
function Guid.TryParse(input, result) end

---@overload fun(input: string[], format: string[], result: Guid): boolean
---@param input string
---@param format string
---@param result Guid
---@return boolean
function Guid.TryParseExact(input, format, result) end

---@overload fun(self: Guid): integer[]
---@return integer[]
function Guid.ToByteArray() end

---@overload fun(format: string): string
---@overload fun(format: string, provider: IFormatProvider): string
---@overload fun(self: Guid): string
---@overload fun(self: Guid, format: string): string
---@overload fun(self: Guid, format: string, provider: IFormatProvider): string
---@return string
function Guid.ToString() end

---@overload fun(self: Guid): integer
---@return integer
function Guid.GetHashCode() end

---@overload fun(g: Guid): boolean
---@overload fun(self: Guid, o: any): boolean
---@overload fun(self: Guid, g: Guid): boolean
---@param o any
---@return boolean
function Guid.Equals(o) end

---@overload fun(value: Guid): integer
---@overload fun(self: Guid, value: any): integer
---@overload fun(self: Guid, value: Guid): integer
---@param value any
---@return integer
function Guid.CompareTo(value) end

---@param a Guid
---@param b Guid
---@return boolean
function Guid.op_Equality(a, b) end

---@param a Guid
---@param b Guid
---@return boolean
function Guid.op_Inequality(a, b) end

---@overload fun(self: Guid, destination: string[], charsWritten: integer, format: string[]): boolean
---@param destination string[]
---@param charsWritten integer
---@param format string[]
---@return boolean
function Guid.TryFormat(destination, charsWritten, format) end

---@class HimederePersonalityDefinition: ConversationContainerPersonalityModuleDefinition_HimederePersonalityModuleConversations_
HimederePersonalityDefinition = {}

---@param storySingleton StorySingleton
---@return HimederePersonalityDefinition
function HimederePersonalityDefinition.__new(storySingleton) end

---@class IPackableExpanded
---@field Pack_Layer integer
---@field Pack_Targets string[]
IPackableExpanded = {}

---@class IconsContainer
---@field arm SerializableAutomaticReference
---@field arm_alt SerializableAutomaticReference
---@field btn_icon_arrow_next_0 SerializableAutomaticReference
---@field btn_icon_arrow_prev_0 SerializableAutomaticReference
---@field back SerializableAutomaticReference
---@field bait SerializableAutomaticReference
---@field btn_icon_book_0 SerializableAutomaticReference
---@field btn_icon_book_open_1 SerializableAutomaticReference
---@field btn_icon_book_open_0 SerializableAutomaticReference
---@field btn_icon_book_open_2 SerializableAutomaticReference
---@field bra SerializableAutomaticReference
---@field cat_ears SerializableAutomaticReference
---@field chip SerializableAutomaticReference
---@field close_round SerializableAutomaticReference
---@field clothes SerializableAutomaticReference
---@field dish_1 SerializableAutomaticReference
---@field dish_2 SerializableAutomaticReference
---@field dish_3 SerializableAutomaticReference
---@field dress SerializableAutomaticReference
---@field fish SerializableAutomaticReference
---@field fishing_rod SerializableAutomaticReference
---@field food SerializableAutomaticReference
---@field gift SerializableAutomaticReference
---@field glasses SerializableAutomaticReference
---@field halloween SerializableAutomaticReference
---@field heart SerializableAutomaticReference
---@field hoodie SerializableAutomaticReference
---@field Icon_check SerializableAutomaticReference
---@field Icon_close SerializableAutomaticReference
---@field Icon_dick SerializableAutomaticReference
---@field Icon_dropdown SerializableAutomaticReference
---@field Icon_energy SerializableAutomaticReference
---@field Icon_follow SerializableAutomaticReference
---@field Icon_hand SerializableAutomaticReference
---@field Icon_noview SerializableAutomaticReference
---@field Icon_psyche SerializableAutomaticReference
---@field Icon_Soap SerializableAutomaticReference
---@field Icon_Sponge SerializableAutomaticReference
---@field Icon_subs SerializableAutomaticReference
---@field Icon_tongue SerializableAutomaticReference
---@field Icon_trash SerializableAutomaticReference
---@field Icon_view SerializableAutomaticReference
---@field ingredient SerializableAutomaticReference
---@field leg SerializableAutomaticReference
---@field leg_alt SerializableAutomaticReference
---@field log SerializableAutomaticReference
---@field Logo_bluesky SerializableAutomaticReference
---@field Logo_discord SerializableAutomaticReference
---@field Logo_itch SerializableAutomaticReference
---@field Logo_pat SerializableAutomaticReference
---@field Logo_substar SerializableAutomaticReference
---@field Logo_tw SerializableAutomaticReference
---@field medicine SerializableAutomaticReference
---@field necklace SerializableAutomaticReference
---@field pants SerializableAutomaticReference
---@field parts SerializableAutomaticReference
---@field btn_icon_refresh_0 SerializableAutomaticReference
---@field save SerializableAutomaticReference
---@field shirt SerializableAutomaticReference
---@field shoes SerializableAutomaticReference
---@field skip SerializableAutomaticReference
---@field skirt SerializableAutomaticReference
---@field socks SerializableAutomaticReference
---@field special SerializableAutomaticReference
---@field stuff SerializableAutomaticReference
---@field tail SerializableAutomaticReference
---@field thong SerializableAutomaticReference
---@field btn_icon_undo_0 SerializableAutomaticReference
---@field vote_downvote SerializableAutomaticReference
---@field vote_upvote SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
IconsContainer = {}

---@return IconsContainer
function IconsContainer.__new() end

---@class JsonNull
JsonNull = {}

---@return JsonNull
function JsonNull.__new() end

---@overload fun(self: JsonNull): boolean
---@return boolean
function JsonNull.isNull() end

---@class KissingDialogueArea: StoryBotDialogueAreaDefinition
---@field KissBoobs StoryBotDialogueTagDefinition
---@field KissPelvic StoryBotDialogueTagDefinition
---@field KissEye StoryBotDialogueTagDefinition
---@field KissCatEars StoryBotDialogueTagDefinition
---@field KissThigh StoryBotDialogueTagDefinition
---@field KissTummy StoryBotDialogueTagDefinition
---@field KissAss StoryBotDialogueTagDefinition
---@field KissLeg StoryBotDialogueTagDefinition
---@field KissFoot StoryBotDialogueTagDefinition
---@field KissArm StoryBotDialogueTagDefinition
---@field KissGeneric StoryBotDialogueTagDefinition
---@field KissHair StoryBotDialogueTagDefinition
KissingDialogueArea = {}

---@return KissingDialogueArea
function KissingDialogueArea.__new() end

---@overload fun(self: KissingDialogueArea): string
---@return string
function KissingDialogueArea.GetPrefix() end

---@class Localization
Localization = {}

---@return Localization
function Localization.__new() end

---@return UniTask
function Localization.RunItemsLocalization() end

---@class MidiContainer
---@field CELESTYN_RAPIDCOOKINGCHALLENGE SerializableAutomaticReference
---@field DreemChxsr_AirFryer SerializableAutomaticReference
---@field Kaedo_MysteryMeat SerializableAutomaticReference
---@field Kaedo_PPP SerializableAutomaticReference
---@field LightM_Carrot SerializableAutomaticReference
---@field LightM_MoanChoir SerializableAutomaticReference
---@field Nitrori_CreamNPie SerializableAutomaticReference
---@field Nitrori_EvoxMachine SerializableAutomaticReference
---@field Nitrori_Spirasomnus SerializableAutomaticReference
---@field RadPechi_ExoticHardware SerializableAutomaticReference
---@field RadPechi_Hypersexual SerializableAutomaticReference
---@field RadPechi_IfOnly SerializableAutomaticReference
---@field RadPechi_ISOLated SerializableAutomaticReference
---@field RadPechi_ItsHimAgain SerializableAutomaticReference
---@field RadPechi_ShesRealToMe SerializableAutomaticReference
---@field Sheep_Demise SerializableAutomaticReference
---@field SJ68_Cocktail SerializableAutomaticReference
---@field SJ68_lethimcook SerializableAutomaticReference
---@field SJ68_ProteinShake SerializableAutomaticReference
---@field ToniS_Reflection SerializableAutomaticReference
---@field ToniS_WhiteDress SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
MidiContainer = {}

---@return MidiContainer
function MidiContainer.__new() end

---@class MidiFile
---@field TimeDivision TimeDivision
---@field Chunks ChunksCollection
MidiFile = {}

---@overload fun(chunks: MidiChunk[]): MidiFile
---@return MidiFile
function MidiFile.__new() end

---@overload fun(self: MidiFile, stream: Stream, settings: ReadingSettings): MidiFile
---@param stream Stream
---@param settings ReadingSettings
---@return MidiFile
function MidiFile.Read(stream, settings) end

---@overload fun(self: MidiFile): MidiFile
---@return MidiFile
function MidiFile.Clone() end

---@class MidiSongAsset: ScriptableObject
---@field name string
---@field hideFlags HideFlags
MidiSongAsset = {}

---@return MidiSongAsset
function MidiSongAsset.__new() end

---@overload fun(self: MidiSongAsset, bytes: integer[])
---@param bytes integer[]
function MidiSongAsset.SetMidiFileData(bytes) end

---@overload fun(self: MidiSongAsset): MidiFile
---@return MidiFile
function MidiSongAsset.GetMidiFile() end

---@class MinMaxCurve
---@field mode ParticleSystemCurveMode
---@field curveMin AnimationCurve
---@field constant number
---@field curve AnimationCurve
MinMaxCurve = {}

---@overload fun(constant: number): MinMaxCurve
---@return MinMaxCurve
function MinMaxCurve.__new() end

---@overload fun(time: number, lerpFactor: number): number
---@overload fun(self: MinMaxCurve, time: number): number
---@overload fun(self: MinMaxCurve, time: number, lerpFactor: number): number
---@param time number
---@return number
function MinMaxCurve.Evaluate(time) end

---@param constant number
---@return MinMaxCurve
function MinMaxCurve.__toMinMaxCurve(constant) end

---@class MinMaxGradient
MinMaxGradient = {}

---@overload fun(color: Color): MinMaxGradient
---@overload fun(gradient: Gradient): MinMaxGradient
---@return MinMaxGradient
function MinMaxGradient.__new() end

---@overload fun(gradient: Gradient): MinMaxGradient
---@param color Color
---@return MinMaxGradient
function MinMaxGradient.__toMinMaxGradient(color) end

---@class NutritionProfilePool: BetterObjectPool_EdibleItemNutritionProfile_
---@field MaxCachedInstances integer
NutritionProfilePool = {}

---@return NutritionProfilePool
function NutritionProfilePool.__new() end

---@class OrCondition: StoryCondition
---@field Operands StoryCondition[]
OrCondition = {}

---@param operands StoryCondition[]
---@param negate boolean
---@return OrCondition
function OrCondition.__new(operands, negate) end

---@overload fun(self: OrCondition): string
---@return string
function OrCondition.Explain() end

---@overload fun(self: OrCondition): string
---@return string
function OrCondition.GenerateCode() end

---@overload fun(obj: any): boolean
---@overload fun(self: OrCondition, other: OrCondition): boolean
---@overload fun(self: OrCondition, obj: any): boolean
---@param other OrCondition
---@return boolean
function OrCondition.Equals(other) end

---@overload fun(self: OrCondition): integer
---@return integer
function OrCondition.GetHashCode() end

---@class OtherLogosContainer
---@field AGUI_Logo SerializableAutomaticReference
---@field Baka SerializableAutomaticReference
---@field Banana SerializableAutomaticReference
---@field Bedabots_Logo SerializableAutomaticReference
---@field BloodyMoon SerializableAutomaticReference
---@field BotLogo1 SerializableAutomaticReference
---@field Bow SerializableAutomaticReference
---@field CELESTYN SerializableAutomaticReference
---@field CIA SerializableAutomaticReference
---@field CosplayHouse SerializableAutomaticReference
---@field DDlogo1 SerializableAutomaticReference
---@field DogeCoin SerializableAutomaticReference
---@field fishFearMeLogo SerializableAutomaticReference
---@field Flowerkidv SerializableAutomaticReference
---@field Avocado SerializableAutomaticReference
---@field Cherry SerializableAutomaticReference
---@field Peach SerializableAutomaticReference
---@field Strawberry SerializableAutomaticReference
---@field galaxy SerializableAutomaticReference
---@field GamerTshirt SerializableAutomaticReference
---@field HikkeiruLogo SerializableAutomaticReference
---@field HotPinkGames_Logo SerializableAutomaticReference
---@field InHeatLogo SerializableAutomaticReference
---@field LightSonic SerializableAutomaticReference
---@field MadLogo SerializableAutomaticReference
---@field MILF SerializableAutomaticReference
---@field mirthal SerializableAutomaticReference
---@field Mushroom SerializableAutomaticReference
---@field NitroriLogo SerializableAutomaticReference
---@field NutekuLogo SerializableAutomaticReference
---@field Polandball SerializableAutomaticReference
---@field priestbot_tshirt SerializableAutomaticReference
---@field projekt_melody_nbtw_69 SerializableAutomaticReference
---@field projekt_melody_nbtw_logo SerializableAutomaticReference
---@field radioactive SerializableAutomaticReference
---@field Rose SerializableAutomaticReference
---@field RottingSteelLogo SerializableAutomaticReference
---@field Shady_Corner_Logo SerializableAutomaticReference
---@field shcHoodie SerializableAutomaticReference
---@field shcPanties SerializableAutomaticReference
---@field Sheep SerializableAutomaticReference
---@field siluman_Alice SerializableAutomaticReference
---@field siluman_logo SerializableAutomaticReference
---@field SJ68WHITE SerializableAutomaticReference
---@field skull SerializableAutomaticReference
---@field sylphy_chibi SerializableAutomaticReference
---@field Temple SerializableAutomaticReference
---@field tonis_album SerializableAutomaticReference
---@field ufo SerializableAutomaticReference
---@field USP SerializableAutomaticReference
---@field WeebDesign SerializableAutomaticReference
---@field WithStupid SerializableAutomaticReference
---@field world_tamer_logo SerializableAutomaticReference
---@field WyldSpace SerializableAutomaticReference
---@field XoulionLogo SerializableAutomaticReference
---@field yaranaika SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
OtherLogosContainer = {}

---@return OtherLogosContainer
function OtherLogosContainer.__new() end

---@class OtherTextContainer
---@field _8ballAsciiArt SerializableAutomaticReference
---@field annaliesay SerializableAutomaticReference
---@field bootup1 SerializableAutomaticReference
---@field bootup2 SerializableAutomaticReference
---@field cowsay SerializableAutomaticReference
---@field junBoobs SerializableAutomaticReference
---@field junMouth SerializableAutomaticReference
---@field junsay SerializableAutomaticReference
---@field sheepsay SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
OtherTextContainer = {}

---@return OtherTextContainer
function OtherTextContainer.__new() end

---@class PCMSetPositionCallback: MulticastDelegate
---@field Method MethodInfo
---@field Target any
PCMSetPositionCallback = {}

---@overload fun(self: PCMSetPositionCallback, position: integer)
---@param position integer
function PCMSetPositionCallback.Invoke(position) end

---@class PackedDrawable
---@field Name string
---@field RectInt RectInt
---@field ColorIndex integer
---@field DrawableType DrawableTypeEnum
---@field BypassColorScaler boolean
PackedDrawable = {}

---@overload fun(name: string, rectInt: RectInt, colorIndex: integer, drawableType: DrawableTypeEnum, bypassColorScaler: boolean): PackedDrawable
---@return PackedDrawable
function PackedDrawable.__new() end

---@overload fun(self: PackedDrawable, offset: integer): PackedDrawable
---@param offset integer
---@return PackedDrawable
function PackedDrawable.Clone(offset) end

---@overload fun(self: PackedDrawable, texture: PackedTexture): PackablePackedColorIndex
---@param texture PackedTexture
---@return PackablePackedColorIndex
function PackedDrawable.ToPackable(texture) end

---@class Part
---@field FullName string
---@field Mesh Mesh
---@field MainTexture Texture
---@field RealNormalizedRect Rect
---@field ExpandedPixelRect RectInt
---@field ExpandedNormalizedSize Rect
---@field TriangleAreas number[]
---@field Area number
---@field Owner Live2DController
---@field RelatedElementColoringGroup ElementColoringGroup
---@field CubismRenderer CubismRenderer
---@field CubismDrawable CubismDrawable
---@field MeshRenderer MeshRenderer
---@field GameObject GameObject
---@field DefaultMaterial Material
---@field EverDrawn boolean
---@field PreviousLayers PartLayer[]
---@field Layers PartLayer[]
---@field IsSkinnedClone boolean
---@field ColoringGroup ColoringGroup
---@field VanillaLayer integer
---@field OverlayLayer integer
Part = {}

---@overload fun(cubismDrawable: CubismDrawable, owner: Live2DController): Part
---@param cubismRenderer CubismRenderer
---@param owner Live2DController
---@return Part
function Part.__new(cubismRenderer, owner) end

---@overload fun(self: Part): integer
---@return integer
function Part.GetRandomTriangleUniformlyByArea() end

---@overload fun(self: Part)
function Part.PrepareForDrawing() end

---@overload fun(self: Part)
function Part.Clear() end

---@overload fun(self: Part): boolean
---@return boolean
function Part.NeedsToBeDrawn() end

---@overload fun(self: Part): boolean
---@return boolean
function Part.NeedsRedrawing() end

---@overload fun(self: Part, relatedElementColoringGroup: ElementColoringGroup)
---@param relatedElementColoringGroup ElementColoringGroup
function Part.InitRelatedElementColoringGroup(relatedElementColoringGroup) end

---@overload fun(self: Part, layer: PartLayer): boolean
---@param layer PartLayer
---@return boolean
function Part.TryGetVanillaLayer(layer) end

---@overload fun(self: Part, itemData: ItemWithCurrentData, color: Color)
---@param itemData ItemWithCurrentData
---@param color Color
function Part.AddVanilla(itemData, color) end

---@overload fun(self: Part, itemWithCurrentData: ItemWithCurrentData, packedTexture: PackedTexture, packedDrawable: PackedDrawable)
---@param itemWithCurrentData ItemWithCurrentData
---@param packedTexture PackedTexture
---@param packedDrawable PackedDrawable
function Part.AddLayers(itemWithCurrentData, packedTexture, packedDrawable) end

---@overload fun(self: Part, shader: Shader, customShaderMaterial: fun(arg1: Material, arg2: any[]), objectsReferencedByShaders: any[])
---@param shader Shader
---@param customShaderMaterial fun(arg1: Material, arg2: any[])
---@param objectsReferencedByShaders any[]
function Part.SetShader(shader, customShaderMaterial, objectsReferencedByShaders) end

---@overload fun(self: Part, targetRect: Rect, texture: Texture)
---@param targetRect Rect
---@param texture Texture
function Part.DrawRuntimeWithClear(targetRect, texture) end

---@overload fun(self: Part, targetRect: Rect, texture: Texture)
---@param targetRect Rect
---@param texture Texture
function Part.DrawRuntime(targetRect, texture) end

---@overload fun(self: Part, active: boolean)
---@param active boolean
function Part.SetActive(active) end

---@overload fun(self: Part, targetRectInTexture: Rect)
---@param targetRectInTexture Rect
function Part.Draw(targetRectInTexture) end

---@overload fun(self: Part)
function Part.MarkAsSkinnedClone() end

---@overload fun(self: Part, coloringGroup: ColoringGroup)
---@param coloringGroup ColoringGroup
function Part.SetColoringGroup(coloringGroup) end

---@overload fun(self: Part): Rect
---@return Rect
function Part.CalculateApproximateWorldRect() end

---@overload fun(self: Part): Vector2
---@return Vector2
function Part.CalculateWorldBoundsCenter() end

---@class PartLayer
---@field Layer integer
---@field Color Color
---@field RelatedItem Item
---@field IsFullLayer boolean
PartLayer = {}

---@overload fun(self: PartLayer, part: Part, mainTexture: Texture, targetRect: Rect)
---@param part Part
---@param mainTexture Texture
---@param targetRect Rect
function PartLayer.Draw(part, mainTexture, targetRect) end

---@class Particle
---@field position Vector3
---@field velocity Vector3
---@field remainingLifetime number
---@field startLifetime number
---@field startColor Color32
---@field randomSeed integer
---@field startSize number
---@field rotation number
---@field rotation3D Vector3
---@field angularVelocity3D Vector3
Particle = {}

---@return Particle
function Particle.__new() end

---@overload fun(self: Particle, system: ParticleSystem): number
---@param system ParticleSystem
---@return number
function Particle.GetCurrentSize(system) end

---@overload fun(self: Particle, system: ParticleSystem): Color32
---@param system ParticleSystem
---@return Color32
function Particle.GetCurrentColor(system) end

---@class PartnerLogosContainer
---@field Alternative_DiabeteColaPow SerializableAutomaticReference
---@field Alternative_DiabeteDrSugarTrans SerializableAutomaticReference
---@field Alternative_DiabeteSweetPotatoTrans SerializableAutomaticReference
---@field Alternative_DiabeteTransparent SerializableAutomaticReference
---@field Alternative_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Alternative_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Alternative_All SerializableAutomaticReference[]
---@field Cazino SerializableAutomaticReference
---@field Diabete SerializableAutomaticReference
---@field Luxe SerializableAutomaticReference
---@field Monizmed SerializableAutomaticReference
---@field RehabTech SerializableAutomaticReference
---@field Stilou SerializableAutomaticReference
---@field NullRelativePathToFirst table<string, SerializableAutomaticReference>
---@field NullRelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
PartnerLogosContainer = {}

---@return PartnerLogosContainer
function PartnerLogosContainer.__new() end

---@class PcIconsContainer
---@field arrow SerializableAutomaticReference
---@field browser SerializableAutomaticReference
---@field config SerializableAutomaticReference
---@field deepweb SerializableAutomaticReference
---@field load SerializableAutomaticReference
---@field OnOff SerializableAutomaticReference
---@field save SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
PcIconsContainer = {}

---@return PcIconsContainer
function PcIconsContainer.__new() end

---@class PersonalityIndexAttribute: Attribute
---@field TypeId any
---@field Index integer
PersonalityIndexAttribute = {}

---@param index integer
---@return PersonalityIndexAttribute
function PersonalityIndexAttribute.__new(index) end

---@class PersonalitySourceIgnoreAttribute: Attribute
---@field TypeId any
PersonalitySourceIgnoreAttribute = {}

---@return PersonalitySourceIgnoreAttribute
function PersonalitySourceIgnoreAttribute.__new() end

---@class PlanningData
---@field dayOffset integer
---@field hourOffset integer
---@field minuteOffset integer
---@field timeOffsetType TimeOffsetType
---@field forceHourInDay boolean
---@field plannedHour integer
---@field plannedMinute integer
---@field randomOffsetBefore integer
---@field randomOffsetAfter integer
PlanningData = {}

---@return PlanningData
function PlanningData.__new() end

---@overload fun(self: PlanningData): string
---@return string
function PlanningData.PlanningInfo() end

---@overload fun(self: PlanningData): string
---@return string
function PlanningData.PlanningInfoShort() end

---@overload fun(self: PlanningData, currentTime: integer): integer
---@param currentTime integer
---@return integer
function PlanningData.GetPlannedTime(currentTime) end

---@class QualityDescriptor
---@field MinQuality number
---@field SimpleLocalizedString SimpleLocalizedString
QualityDescriptor = {}

---@param minQuality number
---@param simpleLocalizedString SimpleLocalizedString
---@return QualityDescriptor
function QualityDescriptor.__new(minQuality, simpleLocalizedString) end

---@class ScratchPartData
---@field Quality number
---@field ScratchType ScratchTextureType
ScratchPartData = {}

---@param item Item
---@return ScratchPartData
function ScratchPartData.__new(item) end

---@class ScratchPartLayer: PartLayer
---@field Data ScratchPartData
---@field IsFullLayer boolean
---@field Layer integer
---@field Color Color
---@field RelatedItem Item
ScratchPartLayer = {}

---@param layer integer
---@param data ScratchPartData
---@param relatedItem Item
---@return ScratchPartLayer
function ScratchPartLayer.__new(layer, data, relatedItem) end

---@overload fun(self: ScratchPartLayer, part: Part, mainTexture: Texture, targetRect: Rect)
---@param part Part
---@param mainTexture Texture
---@param targetRect Rect
function ScratchPartLayer.Draw(part, mainTexture, targetRect) end

---@class SerializableDictStringDialogueChainMemory
---@field Count integer
---@field Keys string[]
---@field Values DialogueChainMemory[]
SerializableDictStringDialogueChainMemory = {}

---@return SerializableDictStringDialogueChainMemory
function SerializableDictStringDialogueChainMemory.__new() end

---@class SillyCatPersonalityDefinition: ConversationContainerPersonalityModuleDefinition_SillyCatPersonalityModuleConversations_
SillyCatPersonalityDefinition = {}

---@param storySingleton StorySingleton
---@return SillyCatPersonalityDefinition
function SillyCatPersonalityDefinition.__new(storySingleton) end

---@class SlotManager
---@field LegL ItemSlot
---@field LegR ItemSlot
---@field ShoeL ItemSlot
---@field ShoeR ItemSlot
---@field StockingL ItemSlot
---@field StockingR ItemSlot
---@field ArmL ItemSlot
---@field ArmR ItemSlot
---@field Skin ItemSlot
---@field Eyes ItemSlot
---@field HeartPupils ItemSlot
---@field Flesh ItemSlot
---@field Head ItemSlot
---@field Ears ItemSlot
---@field Teeth ItemSlot
---@field Tail ItemSlot
---@field Hologram ItemSlot
---@field HairMain ItemSlot
---@field HairAdditional ItemSlot
---@field HairAugmentation ItemSlot
---@field FeetBodyModules ItemSlot
---@field ThighBodyModules ItemSlot
---@field AssBodyModules ItemSlot
---@field CalfBodyModules ItemSlot
---@field BoobsBodyModules ItemSlot
---@field BodySizeModuleSlots ItemSlot[]
---@field PersonalityModule ItemSlot
---@field UpperBody ItemSlot
---@field LowerBody ItemSlot
---@field UpperBodyOuter ItemSlot
---@field Bra ItemSlot
---@field Panties ItemSlot
---@field HairAccessoryL ItemSlot
---@field Manicure ItemSlot
---@field Pedicure ItemSlot
---@field NeckAccessory ItemSlot
---@field Glasses ItemSlot
---@field TongueAccessory ItemSlot
---@field EyeMakeup ItemSlot
---@field Septum ItemSlot
---@field Lips ItemSlot
---@field Navel ItemSlot
---@field NippleLeft ItemSlot
---@field NippleRight ItemSlot
---@field AnonSlotStart string
---@field Anon_Glasses ItemSlot
---@field Anon_FishingRod ItemSlot
---@field Anon_FishingBait ItemSlot
---@field RoomSlotStart string
---@field Room_Mat ItemSlot
---@field Room_Plush ItemSlot
---@field Room_Banner ItemSlot
---@field Room_WallDecoration ItemSlot
SlotManager = {}

---@return SlotManager
function SlotManager.__new() end

---@param slotId string
---@return SlotType
function SlotManager.GetSlotType(slotId) end

---@param slotId string
---@param itemSlot ItemSlot
---@return boolean
function SlotManager.TryGetSlot(slotId, itemSlot) end

---@param slotId string
---@return ItemSlot
function SlotManager.GetSlot(slotId) end

---@param slotId string
---@return ItemSlot
function SlotManager.GetSlotPossibleNull(slotId) end

---@param slot ItemSlot
function SlotManager.AddSlot(slot) end

---@class SlutPersonalityDefinition: ConversationContainerPersonalityModuleDefinition_SlutPersonalityModuleConversations_
SlutPersonalityDefinition = {}

---@param storySingleton StorySingleton
---@return SlutPersonalityDefinition
function SlutPersonalityDefinition.__new(storySingleton) end

---@class SpecialVariablesHolder
SpecialVariablesHolder = {}

---@return SpecialVariablesHolder
function SpecialVariablesHolder.__new() end

---@overload fun(self: SpecialVariablesHolder, key: string, value: integer)
---@param key string
---@param value integer
function SpecialVariablesHolder.SetIntSpecialVariable(key, value) end

---@overload fun(self: SpecialVariablesHolder, key: string, value: integer): boolean
---@param key string
---@param value integer
---@return boolean
function SpecialVariablesHolder.TryGetIntSpecialVariable(key, value) end

---@overload fun(self: SpecialVariablesHolder, key: string, defaultValue: integer): integer
---@overload fun(self: SpecialVariablesHolder, key: string): integer
---@param key string
---@param defaultValue? integer
---@return integer
function SpecialVariablesHolder.GetIntSpecialVariableOrDefault(key, defaultValue) end

---@overload fun(self: SpecialVariablesHolder, key: string, value: boolean)
---@param key string
---@param value boolean
function SpecialVariablesHolder.SetIntSpecialVariableCastBool(key, value) end

---@overload fun(self: SpecialVariablesHolder, key: string, value: boolean): boolean
---@param key string
---@param value boolean
---@return boolean
function SpecialVariablesHolder.TryGetIntSpecialVariableCastBool(key, value) end

---@overload fun(self: SpecialVariablesHolder, key: string, defaultValue: boolean): boolean
---@overload fun(self: SpecialVariablesHolder, key: string): boolean
---@param key string
---@param defaultValue? boolean
---@return boolean
function SpecialVariablesHolder.GetIntSpecialVariableOrDefaultCastBool(key, defaultValue) end

---@overload fun(self: SpecialVariablesHolder, key: string, value: number)
---@param key string
---@param value number
function SpecialVariablesHolder.SetFloatSpecialVariable(key, value) end

---@overload fun(self: SpecialVariablesHolder, key: string, value: number): boolean
---@param key string
---@param value number
---@return boolean
function SpecialVariablesHolder.TryGetFloatSpecialVariable(key, value) end

---@overload fun(self: SpecialVariablesHolder, key: string, defaultValue: number): number
---@overload fun(self: SpecialVariablesHolder, key: string): number
---@param key string
---@param defaultValue? number
---@return number
function SpecialVariablesHolder.GetFloatSpecialVariableOrDefault(key, defaultValue) end

---@overload fun(self: SpecialVariablesHolder, key: string, value: string)
---@param key string
---@param value string
function SpecialVariablesHolder.SetStringSpecialVariable(key, value) end

---@overload fun(self: SpecialVariablesHolder, key: string, value: string): boolean
---@param key string
---@param value string
---@return boolean
function SpecialVariablesHolder.TryGetStringSpecialVariable(key, value) end

---@overload fun(self: SpecialVariablesHolder, key: string, defaultValue: string): string
---@overload fun(self: SpecialVariablesHolder, key: string): string
---@param key string
---@param defaultValue? string
---@return string
function SpecialVariablesHolder.GetStringSpecialVariableOrDefault(key, defaultValue) end

---@overload fun(self: SpecialVariablesHolder, key: string, value: any): boolean
---@param key string
---@param value any
---@return boolean
function SpecialVariablesHolder.TryGetAnySpecialVariable(key, value) end

---@overload fun(self: SpecialVariablesHolder)
function SpecialVariablesHolder.OnAfterDeserializeSpecialVariableHolder() end

---@class Stages
---@field Stage1 StoryBotDialogueStage
---@field Stage2 StoryBotDialogueStage
---@field Stage3 StoryBotDialogueStage
Stages = {}

---@param stage1 StoryBotDialogueStage
---@param stage2 StoryBotDialogueStage
---@param stage3 StoryBotDialogueStage
---@return Stages
function Stages.__new(stage1, stage2, stage3) end

---@class Step
---@field CallingCommand Command
---@field TargetBlock Block
Step = {}

---@param callingCommand Command
---@param targetBlock Block
---@return Step
function Step.__new(callingCommand, targetBlock) end

---@class StreamInfo
---@field streamer Streamer
---@field Viewers integer
StreamInfo = {}

---@return StreamInfo
function StreamInfo.__new() end

---@class StringBuilderConsoleLine: ConsoleLine
---@field StringBuilder StringBuilder
---@field HasTextInfoProcessing boolean
StringBuilderConsoleLine = {}

---@return StringBuilderConsoleLine
function StringBuilderConsoleLine.__new() end

---@overload fun(stringBuilder: StringBuilder)
---@overload fun(self: StringBuilderConsoleLine)
---@overload fun(self: StringBuilderConsoleLine, stringBuilder: StringBuilder)
function StringBuilderConsoleLine.Init() end

---@overload fun(self: StringBuilderConsoleLine)
function StringBuilderConsoleLine.Clear() end

---@overload fun(self: StringBuilderConsoleLine, popup: BotStatusAppPopup): integer
---@param popup BotStatusAppPopup
---@return integer
function StringBuilderConsoleLine.GetApproximateLineCount(popup) end

---@overload fun(self: StringBuilderConsoleLine, consoleStringBuilder: StringBuilder, _popup: BotStatusAppPopup)
---@param consoleStringBuilder StringBuilder
---@param _popup BotStatusAppPopup
function StringBuilderConsoleLine.PrintTo(consoleStringBuilder, _popup) end

---@param sb StringBuilder
---@return StringBuilderConsoleLine
function StringBuilderConsoleLine.__toStringBuilderConsoleLine(sb) end

---@class StringConsoleLine: ConsoleLine
---@field String string
---@field StringPrintType StringPrintTypesEnum
---@field MaxVerticalLinesAllowed integer
---@field HasTextInfoProcessing boolean
StringConsoleLine = {}

---@return StringConsoleLine
function StringConsoleLine.__new() end

---@overload fun(self: StringConsoleLine, value: string)
---@param value string
function StringConsoleLine.Init(value) end

---@overload fun(self: StringConsoleLine)
function StringConsoleLine.Clear() end

---@overload fun(self: StringConsoleLine, popup: BotStatusAppPopup): integer
---@param popup BotStatusAppPopup
---@return integer
function StringConsoleLine.GetApproximateLineCount(popup) end

---@overload fun(self: StringConsoleLine, consoleStringBuilder: StringBuilder, _popup: BotStatusAppPopup)
---@param consoleStringBuilder StringBuilder
---@param _popup BotStatusAppPopup
function StringConsoleLine.PrintTo(consoleStringBuilder, _popup) end

---@param s string
---@return StringConsoleLine
function StringConsoleLine.__toStringConsoleLine(s) end

---@class StringProcessingDelegate: MulticastDelegate
---@field Method MethodInfo
---@field Target any
StringProcessingDelegate = {}

---@overload fun(self: StringProcessingDelegate, input: string): string
---@param input string
---@return string
function StringProcessingDelegate.Invoke(input) end

---@overload fun(self: StringProcessingDelegate, input: string, callback: AsyncCallback, object: any): IAsyncResult
---@param input string
---@param callback AsyncCallback
---@param object any
---@return IAsyncResult
function StringProcessingDelegate.BeginInvoke(input, callback, object) end

---@overload fun(self: StringProcessingDelegate, result: IAsyncResult): string
---@param result IAsyncResult
---@return string
function StringProcessingDelegate.EndInvoke(result) end

---@class StringValidationDelegate: MulticastDelegate
---@field Method MethodInfo
---@field Target any
StringValidationDelegate = {}

---@overload fun(self: StringValidationDelegate, input: string): Result
---@param input string
---@return Result
function StringValidationDelegate.Invoke(input) end

---@overload fun(self: StringValidationDelegate, input: string, callback: AsyncCallback, object: any): IAsyncResult
---@param input string
---@param callback AsyncCallback
---@param object any
---@return IAsyncResult
function StringValidationDelegate.BeginInvoke(input, callback, object) end

---@overload fun(self: StringValidationDelegate, result: IAsyncResult): Result
---@param result IAsyncResult
---@return Result
function StringValidationDelegate.EndInvoke(result) end

---@class TargetComparer
TargetComparer = {}

---@return TargetComparer
function TargetComparer.__new() end

---@overload fun(self: TargetComparer, a: string[], b: string[]): boolean
---@param a string[]
---@param b string[]
---@return boolean
function TargetComparer.Equals(a, b) end

---@overload fun(self: TargetComparer, t: string[]): integer
---@param t string[]
---@return integer
function TargetComparer.GetHashCode(t) end

---@class TextAsset
---@field bytes integer[]
---@field text string
---@field name string
---@field hideFlags HideFlags
TextAsset = {}

---@return TextAsset
function TextAsset.__new() end

---@overload fun(self: TextAsset): string
---@return string
function TextAsset.ToString() end

---@class TextPrefabsContainer
---@field Commissioner_Commissioner_Text SerializableAutomaticReference
---@field Commissioner_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Commissioner_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Commissioner_All SerializableAutomaticReference[]
---@field Fonarto_Fonarto_Text SerializableAutomaticReference
---@field Fonarto_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Fonarto_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Fonarto_All SerializableAutomaticReference[]
---@field Main_Font_Main_Text SerializableAutomaticReference
---@field Main_Font_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Main_Font_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Main_Font_All SerializableAutomaticReference[]
---@field Monospace_Font_Monospace_Text SerializableAutomaticReference
---@field Monospace_Font_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Monospace_Font_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Monospace_Font_All SerializableAutomaticReference[]
---@field Noto_Sans_NotoSans_Text SerializableAutomaticReference
---@field Noto_Sans_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Noto_Sans_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Noto_Sans_All SerializableAutomaticReference[]
---@field All SerializableAutomaticReference[]
TextPrefabsContainer = {}

---@return TextPrefabsContainer
function TextPrefabsContainer.__new() end

---@class TsunTsunPersonalityDefinition: ConversationContainerPersonalityModuleDefinition_TsunTsunPersonalityModuleConversations_
TsunTsunPersonalityDefinition = {}

---@param storySingleton StorySingleton
---@return TsunTsunPersonalityDefinition
function TsunTsunPersonalityDefinition.__new(storySingleton) end

---@class YanderePersonalityDefinition: ConversationContainerPersonalityModuleDefinition_YanderePersonalityModuleConversations_
YanderePersonalityDefinition = {}

---@param storySingleton StorySingleton
---@return YanderePersonalityDefinition
function YanderePersonalityDefinition.__new(storySingleton) end

---@class _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__
---@field DefaultValue boolean
---@field Value boolean
_0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__ = {}

---@param defaultValue boolean
---@return _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__.__new(defaultValue) end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__, value: boolean)
---@param value boolean
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__.SetValue(value) end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__)
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__.ResetStat() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__): string
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__.ToString() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2: StoryCondition
---@field Value DataConditionValue
---@field Comparator DataConditionComparator
_0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2 = {}

---@param value DataConditionValue
---@param comparator DataConditionComparator
---@param negate boolean
---@return _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2.__new(value, comparator, negate) end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2): string
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2.Explain() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2): string
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2.GenerateVariableName() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2): string
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2.GenerateCode() end

---@overload fun(obj: any): boolean
---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2, other: DataCondition): boolean
---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2, obj: any): boolean
---@param other DataCondition
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2.Equals(other) end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2): integer
---@return integer
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2.GetHashCode() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3: StoryCondition
---@field Value DataConditionValue
---@field Comparator DataConditionComparator
_0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3 = {}

---@param value DataConditionValue
---@param comparator DataConditionComparator
---@param negate boolean
---@return _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3.__new(value, comparator, negate) end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3): string
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3.Explain() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3): string
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3.GenerateVariableName() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3): string
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3.GenerateCode() end

---@overload fun(obj: any): boolean
---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3, other: DataCondition): boolean
---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3, obj: any): boolean
---@param other DataCondition
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3.Equals(other) end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3): integer
---@return integer
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3.GetHashCode() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4: StoryCondition
---@field Value DataConditionValue
---@field Comparator DataConditionComparator
_0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4 = {}

---@param value DataConditionValue
---@param comparator DataConditionComparator
---@param negate boolean
---@return _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4.__new(value, comparator, negate) end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4): string
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4.Explain() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4): string
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4.GenerateVariableName() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4): string
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4.GenerateCode() end

---@overload fun(obj: any): boolean
---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4, other: DataCondition): boolean
---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4, obj: any): boolean
---@param other DataCondition
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4.Equals(other) end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4): integer
---@return integer
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4.GetHashCode() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_null__
---@field DefaultValue EatSound
---@field Value EatSound
_0_0_0__Culture_neutral__PublicKeyToken_null__ = {}

---@param defaultValue EatSound
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__
function _0_0_0__Culture_neutral__PublicKeyToken_null__.__new(defaultValue) end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__, value: EatSound)
---@param value EatSound
function _0_0_0__Culture_neutral__PublicKeyToken_null__.SetValue(value) end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__)
function _0_0_0__Culture_neutral__PublicKeyToken_null__.ResetStat() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__): string
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_null__.ToString() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_null__10
---@field resourcesReferenceLoader ResourcesReferenceLoader
_0_0_0__Culture_neutral__PublicKeyToken_null__10 = {}

---@return _0_0_0__Culture_neutral__PublicKeyToken_null__10
function _0_0_0__Culture_neutral__PublicKeyToken_null__10.__new() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__10): boolean
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__10.IsNull() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__10): ValueTuple
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__10.GetIdentifier() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_null__11
---@field resourcesReferenceLoader ResourcesReferenceLoader
_0_0_0__Culture_neutral__PublicKeyToken_null__11 = {}

---@return _0_0_0__Culture_neutral__PublicKeyToken_null__11
function _0_0_0__Culture_neutral__PublicKeyToken_null__11.__new() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__11): boolean
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__11.IsNull() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__11): ValueTuple
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__11.GetIdentifier() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_null__12
---@field resourcesReferenceLoader ResourcesReferenceLoader
_0_0_0__Culture_neutral__PublicKeyToken_null__12 = {}

---@return _0_0_0__Culture_neutral__PublicKeyToken_null__12
function _0_0_0__Culture_neutral__PublicKeyToken_null__12.__new() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__12): boolean
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__12.IsNull() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__12): ValueTuple
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__12.GetIdentifier() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_null__13
---@field InputResource IReference
_0_0_0__Culture_neutral__PublicKeyToken_null__13 = {}

---@param inputResource IReference
---@param conversionFunc fun(arg1: Texture2D): Sprite
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__13
function _0_0_0__Culture_neutral__PublicKeyToken_null__13.__new(inputResource, conversionFunc) end

---@class _0_0_0__Culture_neutral__PublicKeyToken_null__2
---@field resourcesReferenceLoader ResourcesReferenceLoader
_0_0_0__Culture_neutral__PublicKeyToken_null__2 = {}

---@return _0_0_0__Culture_neutral__PublicKeyToken_null__2
function _0_0_0__Culture_neutral__PublicKeyToken_null__2.__new() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__2): boolean
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__2.IsNull() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__2): ValueTuple
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__2.GetIdentifier() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_null__3
---@field resourcesReferenceLoader ResourcesReferenceLoader
_0_0_0__Culture_neutral__PublicKeyToken_null__3 = {}

---@return _0_0_0__Culture_neutral__PublicKeyToken_null__3
function _0_0_0__Culture_neutral__PublicKeyToken_null__3.__new() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__3): boolean
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__3.IsNull() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__3): ValueTuple
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__3.GetIdentifier() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_null__4
---@field resourcesReferenceLoader ResourcesReferenceLoader
_0_0_0__Culture_neutral__PublicKeyToken_null__4 = {}

---@return _0_0_0__Culture_neutral__PublicKeyToken_null__4
function _0_0_0__Culture_neutral__PublicKeyToken_null__4.__new() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__4): boolean
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__4.IsNull() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__4): ValueTuple
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__4.GetIdentifier() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_null__5
---@field resourcesReferenceLoader ResourcesReferenceLoader
_0_0_0__Culture_neutral__PublicKeyToken_null__5 = {}

---@return _0_0_0__Culture_neutral__PublicKeyToken_null__5
function _0_0_0__Culture_neutral__PublicKeyToken_null__5.__new() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__5): boolean
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__5.IsNull() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__5): ValueTuple
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__5.GetIdentifier() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_null__6
---@field resourcesReferenceLoader ResourcesReferenceLoader
_0_0_0__Culture_neutral__PublicKeyToken_null__6 = {}

---@return _0_0_0__Culture_neutral__PublicKeyToken_null__6
function _0_0_0__Culture_neutral__PublicKeyToken_null__6.__new() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__6): boolean
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__6.IsNull() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__6): ValueTuple
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__6.GetIdentifier() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_null__7
---@field resourcesReferenceLoader ResourcesReferenceLoader
_0_0_0__Culture_neutral__PublicKeyToken_null__7 = {}

---@return _0_0_0__Culture_neutral__PublicKeyToken_null__7
function _0_0_0__Culture_neutral__PublicKeyToken_null__7.__new() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__7): boolean
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__7.IsNull() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__7): ValueTuple
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__7.GetIdentifier() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_null__8
---@field resourcesReferenceLoader ResourcesReferenceLoader
_0_0_0__Culture_neutral__PublicKeyToken_null__8 = {}

---@return _0_0_0__Culture_neutral__PublicKeyToken_null__8
function _0_0_0__Culture_neutral__PublicKeyToken_null__8.__new() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__8): boolean
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__8.IsNull() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__8): ValueTuple
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__8.GetIdentifier() end

---@class _0_0_0__Culture_neutral__PublicKeyToken_null__9
---@field resourcesReferenceLoader ResourcesReferenceLoader
_0_0_0__Culture_neutral__PublicKeyToken_null__9 = {}

---@return _0_0_0__Culture_neutral__PublicKeyToken_null__9
function _0_0_0__Culture_neutral__PublicKeyToken_null__9.__new() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__9): boolean
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__9.IsNull() end

---@overload fun(self: _0_0_0__Culture_neutral__PublicKeyToken_null__9): ValueTuple
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__9.GetIdentifier() end

---@class AdvancedItemListPrefab
AdvancedItemListPrefab = {}

---@class AnimationCurve
AnimationCurve = {}

---@class AssetReferenceT
AssetReferenceT = {}

---@class AsyncCallback
AsyncCallback = {}

---@class Attribute
Attribute = {}

---@class AudioBehaviour: Behaviour
AudioBehaviour = {}

---@class AudioClipLoadType
AudioClipLoadType = {}

---@class AudioDataLoadState
AudioDataLoadState = {}

---@class AudioResource
AudioResource = {}

---@class AudioSource: AudioBehaviour
AudioSource = {}

---@class AudioSourceUsage
AudioSourceUsage = {}

---@class AutomaticReference_TResource__ModFileBase_
AutomaticReference_TResource__ModFileBase_ = {}

---@class BarBeatFractionTimeSpan
BarBeatFractionTimeSpan = {}

---@class BasicInsertionHandleFuckAxis: InsertionHandlerFuckAxis
BasicInsertionHandleFuckAxis = {}

---@class Behaviour: Component
Behaviour = {}

---@class BetterObjectPool_EdibleItemNutritionProfile_
BetterObjectPool_EdibleItemNutritionProfile_ = {}

---@class Block
Block = {}

---@class BotStatusAppManager
BotStatusAppManager = {}

---@class Bounds
Bounds = {}

---@class BrandColorsSet
BrandColorsSet = {}

---@class ButtonColorPalette
ButtonColorPalette = {}

---@class ButtonList: MonoBehaviour
ButtonList = {}

---@class Camera: Behaviour
Camera = {}

---@class CancellationToken
CancellationToken = {}

---@class Canvas
Canvas = {}

---@class CanvasRenderer
CanvasRenderer = {}

---@class CanvasUpdate
CanvasUpdate = {}

---@class ChangingRoomScene: ViewScene
ChangingRoomScene = {}

---@class ChunksCollection
ChunksCollection = {}

---@class CocktractContract
CocktractContract = {}

---@class CocktractPartner: SerializedPart_String__CocktractPartnerPrefab_
CocktractPartner = {}

---@class CocktractPartnerPrefab
CocktractPartnerPrefab = {}

---@class Color
Color = {}

---@class Color32
Color32 = {}

---@class Command
Command = {}

---@class CommandInfoAttribute
CommandInfoAttribute = {}

---@class CommonButtonColorType
CommonButtonColorType = {}

---@class CommonButtonHandler: MonoBehaviour
CommonButtonHandler = {}

---@class Component
Component = {}

---@class CompoundResult: Result
CompoundResult = {}

---@class ComputeBuffer
ComputeBuffer = {}

---@class ConsoleStyleStruct
ConsoleStyleStruct = {}

---@class ContentType
ContentType = {}

---@class ConversationContainerPersonalityModuleDefinition_AraAraPersonalityModuleConversations_: PersonalityModuleDefinition
ConversationContainerPersonalityModuleDefinition_AraAraPersonalityModuleConversations_ = {}

---@class ConversationContainerPersonalityModuleDefinition_CatgirlPersonalityModuleConversations_: PersonalityModuleDefinition
ConversationContainerPersonalityModuleDefinition_CatgirlPersonalityModuleConversations_ = {}

---@class ConversationContainerPersonalityModuleDefinition_DriverPersonalityModuleConversations_: PersonalityModuleDefinition
ConversationContainerPersonalityModuleDefinition_DriverPersonalityModuleConversations_ = {}

---@class ConversationContainerPersonalityModuleDefinition_FemcelPersonalityModuleConversations_: PersonalityModuleDefinition
ConversationContainerPersonalityModuleDefinition_FemcelPersonalityModuleConversations_ = {}

---@class ConversationContainerPersonalityModuleDefinition_HimederePersonalityModuleConversations_: PersonalityModuleDefinition
ConversationContainerPersonalityModuleDefinition_HimederePersonalityModuleConversations_ = {}

---@class ConversationContainerPersonalityModuleDefinition_RobotPersonalityModuleConversations_: PersonalityModuleDefinition
ConversationContainerPersonalityModuleDefinition_RobotPersonalityModuleConversations_ = {}

---@class ConversationContainerPersonalityModuleDefinition_SillyCatPersonalityModuleConversations_: PersonalityModuleDefinition
ConversationContainerPersonalityModuleDefinition_SillyCatPersonalityModuleConversations_ = {}

---@class ConversationContainerPersonalityModuleDefinition_SlutPersonalityModuleConversations_: PersonalityModuleDefinition
ConversationContainerPersonalityModuleDefinition_SlutPersonalityModuleConversations_ = {}

---@class ConversationContainerPersonalityModuleDefinition_TsunTsunPersonalityModuleConversations_: PersonalityModuleDefinition
ConversationContainerPersonalityModuleDefinition_TsunTsunPersonalityModuleConversations_ = {}

---@class ConversationContainerPersonalityModuleDefinition_YanderePersonalityModuleConversations_: PersonalityModuleDefinition
ConversationContainerPersonalityModuleDefinition_YanderePersonalityModuleConversations_ = {}

---@class CookingGameplayModifiers
CookingGameplayModifiers = {}

---@class CookingGameplayScoreData
CookingGameplayScoreData = {}

---@class CookingMinigameManager
CookingMinigameManager = {}

---@class CookingResults
CookingResults = {}

---@class CookingSongDifficulty
CookingSongDifficulty = {}

---@class CookingSongEnumGI
CookingSongEnumGI = {}

---@class CookingSongNoteEvent
CookingSongNoteEvent = {}

---@class CookingSongSave
CookingSongSave = {}

---@class CubismDrawable
CubismDrawable = {}

---@class CubismModel
CubismModel = {}

---@class CubismRenderer
CubismRenderer = {}

---@class CuddleScene: ViewScene
CuddleScene = {}

---@class CullStateChangedEvent
CullStateChangedEvent = {}

---@class CumOutsideManager
CumOutsideManager = {}

---@class CursorOverride
CursorOverride = {}

---@class DataCondition: StoryCondition
DataCondition = {}

---@class DataConditionComparator
DataConditionComparator = {}

---@class DataConditionValue
DataConditionValue = {}

---@class DateTime
DateTime = {}

---@class DeveloperViewScene: ViewScene
DeveloperViewScene = {}

---@class DialogueChainMemory
DialogueChainMemory = {}

---@class DownloadResult
DownloadResult = {}

---@class DraggedItem: MonoBehaviour
DraggedItem = {}

---@class DrawableTypeEnum
DrawableTypeEnum = {}

---@class EmailBase
EmailBase = {}

---@class EmailEventTarget
EmailEventTarget = {}

---@class EmoteData: StoryEmoteItemReference
EmoteData = {}

---@class EquipmentSet
EquipmentSet = {}

---@class EventHolder
EventHolder = {}

---@class Exception
Exception = {}

---@class ExceptionResult: Result
ExceptionResult = {}

---@class EyeManagerCommon
EyeManagerCommon = {}

---@class FileType
FileType = {}

---@class FishCaughtCondition: StoryCondition
FishCaughtCondition = {}

---@class FishSizeCondition: StoryCondition
FishSizeCondition = {}

---@class FishingGameStats: GameStatContainer
FishingGameStats = {}

---@class FishingLocationData
FishingLocationData = {}

---@class FishingLocationEnumGI
FishingLocationEnumGI = {}

---@class FishingMinigameManager
FishingMinigameManager = {}

---@class FloatingText: MonoBehaviour
FloatingText = {}

---@class FontStyles
FontStyles = {}

---@class FontWeight
FontWeight = {}

---@class FrickScene: ViewScene
FrickScene = {}

---@class FrickStaticGuiManager
FrickStaticGuiManager = {}

---@class FungusBlockReference
FungusBlockReference = {}

---@class GameItemContainer: AdvancedItemListPrefab
GameItemContainer = {}

---@class GameObject
GameObject = {}

---@class GameStat
GameStat = {}

---@class GameStatContainer
GameStatContainer = {}

---@class GameStats
GameStats = {}

---@class GameUrl
GameUrl = {}

---@class GameUrlWithArguments: GameUrl
GameUrlWithArguments = {}

---@class GameVariablesClassDescription: NonJitClassDescription_GameVariables_
GameVariablesClassDescription = {}

---@class GameVariablesSubClass
GameVariablesSubClass = {}

---@class GlobalKeyword
GlobalKeyword = {}

---@class Gradient
Gradient = {}

---@class GraphicsBuffer
GraphicsBuffer = {}

---@class HashSet
HashSet = {}

---@class HideFlags
HideFlags = {}

---@class HorizontalAlignmentOptions
HorizontalAlignmentOptions = {}

---@class IAsyncResult
IAsyncResult = {}

---@class ICockManager
ICockManager = {}

---@class IComparer
IComparer = {}

---@class ICumManagerCommon
ICumManagerCommon = {}

---@class IEnumerator
IEnumerator = {}

---@class IFormatProvider
IFormatProvider = {}

---@class IGameStatModifier
IGameStatModifier = {}

---@class IGrouping
IGrouping = {}

---@class ILimbUsage
ILimbUsage = {}

---@class ILive2DInteractable
ILive2DInteractable = {}

---@class ILive2DInteractableHoverable
ILive2DInteractableHoverable = {}

---@class ILive2DModelUser
ILive2DModelUser = {}

---@class IModificationPeriodButtonList
IModificationPeriodButtonList = {}

---@class IMusicSource
IMusicSource = {}

---@class IMusicWithInfo
IMusicWithInfo = {}

---@class IOrderedEnumerable
IOrderedEnumerable = {}

---@class IPenisInfo
IPenisInfo = {}

---@class IProgressManager
IProgressManager = {}

---@class IReference
IReference = {}

---@class IStoryEmoteSlot
IStoryEmoteSlot = {}

---@class ITextPreprocessor
ITextPreprocessor = {}

---@class IXRayManager
IXRayManager = {}

---@class InputPopup: PrefabPopup_InputPopup_
InputPopup = {}

---@class InsertionHandler
InsertionHandler = {}

---@class InsertionHandlerFuckAxis
InsertionHandlerFuckAxis = {}

---@class InsertionManager
InsertionManager = {}

---@class InteractionMemoryCondition: StoryCondition
InteractionMemoryCondition = {}

---@class InteractionMemoryEnum
InteractionMemoryEnum = {}

---@class InteractionMemoryEventEnum
InteractionMemoryEventEnum = {}

---@class ItemColorSlotPicker: MonoBehaviour
ItemColorSlotPicker = {}

---@class ItemModifiableVariableDisplay: AdvancedItemListPrefab
ItemModifiableVariableDisplay = {}

---@class ItemModifier: SpecialVariablesHolder
ItemModifier = {}

---@class ItemModifierEnumGI
ItemModifierEnumGI = {}

---@class ItemNameIncludeEnum
ItemNameIncludeEnum = {}

---@class ItemOrder
ItemOrder = {}

---@class ItemPrefabTag
ItemPrefabTag = {}

---@class ItemRepairOrder
ItemRepairOrder = {}

---@class ItemStats: MonoBehaviour
ItemStats = {}

---@class JoinUsBlogManager: GameVariablesSubClass
JoinUsBlogManager = {}

---@class Label
Label = {}

---@class LetGoLimbsCaller
LetGoLimbsCaller = {}

---@class LimbUsageBetter
LimbUsageBetter = {}

---@class LimbUsageChoiceEnum
LimbUsageChoiceEnum = {}

---@class Live2DControllerCommonState
Live2DControllerCommonState = {}

---@class Live2DExpression
Live2DExpression = {}

---@class Live2DFullBodyInteractable: Live2DInteractableDefaultBase
Live2DFullBodyInteractable = {}

---@class Live2DGenericInteractable: Live2DInteractableDefaultBase
Live2DGenericInteractable = {}

---@class Live2DInteractableDefaultBase
Live2DInteractableDefaultBase = {}

---@class Live2DInteractableLimbUsage
Live2DInteractableLimbUsage = {}

---@class Live2DModelUsageTypeEnum
Live2DModelUsageTypeEnum = {}

---@class Live2DParameter: ParameterBase
Live2DParameter = {}

---@class Live2DPhysicsOverride
Live2DPhysicsOverride = {}

---@class Live2DPrefabHolder: MonoBehaviour
Live2DPrefabHolder = {}

---@class Live2DToolSelector: MonoBehaviour
Live2DToolSelector = {}

---@class LoadProcedureData
LoadProcedureData = {}

---@class LocalKeywordSpace
LocalKeywordSpace = {}

---@class LocalizedConversation
LocalizedConversation = {}

---@class LocalizedStringReference
LocalizedStringReference = {}

---@class LocalizedStringReferenceContainer
LocalizedStringReferenceContainer = {}

---@class LocalizedStringReferenceStory: LocalizedStringReference
LocalizedStringReferenceStory = {}

---@class LuaCondition
LuaCondition = {}

---Fungus LuaEnvironment used by flowcharts and the mod loader. docs.txt exposes the type but not its Lua-callable members.
---@class LuaEnvironment
LuaEnvironment = {}

---@class MainMenuScene: ViewScene
MainMenuScene = {}

---@class ManagedCoroutine
ManagedCoroutine = {}

---@class Material
Material = {}

---@class Matrix4x4
Matrix4x4 = {}

---@class Mesh
Mesh = {}

---@class MeshRenderer: Renderer
MeshRenderer = {}

---@class MethodInfo
MethodInfo = {}

---@class MidiChunk
MidiChunk = {}

---Loaded mod package managed by ModsSingleton. docs.txt references this type but does not expose its members.
---@class Mod
Mod = {}

---@class ModCreationLive2DControllersContainer
ModCreationLive2DControllersContainer = {}

---@class ModDisplay: AdvancedItemListPrefab
ModDisplay = {}

---@class ModFileAutomaticReference_Texture2D_: AutomaticReference_TResource__ModFileBase_
ModFileAutomaticReference_Texture2D_ = {}

---@class ModFileBase
ModFileBase = {}

---@class ModelBrain: MonoBehaviour
ModelBrain = {}

---@class ModelBrainState: UpdatableStateMachineState_ModelBrainState__ModelBrain_
ModelBrainState = {}

---@class MonoBehaviour: Behaviour
MonoBehaviour = {}

---@class MouthManagerDefaultMouth
MouthManagerDefaultMouth = {}

---@class MulticastDelegate
MulticastDelegate = {}

---@class NewEmail: EmailBase
NewEmail = {}

---@class NonJitClassDescription_GameVariables_
NonJitClassDescription_GameVariables_ = {}

---@class Note
Note = {}

---@class OTL_FeatureTag
OTL_FeatureTag = {}

---@class PCScene: ViewScene
PCScene = {}

---@class PanType
PanType = {}

---@class ParameterBase
ParameterBase = {}

---@class ParticleSystemAnimationMode
ParticleSystemAnimationMode = {}

---@class ParticleSystemAnimationRowMode
ParticleSystemAnimationRowMode = {}

---@class ParticleSystemAnimationType
ParticleSystemAnimationType = {}

---@class ParticleSystemCurveMode
ParticleSystemCurveMode = {}

---@class ParticleSystemCustomData
ParticleSystemCustomData = {}

---@class ParticleSystemScalingMode
ParticleSystemScalingMode = {}

---@class ParticleSystemSimulationSpace
ParticleSystemSimulationSpace = {}

---@class ParticleSystemStopBehavior
ParticleSystemStopBehavior = {}

---@class PersonalityGameStats: GameStatContainer
PersonalityGameStats = {}

---@class PooledPrefabReference
PooledPrefabReference = {}

---@class PopupChoice
PopupChoice = {}

---@class PrefabPart_String_
PrefabPart_String_ = {}

---@class PrefabPopup_AnnalieShopPopup_: UIPopup
PrefabPopup_AnnalieShopPopup_ = {}

---@class PrefabPopup_BotStatusAppPopup_: UIPopup
PrefabPopup_BotStatusAppPopup_ = {}

---@class PrefabPopup_BrowserPopup_: UIPopup
PrefabPopup_BrowserPopup_ = {}

---@class PrefabPopup_ClothierOrdersPopup_: UIPopup
PrefabPopup_ClothierOrdersPopup_ = {}

---@class PrefabPopup_FisherSellFishPopup_: UIPopup
PrefabPopup_FisherSellFishPopup_ = {}

---@class PrefabPopup_InputPopup_: UIPopup
PrefabPopup_InputPopup_ = {}

---@class PrefabPopup_NunRepairPopup_: UIPopup
PrefabPopup_NunRepairPopup_ = {}

---@class PrefabPopup_SheepPopup_: UIPopup
PrefabPopup_SheepPopup_ = {}

---@class PrefabPopup_SimplePopup_: UIPopup
PrefabPopup_SimplePopup_ = {}

---@class PrefabPopup_TimeoutSimplePopup_: UIPopup
PrefabPopup_TimeoutSimplePopup_ = {}

---@class RayTracingAccelerationStructure
RayTracingAccelerationStructure = {}

---@class ReadOnlySpan
ReadOnlySpan = {}

---@class ReadingSettings
ReadingSettings = {}

---@class RecipeIngredient
RecipeIngredient = {}

---@class Rect
Rect = {}

---@class RectInt
RectInt = {}

---@class RectTransform: Transform
RectTransform = {}

---@class Regex
Regex = {}

---@class RenderTexture: Texture
RenderTexture = {}

---@class RenderTextureSubElement
RenderTextureSubElement = {}

---@class Renderer: Component
Renderer = {}

---@class ResourcesReferenceLoader
ResourcesReferenceLoader = {}

---@class RoomScene: ViewScene
RoomScene = {}

---@class RuntimeEvent
RuntimeEvent = {}

---@class SayDialogPopup: StaticPopup
SayDialogPopup = {}

---@class SceneEnumFlag
SceneEnumFlag = {}

---@class ScriptableObject
ScriptableObject = {}

---@class SecondarySpriteTexture
SecondarySpriteTexture = {}

---@class SerializableAutomaticReference
SerializableAutomaticReference = {}

---@class SerializedLocalizedConversation: LocalizedConversation
SerializedLocalizedConversation = {}

---@class SerializedPart_String__CocktractPartnerPrefab_
SerializedPart_String__CocktractPartnerPrefab_ = {}

---@class SerializedPart_String__ShopPrefab_
SerializedPart_String__ShopPrefab_ = {}

---@class ShaderPropertyFlags
ShaderPropertyFlags = {}

---@class ShaderPropertyType
ShaderPropertyType = {}

---@class ShaderTagId
ShaderTagId = {}

---@class SheepPopup: PrefabPopup_SheepPopup_
SheepPopup = {}

---@class ShopPrefab: PrefabPart_String_
ShopPrefab = {}

---@class ShowerScene: ViewScene
ShowerScene = {}

---@class SimpleResult: Result
SimpleResult = {}

---@class SingletonLoadableMonoBehaviour_SaveSingleton_: MonoBehaviour
SingletonLoadableMonoBehaviour_SaveSingleton_ = {}

---@class SingletonMonoBehaviourBase: MonoBehaviour
SingletonMonoBehaviourBase = {}

---@class SingletonMonoBehaviour_GameUtilities_: SingletonMonoBehaviourBase
SingletonMonoBehaviour_GameUtilities_ = {}

---@class SingletonMonoBehaviour_Live2DControllerSingleton_: SingletonMonoBehaviourBase
SingletonMonoBehaviour_Live2DControllerSingleton_ = {}

---@class SingletonMonoBehaviour_ModUtilities_: SingletonMonoBehaviourBase
SingletonMonoBehaviour_ModUtilities_ = {}

---@class SingletonMonoBehaviour_SoundSingleton_: SingletonMonoBehaviourBase
SingletonMonoBehaviour_SoundSingleton_ = {}

---@class SingletonMonoBehaviour_StorySingleton_: SingletonMonoBehaviourBase
SingletonMonoBehaviour_StorySingleton_ = {}

---@class SingletonMonoBehaviour_ViewSingleton_: SingletonMonoBehaviourBase
SingletonMonoBehaviour_ViewSingleton_ = {}

---@class SingletonScriptableObject_FontDataGenerated_: ScriptableObject
SingletonScriptableObject_FontDataGenerated_ = {}

---@class SingletonScriptableObject_MusicDataGenerated_: ScriptableObject
SingletonScriptableObject_MusicDataGenerated_ = {}

---@class SingletonScriptableObject_OtherDataGenerated_: ScriptableObject
SingletonScriptableObject_OtherDataGenerated_ = {}

---@class SingletonScriptableObject_ShaderDataGenerated_: ScriptableObject
SingletonScriptableObject_ShaderDataGenerated_ = {}

---@class SingletonScriptableObject_SoundDataGenerated_: ScriptableObject
SingletonScriptableObject_SoundDataGenerated_ = {}

---@class SingletonScriptableObject_SpriteTextureDataGenerated_: ScriptableObject
SingletonScriptableObject_SpriteTextureDataGenerated_ = {}

---@class SingletonScriptableObject_TextDataGenerated_: ScriptableObject
SingletonScriptableObject_TextDataGenerated_ = {}

---@class SoapItemData
SoapItemData = {}

---@class SoapParticleType
SoapParticleType = {}

---@class SoapScript: MonoBehaviour
SoapScript = {}

---@class SpecialAudioLoop
SpecialAudioLoop = {}

---@class SpecialTextureHolder
SpecialTextureHolder = {}

---@class SpriteMeshType
SpriteMeshType = {}

---@class SpritePackingMode
SpritePackingMode = {}

---@class SpritePackingRotation
SpritePackingRotation = {}

---@class StaticPopup: UIPopup
StaticPopup = {}

---@class StockManager
StockManager = {}

---@class StoryAutoEntryPoint: StoryEntryPointGenericFlagBase_StoryAutoBranch_
StoryAutoEntryPoint = {}

---@class StoryBotDialogueAreaDefinition
StoryBotDialogueAreaDefinition = {}

---@class StoryBotDialogueBranchType
StoryBotDialogueBranchType = {}

---@class StoryBotDialogueStage: StoryEntryPointBase_StoryBotDialogueBranch_
StoryBotDialogueStage = {}

---@class StoryBotDialogueTag
StoryBotDialogueTag = {}

---@class StoryBotDialogueTagDefinition
StoryBotDialogueTagDefinition = {}

---@class StoryBranchGenericBase
StoryBranchGenericBase = {}

---@class StoryBranchGenericFlagBase: StoryBranchGenericBase
StoryBranchGenericFlagBase = {}

---@class StoryEmoteItemReference
StoryEmoteItemReference = {}

---@class StoryEntryPointBase_StoryBotDialogueBranch_
StoryEntryPointBase_StoryBotDialogueBranch_ = {}

---@class StoryEntryPointBase_TBranch_
StoryEntryPointBase_TBranch_ = {}

---@class StoryEntryPointGenericFlagBase_StoryAutoBranch_: StoryEntryPointBase_TBranch_
StoryEntryPointGenericFlagBase_StoryAutoBranch_ = {}

---@class StoryEntryPointGenericFlagBase_StoryMenuBranch_: StoryEntryPointBase_TBranch_
StoryEntryPointGenericFlagBase_StoryMenuBranch_ = {}

---@class StoryMenuEntryPoint: StoryEntryPointGenericFlagBase_StoryMenuBranch_
StoryMenuEntryPoint = {}

---@class Stream
Stream = {}

---@class Streamer
Streamer = {}

---@class StringAdvancedItemListItemPrefab: AdvancedItemListPrefab
StringAdvancedItemListItemPrefab = {}

---@class StringBuilder
StringBuilder = {}

---@class StringGenericDataDisplay: MonoBehaviour
StringGenericDataDisplay = {}

---@class SubViews
SubViews = {}

---@class TBranch
TBranch = {}

---@class TMP_ColorGradient
TMP_ColorGradient = {}

---@class TMP_FontAsset
TMP_FontAsset = {}

---@class TMP_SpriteAsset
TMP_SpriteAsset = {}

---@class TMP_Style
TMP_Style = {}

---@class TMP_StyleSheet
TMP_StyleSheet = {}

---@class TMP_Text
TMP_Text = {}

---@class TMP_TextInfo
TMP_TextInfo = {}

---@class TMP_VertexDataUpdateFlags
TMP_VertexDataUpdateFlags = {}

---@class TResource
TResource = {}

---@class Table
Table = {}

---@class TempoMap
TempoMap = {}

---@class TextAlignmentOptions
TextAlignmentOptions = {}

---@class TextOverflowModes
TextOverflowModes = {}

---@class TextRenderFlags
TextRenderFlags = {}

---@class TextWrappingModes
TextWrappingModes = {}

---@class Texture
Texture = {}

---@class Texture2D: Texture
Texture2D = {}

---@class Texture2DModFileAutomaticReference: ModFileAutomaticReference_Texture2D_
Texture2DModFileAutomaticReference = {}

---@class Texture2DSerializableAutomaticReference
Texture2DSerializableAutomaticReference = {}

---@class TextureDimension
TextureDimension = {}

---@class TextureMappingOptions
TextureMappingOptions = {}

---@class TimeDivision
TimeDivision = {}

---@class TimeSpan
TimeSpan = {}

---@class Tooltip: MonoBehaviour
Tooltip = {}

---@class TotalFishesCaughtCondition: StoryCondition
TotalFishesCaughtCondition = {}

---@class Transform: Component
Transform = {}

---@class TransformHandle
TransformHandle = {}

---@class TupleReference
TupleReference = {}

---@class Type
Type = {}

---@class UIManager
UIManager = {}

---@class UIPopup
UIPopup = {}

---@class UVChannelFlags
UVChannelFlags = {}

---@class UniTask
UniTask = {}

---@class UpdatableStateMachineState_ModelBrainState__ModelBrain_
UpdatableStateMachineState_ModelBrainState__ModelBrain_ = {}

---@class UploadResult
UploadResult = {}

---@class ValueTuple
ValueTuple = {}

---@class Variable
Variable = {}

---@class Vector2
Vector2 = {}

---@class Vector3
Vector3 = {}

---@class Vector4
Vector4 = {}

---@class VertexGradient
VertexGradient = {}

---@class VertexSortingOrder
VertexSortingOrder = {}

---@class VerticalAlignmentOptions
VerticalAlignmentOptions = {}

---@class View
View = {}

---@class ViewScene: ViewSceneBase
ViewScene = {}

---@class ViewSceneBase
ViewSceneBase = {}

---@class ViewWithSpriteRenderer: View
ViewWithSpriteRenderer = {}

---@class YieldInstruction
YieldInstruction = {}

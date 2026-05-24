---@meta

-- MDRG MoonSharp Lua API definitions for LuaLS.
-- Generated from docs.txt and curated data/*.json.
-- These files describe exposed types and signatures only; comments avoid undocumented runtime behavior.

---@class AraAraPersonalityModuleConversations: BasePersonalityModuleConversationContainer
---@field ContainerName string
---@field Frick_StartFrick SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockOutside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInsideAnal SerializedLocalizedConversation
---@field Frick_CumInside SerializedLocalizedConversation
---@field Frick_CumInsideAnal SerializedLocalizedConversation
---@field Frick_CumOutside SerializedLocalizedConversation
---@field Frick_CumTogether SerializedLocalizedConversation
---@field Frick_BotCumming SerializedLocalizedConversation
---@field Frick_Moan SerializedLocalizedConversation
---@field Frick_EdgingOn SerializedLocalizedConversation
---@field Frick_EdgingOff SerializedLocalizedConversation
---@field Frick_Headpat SerializedLocalizedConversation
---@field Frick_RapeBegStopSuccess SerializedLocalizedConversation
---@field Frick_RapeBegStopRefuse SerializedLocalizedConversation
---@field Frick_RapeFlacidReaction SerializedLocalizedConversation
---@field Frick_FingeringBotCumming SerializedLocalizedConversation
---@field Frick_FingeringDuring SerializedLocalizedConversation
---@field Frick_BoobFondle SerializedLocalizedConversation
---@field Frick_NipplePull SerializedLocalizedConversation
---@field Frick_PussySpread SerializedLocalizedConversation
---@field Frick_ClitRub SerializedLocalizedConversation
---@field Frick_Handholding SerializedLocalizedConversation
---@field Frick_UpsetOnlySheMoves SerializedLocalizedConversation
---@field Frick_CumThighjob SerializedLocalizedConversation
---@field Frick_FlacidBoredReaction SerializedLocalizedConversation
---@field Blowjob_EdgingAlmostCame SerializedLocalizedConversation
---@field Blowjob_EdgingHadToSlowdown SerializedLocalizedConversation
---@field Blowjob_EdgingForceStop SerializedLocalizedConversation
---@field Blowjob_SwallowFull SerializedLocalizedConversation
---@field Blowjob_SwallowHalf SerializedLocalizedConversation
---@field Blowjob_SwallowLittle SerializedLocalizedConversation
---@field Blowjob_SwallowAlmostEmpty SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotLead SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotRape SerializedLocalizedConversation
---@field Blowjob_SwallowWithMl SerializedLocalizedConversation
---@field Cowgirl_RemovePants SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsert SerializedLocalizedConversation
---@field Cowgirl_EdgingForceStopped SerializedLocalizedConversation
---@field Cowgirl_EdgingBreak SerializedLocalizedConversation
---@field Cowgirl_FlacidReaction SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestion SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestionDidntAnswer SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertRape SerializedLocalizedConversation
---@field Cowgirl_MadeMcCumInsideWhileCummingHerself SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobRape SerializedLocalizedConversation
---@field Cowgirl_AfterFirstInsertBotRape SerializedLocalizedConversation
AraAraPersonalityModuleConversations = {}

---@return AraAraPersonalityModuleConversations
function AraAraPersonalityModuleConversations.__new() end

---@class AtLeastOneBoolVariableTrueRequirement: ItemModifiableVariablesRequirement
---@field TargetVariableIndices integer[]
AtLeastOneBoolVariableTrueRequirement = {}

---@param targetIndices integer[]
---@return AtLeastOneBoolVariableTrueRequirement
function AtLeastOneBoolVariableTrueRequirement.__new(targetIndices) end

---Cria uma regra que exige ao menos uma das variaveis booleanas indicadas ativa.
---@param targetIndices integer[]
---@return AtLeastOneBoolVariableTrueRequirement
function AtLeastOneBoolVariableTrueRequirement.CreateInstance(targetIndices) end

---@overload fun(self: AtLeastOneBoolVariableTrueRequirement, item: Item, itemPrefab: ItemPrefab, lastModified: integer)
---@param item Item
---@param itemPrefab ItemPrefab
---@param lastModified integer
function AtLeastOneBoolVariableTrueRequirement.Enforce(item, itemPrefab, lastModified) end

---@overload fun(self: AtLeastOneBoolVariableTrueRequirement, item: Item, itemPrefab: ItemPrefab, modifiableVariableIndex: integer, newValue: boolean): boolean
---@param item Item
---@param itemPrefab ItemPrefab
---@param modifiableVariableIndex integer
---@param newValue boolean
---@return boolean
function AtLeastOneBoolVariableTrueRequirement.IsBoolChangeAllowed(item, itemPrefab, modifiableVariableIndex, newValue) end

---@overload fun(self: AtLeastOneBoolVariableTrueRequirement): string
---@return string
function AtLeastOneBoolVariableTrueRequirement.ToLuaString() end

---@overload fun(self: AtLeastOneBoolVariableTrueRequirement): ItemModifiableVariablesRequirement
---@return ItemModifiableVariablesRequirement
function AtLeastOneBoolVariableTrueRequirement.Clone() end

---@class BasePersonalityModuleConversationContainer: EmptyPersonalityModuleConversationContainer
---@field ContainerName string
---@field Frick_StartFrick SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockOutside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInsideAnal SerializedLocalizedConversation
---@field Frick_CumInside SerializedLocalizedConversation
---@field Frick_CumInsideAnal SerializedLocalizedConversation
---@field Frick_CumOutside SerializedLocalizedConversation
---@field Frick_CumTogether SerializedLocalizedConversation
---@field Frick_BotCumming SerializedLocalizedConversation
---@field Frick_Moan SerializedLocalizedConversation
---@field Frick_EdgingOn SerializedLocalizedConversation
---@field Frick_EdgingOff SerializedLocalizedConversation
---@field Frick_Headpat SerializedLocalizedConversation
---@field Frick_RapeBegStopSuccess SerializedLocalizedConversation
---@field Frick_RapeBegStopRefuse SerializedLocalizedConversation
---@field Frick_RapeFlacidReaction SerializedLocalizedConversation
---@field Frick_FingeringBotCumming SerializedLocalizedConversation
---@field Frick_FingeringDuring SerializedLocalizedConversation
---@field Frick_BoobFondle SerializedLocalizedConversation
---@field Frick_NipplePull SerializedLocalizedConversation
---@field Frick_PussySpread SerializedLocalizedConversation
---@field Frick_ClitRub SerializedLocalizedConversation
---@field Frick_Handholding SerializedLocalizedConversation
---@field Frick_UpsetOnlySheMoves SerializedLocalizedConversation
---@field Frick_CumThighjob SerializedLocalizedConversation
---@field Frick_FlacidBoredReaction SerializedLocalizedConversation
---@field Blowjob_EdgingAlmostCame SerializedLocalizedConversation
---@field Blowjob_EdgingHadToSlowdown SerializedLocalizedConversation
---@field Blowjob_EdgingForceStop SerializedLocalizedConversation
---@field Blowjob_SwallowFull SerializedLocalizedConversation
---@field Blowjob_SwallowHalf SerializedLocalizedConversation
---@field Blowjob_SwallowLittle SerializedLocalizedConversation
---@field Blowjob_SwallowAlmostEmpty SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotLead SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotRape SerializedLocalizedConversation
---@field Blowjob_SwallowWithMl SerializedLocalizedConversation
---@field Cowgirl_RemovePants SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsert SerializedLocalizedConversation
---@field Cowgirl_EdgingForceStopped SerializedLocalizedConversation
---@field Cowgirl_EdgingBreak SerializedLocalizedConversation
---@field Cowgirl_FlacidReaction SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestion SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestionDidntAnswer SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertRape SerializedLocalizedConversation
---@field Cowgirl_MadeMcCumInsideWhileCummingHerself SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobRape SerializedLocalizedConversation
---@field Cowgirl_AfterFirstInsertBotRape SerializedLocalizedConversation
BasePersonalityModuleConversationContainer = {}

---@class CatgirlPersonalityModuleConversations: BasePersonalityModuleConversationContainer
---@field ContainerName string
---@field Frick_StartFrick SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockOutside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInsideAnal SerializedLocalizedConversation
---@field Frick_CumInside SerializedLocalizedConversation
---@field Frick_CumInsideAnal SerializedLocalizedConversation
---@field Frick_CumOutside SerializedLocalizedConversation
---@field Frick_CumTogether SerializedLocalizedConversation
---@field Frick_BotCumming SerializedLocalizedConversation
---@field Frick_Moan SerializedLocalizedConversation
---@field Frick_EdgingOn SerializedLocalizedConversation
---@field Frick_EdgingOff SerializedLocalizedConversation
---@field Frick_Headpat SerializedLocalizedConversation
---@field Frick_RapeBegStopSuccess SerializedLocalizedConversation
---@field Frick_RapeBegStopRefuse SerializedLocalizedConversation
---@field Frick_RapeFlacidReaction SerializedLocalizedConversation
---@field Frick_FingeringBotCumming SerializedLocalizedConversation
---@field Frick_FingeringDuring SerializedLocalizedConversation
---@field Frick_BoobFondle SerializedLocalizedConversation
---@field Frick_NipplePull SerializedLocalizedConversation
---@field Frick_PussySpread SerializedLocalizedConversation
---@field Frick_ClitRub SerializedLocalizedConversation
---@field Frick_Handholding SerializedLocalizedConversation
---@field Frick_UpsetOnlySheMoves SerializedLocalizedConversation
---@field Frick_CumThighjob SerializedLocalizedConversation
---@field Frick_FlacidBoredReaction SerializedLocalizedConversation
---@field Blowjob_EdgingAlmostCame SerializedLocalizedConversation
---@field Blowjob_EdgingHadToSlowdown SerializedLocalizedConversation
---@field Blowjob_EdgingForceStop SerializedLocalizedConversation
---@field Blowjob_SwallowFull SerializedLocalizedConversation
---@field Blowjob_SwallowHalf SerializedLocalizedConversation
---@field Blowjob_SwallowLittle SerializedLocalizedConversation
---@field Blowjob_SwallowAlmostEmpty SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotLead SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotRape SerializedLocalizedConversation
---@field Blowjob_SwallowWithMl SerializedLocalizedConversation
---@field Cowgirl_RemovePants SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsert SerializedLocalizedConversation
---@field Cowgirl_EdgingForceStopped SerializedLocalizedConversation
---@field Cowgirl_EdgingBreak SerializedLocalizedConversation
---@field Cowgirl_FlacidReaction SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestion SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestionDidntAnswer SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertRape SerializedLocalizedConversation
---@field Cowgirl_MadeMcCumInsideWhileCummingHerself SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobRape SerializedLocalizedConversation
---@field Cowgirl_AfterFirstInsertBotRape SerializedLocalizedConversation
CatgirlPersonalityModuleConversations = {}

---@return CatgirlPersonalityModuleConversations
function CatgirlPersonalityModuleConversations.__new() end

---@class CocktwitchEmailSubReadEventTarget: EmailEventTarget
CocktwitchEmailSubReadEventTarget = {}

---@return CocktwitchEmailSubReadEventTarget
function CocktwitchEmailSubReadEventTarget.__new() end

---@overload fun(self: CocktwitchEmailSubReadEventTarget, parent: NewEmail): boolean
---@param parent NewEmail
---@return boolean
function CocktwitchEmailSubReadEventTarget.Start(parent) end

---@class CookingSong
---@field RuntimeData CookingSongRuntimeData
---@field IsUnlocked boolean
---@field Key GameId
---@field MusicReference IReference
---@field RuntimeDataGenerator fun(arg1: CookingSong): CookingSongRuntimeData
---@field Recipe Recipe
---@field IsUnlockedFunc fun(arg1: CookingMinigameManager): boolean
---@field HideIfLocked boolean
CookingSong = {}

---@param key GameId
---@param musicReference IReference
---@param runtimeDataGenerator fun(arg1: CookingSong): CookingSongRuntimeData
---@param recipe Recipe
---@param isUnlockedFunc? fun(arg1: CookingMinigameManager): boolean
---@param hideIfLocked? boolean
---@return CookingSong
function CookingSong.CreateInstance(key, musicReference, runtimeDataGenerator, recipe, isUnlockedFunc, hideIfLocked) end

---@overload fun(self: CookingSong): IMusicWithInfo
---@return IMusicWithInfo
function CookingSong.GetMusic() end

---@overload fun(self: CookingSong, cookingMinigameManager: CookingMinigameManager): boolean
---@param cookingMinigameManager CookingMinigameManager
---@return boolean
function CookingSong.IsUnlockedFast(cookingMinigameManager) end

---@overload fun(self: CookingSong): CookingSongSave
---@return CookingSongSave
function CookingSong.GetSave() end

---@class CookingSongRuntimeData
---@field RelatedCookingSong CookingSong
---@field SongTempoMap TempoMap
---@field SongOffsetSeconds number
---@field SongLengthSeconds number
---@field AverageBPM number
---@field MinBPM number
---@field MaxBPM number
---@field PixelsPerSecond number
---@field SongVersion integer
---@field Notes CookingSongNoteEvent[]
CookingSongRuntimeData = {}

---@overload fun(self: CookingSongRuntimeData): CookingSongDifficulty
---@return CookingSongDifficulty
function CookingSongRuntimeData.GetDefaultDifficulty() end

---@overload fun(self: CookingSongRuntimeData, modifiers: CookingGameplayModifiers): CookingSongDifficulty
---@param modifiers CookingGameplayModifiers
---@return CookingSongDifficulty
function CookingSongRuntimeData.GetDifficulty(modifiers) end

---@overload fun(self: CookingSongRuntimeData, modifiers: CookingGameplayModifiers): number
---@param modifiers CookingGameplayModifiers
---@return number
function CookingSongRuntimeData.GetSongLength(modifiers) end

---@overload fun(self: CookingSongRuntimeData, modifiers: CookingGameplayModifiers, minutes: integer, seconds: integer)
---@param modifiers CookingGameplayModifiers
---@param minutes integer
---@param seconds integer
function CookingSongRuntimeData.GetSongLengthDiscreet(modifiers, minutes, seconds) end

---@overload fun(self: CookingSongRuntimeData): CookingGameplayScoreData
---@return CookingGameplayScoreData
function CookingSongRuntimeData.GetPerfectScoreReadonly() end

---@param midiFile IReference
---@param cookingSong CookingSong
---@return CookingSongRuntimeData_Builder
function CookingSongRuntimeData.StartBuilder(midiFile, cookingSong) end

---@class CookingSongRuntimeData_Builder
---@field TempoMap TempoMap
---@field MidiFile MidiFile
---@field QuarterBeat BarBeatFractionTimeSpan
---@field HalfBeat BarBeatFractionTimeSpan
CookingSongRuntimeData_Builder = {}

---@param midiFile MidiFile
---@param cookingSong CookingSong
---@return CookingSongRuntimeData_Builder
function CookingSongRuntimeData_Builder.__new(midiFile, cookingSong) end

---@overload fun(self: CookingSongRuntimeData_Builder, channel: integer, buttonDeterminer: fun(arg1: CookingSongRuntimeData_Builder, arg2: integer, arg3: Note): NoteButtonTypeEnum, ignoreLength: boolean): CookingSongRuntimeData_Builder
---@overload fun(self: CookingSongRuntimeData_Builder, channel: integer, buttonDeterminer: fun(arg1: CookingSongRuntimeData_Builder, arg2: integer, arg3: Note): NoteButtonTypeEnum): CookingSongRuntimeData_Builder
---@param channel integer
---@param buttonDeterminer fun(arg1: CookingSongRuntimeData_Builder, arg2: integer, arg3: Note): NoteButtonTypeEnum
---@param ignoreLength? boolean
---@return CookingSongRuntimeData_Builder
function CookingSongRuntimeData_Builder.ChannelToNotes(channel, buttonDeterminer, ignoreLength) end

---@overload fun(self: CookingSongRuntimeData_Builder, channel: integer, button: NoteButtonTypeEnum, ignoreLength: boolean): CookingSongRuntimeData_Builder
---@overload fun(self: CookingSongRuntimeData_Builder, channel: integer, button: NoteButtonTypeEnum): CookingSongRuntimeData_Builder
---@param channel integer
---@param button NoteButtonTypeEnum
---@param ignoreLength? boolean
---@return CookingSongRuntimeData_Builder
function CookingSongRuntimeData_Builder.ChannelToNotesAllTheSame(channel, button, ignoreLength) end

---@overload fun(self: CookingSongRuntimeData_Builder, version: integer): CookingSongRuntimeData_Builder
---@param version integer
---@return CookingSongRuntimeData_Builder
function CookingSongRuntimeData_Builder.WithVersion(version) end

---@overload fun(self: CookingSongRuntimeData_Builder, difficulty: number): CookingSongRuntimeData_Builder
---@param difficulty number
---@return CookingSongRuntimeData_Builder
function CookingSongRuntimeData_Builder.WithPixelsPerSecondDifficulty(difficulty) end

---@overload fun(self: CookingSongRuntimeData_Builder, f: number): CookingSongRuntimeData_Builder
---@param f number
---@return CookingSongRuntimeData_Builder
function CookingSongRuntimeData_Builder.WithSongOffset(f) end

---@overload fun(self: CookingSongRuntimeData_Builder): CookingSongRuntimeData
---@return CookingSongRuntimeData
function CookingSongRuntimeData_Builder.Build() end

---@class CustomDataModule
---@field enabled boolean
CustomDataModule = {}

---@return CustomDataModule
function CustomDataModule.__new() end

---@overload fun(self: CustomDataModule, stream: ParticleSystemCustomData, gradient: MinMaxGradient)
---@param stream ParticleSystemCustomData
---@param gradient MinMaxGradient
function CustomDataModule.SetColor(stream, gradient) end

---@class Delivery
---@field TrackingNumber string
---@field DeliveryItems Item[]
---@field SentTime integer
---@field DeliveryDuration integer
---@field PremiumDeliveryBought boolean
---@field DeliveryValue integer
---@field PremiumDeliveryPrice integer
---@field ArrivalTime integer
---@field Sender SimpleLocalizedString
---@field TitleColor string
---@field Size string
Delivery = {}

---@param trackingNumber string
---@param deliveryItems Item[]
---@param sentTime integer
---@param deliveryDuration integer
---@param sender SimpleLocalizedString
---@return Delivery
function Delivery.__new(trackingNumber, deliveryItems, sentTime, deliveryDuration, sender) end

---@overload fun(self: Delivery, currentTime: integer, secondDelivery: Delivery): boolean
---@param currentTime integer
---@param secondDelivery Delivery
---@return boolean
function Delivery.CanBeJoined(currentTime, secondDelivery) end

---@overload fun(self: Delivery, newTrackingNumber: string, secondDelivery: Delivery)
---@param newTrackingNumber string
---@param secondDelivery Delivery
function Delivery.JoinPackages(newTrackingNumber, secondDelivery) end

---@overload fun(self: Delivery, currentTime: integer)
---@param currentTime integer
function Delivery.AcquirePremiumDelivery(currentTime) end

---@overload fun(self: Delivery, currentTime: integer): DeliveryStatus
---@param currentTime integer
---@return DeliveryStatus
function Delivery.Status(currentTime) end

---@overload fun(self: Delivery, uncertainityPercentage: number): integer
---@param uncertainityPercentage number
---@return integer
function Delivery.PredictedArrivalTime(uncertainityPercentage) end

---@overload fun(self: Delivery, time: integer): boolean
---@param time integer
---@return boolean
function Delivery.HasArrived(time) end

---@overload fun(self: Delivery): string
---@return string
function Delivery.ContentSummary() end

---@overload fun(self: Delivery): string
---@return string
function Delivery.StatusSummary() end

---@overload fun(self: Delivery): string
---@return string
function Delivery.TimeSummary() end

---@overload fun(self: Delivery): string
---@return string
function Delivery.LongSummary() end

---@overload fun(self: Delivery): string
---@return string
function Delivery.DeliveryTypeSummary() end

---@class DeliveryManager
---@field Deliveries Delivery[]
---@field FishingWebsiteSender SimpleLocalizedString
---@field UnknownSender SimpleLocalizedString
---@field MultipleSenders SimpleLocalizedString
---@field BDHSender SimpleLocalizedString
DeliveryManager = {}

---@return DeliveryManager
function DeliveryManager.__new() end

---@overload fun(timeTillDelivery: integer, sender: SimpleLocalizedString, contents: Item[]): Delivery
---@overload fun(self: DeliveryManager, serializableDeliveryData: SerializableDeliveryData): Delivery
---@overload fun(self: DeliveryManager, timeTillDelivery: integer, sender: SimpleLocalizedString, contents: Item[]): Delivery
---@param serializableDeliveryData SerializableDeliveryData
---@return Delivery
function DeliveryManager.CreateDelivery(serializableDeliveryData) end

---@overload fun(self: DeliveryManager, mainDelivery: Delivery)
---@param mainDelivery Delivery
function DeliveryManager.TryJoiningDelivery(mainDelivery) end

---@overload fun(self: DeliveryManager): boolean
---@return boolean
function DeliveryManager.UpdateDeliveries() end

---@overload fun(self: DeliveryManager): string
---@return string
function DeliveryManager.GenerateTrackingNumber() end

---@class DriverPersonalityModuleConversations: EmptyPersonalityModuleConversationContainer
---@field ContainerName string
---@field Moan SerializedLocalizedConversation
---@field IDrive SerializedLocalizedConversation
DriverPersonalityModuleConversations = {}

---@return DriverPersonalityModuleConversations
function DriverPersonalityModuleConversations.__new() end

---@class EmissionModule
---@field enabled boolean
---@field rateOverDistance MinMaxCurve
---@field rateOverDistanceMultiplier number
---@field burstCount integer
EmissionModule = {}

---@return EmissionModule
function EmissionModule.__new() end

---@overload fun(self: EmissionModule, index: integer): Burst
---@param index integer
---@return Burst
function EmissionModule.GetBurst(index) end

---@class EmptyPersonalityModuleConversationContainer: LocalizedStringReferenceContainer
---@field ContainerName string
EmptyPersonalityModuleConversationContainer = {}

---@class EventManager: GameVariablesSubClass
---@field RuntimeEvents RuntimeEvent[]
---@field DisableHungerAndMentalHealthInfo boolean
---@field RelatedGameVariables GameVariables
EventManager = {}

---@return EventManager
function EventManager.__new() end

---@return EventManager
function EventManager.CreateInstance() end

---@overload fun(self: EventManager)
function EventManager.OnBeforeSerialize() end

---@overload fun(self: EventManager)
function EventManager.OnAfterDeserialize() end

---@param toFill RuntimeEvent[]
function EventManager.FillRuntimeEvents(toFill) end

---@overload fun(self: EventManager)
function EventManager.ConvertOldShittyEvents() end

---@overload fun(self: EventManager)
function EventManager.SyncConditionalEvents() end

---@overload fun(self: EventManager): boolean
---@return boolean
function EventManager.SyncEvents() end

---@class FemcelPersonalityModuleConversations: BasePersonalityModuleConversationContainer
---@field ContainerName string
---@field Frick_StartFrick SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockOutside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInsideAnal SerializedLocalizedConversation
---@field Frick_CumInside SerializedLocalizedConversation
---@field Frick_CumInsideAnal SerializedLocalizedConversation
---@field Frick_CumOutside SerializedLocalizedConversation
---@field Frick_CumTogether SerializedLocalizedConversation
---@field Frick_BotCumming SerializedLocalizedConversation
---@field Frick_Moan SerializedLocalizedConversation
---@field Frick_EdgingOn SerializedLocalizedConversation
---@field Frick_EdgingOff SerializedLocalizedConversation
---@field Frick_Headpat SerializedLocalizedConversation
---@field Frick_RapeBegStopSuccess SerializedLocalizedConversation
---@field Frick_RapeBegStopRefuse SerializedLocalizedConversation
---@field Frick_RapeFlacidReaction SerializedLocalizedConversation
---@field Frick_FingeringBotCumming SerializedLocalizedConversation
---@field Frick_FingeringDuring SerializedLocalizedConversation
---@field Frick_BoobFondle SerializedLocalizedConversation
---@field Frick_NipplePull SerializedLocalizedConversation
---@field Frick_PussySpread SerializedLocalizedConversation
---@field Frick_ClitRub SerializedLocalizedConversation
---@field Frick_Handholding SerializedLocalizedConversation
---@field Frick_UpsetOnlySheMoves SerializedLocalizedConversation
---@field Frick_CumThighjob SerializedLocalizedConversation
---@field Frick_FlacidBoredReaction SerializedLocalizedConversation
---@field Blowjob_EdgingAlmostCame SerializedLocalizedConversation
---@field Blowjob_EdgingHadToSlowdown SerializedLocalizedConversation
---@field Blowjob_EdgingForceStop SerializedLocalizedConversation
---@field Blowjob_SwallowFull SerializedLocalizedConversation
---@field Blowjob_SwallowHalf SerializedLocalizedConversation
---@field Blowjob_SwallowLittle SerializedLocalizedConversation
---@field Blowjob_SwallowAlmostEmpty SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotLead SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotRape SerializedLocalizedConversation
---@field Blowjob_SwallowWithMl SerializedLocalizedConversation
---@field Cowgirl_RemovePants SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsert SerializedLocalizedConversation
---@field Cowgirl_EdgingForceStopped SerializedLocalizedConversation
---@field Cowgirl_EdgingBreak SerializedLocalizedConversation
---@field Cowgirl_FlacidReaction SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestion SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestionDidntAnswer SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertRape SerializedLocalizedConversation
---@field Cowgirl_MadeMcCumInsideWhileCummingHerself SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobRape SerializedLocalizedConversation
---@field Cowgirl_AfterFirstInsertBotRape SerializedLocalizedConversation
FemcelPersonalityModuleConversations = {}

---@return FemcelPersonalityModuleConversations
function FemcelPersonalityModuleConversations.__new() end

---@class FontDataGenerated: SingletonScriptableObject_FontDataGenerated_
---@field name string
---@field hideFlags HideFlags
---@field TextPrefabs TextPrefabsContainer
FontDataGenerated = {}

---@return FontDataGenerated
function FontDataGenerated.__new() end

---@overload fun(self: FontDataGenerated)
function FontDataGenerated.OnBeforeSerialize() end

---@overload fun(self: FontDataGenerated)
function FontDataGenerated.OnAfterDeserialize() end

---@overload fun(self: FontDataGenerated)
function FontDataGenerated.RegisterLua() end

---Identificador de item ou recurso do jogo, incluindo itens vanilla e itens registrados por mods.
---@class GameId
---@field IsVanilla boolean
---@field Id integer
---@field Guid Guid
---@field IsModded boolean
---@field Delimiter string
GameId = {}

---@return GameId
function GameId.__new() end

---@param id integer
---@return GameId
function GameId.__toGameId(id) end

---Cria vanilla e retorna GameId.
---@overload fun(id: CookingSongEnumGI): GameId
---@overload fun(id: FishingLocationEnumGI): GameId
---@overload fun(id: ItemModifierEnumGI): GameId
---@overload fun(id: integer): GameId
---@param id ItemEnum
---@return GameId
function GameId.CreateVanilla(id) end

---@param mod Mod
---@param id integer
---@return GameId
function GameId.CreateModded(mod, id) end

---@param guid Guid
---@param id integer
---@return GameId
function GameId.CreateGeneric(guid, id) end

---@param b1 GameId
---@param b2 GameId
---@return boolean
function GameId.op_Equality(b1, b2) end

---@param b1 GameId
---@param b2 GameId
---@return boolean
function GameId.op_Inequality(b1, b2) end

---@overload fun(b2: GameId): boolean
---@overload fun(self: GameId, obj: any): boolean
---@overload fun(self: GameId, b2: GameId): boolean
---@param obj any
---@return boolean
function GameId.Equals(obj) end

---@overload fun(self: GameId): integer
---@return integer
function GameId.GetHashCode() end

---@overload fun(self: GameId): string
---@return string
function GameId.ToString() end

---@overload fun(self: GameId): string
---@return string
function GameId.ToLuaString() end

---@overload fun(self: GameId, other: GameId): integer
---@param other GameId
---@return integer
function GameId.CompareTo(other) end

---@overload fun(self: GameId): string
---@return string
function GameId.ToShortString() end

---@param s string
---@param gameId GameId
---@return boolean
function GameId.FromShortString(s, gameId) end

---@class GameLogoContainer
---@field Logo_B_empty SerializableAutomaticReference
---@field Logo_B_small SerializableAutomaticReference
---@field Logo_C_small SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
GameLogoContainer = {}

---@return GameLogoContainer
function GameLogoContainer.__new() end

---Utilitarios gerais do jogo expostos ao Lua, incluindo transicoes de view, inventario e esperas para coroutine.
---@class GameUtilities: SingletonMonoBehaviour_GameUtilities_
---SaveContainer atual usado por scripts internos para global flags.
---@field Save SaveContainer
---@field SaveSingleton SaveSingleton
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
GameUtilities = {}

---@return GameUtilities
function GameUtilities.__new() end

---@overload fun(self: GameUtilities, item: Item)
---@param item Item
function GameUtilities.AddItemToInventory(item) end

---@overload fun(self: GameUtilities, targetView: View, afterFinished: fun(), duration: number, fadeOut: boolean, color: Color|nil)
---@overload fun(self: GameUtilities, targetView: View, afterFinished: fun(), duration: number, fadeOut: boolean)
---@overload fun(self: GameUtilities, targetView: View, afterFinished: fun(), duration: number)
---@overload fun(self: GameUtilities, targetView: View, afterFinished: fun())
---@overload fun(self: GameUtilities, targetView: View)
---@param targetView View
---@param afterFinished? fun()
---@param duration? number
---@param fadeOut? boolean
---@param color? Color|nil
function GameUtilities.FadeToView(targetView, afterFinished, duration, fadeOut, color) end

---@overload fun(self: GameUtilities)
function GameUtilities.GetCurrentYearToInteger() end

---@overload fun(self: GameUtilities, targetView: View, afterFinished: fun(), duration: number, panType: PanType)
---@overload fun(self: GameUtilities, targetView: View, afterFinished: fun(), duration: number)
---@overload fun(self: GameUtilities, targetView: View, afterFinished: fun())
---@overload fun(self: GameUtilities, targetView: View)
---@param targetView View
---@param afterFinished? fun()
---@param duration? number
---@param panType? PanType
function GameUtilities.MoveToView(targetView, afterFinished, duration, panType) end

---@overload fun(self: GameUtilities, targetView: View, afterFinished: fun(), duration: number)
---@overload fun(self: GameUtilities, targetView: View, afterFinished: fun())
---@param targetView View
---@param afterFinished fun()
---@param duration? number
function GameUtilities.FadeOrMoveToView(targetView, afterFinished, duration) end

---Creates a WaitForSeconds yield instruction for coroutine delays.
---@overload fun(self: GameUtilities, seconds: number): WaitForSeconds
---@param seconds number
---@return WaitForSeconds
function GameUtilities.WaitForSecondsYield(seconds) end

---Estado global do jogo exposto para leitura, escrita e condicoes.
---@class GameVariables
---@field VisibleEmails NewEmail[]
---@field AreGameStatsValid boolean
---@field CurrentGameVersion string
---@field ShopManager ShopManager
---@field TimesCameAll integer
---@field JournalPath string
---@field BotKnowsAboutStreaming boolean
---@field BotSaidSheCanTasteOnlyCum boolean
---@field StartedStreamingAfterPrologue boolean
---@field BotWasJealousOfNun boolean
---@field ZombieApocalypseDialogueHappened boolean
---@field FirstHorrorStoryDialogueHappened boolean
---@field SecondHorrorStoryHappened boolean
---@field HasAnySoap boolean
---@field TimesShoweredTogether integer
---@field TimesAnonShower integer
---@field TimesBotShower integer
---@field CookedDishesCount integer
---@field DishesPassedAtLeastBCount integer
---@field CanTakeFisherToShow boolean
---@field HasGoodChurchEnding boolean
---@field CanTakeShaniceToShow boolean
---@field TimesAnonCameDuringLastSexScene integer
---@field MadeNoiseLastSexScene boolean
---@field IsThereCumOnHer boolean
---@field IsBotAwake boolean
---@field IsBotSmart boolean
---@field TimeDay integer
---@field Day integer
---@field Hour integer
---@field Minute integer
---@field GameDateTime DateTime
---@field DayOfTheWeek integer
---@field FishesCaught integer
---@field DifferentFishesCaught integer
---@field HasAtLeastOneLeg boolean
---@field HasBothLegs boolean
---@field HasAtLeastOneArm boolean
---@field HasBothArms boolean
---@field HasAtLeast5UnhealthyFoods boolean
---@field IsWearingPanties boolean
---@field AfterSexCleanedCount integer
---@field AfterSexLeftCount integer
---@field UsuallyCleansCumAfterSex boolean
---@field UsuallyLeavesCumAfterSex boolean
---@field HasBothLegsAndAtLeastOneArm boolean
---@field HasAllLimbs boolean
---@field CanDoDoggy boolean
---@field CanDoBlowjob boolean
---@field CanDoCowgirl boolean
---@field ReadyForNextStage boolean
---@field IsWearingCatEars boolean
---@field CanStand boolean
---@field IsWearingAnyClothes boolean
---@field CanEnableSlowMode boolean
---@field IsRentDue boolean
---@field IsAboveADayLateOnRent boolean
---@field IsNaked boolean
---@field IsAnnalieOnIslandEnding boolean
---@field IsFisherOnIslandEnding boolean
---@field IsLandlordOnIslandEnding boolean
---@field IsBritanniaOnIslandEnding boolean
---@field IsShaniceAndPriestbotOnIslandEnding boolean
---@field IsEveryoneOnTheIsland boolean
---@field HasTheOptionToGoOutsideWithBot boolean
---@field CanGoOutsideWithBot boolean
---@field IsItSafeToStartLongActivity boolean
---@field EnoughStaminaForLongActivity boolean
---@field HasMetAnnalie boolean
---@field CanCook boolean
---@field HasAnnalieHairstyle boolean
---@field BathroomDoorInstalled boolean
---@field FirstShowerHappened boolean
---@field sus number
---@field BotDiscoveryRentIncreaseValue integer
---@field WeeklyRent integer
---@field susandsearch number
---@field MoneySpentOnClothes integer
---@field Random01 number
---@field CanHalloweenStart boolean
---@field HalloweenActive boolean
---@field HalloweenStarted boolean
---@field HalloweenHappened boolean
---@field MajorOutsideEventActive boolean
---@field AnyChurchEndingDone boolean
---@field WorkedTodayAlready boolean
---@field EnoughStaminaToWork boolean
---@field LandlordDecorationsUp boolean
---@field EverCameInBot boolean
---@field SpiderPlushUp boolean
---@field HasWitchHat boolean
---@field BotMetAnnalie boolean
---@field HasPointyEars boolean
---@field IsLateGame boolean
---@field RiotsActive boolean
---@field RiotsEndingSoon boolean
---@field RiotsAfter boolean
---@field HasHalloweenCostume boolean
---@field MedicineDiscount number
---@field DispenserLevel integer
---@field ClothierItemsBought integer
---@field EverStartedStream boolean
---@field NeverStartedStream boolean
---@field CanStartStream boolean
---@field Current GameVariables
---@field ClassDescription GameVariablesClassDescription
---@field AllFlags string[]
---@field VinegaraActive boolean
---@field DeathGripActive boolean
---@field RemainingCum number
---@field MaxCum number
---@field Stamina number
---@field IsOutOfStamina boolean
---@field Satiation number
---@field RealMentalHealth number
---@field MentalHealth number
---@field MentalHealthTemporary number
---@field InverseMentalHealth number
---@field Health number
---@field CurrentHorniness number
---@field lust integer
---@field sympathy integer
---@field PotentialHorniness number
---@field Longing number
---@field Mood number
---@field Inteligence integer
---@field CumInside number
---@field CumInsideAnal number
---@field CumInsideStomach number
---@field UniqueConversationsLeft integer
---@field TimeSinceLastWentToChurch integer
---@field TimeSinceLastCuddle integer
---@field AwakeFor integer
---@field EverFuckedBot boolean
---@field TimeSinceLastFuck integer
---@field TimeSinceBotCame integer
---@field TimeSinceLastInteract integer
---@field TimeSinceLastEquipment integer
---@field TimeSinceLastWentOutsideWithBot integer
---@field TimeSinceLastSawBot integer
---@field TimeSinceLastStream integer
---@field TimeSinceLastTalk integer
---@field TimeSinceBotLastStartedTalk integer
---@field TimeSinceLastHeadpat integer
---@field TimeSinceLastAnonsShower integer
---@field DaysSinceLastAnonsShower integer
---@field TimeSinceLastBotClean integer
---@field DaysSinceLastBotClean integer
---@field TimeSinceLastHungerInfo integer
---@field TimeForNextMentalHealthInfo boolean
---@field TimeSinceLastMentalHealthInfo integer
---@field gameVersion string
---@field stockManager StockManager
---@field itemManager ItemManager
---@field eventManager EventManager
---@field cockTwitchManager CockTwitchManager
---@field cocktractManager CocktractManager
---@field deliveryManager DeliveryManager
---@field cookingMinigameManager CookingMinigameManager
---@field fishingMinigameManager FishingMinigameManager
---@field botStatusAppManager BotStatusAppManager
---@field joinUsBlogManager JoinUsBlogManager
---@field customData SpecialVariablesHolder
---@field timesWentToChurch integer
---@field streamCount integer
---@field streamedFor integer
---@field moneyEarnedFromDonations integer
---@field longestStream integer
---@field timesCameInside integer
---@field timesCameInsideAnal integer
---@field timesCameThighjob integer
---@field timesCameOutside integer
---@field timesCameInMouth integer
---@field mlCameInMouth number
---@field mlCameInVagina number
---@field mlCameInAss number
---@field mlCameFromThighjob number
---@field mlCameOutside number
---@field mlOfCumWasted number
---@field timesLostChess integer
---@field timesWonChess integer
---@field timesLostOldMaid integer
---@field timesWonOldMaid integer
---@field timesRanAwayOldMaid integer
---@field timesLostWordChain integer
---@field timesWonWordChain integer
---@field lightSwitchOn boolean
---@field bathroomLightOn boolean
---Gerenciador de noticias acessado por scripts internos de cena.
---@field newsDataManager NewsDataManager
---@field dialogueChainData SerializableDictStringDialogueChainMemory
---@field statusText string
---@field FollowersNeededForSlowMode integer
---@field search number
---@field priestBotPoints integer
---@field nunPoints integer
---@field money integer
---@field maxMoney integer
---@field casinoTokens integer
---@field vinegaraEffectEnd integer
---@field deathGripEffectEnd integer
---@field MaxCumSafeAmount number
---@field MaxCumAliveAmount number
---@field botLive2DCommonState Live2DControllerCommonState
---@field playerName string
---@field botName string
---@field StageInteligenceLimit integer[]
---@field stage integer
---@field time integer
---@field lastWorkedAtDay integer
---@field lastWentToChurchAt integer
---@field lastCuddledAt integer
---@field lastSleptWithBot boolean
---@field lastWokeUpAt integer
---@field lastFuckedAt integer
---@field lastBotCameAt integer
---@field lastInteractAt integer
---@field lastEquipmentAt integer
---@field lastOutsideWithBotAt integer
---@field lastStreamedAt integer
---@field lastTalkedAt integer
---@field lastBotStartedTalkAt integer
---@field lastHeadpatedAt integer
---@field lastAnonsShowerAt integer
---@field leastBotCleanAt integer
---@field lastHungerInfoAt integer
---@field lastMentalHealthInfoAt integer
---@field subs integer
---@field followers integer
GameVariables = {}

---Remove emails do save pelo id informado.
---@overload fun(self: GameVariables, id: string)
---@param id string
function GameVariables.RemoveAllEmailsWithId(id) end

---@overload fun(self: GameVariables, email: NewEmail)
---@param email NewEmail
function GameVariables.RemoveEmail(email) end

---@overload fun(self: GameVariables)
function GameVariables.RemoveOpenedSpamEmails() end

---@overload fun(self: GameVariables, email: NewEmail)
---@param email NewEmail
function GameVariables.AddEmail(email) end

---@overload fun(self: GameVariables, email: NewEmail, planningData: PlanningData)
---@param email NewEmail
---@param planningData PlanningData
function GameVariables.PlanEmail(email, planningData) end

---@overload fun(self: GameVariables)
function GameVariables.OnBeforeSerializeEmail() end

---@overload fun(self: GameVariables)
function GameVariables.OnAfterDeserializeEmail() end

---@overload fun(self: GameVariables)
function GameVariables.InvalidateGameStats() end

---@overload fun(self: GameVariables): GameStats
---@return GameStats
function GameVariables.GetGameStats() end

---@overload fun(self: GameVariables): PersonalityGameStats
---@return PersonalityGameStats
function GameVariables.GetPersonalityGameStats() end

---@param time integer
---@param money integer
---@return GameVariables
function GameVariables.CreateStartOfTheGame(time, money) end

---@overload fun(self: GameVariables)
function GameVariables.NewGameInitialization() end

---@overload fun(self: GameVariables): boolean
---@return boolean
function GameVariables.IsAValidSaveAfter075Update() end

---@overload fun(self: GameVariables, infoText: string): Result
---@param infoText string
---@return Result
function GameVariables.TransitionGameVersion(infoText) end

---@overload fun(self: GameVariables, colors: Color[])
---@param colors Color[]
function GameVariables.SetPresetColors(colors) end

---@overload fun(self: GameVariables): Color[]
---@return Color[]
function GameVariables.GetPresetColors() end

---@overload fun(self: GameVariables, source: string): DialogueChainMemory
---@param source string
---@return DialogueChainMemory
function GameVariables.GetDialogueChainMemory(source) end

---@overload fun(self: GameVariables)
function GameVariables.OnAfterDeserializeDialogueChain() end

---@overload fun(self: GameVariables)
function GameVariables.BeforeUnload() end

---@overload fun(self: GameVariables)
function GameVariables.AfterLoad() end

---@overload fun(self: GameVariables, daysTillRent: integer, paidToday: boolean)
---@param daysTillRent integer
---@param paidToday boolean
function GameVariables.GetRentData(daysTillRent, paidToday) end

---@overload fun(self: GameVariables)
function GameVariables.UpdateRentStatus() end

---@overload fun(self: GameVariables, type: StaminaSyncType, suppressEvents: boolean)
---@param type StaminaSyncType
---@param suppressEvents boolean
function GameVariables.MinutePassed(type, suppressEvents) end

---@overload fun(self: GameVariables, item: Item)
---@param item Item
function GameVariables.Eat(item) end

---@overload fun(self: GameVariables): number
---@return number
function GameVariables.ExtractCumFromBalls() end

---@overload fun(self: GameVariables): number
---@return number
function GameVariables.GetCumPercent() end

---@overload fun(self: GameVariables): string
---@return string
function GameVariables.CumStatus() end

---@overload fun(self: GameVariables): string
---@return string
function GameVariables.SatiationStatus() end

---@overload fun(self: GameVariables): string
---@return string
function GameVariables.HealthStatus() end

---@overload fun(self: GameVariables): string
---@return string
function GameVariables.AnonShowerStatus() end

---@overload fun(self: GameVariables): string
---@return string
function GameVariables.BotShowerStatus() end

---@overload fun(self: GameVariables): string
---@return string
function GameVariables.FullStatusText() end

---@overload fun(self: GameVariables)
function GameVariables.AnonShowerEffect() end

---@overload fun(self: GameVariables)
function GameVariables.BotShowerEffect() end

---Aplica o efeito interno de limpeza do bot com pano.
---@overload fun(self: GameVariables)
function GameVariables.BotCleanWithRagEffect() end

---@overload fun(self: GameVariables)
function GameVariables.CleanCumOutside() end

---@overload fun(self: GameVariables)
function GameVariables.ManifestHorninessAndResetFrickData() end

---@overload fun(self: GameVariables)
function GameVariables.EndSex() end

---Limpa ou reseta o estado de humor atual.
---@overload fun(self: GameVariables)
function GameVariables.ClearMood() end

---@overload fun(self: GameVariables)
function GameVariables.OnBeforeSerialize() end

---@overload fun(self: GameVariables)
function GameVariables.OnAfterDeserialize() end

---@overload fun(self: GameVariables, flag: string, defaultValue: integer): integer
---@overload fun(self: GameVariables, flag: string): integer
---@param flag string
---@param defaultValue? integer
---@return integer
function GameVariables.GetFlagLastTimeOrDefault(flag, defaultValue) end

---@overload fun(self: GameVariables, flagString: string, flag: Flag): boolean
---@param flagString string
---@param flag Flag
---@return boolean
function GameVariables.TryGetFlag(flagString, flag) end

---@overload fun(self: GameVariables, flag: string)
---@param flag string
function GameVariables.AddFlag(flag) end

---@overload fun(self: GameVariables, flag: string)
---@param flag string
function GameVariables.RemoveFlag(flag) end

---Verifica uma flag de historia/save.
---@overload fun(self: GameVariables, flag: MdrgKnownStoryFlagId|string): boolean
---@param flag MdrgKnownStoryFlagId|string
---@return boolean
function GameVariables.CheckFlag(flag) end

---Conta flags/estados relacionados a um identificador ou prefixo.
---@overload fun(self: GameVariables, flag: MdrgKnownStoryFlagId|string): integer
---@param flag MdrgKnownStoryFlagId|string
---@return integer
function GameVariables.GetFlagSetCount(flag) end

---Verifica uma flag considerando limite relativo de tempo.
---@overload fun(self: GameVariables, flag: MdrgKnownStoryFlagId|string, t: integer): boolean
---@param flag MdrgKnownStoryFlagId|string
---@param t integer
---@return boolean
function GameVariables.CheckFlagBeforeRelative(flag, t) end

---Verifica se uma flag existe ha pelo menos certo tempo relativo.
---@overload fun(self: GameVariables, flag: MdrgKnownStoryFlagId|string, t: integer): boolean
---@param flag MdrgKnownStoryFlagId|string
---@param t integer
---@return boolean
function GameVariables.CheckFlagAfterRelative(flag, t) end

---@overload fun(self: GameVariables, flag: MdrgKnownStoryFlagId|string, timePeriod: integer, timeCheck: TimeCheckType): boolean
---@param flag MdrgKnownStoryFlagId|string
---@param timePeriod integer
---@param timeCheck TimeCheckType
---@return boolean
function GameVariables.CheckFlagWithTime(flag, timePeriod, timeCheck) end

---@overload fun(self: GameVariables, flag: MdrgKnownStoryFlagId|string, type: CheckType): boolean
---@param flag MdrgKnownStoryFlagId|string
---@param type CheckType
---@return boolean
function GameVariables.CheckFlagSpecial(flag, type) end

---@overload fun(self: GameVariables, flag: MdrgKnownStoryFlagId|string, type: CheckType, timePeriod: integer, timeCheck: TimeCheckType): boolean
---@param flag MdrgKnownStoryFlagId|string
---@param type CheckType
---@param timePeriod integer
---@param timeCheck TimeCheckType
---@return boolean
function GameVariables.CheckFlagSpecialWithTime(flag, type, timePeriod, timeCheck) end

---@param timeCheckType TimeCheckType
---@param value string
---@return string
function GameVariables.TimeCheckTypeString(timeCheckType, value) end

---@overload fun(self: GameVariables)
function GameVariables.ResetChurchStoryline() end

---Tenta remover dinheiro e retorna sucesso ou falha.
---@overload fun(self: GameVariables, amount: integer): boolean
---@param amount integer
---@return boolean
function GameVariables.TryTakeMoney(amount) end

---Remove dinheiro diretamente e retorna se a operacao foi aplicada.
---@overload fun(self: GameVariables, amount: integer): boolean
---@param amount integer
---@return boolean
function GameVariables.ForceTakeMoney(amount) end

---@overload fun(self: GameVariables, amount: integer)
---@param amount integer
function GameVariables.AddMoney(amount) end

---@overload fun(self: GameVariables, ml: number)
---@param ml number
function GameVariables.SwallowCum(ml) end

---@overload fun(self: GameVariables, name: string)
---@param name string
function GameVariables.SetPlayerName(name) end

---@overload fun(self: GameVariables, name: string)
---@param name string
function GameVariables.SetBotName(name) end

---Registra o fim de uma rotina de sono.
---@overload fun(self: GameVariables, withBot: boolean)
---@param withBot boolean
function GameVariables.ReportSleepEnd(withBot) end

---@param time integer
---@return DateTime
function GameVariables.RawGameTimeToGameDateTime(time) end

---@param time integer
---@return integer
function GameVariables.TimeToDayOfTheWeek(time) end

---@param day integer
---@return integer
function GameVariables.DayToDayOfTheWeek(day) end

---@param time integer
---@return integer
function GameVariables.TimeToDay(time) end

---@param day integer
---@param hour integer
---@param minute integer
---@return integer
function GameVariables.TimeFromDate(day, hour, minute) end

---Calcula uma posicao de tempo no dia a partir de hora e minuto.
---@param hour integer
---@param minute integer
---@return integer
function GameVariables.TimeInDay(hour, minute) end

---@param time integer
---@return string
function GameVariables.TimeToHourString(time) end

---@param time integer
---@return string
function GameVariables.TimeToDateString(time) end

---@param time integer
---@param number integer
---@return integer
function GameVariables.LastMultiple(time, number) end

---@param occuredTime integer
---@param currentTime integer
---@param recentTimeMinutes? integer
---@return boolean
function GameVariables.HappenedRecently(occuredTime, currentTime, recentTimeMinutes) end

---@param time integer
---@return integer
function GameVariables.TimeToHour(time) end

---@class HimederePersonalityModuleConversations: BasePersonalityModuleConversationContainer
---@field ContainerName string
---@field Frick_StartFrick SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockOutside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInsideAnal SerializedLocalizedConversation
---@field Frick_CumInside SerializedLocalizedConversation
---@field Frick_CumInsideAnal SerializedLocalizedConversation
---@field Frick_CumOutside SerializedLocalizedConversation
---@field Frick_CumTogether SerializedLocalizedConversation
---@field Frick_BotCumming SerializedLocalizedConversation
---@field Frick_Moan SerializedLocalizedConversation
---@field Frick_EdgingOn SerializedLocalizedConversation
---@field Frick_EdgingOff SerializedLocalizedConversation
---@field Frick_Headpat SerializedLocalizedConversation
---@field Frick_RapeBegStopSuccess SerializedLocalizedConversation
---@field Frick_RapeBegStopRefuse SerializedLocalizedConversation
---@field Frick_RapeFlacidReaction SerializedLocalizedConversation
---@field Frick_FingeringBotCumming SerializedLocalizedConversation
---@field Frick_FingeringDuring SerializedLocalizedConversation
---@field Frick_BoobFondle SerializedLocalizedConversation
---@field Frick_NipplePull SerializedLocalizedConversation
---@field Frick_PussySpread SerializedLocalizedConversation
---@field Frick_ClitRub SerializedLocalizedConversation
---@field Frick_Handholding SerializedLocalizedConversation
---@field Frick_UpsetOnlySheMoves SerializedLocalizedConversation
---@field Frick_CumThighjob SerializedLocalizedConversation
---@field Frick_FlacidBoredReaction SerializedLocalizedConversation
---@field Blowjob_EdgingAlmostCame SerializedLocalizedConversation
---@field Blowjob_EdgingHadToSlowdown SerializedLocalizedConversation
---@field Blowjob_EdgingForceStop SerializedLocalizedConversation
---@field Blowjob_SwallowFull SerializedLocalizedConversation
---@field Blowjob_SwallowHalf SerializedLocalizedConversation
---@field Blowjob_SwallowLittle SerializedLocalizedConversation
---@field Blowjob_SwallowAlmostEmpty SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotLead SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotRape SerializedLocalizedConversation
---@field Blowjob_SwallowWithMl SerializedLocalizedConversation
---@field Cowgirl_RemovePants SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsert SerializedLocalizedConversation
---@field Cowgirl_EdgingForceStopped SerializedLocalizedConversation
---@field Cowgirl_EdgingBreak SerializedLocalizedConversation
---@field Cowgirl_FlacidReaction SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestion SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestionDidntAnswer SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertRape SerializedLocalizedConversation
---@field Cowgirl_MadeMcCumInsideWhileCummingHerself SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobRape SerializedLocalizedConversation
---@field Cowgirl_AfterFirstInsertBotRape SerializedLocalizedConversation
HimederePersonalityModuleConversations = {}

---@return HimederePersonalityModuleConversations
function HimederePersonalityModuleConversations.__new() end

---@class ILive2DControllerManager_EndUsage
ILive2DControllerManager_EndUsage = {}

---@overload fun(self: ILive2DControllerManager_EndUsage)
function ILive2DControllerManager_EndUsage.EndUsage() end

---@class ILive2DControllerManager_FixedUpdate
ILive2DControllerManager_FixedUpdate = {}

---@overload fun(self: ILive2DControllerManager_FixedUpdate)
function ILive2DControllerManager_FixedUpdate.FixedUpdate() end

---@class ILive2DControllerManager_OnDisable
ILive2DControllerManager_OnDisable = {}

---@overload fun(self: ILive2DControllerManager_OnDisable)
function ILive2DControllerManager_OnDisable.OnDisable() end

---@class ILive2DControllerManager_ResetStage1
ILive2DControllerManager_ResetStage1 = {}

---@overload fun(self: ILive2DControllerManager_ResetStage1)
function ILive2DControllerManager_ResetStage1.ResetStage1() end

---@class ILive2DControllerManager_SerializedState
ILive2DControllerManager_SerializedState = {}

---@overload fun(self: ILive2DControllerManager_SerializedState, state: Live2DControllerCommonState)
---@param state Live2DControllerCommonState
function ILive2DControllerManager_SerializedState.SaveState(state) end

---@overload fun(self: ILive2DControllerManager_SerializedState, state: Live2DControllerCommonState)
---@param state Live2DControllerCommonState
function ILive2DControllerManager_SerializedState.LoadState(state) end

---@class ILive2DControllerManager_StartUsageGameplay
ILive2DControllerManager_StartUsageGameplay = {}

---@overload fun(self: ILive2DControllerManager_StartUsageGameplay)
function ILive2DControllerManager_StartUsageGameplay.StartUsageGameplay() end

---@class ILive2DControllerManager_Update
ILive2DControllerManager_Update = {}

---@overload fun(self: ILive2DControllerManager_Update)
function ILive2DControllerManager_Update.Update() end

---@class Live2DBlowjobController: Live2DLewdSceneController
---@field ControllerEnum ControllerEnum
---@field SceneEnum SceneEnumFlag
---@field IsPantsAside boolean
---@field HeadHeld boolean
---@field MouthInsertionHandler InsertionHandler
---@field MouthFuckAxis BlowjobCockInsertionFuckAxis
---@field FrickStaticGuiManager FrickStaticGuiManager
---@field InsertionManager InsertionManager
---@field CockManager ICockManager
---@field TipHeight number
---@field ParamEnableThumbMouth Live2DParameter
---@field ParamThumbMouthX Live2DParameter
---@field ParamHairPhysicsBaseToShort Live2DParameter
---@field ParamHairPhysicsShortToMid Live2DParameter
---@field ParamHairPhysicsMidToLong Live2DParameter
---@field Param_Angle_Rotation_1_TailMain Live2DParameter
---@field Param_Angle_Rotation_2_TailMain Live2DParameter
---@field Param_Angle_Rotation_3_TailMain Live2DParameter
---@field Param_Angle_Rotation_4_TailMain Live2DParameter
---@field Param_Angle_Rotation_5_TailMain Live2DParameter
---@field Param_Angle_Rotation_6_TailMain Live2DParameter
---@field Param_Angle_Rotation_7_TailMain Live2DParameter
---@field Param_Angle_Rotation_8_TailMain Live2DParameter
---@field Param_Angle_Rotation_9_TailMain Live2DParameter
---@field ParamTailWiggle Live2DParameter
---@field ParamCumInMouth Live2DParameter
---@field ParamHideCumShot Live2DParameter
---@field ParamCumShotAnim Live2DParameter
---@field ParamFlacidity Live2DParameter
---@field ParamDickAngleY Live2DParameter
---@field ParamHeadMovementY Live2DParameter
---@field ParamCumOutsideY Live2DParameter
---@field ParamBodyY Live2DParameter
---@field ParamBodyX Live2DParameter
---@field ParamCockAngleZ Live2DParameter
---@field ParamForceMouthOpen Live2DParameter
---@field ParamEyeRShock Live2DParameter
---@field ParamEyeLShock Live2DParameter
---@field ParamBrowLRot Live2DParameter
---@field ParamBrowRRot Live2DParameter
---@field ParamBrowLEmote Live2DParameter
---@field ParamBrowREmote Live2DParameter
---@field ParamEyeOpen Live2DParameter
---@field ParamEyesHappy Live2DParameter
---@field ParamIrisZoom Live2DParameter
---@field ParamHeart Live2DParameter
---@field ParamEyeballRX Live2DParameter
---@field ParamEyeballRY Live2DParameter
---@field ParamEyeballLX Live2DParameter
---@field ParamEyeballLY Live2DParameter
---@field ParamMouthOpen Live2DParameter
---@field ParamSaliva Live2DParameter
---@field ParamToungeX Live2DParameter
---@field ParamToungeY Live2DParameter
---@field ParamBlush Live2DParameter
---@field ParamHeadZ Live2DParameter
---@field ParamHeadX Live2DParameter
---@field ParamHeadY Live2DParameter
---@field ParamEarL Live2DParameter
---@field ParamEarR Live2DParameter
---@field ParamSalivaPhysics Live2DParameter
---@field ParamPupilWiggle Live2DParameter
---@field ParamEarsWiggle Live2DParameter
---@field ParamHeadpatX Live2DParameter
---@field ParamHeadpatY Live2DParameter
---@field ParamHeadpat Live2DParameter
---@field ParamBrowLY Live2DParameter
---@field ParamBrowRY Live2DParameter
---@field ParamMouthForm Live2DParameter
---@field ParamFlattenNipples Live2DParameter
---@field ParamMCBodyY Live2DParameter
---@field ParamLegsSwitch Live2DParameter
---@field ParamPhysicsHairX Live2DParameter
---@field ParamPhysicsHairY Live2DParameter
---@field ParamBoobSize Live2DParameter
---@field PhysicsSubRig_Hair Live2DPhysicsOverride
---@field PhysicsSubRig_Tail Live2DPhysicsOverride
---@field HitAreaHeadpat Part
---@field HitAreaOpenMouth Part
---@field HitAreaCloseMouth Part
---@field HitAreaFaceStroke Part
---@field HitAreaThumbMouth Part
---@field DickSkinName string
---@field DickMainName string
---@field CockTipColor Color
---@field CockColor Color
---@field CumColor Color
---@field CurrentBrain ModelBrain
---@field Model CubismModel
---@field IsAnyInteractableHeld boolean
---@field CumOutsideManager CumOutsideManager
---@field CumInsideManager ICumManagerCommon
---@field IsFullyInitialized boolean
---@field ExecutionOrder integer
---@field NeedsUpdateOnEditing boolean
---@field HasUpdateController boolean
---@field Eyes EyeManagerCommon
---@field Mouth MouthManagerDefaultMouth
---@field DefaultEyesPosition Vector2
---@field EyesWhitePart Part
---@field MouthPart Part
---@field IsShirtAndHoodieAsideOrOff boolean
---@field IsHoodieAsideOrOff boolean
---@field IsHoodieAside boolean
---@field IsHoodieOn boolean
---@field IsShirtAsideOrOff boolean
---@field IsShirtAside boolean
---@field IsShirtOn boolean
---@field IsPantiesAsideOrOff boolean
---@field IsPantiesAside boolean
---@field IsPantiesOn boolean
---@field IsBraAsideOrOff boolean
---@field IsBraAside boolean
---@field IsBraOn boolean
---@field IsSkirtAside boolean
---@field IsSkirtOn boolean
---@field IsSkirtAsideOrOff boolean
---@field IsPantsOn boolean
---@field IsPantsAsideOrOff boolean
---@field IsDress2Aside boolean
---@field IsDress2On boolean
---@field IsDress2AsideOrOff boolean
---@field IsDress1Aside boolean
---@field IsDress1On boolean
---@field IsDress1AsideOrOff boolean
---@field IsBoobaVisible boolean
---@field CurrentToolSelector Live2DToolSelector
---@field DefaultFaceAngle Vector3
---@field IsKissing boolean
---@field Expression Live2DExpression
---@field BraEnabledParameter Live2DParameter
---@field ShirtEnabledParameter Live2DParameter
---@field SkirtEnabledParameter Live2DParameter
---@field PantsEnabledParameter Live2DParameter
---@field HoodieEnabledParameter Live2DParameter
---@field Dress2EnabledParameter Live2DParameter
---@field PantiesEnabledParameter Live2DParameter
---@field ShoeLOnParameter Live2DParameter
---@field ShoeROnParameter Live2DParameter
---@field ArmLParameter Live2DParameter
---@field ArmRParameter Live2DParameter
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
Live2DBlowjobController = {}

---@return Live2DBlowjobController
function Live2DBlowjobController.__new() end

---@overload fun(self: Live2DBlowjobController)
function Live2DBlowjobController.InitializeGenerated() end

---@class Live2DController: MonoBehaviour
---@field ControllerEnum ControllerEnum
---@field SceneEnum SceneEnumFlag
---@field CurrentBrain ModelBrain
---@field Model CubismModel
---@field IsAnyInteractableHeld boolean
---@field CumOutsideManager CumOutsideManager
---@field CumInsideManager ICumManagerCommon
---@field IsFullyInitialized boolean
---@field ExecutionOrder integer
---@field NeedsUpdateOnEditing boolean
---@field HasUpdateController boolean
---@field Eyes EyeManagerCommon
---@field Mouth MouthManagerDefaultMouth
---@field DefaultEyesPosition Vector2
---@field EyesWhitePart Part
---@field MouthPart Part
---@field IsShirtAndHoodieAsideOrOff boolean
---@field IsHoodieAsideOrOff boolean
---@field IsHoodieAside boolean
---@field IsHoodieOn boolean
---@field IsShirtAsideOrOff boolean
---@field IsShirtAside boolean
---@field IsShirtOn boolean
---@field IsPantiesAsideOrOff boolean
---@field IsPantiesAside boolean
---@field IsPantiesOn boolean
---@field IsBraAsideOrOff boolean
---@field IsBraAside boolean
---@field IsBraOn boolean
---@field IsSkirtAside boolean
---@field IsSkirtOn boolean
---@field IsSkirtAsideOrOff boolean
---@field IsPantsAside boolean
---@field IsPantsOn boolean
---@field IsPantsAsideOrOff boolean
---@field IsDress2Aside boolean
---@field IsDress2On boolean
---@field IsDress2AsideOrOff boolean
---@field IsDress1Aside boolean
---@field IsDress1On boolean
---@field IsDress1AsideOrOff boolean
---@field IsBoobaVisible boolean
---@field CurrentToolSelector Live2DToolSelector
---@field DefaultFaceAngle Vector3
---@field IsKissing boolean
---@field Expression Live2DExpression
---@field BraEnabledParameter Live2DParameter
---@field ShirtEnabledParameter Live2DParameter
---@field SkirtEnabledParameter Live2DParameter
---@field PantsEnabledParameter Live2DParameter
---@field HoodieEnabledParameter Live2DParameter
---@field Dress2EnabledParameter Live2DParameter
---@field PantiesEnabledParameter Live2DParameter
---@field ShoeLOnParameter Live2DParameter
---@field ShoeROnParameter Live2DParameter
---@field ArmLParameter Live2DParameter
---@field ArmRParameter Live2DParameter
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
---@field AllHairNonAccessoryColoringGroups ColoringGroupEnum[]
---@field CatEarsElementId string
---@field WizardHatElementId string
---@field CuteBowElementId string
---@field PumpkinHairpinId string
---@field HeadbandId string
---@field SharpTeethId string
---@field BellChokerElementId string
---@field ShirtId string
---@field Dress1Id string
---@field Dress2Id string
---@field SkirtId string
---@field PantsId string
---@field HoodieId string
---@field NippleLeftPiercingId string
---@field NippleRightPiercingId string
---@field NavelPiercingId string
---@field BasicHologramId string
---@field BasicEyebrowsId string
---@field Hair0_TopId string
---@field Hair0_FrontId string
---@field Hair0_SideId string
---@field Hair0_BackId string
---@field Hair0_BraidId string
---@field Hair1_TopId string
---@field Hair1_FrontId string
---@field Hair1_SideId string
---@field Hair1_BackId string
---@field Hair2_FrontId string
---@field Hair3_TopId string
---@field Hair3_FrontId string
---@field Hair3_SideId string
---@field Hair3_BackId string
---@field Hair4_PonytailId string
---@field Hair4_KnotId string
Live2DController = {}

---@overload fun(self: Live2DController)
function Live2DController.InitializeGenerated() end

---@overload fun(self: Live2DController, e: InteractionMemoryEventEnum)
---@param e InteractionMemoryEventEnum
function Live2DController.FireEvent(e) end

---@overload fun(self: Live2DController)
function Live2DController.FixedUpdateHologram() end

---@overload fun(cubismRenderer: CubismRenderer): Part
---@overload fun(id: string): Part
---@overload fun(self: Live2DController, cubismDrawable: CubismDrawable): Part
---@overload fun(self: Live2DController, cubismRenderer: CubismRenderer): Part
---@overload fun(self: Live2DController, id: string): Part
---@param cubismDrawable CubismDrawable
---@return Part
function Live2DController.GetCachedPart(cubismDrawable) end

---@overload fun(self: Live2DController, id: string, part: Part): boolean
---@param id string
---@param part Part
---@return boolean
function Live2DController.TryGetCachedPart(id, part) end

---@overload fun(drawablename: string, value: boolean, color: Color|nil)
---@overload fun(self: Live2DController, drawablename: string, value: boolean)
---@overload fun(self: Live2DController, drawablename: string, value: boolean, color: Color|nil)
---@param drawablename string
---@param value boolean
function Live2DController.ToggleDrawable(drawablename, value) end

---@overload fun(self: Live2DController): CubismDrawable[]
---@return CubismDrawable[]
function Live2DController.GetDrawables() end

---@overload fun(self: Live2DController): CubismRenderer[]
---@return CubismRenderer[]
function Live2DController.GetRenderersInDrawOrder() end

---@overload fun(self: Live2DController): Part[]
---@return Part[]
function Live2DController.GetParts() end

---@overload fun(self: Live2DController)
function Live2DController.RestoreOriginalTextures() end

---@overload fun(self: Live2DController)
function Live2DController.ResetParameters() end

---@overload fun(self: Live2DController)
function Live2DController.ResetBasic() end

---@overload fun(self: Live2DController)
function Live2DController.ResetEverything() end

---@overload fun(self: Live2DController, type: UpdateTexturesFromCurrentlyEquippedTypeEnum)
---@overload fun(self: Live2DController)
---@param type? UpdateTexturesFromCurrentlyEquippedTypeEnum
function Live2DController.UpdateTexturesFromCurrentlyEquipped(type) end

---@overload fun(self: Live2DController, item: Item): Part[]
---@param item Item
---@return Part[]
function Live2DController.GetAllItemParts(item) end

---@overload fun(self: Live2DController, item: Item, bounds: Bounds): boolean
---@param item Item
---@param bounds Bounds
---@return boolean
function Live2DController.TryEstimateItemWorldBounds(item, bounds) end

---@overload fun(self: Live2DController, item: Item, OnFinished: fun(arg1: RenderTexture)): IEnumerator
---@param item Item
---@param OnFinished fun(arg1: RenderTexture)
---@return IEnumerator
function Live2DController.RenderCoroutine(item, OnFinished) end

---@overload fun(self: Live2DController)
function Live2DController.PrepareForDialogue() end

---@overload fun(self: Live2DController)
function Live2DController.SaveSerializedState() end

---@overload fun(self: Live2DController)
function Live2DController.LoadSerializedState() end

---@overload fun(self: Live2DController)
function Live2DController.InitializeAll() end

---@overload fun(self: Live2DController, v: boolean)
---@param v boolean
function Live2DController.SetEnabled(v) end

---@overload fun(self: Live2DController)
function Live2DController.BeforeDestroy() end

---@overload fun(self: Live2DController, characterId: string)
---@param characterId string
function Live2DController.EnsureBrain(characterId) end

---@overload fun(self: Live2DController, characterId: string, user: ILive2DModelUser)
---@param characterId string
---@param user ILive2DModelUser
function Live2DController.StartUsage(characterId, user) end

---@overload fun(self: Live2DController, user: ILive2DModelUser)
---@param user ILive2DModelUser
function Live2DController.EndUsage(user) end

---@overload fun(self: Live2DController)
function Live2DController.Awake() end

---@overload fun(self: Live2DController)
function Live2DController.Start() end

---@overload fun(self: Live2DController)
function Live2DController.OnDisable() end

---@overload fun(self: Live2DController)
function Live2DController.Update() end

---@overload fun(self: Live2DController)
function Live2DController.OnLateUpdate() end

---@overload fun(self: Live2DController)
function Live2DController.FixedUpdate() end

---@overload fun(self: Live2DController): Vector3
---@return Vector3
function Live2DController.GetMouthOffset() end

---@overload fun(self: Live2DController, group: ColoringGroupEnum, color: Color)
---@param group ColoringGroupEnum
---@param color Color
function Live2DController.GroupColor(group, color) end

---@overload fun(self: Live2DController): table[]
---@return table[]
function Live2DController.GetGroups() end

---@overload fun(self: Live2DController, group: ColoringGroupEnum): ColoringGroup
---@param group ColoringGroupEnum
---@return ColoringGroup
function Live2DController.GetGroup(group) end

---@param color Color
---@param min Color
---@param max Color
---@return Color
function Live2DController.ColorMagicV2(color, min, max) end

---@param color Color
---@param strength? number
---@return Color
function Live2DController.ColorMagic(color, strength) end

---@overload fun(self: Live2DController): Live2DControllerElement[]
---@return Live2DControllerElement[]
function Live2DController.GetAllElements() end

---@overload fun(self: Live2DController, id: string): Live2DControllerElement
---@param id string
---@return Live2DControllerElement
function Live2DController.GetElementById(id) end

---@overload fun(self: Live2DController, id: string): boolean
---@param id string
---@return boolean
function Live2DController.IsElementActive(id) end

---@overload fun(self: Live2DController, id: string): boolean
---@param id string
---@return boolean
function Live2DController.IsAnySubElementActive(id) end

---@overload fun(self: Live2DController, value: boolean)
---@param value boolean
function Live2DController.SetCurrentToolSelectorActive(value) end

---@overload fun(self: Live2DController, interactable: ILive2DInteractable): boolean
---@param interactable ILive2DInteractable
---@return boolean
function Live2DController.TryGetHeldInteractable(interactable) end

---@overload fun(self: Live2DController, interactable: ILive2DInteractable): boolean
---@param interactable ILive2DInteractable
---@return boolean
function Live2DController.IsHeld(interactable) end

---@overload fun(self: Live2DController, to: integer)
---@param to integer
function Live2DController.ChangeLayer(to) end

---@overload fun(self: Live2DController, renderers: CubismRenderer[], layernr: integer): Live2DGenericInteractable
---@overload fun(self: Live2DController, renderers: CubismRenderer[]): Live2DGenericInteractable
---@param renderers CubismRenderer[]
---@param layernr? integer
---@return Live2DGenericInteractable
function Live2DController.AddGenericInteractable(renderers, layernr) end

---@overload fun(self: Live2DController, fullBodyInteractable: Live2DFullBodyInteractable, layernr: integer): Live2DFullBodyInteractable
---@param fullBodyInteractable Live2DFullBodyInteractable
---@param layernr integer
---@return Live2DFullBodyInteractable
function Live2DController.SetFullBodyInteractable(fullBodyInteractable, layernr) end

---@overload fun(self: Live2DController, interactable: ILive2DInteractableHoverable)
---@param interactable ILive2DInteractableHoverable
function Live2DController.RemoveInteractable(interactable) end

---@overload fun(self: Live2DController, v: Vector2)
---@param v Vector2
function Live2DController.RotateInputToTransformRotation(v) end

---@overload fun(self: Live2DController, interactable: ILive2DInteractable)
---@param interactable ILive2DInteractable
function Live2DController.LetGoIfHeld(interactable) end

---@overload fun(self: Live2DController)
function Live2DController.LetGoOfCurrentlyHeld() end

---@overload fun(self: Live2DController, position: Vector3): boolean
---@param position Vector3
---@return boolean
function Live2DController.TryGetCurrentlyHoveredOrHeldInteractablePosition(position) end

---@overload fun(self: Live2DController): ILimbUsage[]
---@return ILimbUsage[]
function Live2DController.GetDistinctLimbUsages() end

---@overload fun(self: Live2DController, limbUsages: ILimbUsage[]): ILimbUsage[]
---@param limbUsages ILimbUsage[]
---@return ILimbUsage[]
function Live2DController.GetCopyLimbUsages(limbUsages) end

---@overload fun(self: Live2DController, limbUsage: ILimbUsage): boolean
---@param limbUsage ILimbUsage
---@return boolean
function Live2DController.EnsureLimbs(limbUsage) end

---@overload fun(self: Live2DController, limbUsage: ILimbUsage, letGoLimbsCaller: LetGoLimbsCaller)
---@overload fun(self: Live2DController, limbUsage: ILimbUsage)
---@param limbUsage ILimbUsage
---@param letGoLimbsCaller? LetGoLimbsCaller
function Live2DController.UseLimbs(limbUsage, letGoLimbsCaller) end

---@overload fun(limbUsageChoiceEnum: LimbUsageChoiceEnum, letGoLimbsCaller: LetGoLimbsCaller)
---@overload fun(self: Live2DController, limbUsage: ILimbUsage, letGoLimbsCaller: LetGoLimbsCaller)
---@overload fun(self: Live2DController, limbUsageChoiceEnum: LimbUsageChoiceEnum, letGoLimbsCaller: LetGoLimbsCaller)
---@param limbUsage ILimbUsage
---@param letGoLimbsCaller LetGoLimbsCaller
function Live2DController.LetGoLimbs(limbUsage, letGoLimbsCaller) end

---@overload fun(self: Live2DController, limbUsage: ILimbUsage): boolean
---@param limbUsage ILimbUsage
---@return boolean
function Live2DController.IsLimbUsageExactlyCorrect(limbUsage) end

---@overload fun(self: Live2DController, flag: LimbUsageChoiceEnum, limbUsage: ILimbUsage): boolean
---@param flag LimbUsageChoiceEnum
---@param limbUsage ILimbUsage
---@return boolean
function Live2DController.TryGetLimbUsageAt(flag, limbUsage) end

---@overload fun(self: Live2DController, flag: LimbUsageChoiceEnum): boolean
---@param flag LimbUsageChoiceEnum
---@return boolean
function Live2DController.IsLimbActive(flag) end

---@overload fun(self: Live2DController): boolean
---@return boolean
function Live2DController.IsApproximatelyDefaultFaceAngle() end

---@overload fun(self: Live2DController)
function Live2DController.ToDefaultFaceAngle() end

---@overload fun(self: Live2DController, targetDrawable: CubismDrawable, kissStartPositionType: KissStartPositionType, offset: Vector2)
---@overload fun(self: Live2DController, targetDrawable: CubismDrawable, kissStartPositionType: KissStartPositionType)
---@overload fun(self: Live2DController, targetDrawable: CubismDrawable)
---@param targetDrawable CubismDrawable
---@param kissStartPositionType? KissStartPositionType
---@param offset? Vector2
function Live2DController.StartKiss(targetDrawable, kissStartPositionType, offset) end

---@overload fun(self: Live2DController)
function Live2DController.EndKiss() end

---@overload fun(self: Live2DController)
function Live2DController.OnDisableKissing() end

---@overload fun(self: Live2DController)
function Live2DController.FinishAllMoves() end

---@overload fun(self: Live2DController, parameterName: string): ParameterBase
---@param parameterName string
---@return ParameterBase
function Live2DController.GetParamByPropertyName(parameterName) end

---@overload fun(self: Live2DController): StoryEmoteManager
---@return StoryEmoteManager
function Live2DController.GetStoryEmoteManager() end

---@overload fun(self: Live2DController, instantly: boolean)
---@param instantly boolean
function Live2DController.SetDefaultEmote(instantly) end

---@overload fun(self: Live2DController, emoteDatas: EmoteData[])
---@param emoteDatas EmoteData[]
function Live2DController.SetEmote(emoteDatas) end

---@overload fun(self: Live2DController, emote: EmoteData): Result
---@param emote EmoteData
---@return Result
function Live2DController.IsValidEmote(emote) end

---@class Live2DControllerElement
---@field Groups ElementColoringGroup[]
---@field IsActive boolean
---@field id string
Live2DControllerElement = {}

---@param id string
---@param group ElementColoringGroup[]
---@return Live2DControllerElement
function Live2DControllerElement.__new(id, group) end

---@overload fun(self: Live2DControllerElement, item: ItemWithCurrentData)
---@param item ItemWithCurrentData
function Live2DControllerElement.Activate(item) end

---@overload fun(self: Live2DControllerElement, controller: Live2DController, item: Item): table[]
---@param controller Live2DController
---@param item Item
---@return table[]
function Live2DControllerElement.AllPartsOnTextureWithColor(controller, item) end

---@overload fun(self: Live2DControllerElement, controller: Live2DController): table[]
---@param controller Live2DController
---@return table[]
function Live2DControllerElement.AllPartsWithOnTextureColoringGroup(controller) end

---@overload fun(self: Live2DControllerElement, controller: Live2DController): Part[]
---@param controller Live2DController
---@return Part[]
function Live2DControllerElement.AllPartsNonSegmented(controller) end

---@class Live2DControllerSingleton: SingletonMonoBehaviour_Live2DControllerSingleton_
---@field Live2DPrefabHolders Live2DPrefabHolder[]
---@field DoggyCharacterHolder Live2DPrefabHolder
---@field MissionaryCharacterHolder Live2DPrefabHolder
---@field InteractCharacterHolder Live2DPrefabHolder
---@field BlowjobCharacterHolder Live2DPrefabHolder
---@field CowgirlCharacterHolder Live2DPrefabHolder
---@field ShowerCharacterHolder Live2DPrefabHolder
---@field AllInstantiatedPrefabHolders Live2DPrefabHolder[]
---@field AllInstantiatedControllers Live2DController[]
---@field AllActiveControllers Live2DController[]
---@field LuaInstance Live2DControllerSingleton
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
---@field AllValidControllersEnums ControllerEnum[]
---@field Live2DTextureSize integer
---@field Live2DTextureWidth integer
---@field Live2DTextureHeight integer
---@field Live2DMipLevel integer
Live2DControllerSingleton = {}

---@return Live2DControllerSingleton
function Live2DControllerSingleton.__new() end

---@overload fun(e: ControllerEnum[]): SceneEnumFlag
---@param e ControllerEnum
---@return SceneEnumFlag
function Live2DControllerSingleton.ToFlags(e) end

---@overload fun(self: Live2DControllerSingleton, characterId: string): Live2DController[]
---@param characterId string
---@return Live2DController[]
function Live2DControllerSingleton.AllInstantiatedControllersFor(characterId) end

---@overload fun(self: Live2DControllerSingleton, characterId: string): Live2DController[]
---@param characterId string
---@return Live2DController[]
function Live2DControllerSingleton.AllCurrentlyUsedControllersFor(characterId) end

---@overload fun(self: Live2DControllerSingleton, characterId: string): boolean
---@param characterId string
---@return boolean
function Live2DControllerSingleton.IsAnyControllerActiveAndTalkingWithOverlay(characterId) end

---@overload fun(self: Live2DControllerSingleton, characterId: string): Live2DController
---@param characterId string
---@return Live2DController
function Live2DControllerSingleton.GetReadyController(characterId) end

---@overload fun(self: Live2DControllerSingleton, usageName: string): ModCreationLive2DControllersContainer
---@param usageName string
---@return ModCreationLive2DControllersContainer
function Live2DControllerSingleton.GetModCreationData(usageName) end

---@overload fun(self: Live2DControllerSingleton)
function Live2DControllerSingleton.OnValidate() end

---@overload fun(self: Live2DControllerSingleton)
function Live2DControllerSingleton.Start() end

---@overload fun(self: Live2DControllerSingleton)
function Live2DControllerSingleton.UpdateAllTextures() end

---@overload fun(self: Live2DControllerSingleton)
function Live2DControllerSingleton.ResetAllTextures() end

---@overload fun(self: Live2DControllerSingleton, texture: Texture)
---@param texture Texture
function Live2DControllerSingleton.ReturnToPoll(texture) end

---@overload fun(self: Live2DControllerSingleton): RenderTexture
---@return RenderTexture
function Live2DControllerSingleton.GetRenderTexture() end

---@class Live2DCowgirlController: Live2DLewdSceneController
---@field ControllerEnum ControllerEnum
---@field SceneEnum SceneEnumFlag
---@field LegsGrabInteractable Live2DInteractableLimbUsage
---@field IsPantiesAside boolean
---@field IsPantsAside boolean
---@field VaginaCockInsertionFuckAxis CowgirlCockInsertionFuckAxis
---@field VaginaFingeringFuckAxis BasicInsertionHandleFuckAxis
---@field VaginaInsertionHandler InsertionHandler
---@field McBodyVisible boolean
---@field XRayManager IXRayManager
---@field FrickStaticGuiManager FrickStaticGuiManager
---@field InsertionManager InsertionManager
---@field CockManager ICockManager
---@field Param_Angle_Rotation_1_TailMain Live2DParameter
---@field Param_Angle_Rotation_2_TailMain Live2DParameter
---@field Param_Angle_Rotation_3_TailMain Live2DParameter
---@field Param_Angle_Rotation_4_TailMain Live2DParameter
---@field Param_Angle_Rotation_5_TailMain Live2DParameter
---@field Param_Angle_Rotation_6_TailMain Live2DParameter
---@field Param_Angle_Rotation_7_TailMain Live2DParameter
---@field Param_Angle_Rotation_8_TailMain Live2DParameter
---@field Param_Angle_Rotation_9_TailMain Live2DParameter
---@field ParamTailWiggle Live2DParameter
---@field ParamBrowRY Live2DParameter
---@field ParamBrowLY Live2DParameter
---@field ParamEyeRShock Live2DParameter
---@field ParamEyeLShock Live2DParameter
---@field ParamBrowLRot Live2DParameter
---@field ParamBrowRRot Live2DParameter
---@field ParamBrowLEmote Live2DParameter
---@field ParamBrowREmote Live2DParameter
---@field ParamEyeOpen Live2DParameter
---@field ParamEyesHappy Live2DParameter
---@field ParamIrisZoom Live2DParameter
---@field ParamHeart Live2DParameter
---@field ParamEyeballRX Live2DParameter
---@field ParamEyeballRY Live2DParameter
---@field ParamEyeballLX Live2DParameter
---@field ParamEyeballLY Live2DParameter
---@field ParamMouthOpen Live2DParameter
---@field ParamSaliva Live2DParameter
---@field ParamMouthForm Live2DParameter
---@field ParamToungeX Live2DParameter
---@field ParamToungeY Live2DParameter
---@field ParamBlush Live2DParameter
---@field ParamHeadZ Live2DParameter
---@field ParamHeadX Live2DParameter
---@field ParamHeadY Live2DParameter
---@field ParamEarL Live2DParameter
---@field ParamEarR Live2DParameter
---@field ParamChestX Live2DParameter
---@field ParamSalivaPhysics Live2DParameter
---@field ParamHairX Live2DParameter
---@field ParamPupilWiggle Live2DParameter
---@field ParamEarsWiggle Live2DParameter
---@field ParamHeadpatX Live2DParameter
---@field ParamHeadpatY Live2DParameter
---@field ParamHeadpat Live2DParameter
---@field ParamHairPhysicsBaseToShort Live2DParameter
---@field ParamHairPhysicsShortToMid Live2DParameter
---@field ParamHairPhysicsMidToLong Live2DParameter
---@field ParamPhysicsBoobXL Live2DParameter
---@field ParamPhysicsBoobYL Live2DParameter
---@field ParamPhysicsBoobXR Live2DParameter
---@field ParamPhysicsBoobYR Live2DParameter
---@field ParamHoodieStringL Live2DParameter
---@field ParamHoodieStringR Live2DParameter
---@field ParamSkirtYPhysics Live2DParameter
---@field ParamGrabBoobLEnable Live2DParameter
---@field ParamBoobSqueezeL Live2DParameter
---@field ParamGrabBoobREnable Live2DParameter
---@field ParamBoobSqueezeR Live2DParameter
---@field ParamNippleREnable Live2DParameter
---@field ParamNippleRSqueeze Live2DParameter
---@field ParamNippleLEnable Live2DParameter
---@field ParamNippleLSqueeze Live2DParameter
---@field ParamGrabLegREnable Live2DParameter
---@field ParamGrabLegLEnable Live2DParameter
---@field ParamFingeringEnable Live2DParameter
---@field ParamFingeringThrust Live2DParameter
---@field ParamFingeringHandWet Live2DParameter
---@field ParamFingeringAngleX Live2DParameter
---@field ParamClitRubEnable Live2DParameter
---@field ParamClitRubX Live2DParameter
---@field ParamClitRubY Live2DParameter
---@field ParamClitMoveX Live2DParameter
---@field ParamClitMoveY Live2DParameter
---@field ParamVaginaPush Live2DParameter
---@field ParamXRayVagR0 Live2DParameter
---@field ParamXRayVagR1 Live2DParameter
---@field ParamXRayVagR2 Live2DParameter
---@field ParamXRayVagR3 Live2DParameter
---@field ParamXRayVagR4 Live2DParameter
---@field ParamXRayVagR5 Live2DParameter
---@field ParamXRayVagR6 Live2DParameter
---@field ParamXRayVagR7 Live2DParameter
---@field ParamXRayVagL0 Live2DParameter
---@field ParamXRayVagL1 Live2DParameter
---@field ParamXRayVagL2 Live2DParameter
---@field ParamXRayVagL3 Live2DParameter
---@field ParamXRayVagL4 Live2DParameter
---@field ParamXRayVagL5 Live2DParameter
---@field ParamXRayVagL6 Live2DParameter
---@field ParamXRayVagL7 Live2DParameter
---@field ParamVaginaSpread Live2DParameter
---@field ParamPhysicsCumWomb Live2DParameter
---@field ParamMCBodyVisible Live2DParameter
---@field ParamCockAngleX Live2DParameter
---@field ParamCockAngleY Live2DParameter
---@field ParamCumShotAnim Live2DParameter
---@field ParamFlacidity Live2DParameter
---@field ParamCumShotLengthY Live2DParameter
---@field ParamHideCumShot Live2DParameter
---@field ParamBotBodyMovementY Live2DParameter
---@field ParamInsertableInside Live2DParameter
---@field ParamOmegaMeter Live2DParameter
---@field ParamMoveMc Live2DParameter
---@field ParamXray Live2DParameter
---@field ParamOrgasm Live2DParameter
---@field ParamCumInsideWomb Live2DParameter
---@field ParamCumInside Live2DParameter
---@field ParamLegsQuiver Live2DParameter
---@field ParamToSide Live2DParameter
---@field ParamPantsToSide Live2DParameter
---@field ParamFlattenNipples Live2DParameter
---@field ParamFlattenBoobs Live2DParameter
---@field ParamAssSize Live2DParameter
---@field ParamBoobSize Live2DParameter
---@field ParamThighSize Live2DParameter
---@field PhysicsSubRig_BoobLY Live2DPhysicsOverride
---@field PhysicsSubRig_BoobRY Live2DPhysicsOverride
---@field PhysicsSubRig_BoobLX Live2DPhysicsOverride
---@field PhysicsSubRig_HoodieStringL Live2DPhysicsOverride
---@field PhysicsSubRig_BoobRX Live2DPhysicsOverride
---@field PhysicsSubRig_HoodieStringR Live2DPhysicsOverride
---@field PhysicsSubRig_HeadShake Live2DPhysicsOverride
---@field PhysicsSubRig_Skirt Live2DPhysicsOverride
---@field PhysicsSubRig_Tail Live2DPhysicsOverride
---@field PhysicsSubRig_Hair Live2DPhysicsOverride
---@field HitAreaBoobL Part
---@field HitAreaBoobR Part
---@field HitAreaLegR Part
---@field HitAreaLegL Part
---@field HitAreaBothBoobs Part
---@field HitAreaFingering Part
---@field HitAreaClit Part
---@field HitAreaBothNipples Part
---@field HitAreaNippleL Part
---@field HitAreaNippleR Part
---@field HitAreaHeadpat Part
---@field HitAreaOpenMouth Part
---@field HitAreaCloseMouth Part
---@field DickSkinName string
---@field DickMainName string
---@field CockTipColor Color
---@field CockColor Color
---@field CumColor Color
---@field CurrentBrain ModelBrain
---@field Model CubismModel
---@field IsAnyInteractableHeld boolean
---@field CumOutsideManager CumOutsideManager
---@field CumInsideManager ICumManagerCommon
---@field IsFullyInitialized boolean
---@field ExecutionOrder integer
---@field NeedsUpdateOnEditing boolean
---@field HasUpdateController boolean
---@field Eyes EyeManagerCommon
---@field Mouth MouthManagerDefaultMouth
---@field DefaultEyesPosition Vector2
---@field EyesWhitePart Part
---@field MouthPart Part
---@field IsShirtAndHoodieAsideOrOff boolean
---@field IsHoodieAsideOrOff boolean
---@field IsHoodieAside boolean
---@field IsHoodieOn boolean
---@field IsShirtAsideOrOff boolean
---@field IsShirtAside boolean
---@field IsShirtOn boolean
---@field IsPantiesAsideOrOff boolean
---@field IsPantiesOn boolean
---@field IsBraAsideOrOff boolean
---@field IsBraAside boolean
---@field IsBraOn boolean
---@field IsSkirtAside boolean
---@field IsSkirtOn boolean
---@field IsSkirtAsideOrOff boolean
---@field IsPantsOn boolean
---@field IsPantsAsideOrOff boolean
---@field IsDress2Aside boolean
---@field IsDress2On boolean
---@field IsDress2AsideOrOff boolean
---@field IsDress1Aside boolean
---@field IsDress1On boolean
---@field IsDress1AsideOrOff boolean
---@field IsBoobaVisible boolean
---@field CurrentToolSelector Live2DToolSelector
---@field DefaultFaceAngle Vector3
---@field IsKissing boolean
---@field Expression Live2DExpression
---@field BraEnabledParameter Live2DParameter
---@field ShirtEnabledParameter Live2DParameter
---@field SkirtEnabledParameter Live2DParameter
---@field PantsEnabledParameter Live2DParameter
---@field HoodieEnabledParameter Live2DParameter
---@field Dress2EnabledParameter Live2DParameter
---@field PantiesEnabledParameter Live2DParameter
---@field ShoeLOnParameter Live2DParameter
---@field ShoeROnParameter Live2DParameter
---@field ArmLParameter Live2DParameter
---@field ArmRParameter Live2DParameter
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
Live2DCowgirlController = {}

---@return Live2DCowgirlController
function Live2DCowgirlController.__new() end

---@param thisController Live2DCowgirlController
function Live2DCowgirlController.PrepareNippleInteractables(thisController) end

---@param thisController Live2DCowgirlController
function Live2DCowgirlController.PrepareBoobInteractables(thisController) end

---@overload fun(self: Live2DCowgirlController)
function Live2DCowgirlController.InitializeGenerated() end

---@class Live2DInteractionController: Live2DController
---@field ControllerEnum ControllerEnum
---@field SceneEnum SceneEnumFlag
---@field ArePantiesToRight boolean
---@field ArePantiesToLeft boolean
---@field IsPantiesAside boolean
---@field IsSkirtAside boolean
---@field ArmLCuddleLState ArmLCuddleState
---@field ArmLState ArmState
---@field ArmRState ArmState
---@field HeadToChestPhysicsOverride Live2DPhysicsOverride
---@field InteractionSceneType InteractionSceneTypeEnum
---@field DefaultEyesPosition Vector2
---@field DefaultFaceAngle Vector3
---@field ParamBrowRY Live2DParameter
---@field ParamBrowLY Live2DParameter
---@field ParamEyeRShock Live2DParameter
---@field ParamEyeLShock Live2DParameter
---@field ParamBrowLRot Live2DParameter
---@field ParamBrowRRot Live2DParameter
---@field ParamBrowLEmote Live2DParameter
---@field ParamBrowREmote Live2DParameter
---@field ParamEyeOpen Live2DParameter
---@field ParamEyesHappy Live2DParameter
---@field ParamIrisZoom Live2DParameter
---@field ParamHeart Live2DParameter
---@field ParamEyeballRX Live2DParameter
---@field ParamEyeballRY Live2DParameter
---@field ParamEyeballLX Live2DParameter
---@field ParamEyeballLY Live2DParameter
---@field ParamMouthOpen Live2DParameter
---@field ParamSaliva Live2DParameter
---@field ParamMouthForm Live2DParameter
---@field ParamToungeX Live2DParameter
---@field ParamToungeY Live2DParameter
---@field ParamEnableThumbMouth Live2DParameter
---@field ParamThumbMouthX Live2DParameter
---@field ParamBlush Live2DParameter
---@field ParamHeadZ Live2DParameter
---@field ParamHeadX Live2DParameter
---@field ParamHeadY Live2DParameter
---@field ParamEarL Live2DParameter
---@field ParamEarR Live2DParameter
---@field ParamArmLRot Live2DParameter
---@field ParamArmLUp Live2DParameter
---@field ParamArmLGesture Live2DParameter
---@field ParamHandholdingREnable Live2DParameter
---@field ParamHandholdingRY Live2DParameter
---@field ParamArmRRot Live2DParameter
---@field ParamArmRUp Live2DParameter
---@field ParamArmRGesture Live2DParameter
---@field ParamHandholdingLEnable Live2DParameter
---@field ParamHandholdingLY Live2DParameter
---@field ParamBodyZ Live2DParameter
---@field ParamBodyX Live2DParameter
---@field ParamBodyY Live2DParameter
---@field ParamLegR Live2DParameter
---@field ParamLegL Live2DParameter
---@field ParamChestX Live2DParameter
---@field ParamBodyAccessoryPhysics Live2DParameter
---@field ParamHairPhysicsBaseToShort Live2DParameter
---@field ParamHairPhysicsShortToMid Live2DParameter
---@field ParamHairPhysicsMidToLong Live2DParameter
---@field ParamSalivaPhysics Live2DParameter
---@field ParamPupilWiggle Live2DParameter
---@field ParamEarsWiggle Live2DParameter
---@field ParamPhysicsBoobXL Live2DParameter
---@field ParamPhysicsBoobYL Live2DParameter
---@field ParamPhysicsBoobXR Live2DParameter
---@field ParamPhysicsBoobYR Live2DParameter
---@field ParamBodyFeedback Live2DParameter
---@field ParamEnableBoobFondleL Live2DParameter
---@field ParamBoobSqueezeL Live2DParameter
---@field ParamEnableBoobFondleR Live2DParameter
---@field ParamBoobSqueezeR Live2DParameter
---@field ParamHeadpatX Live2DParameter
---@field ParamHeadpatY Live2DParameter
---@field ParamHeadpat Live2DParameter
---@field ParamOmegaMeter Live2DParameter
---@field ParamBlanketSitting Live2DParameter
---@field ParamSkirtUp Live2DParameter
---@field ParamPantiesX Live2DParameter
---@field ParamPillow Live2DParameter
---@field ParamBlanketCuddle Live2DParameter
---@field ParamBlanketCuddleMove Live2DParameter
---@field ParamArmLCuddleUp Live2DParameter
---@field ParamBreastCuddleEnabled Live2DParameter
---@field ParamAnonHeadpatForearm Live2DParameter
---@field ParamAnonHeadpatUpperarm Live2DParameter
---@field ParamArmLCuddleDown Live2DParameter
---@field ParamCuddleHandholdingEnable Live2DParameter
---@field ParamCuddleHandholdingMove Live2DParameter
---@field ParamFaceRubMoveX Live2DParameter
---@field ParamFaceRubMoveY Live2DParameter
---@field ParamFaceRubEnable Live2DParameter
---@field Param_Angle_Rotation_1_TailMain Live2DParameter
---@field Param_Angle_Rotation_2_TailMain Live2DParameter
---@field Param_Angle_Rotation_3_TailMain Live2DParameter
---@field Param_Angle_Rotation_4_TailMain Live2DParameter
---@field Param_Angle_Rotation_5_TailMain Live2DParameter
---@field Param_Angle_Rotation_6_TailMain Live2DParameter
---@field Param_Angle_Rotation_7_TailMain Live2DParameter
---@field Param_Angle_Rotation_8_TailMain Live2DParameter
---@field Param_Angle_Rotation_9_TailMain Live2DParameter
---@field ParamTailWiggle Live2DParameter
---@field ParamAssSize Live2DParameter
---@field ParamThighSize Live2DParameter
---@field ParamCalfSize Live2DParameter
---@field ParamFootLength Live2DParameter
---@field ParamFootWidth Live2DParameter
---@field ParamBoobSize Live2DParameter
---@field PhysicsSubRig_Hair Live2DPhysicsOverride
---@field PhysicsSubRig_head___body Live2DPhysicsOverride
---@field PhysicsSubRig_BodyAccessoryPhysics Live2DPhysicsOverride
---@field PhysicsSubRig_BoobLX Live2DPhysicsOverride
---@field PhysicsSubRig_BoobRX Live2DPhysicsOverride
---@field PhysicsSubRig_BoobLY Live2DPhysicsOverride
---@field PhysicsSubRig_BoobRY Live2DPhysicsOverride
---@field PhysicsSubRig_saliva Live2DPhysicsOverride
---@field PhysicsSubRig_Pupil Live2DPhysicsOverride
---@field PhysicsSubRig_Wiggle Live2DPhysicsOverride
---@field PhysicsSubRig_Tail Live2DPhysicsOverride
---@field HitAreaOpenMouth Part
---@field HitAreaCloseMouth Part
---@field HitAreaHeadpat Part
---@field HitAreaFaceStroke Part
---@field HitAreaThumbMouth Part
---@field HitAreaBoobL Part
---@field HitAreaBoobR Part
---@field HitAreaBoobsBoth Part
---@field CurrentBrain ModelBrain
---@field Model CubismModel
---@field IsAnyInteractableHeld boolean
---@field CumOutsideManager CumOutsideManager
---@field CumInsideManager ICumManagerCommon
---@field IsFullyInitialized boolean
---@field ExecutionOrder integer
---@field NeedsUpdateOnEditing boolean
---@field HasUpdateController boolean
---@field Eyes EyeManagerCommon
---@field Mouth MouthManagerDefaultMouth
---@field EyesWhitePart Part
---@field MouthPart Part
---@field IsShirtAndHoodieAsideOrOff boolean
---@field IsHoodieAsideOrOff boolean
---@field IsHoodieAside boolean
---@field IsHoodieOn boolean
---@field IsShirtAsideOrOff boolean
---@field IsShirtAside boolean
---@field IsShirtOn boolean
---@field IsPantiesAsideOrOff boolean
---@field IsPantiesOn boolean
---@field IsBraAsideOrOff boolean
---@field IsBraAside boolean
---@field IsBraOn boolean
---@field IsSkirtOn boolean
---@field IsSkirtAsideOrOff boolean
---@field IsPantsAside boolean
---@field IsPantsOn boolean
---@field IsPantsAsideOrOff boolean
---@field IsDress2Aside boolean
---@field IsDress2On boolean
---@field IsDress2AsideOrOff boolean
---@field IsDress1Aside boolean
---@field IsDress1On boolean
---@field IsDress1AsideOrOff boolean
---@field IsBoobaVisible boolean
---@field CurrentToolSelector Live2DToolSelector
---@field IsKissing boolean
---@field Expression Live2DExpression
---@field BraEnabledParameter Live2DParameter
---@field ShirtEnabledParameter Live2DParameter
---@field SkirtEnabledParameter Live2DParameter
---@field PantsEnabledParameter Live2DParameter
---@field HoodieEnabledParameter Live2DParameter
---@field Dress2EnabledParameter Live2DParameter
---@field PantiesEnabledParameter Live2DParameter
---@field ShoeLOnParameter Live2DParameter
---@field ShoeROnParameter Live2DParameter
---@field ArmLParameter Live2DParameter
---@field ArmRParameter Live2DParameter
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
Live2DInteractionController = {}

---@return Live2DInteractionController
function Live2DInteractionController.__new() end

---@overload fun(self: Live2DInteractionController): Vector3
---@return Vector3
function Live2DInteractionController.GetMouthOffset() end

---@overload fun(self: Live2DInteractionController, state: ArmState, selection: ArmSelection)
---@overload fun(self: Live2DInteractionController, state: ArmState)
---@param state ArmState
---@param selection? ArmSelection
function Live2DInteractionController.SetArmState(state, selection) end

---@overload fun(self: Live2DInteractionController, armLCuddleState: ArmLCuddleState)
---@param armLCuddleState ArmLCuddleState
function Live2DInteractionController.SetArmLCuddle(armLCuddleState) end

---@overload fun(self: Live2DInteractionController, armState: ArmState)
---@param armState ArmState
function Live2DInteractionController.SetArmLNormal(armState) end

---@overload fun(self: Live2DInteractionController, interactionSceneType: InteractionSceneTypeEnum)
---@param interactionSceneType InteractionSceneTypeEnum
function Live2DInteractionController.ResetEverything(interactionSceneType) end

---@param thisController Live2DInteractionController
---@param boobL Live2DInteractableLimbUsage
---@param boobR Live2DInteractableLimbUsage
---@param boobsBoth Live2DInteractableLimbUsage
function Live2DInteractionController.PrepareBoobsInteractables(thisController, boobL, boobR, boobsBoth) end

---@param thisController Live2DInteractionController
---@param armL Live2DInteractableLimbUsage
---@param armR Live2DInteractableLimbUsage
function Live2DInteractionController.PrepareHandholdingInteractable(thisController, armL, armR) end

---@param thisController Live2DInteractionController
---@param interactable Live2DInteractableLimbUsage
function Live2DInteractionController.PrepareFaceRubInteractable(thisController, interactable) end

---@param thisController Live2DInteractionController
---@param _pantiesInteractable Live2DInteractableLimbUsage
---@param _skirtInteractable Live2DInteractableLimbUsage
function Live2DInteractionController.PreparePantiesAndSkirt(thisController, _pantiesInteractable, _skirtInteractable) end

---@param thisController Live2DInteractionController
---@param _headpatInteractable Live2DInteractableLimbUsage
function Live2DInteractionController.PrepareCuddleHeadpatInteractable(thisController, _headpatInteractable) end

---@param thisController Live2DInteractionController
---@param _handholdingInteractable Live2DInteractableLimbUsage
function Live2DInteractionController.PrepareHandHoldingCuddleInteractable(thisController, _handholdingInteractable) end

---@param thisController Live2DInteractionController
---@param _thumbMouthInteractable Live2DInteractableLimbUsage
function Live2DInteractionController.PrepareThumbMouthInteractables(thisController, _thumbMouthInteractable) end

---@overload fun(self: Live2DInteractionController)
function Live2DInteractionController.ResetBasic() end

---@overload fun(self: Live2DInteractionController)
function Live2DInteractionController.InitializeGenerated() end

---@class Live2DShowerController: Live2DLewdSceneController
---@field ControllerEnum ControllerEnum
---@field SceneEnum SceneEnumFlag
---@field VaginaInsertionHandler InsertionHandler
---@field AnalInsertionHandler InsertionHandler
---@field ThighjobInsertionHandler InsertionHandler
---@field BoobFondleLimbUsage LimbUsageBetter
---@field BoobFondleInteractable Live2DInteractableLimbUsage
---@field AssFondleLimbUsage LimbUsageBetter
---@field AssGrabLimbUsage LimbUsageBetter
---@field AssFondleInteractable Live2DInteractableLimbUsage
---@field FrickStaticGuiManager FrickStaticGuiManager
---@field InsertionManager InsertionManager
---@field CockManager ICockManager
---@field ParamBoobHandX Live2DParameter
---@field ParamBoobHandY Live2DParameter
---@field ParamBoobHandGrab Live2DParameter
---@field ParamBoobHandEnable Live2DParameter
---@field ParamAssHandX Live2DParameter
---@field ParamAssHandY Live2DParameter
---@field ParamAssHandGrab Live2DParameter
---@field ParamAssHandEnable Live2DParameter
---@field ParamEyeballLX Live2DParameter
---@field ParamEyeballLY Live2DParameter
---@field ParamBlush Live2DParameter
---@field Bluescreen Live2DParameter
---@field ParamEyeballRX Live2DParameter
---@field ParamEyeballRY Live2DParameter
---@field ParamMouthOpen Live2DParameter
---@field ParamMouthForm Live2DParameter
---@field ParamHeadY Live2DParameter
---@field ParamEyeLShock Live2DParameter
---@field ParamTense Live2DParameter
---@field ParamEyeRShock Live2DParameter
---@field ParamHeart Live2DParameter
---@field ParamEyeExpression Live2DParameter
---@field ParamBrowLY Live2DParameter
---@field ParamBrowRY Live2DParameter
---@field ParamBrowLRot Live2DParameter
---@field ParamBrowRRot Live2DParameter
---@field ParamBrowLEmote Live2DParameter
---@field ParamBrowREmote Live2DParameter
---@field ParamDick Live2DParameter
---@field ParamThrust Live2DParameter
---@field ParamThrustAnal Live2DParameter
---@field ParamCumShotLengthY Live2DParameter
---@field ParamFlacidity Live2DParameter
---@field ParamHideCumShot Live2DParameter
---@field ParamCumShotAnim Live2DParameter
---@field ParamAnalCockAngle Live2DParameter
---@field ParamVaginaCockAngle Live2DParameter
---@field ParamThighjobEnable Live2DParameter
---@field ParamThrustThighjob Live2DParameter
---@field ParamThighjobCockAngle Live2DParameter
---@field ParamBotBodyStraighten Live2DParameter
---@field ButtPressed Live2DParameter
---@field ButtMovement Live2DParameter
---@field TonguePhysics Live2DParameter
---@field ParamButtPhysicsX Live2DParameter
---@field ParamButtPhysicsY Live2DParameter
---@field BoobPhysicsX Live2DParameter
---@field BoobPhysicsY Live2DParameter
---@field RibcagePhysicsRotation Live2DParameter
---@field HairPhysics Live2DParameter
---@field CumPhysics Live2DParameter
---@field ParamAssSize Live2DParameter
---@field ParamThighSize Live2DParameter
---@field ParamBoobSize Live2DParameter
---@field PhysicsSubRig_BoobsX Live2DPhysicsOverride
---@field PhysicsSubRig_Cum Live2DPhysicsOverride
---@field PhysicsSubRig_BoobsY Live2DPhysicsOverride
---@field PhysicsSubRig_Ribcage Live2DPhysicsOverride
---@field PhysicsSubRig_Hair Live2DPhysicsOverride
---@field PhysicsSubRig_Tongue Live2DPhysicsOverride
---@field PhysicsSubRig_ButtX Live2DPhysicsOverride
---@field PhysicsSubRig_ButtY Live2DPhysicsOverride
---@field HitAreaBoob Part
---@field HitAreaEyeL Part
---@field HitAreaEyeR Part
---@field HitAreaAss Part
---@field HitAreaMouth Part
---@field HitAreaMC Part
---@field DickSkinName string
---@field DickMainName string
---@field CockTipColor Color
---@field CockColor Color
---@field CumColor Color
---@field CurrentBrain ModelBrain
---@field Model CubismModel
---@field IsAnyInteractableHeld boolean
---@field CumOutsideManager CumOutsideManager
---@field CumInsideManager ICumManagerCommon
---@field IsFullyInitialized boolean
---@field ExecutionOrder integer
---@field NeedsUpdateOnEditing boolean
---@field HasUpdateController boolean
---@field Eyes EyeManagerCommon
---@field Mouth MouthManagerDefaultMouth
---@field DefaultEyesPosition Vector2
---@field EyesWhitePart Part
---@field MouthPart Part
---@field IsShirtAndHoodieAsideOrOff boolean
---@field IsHoodieAsideOrOff boolean
---@field IsHoodieAside boolean
---@field IsHoodieOn boolean
---@field IsShirtAsideOrOff boolean
---@field IsShirtAside boolean
---@field IsShirtOn boolean
---@field IsPantiesAsideOrOff boolean
---@field IsPantiesAside boolean
---@field IsPantiesOn boolean
---@field IsBraAsideOrOff boolean
---@field IsBraAside boolean
---@field IsBraOn boolean
---@field IsSkirtAside boolean
---@field IsSkirtOn boolean
---@field IsSkirtAsideOrOff boolean
---@field IsPantsAside boolean
---@field IsPantsOn boolean
---@field IsPantsAsideOrOff boolean
---@field IsDress2Aside boolean
---@field IsDress2On boolean
---@field IsDress2AsideOrOff boolean
---@field IsDress1Aside boolean
---@field IsDress1On boolean
---@field IsDress1AsideOrOff boolean
---@field IsBoobaVisible boolean
---@field CurrentToolSelector Live2DToolSelector
---@field DefaultFaceAngle Vector3
---@field IsKissing boolean
---@field Expression Live2DExpression
---@field BraEnabledParameter Live2DParameter
---@field ShirtEnabledParameter Live2DParameter
---@field SkirtEnabledParameter Live2DParameter
---@field PantsEnabledParameter Live2DParameter
---@field HoodieEnabledParameter Live2DParameter
---@field Dress2EnabledParameter Live2DParameter
---@field PantiesEnabledParameter Live2DParameter
---@field ShoeLOnParameter Live2DParameter
---@field ShoeROnParameter Live2DParameter
---@field ArmLParameter Live2DParameter
---@field ArmRParameter Live2DParameter
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
---@field DistanceBetweenSoap number
---@field SquishedDistanceBetweenSoap number
Live2DShowerController = {}

---@return Live2DShowerController
function Live2DShowerController.__new() end

---@overload fun(self: Live2DShowerController): number
---@return number
function Live2DShowerController.GetSoapUsageLeft() end

---@overload fun(self: Live2DShowerController): boolean
---@return boolean
function Live2DShowerController.UsedAnySoap() end

---@overload fun(self: Live2DShowerController): boolean
---@return boolean
function Live2DShowerController.HasAppliedEnoughSoap() end

---@overload fun(self: Live2DShowerController): number
---@return number
function Live2DShowerController.GetCleaningProgress() end

---@overload fun(self: Live2DShowerController): boolean
---@return boolean
function Live2DShowerController.HasFinishedCleaning() end

---@overload fun(self: Live2DShowerController): boolean
---@return boolean
function Live2DShowerController.MoveAllSoapInEyeArea() end

---@overload fun(self: Live2DShowerController, position: Vector3)
---@param position Vector3
function Live2DShowerController.LiftSpongeAt(position) end

---@overload fun(self: Live2DShowerController, soapPrefab: SoapScript, lastMousePosition: Vector2, newMousePosition: Vector2)
---@param soapPrefab SoapScript
---@param lastMousePosition Vector2
---@param newMousePosition Vector2
function Live2DShowerController.SpreadSoap(soapPrefab, lastMousePosition, newMousePosition) end

---@overload fun(self: Live2DShowerController)
function Live2DShowerController.DestroyAllSoap() end

---@overload fun(self: Live2DShowerController, soapPrefab: SoapScript, position: Vector2, soapItemData: SoapItemData, soapParticleType: SoapParticleType, soapStrength: number): boolean
---@overload fun(self: Live2DShowerController, soapPrefab: SoapScript, position: Vector2, soapItemData: SoapItemData, soapParticleType: SoapParticleType): boolean
---@param soapPrefab SoapScript
---@param position Vector2
---@param soapItemData SoapItemData
---@param soapParticleType SoapParticleType
---@param soapStrength? number
---@return boolean
function Live2DShowerController.TryCreateSoap(soapPrefab, position, soapItemData, soapParticleType, soapStrength) end

---@overload fun(self: Live2DShowerController)
function Live2DShowerController.FixedUpdate() end

---@overload fun(self: Live2DShowerController)
function Live2DShowerController.Update() end

---@overload fun(self: Live2DShowerController)
function Live2DShowerController.InitializeGenerated() end

---Definicao Lua de personality module; agrupa containers de dialogo e depois e ligada a um item registrado.
---@class LuaPersonalityModuleDefinition: PersonalityModuleDefinition
LuaPersonalityModuleDefinition = {}

---@return LuaPersonalityModuleDefinition
function LuaPersonalityModuleDefinition.__new() end

---Retorna ou prepara um container de dialogo identificado por tag/stage.
---@overload fun(self: LuaPersonalityModuleDefinition, tagId: MdrgKnownDialogueContainerId|string, stageNr: integer): StoryBotDialogueBranchContainer
---@overload fun(self: LuaPersonalityModuleDefinition, tagId: MdrgKnownDialogueContainerId|string): StoryBotDialogueBranchContainer
---@param tagId MdrgKnownDialogueContainerId|string
---@param stageNr? integer
---@return StoryBotDialogueBranchContainer
function LuaPersonalityModuleDefinition.PrepareContainer(tagId, stageNr) end

---@class MainModule
---@field duration number
---@field loop boolean
---@field prewarm boolean
---@field startDelay MinMaxCurve
---@field startLifetime MinMaxCurve
---@field startSpeed MinMaxCurve
---@field startSizeXMultiplier number
---@field startSizeYMultiplier number
---@field startSizeZMultiplier number
---@field startRotation MinMaxCurve
---@field startColor MinMaxGradient
---@field simulationSpace ParticleSystemSimulationSpace
---@field customSimulationSpace Transform
---@field useUnscaledTime boolean
---@field scalingMode ParticleSystemScalingMode
---@field playOnAwake boolean
---@field maxParticles integer
MainModule = {}

---@return MainModule
function MainModule.__new() end

---@class ModCustomStringReference
---@field SourceMod Mod
---@field Key string
---@field IsSmartString boolean
ModCustomStringReference = {}

---@param sourceMod Mod
---@param key string
---@param isSmartString boolean
---@return ModCustomStringReference
function ModCustomStringReference.__new(sourceMod, key, isSmartString) end

---@overload fun(args: any[]): string
---@overload fun(self: ModCustomStringReference): string
---@overload fun(self: ModCustomStringReference, args: any[]): string
---@return string
function ModCustomStringReference.Get() end

---@class ModMusicWithInfo
---@field SongName string
---@field Author string
---@field Info string
ModMusicWithInfo = {}

---@param sourceModFile ModFileBase
---@param songName string
---@param author string
---@return ModMusicWithInfo
function ModMusicWithInfo.__new(sourceModFile, songName, author) end

---@overload fun(self: ModMusicWithInfo): UniTask
---@return UniTask
function ModMusicWithInfo.GetAudioClip() end

---@overload fun(self: ModMusicWithInfo, s: string): boolean
---@param s string
---@return boolean
function ModMusicWithInfo.HasText(s) end

---Global helper exposed to mod Lua scripts for mod assets, item registration, localization, controllers, and MoonSharp coroutine helpers.
---@class ModUtilities: SingletonMonoBehaviour_ModUtilities_
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
ModUtilities = {}

---@return ModUtilities
function ModUtilities.__new() end

---@overload fun(self: ModUtilities, modGuid: Guid, key: string, text: string, smartString: boolean): ModCustomStringReference
---@overload fun(self: ModUtilities, modGuid: Guid, key: string, text: string): ModCustomStringReference
---@param modGuid Guid
---@param key string
---@param text string
---@param smartString? boolean
---@return ModCustomStringReference
function ModUtilities.CreateLocalizableString(modGuid, key, text, smartString) end

---@overload fun(self: ModUtilities, modGuid: Guid, key: string): ModCustomStringReference
---@param modGuid Guid
---@param key string
---@return ModCustomStringReference
function ModUtilities.GetLocalizableString(modGuid, key) end

---@overload fun(self: ModUtilities, modGuid: Guid, key: string): string
---@param modGuid Guid
---@param key string
---@return string
function ModUtilities.GetLocalizableStringRaw(modGuid, key) end

---Cria um ItemPrefab vazio para ser preenchido por script antes do registro do item.
---@overload fun(name: string, description: string, price: integer): ItemPrefab
---@overload fun(self: ModUtilities): ItemPrefab
---@overload fun(self: ModUtilities, name: string, description: string, price: integer): ItemPrefab
---@return ItemPrefab
function ModUtilities.CreateItemPrefab() end

---Registra um ItemPrefab para o mod e retorna o GameId gerado para lojas e referencias.
---@overload fun(self: ModUtilities, modGuid: Guid, itemPrefab: ItemPrefab): GameId
---@param modGuid Guid
---@param itemPrefab ItemPrefab
---@return GameId
function ModUtilities.CreateNewItemAutoAssignId(modGuid, itemPrefab) end

---Registra um ItemPrefab para um mod e retorna o GameId do item registrado.
---@overload fun(id: integer, modGuid: Guid, itemPrefab: ItemPrefab): GameId
---@overload fun(self: ModUtilities, modGuid: Guid, itemPrefab: ItemPrefab): GameId
---@overload fun(self: ModUtilities, id: integer, modGuid: Guid, itemPrefab: ItemPrefab): GameId
---@param modGuid Guid
---@param itemPrefab ItemPrefab
---@return GameId
function ModUtilities.CreateNewItem(modGuid, itemPrefab) end

---Adiciona um item registrado a uma loja como item generico/recompravel.
---@overload fun(self: ModUtilities, shopId: string, gameId: GameId, availabilityFunc: fun(): boolean, occurenceRate: number)
---@overload fun(self: ModUtilities, shopId: string, gameId: GameId, availabilityFunc: fun(): boolean)
---@overload fun(self: ModUtilities, shopId: string, gameId: GameId)
---@param shopId string
---@param gameId GameId
---@param availabilityFunc? fun(): boolean
---@param occurenceRate? number
function ModUtilities.AddGenericItemToShop(shopId, gameId, availabilityFunc, occurenceRate) end

---Adiciona um item registrado a uma loja como compra unica.
---@overload fun(self: ModUtilities, shopId: MdrgKnownShopId|string, gameId: GameId, availabilityFunc: fun(): boolean, occurenceRate: number)
---@overload fun(self: ModUtilities, shopId: MdrgKnownShopId|string, gameId: GameId, availabilityFunc: fun(): boolean)
---@overload fun(self: ModUtilities, shopId: MdrgKnownShopId|string, gameId: GameId)
---@param shopId MdrgKnownShopId|string
---@param gameId GameId
---@param availabilityFunc? fun(): boolean
---@param occurenceRate? number
function ModUtilities.AddSingleBuyItemToShop(shopId, gameId, availabilityFunc, occurenceRate) end

---Retorna um arquivo do pacote do mod pelo Guid do mod e caminho interno.
---@overload fun(self: ModUtilities, modGuid: Guid, path: string): ModFileBase
---@param modGuid Guid
---@param path string
---@return ModFileBase
function ModUtilities.GetModFile(modGuid, path) end

---Carrega uma textura empacotada do mod usando CurrentModGuid e o caminho interno do asset.
---@overload fun(self: ModUtilities, modGuid: Guid, formatPath: string): PackedTexturesContainer
---@param modGuid Guid
---@param formatPath string
---@return PackedTexturesContainer
function ModUtilities.GetPackedTexture(modGuid, formatPath) end

---Carrega uma Texture2D do pacote do mod.
---@overload fun(self: ModUtilities, modGuid: Guid, path: string): Texture2D
---@param modGuid Guid
---@param path string
---@return Texture2D
function ModUtilities.GetTexture(modGuid, path) end

---Cria uma referencia automatica para uma Texture2D do pacote do mod.
---@overload fun(self: ModUtilities, modGuid: Guid, path: string): Texture2DModFileAutomaticReference
---@param modGuid Guid
---@param path string
---@return Texture2DModFileAutomaticReference
function ModUtilities.GetTextureReference(modGuid, path) end

---@overload fun(self: ModUtilities, modGuid: Guid, path: string): IReference
---@param modGuid Guid
---@param path string
---@return IReference
function ModUtilities.GetMidiReference(modGuid, path) end

---@overload fun(self: ModUtilities, modGuid: Guid, path: string, songName: string, songAuthor: string): IReference
---@overload fun(self: ModUtilities, modGuid: Guid, path: string, songName: string): IReference
---@overload fun(self: ModUtilities, modGuid: Guid, path: string): IReference
---@param modGuid Guid
---@param path string
---@param songName? string
---@param songAuthor? string
---@return IReference
function ModUtilities.GetAsMusicWithInfo(modGuid, path, songName, songAuthor) end

---@overload fun(self: ModUtilities, modGuid: Guid, path: string): IReference
---@param modGuid Guid
---@param path string
---@return IReference
function ModUtilities.GetAsAudioClipReference(modGuid, path) end

---@overload fun(self: ModUtilities, cookingSong: CookingSong)
---@param cookingSong CookingSong
function ModUtilities.AddSong(cookingSong) end

---Carrega uma Sprite a partir de um asset do pacote do mod.
---@overload fun(self: ModUtilities, modGuid: Guid, path: string, ppu: number): Sprite
---@overload fun(self: ModUtilities, modGuid: Guid, path: string): Sprite
---@param modGuid Guid
---@param path string
---@param ppu? number
---@return Sprite
function ModUtilities.GetSprite(modGuid, path, ppu) end

---Cria uma referencia automatica para uma Sprite do pacote do mod.
---@overload fun(self: ModUtilities, modGuid: Guid, path: string, ppu: number): IReference
---@overload fun(self: ModUtilities, modGuid: Guid, path: string): IReference
---@param modGuid Guid
---@param path string
---@param ppu? number
---@return IReference
function ModUtilities.GetSpriteReference(modGuid, path, ppu) end

---Cria uma referencia de Sprite convertida a partir de uma textura do pacote do mod.
---@overload fun(self: ModUtilities, modGuid: Guid, path: string, ppu: number): IReference
---@overload fun(self: ModUtilities, modGuid: Guid, path: string): IReference
---@param modGuid Guid
---@param path string
---@param ppu? number
---@return IReference
function ModUtilities.GetAsSprite(modGuid, path, ppu) end

---@overload fun(self: ModUtilities): Guid
---@return Guid
function ModUtilities.GetNewGuid() end

---Cria uma definicao de personality module para receber containers e branches de dialogo.
---@overload fun(self: ModUtilities): LuaPersonalityModuleDefinition
---@return LuaPersonalityModuleDefinition
function ModUtilities.PrepareNewPersonalityDefinition() end

---Starts a managed coroutine from a MoonSharp closure. The optional callback runs when the coroutine finishes.
---@overload fun(self: ModUtilities, closure: function, onFinished: fun()): ManagedCoroutineWithTarget
---@overload fun(self: ModUtilities, closure: function): ManagedCoroutineWithTarget
---@param closure function
---@param onFinished? fun()
---@return ManagedCoroutineWithTarget
function ModUtilities.StartCoroutine(closure, onFinished) end

---Creates a WaitForSeconds yield instruction for use inside a MoonSharp coroutine.
---@overload fun(self: ModUtilities, seconds: number): WaitForSeconds
---@param seconds number
---@return WaitForSeconds
function ModUtilities.WaitForSeconds(seconds) end

---Stops a managed coroutine returned by StartCoroutine.
---@overload fun(self: ModUtilities, coroutine: ManagedCoroutineWithTarget)
---@param coroutine ManagedCoroutineWithTarget
function ModUtilities.StopCoroutine(coroutine) end

---@overload fun(self: ModUtilities): GameVariables
---@return GameVariables
function ModUtilities.GetGameVariables() end

---Retorna missionary controller.
---@overload fun(self: ModUtilities): ControllerEnum
---@return ControllerEnum
function ModUtilities.GetMissionaryController() end

---Retorna doggy controller.
---@overload fun(self: ModUtilities): ControllerEnum
---@return ControllerEnum
function ModUtilities.GetDoggyController() end

---Retorna interact controller.
---@overload fun(self: ModUtilities): ControllerEnum
---@return ControllerEnum
function ModUtilities.GetInteractController() end

---Retorna um controller/cena pelo identificador textual usado em texturas e overrides.
---@overload fun(self: ModUtilities, id: MdrgKnownControllerId|string): ControllerEnum
---@param id MdrgKnownControllerId|string
---@return ControllerEnum
function ModUtilities.GetController(id) end

---@class MusicArtist: ScriptableObject
---@field HasAllLinks boolean
---@field ShortInfo string
---@field Info string
---@field name string
---@field hideFlags HideFlags
---@field Name string
---@field AdditionalInfo string
---@field SpotifyLink string
---@field AppleMusicLink string
---@field YoutubeLink string
MusicArtist = {}

---@return MusicArtist
function MusicArtist.__new() end

---@overload fun(self: MusicArtist): string
---@return string
function MusicArtist.GetSpotifyUri() end

---@class MusicContainer
---@field BadEnd_A_Soft_Decay SerializableAutomaticReference
---@field BadEnd_First_Time_for_Everything SerializableAutomaticReference
---@field BadEnd_There_s_Always_Tomorrow SerializableAutomaticReference
---@field BadEnd_Demise SerializableAutomaticReference
---@field BadEnd_Walking_Through_a_Mine_Field SerializableAutomaticReference
---@field BadEnd_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field BadEnd_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field BadEnd_All SerializableAutomaticReference[]
---@field Cooking_RAPID_COOKING_CHALLENGE SerializableAutomaticReference
---@field Cooking_Air_Fryer SerializableAutomaticReference
---@field Cooking_Pudollarsy_Poppin__Pasta SerializableAutomaticReference
---@field Cooking_Cream_N_Pie SerializableAutomaticReference
---@field Cooking_Cocktail SerializableAutomaticReference
---@field Cooking_Let_Him_Cook SerializableAutomaticReference
---@field Cooking_Protein_Shake SerializableAutomaticReference
---@field Cooking_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Cooking_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Cooking_All SerializableAutomaticReference[]
---@field Cuddle_Jun_s_Song SerializableAutomaticReference
---@field Cuddle_Take_a_deep_breath SerializableAutomaticReference
---@field Cuddle_If_Only SerializableAutomaticReference
---@field Cuddle_Steel_In_Your_Socks SerializableAutomaticReference
---@field Cuddle_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Cuddle_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Cuddle_All SerializableAutomaticReference[]
---@field Dates_She_s_Real_to_Me SerializableAutomaticReference
---@field Dates_Just_You_and_Me SerializableAutomaticReference
---@field Dates_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Dates_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Dates_All SerializableAutomaticReference[]
---@field Fishing_Candlelight SerializableAutomaticReference
---@field Fishing_Rainy_Day SerializableAutomaticReference
---@field Fishing_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Fishing_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Fishing_All SerializableAutomaticReference[]
---@field MainMenu_Arabesque SerializableAutomaticReference
---@field MainMenu_Clair_de_lune SerializableAutomaticReference
---@field MainMenu_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field MainMenu_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field MainMenu_All SerializableAutomaticReference[]
---@field Other_Juice__Unmuffled___Extended_ SerializableAutomaticReference
---@field Other_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Other_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Other_All SerializableAutomaticReference[]
---@field Outside_Normal_Make_It_Snappy SerializableAutomaticReference
---@field Outside_Normal_Polluted_Sunshine SerializableAutomaticReference
---@field Outside_Normal_Streets__Slowed_ SerializableAutomaticReference
---@field Outside_Normal_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Outside_Normal_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Outside_Normal_All SerializableAutomaticReference[]
---@field Outside_Riots_ISO_Lated SerializableAutomaticReference
---@field Outside_Riots_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Outside_Riots_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Outside_Riots_All SerializableAutomaticReference[]
---@field Outside_WithBot_Mile_High SerializableAutomaticReference
---@field Outside_WithBot_Simulated_Happiness SerializableAutomaticReference
---@field Outside_WithBot_Our_Time SerializableAutomaticReference
---@field Outside_WithBot_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Outside_WithBot_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Outside_WithBot_All SerializableAutomaticReference[]
---@field PC_Exotic_Hardware SerializableAutomaticReference
---@field PC_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field PC_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field PC_All SerializableAutomaticReference[]
---@field Room_Day_Faded_Fate SerializableAutomaticReference
---@field Room_Day_Against_All_Odds SerializableAutomaticReference
---@field Room_Day_Maybe_It_Ain_t_So_Bad SerializableAutomaticReference
---@field Room_Day_This_Feels_Nice SerializableAutomaticReference
---@field Room_Day_Daybreak_With_You SerializableAutomaticReference
---@field Room_Day_Distraction SerializableAutomaticReference
---@field Room_Day_Keep_Going SerializableAutomaticReference
---@field Room_Day_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Room_Day_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Room_Day_All SerializableAutomaticReference[]
---@field Room_Day_Late_Game_One_Wish SerializableAutomaticReference
---@field Room_Day_Late_Game_White_Dress SerializableAutomaticReference
---@field Room_Day_Late_Game_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Room_Day_Late_Game_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Room_Day_Late_Game_All SerializableAutomaticReference[]
---@field Room_Low_Sanity_God_s_Loophole SerializableAutomaticReference
---@field Room_Low_Sanity_I_Am_an_Orange_and_I_Need_to_be_Peeled SerializableAutomaticReference
---@field Room_Low_Sanity_Rainbow_Room SerializableAutomaticReference
---@field Room_Low_Sanity_The_Walls_are_Melting SerializableAutomaticReference
---@field Room_Low_Sanity_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Room_Low_Sanity_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Room_Low_Sanity_All SerializableAutomaticReference[]
---@field Room_Night_Valium SerializableAutomaticReference
---@field Room_Night_Working_From_Home SerializableAutomaticReference
---@field Room_Night_Don_t_Worry_About_Me SerializableAutomaticReference
---@field Room_Night_Unfading_Clouds SerializableAutomaticReference
---@field Room_Night_Lofi_In_My_Bedroom SerializableAutomaticReference
---@field Room_Night_Focus SerializableAutomaticReference
---@field Room_Night_Spirasomnus SerializableAutomaticReference
---@field Room_Night_Warm_Nights SerializableAutomaticReference
---@field Room_Night_Dull_Feelings SerializableAutomaticReference
---@field Room_Night_Snake_Eyes__v2_ SerializableAutomaticReference
---@field Room_Night_Reflection SerializableAutomaticReference
---@field Room_Night_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Room_Night_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Room_Night_All SerializableAutomaticReference[]
---@field Room_Special_Nightmare SerializableAutomaticReference
---@field Room_Special_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Room_Special_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Room_Special_All SerializableAutomaticReference[]
---@field Serious_Just_You_Wait SerializableAutomaticReference
---@field Serious_Danger_Around_the_Corner SerializableAutomaticReference
---@field Serious_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Serious_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Serious_All SerializableAutomaticReference[]
---@field Sex_Ass_Effect SerializableAutomaticReference
---@field Sex_Boner_Jam SerializableAutomaticReference
---@field Sex_CyberHunk_2069 SerializableAutomaticReference
---@field Sex_Death_Grip SerializableAutomaticReference
---@field Sex_Up_All_Night SerializableAutomaticReference
---@field Sex_Yogurt_Male SerializableAutomaticReference
---@field Sex_Questionable SerializableAutomaticReference
---@field Sex_Carrot SerializableAutomaticReference
---@field Sex_Evox_Machine SerializableAutomaticReference
---@field Sex_Banger SerializableAutomaticReference
---@field Sex_Sex SerializableAutomaticReference
---@field Sex_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Sex_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Sex_All SerializableAutomaticReference[]
---@field Story_See_It_Now SerializableAutomaticReference
---@field Story_Thank_You SerializableAutomaticReference
---@field Story_Wish_Things_Were_Easier SerializableAutomaticReference
---@field Story_Moan_Choir SerializableAutomaticReference
---@field Story_Hypersexual SerializableAutomaticReference
---@field Story_Motoyasu SerializableAutomaticReference
---@field Story_Fall SerializableAutomaticReference
---@field Story_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Story_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Story_All SerializableAutomaticReference[]
---@field Story_Prologue_Coincidences SerializableAutomaticReference
---@field Story_Prologue_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Story_Prologue_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Story_Prologue_All SerializableAutomaticReference[]
---@field Themes_AnnoyingNeighbour_Juice__Muffled_ SerializableAutomaticReference
---@field Themes_AnnoyingNeighbour_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Themes_AnnoyingNeighbour_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Themes_AnnoyingNeighbour_All SerializableAutomaticReference[]
---@field Themes_BigDaddyHurt_Night SerializableAutomaticReference
---@field Themes_BigDaddyHurt_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Themes_BigDaddyHurt_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Themes_BigDaddyHurt_All SerializableAutomaticReference[]
---@field Themes_Cashier_Mystery_Meat SerializableAutomaticReference
---@field Themes_Cashier_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Themes_Cashier_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Themes_Cashier_All SerializableAutomaticReference[]
---@field Themes_Church_Choir_Boy_Drama SerializableAutomaticReference
---@field Themes_Church_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Themes_Church_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Themes_Church_All SerializableAutomaticReference[]
---@field Themes_Lady_Annalie_Oddly_Enough SerializableAutomaticReference
---@field Themes_Lady_Annalie_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Themes_Lady_Annalie_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Themes_Lady_Annalie_All SerializableAutomaticReference[]
---@field Themes_Landlord_It_s_Him_Again SerializableAutomaticReference
---@field Themes_Landlord_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Themes_Landlord_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Themes_Landlord_All SerializableAutomaticReference[]
---@field Themes_Police_Jazz_On_My_Face SerializableAutomaticReference
---@field Themes_Police_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Themes_Police_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Themes_Police_All SerializableAutomaticReference[]
---@field Work_Laid_Runner SerializableAutomaticReference
---@field Work_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Work_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Work_All SerializableAutomaticReference[]
---@field All SerializableAutomaticReference[]
MusicContainer = {}

---@return MusicContainer
function MusicContainer.__new() end

---@class MusicDataGenerated: SingletonScriptableObject_MusicDataGenerated_
---@field name string
---@field hideFlags HideFlags
---@field MusicGroups MusicGroupsContainer
---@field Music MusicContainer
---@field Artists ArtistsContainer
---@field Midi MidiContainer
MusicDataGenerated = {}

---@return MusicDataGenerated
function MusicDataGenerated.__new() end

---@overload fun(self: MusicDataGenerated)
function MusicDataGenerated.OnBeforeSerialize() end

---@overload fun(self: MusicDataGenerated)
function MusicDataGenerated.OnAfterDeserialize() end

---@overload fun(self: MusicDataGenerated)
function MusicDataGenerated.RegisterLua() end

---@class MusicGroup: ScriptableObject
---@field name string
---@field hideFlags HideFlags
---@field music MusicWithInfo[]
MusicGroup = {}

---@return MusicGroup
function MusicGroup.__new() end

---@class MusicGroupsContainer
---@field CashierMusicGroup SerializableAutomaticReference
---@field OutsideGroup SerializableAutomaticReference
---@field OutsideRiotsGroup SerializableAutomaticReference
---@field OutsideWithBotGroup SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
MusicGroupsContainer = {}

---@return MusicGroupsContainer
function MusicGroupsContainer.__new() end

---@class MusicOption
---@field Id string
---@field Layer MusicOptionLayer
---@field MusicWithInfo MusicWithInfo
---@field Condition fun(): boolean
---@field MeetsCondition boolean
---@field Info string
---@field InfoWithCondition string
MusicOption = {}

---@overload fun(id: string, layer: MusicOptionLayer, condition: fun(): boolean, musicWithInfo: MusicWithInfo): MusicOption
---@param id string
---@param layer MusicOptionLayer
---@param musicWithInfo MusicWithInfo
---@return MusicOption
function MusicOption.__new(id, layer, musicWithInfo) end

---@class MusicPlayer
---@field Option MusicOption
---@field Finished boolean
---@field MusicVolumeMulti number
MusicPlayer = {}

---@param option MusicOption
---@return MusicPlayer
function MusicPlayer.__new(option) end

---@overload fun(self: MusicPlayer)
function MusicPlayer.UpdateMusicVolume() end

---@overload fun(self: MusicPlayer)
function MusicPlayer.Play() end

---@overload fun(self: MusicPlayer)
function MusicPlayer.FadeOut() end

---@overload fun(self: MusicPlayer, pitch: number)
---@param pitch number
function MusicPlayer.SetPitch(pitch) end

---@overload fun(self: MusicPlayer, musicOption: MusicOption)
---@param musicOption MusicOption
function MusicPlayer.ContinueAs(musicOption) end

---@class MusicWithInfo: ScriptableObject
---@field ArtistsInfo string
---@field NameInfo string
---@field Info string
---@field SongName string
---@field name string
---@field hideFlags HideFlags
---@field Artists MusicArtist[]
---@field Name string
---@field Group MusicGroupName
---@field Order integer
---@field Notes string
MusicWithInfo = {}

---@return MusicWithInfo
function MusicWithInfo.__new() end

---@overload fun(self: MusicWithInfo): AssetReferenceT
---@return AssetReferenceT
function MusicWithInfo.GetClipReference() end

---@overload fun(self: MusicWithInfo): UniTask
---@return UniTask
function MusicWithInfo.GetAudioClip() end

---@overload fun(self: MusicWithInfo, s: string): boolean
---@param s string
---@return boolean
function MusicWithInfo.HasText(s) end

---@class NewsData
---@field newsId integer
---@field gameId GameId
---@field newsSeed integer
NewsData = {}

---@overload fun(newsId: GameId, newsSeed: integer): NewsData
---@return NewsData
function NewsData.__new() end

---@overload fun(self: NewsData)
function NewsData.OnBeforeSerialize() end

---@overload fun(self: NewsData)
function NewsData.OnAfterDeserialize() end

---Gerenciador de noticias usado por scripts internos para escolher ou forcar noticias.
---@class NewsDataManager
---@field mainNews NewsData
---@field sideNews1 NewsData
---@field sideNews2 NewsData
---@field sideNews3 NewsData
---@field opinionNews NewsData
NewsDataManager = {}

---@return NewsDataManager
function NewsDataManager.CreateInstance() end

---@overload fun(self: NewsDataManager)
function NewsDataManager.InitializeNewGame() end

---@overload fun(self: NewsDataManager, type: NewsId)
---@param type NewsId
function NewsDataManager.Randomize(type) end

---@overload fun(self: NewsDataManager, hourInDay: integer)
---@param hourInDay integer
function NewsDataManager.HourPassed(hourInDay) end

---Forca uma noticia especifica usando NewsId e GameId.
---@overload fun(self: NewsDataManager, type: NewsId, newsGameId: GameId, seed: integer)
---@overload fun(self: NewsDataManager, type: NewsId, newsGameId: GameId)
---@param type NewsId
---@param newsGameId GameId
---@param seed? integer
function NewsDataManager.Force(type, newsGameId, seed) end

---@class NewsImagesContainer
---@field animal SerializableAutomaticReference
---@field army SerializableAutomaticReference
---@field blackman SerializableAutomaticReference
---@field brogan SerializableAutomaticReference
---@field cartoon SerializableAutomaticReference
---@field cemetery SerializableAutomaticReference
---@field child SerializableAutomaticReference
---@field computer SerializableAutomaticReference
---@field demonstration SerializableAutomaticReference
---@field demonstration2 SerializableAutomaticReference
---@field fat SerializableAutomaticReference
---@field happykid SerializableAutomaticReference
---@field hotdog SerializableAutomaticReference
---@field island SerializableAutomaticReference
---@field jumper SerializableAutomaticReference
---@field OPanime SerializableAutomaticReference
---@field OPanimeboy SerializableAutomaticReference
---@field OPblacks SerializableAutomaticReference
---@field OPcar SerializableAutomaticReference
---@field OPchildandadult SerializableAutomaticReference
---@field OPcompany SerializableAutomaticReference
---@field OPcomputer2 SerializableAutomaticReference
---@field OPcooking SerializableAutomaticReference
---@field OPdragqueen SerializableAutomaticReference
---@field OPfemale SerializableAutomaticReference
---@field OPfuneral SerializableAutomaticReference
---@field OPnaked SerializableAutomaticReference
---@field OPpolice SerializableAutomaticReference
---@field OPpolice2 SerializableAutomaticReference
---@field OPpolice3 SerializableAutomaticReference
---@field OPpolitician SerializableAutomaticReference
---@field OPpolitics SerializableAutomaticReference
---@field OPpoor SerializableAutomaticReference
---@field OPpope SerializableAutomaticReference
---@field OPporn SerializableAutomaticReference
---@field OPsocialmedia SerializableAutomaticReference
---@field OPsport SerializableAutomaticReference
---@field OPsurgery SerializableAutomaticReference
---@field OPuni SerializableAutomaticReference
---@field pills SerializableAutomaticReference
---@field police SerializableAutomaticReference
---@field police2 SerializableAutomaticReference
---@field police3 SerializableAutomaticReference
---@field policechild SerializableAutomaticReference
---@field priest SerializableAutomaticReference
---@field protest SerializableAutomaticReference
---@field religion SerializableAutomaticReference
---@field religion2 SerializableAutomaticReference
---@field revolution SerializableAutomaticReference
---@field ring SerializableAutomaticReference
---@field satellite SerializableAutomaticReference
---@field sewer SerializableAutomaticReference
---@field sex SerializableAutomaticReference
---@field soldiers SerializableAutomaticReference
---@field toilet SerializableAutomaticReference
---@field virus SerializableAutomaticReference
---@field weapon SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
NewsImagesContainer = {}

---@return NewsImagesContainer
function NewsImagesContainer.__new() end

---@class NormalEvent
---@field eventHolder EventHolder
---@field startTime integer
NormalEvent = {}

---@return NormalEvent
function NormalEvent.__new() end

---@class OtherDataGenerated: SingletonScriptableObject_OtherDataGenerated_
---@field name string
---@field hideFlags HideFlags
---@field ShowerParticleSystems ShowerParticleSystemsContainer
---@field ShowerParticleSystemsGroups ShowerParticleSystemsGroupsContainer
OtherDataGenerated = {}

---@return OtherDataGenerated
function OtherDataGenerated.__new() end

---@overload fun(self: OtherDataGenerated)
function OtherDataGenerated.OnBeforeSerialize() end

---@overload fun(self: OtherDataGenerated)
function OtherDataGenerated.OnAfterDeserialize() end

---@overload fun(self: OtherDataGenerated)
function OtherDataGenerated.RegisterLua() end

---@class PCMReaderCallback: MulticastDelegate
---@field Method MethodInfo
---@field Target any
PCMReaderCallback = {}

---@overload fun(self: PCMReaderCallback, data: number[])
---@param data number[]
function PCMReaderCallback.Invoke(data) end

---@class PersonalityModuleDefinition
PersonalityModuleDefinition = {}

---@param storySingleton StorySingleton
---@return StoryBotDialogueTagDefinition[]
function PersonalityModuleDefinition.GetAllPersonalityModifiableTags(storySingleton) end

---@overload fun(self: PersonalityModuleDefinition, gameId: GameId)
---@param gameId GameId
function PersonalityModuleDefinition.AddItem(gameId) end

---@class R
---@field TextPrefabs TextPrefabsContainer
---@field MusicGroups MusicGroupsContainer
---@field Music MusicContainer
---@field Artists ArtistsContainer
---@field Midi MidiContainer
---@field ShowerParticleSystems ShowerParticleSystemsContainer
---@field ShowerParticleSystemsGroups ShowerParticleSystemsGroupsContainer
---@field Live2DShaders Live2DShadersContainer
---@field Sound SoundContainer
---@field AltBackgrounds AltBackgroundsContainer
---@field FishingBackgrounds FishingBackgroundsContainer
---@field PartnerLogos PartnerLogosContainer
---@field OtherLogos OtherLogosContainer
---@field Icons IconsContainer
---@field CardsMain CardsMainContainer
---@field CardsCasino CardsCasinoContainer
---@field PcIcons PcIconsContainer
---@field NewsImages NewsImagesContainer
---@field GameLogo GameLogoContainer
---@field CreditsText CreditsTextContainer
---@field OtherText OtherTextContainer
R = {}

---@return R
function R.__new() end

---@param globalsTable Table
function R.RegisterLua(globalsTable) end

---@class Recipe
---@field ExpectedResult GameId
---@field ExpectedResultPrefab ItemPrefab
---@field AllIngredients RecipeIngredient[]
Recipe = {}

---@param expectedResult GameId
---@param createDishItemFunc fun(arg1: CookingResults, arg2: Item[]): Item
---@return Recipe
function Recipe.__new(expectedResult, createDishItemFunc) end

---@param expectedResult GameId
---@return Recipe
function Recipe.CreateInstance(expectedResult) end

---@overload fun(self: Recipe, results: CookingResults, usedItems: Item[]): Item
---@param results CookingResults
---@param usedItems Item[]
---@return Item
function Recipe.CreateDish(results, usedItems) end

---@overload fun(self: Recipe, recipeIngredient: RecipeIngredient)
---@param recipeIngredient RecipeIngredient
function Recipe.AddIngredient(recipeIngredient) end

---@overload fun(gameId: GameId, count: integer, isOptional: boolean)
---@overload fun(gameId: GameId, count: integer)
---@overload fun(gameId: GameId)
---@overload fun(self: Recipe, itemEnum: ItemEnum, count: integer, isOptional: boolean)
---@overload fun(self: Recipe, itemEnum: ItemEnum, count: integer)
---@overload fun(self: Recipe, itemEnum: ItemEnum)
---@overload fun(self: Recipe, gameId: GameId, count: integer, isOptional: boolean)
---@overload fun(self: Recipe, gameId: GameId, count: integer)
---@overload fun(self: Recipe, gameId: GameId)
---@param itemEnum ItemEnum
---@param count? integer
---@param isOptional? boolean
function Recipe.AddIngredientExact(itemEnum, count, isOptional) end

---@overload fun(self: Recipe, type: EdibleTypeEnum, count: integer, isOptional: boolean)
---@overload fun(self: Recipe, type: EdibleTypeEnum, count: integer)
---@overload fun(self: Recipe, type: EdibleTypeEnum)
---@param type EdibleTypeEnum
---@param count? integer
---@param isOptional? boolean
function Recipe.AddIngredientGenericType(type, count, isOptional) end

---@overload fun(self: Recipe, minWeight: number, count: integer, isOptional: boolean)
---@overload fun(self: Recipe, minWeight: number, count: integer)
---@overload fun(self: Recipe, minWeight: number)
---@param minWeight number
---@param count? integer
---@param isOptional? boolean
function Recipe.AddIngredientFishMinWeight(minWeight, count, isOptional) end

---@class Result
---@field HasDescription boolean
---@field IsSuccess boolean
---@field IsFail boolean
---@field Success SimpleResult
---@field Fail SimpleResult
Result = {}

---@param value boolean
---@return Result
function Result.__toResult(value) end

---@overload fun(value: boolean, description: string): SimpleResult
---@param value boolean
---@return SimpleResult
function Result.CreateFromBool(value) end

---@param description string
---@return SimpleResult
function Result.SuccessWithDescription(description) end

---@param description string
---@return SimpleResult
function Result.FailWithDescription(description) end

---@param results Result[]
---@param prefix? string
---@return CompoundResult
function Result.All(results, prefix) end

---@overload fun(self: Result)
function Result.DebugLogIfFail() end

---@overload fun(self: Result)
function Result.DebugLogError() end

---@overload fun(self: Result): string
---@return string
function Result.GetDescription() end

---@overload fun(self: Result): string
---@return string
function Result.ToString() end

---@overload fun(self: Result, prefix: string): SimpleResult
---@param prefix string
---@return SimpleResult
function Result.CreateNewWithPrefix(prefix) end

---@param specialParsingException Exception
---@return ExceptionResult
function Result.FromException(specialParsingException) end

---@class RobotPersonalityDefinition: ConversationContainerPersonalityModuleDefinition_RobotPersonalityModuleConversations_
RobotPersonalityDefinition = {}

---@param storySingleton StorySingleton
---@return RobotPersonalityDefinition
function RobotPersonalityDefinition.__new(storySingleton) end

---@class RobotPersonalityModuleConversations: BasePersonalityModuleConversationContainer
---@field ContainerName string
---@field Frick_StartFrick SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockOutside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInsideAnal SerializedLocalizedConversation
---@field Frick_CumInside SerializedLocalizedConversation
---@field Frick_CumInsideAnal SerializedLocalizedConversation
---@field Frick_CumOutside SerializedLocalizedConversation
---@field Frick_CumTogether SerializedLocalizedConversation
---@field Frick_BotCumming SerializedLocalizedConversation
---@field Frick_Moan SerializedLocalizedConversation
---@field Frick_EdgingOn SerializedLocalizedConversation
---@field Frick_EdgingOff SerializedLocalizedConversation
---@field Frick_Headpat SerializedLocalizedConversation
---@field Frick_RapeBegStopSuccess SerializedLocalizedConversation
---@field Frick_RapeBegStopRefuse SerializedLocalizedConversation
---@field Frick_RapeFlacidReaction SerializedLocalizedConversation
---@field Frick_FingeringBotCumming SerializedLocalizedConversation
---@field Frick_FingeringDuring SerializedLocalizedConversation
---@field Frick_BoobFondle SerializedLocalizedConversation
---@field Frick_NipplePull SerializedLocalizedConversation
---@field Frick_PussySpread SerializedLocalizedConversation
---@field Frick_ClitRub SerializedLocalizedConversation
---@field Frick_Handholding SerializedLocalizedConversation
---@field Frick_UpsetOnlySheMoves SerializedLocalizedConversation
---@field Frick_CumThighjob SerializedLocalizedConversation
---@field Frick_FlacidBoredReaction SerializedLocalizedConversation
---@field Blowjob_EdgingAlmostCame SerializedLocalizedConversation
---@field Blowjob_EdgingHadToSlowdown SerializedLocalizedConversation
---@field Blowjob_EdgingForceStop SerializedLocalizedConversation
---@field Blowjob_SwallowFull SerializedLocalizedConversation
---@field Blowjob_SwallowHalf SerializedLocalizedConversation
---@field Blowjob_SwallowLittle SerializedLocalizedConversation
---@field Blowjob_SwallowAlmostEmpty SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotLead SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotRape SerializedLocalizedConversation
---@field Blowjob_SwallowWithMl SerializedLocalizedConversation
---@field Cowgirl_RemovePants SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsert SerializedLocalizedConversation
---@field Cowgirl_EdgingForceStopped SerializedLocalizedConversation
---@field Cowgirl_EdgingBreak SerializedLocalizedConversation
---@field Cowgirl_FlacidReaction SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestion SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestionDidntAnswer SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertRape SerializedLocalizedConversation
---@field Cowgirl_MadeMcCumInsideWhileCummingHerself SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobRape SerializedLocalizedConversation
---@field Cowgirl_AfterFirstInsertBotRape SerializedLocalizedConversation
RobotPersonalityModuleConversations = {}

---@return RobotPersonalityModuleConversations
function RobotPersonalityModuleConversations.__new() end

---@class Route
---@field VisitedBlocks HashSet
---@field Steps Step[]
---@field Flags string[]
Route = {}

---@return Route
function Route.__new() end

---@overload fun(self: Route, step: Step)
---@param step Step
function Route.AddStep(step) end

---@overload fun(self: Route): Route
---@return Route
function Route.MakeCopy() end

---@overload fun(self: Route, sb: StringBuilder)
---@param sb StringBuilder
function Route.Describe(sb) end

---@class SerializableDeliveryData
---@field Sender SimpleLocalizedString
---@field timeTillDelivery integer
---@field hasSender boolean
---@field sender SimpleLocalizedString
---@field items Item[]
SerializableDeliveryData = {}

---@param timeTillDelivery integer
---@param sender SimpleLocalizedString
---@param items Item[]
---@return SerializableDeliveryData
function SerializableDeliveryData.__new(timeTillDelivery, sender, items) end

---@class ShapeModule
---@field enabled boolean
---@field alignToDirection boolean
---@field scale Vector3
ShapeModule = {}

---@return ShapeModule
function ShapeModule.__new() end

---@class SillyCatPersonalityModuleConversations: BasePersonalityModuleConversationContainer
---@field ContainerName string
---@field Frick_StartFrick SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockOutside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInsideAnal SerializedLocalizedConversation
---@field Frick_CumInside SerializedLocalizedConversation
---@field Frick_CumInsideAnal SerializedLocalizedConversation
---@field Frick_CumOutside SerializedLocalizedConversation
---@field Frick_CumTogether SerializedLocalizedConversation
---@field Frick_BotCumming SerializedLocalizedConversation
---@field Frick_Moan SerializedLocalizedConversation
---@field Frick_EdgingOn SerializedLocalizedConversation
---@field Frick_EdgingOff SerializedLocalizedConversation
---@field Frick_Headpat SerializedLocalizedConversation
---@field Frick_RapeBegStopSuccess SerializedLocalizedConversation
---@field Frick_RapeBegStopRefuse SerializedLocalizedConversation
---@field Frick_RapeFlacidReaction SerializedLocalizedConversation
---@field Frick_FingeringBotCumming SerializedLocalizedConversation
---@field Frick_FingeringDuring SerializedLocalizedConversation
---@field Frick_BoobFondle SerializedLocalizedConversation
---@field Frick_NipplePull SerializedLocalizedConversation
---@field Frick_PussySpread SerializedLocalizedConversation
---@field Frick_ClitRub SerializedLocalizedConversation
---@field Frick_Handholding SerializedLocalizedConversation
---@field Frick_UpsetOnlySheMoves SerializedLocalizedConversation
---@field Frick_CumThighjob SerializedLocalizedConversation
---@field Frick_FlacidBoredReaction SerializedLocalizedConversation
---@field Blowjob_EdgingAlmostCame SerializedLocalizedConversation
---@field Blowjob_EdgingHadToSlowdown SerializedLocalizedConversation
---@field Blowjob_EdgingForceStop SerializedLocalizedConversation
---@field Blowjob_SwallowFull SerializedLocalizedConversation
---@field Blowjob_SwallowHalf SerializedLocalizedConversation
---@field Blowjob_SwallowLittle SerializedLocalizedConversation
---@field Blowjob_SwallowAlmostEmpty SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotLead SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotRape SerializedLocalizedConversation
---@field Blowjob_SwallowWithMl SerializedLocalizedConversation
---@field Cowgirl_RemovePants SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsert SerializedLocalizedConversation
---@field Cowgirl_EdgingForceStopped SerializedLocalizedConversation
---@field Cowgirl_EdgingBreak SerializedLocalizedConversation
---@field Cowgirl_FlacidReaction SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestion SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestionDidntAnswer SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertRape SerializedLocalizedConversation
---@field Cowgirl_MadeMcCumInsideWhileCummingHerself SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobRape SerializedLocalizedConversation
---@field Cowgirl_AfterFirstInsertBotRape SerializedLocalizedConversation
SillyCatPersonalityModuleConversations = {}

---@return SillyCatPersonalityModuleConversations
function SillyCatPersonalityModuleConversations.__new() end

---@class SlutPersonalityModuleConversations: BasePersonalityModuleConversationContainer
---@field ContainerName string
---@field Frick_StartFrick SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockOutside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInsideAnal SerializedLocalizedConversation
---@field Frick_CumInside SerializedLocalizedConversation
---@field Frick_CumInsideAnal SerializedLocalizedConversation
---@field Frick_CumOutside SerializedLocalizedConversation
---@field Frick_CumTogether SerializedLocalizedConversation
---@field Frick_BotCumming SerializedLocalizedConversation
---@field Frick_Moan SerializedLocalizedConversation
---@field Frick_EdgingOn SerializedLocalizedConversation
---@field Frick_EdgingOff SerializedLocalizedConversation
---@field Frick_Headpat SerializedLocalizedConversation
---@field Frick_RapeBegStopSuccess SerializedLocalizedConversation
---@field Frick_RapeBegStopRefuse SerializedLocalizedConversation
---@field Frick_RapeFlacidReaction SerializedLocalizedConversation
---@field Frick_FingeringBotCumming SerializedLocalizedConversation
---@field Frick_FingeringDuring SerializedLocalizedConversation
---@field Frick_BoobFondle SerializedLocalizedConversation
---@field Frick_NipplePull SerializedLocalizedConversation
---@field Frick_PussySpread SerializedLocalizedConversation
---@field Frick_ClitRub SerializedLocalizedConversation
---@field Frick_Handholding SerializedLocalizedConversation
---@field Frick_UpsetOnlySheMoves SerializedLocalizedConversation
---@field Frick_CumThighjob SerializedLocalizedConversation
---@field Frick_FlacidBoredReaction SerializedLocalizedConversation
---@field Blowjob_EdgingAlmostCame SerializedLocalizedConversation
---@field Blowjob_EdgingHadToSlowdown SerializedLocalizedConversation
---@field Blowjob_EdgingForceStop SerializedLocalizedConversation
---@field Blowjob_SwallowFull SerializedLocalizedConversation
---@field Blowjob_SwallowHalf SerializedLocalizedConversation
---@field Blowjob_SwallowLittle SerializedLocalizedConversation
---@field Blowjob_SwallowAlmostEmpty SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotLead SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotRape SerializedLocalizedConversation
---@field Blowjob_SwallowWithMl SerializedLocalizedConversation
---@field Cowgirl_RemovePants SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsert SerializedLocalizedConversation
---@field Cowgirl_EdgingForceStopped SerializedLocalizedConversation
---@field Cowgirl_EdgingBreak SerializedLocalizedConversation
---@field Cowgirl_FlacidReaction SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestion SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestionDidntAnswer SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertRape SerializedLocalizedConversation
---@field Cowgirl_MadeMcCumInsideWhileCummingHerself SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobRape SerializedLocalizedConversation
---@field Cowgirl_AfterFirstInsertBotRape SerializedLocalizedConversation
SlutPersonalityModuleConversations = {}

---@return SlutPersonalityModuleConversations
function SlutPersonalityModuleConversations.__new() end

---@class SoundCategory
---@field name string
---@field audioClips AudioClip[]
SoundCategory = {}

---@overload fun(name: string, audioClips: AudioClip[]): SoundCategory
---@return SoundCategory
function SoundCategory.__new() end

---@overload fun(self: SoundCategory): AudioClip
---@return AudioClip
function SoundCategory.GetRandom() end

---@class SoundContainer
---@field Bell_bell1 SerializableAutomaticReference
---@field Bell_bell2 SerializableAutomaticReference
---@field Bell_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Bell_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Bell_All SerializableAutomaticReference[]
---@field Blowjob_bottomout_bottomout1 SerializableAutomaticReference
---@field Blowjob_bottomout_bottomout2 SerializableAutomaticReference
---@field Blowjob_bottomout_bottomout3 SerializableAutomaticReference
---@field Blowjob_bottomout_bottomout4 SerializableAutomaticReference
---@field Blowjob_bottomout_bottomout5 SerializableAutomaticReference
---@field Blowjob_bottomout_bottomout6 SerializableAutomaticReference
---@field Blowjob_bottomout_bottomout7 SerializableAutomaticReference
---@field Blowjob_bottomout_bottomout8 SerializableAutomaticReference
---@field Blowjob_bottomout_bottomout9 SerializableAutomaticReference
---@field Blowjob_bottomout_bottomout10 SerializableAutomaticReference
---@field Blowjob_bottomout_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Blowjob_bottomout_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Blowjob_bottomout_All SerializableAutomaticReference[]
---@field Blowjob_lick_lick1 SerializableAutomaticReference
---@field Blowjob_lick_lick2 SerializableAutomaticReference
---@field Blowjob_lick_lick3 SerializableAutomaticReference
---@field Blowjob_lick_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Blowjob_lick_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Blowjob_lick_All SerializableAutomaticReference[]
---@field Blowjob_move_blowjobmove1 SerializableAutomaticReference
---@field Blowjob_move_blowjobmove2 SerializableAutomaticReference
---@field Blowjob_move_blowjobmove3 SerializableAutomaticReference
---@field Blowjob_move_blowjobmove4 SerializableAutomaticReference
---@field Blowjob_move_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Blowjob_move_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Blowjob_move_All SerializableAutomaticReference[]
---@field Blowjob_pullout_pullout1 SerializableAutomaticReference
---@field Blowjob_pullout_pullout2 SerializableAutomaticReference
---@field Blowjob_pullout_pullout3 SerializableAutomaticReference
---@field Blowjob_pullout_pullout4 SerializableAutomaticReference
---@field Blowjob_pullout_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Blowjob_pullout_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Blowjob_pullout_All SerializableAutomaticReference[]
---@field Blowjob_swallow_swallow1 SerializableAutomaticReference
---@field Blowjob_swallow_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Blowjob_swallow_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Blowjob_swallow_All SerializableAutomaticReference[]
---@field Casino_Card_Place SerializableAutomaticReference
---@field Casino_Card_Take SerializableAutomaticReference
---@field Casino_Slot_Click SerializableAutomaticReference
---@field Casino_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Casino_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Casino_All SerializableAutomaticReference[]
---@field CookingMinigame_clap SerializableAutomaticReference
---@field CookingMinigame_kick SerializableAutomaticReference
---@field CookingMinigame_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field CookingMinigame_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field CookingMinigame_All SerializableAutomaticReference[]
---@field FishingMinigame_Bite_Bite1 SerializableAutomaticReference
---@field FishingMinigame_Bite_Bite2 SerializableAutomaticReference
---@field FishingMinigame_Bite_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field FishingMinigame_Bite_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field FishingMinigame_Bite_All SerializableAutomaticReference[]
---@field FishingMinigame_FishFight_FishFight1 SerializableAutomaticReference
---@field FishingMinigame_FishFight_FishFight2 SerializableAutomaticReference
---@field FishingMinigame_FishFight_FishFight3 SerializableAutomaticReference
---@field FishingMinigame_FishFight_FishFight4 SerializableAutomaticReference
---@field FishingMinigame_FishFight_FishFight5 SerializableAutomaticReference
---@field FishingMinigame_FishFight_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field FishingMinigame_FishFight_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field FishingMinigame_FishFight_All SerializableAutomaticReference[]
---@field FishingMinigame_FishPullOut_Splash_21 SerializableAutomaticReference
---@field FishingMinigame_FishPullOut_Splash_22 SerializableAutomaticReference
---@field FishingMinigame_FishPullOut_Splash_23 SerializableAutomaticReference
---@field FishingMinigame_FishPullOut_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field FishingMinigame_FishPullOut_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field FishingMinigame_FishPullOut_All SerializableAutomaticReference[]
---@field FishingMinigame_FloatIn_FloatIn SerializableAutomaticReference
---@field FishingMinigame_FloatIn_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field FishingMinigame_FloatIn_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field FishingMinigame_FloatIn_All SerializableAutomaticReference[]
---@field FishingMinigame_Reel_ReelLoop SerializableAutomaticReference
---@field FishingMinigame_Reel_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field FishingMinigame_Reel_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field FishingMinigame_Reel_All SerializableAutomaticReference[]
---@field FishingMinigame_Throw_throw SerializableAutomaticReference
---@field FishingMinigame_Throw_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field FishingMinigame_Throw_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field FishingMinigame_Throw_All SerializableAutomaticReference[]
---@field Food_drink SerializableAutomaticReference
---@field Food_eat SerializableAutomaticReference
---@field Food_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Food_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Food_All SerializableAutomaticReference[]
---@field Frick_clothes_move_clothes_move_1 SerializableAutomaticReference
---@field Frick_clothes_move_clothes_move_2 SerializableAutomaticReference
---@field Frick_clothes_move_clothes_move_3 SerializableAutomaticReference
---@field Frick_clothes_move_clothes_move_4 SerializableAutomaticReference
---@field Frick_clothes_move_clothes_move_5 SerializableAutomaticReference
---@field Frick_clothes_move_clothes_move_6 SerializableAutomaticReference
---@field Frick_clothes_move_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Frick_clothes_move_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Frick_clothes_move_All SerializableAutomaticReference[]
---@field Frick_cum_cum1 SerializableAutomaticReference
---@field Frick_cum_cum2 SerializableAutomaticReference
---@field Frick_cum_cum3 SerializableAutomaticReference
---@field Frick_cum_cum4 SerializableAutomaticReference
---@field Frick_cum_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Frick_cum_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Frick_cum_All SerializableAutomaticReference[]
---@field Frick_insert_anal_insert_anal_1 SerializableAutomaticReference
---@field Frick_insert_anal_insert_anal_2 SerializableAutomaticReference
---@field Frick_insert_anal_insert_anal_3 SerializableAutomaticReference
---@field Frick_insert_anal_insert_anal_4 SerializableAutomaticReference
---@field Frick_insert_anal_insert_anal_5 SerializableAutomaticReference
---@field Frick_insert_anal_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Frick_insert_anal_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Frick_insert_anal_All SerializableAutomaticReference[]
---@field Frick_insert_vagina_insert_1 SerializableAutomaticReference
---@field Frick_insert_vagina_insert_2 SerializableAutomaticReference
---@field Frick_insert_vagina_insert_3 SerializableAutomaticReference
---@field Frick_insert_vagina_insert_4 SerializableAutomaticReference
---@field Frick_insert_vagina_insert_5 SerializableAutomaticReference
---@field Frick_insert_vagina_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Frick_insert_vagina_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Frick_insert_vagina_All SerializableAutomaticReference[]
---@field Frick_move_inside_move_1 SerializableAutomaticReference
---@field Frick_move_inside_move_2 SerializableAutomaticReference
---@field Frick_move_inside_move_3 SerializableAutomaticReference
---@field Frick_move_inside_move_4 SerializableAutomaticReference
---@field Frick_move_inside_move_5 SerializableAutomaticReference
---@field Frick_move_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Frick_move_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Frick_move_All SerializableAutomaticReference[]
---@field Frick_slam_slap1 SerializableAutomaticReference
---@field Frick_slam_slap2 SerializableAutomaticReference
---@field Frick_slam_slap3 SerializableAutomaticReference
---@field Frick_slam_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Frick_slam_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Frick_slam_All SerializableAutomaticReference[]
---@field Frick_unzip_unzip SerializableAutomaticReference
---@field Frick_unzip_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Frick_unzip_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Frick_unzip_All SerializableAutomaticReference[]
---@field Generic_Whoosh_Organic_Whoosh_1 SerializableAutomaticReference
---@field Generic_Whoosh_Organic_Whoosh_2 SerializableAutomaticReference
---@field Generic_Whoosh_Organic_Whoosh_3 SerializableAutomaticReference
---@field Generic_Whoosh_Organic_Whoosh_4 SerializableAutomaticReference
---@field Generic_Whoosh_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Generic_Whoosh_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Generic_Whoosh_All SerializableAutomaticReference[]
---@field Money_Coins_Handled_01 SerializableAutomaticReference
---@field Money_Coins_Handled_02 SerializableAutomaticReference
---@field Money_Coins_Handled_03 SerializableAutomaticReference
---@field Money_Coins_Shake_Hand SerializableAutomaticReference
---@field Money_Coins_Sift_Through_01 SerializableAutomaticReference
---@field Money_Coins_Sift_Through_02 SerializableAutomaticReference
---@field Money_Coins_Sift_Through_03 SerializableAutomaticReference
---@field Money_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Money_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Money_All SerializableAutomaticReference[]
---@field Outside_Open_shop SerializableAutomaticReference
---@field Outside_Shop_bell SerializableAutomaticReference
---@field Outside_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Outside_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Outside_All SerializableAutomaticReference[]
---@field PC_pc_continue SerializableAutomaticReference
---@field PC_pc_end_1 SerializableAutomaticReference
---@field PC_pc_start SerializableAutomaticReference
---@field PC_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field PC_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field PC_All SerializableAutomaticReference[]
---@field Room_Clock_tick SerializableAutomaticReference
---@field Room_Cloth SerializableAutomaticReference
---@field Room_door_close SerializableAutomaticReference
---@field Room_Door_knocking SerializableAutomaticReference
---@field Room_door_open SerializableAutomaticReference
---@field Room_Hangup SerializableAutomaticReference
---@field Room_Plug_in SerializableAutomaticReference
---@field Room_Ringtone SerializableAutomaticReference
---@field Room_switch1 SerializableAutomaticReference
---@field Room_switch2 SerializableAutomaticReference
---@field Room_Vibration SerializableAutomaticReference
---@field Room_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Room_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Room_All SerializableAutomaticReference[]
---@field Shower_Bubble_Bubbles_1 SerializableAutomaticReference
---@field Shower_Bubble_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Shower_Bubble_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Shower_Bubble_All SerializableAutomaticReference[]
---@field Shower_runShower SerializableAutomaticReference
---@field Shower_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Shower_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Shower_All SerializableAutomaticReference[]
---@field Spook_Spook1 SerializableAutomaticReference
---@field Spook_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Spook_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Spook_All SerializableAutomaticReference[]
---@field Story_cuffs SerializableAutomaticReference
---@field Story_Dumpster_hit SerializableAutomaticReference
---@field Story_Ear_ring SerializableAutomaticReference
---@field Story_Explosion SerializableAutomaticReference
---@field Story_Explosion2 SerializableAutomaticReference
---@field Story_falling_concrete SerializableAutomaticReference
---@field Story_Gunshot SerializableAutomaticReference
---@field Story_Melissafalls SerializableAutomaticReference
---@field Story_Opening_a_car_door SerializableAutomaticReference
---@field Story_pee SerializableAutomaticReference
---@field Story_Police SerializableAutomaticReference
---@field Story_pop SerializableAutomaticReference
---@field Story_slam SerializableAutomaticReference
---@field Story_snort SerializableAutomaticReference
---@field Story_Splat SerializableAutomaticReference
---@field Story_Steps SerializableAutomaticReference
---@field Story_stepsDAK SerializableAutomaticReference
---@field Story_tape_load SerializableAutomaticReference
---@field Story_tazer SerializableAutomaticReference
---@field Story_Trash_Open SerializableAutomaticReference
---@field Story_window_break SerializableAutomaticReference
---@field Story_RelativePathToFirst table<string, SerializableAutomaticReference>
---@field Story_RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field Story_All SerializableAutomaticReference[]
---@field All SerializableAutomaticReference[]
SoundContainer = {}

---@return SoundContainer
function SoundContainer.__new() end

---@class SoundDataGenerated: SingletonScriptableObject_SoundDataGenerated_
---@field name string
---@field hideFlags HideFlags
---@field Sound SoundContainer
SoundDataGenerated = {}

---@return SoundDataGenerated
function SoundDataGenerated.__new() end

---@overload fun(self: SoundDataGenerated)
function SoundDataGenerated.OnBeforeSerialize() end

---@overload fun(self: SoundDataGenerated)
function SoundDataGenerated.OnAfterDeserialize() end

---@overload fun(self: SoundDataGenerated)
function SoundDataGenerated.RegisterLua() end

---@class SoundSingleton: SingletonMonoBehaviour_SoundSingleton_
---@field MusicVolume number
---@field SfxVolume number
---@field MusicOff boolean
---@field IsPlayingMusic boolean
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
SoundSingleton = {}

---@return SoundSingleton
function SoundSingleton.__new() end

---@overload fun(self: SoundSingleton)
function SoundSingleton.UpdateMusicVolume() end

---@overload fun(self: SoundSingleton, pitch: number)
---@param pitch number
function SoundSingleton.SetMusicPitch(pitch) end

---@overload fun(self: SoundSingleton): string
---@return string
function SoundSingleton.CurrentMusicOptionsSummary() end

---@overload fun(self: SoundSingleton, value: fun(arg1: MusicWithInfo))
---@param value fun(arg1: MusicWithInfo)
function SoundSingleton.add_OnMusicChanged(value) end

---@overload fun(self: SoundSingleton, value: fun(arg1: MusicWithInfo))
---@param value fun(arg1: MusicWithInfo)
function SoundSingleton.remove_OnMusicChanged(value) end

---@overload fun(self: SoundSingleton, continueIfPossible: boolean)
---@overload fun(self: SoundSingleton)
---@param continueIfPossible? boolean
function SoundSingleton.PlayNextSong(continueIfPossible) end

---@overload fun(enumerable: MusicOption[])
---@overload fun(id: string, list: MusicWithInfo[], layer: MusicOptionLayer, condition: fun(): boolean)
---@overload fun(id: string, list: MusicWithInfo[], layer: MusicOptionLayer)
---@overload fun(id: string, list: IReference[], layer: MusicOptionLayer, condition: fun(): boolean)
---@overload fun(id: string, list: IReference[], layer: MusicOptionLayer)
---@overload fun(self: SoundSingleton, options: MusicOption[])
---@overload fun(self: SoundSingleton, enumerable: MusicOption[])
---@overload fun(self: SoundSingleton, id: string, list: MusicWithInfo[], layer: MusicOptionLayer, condition: fun(): boolean)
---@overload fun(self: SoundSingleton, id: string, list: MusicWithInfo[], layer: MusicOptionLayer)
---@overload fun(self: SoundSingleton, id: string, list: IReference[], layer: MusicOptionLayer, condition: fun(): boolean)
---@overload fun(self: SoundSingleton, id: string, list: IReference[], layer: MusicOptionLayer)
---@param options MusicOption[]
function SoundSingleton.RegisterMusicOptions(options) end

---@overload fun(self: SoundSingleton, option: MusicOption): boolean
---@param option MusicOption
---@return boolean
function SoundSingleton.IsPlaying(option) end

---@overload fun(id: string, stopIfPlaying: boolean)
---@overload fun(id: string)
---@overload fun(self: SoundSingleton, id: IMusicSource, stopIfPlaying: boolean)
---@overload fun(self: SoundSingleton, id: IMusicSource)
---@overload fun(self: SoundSingleton, id: string, stopIfPlaying: boolean)
---@overload fun(self: SoundSingleton, id: string)
---@param id IMusicSource
---@param stopIfPlaying? boolean
function SoundSingleton.UnregisterMusicOptionsById(id, stopIfPlaying) end

---@overload fun(self: SoundSingleton, musicOption: MusicOption, stopIfPlaying: boolean)
---@overload fun(self: SoundSingleton, musicOption: MusicOption)
---@param musicOption MusicOption
---@param stopIfPlaying? boolean
function SoundSingleton.UnregisterMusicOption(musicOption, stopIfPlaying) end

---@overload fun(self: SoundSingleton, stopIfPlaying: boolean)
---@overload fun(self: SoundSingleton)
---@param stopIfPlaying? boolean
function SoundSingleton.UnregisterAllMusic(stopIfPlaying) end

---@overload fun(self: SoundSingleton, clip: AudioClip)
---@param clip AudioClip
function SoundSingleton.PlaySlightlyRandomVolume(clip) end

---@overload fun(self: SoundSingleton, clip: AudioClip, volume: number, OnComplete: fun())
---@overload fun(self: SoundSingleton, clip: AudioClip, volume: number)
---@overload fun(self: SoundSingleton, clip: AudioClip)
---@param clip AudioClip
---@param volume? number
---@param OnComplete? fun()
function SoundSingleton.Play(clip, volume, OnComplete) end

---@overload fun(self: SoundSingleton, clip: AudioClip, volume: number, pitch: number, OnComplete: fun()): AudioSource
---@overload fun(self: SoundSingleton, clip: AudioClip, volume: number, pitch: number): AudioSource
---@overload fun(self: SoundSingleton, clip: AudioClip, volume: number): AudioSource
---@overload fun(self: SoundSingleton, clip: AudioClip): AudioSource
---@param clip AudioClip
---@param volume? number
---@param pitch? number
---@param OnComplete? fun()
---@return AudioSource
function SoundSingleton.PlayWithPitch(clip, volume, pitch, OnComplete) end

---@overload fun(self: SoundSingleton, volume: number)
---@param volume number
function SoundSingleton.PlayRandom(volume) end

---@overload fun(audioSource: AudioSource): AudioSourceUsage
---@overload fun(self: SoundSingleton): AudioSource
---@overload fun(self: SoundSingleton, audioSource: AudioSource): AudioSourceUsage
---@return AudioSource
function SoundSingleton.GetFreeAudioSource() end

---@overload fun(self: SoundSingleton, source: AudioSource)
---@param source AudioSource
function SoundSingleton.ReturnToPool(source) end

---@overload fun(self: SoundSingleton, startClip: AudioClip, loopClip: AudioClip, endClip: AudioClip, volume: number): SpecialAudioLoop
---@overload fun(self: SoundSingleton, startClip: AudioClip, loopClip: AudioClip, endClip: AudioClip): SpecialAudioLoop
---@param startClip AudioClip
---@param loopClip AudioClip
---@param endClip AudioClip
---@param volume? number
---@return SpecialAudioLoop
function SoundSingleton.CreateSpecialLoop(startClip, loopClip, endClip, volume) end

---@class TextDataGenerated: SingletonScriptableObject_TextDataGenerated_
---@field name string
---@field hideFlags HideFlags
---@field CreditsText CreditsTextContainer
---@field OtherText OtherTextContainer
TextDataGenerated = {}

---@return TextDataGenerated
function TextDataGenerated.__new() end

---@overload fun(self: TextDataGenerated)
function TextDataGenerated.OnBeforeSerialize() end

---@overload fun(self: TextDataGenerated)
function TextDataGenerated.OnAfterDeserialize() end

---@overload fun(self: TextDataGenerated)
function TextDataGenerated.RegisterLua() end

---@class TrailModule
---@field enabled boolean
---@field worldSpace boolean
TrailModule = {}

---@return TrailModule
function TrailModule.__new() end

---@class TsunTsunPersonalityModuleConversations: BasePersonalityModuleConversationContainer
---@field ContainerName string
---@field Frick_StartFrick SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockOutside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInsideAnal SerializedLocalizedConversation
---@field Frick_CumInside SerializedLocalizedConversation
---@field Frick_CumInsideAnal SerializedLocalizedConversation
---@field Frick_CumOutside SerializedLocalizedConversation
---@field Frick_CumTogether SerializedLocalizedConversation
---@field Frick_BotCumming SerializedLocalizedConversation
---@field Frick_Moan SerializedLocalizedConversation
---@field Frick_EdgingOn SerializedLocalizedConversation
---@field Frick_EdgingOff SerializedLocalizedConversation
---@field Frick_Headpat SerializedLocalizedConversation
---@field Frick_RapeBegStopSuccess SerializedLocalizedConversation
---@field Frick_RapeBegStopRefuse SerializedLocalizedConversation
---@field Frick_RapeFlacidReaction SerializedLocalizedConversation
---@field Frick_FingeringBotCumming SerializedLocalizedConversation
---@field Frick_FingeringDuring SerializedLocalizedConversation
---@field Frick_BoobFondle SerializedLocalizedConversation
---@field Frick_NipplePull SerializedLocalizedConversation
---@field Frick_PussySpread SerializedLocalizedConversation
---@field Frick_ClitRub SerializedLocalizedConversation
---@field Frick_Handholding SerializedLocalizedConversation
---@field Frick_UpsetOnlySheMoves SerializedLocalizedConversation
---@field Frick_CumThighjob SerializedLocalizedConversation
---@field Frick_FlacidBoredReaction SerializedLocalizedConversation
---@field Blowjob_EdgingAlmostCame SerializedLocalizedConversation
---@field Blowjob_EdgingHadToSlowdown SerializedLocalizedConversation
---@field Blowjob_EdgingForceStop SerializedLocalizedConversation
---@field Blowjob_SwallowFull SerializedLocalizedConversation
---@field Blowjob_SwallowHalf SerializedLocalizedConversation
---@field Blowjob_SwallowLittle SerializedLocalizedConversation
---@field Blowjob_SwallowAlmostEmpty SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotLead SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotRape SerializedLocalizedConversation
---@field Blowjob_SwallowWithMl SerializedLocalizedConversation
---@field Cowgirl_RemovePants SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsert SerializedLocalizedConversation
---@field Cowgirl_EdgingForceStopped SerializedLocalizedConversation
---@field Cowgirl_EdgingBreak SerializedLocalizedConversation
---@field Cowgirl_FlacidReaction SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestion SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestionDidntAnswer SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertRape SerializedLocalizedConversation
---@field Cowgirl_MadeMcCumInsideWhileCummingHerself SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobRape SerializedLocalizedConversation
---@field Cowgirl_AfterFirstInsertBotRape SerializedLocalizedConversation
TsunTsunPersonalityModuleConversations = {}

---@return TsunTsunPersonalityModuleConversations
function TsunTsunPersonalityModuleConversations.__new() end

---@class YanderePersonalityModuleConversations: BasePersonalityModuleConversationContainer
---@field ContainerName string
---@field Frick_StartFrick SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockOutside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInside SerializedLocalizedConversation
---@field Frick_GenericFuckBrainStateRandomDialogueCockInsideAnal SerializedLocalizedConversation
---@field Frick_CumInside SerializedLocalizedConversation
---@field Frick_CumInsideAnal SerializedLocalizedConversation
---@field Frick_CumOutside SerializedLocalizedConversation
---@field Frick_CumTogether SerializedLocalizedConversation
---@field Frick_BotCumming SerializedLocalizedConversation
---@field Frick_Moan SerializedLocalizedConversation
---@field Frick_EdgingOn SerializedLocalizedConversation
---@field Frick_EdgingOff SerializedLocalizedConversation
---@field Frick_Headpat SerializedLocalizedConversation
---@field Frick_RapeBegStopSuccess SerializedLocalizedConversation
---@field Frick_RapeBegStopRefuse SerializedLocalizedConversation
---@field Frick_RapeFlacidReaction SerializedLocalizedConversation
---@field Frick_FingeringBotCumming SerializedLocalizedConversation
---@field Frick_FingeringDuring SerializedLocalizedConversation
---@field Frick_BoobFondle SerializedLocalizedConversation
---@field Frick_NipplePull SerializedLocalizedConversation
---@field Frick_PussySpread SerializedLocalizedConversation
---@field Frick_ClitRub SerializedLocalizedConversation
---@field Frick_Handholding SerializedLocalizedConversation
---@field Frick_UpsetOnlySheMoves SerializedLocalizedConversation
---@field Frick_CumThighjob SerializedLocalizedConversation
---@field Frick_FlacidBoredReaction SerializedLocalizedConversation
---@field Blowjob_EdgingAlmostCame SerializedLocalizedConversation
---@field Blowjob_EdgingHadToSlowdown SerializedLocalizedConversation
---@field Blowjob_EdgingForceStop SerializedLocalizedConversation
---@field Blowjob_SwallowFull SerializedLocalizedConversation
---@field Blowjob_SwallowHalf SerializedLocalizedConversation
---@field Blowjob_SwallowLittle SerializedLocalizedConversation
---@field Blowjob_SwallowAlmostEmpty SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotLead SerializedLocalizedConversation
---@field Blowjob_SwitchToCowgirlBotRape SerializedLocalizedConversation
---@field Blowjob_SwallowWithMl SerializedLocalizedConversation
---@field Cowgirl_RemovePants SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsert SerializedLocalizedConversation
---@field Cowgirl_EdgingForceStopped SerializedLocalizedConversation
---@field Cowgirl_EdgingBreak SerializedLocalizedConversation
---@field Cowgirl_FlacidReaction SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestion SerializedLocalizedConversation
---@field Cowgirl_WhereToCumQuestionDidntAnswer SerializedLocalizedConversation
---@field Cowgirl_BeforeFirstInsertRape SerializedLocalizedConversation
---@field Cowgirl_MadeMcCumInsideWhileCummingHerself SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobBotLead SerializedLocalizedConversation
---@field Cowgirl_BeforeSwitchToBlowjobRape SerializedLocalizedConversation
---@field Cowgirl_AfterFirstInsertBotRape SerializedLocalizedConversation
YanderePersonalityModuleConversations = {}

---@return YanderePersonalityModuleConversations
function YanderePersonalityModuleConversations.__new() end

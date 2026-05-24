---@meta

-- MDRG MoonSharp Lua API definitions for LuaLS.
-- Generated from docs.txt and curated data/*.json.
-- These files describe exposed types and signatures only; comments avoid undocumented runtime behavior.

---@class GlobalFlag
---@field FirstSet DateTime
---@field LastSet DateTime
---@field TimesSet integer
GlobalFlag = {}

---@return GlobalFlag
function GlobalFlag.__new() end

---@overload fun(self: GlobalFlag)
function GlobalFlag.SetFlag() end

---StoryCondition backed by Lua source code compiled to a MoonSharp closure.
---@class LuaStoryCondition: StoryCondition
---True when the condition code has a generated MoonSharp closure.
---@field ValidClosure boolean
---@field ConditionCode string
LuaStoryCondition = {}

---@param conditionCode string
---@param negate boolean
---@return LuaStoryCondition
function LuaStoryCondition.__new(conditionCode, negate) end

---Low-level closure generation entrypoint for this Lua story condition.
---@overload fun(self: LuaStoryCondition)
function LuaStoryCondition.GenerateClosureUnsafe() end

---Generates the MoonSharp closure used by this Lua story condition.
---@overload fun(self: LuaStoryCondition)
function LuaStoryCondition.GenerateClosure() end

---Returns a human-readable explanation for this story condition.
---@overload fun(self: LuaStoryCondition): string
---@return string
function LuaStoryCondition.Explain() end

---Returns the Lua condition source represented by this story condition.
---@overload fun(self: LuaStoryCondition): string
---@return string
function LuaStoryCondition.GenerateCode() end

---@overload fun(obj: any): boolean
---@overload fun(self: LuaStoryCondition, other: LuaStoryCondition): boolean
---@overload fun(self: LuaStoryCondition, obj: any): boolean
---@param other LuaStoryCondition
---@return boolean
function LuaStoryCondition.Equals(other) end

---@overload fun(self: LuaStoryCondition): integer
---@return integer
function LuaStoryCondition.GetHashCode() end

---@class ManagedCoroutineWithTarget
---@field Running boolean
---@field NotRunning boolean
---@field InnerManagedCoroutine ManagedCoroutine
---@field Target MonoBehaviour
---@field Current any
ManagedCoroutineWithTarget = {}

---@return ManagedCoroutineWithTarget
function ManagedCoroutineWithTarget.__new() end

---@overload fun(self: ManagedCoroutineWithTarget, target: MonoBehaviour)
---@param target MonoBehaviour
function ManagedCoroutineWithTarget.SetTarget(target) end

---@overload fun(enumerator: IEnumerator, onFinished: fun(arg1: FinishedType))
---@overload fun(self: ManagedCoroutineWithTarget, enumerator: IEnumerator, onFinished: fun())
---@overload fun(self: ManagedCoroutineWithTarget, enumerator: IEnumerator, onFinished: fun(arg1: FinishedType))
---@param enumerator IEnumerator
---@param onFinished fun()
function ManagedCoroutineWithTarget.Start(enumerator, onFinished) end

---@overload fun(self: ManagedCoroutineWithTarget)
function ManagedCoroutineWithTarget.Stop() end

---@overload fun(self: ManagedCoroutineWithTarget): boolean
---@return boolean
function ManagedCoroutineWithTarget.MoveNext() end

---@overload fun(self: ManagedCoroutineWithTarget)
function ManagedCoroutineWithTarget.Reset() end

---@class SaveContainer
---@field VisitedWebsites string[]
---@field UnlockedAchievements string[]
---@field HasAnySaves boolean
SaveContainer = {}

---@return SaveContainer
function SaveContainer.__new() end

---@overload fun(self: SaveContainer)
function SaveContainer.MarkDirty() end

---@overload fun(self: SaveContainer)
function SaveContainer.ClearDirty() end

---@overload fun(self: SaveContainer): boolean
---@return boolean
function SaveContainer.IsDirty() end

---@overload fun(self: SaveContainer, address: string)
---@param address string
function SaveContainer.ReportWebsiteSeen(address) end

---@overload fun(self: SaveContainer)
function SaveContainer.ValidateVisitedWebsites() end

---@overload fun(self: SaveContainer, name: string)
---@param name string
function SaveContainer.UnlockAchievement(name) end

---@overload fun(self: SaveContainer, name: string)
---@param name string
function SaveContainer.RemoveAchievement(name) end

---@overload fun(self: SaveContainer, name: string): boolean
---@param name string
---@return boolean
function SaveContainer.HasAchievement(name) end

---Adiciona uma global flag ao save atual.
---@overload fun(self: SaveContainer, flagName: MdrgKnownGlobalFlagId|string)
---@param flagName MdrgKnownGlobalFlagId|string
function SaveContainer.AddGlobalFlag(flagName) end

---@overload fun(self: SaveContainer, flagName: MdrgKnownGlobalFlagId|string, globalFlag: GlobalFlag): boolean
---@param flagName MdrgKnownGlobalFlagId|string
---@param globalFlag GlobalFlag
---@return boolean
function SaveContainer.TryGetGlobalFlag(flagName, globalFlag) end

---Retorna se o save atual possui uma global flag.
---@overload fun(self: SaveContainer, flagName: MdrgKnownGlobalFlagId|string): boolean
---@param flagName MdrgKnownGlobalFlagId|string
---@return boolean
function SaveContainer.HasGlobalFlag(flagName) end

---@overload fun(self: SaveContainer): number
---@return number
function SaveContainer.GetPercentageOfSeenStoryText() end

---@overload fun(self: SaveContainer, id: integer): boolean
---@param id integer
---@return boolean
function SaveContainer.CheckIfUnseenStoryTextIdReport(id) end

---@overload fun(self: SaveContainer)
function SaveContainer.OnBeforeSerialize_StoryTextIds() end

---@overload fun(self: SaveContainer)
function SaveContainer.OnAfterDeserialize_StoryTextIds() end

---@overload fun(self: SaveContainer, slot: integer, newSave: SaveSlotData): boolean
---@param slot integer
---@param newSave SaveSlotData
---@return boolean
function SaveContainer.TrySaveFromCurrentGameState(slot, newSave) end

---@overload fun(self: SaveContainer): integer
---@return integer
function SaveContainer.DoAutosave() end

---@overload fun(self: SaveContainer, saveType: SaveType): SaveSlotData[]
---@param saveType SaveType
---@return SaveSlotData[]
function SaveContainer.GetSaveSlotReadonly(saveType) end

---@overload fun(self: SaveContainer, saveType: SaveType): SaveSlotData
---@param saveType SaveType
---@return SaveSlotData
function SaveContainer.GetLatestSlot(saveType) end

---@overload fun(self: SaveContainer, slot: integer, saveType: SaveType, saveSlotData: SaveSlotData): boolean
---@param slot integer
---@param saveType SaveType
---@param saveSlotData SaveSlotData
---@return boolean
function SaveContainer.TryGetSlot(slot, saveType, saveSlotData) end

---@overload fun(slot: integer, saveType: SaveType)
---@overload fun(self: SaveContainer, shownSaveData: SaveSlotData)
---@overload fun(self: SaveContainer, slot: integer, saveType: SaveType)
---@param shownSaveData SaveSlotData
function SaveContainer.DeleteSlot(shownSaveData) end

---@overload fun(self: SaveContainer, slot: integer, saveType: SaveType): boolean
---@param slot integer
---@param saveType SaveType
---@return boolean
function SaveContainer.SlotExists(slot, saveType) end

---@overload fun(self: SaveContainer, saveSlotData: SaveSlotData)
---@param saveSlotData SaveSlotData
function SaveContainer.OverrideSlot(saveSlotData) end

---@overload fun(self: SaveContainer)
function SaveContainer.PushSlotChangesToFiles() end

---@overload fun(self: SaveContainer)
function SaveContainer.BeginSaveToJson() end

---@overload fun(self: SaveContainer)
function SaveContainer.EndSaveToJson() end

---@overload fun(self: SaveContainer)
function SaveContainer.OnBeforeSerialize() end

---@overload fun(self: SaveContainer)
function SaveContainer.OnAfterDeserialize() end

---@overload fun(self: SaveContainer): boolean
---@return boolean
function SaveContainer.ValidateAfterLoadingFromString() end

---@class SaveSingleton: SingletonLoadableMonoBehaviour_SaveSingleton_
---@field Save SaveContainer
---@field HasAnySaves boolean
---@field IsLoaded boolean
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
---@field SavesPerFolder integer
---@field FolderCount integer
---@field MaxSaveSlotNumber integer
---@field AutoSaveCount integer
---@field MinimumTimeBetweenAutoSaves TimeSpan
SaveSingleton = {}

---@return SaveSingleton
function SaveSingleton.__new() end

---@overload fun(self: SaveSingleton): Type[]
---@return Type[]
function SaveSingleton.GetDependenciesArray() end

---@overload fun(self: SaveSingleton, saveString: string, save: SaveContainer): SaveContainerLoadResult
---@param saveString string
---@param save SaveContainer
---@return SaveContainerLoadResult
function SaveSingleton.TryLoadSaveContainerFromString(saveString, save) end

---@overload fun(self: SaveSingleton): string
---@return string
function SaveSingleton.GetSaveContainerAsString() end

---@overload fun(self: SaveSingleton)
function SaveSingleton.SaveAllChanges() end

---@overload fun(self: SaveSingleton)
function SaveSingleton.ResetAllData() end

---@overload fun(self: SaveSingleton, save: SaveContainer)
---@param save SaveContainer
function SaveSingleton.ReplaceSaveContainer(save) end

---@overload fun(self: SaveSingleton)
function SaveSingleton.TryMakeAutoSave() end

---@class SaveSlotData
---@field Notes string
---@field TimeUtc integer
---@field TimeDateTime DateTime
---@field Slot integer
---@field SlotOneIndexed integer
---@field SaveType SaveType
---@field HasData boolean
---@field SlotSaveEnding string
SaveSlotData = {}

---@param slotZeroIndexed integer
---@param gameVariables GameVariables
---@return SaveSlotData
function SaveSlotData.FromGameVariablesNow(slotZeroIndexed, gameVariables) end

---@overload fun(self: SaveSlotData, newNotes: string)
---@param newNotes string
function SaveSlotData.SetNotes(newNotes) end

---@overload fun(self: SaveSlotData): string
---@return string
function SaveSlotData.GetDescription() end

---@overload fun(self: SaveSlotData, saveType: SaveType)
---@param saveType SaveType
function SaveSlotData.EnsureSaveType(saveType) end

---@overload fun(self: SaveSlotData)
function SaveSlotData.BeginSaveToJson() end

---@overload fun(self: SaveSlotData)
function SaveSlotData.EndSaveToJson() end

---@overload fun(self: SaveSlotData)
function SaveSlotData.PushToFileIfNeeded() end

---@overload fun(self: SaveSlotData, saveDataString: string): Result
---@param saveDataString string
---@return Result
function SaveSlotData.TryGetSaveDataString(saveDataString) end

---@overload fun(self: SaveSlotData, gameVariables: GameVariables): Result
---@param gameVariables GameVariables
---@return Result
function SaveSlotData.TryGetAsGameVariables(gameVariables) end

---@overload fun(self: SaveSlotData, lpd: LoadProcedureData): Result
---@overload fun(self: SaveSlotData): Result
---@param lpd? LoadProcedureData
---@return Result
function SaveSlotData.TryLoad(lpd) end

---@class SimpleLocalizedString
---@field Reference TupleReference
---@field IsReferenceEmpty boolean
---@field Value string
---@field ReplacementValue string
SimpleLocalizedString = {}

---@overload fun(self: SimpleLocalizedString, arguments: any[]): string
---@overload fun(self: SimpleLocalizedString): string
---@param arguments? any[]
---@return string
function SimpleLocalizedString.GetValue(arguments) end

---@overload fun(self: SimpleLocalizedString, arguments: any[]): string
---@overload fun(self: SimpleLocalizedString): string
---@param arguments? any[]
---@return string
function SimpleLocalizedString.GetValueProjectLocale(arguments) end

---@overload fun(self: SimpleLocalizedString): string
---@return string
function SimpleLocalizedString.ToBakedArgument() end

---@overload fun(tableReference: string, tableEntryReference: string): SimpleLocalizedString
---@param id TupleReference
---@return SimpleLocalizedString
function SimpleLocalizedString.CreateInstance(id) end

---Cria um texto localizado simples a partir de uma string literal exibida ao jogador.
---@param replacement string
---@return SimpleLocalizedString
function SimpleLocalizedString.CreateInstanceReplacement(replacement) end

---@param b TupleReference
---@return SimpleLocalizedString
function SimpleLocalizedString.__toSimpleLocalizedString(b) end

---@overload fun(self: SimpleLocalizedString): string
---@return string
function SimpleLocalizedString.ToString() end

---@overload fun(self: SimpleLocalizedString): string
---@return string
function SimpleLocalizedString.ToLuaString() end

---@class StoryAutoBranch: StoryBranchGenericFlagBase
---@field RandomOdds number
---@field IsLinear boolean
---@field CanHappen boolean
---@field RelatedFlag string
---@field IsFlagBlocking boolean
---@field IsOneTime boolean
---@field IsFlagSet boolean
---@field WaitTillBlockFinished boolean
---@field BranchTarget StoryBranchTarget
---@field AdditionalConditions StoryCondition[]
---@field OnActivateAction fun()
StoryAutoBranch = {}

---@overload fun(branchTarget: StoryBranchTarget, waitTillFinished: boolean, relatedFlag: string, additionalConditions: StoryCondition[]): StoryAutoBranch
---@overload fun(branchTarget: StoryBranchTarget, waitTillFinished: boolean, relatedFlag: string, randomOdds: number, additionalConditions: StoryCondition[]): StoryAutoBranch
---@param branchTarget StoryBranchTarget
---@param relatedFlag string
---@param additionalConditions StoryCondition[]
---@return StoryAutoBranch
function StoryAutoBranch.__new(branchTarget, relatedFlag, additionalConditions) end

---@class StoryBlockTarget: StoryBranchTarget
---@field TargetBlockName string
---@field TargetLabel string
---@field NoTargetLabel boolean
StoryBlockTarget = {}

---@overload fun(targetBlockName: string, targetLabel: string): StoryBlockTarget
---@param targetBlock FungusBlockReference
---@return StoryBlockTarget
function StoryBlockTarget.__new(targetBlock) end

---@overload fun(self: StoryBlockTarget, onFinished: fun())
---@param onFinished fun()
function StoryBlockTarget.Activate(onFinished) end

---@overload fun(self: StoryBlockTarget, blocks: table<string, Block>): Result
---@param blocks table<string, Block>
---@return Result
function StoryBlockTarget.CheckValidity(blocks) end

---@overload fun(self: StoryBlockTarget): string
---@return string
function StoryBlockTarget.ToString() end

---@overload fun(self: StoryBlockTarget, flowchart: Flowchart): Block
---@param flowchart Flowchart
---@return Block
function StoryBlockTarget.GetTargetBlock(flowchart) end

---@param sourceBlock Block
---@param targetBlock Block
---@param endBlocks HashSet
---@param maxSteps? integer
---@return Route[]
function StoryBlockTarget.AnalyseRoutes(sourceBlock, targetBlock, endBlocks, maxSteps) end

---Ramo de dialogo do bot usado por personality modules e containers de fala.
---@class StoryBotDialogueBranch: StoryBranchGenericBase
---@field SourceContainer StoryBotDialogueBranchContainer
---@field SourceTag StoryBotDialogueTag
---@field SourceStage StoryBotDialogueStage
---@field Priority integer
---@field Odds number
---@field IsOneTime boolean
---@field BranchType StoryBotDialogueBranchType
---@field AllowedScenes SceneEnumFlag
---@field Title string
---@field BranchTarget StoryBranchTarget
---@field AdditionalConditions StoryCondition[]
---@field OnActivateAction fun()
---@field CanHappen boolean
---@field MaxOdds number
---@field Id GameId
---@field TitleSls SimpleLocalizedString
StoryBotDialogueBranch = {}

---Cria uma branch de dialogo; scripts gerados usam o overload com texto, Guid do mod e indice local.
---@overload fun(text: string, guid: Guid, index: integer, waitForInput: boolean): StoryBotDialogueBranch
---@param id GameId
---@param branchTarget StoryBranchTarget
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.__new(id, branchTarget) end

---@overload fun(self: StoryBotDialogueBranch, sourceContainer: StoryBotDialogueBranchContainer)
---@param sourceContainer StoryBotDialogueBranchContainer
function StoryBotDialogueBranch.InitSource(sourceContainer) end

---@overload fun(self: StoryBotDialogueBranch, action: fun()): StoryBotDialogueBranch
---@param action fun()
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.SetOnActivateAction(action) end

---@overload fun(self: StoryBotDialogueBranch, odds: number): StoryBotDialogueBranch
---@param odds number
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.SetOdds(odds) end

---@overload fun(self: StoryBotDialogueBranch): StoryBotDialogueBranch
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.SetMaxOdds() end

---@overload fun(self: StoryBotDialogueBranch): StoryBotDialogueBranch
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.MarkOneTime() end

---@overload fun(self: StoryBotDialogueBranch, i: integer): StoryBotDialogueBranch
---@param i integer
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.SetPriority(i) end

---@overload fun(self: StoryBotDialogueBranch, addedAdditionalConditions: StoryCondition[]): StoryBotDialogueBranch
---@param addedAdditionalConditions StoryCondition[]
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.AddConditionsAtFront(addedAdditionalConditions) end

---@overload fun(self: StoryBotDialogueBranch, addedAdditionalConditions: StoryCondition[]): StoryBotDialogueBranch
---@param addedAdditionalConditions StoryCondition[]
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.AddConditions(addedAdditionalConditions) end

---@overload fun(self: StoryBotDialogueBranch, allowedScenes: SceneEnumFlag): StoryBotDialogueBranch
---@param allowedScenes SceneEnumFlag
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.SetAllowedScenes(allowedScenes) end

---@overload fun(self: StoryBotDialogueBranch, offset: integer): boolean
---@param offset integer
---@return boolean
function StoryBotDialogueBranch.CheckAdditionalConditionsOffset(offset) end

---@overload fun(self: StoryBotDialogueBranch): StoryBranchTarget
---@return StoryBranchTarget
function StoryBotDialogueBranch.ActivateGetTarget() end

---Container de ramos de dialogo associados a um identificador de fala/evento.
---@class StoryBotDialogueBranchContainer
---@field SourceTag StoryBotDialogueTag
---@field Conditions StoryCondition[]
---@field BranchCount integer
---@field AllBranches StoryBotDialogueBranch[]
---@field StoryBotContainerType StoryBotContainerTypeEnum
StoryBotDialogueBranchContainer = {}

---@param sourceTag StoryBotDialogueTag
---@param storyBotContainerType StoryBotContainerTypeEnum
---@return StoryBotDialogueBranchContainer
function StoryBotDialogueBranchContainer.__new(sourceTag, storyBotContainerType) end

---@overload fun(self: StoryBotDialogueBranchContainer, newConditions: StoryCondition[])
---@param newConditions StoryCondition[]
function StoryBotDialogueBranchContainer.SetConditions(newConditions) end

---@overload fun(self: StoryBotDialogueBranchContainer): boolean
---@return boolean
function StoryBotDialogueBranchContainer.ConditionsMet() end

---@overload fun(self: StoryBotDialogueBranchContainer, branches: StoryBotDialogueBranch[])
---@param branches StoryBotDialogueBranch[]
function StoryBotDialogueBranchContainer.AddBranches(branches) end

---@overload fun(self: StoryBotDialogueBranchContainer, keyPrefix: string)
---@param keyPrefix string
function StoryBotDialogueBranchContainer.InitVanilla(keyPrefix) end

---Adiciona uma branch de dialogo ao container e retorna o container para encadeamento.
---@overload fun(self: StoryBotDialogueBranchContainer, branch: StoryBotDialogueBranch): StoryBotDialogueBranchContainer
---@param branch StoryBotDialogueBranch
---@return StoryBotDialogueBranchContainer
function StoryBotDialogueBranchContainer.AddBranch(branch) end

---@overload fun(self: StoryBotDialogueBranchContainer, branches: StoryBotDialogueBranch[])
---@param branches StoryBotDialogueBranch[]
function StoryBotDialogueBranchContainer.AddMultipleBranchesWithoutConditions(branches) end

---@overload fun(self: StoryBotDialogueBranchContainer, condition: StoryCondition, branches: StoryBotDialogueBranch[])
---@param condition StoryCondition
---@param branches StoryBotDialogueBranch[]
function StoryBotDialogueBranchContainer.AddMultipleBranchesWithSameCondition(condition, branches) end

---@overload fun(self: StoryBotDialogueBranchContainer): boolean
---@return boolean
function StoryBotDialogueBranchContainer.IsLastFinished() end

---@overload fun(self: StoryBotDialogueBranchContainer, id: GameId, branch: StoryBotDialogueBranch): boolean
---@param id GameId
---@param branch StoryBotDialogueBranch
---@return boolean
function StoryBotDialogueBranchContainer.TryGetBranchById(id, branch) end

---@overload fun(self: StoryBotDialogueBranchContainer): DialogueChainMemory
---@return DialogueChainMemory
function StoryBotDialogueBranchContainer.GetMemory() end

---@overload fun(self: StoryBotDialogueBranchContainer, branch: StoryBotDialogueBranch, sceneEnumFlag: SceneEnumFlag, allowedTypes: StoryBotDialogueBranchType): boolean
---@overload fun(self: StoryBotDialogueBranchContainer, branch: StoryBotDialogueBranch, sceneEnumFlag: SceneEnumFlag): boolean
---@param branch StoryBotDialogueBranch
---@param sceneEnumFlag SceneEnumFlag
---@param allowedTypes? StoryBotDialogueBranchType
---@return boolean
function StoryBotDialogueBranchContainer.TryGetFirst(branch, sceneEnumFlag, allowedTypes) end

---@overload fun(self: StoryBotDialogueBranchContainer, sceneEnumFlag: SceneEnumFlag, allowedTypes: StoryBotDialogueBranchType): StoryBotDialogueBranch[]
---@overload fun(self: StoryBotDialogueBranchContainer, sceneEnumFlag: SceneEnumFlag): StoryBotDialogueBranch[]
---@param sceneEnumFlag SceneEnumFlag
---@param allowedTypes? StoryBotDialogueBranchType
---@return StoryBotDialogueBranch[]
function StoryBotDialogueBranchContainer.GetAllBranchesCheckConditionsAndIgnored(sceneEnumFlag, allowedTypes) end

---@class StoryBranchTarget
StoryBranchTarget = {}

---@overload fun(self: StoryBranchTarget, onFinished: fun())
---@param onFinished fun()
function StoryBranchTarget.Activate(onFinished) end

---@overload fun(self: StoryBranchTarget, blocks: table<string, Block>): Result
---@param blocks table<string, Block>
---@return Result
function StoryBranchTarget.CheckValidity(blocks) end

---@overload fun(b: TupleReference): StoryBranchTarget
---@overload fun(b: SerializedLocalizedConversation): StoryBranchTarget
---@overload fun(b: fun(): IEnumerator): StoryBranchTarget
---@param b FungusBlockReference
---@return StoryBranchTarget
function StoryBranchTarget.__toStoryBranchTarget(b) end

---Base de condicoes usadas pelo sistema de historia/eventos para verificar requisitos e combinar regras.
---@class StoryCondition
---@field AlwaysTrueCondition ConstCondition
---@field AlwaysFalseCondition ConstCondition
---@field CommonConditions CommonConditionsContainer
StoryCondition = {}

---@overload fun(self: StoryCondition): boolean
---@return boolean
function StoryCondition.ConditionMet() end

---@overload fun(self: StoryCondition): string
---@return string
function StoryCondition.Explain() end

---@overload fun(self: StoryCondition): string
---@return string
function StoryCondition.GenerateCode() end

---@param flag string
---@param negate? boolean
---@return FlagConditionBasic
function StoryCondition.FlagSet(flag, negate) end

---@param flag string
---@return FlagConditionBasic
function StoryCondition.FlagNotSet(flag) end

---@param flag string
---@param time integer
---@param negate? boolean
---@return FlagConditionWithTime
function StoryCondition.FlagSetBeforeRelative(flag, time, negate) end

---@param flag string
---@param time integer
---@param negate? boolean
---@return FlagConditionWithTime
function StoryCondition.FlagSetAfterRelative(flag, time, negate) end

---@param flag string
---@param timePeriod integer
---@param timeCheck TimeCheckType
---@param negate? boolean
---@return FlagConditionWithTime
function StoryCondition.FlagSetWithTime(flag, timePeriod, timeCheck, negate) end

---@param flag string
---@param checkType CheckType
---@param timePeriod integer
---@param timeCheck TimeCheckType
---@param negate? boolean
---@return FlagConditionSpecialWithTime
function StoryCondition.FlagSetSpecialWithTime(flag, checkType, timePeriod, timeCheck, negate) end

---Creates a StoryCondition from Lua condition code. The code is compiled to a MoonSharp closure by LuaStoryCondition.
---@param conditionCode string
---@param negate? boolean
---@return LuaStoryCondition
function StoryCondition.Lua(conditionCode, negate) end

---Cria uma condicao de historia avaliada por callback booleano.
---@param condition fun(): boolean
---@param negate? boolean
---@return DelegateCondition
function StoryCondition.Delegate(condition, negate) end

---@param name string
---@return DataCondition
function StoryCondition.VariableConditionBoolTrue(name) end

---@param name string
---@return DataCondition
function StoryCondition.VariableConditionBoolFalse(name) end

---@param value integer
---@return DataCondition
function StoryCondition.MoneyAbove(value) end

---@param value integer
---@return DataCondition
function StoryCondition.MoneyBelow(value) end

---@param t1 integer
---@param t2 integer
---@return DataCondition
function StoryCondition.HourBetweenEqual(t1, t2) end

---@param time integer
---@return DataCondition
function StoryCondition.TimeAfter(time) end

---@param t1 integer
---@return DataCondition
function StoryCondition.DayAbove(t1) end

---@param t1 integer
---@return DataCondition
function StoryCondition.DayBelow(t1) end

---@param itemId GameId
---@param negate? boolean
---@return ItemCondition
function StoryCondition.HasItem(itemId, negate) end

---@param itemId GameId
---@param negate? boolean
---@return ItemCondition
function StoryCondition.HasItemEquipped(itemId, negate) end

---@param slot string
---@param negate? boolean
---@return ItemInSlotCondition
function StoryCondition.ItemInSlotCondition(slot, negate) end

---@param name string
---@param negate? boolean
---@return StoryMenuEntryPointOptionsExistCondition
function StoryCondition.StoryMenuEntryPointAnyExistCondition(name, negate) end

---@param name string
---@param negate? boolean
---@return StoryMenuEntryPointOptionsExistCondition
function StoryCondition.StoryMenuEntryPointConditionalExistCondition(name, negate) end

---@param memory InteractionMemoryEnum
---@param time number
---@param negate? boolean
---@return InteractionMemoryCondition
function StoryCondition.CreateInteractionMemoryActiveForCondition(memory, time, negate) end

---@param memory InteractionMemoryEnum
---@param time? number
---@param negate? boolean
---@return InteractionMemoryCondition
function StoryCondition.CreateInteractionMemoryRecentCondition(memory, time, negate) end

---@overload fun(fish: ItemEnum, count: integer, negate: boolean): FishCaughtCondition
---@overload fun(fish: ItemEnum, count: integer): FishCaughtCondition
---@param count integer
---@param negate? boolean
---@return TotalFishesCaughtCondition
function StoryCondition.FishesCaught(count, negate) end

---@param fish ItemEnum
---@param p1 number
---@param negate? boolean
---@return FishSizeCondition
function StoryCondition.CaughtFishAtLeastPercentile(fish, p1, negate) end

---@param fish ItemEnum
---@return StoryCondition
function StoryCondition.CaughtFishBig(fish) end

---Combina condicoes e exige que pelo menos uma seja verdadeira.
---@param conditions StoryCondition[]
---@return OrCondition
function StoryCondition.Or(conditions) end

---Combina condicoes com negacao do resultado de Or.
---@param conditions StoryCondition[]
---@return OrCondition
function StoryCondition.NotOr(conditions) end

---Combina condicoes e exige que todas sejam verdadeiras.
---@param conditions StoryCondition[]
---@return AndCondition
function StoryCondition.And(conditions) end

---Combina condicoes com negacao do resultado de And.
---@param conditions StoryCondition[]
---@return AndCondition
function StoryCondition.NotAnd(conditions) end

---@param seed integer
---@param odds number
---@return StoryCondition
function StoryCondition.HourRandom(seed, odds) end

---@param seed integer
---@param odds number
---@return StoryCondition
function StoryCondition.DayRandom(seed, odds) end

---@overload fun(self: StoryCondition, obj: any): boolean
---@param obj any
---@return boolean
function StoryCondition.Equals(obj) end

---@overload fun(self: StoryCondition): integer
---@return integer
function StoryCondition.GetHashCode() end

---@class StoryEmoteExpressionSlot
---@field Expression_Slot string
---@field Clear_Expression string
---@field VerySad_Expression string
---@field Sad_Expression string
---@field NoSad_Expression string
---@field NoHappy_Expression string
---@field Happy_Expression string
---@field VeryHappy_Expression string
---@field NoBlush_Expression string
---@field Blush_Expression string
---@field VeryBlush_Expression string
---@field NoShock_Expression string
---@field Shock_Expression string
---@field VeryShock_Expression string
---@field NoAngry_Expression string
---@field Angry_Expression string
---@field VeryAngry_Expression string
StoryEmoteExpressionSlot = {}

---@param controller Live2DController
---@return StoryEmoteExpressionSlot
function StoryEmoteExpressionSlot.__new(controller) end

---@overload fun(self: StoryEmoteExpressionSlot, emoteData: EmoteData): Result
---@param emoteData EmoteData
---@return Result
function StoryEmoteExpressionSlot.IsValidEmote(emoteData) end

---@overload fun(self: StoryEmoteExpressionSlot): string[]
---@return string[]
function StoryEmoteExpressionSlot.GetValidNames() end

---@overload fun(self: StoryEmoteExpressionSlot, slotName: string): boolean
---@param slotName string
---@return boolean
function StoryEmoteExpressionSlot.IsTargetSlot(slotName) end

---@overload fun(self: StoryEmoteExpressionSlot): string[]
---@return string[]
function StoryEmoteExpressionSlot.GetItemId() end

---@overload fun(self: StoryEmoteExpressionSlot)
function StoryEmoteExpressionSlot.SetDefault() end

---@overload fun(self: StoryEmoteExpressionSlot, emote: EmoteData)
---@param emote EmoteData
function StoryEmoteExpressionSlot.SetItem(emote) end

---@class StoryEmoteManager
---@field AllItems table[]
StoryEmoteManager = {}

---@return StoryEmoteManager
function StoryEmoteManager.__new() end

---@overload fun(self: StoryEmoteManager, slot: IStoryEmoteSlot)
---@param slot IStoryEmoteSlot
function StoryEmoteManager.AddSlot(slot) end

---@overload fun(self: StoryEmoteManager)
function StoryEmoteManager.SetDefaultEmote() end

---@overload fun(self: StoryEmoteManager, emoteData: EmoteData)
---@param emoteData EmoteData
function StoryEmoteManager.SetEmote(emoteData) end

---@overload fun(self: StoryEmoteManager, emoteData: EmoteData): Result
---@param emoteData EmoteData
---@return Result
function StoryEmoteManager.IsValidEmote(emoteData) end

---@overload fun(self: StoryEmoteManager, characterName: string): string
---@param characterName string
---@return string
function StoryEmoteManager.GenerateSummary(characterName) end

---@class StoryEnumeratorTarget: StoryBranchTarget
StoryEnumeratorTarget = {}

---@param enumeratorGenerator fun(): IEnumerator
---@return StoryEnumeratorTarget
function StoryEnumeratorTarget.__new(enumeratorGenerator) end

---@overload fun(self: StoryEnumeratorTarget, onFinished: fun())
---@param onFinished fun()
function StoryEnumeratorTarget.Activate(onFinished) end

---@overload fun(self: StoryEnumeratorTarget): string
---@return string
function StoryEnumeratorTarget.ToString() end

---@overload fun(self: StoryEnumeratorTarget, blocks: table<string, Block>): Result
---@param blocks table<string, Block>
---@return Result
function StoryEnumeratorTarget.CheckValidity(blocks) end

---@class StoryInteractionArmsSlot
---@field AreaArmL string
---@field AreaArmR string
---@field AreaArmBoth string
StoryInteractionArmsSlot = {}

---@param controller Live2DInteractionController
---@return StoryInteractionArmsSlot
function StoryInteractionArmsSlot.__new(controller) end

---@overload fun(self: StoryInteractionArmsSlot, slotName: string): boolean
---@param slotName string
---@return boolean
function StoryInteractionArmsSlot.IsTargetSlot(slotName) end

---@overload fun(self: StoryInteractionArmsSlot): string[]
---@return string[]
function StoryInteractionArmsSlot.GetItemId() end

---@overload fun(self: StoryInteractionArmsSlot): string[]
---@return string[]
function StoryInteractionArmsSlot.GetValidNames() end

---@overload fun(self: StoryInteractionArmsSlot, emoteData: EmoteData): Result
---@param emoteData EmoteData
---@return Result
function StoryInteractionArmsSlot.IsValidEmote(emoteData) end

---@overload fun(self: StoryInteractionArmsSlot)
function StoryInteractionArmsSlot.SetDefault() end

---@overload fun(self: StoryInteractionArmsSlot, emote: EmoteData)
---@param emote EmoteData
function StoryInteractionArmsSlot.SetItem(emote) end

---@class StoryLocalizedConversationBranchTarget: StoryBranchTarget
---@field Conversation LocalizedConversation
---@field WaitForInput boolean
StoryLocalizedConversationBranchTarget = {}

---@overload fun(text: string, modGuid: Guid, id: integer, waitForInput: boolean): StoryLocalizedConversationBranchTarget
---@param conversation LocalizedConversation
---@param waitForInput boolean
---@return StoryLocalizedConversationBranchTarget
function StoryLocalizedConversationBranchTarget.__new(conversation, waitForInput) end

---@overload fun(modelBrainState: ModelBrainState, noWrapper: boolean)
---@overload fun(self: StoryLocalizedConversationBranchTarget, onFinished: fun())
---@overload fun(self: StoryLocalizedConversationBranchTarget, modelBrainState: ModelBrainState, noWrapper: boolean)
---@param onFinished fun()
function StoryLocalizedConversationBranchTarget.Activate(onFinished) end

---@overload fun(self: StoryLocalizedConversationBranchTarget, blocks: table<string, Block>): Result
---@param blocks table<string, Block>
---@return Result
function StoryLocalizedConversationBranchTarget.CheckValidity(blocks) end

---@overload fun(self: StoryLocalizedConversationBranchTarget): StoryBotDialogueBranchType
---@return StoryBotDialogueBranchType
function StoryLocalizedConversationBranchTarget.GetBranchType() end

---@overload fun(self: StoryLocalizedConversationBranchTarget): string
---@return string
function StoryLocalizedConversationBranchTarget.ToString() end

---@class StoryMenuBranch: StoryBranchGenericFlagBase
---@field MenuText LocalizedStringReference
---@field ShowerGrayedOutWhenUnavailable boolean
---@field CanHappen boolean
---@field RelatedFlag string
---@field IsFlagBlocking boolean
---@field IsOneTime boolean
---@field IsFlagSet boolean
---@field WaitTillBlockFinished boolean
---@field BranchTarget StoryBranchTarget
---@field AdditionalConditions StoryCondition[]
---@field OnActivateAction fun()
StoryMenuBranch = {}

---@param menuText LocalizedStringReference
---@param branchTarget StoryBranchTarget
---@param relatedFlag string
---@param additionalConditions StoryCondition[]
---@return StoryMenuBranch
function StoryMenuBranch.__new(menuText, branchTarget, relatedFlag, additionalConditions) end

---@overload fun(self: StoryMenuBranch, sb: StringBuilder, blocks: table<string, Block>, richText: boolean, runTime: boolean): StringBuilder
---@overload fun(self: StoryMenuBranch, sb: StringBuilder, blocks: table<string, Block>, richText: boolean): StringBuilder
---@overload fun(self: StoryMenuBranch, sb: StringBuilder, blocks: table<string, Block>): StringBuilder
---@param sb StringBuilder
---@param blocks table<string, Block>
---@param richText? boolean
---@param runTime? boolean
---@return StringBuilder
function StoryMenuBranch.EditorSummary(sb, blocks, richText, runTime) end

---@class StoryMenuBranchesStrings: LocalizedStringReferenceContainer
---@field ContainerName string
---@field StartSexStream LocalizedStringReferenceStory
---@field StartSexNoStream LocalizedStringReferenceStory
---@field SleepWithBot LocalizedStringReferenceStory
---@field SleepAloneTillRested LocalizedStringReferenceStory
---@field SleepAloneFor480 LocalizedStringReferenceStory
---@field SleepAloneFor240 LocalizedStringReferenceStory
---@field SleepAloneFor60 LocalizedStringReferenceStory
---@field SleepAloneDontSleep LocalizedStringReferenceStory
---@field CumChoice_CleanItOffWithARag LocalizedStringReferenceStory
---@field CumChoice_LeaveItOnHer LocalizedStringReferenceStory
---@field Bathroom_BotShowerAlone LocalizedStringReferenceStory
---@field Bathroom_AnonShowerAlone LocalizedStringReferenceStory
---@field Bathroom_ShowerTogether LocalizedStringReferenceStory
---@field OutsideAloneGrocery LocalizedStringReferenceStory
---@field OutsideAloneDispenser LocalizedStringReferenceStory
---@field OutsideAlonePharmacy LocalizedStringReferenceStory
---@field OutsideAloneClothier LocalizedStringReferenceStory
---@field OutsideAloneLabourOffice LocalizedStringReferenceStory
---@field OutsideAloneWalk LocalizedStringReferenceStory
---@field OutsideAloneGoFishing LocalizedStringReferenceStory
---@field OutsideAloneVisitFisher LocalizedStringReferenceStory
---@field GoToChurch LocalizedStringReferenceStory
---@field GoToChurchToInvestigate LocalizedStringReferenceStory
---@field GoToPoliceStationReportNun LocalizedStringReferenceStory
---@field OutsideAloneGoToRichArea LocalizedStringReferenceStory
---@field GoToAShopForRichPeople LocalizedStringReferenceStory
---@field VisitBDH LocalizedStringReferenceStory
---@field OutsideAloneReturnToSlums LocalizedStringReferenceStory
---@field GoBackHome LocalizedStringReferenceStory
---@field DEBUG LocalizedStringReferenceStory
---@field Nevermind LocalizedStringReferenceStory
---@field OutsideWithBotArtGalleryDate1 LocalizedStringReferenceStory
---@field OutsideWithBotArtGalleryDate2 LocalizedStringReferenceStory
---@field OutsideWithBotRestaurantDate1 LocalizedStringReferenceStory
---@field OutsideWithBotRestaurantDate2 LocalizedStringReferenceStory
---@field OutsideWithBotKino1 LocalizedStringReferenceStory
---@field OutsideWithBotKino2 LocalizedStringReferenceStory
---@field OutsideWithBotKaraoke1 LocalizedStringReferenceStory
---@field OutsideWithBotIceSkating1 LocalizedStringReferenceStory
---@field OutsideWithBotPlanetarium LocalizedStringReferenceStory
---@field OutsideWithBotAmusementPark2 LocalizedStringReferenceStory
---@field OutsideWithBotIceSkatingWithShanice LocalizedStringReferenceStory
---@field OutsideWithBotCafeWithAnnalie LocalizedStringReferenceStory
---@field OutsideWithBotBowlingWithMelissa LocalizedStringReferenceStory
---@field OutsideWithBotBowlingWithMelissaAndAnnalie_Melissa9 LocalizedStringReferenceStory
---@field OutsideWithBotBowlingWithMelissaAndAnnalie_Melissa11 LocalizedStringReferenceStory
---@field OutsideWithBotKaraokeWithMelissaAndAnnalie_Melissa12 LocalizedStringReferenceStory
---@field OutsideWithBotCafeWithMelissaAndAnnalie_Melissa16 LocalizedStringReferenceStory
---@field OutsideWithBotGokartsWithMelissaAndAnnalie_Melissa17 LocalizedStringReferenceStory
---@field OutsideWithBotBowlingWithMelissaAndAnnalie_Melissa19 LocalizedStringReferenceStory
---@field OutsideWithBotCafeWithMelissaAndAnnalie_Melissa21 LocalizedStringReferenceStory
---@field OutsideWithBotKaraokeWithMelissa_Melissa21_5 LocalizedStringReferenceStory
---@field OutsideWithBotMeetupWithGrumpyAnnalie LocalizedStringReferenceStory
---@field OutsideWithBotCheckOutTheRunway LocalizedStringReferenceStory
---@field OutsideWithBotMeetAtCafeWithAnnalieAndHerFriends LocalizedStringReferenceStory
---@field OutsideWithBotGoToAnnaliesFashionShow LocalizedStringReferenceStory
---@field OutsideWithBotGoOnADate LocalizedStringReferenceStory
---@field OutsideWithBotHangOutWithFriends LocalizedStringReferenceStory
---@field OutsideWithBotTrickOrTreat LocalizedStringReferenceStory
---@field OutsideWithBotClothierWithBot LocalizedStringReferenceStory
---@field OutsideWithBotWalk LocalizedStringReferenceStory
---@field OutsideWithBotInvestigateLab LocalizedStringReferenceStory
---@field OutsideWithBotGoBackHome LocalizedStringReferenceStory
StoryMenuBranchesStrings = {}

---@return StoryMenuBranchesStrings
function StoryMenuBranchesStrings.__new() end

---@class StoryMenuEntryPointOptionsExistCondition: StoryCondition
---@field Conditional boolean
---@field EntryPointName string
StoryMenuEntryPointOptionsExistCondition = {}

---@param entryPointName string
---@param conditional boolean
---@param negate boolean
---@return StoryMenuEntryPointOptionsExistCondition
function StoryMenuEntryPointOptionsExistCondition.__new(entryPointName, conditional, negate) end

---@overload fun(self: StoryMenuEntryPointOptionsExistCondition): string
---@return string
function StoryMenuEntryPointOptionsExistCondition.Explain() end

---@overload fun(self: StoryMenuEntryPointOptionsExistCondition): string
---@return string
function StoryMenuEntryPointOptionsExistCondition.GenerateCode() end

---@overload fun(obj: any): boolean
---@overload fun(self: StoryMenuEntryPointOptionsExistCondition, other: StoryMenuEntryPointOptionsExistCondition): boolean
---@overload fun(self: StoryMenuEntryPointOptionsExistCondition, obj: any): boolean
---@param other StoryMenuEntryPointOptionsExistCondition
---@return boolean
function StoryMenuEntryPointOptionsExistCondition.Equals(other) end

---@overload fun(self: StoryMenuEntryPointOptionsExistCondition): integer
---@return integer
function StoryMenuEntryPointOptionsExistCondition.GetHashCode() end

---@class StorySingleton: SingletonMonoBehaviour_StorySingleton_
---@field Stage1 StoryBotDialogueStage
---@field Stage2 StoryBotDialogueStage
---@field Stage3 StoryBotDialogueStage
---@field AllStages StoryBotDialogueStage[]
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
---@field UsualAreas Type[]
StorySingleton = {}

---@return StorySingleton
function StorySingleton.__new() end

---@overload fun(self: StorySingleton): AllDefinedPersonalities
---@return AllDefinedPersonalities
function StorySingleton.GetAllDefinedPersonalities() end

---@overload fun(self: StorySingleton): string
---@return string
function StorySingleton.GenerateCommonPersonalityModuleConversations() end

---@overload fun(self: StorySingleton, stageNr: integer): StoryBotDialogueStage
---@param stageNr integer
---@return StoryBotDialogueStage
function StorySingleton.GetStage(stageNr) end

---@overload fun(stageNr: integer, queryTag: string, storyTag: StoryBotDialogueTag): boolean
---@overload fun(self: StorySingleton, queryTag: string, storyTag: StoryBotDialogueTag): boolean
---@overload fun(self: StorySingleton, stageNr: integer, queryTag: string, storyTag: StoryBotDialogueTag): boolean
---@param queryTag string
---@param storyTag StoryBotDialogueTag
---@return boolean
function StorySingleton.TryGetTag(queryTag, storyTag) end

---@overload fun(self: StorySingleton, id: string): StoryAutoEntryPoint
---@param id string
---@return StoryAutoEntryPoint
function StorySingleton.GetStoryAutoEntryPoint(id) end

---@overload fun(self: StorySingleton, id: string): StoryMenuEntryPoint
---@param id string
---@return StoryMenuEntryPoint
function StorySingleton.GetStoryMenuEntryPoint(id) end

---@overload fun(self: StorySingleton): Flowchart
---@return Flowchart
function StorySingleton.GetFlowchart() end

---@overload fun(self: StorySingleton): Block
---@return Block
function StorySingleton.CreatEmptyFungusBlock() end

---@overload fun(self: StorySingleton, block: Block)
---@param block Block
function StorySingleton.DestroyBlock(block) end

---@overload fun(self: StorySingleton)
function StorySingleton.MakeSureInitialized() end

---@overload fun(self: StorySingleton, richText: boolean): string
---@overload fun(self: StorySingleton): string
---@param richText? boolean
---@return string
function StorySingleton.GenerateSummary(richText) end

---@param startingCommand LuaCondition
function StorySingleton.ParseOldSystem(startingCommand) end

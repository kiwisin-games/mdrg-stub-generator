---@meta

-- MDRG MoonSharp Lua API definitions for LuaLS.
-- Generated from docs.txt and curated data/*.json.
-- These files describe exposed types and signatures only; comments avoid undocumented runtime behavior.

---@class AudioClip: AudioResource
---@field length number
---@field samples integer
---@field channels integer
---@field frequency integer
---@field loadType AudioClipLoadType
---@field preloadAudioData boolean
---@field ambisonic boolean
---@field loadInBackground boolean
---@field loadState AudioDataLoadState
---@field name string
---@field hideFlags HideFlags
AudioClip = {}

---@overload fun(self: AudioClip): boolean
---@return boolean
function AudioClip.LoadAudioData() end

---@overload fun(self: AudioClip): boolean
---@return boolean
function AudioClip.UnloadAudioData() end

---@overload fun(self: AudioClip, data: number[], offsetSamples: integer): boolean
---@param data number[]
---@param offsetSamples integer
---@return boolean
function AudioClip.GetData(data, offsetSamples) end

---@overload fun(self: AudioClip, data: number[], offsetSamples: integer): boolean
---@param data number[]
---@param offsetSamples integer
---@return boolean
function AudioClip.SetData(data, offsetSamples) end

---@overload fun(name: string, lengthSamples: integer, channels: integer, frequency: integer, stream: boolean, pcmreadercallback: PCMReaderCallback): AudioClip
---@overload fun(name: string, lengthSamples: integer, channels: integer, frequency: integer, stream: boolean, pcmreadercallback: PCMReaderCallback, pcmsetpositioncallback: PCMSetPositionCallback): AudioClip
---@param name string
---@param lengthSamples integer
---@param channels integer
---@param frequency integer
---@param stream boolean
---@return AudioClip
function AudioClip.Create(name, lengthSamples, channels, frequency, stream) end

---@class ColorOverLifetimeModule
---@field color MinMaxGradient
ColorOverLifetimeModule = {}

---@return ColorOverLifetimeModule
function ColorOverLifetimeModule.__new() end

---@class ColorScaler
---@field ColorMin Color
---@field ColorMax Color
---@field DefaultColorScaler ColorScaler
ColorScaler = {}

---@overload fun(baseColor: Color): ColorScaler
---@overload fun(colorMin: Color, colorMax: Color): ColorScaler
---@param strength number
---@return ColorScaler
function ColorScaler.__new(strength) end

---@overload fun(self: ColorScaler, color: Color): Color
---@param color Color
---@return Color
function ColorScaler.Scale(color) end

---@class ColoringGroup
---@field ColoringGroupEnum ColoringGroupEnum
---@field Enabled boolean
---@field Parts Part[]
---@field MainPart Part
---@field IsSkinned boolean
---@field HasNoParts boolean
ColoringGroup = {}

---@param coloringGroupEnum ColoringGroupEnum
---@param parts Part[]
---@return ColoringGroup
function ColoringGroup.__new(coloringGroupEnum, parts) end

---@overload fun(self: ColoringGroup, value: boolean)
---@param value boolean
function ColoringGroup.Toggle(value) end

---@overload fun(self: ColoringGroup, value: boolean, color: Color)
---@param value boolean
---@param color Color
function ColoringGroup.ColorAndToggle(value, color) end

---@overload fun(self: ColoringGroup, color: Color)
---@param color Color
function ColoringGroup.Color(color) end

---@overload fun(self: ColoringGroup): CubismRenderer[]
---@return CubismRenderer[]
function ColoringGroup.GetCubismRenderers() end

---@overload fun(self: ColoringGroup, mainPartId: string)
---@param mainPartId string
function ColoringGroup.PrepareAsSkinning(mainPartId) end

---@class DefaultTextureLayer: PartLayer
---@field IsFullLayer boolean
---@field Layer integer
---@field Color Color
---@field RelatedItem Item
DefaultTextureLayer = {}

---@param layer integer
---@param color Color
---@param relatedItem Item
---@return DefaultTextureLayer
function DefaultTextureLayer.__new(layer, color, relatedItem) end

---@overload fun(self: DefaultTextureLayer, part: Part, mainTexture: Texture, targetRect: Rect)
---@param part Part
---@param mainTexture Texture
---@param targetRect Rect
function DefaultTextureLayer.Draw(part, mainTexture, targetRect) end

---@class ElementColoringGroup
---@field ColorExtractionFunc fun(arg1: Item): Color|nil
---@field GroupsEnum ColoringGroupEnum[]
---@field Groups ColoringGroup[]
---@field ColorScaler ColorScaler
---@field EnableParam Live2DParameter
---@field ForceToggleEvenWithParam boolean
---@field NoItem boolean
ElementColoringGroup = {}

---@param colorScaler ColorScaler
---@param groups ColoringGroupEnum[]
---@return ElementColoringGroup
function ElementColoringGroup.__new(colorScaler, groups) end

---@param colorScaler ColorScaler
---@param groups ColoringGroupEnum[]
---@return ElementColoringGroup
function ElementColoringGroup.CreateInstanceColorIndex0(colorScaler, groups) end

---@param colorScaler ColorScaler
---@param enableParam Live2DParameter
---@param groups ColoringGroupEnum[]
---@return ElementColoringGroup
function ElementColoringGroup.CreateInstanceParameter(colorScaler, enableParam, groups) end

---@param colorScaler ColorScaler
---@param enableParam Live2DParameter
---@param groups ColoringGroupEnum[]
---@return ElementColoringGroup
function ElementColoringGroup.CreateInstanceParameterForceToggle(colorScaler, enableParam, groups) end

---@param index integer
---@param colorScaler ColorScaler
---@param groups ColoringGroupEnum[]
---@return ElementColoringGroup
function ElementColoringGroup.CreateInstanceDifferentColor(index, colorScaler, groups) end

---@overload fun(self: ElementColoringGroup, item: Item): Color
---@param item Item
---@return Color
function ElementColoringGroup.GetColor(item) end

---@overload fun(self: ElementColoringGroup, controller: Live2DController)
---@param controller Live2DController
function ElementColoringGroup.Init(controller) end

---@class Live2DLewdSceneController: Live2DController
---@field DickSkinName string
---@field DickMainName string
---@field CockTipColor Color
---@field CockColor Color
---@field CumColor Color
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
Live2DLewdSceneController = {}

---@overload fun(self: Live2DLewdSceneController)
function Live2DLewdSceneController.ManifestHorninessAndResetFrickCommonData() end

---@overload fun(self: Live2DLewdSceneController)
function Live2DLewdSceneController.ActivateBotFullLeadIfPossible() end

---@class Live2DShadersContainer
---@field MovingTexture SerializableAutomaticReference
---@field Rainbow SerializableAutomaticReference
---@field RayMarching SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
Live2DShadersContainer = {}

---@return Live2DShadersContainer
function Live2DShadersContainer.__new() end

---@class PackablePackedColorIndex: IPackableExpanded
---@field Pack_Name string
---@field Pack_RectInt RectInt
---@field Pack_Targets string[]
---@field Pack_ColorIndex integer
---@field Pack_DrawableType DrawableTypeEnum
---@field Pack_BypassColorScaler boolean
---@field Pack_Layer integer
---@field Texture PackedTexture
---@field Drawable PackedDrawable
PackablePackedColorIndex = {}

---@param texture PackedTexture
---@param drawable PackedDrawable
---@return PackablePackedColorIndex
function PackablePackedColorIndex.__new(texture, drawable) end

---@overload fun(self: PackablePackedColorIndex, targetRectInTexture: Rect)
---@param targetRectInTexture Rect
function PackablePackedColorIndex.Draw(targetRectInTexture) end

---@class PackedTexture: PackedTextureJson
---@field TargetsNames string
---@field NoSerializedTexture boolean
---@field LayerComparer IComparer
---@field IncludeVanillaLayers boolean
---@field SerializedTextureReference Texture2DSerializableAutomaticReference
---@field RuntimeTextureReference IReference
---@field TextureName string
---@field Layer integer
---@field PackedDrawables PackedDrawable[]
---@field Targets string[]
---@field DontIncludeVanillaLayers boolean
PackedTexture = {}

---@return PackedTexture
function PackedTexture.__new() end

---@overload fun(self: PackedTexture)
function PackedTexture.SortTargets() end

---@overload fun(self: PackedTexture, target: string): boolean
---@param target string
---@return boolean
function PackedTexture.HasTarget(target) end

---@overload fun(self: PackedTexture, target: string)
---@param target string
function PackedTexture.AddTarget(target) end

---@overload fun(self: PackedTexture)
function PackedTexture.OnBeforeSerialize() end

---@overload fun(self: PackedTexture)
function PackedTexture.OnAfterDeserialize() end

---@overload fun(self: PackedTexture): Texture2D
---@return Texture2D
function PackedTexture.GetTexture() end

---@overload fun(self: PackedTexture, texture2D: Texture2D)
---@param texture2D Texture2D
function PackedTexture.SetRuntimeTexture(texture2D) end

---@overload fun(self: PackedTexture, boundsTexture: Texture2D, live2DControllers: ModCreationLive2DControllersContainer): boolean
---@param boundsTexture Texture2D
---@param live2DControllers ModCreationLive2DControllersContainer
---@return boolean
function PackedTexture.TryDrawBounds(boundsTexture, live2DControllers) end

---@overload fun(self: PackedTexture, offset: integer): PackedTexture
---@param offset integer
---@return PackedTexture
function PackedTexture.Clone(offset) end

---@class PackedTextureJson
---@field IncludeVanillaLayers boolean
---@field TextureName string
---@field Layer integer
---@field PackedDrawables PackedDrawable[]
---@field Targets string[]
---@field DontIncludeVanillaLayers boolean
PackedTextureJson = {}

---@return PackedTextureJson
function PackedTextureJson.__new() end

---@class PackedTexturePartLayer: PartLayer
---@field Drawable PackedDrawable
---@field Texture PackedTexture
---@field IsFullLayer boolean
---@field Layer integer
---@field Color Color
---@field RelatedItem Item
PackedTexturePartLayer = {}

---@param layer integer
---@param color Color
---@param drawable PackedDrawable
---@param texture PackedTexture
---@param relatedItem Item
---@return PackedTexturePartLayer
function PackedTexturePartLayer.__new(layer, color, drawable, texture, relatedItem) end

---@overload fun(self: PackedTexturePartLayer, part: Part, mainTexture: Texture, targetRect: Rect)
---@param part Part
---@param mainTexture Texture
---@param targetRect Rect
function PackedTexturePartLayer.Draw(part, mainTexture, targetRect) end

---@class PackedTexturesContainer: ScriptableObject
---@field PackedDrawables PackedDrawable[]
---@field PackedDrawablesWithTheirTextures table[]
---@field TexturesInLayers IOrderedEnumerable
---@field name string
---@field hideFlags HideFlags
---@field PackedTextures PackedTexture[]
PackedTexturesContainer = {}

---@overload fun(id: string): PackedDrawable[]
---@overload fun(self: PackedTexturesContainer, target: ControllerEnum): PackedDrawable[]
---@overload fun(self: PackedTexturesContainer, id: string): PackedDrawable[]
---@param target ControllerEnum
---@return PackedDrawable[]
function PackedTexturesContainer.GetPackedDrawablesByTarget(target) end

---@overload fun(self: PackedTexturesContainer, target: string, rendererName: string): table[]
---@param target string
---@param rendererName string
---@return table[]
function PackedTexturesContainer.GetRelated(target, rendererName) end

---@overload fun(self: PackedTexturesContainer, target: string, name: string): boolean
---@param target string
---@param name string
---@return boolean
function PackedTexturesContainer.HasDrawable(target, name) end

---@overload fun(self: PackedTexturesContainer): string
---@return string
function PackedTexturesContainer.ToJson() end

---@overload fun(self: PackedTexturesContainer): ControllerEnum[]
---@return ControllerEnum[]
function PackedTexturesContainer.GetAffectedControllers() end

---@overload fun(self: PackedTexturesContainer): string
---@return string
function PackedTexturesContainer.GetNameUsingAffectedControllersId() end

---@overload fun(self: PackedTexturesContainer): string
---@return string
function PackedTexturesContainer.GetLuaNameUsingAffectedControllersId() end

---@overload fun(self: PackedTexturesContainer, controller: string): boolean
---@param controller string
---@return boolean
function PackedTexturesContainer.AreVanillaLayersIncluded(controller) end

---@overload fun(self: PackedTexturesContainer, name: string, index: integer, layer: integer): string
---@param name string
---@param index integer
---@param layer integer
---@return string
function PackedTexturesContainer.TextureNameGenerator(name, index, layer) end

---@overload fun(self: PackedTexturesContainer, folder: string, name: string): ModFileBase[]
---@param folder string
---@param name string
---@return ModFileBase[]
function PackedTexturesContainer.SaveTexturesToModfiles(folder, name) end

---@overload fun(self: PackedTexturesContainer, path: string): ModFileBase[]
---@param path string
---@return ModFileBase[]
function PackedTexturesContainer.SaveToModfiles(path) end

---@overload fun(self: PackedTexturesContainer, path: string)
---@param path string
function PackedTexturesContainer.SaveToPath(path) end

---@param formatPath string
---@param modfiles ModFileBase[]
---@return PackedTexturesContainer
function PackedTexturesContainer.LoadFromModFiles(formatPath, modfiles) end

---@param path string
---@return PackedTexturesContainer
function PackedTexturesContainer.LoadFromPath(path) end

---@return PackedTexturesContainer
function PackedTexturesContainer.CreateEmpty() end

---@overload fun(self: PackedTexturesContainer, parts: Part[], targets: string[], layer: integer)
---@overload fun(self: PackedTexturesContainer, parts: Part[], targets: string[])
---@param parts Part[]
---@param targets string[]
---@param layer? integer
function PackedTexturesContainer.CreatePackedTexturesFromRenderers(parts, targets, layer) end

---@overload fun(self: PackedTexturesContainer): PackedTexturesContainer
---@return PackedTexturesContainer
function PackedTexturesContainer.Clone() end

---@overload fun(self: PackedTexturesContainer)
function PackedTexturesContainer.Sort() end

---@overload fun(self: PackedTexturesContainer, packedTexture: PackedTexture, offset: integer)
---@overload fun(self: PackedTexturesContainer, packedTexture: PackedTexture)
---@param packedTexture PackedTexture
---@param offset? integer
function PackedTexturesContainer.DuplicateTexture(packedTexture, offset) end

---@overload fun(self: PackedTexturesContainer, layer: integer, offset: integer)
---@overload fun(self: PackedTexturesContainer, layer: integer)
---@param layer integer
---@param offset? integer
function PackedTexturesContainer.DuplicateLayer(layer, offset) end

---@overload fun(self: PackedTexturesContainer, layer: integer, packedTextureTargets: string[])
---@param layer integer
---@param packedTextureTargets string[]
function PackedTexturesContainer.JoinLayer(layer, packedTextureTargets) end

---@overload fun(self: PackedTexturesContainer, packedDrawables: PackedDrawable[], packedTexture: PackedTexture)
---@param packedDrawables PackedDrawable[]
---@param packedTexture PackedTexture
function PackedTexturesContainer.SplitTexture(packedDrawables, packedTexture) end

---@overload fun(self: PackedTexturesContainer, target: string)
---@param target string
function PackedTexturesContainer.AddAllTexturesTarget(target) end

---@param packedTexturesContainers PackedTexturesContainer[]
---@return Result
function PackedTexturesContainer.Optimize(packedTexturesContainers) end

---@overload fun(self: PackedTexturesContainer): Result
---@return Result
function PackedTexturesContainer.CheckValidity() end

---@overload fun(self: PackedTexturesContainer, log: StringBuilder)
---@param log StringBuilder
function PackedTexturesContainer.ReloadTexturesFromFiles(log) end

---@class PackedTexturesContainerJson
---@field PackedTextures PackedTextureJson[]
PackedTexturesContainerJson = {}

---@return PackedTexturesContainerJson
function PackedTexturesContainerJson.__new() end

---@class ParticleSystem: Component
---@field isPlaying boolean
---@field isEmitting boolean
---@field particleCount integer
---@field time number
---@field main MainModule
---@field emission EmissionModule
---@field shape ShapeModule
---@field colorOverLifetime ColorOverLifetimeModule
---@field textureSheetAnimation TextureSheetAnimationModule
---@field trails TrailModule
---@field customData CustomDataModule
---@field transform Transform
---@field transformHandle TransformHandle
---@field gameObject GameObject
---@field tag string
---@field name string
---@field hideFlags HideFlags
ParticleSystem = {}

---@return ParticleSystem
function ParticleSystem.__new() end

---@overload fun(emitParams: EmitParams, count: integer)
---@overload fun(self: ParticleSystem, count: integer)
---@overload fun(self: ParticleSystem, emitParams: EmitParams, count: integer)
---@param count integer
function ParticleSystem.Emit(count) end

---@overload fun(particles: Particle[], size: integer, offset: integer)
---@overload fun(self: ParticleSystem, particles: Particle[], size: integer)
---@overload fun(self: ParticleSystem, particles: Particle[], size: integer, offset: integer)
---@param particles Particle[]
---@param size integer
function ParticleSystem.SetParticles(particles, size) end

---@overload fun(particles: Particle[], size: integer): integer
---@overload fun(particles: Particle[], size: integer, offset: integer): integer
---@overload fun(self: ParticleSystem, particles: Particle[]): integer
---@overload fun(self: ParticleSystem, particles: Particle[], size: integer): integer
---@overload fun(self: ParticleSystem, particles: Particle[], size: integer, offset: integer): integer
---@param particles Particle[]
---@return integer
function ParticleSystem.GetParticles(particles) end

---@overload fun(t: number, withChildren: boolean, restart: boolean, fixedTimeStep: boolean)
---@overload fun(self: ParticleSystem, t: number, withChildren: boolean, restart: boolean)
---@overload fun(self: ParticleSystem, t: number, withChildren: boolean, restart: boolean, fixedTimeStep: boolean)
---@param t number
---@param withChildren boolean
---@param restart boolean
function ParticleSystem.Simulate(t, withChildren, restart) end

---@overload fun(withChildren: boolean)
---@overload fun(self: ParticleSystem)
---@overload fun(self: ParticleSystem, withChildren: boolean)
function ParticleSystem.Play() end

---@overload fun(withChildren: boolean)
---@overload fun(self: ParticleSystem)
---@overload fun(self: ParticleSystem, withChildren: boolean)
function ParticleSystem.Pause() end

---@overload fun(withChildren: boolean)
---@overload fun(withChildren: boolean, stopBehavior: ParticleSystemStopBehavior)
---@overload fun(self: ParticleSystem)
---@overload fun(self: ParticleSystem, withChildren: boolean)
---@overload fun(self: ParticleSystem, withChildren: boolean, stopBehavior: ParticleSystemStopBehavior)
function ParticleSystem.Stop() end

---@overload fun(withChildren: boolean)
---@overload fun(self: ParticleSystem)
---@overload fun(self: ParticleSystem, withChildren: boolean)
function ParticleSystem.Clear() end

---@overload fun(withChildren: boolean): boolean
---@overload fun(self: ParticleSystem): boolean
---@overload fun(self: ParticleSystem, withChildren: boolean): boolean
---@return boolean
function ParticleSystem.IsAlive() end

---@class ParticleSystemGroup: MonoBehaviour
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
ParticleSystemGroup = {}

---@return ParticleSystemGroup
function ParticleSystemGroup.__new() end

---@overload fun(self: ParticleSystemGroup, action: fun(arg1: ParticleSystem))
---@param action fun(arg1: ParticleSystem)
function ParticleSystemGroup.ApplyToAll(action) end

---@overload fun(self: ParticleSystemGroup)
function ParticleSystemGroup.DisableEmission() end

---@overload fun(self: ParticleSystemGroup, index: integer, count: integer, directionNormalized: Vector3, angleRandomOffset: number)
---@param index integer
---@param count integer
---@param directionNormalized Vector3
---@param angleRandomOffset number
function ParticleSystemGroup.EmitIndexWithDirection(index, count, directionNormalized, angleRandomOffset) end

---@overload fun(self: ParticleSystemGroup, index: integer, count: integer)
---@param index integer
---@param count integer
function ParticleSystemGroup.EmitIndex(index, count) end

---@overload fun(self: ParticleSystemGroup, count: integer)
---@param count integer
function ParticleSystemGroup.EmitAll(count) end

---@overload fun(self: ParticleSystemGroup, count1: integer, count2: integer)
---@param count1 integer
---@param count2 integer
function ParticleSystemGroup.EmitFirstTwo(count1, count2) end

---@overload fun(self: ParticleSystemGroup, count1: integer, count2: integer, count3: integer)
---@param count1 integer
---@param count2 integer
---@param count3 integer
function ParticleSystemGroup.EmitFirstThree(count1, count2, count3) end

---@overload fun(self: ParticleSystemGroup, counts: integer[])
---@param counts integer[]
function ParticleSystemGroup.EmitFirstN(counts) end

---@overload fun(self: ParticleSystemGroup, i: integer): ParticleSystem
---@param i integer
---@return ParticleSystem
function ParticleSystemGroup.GetParticleSystem(i) end

---@class Shader
---@field maximumChunksOverride integer
---@field maximumLOD integer
---@field globalMaximumLOD integer
---@field isSupported boolean
---@field globalRenderPipeline string
---@field enabledGlobalKeywords GlobalKeyword[]
---@field globalKeywords GlobalKeyword[]
---@field keywordSpace LocalKeywordSpace
---@field renderQueue integer
---@field passCount integer
---@field subshaderCount integer
---@field name string
---@field hideFlags HideFlags
Shader = {}

---@param name string
---@return Shader
function Shader.Find(name) end

---@overload fun(keyword: GlobalKeyword)
---@param keyword string
function Shader.EnableKeyword(keyword) end

---@overload fun(keyword: GlobalKeyword)
---@param keyword string
function Shader.DisableKeyword(keyword) end

---@overload fun(keyword: GlobalKeyword): boolean
---@param keyword string
---@return boolean
function Shader.IsKeywordEnabled(keyword) end

---@param keyword GlobalKeyword
---@param value boolean
function Shader.SetKeyword(keyword, value) end

function Shader.WarmupAllShaders() end

---@param name string
---@return integer
function Shader.PropertyToID(name) end

---@overload fun(self: Shader, name: string): Shader
---@param name string
---@return Shader
function Shader.GetDependency(name) end

---@overload fun(self: Shader, subshaderIndex: integer): integer
---@param subshaderIndex integer
---@return integer
function Shader.GetPassCountInSubshader(subshaderIndex) end

---@overload fun(subshaderIndex: integer, passIndex: integer, tagName: ShaderTagId): ShaderTagId
---@overload fun(self: Shader, passIndex: integer, tagName: ShaderTagId): ShaderTagId
---@overload fun(self: Shader, subshaderIndex: integer, passIndex: integer, tagName: ShaderTagId): ShaderTagId
---@param passIndex integer
---@param tagName ShaderTagId
---@return ShaderTagId
function Shader.FindPassTagValue(passIndex, tagName) end

---@overload fun(self: Shader, subshaderIndex: integer, tagName: ShaderTagId): ShaderTagId
---@param subshaderIndex integer
---@param tagName ShaderTagId
---@return ShaderTagId
function Shader.FindSubshaderTagValue(subshaderIndex, tagName) end

---@overload fun(nameID: integer, value: integer)
---@param name string
---@param value integer
function Shader.SetGlobalInt(name, value) end

---@overload fun(nameID: integer, value: number)
---@param name string
---@param value number
function Shader.SetGlobalFloat(name, value) end

---@overload fun(nameID: integer, value: integer)
---@param name string
---@param value integer
function Shader.SetGlobalInteger(name, value) end

---@overload fun(nameID: integer, value: Vector4)
---@param name string
---@param value Vector4
function Shader.SetGlobalVector(name, value) end

---@overload fun(nameID: integer, value: Color)
---@param name string
---@param value Color
function Shader.SetGlobalColor(name, value) end

---@overload fun(nameID: integer, value: Matrix4x4)
---@param name string
---@param value Matrix4x4
function Shader.SetGlobalMatrix(name, value) end

---@overload fun(nameID: integer, value: Texture)
---@overload fun(name: string, value: RenderTexture, element: RenderTextureSubElement)
---@overload fun(nameID: integer, value: RenderTexture, element: RenderTextureSubElement)
---@param name string
---@param value Texture
function Shader.SetGlobalTexture(name, value) end

---@overload fun(nameID: integer, value: ComputeBuffer)
---@overload fun(name: string, value: GraphicsBuffer)
---@overload fun(nameID: integer, value: GraphicsBuffer)
---@param name string
---@param value ComputeBuffer
function Shader.SetGlobalBuffer(name, value) end

---@overload fun(nameID: integer, value: ComputeBuffer, offset: integer, size: integer)
---@overload fun(name: string, value: GraphicsBuffer, offset: integer, size: integer)
---@overload fun(nameID: integer, value: GraphicsBuffer, offset: integer, size: integer)
---@param name string
---@param value ComputeBuffer
---@param offset integer
---@param size integer
function Shader.SetGlobalConstantBuffer(name, value, offset, size) end

---@overload fun(nameID: integer, value: RayTracingAccelerationStructure)
---@param name string
---@param value RayTracingAccelerationStructure
function Shader.SetGlobalRayTracingAccelerationStructure(name, value) end

---@overload fun(nameID: integer, values: number[])
---@param name string
---@param values number[]
function Shader.SetGlobalFloatArray(name, values) end

---@overload fun(nameID: integer, values: Vector4[])
---@param name string
---@param values Vector4[]
function Shader.SetGlobalVectorArray(name, values) end

---@overload fun(nameID: integer, values: Matrix4x4[])
---@param name string
---@param values Matrix4x4[]
function Shader.SetGlobalMatrixArray(name, values) end

---@overload fun(nameID: integer): integer
---@param name string
---@return integer
function Shader.GetGlobalInt(name) end

---@overload fun(nameID: integer): number
---@param name string
---@return number
function Shader.GetGlobalFloat(name) end

---@overload fun(nameID: integer): integer
---@param name string
---@return integer
function Shader.GetGlobalInteger(name) end

---@overload fun(nameID: integer): Vector4
---@param name string
---@return Vector4
function Shader.GetGlobalVector(name) end

---@overload fun(nameID: integer): Color
---@param name string
---@return Color
function Shader.GetGlobalColor(name) end

---@overload fun(nameID: integer): Matrix4x4
---@param name string
---@return Matrix4x4
function Shader.GetGlobalMatrix(name) end

---@overload fun(nameID: integer): Texture
---@param name string
---@return Texture
function Shader.GetGlobalTexture(name) end

---@overload fun(nameID: integer): number[]
---@overload fun(name: string, values: number[])
---@overload fun(nameID: integer, values: number[])
---@param name string
---@return number[]
function Shader.GetGlobalFloatArray(name) end

---@overload fun(nameID: integer): Vector4[]
---@overload fun(name: string, values: Vector4[])
---@overload fun(nameID: integer, values: Vector4[])
---@param name string
---@return Vector4[]
function Shader.GetGlobalVectorArray(name) end

---@overload fun(nameID: integer): Matrix4x4[]
---@overload fun(name: string, values: Matrix4x4[])
---@overload fun(nameID: integer, values: Matrix4x4[])
---@param name string
---@return Matrix4x4[]
function Shader.GetGlobalMatrixArray(name) end

---@overload fun(self: Shader): integer
---@return integer
function Shader.GetPropertyCount() end

---@overload fun(self: Shader, propertyName: string): integer
---@param propertyName string
---@return integer
function Shader.FindPropertyIndex(propertyName) end

---@overload fun(self: Shader, propertyIndex: integer): string
---@param propertyIndex integer
---@return string
function Shader.GetPropertyName(propertyIndex) end

---@overload fun(self: Shader, propertyIndex: integer): integer
---@param propertyIndex integer
---@return integer
function Shader.GetPropertyNameId(propertyIndex) end

---@overload fun(self: Shader, propertyIndex: integer): ShaderPropertyType
---@param propertyIndex integer
---@return ShaderPropertyType
function Shader.GetPropertyType(propertyIndex) end

---@overload fun(self: Shader, propertyIndex: integer): string
---@param propertyIndex integer
---@return string
function Shader.GetPropertyDescription(propertyIndex) end

---@overload fun(self: Shader, propertyIndex: integer): ShaderPropertyFlags
---@param propertyIndex integer
---@return ShaderPropertyFlags
function Shader.GetPropertyFlags(propertyIndex) end

---@overload fun(self: Shader, propertyIndex: integer): string[]
---@param propertyIndex integer
---@return string[]
function Shader.GetPropertyAttributes(propertyIndex) end

---@overload fun(self: Shader, propertyIndex: integer): number
---@param propertyIndex integer
---@return number
function Shader.GetPropertyDefaultFloatValue(propertyIndex) end

---@overload fun(self: Shader, propertyIndex: integer): Vector4
---@param propertyIndex integer
---@return Vector4
function Shader.GetPropertyDefaultVectorValue(propertyIndex) end

---@overload fun(self: Shader, propertyIndex: integer): Vector2
---@param propertyIndex integer
---@return Vector2
function Shader.GetPropertyRangeLimits(propertyIndex) end

---@overload fun(self: Shader, propertyIndex: integer): integer
---@param propertyIndex integer
---@return integer
function Shader.GetPropertyDefaultIntValue(propertyIndex) end

---@overload fun(self: Shader, propertyIndex: integer): TextureDimension
---@param propertyIndex integer
---@return TextureDimension
function Shader.GetPropertyTextureDimension(propertyIndex) end

---@overload fun(self: Shader, propertyIndex: integer): string
---@param propertyIndex integer
---@return string
function Shader.GetPropertyTextureDefaultName(propertyIndex) end

---@overload fun(self: Shader, propertyIndex: integer, stackName: string, layerIndex: integer): boolean
---@param propertyIndex integer
---@param stackName string
---@param layerIndex integer
---@return boolean
function Shader.FindTextureStack(propertyIndex, stackName, layerIndex) end

---@class ShaderDataGenerated: SingletonScriptableObject_ShaderDataGenerated_
---@field name string
---@field hideFlags HideFlags
---@field Live2DShaders Live2DShadersContainer
ShaderDataGenerated = {}

---@return ShaderDataGenerated
function ShaderDataGenerated.__new() end

---@overload fun(self: ShaderDataGenerated)
function ShaderDataGenerated.OnBeforeSerialize() end

---@overload fun(self: ShaderDataGenerated)
function ShaderDataGenerated.OnAfterDeserialize() end

---@overload fun(self: ShaderDataGenerated)
function ShaderDataGenerated.RegisterLua() end

---@class ShowerParticleSystemsContainer
---@field HideBrushSoapParticleSystem SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
ShowerParticleSystemsContainer = {}

---@return ShowerParticleSystemsContainer
function ShowerParticleSystemsContainer.__new() end

---@class ShowerParticleSystemsGroupsContainer
---@field FlyOffSoapParticleSystem SerializableAutomaticReference
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
---@field RelativePathAndNameToReference table<table, SerializableAutomaticReference>
---@field All SerializableAutomaticReference[]
ShowerParticleSystemsGroupsContainer = {}

---@return ShowerParticleSystemsGroupsContainer
function ShowerParticleSystemsGroupsContainer.__new() end

---@class Sprite
---@field bounds Bounds
---@field rect Rect
---@field border Vector4
---@field texture Texture2D
---@field pixelsPerUnit number
---@field spriteAtlasTextureScale number
---@field associatedAlphaSplitTexture Texture2D
---@field pivot Vector2
---@field packed boolean
---@field packingMode SpritePackingMode
---@field packingRotation SpritePackingRotation
---@field textureRect Rect
---@field textureRectOffset Vector2
---@field vertices Vector2[]
---@field triangles integer[]
---@field uv Vector2[]
---@field name string
---@field hideFlags HideFlags
Sprite = {}

---@overload fun(self: Sprite): integer
---@return integer
function Sprite.GetSecondaryTextureCount() end

---@overload fun(self: Sprite, secondaryTexture: SecondarySpriteTexture[]): integer
---@param secondaryTexture SecondarySpriteTexture[]
---@return integer
function Sprite.GetSecondaryTextures(secondaryTexture) end

---@overload fun(self: Sprite): integer
---@return integer
function Sprite.GetPhysicsShapeCount() end

---@overload fun(self: Sprite): integer
---@return integer
function Sprite.GetScriptableObjectsCount() end

---@overload fun(self: Sprite, scriptableObjects: ScriptableObject[]): integer
---@param scriptableObjects ScriptableObject[]
---@return integer
function Sprite.GetScriptableObjects(scriptableObjects) end

---@overload fun(self: Sprite, obj: ScriptableObject): boolean
---@param obj ScriptableObject
---@return boolean
function Sprite.AddScriptableObject(obj) end

---@overload fun(self: Sprite, i: integer): boolean
---@param i integer
---@return boolean
function Sprite.RemoveScriptableObjectAt(i) end

---@overload fun(self: Sprite, obj: ScriptableObject, i: integer): boolean
---@param obj ScriptableObject
---@param i integer
---@return boolean
function Sprite.SetScriptableObjectAt(obj, i) end

---@overload fun(self: Sprite, shapeIdx: integer): integer
---@param shapeIdx integer
---@return integer
function Sprite.GetPhysicsShapePointCount(shapeIdx) end

---@overload fun(shapeIdx: integer, physicsShape: Vector2[]): integer
---@overload fun(self: Sprite, shapeIdx: integer): ReadOnlySpan
---@overload fun(self: Sprite, shapeIdx: integer, physicsShape: Vector2[]): integer
---@param shapeIdx integer
---@return ReadOnlySpan
function Sprite.GetPhysicsShape(shapeIdx) end

---@overload fun(self: Sprite, physicsShapes: Vector2[][])
---@param physicsShapes Vector2[][]
function Sprite.OverridePhysicsShape(physicsShapes) end

---@overload fun(self: Sprite, vertices: Vector2[], triangles: integer[])
---@param vertices Vector2[]
---@param triangles integer[]
function Sprite.OverrideGeometry(vertices, triangles) end

---@overload fun(texture: Texture2D, rect: Rect, pivot: Vector2, pixelsPerUnit: number): Sprite
---@overload fun(texture: Texture2D, rect: Rect, pivot: Vector2, pixelsPerUnit: number, extrude: integer): Sprite
---@overload fun(texture: Texture2D, rect: Rect, pivot: Vector2, pixelsPerUnit: number, extrude: integer, meshType: SpriteMeshType): Sprite
---@overload fun(texture: Texture2D, rect: Rect, pivot: Vector2, pixelsPerUnit: number, extrude: integer, meshType: SpriteMeshType, border: Vector4): Sprite
---@overload fun(texture: Texture2D, rect: Rect, pivot: Vector2, pixelsPerUnit: number, extrude: integer, meshType: SpriteMeshType, border: Vector4, generateFallbackPhysicsShape: boolean): Sprite
---@overload fun(texture: Texture2D, rect: Rect, pivot: Vector2, pixelsPerUnit: number, extrude: integer, meshType: SpriteMeshType, border: Vector4, generateFallbackPhysicsShape: boolean, secondaryTextures: SecondarySpriteTexture[]): Sprite
---@param texture Texture2D
---@param rect Rect
---@param pivot Vector2
---@return Sprite
function Sprite.Create(texture, rect, pivot) end

---@class SpriteTextureDataGenerated: SingletonScriptableObject_SpriteTextureDataGenerated_
---@field name string
---@field hideFlags HideFlags
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
SpriteTextureDataGenerated = {}

---@return SpriteTextureDataGenerated
function SpriteTextureDataGenerated.__new() end

---@overload fun(self: SpriteTextureDataGenerated)
function SpriteTextureDataGenerated.OnBeforeSerialize() end

---@overload fun(self: SpriteTextureDataGenerated)
function SpriteTextureDataGenerated.OnAfterDeserialize() end

---@overload fun(self: SpriteTextureDataGenerated)
function SpriteTextureDataGenerated.RegisterLua() end

---@class TextureContainer
---@field AllParts Part[]
---@field OriginalTexture Texture
---@field CurrentTexture Texture
TextureContainer = {}

---@param allParts Part[]
---@param originalTexture Texture
---@return TextureContainer
function TextureContainer.__new(allParts, originalTexture) end

---@overload fun(self: TextureContainer, width: integer, height: integer): boolean
---@param width integer
---@param height integer
---@return boolean
function TextureContainer.IsSizeValid(width, height) end

---@overload fun(self: TextureContainer, texture: Texture)
---@param texture Texture
function TextureContainer.SetTexture(texture) end

---@overload fun(self: TextureContainer)
function TextureContainer.PrepareForDrawing() end

---@overload fun(self: TextureContainer, renderTexture: RenderTexture): boolean
---@param renderTexture RenderTexture
---@return boolean
function TextureContainer.TryGetRenderTexture(renderTexture) end

---@overload fun(self: TextureContainer): boolean
---@return boolean
function TextureContainer.NeedsRedrawing() end

---@overload fun(self: TextureContainer): boolean
---@return boolean
function TextureContainer.NeedsAnyDrawing() end

---@overload fun(self: TextureContainer): boolean
---@return boolean
function TextureContainer.CheckIfRenderTextureIsValid() end

---@overload fun(self: TextureContainer)
function TextureContainer.RestoreOriginalTexture() end

---@overload fun(self: TextureContainer)
function TextureContainer.ClearAndDrawAllParts() end

---Gerenciador de override/restauracao de sprites/texturas por alvo visual, usado por efeitos de item e room overrides.
---@class TextureOverriderManager: MonoBehaviour
---@field Id string
---@field AllManagers TextureOverriderManager[]
---@field RoomManager TextureOverriderManager
---@field ClothierManager TextureOverriderManager
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
---@field RoomID string
---@field ClothierID string
TextureOverriderManager = {}

---@return TextureOverriderManager
function TextureOverriderManager.__new() end

---@param id string
---@return TextureOverriderManager
function TextureOverriderManager.GetTextureOverriderManager(id) end

---@overload fun(self: TextureOverriderManager, value: boolean, item: Item, targetId: string, sprite: IReference)
---@param value boolean
---@param item Item
---@param targetId string
---@param sprite IReference
function TextureOverriderManager.SpecialEffectsActionLogic(value, item, targetId, sprite) end

---Cria um callback compativel com SpecialEffectAction para aplicar/restaurar sprite de alvo visual.
---@overload fun(self: TextureOverriderManager, targetId: string, sprite: IReference): function
---@param targetId string
---@param sprite IReference
---@return function
function TextureOverriderManager.GetSpecialEffectsAction(targetId, sprite) end

---Aplica override de sprite em um alvo visual, opcionalmente escopado por Guid unico.
---@overload fun(uniqueGuid: Guid, targetId: string, sprite: IReference)
---@overload fun(self: TextureOverriderManager, targetId: string, sprite: IReference)
---@overload fun(self: TextureOverriderManager, uniqueGuid: Guid, targetId: string, sprite: IReference)
---@param targetId string
---@param sprite IReference
function TextureOverriderManager.SetSprite(targetId, sprite) end

---Restaura o sprite original de um alvo visual previamente alterado.
---@overload fun(uniqueGuid: Guid, targetId: string, sprite: IReference)
---@overload fun(uniqueGuid: Guid, targetId: string)
---@overload fun(self: TextureOverriderManager, targetId: string, sprite: IReference)
---@overload fun(self: TextureOverriderManager, uniqueGuid: Guid, targetId: string, sprite: IReference)
---@overload fun(self: TextureOverriderManager, uniqueGuid: Guid, targetId: string)
---@param targetId string
---@param sprite IReference
function TextureOverriderManager.RestoreSprite(targetId, sprite) end

---@overload fun(self: TextureOverriderManager)
function TextureOverriderManager.RestoreAll() end

---@overload fun(self: TextureOverriderManager)
function TextureOverriderManager.Awake() end

---@overload fun(self: TextureOverriderManager): string
---@return string
function TextureOverriderManager.GenerateSummary() end

---@class TextureSheetAnimationModule
---@field enabled boolean
---@field mode ParticleSystemAnimationMode
---@field numTilesX integer
---@field numTilesY integer
---@field animation ParticleSystemAnimationType
---@field rowMode ParticleSystemAnimationRowMode
---@field frameOverTime MinMaxCurve
---@field cycleCount integer
---@field rowIndex integer
---@field uvChannelMask UVChannelFlags
---@field spriteCount integer
TextureSheetAnimationModule = {}

---@return TextureSheetAnimationModule
function TextureSheetAnimationModule.__new() end

---@overload fun(self: TextureSheetAnimationModule, index: integer, sprite: Sprite)
---@param index integer
---@param sprite Sprite
function TextureSheetAnimationModule.SetSprite(index, sprite) end

---@overload fun(self: TextureSheetAnimationModule, index: integer): Sprite
---@param index integer
---@return Sprite
function TextureSheetAnimationModule.GetSprite(index) end

---@class ViewSingleton: SingletonMonoBehaviour_ViewSingleton_
---@field CurrentView View
---@field ViewForCharacters View
---@field View1 View
---@field View2 View
---@field View3 View
---@field RoomView View
---@field RoomCharacterView View
---@field RoomCharacterViewZoom View
---@field RoomCharacterViewEquipment View
---@field SleepView View
---@field DoggyRoomView View
---@field BlowjobView View
---@field CowgirlView View
---@field RoomStoryViewWithoutAutomaticBot View
---@field RoomViewWithoutAutomaticBot View
---@field MissionaryView View
---@field ParalaxBoundsShower View
---@field ShowerView View
---@field ShowerViewNoBot View
---@field CuddleView View
---@field CuddleViewZoom View
---@field ClothierView View
---@field ShopView View
---@field ChangingRoomView View
---@field MenuView View
---@field ParalaxBounds View
---@field PCView View
---@field OutsideView View
---@field DeveloperRoomView View
---@field Scene1 ViewScene
---@field Scene2 ViewScene
---@field Scene3 ViewScene
---@field MainRoomScene RoomScene
---@field DoggyScene FrickScene
---@field BlowjobScene FrickScene
---@field CowgirlScene FrickScene
---@field RoomStoryScene ViewScene
---@field MissionaryScene FrickScene
---@field ShowerScene ShowerScene
---@field ShowerSceneNoBot ViewScene
---@field CuddleScene CuddleScene
---@field ClothierScene ClothierViewScene
---@field ShopScene ClothierViewScene
---@field ChangingRoomScene ChangingRoomScene
---@field MenuScene MainMenuScene
---@field PCScene PCScene
---@field OutsideScene ViewScene
---@field DeveloperRoomScene DeveloperViewScene
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
---@field GenericViews ViewWithSpriteRenderer[]
ViewSingleton = {}

---@return ViewSingleton
function ViewSingleton.__new() end

---@overload fun(self: ViewSingleton, view: View)
---@overload fun(self: ViewSingleton)
---@param view? View
function ViewSingleton.SetNextView(view) end

---@overload fun(self: ViewSingleton): View
---@return View
function ViewSingleton.GetNotCurrentView() end

---@overload fun(self: ViewSingleton, sprite: Sprite, color: Color, subView: SubViews): View
---@overload fun(self: ViewSingleton, sprite: Sprite, color: Color): View
---@param sprite Sprite
---@param color Color
---@param subView? SubViews
---@return View
function ViewSingleton.GetNotCurrentViewSetSprite(sprite, color, subView) end

---@overload fun(self: ViewSingleton)
function ViewSingleton.Awake() end

---@overload fun(self: ViewSingleton, value: fun(arg1: View))
---@param value fun(arg1: View)
function ViewSingleton.add_OnViewChanged(value) end

---@overload fun(self: ViewSingleton, value: fun(arg1: View))
---@param value fun(arg1: View)
function ViewSingleton.remove_OnViewChanged(value) end

---@overload fun(self: ViewSingleton)
function ViewSingleton.UpdateViewReferences() end

---Unity yield instruction commonly returned from Lua coroutines to wait for a number of seconds.
---@class WaitForSeconds: YieldInstruction
WaitForSeconds = {}

---@param seconds number
---@return WaitForSeconds
function WaitForSeconds.__new(seconds) end

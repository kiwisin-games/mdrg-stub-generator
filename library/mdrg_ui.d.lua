---@meta

-- MDRG MoonSharp Lua API definitions for LuaLS.
-- Generated from docs.txt and curated data/*.json.
-- These files describe exposed types and signatures only; comments avoid undocumented runtime behavior.

---Popup interno do BotStatusApp observado em scripts de Flowchart/Fungus extraidos da cena principal.
---@class BotStatusAppPopup: PrefabPopup_BotStatusAppPopup_
---@field WidthCharCount integer
---@field HeightCharCount integer
---@field CharAspectRatio number
---@field CharInverseAspectRatio number
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
BotStatusAppPopup = {}

---@return BotStatusAppPopup
function BotStatusAppPopup.__new() end

---@overload fun(self: BotStatusAppPopup)
function BotStatusAppPopup.LoadConsoleLook() end

---@overload fun(self: BotStatusAppPopup): ConsoleStyleStruct
---@return ConsoleStyleStruct
function BotStatusAppPopup.GetConsoleStyle() end

---@overload fun(self: BotStatusAppPopup, style: ConsoleStyleStruct)
---@param style ConsoleStyleStruct
function BotStatusAppPopup.SetConsoleStyle(style) end

---@overload fun(self: BotStatusAppPopup, data: string): StringConsoleLine
---@param data string
---@return StringConsoleLine
function BotStatusAppPopup.GetStringConsoleLine(data) end

---@overload fun(self: BotStatusAppPopup): StringBuilderConsoleLine
---@return StringBuilderConsoleLine
function BotStatusAppPopup.GetStringBuilderConsoleLine() end

---@overload fun(self: BotStatusAppPopup, s: ConsoleLine): ConsoleLine
---@param s ConsoleLine
---@return ConsoleLine
function BotStatusAppPopup.PrintLine(s) end

---@overload fun(self: BotStatusAppPopup, inputLine: ConsoleLine): boolean
---@param inputLine ConsoleLine
---@return boolean
function BotStatusAppPopup.RemoveLine(inputLine) end

---@overload fun(self: BotStatusAppPopup)
function BotStatusAppPopup.ClearScreen() end

---@overload fun(self: BotStatusAppPopup)
function BotStatusAppPopup.UpdateDisplay() end

---@overload fun(self: BotStatusAppPopup, s: ConsoleLine, delay: number, randomDelay: number, cancellationToken: CancellationToken): UniTask
---@overload fun(self: BotStatusAppPopup, s: ConsoleLine, delay: number, randomDelay: number): UniTask
---@overload fun(self: BotStatusAppPopup, s: ConsoleLine, delay: number): UniTask
---@overload fun(self: BotStatusAppPopup, s: ConsoleLine): UniTask
---@param s ConsoleLine
---@param delay? number
---@param randomDelay? number
---@param cancellationToken? CancellationToken
---@return UniTask
function BotStatusAppPopup.PrintLineDelay(s, delay, randomDelay, cancellationToken) end

---@overload fun(self: BotStatusAppPopup, length: number, width: integer, hideAfterDone: boolean, cancellationToken: CancellationToken): UniTask
---@overload fun(self: BotStatusAppPopup, length: number, width: integer, hideAfterDone: boolean): UniTask
---@overload fun(self: BotStatusAppPopup, length: number, width: integer): UniTask
---@overload fun(self: BotStatusAppPopup, length: number): UniTask
---@param length number
---@param width? integer
---@param hideAfterDone? boolean
---@param cancellationToken? CancellationToken
---@return UniTask
function BotStatusAppPopup.FakeLoading(length, width, hideAfterDone, cancellationToken) end

---@overload fun(self: BotStatusAppPopup, cancellationToken: CancellationToken): UniTask
---@overload fun(self: BotStatusAppPopup): UniTask
---@param cancellationToken? CancellationToken
---@return UniTask
function BotStatusAppPopup.WaitRandomShortDelay(cancellationToken) end

---@overload fun(self: BotStatusAppPopup, cancellationToken: CancellationToken): UniTask
---@overload fun(self: BotStatusAppPopup): UniTask
---@param cancellationToken? CancellationToken
---@return UniTask
function BotStatusAppPopup.WaitRandomLongDelay(cancellationToken) end

---@overload fun(self: BotStatusAppPopup)
function BotStatusAppPopup.StartPlayerInput() end

---@overload fun(self: BotStatusAppPopup, str: string): boolean
---@param str string
---@return boolean
function BotStatusAppPopup.TryEatPlayerInput(str) end

---@overload fun(self: BotStatusAppPopup)
function BotStatusAppPopup.EndPlayerInput() end

---@overload fun(self: BotStatusAppPopup, saveInMemory: boolean, cancellationToken: CancellationToken): UniTask
---@overload fun(self: BotStatusAppPopup, saveInMemory: boolean): UniTask
---@overload fun(self: BotStatusAppPopup): UniTask
---@param saveInMemory? boolean
---@param cancellationToken? CancellationToken
---@return UniTask
function BotStatusAppPopup.GetPlayerInput(saveInMemory, cancellationToken) end

---@overload fun(self: BotStatusAppPopup, cancellationToken: CancellationToken): UniTask
---@param cancellationToken CancellationToken
---@return UniTask
function BotStatusAppPopup.ShowEquipment(cancellationToken) end

---@overload fun(self: BotStatusAppPopup)
function BotStatusAppPopup.RaiseStopFlag() end

---@overload fun(self: BotStatusAppPopup, fungusBlockReference: FungusBlockReference): UniTask
---@param fungusBlockReference FungusBlockReference
---@return UniTask
function BotStatusAppPopup.DoFungusBlock(fungusBlockReference) end

---@overload fun(self: BotStatusAppPopup, c: string)
---@param c string
function BotStatusAppPopup.AddCharToInput(c) end

---@overload fun(self: BotStatusAppPopup, t: string)
---@param t string
function BotStatusAppPopup.SetPlayerInput(t) end

---Mostra um arquivo/pagina interna do BotStatusApp.
---@overload fun(self: BotStatusAppPopup, text: MdrgKnownBotStatusFileId|string)
---@param text MdrgKnownBotStatusFileId|string
function BotStatusAppPopup.ShowFile(text) end

---Forca o envio de input do jogador no BotStatusApp.
---@overload fun(self: BotStatusAppPopup, input: string)
---@param input string
function BotStatusAppPopup.ForceSubmitPlayerInput(input) end

---Coroutine que espera ate o BotStatusApp precisar de input do jogador.
---@overload fun(self: BotStatusAppPopup): IEnumerator
---@return IEnumerator
function BotStatusAppPopup.WaitTillPlayerInputNeeded() end

---@overload fun(self: BotStatusAppPopup)
function BotStatusAppPopup.Update() end

---@overload fun(self: BotStatusAppPopup, isPrologue: boolean)
---@param isPrologue boolean
function BotStatusAppPopup.Open(isPrologue) end

---@overload fun(self: BotStatusAppPopup): boolean
---@return boolean
function BotStatusAppPopup.CloseInner() end

---Browser interno do jogo observado em scripts de Flowchart/Fungus extraidos da cena principal.
---@class BrowserPopup: PrefabPopup_BrowserPopup_
---@field CurrentWebsite string
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
BrowserPopup = {}

---@return BrowserPopup
function BrowserPopup.__new() end

---@param link string
---@param text? string
---@return string
function BrowserPopup.FormatLink(link, text) end

---@overload fun(self: BrowserPopup)
function BrowserPopup.Awake() end

---@overload fun(self: BrowserPopup)
function BrowserPopup.RemovePreviousWebsite() end

---Navega o browser interno para um website do jogo.
---@overload fun(address: MdrgKnownWebsiteId|string)
---@overload fun(address: MdrgKnownWebsiteId|string, addToHistory: boolean)
---@overload fun(self: BrowserPopup)
---@overload fun(self: BrowserPopup, address: MdrgKnownWebsiteId|string)
---@overload fun(self: BrowserPopup, address: MdrgKnownWebsiteId|string, addToHistory: boolean)
function BrowserPopup.ChangeWebsite() end

---@overload fun(self: BrowserPopup)
function BrowserPopup.OnDisable() end

---@overload fun(self: BrowserPopup)
function BrowserPopup.PrevWebsite() end

---@overload fun(self: BrowserPopup)
function BrowserPopup.SyncBackButton() end

---@overload fun(self: BrowserPopup)
function BrowserPopup.FinishLoading() end

---@overload fun(self: BrowserPopup): boolean
---@return boolean
function BrowserPopup.CanClose() end

---@overload fun(website: string)
---@overload fun(self: BrowserPopup)
---@overload fun(self: BrowserPopup, website: string)
function BrowserPopup.Open() end

---@overload fun(self: BrowserPopup)
function BrowserPopup.Refresh() end

---@overload fun(self: BrowserPopup)
function BrowserPopup.FixedUpdate() end

---Seleciona um email pelo indice no browser interno.
---@overload fun(self: BrowserPopup, index: integer)
---@param index integer
function BrowserPopup.SelectEmail(index) end

---Abre a pagina de login de blog JoinUs por id interno.
---@overload fun(self: BrowserPopup, key: MdrgKnownJoinUsBlogId|string)
---@param key MdrgKnownJoinUsBlogId|string
function BrowserPopup.JoinUsOpenBlogLoginPage(key) end

---Coroutine interna de login do JoinUs.
---@overload fun(self: BrowserPopup): IEnumerator
---@return IEnumerator
function BrowserPopup.JoinUsLogin_Enumerator() end

---@overload fun(self: BrowserPopup, key: MdrgKnownJoinUsBlogId|string): IEnumerator
---@param key MdrgKnownJoinUsBlogId|string
---@return IEnumerator
function BrowserPopup.JoinUsOpenBlog_Enumerator(key) end

---@class ClothierOrdersPopup: PrefabPopup_ClothierOrdersPopup_
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
ClothierOrdersPopup = {}

---@return ClothierOrdersPopup
function ClothierOrdersPopup.__new() end

---@overload fun(self: ClothierOrdersPopup, afterClose: fun())
---@param afterClose fun()
function ClothierOrdersPopup.Open(afterClose) end

---@overload fun(self: ClothierOrdersPopup): boolean
---@return boolean
function ClothierOrdersPopup.CloseInner() end

---@class ClothierViewScene: ViewScene
---@field FirstView View
---@field Live2DModelUsage Live2DModelUsageTypeEnum
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
---@field halloweenDecorationsEnabled boolean
---@field NameOverride string
ClothierViewScene = {}

---@return ClothierViewScene
function ClothierViewScene.__new() end

---@class NunRepairPopup: PrefabPopup_NunRepairPopup_
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
NunRepairPopup = {}

---@return NunRepairPopup
function NunRepairPopup.__new() end

---@overload fun(self: NunRepairPopup)
function NunRepairPopup.Open() end

---@overload fun(self: NunRepairPopup): boolean
---@return boolean
function NunRepairPopup.CloseInner() end

---@class SimplePopup: PrefabPopup_SimplePopup_
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
---@field _cursorOverride CursorOverride
---@field sortOrder integer
---@field noScaleFadeIn boolean
SimplePopup = {}

---@return SimplePopup
function SimplePopup.__new() end

---@overload fun(self: SimplePopup): ButtonList
---@return ButtonList
function SimplePopup.GetButtonList() end

---@overload fun(linkIdToAction: table<string, fun()>)
---@overload fun(self: SimplePopup, OnLinkClicked: fun(arg1: string))
---@overload fun(self: SimplePopup, linkIdToAction: table<string, fun()>)
---@param OnLinkClicked fun(arg1: string)
function SimplePopup.AddLinkHandler(OnLinkClicked) end

---@overload fun(self: SimplePopup, title: string, text: string, choices: PopupChoice[])
---@param title string
---@param text string
---@param choices PopupChoice[]
function SimplePopup.Open(title, text, choices) end

---@overload fun(self: SimplePopup)
function SimplePopup.OnDestroy() end

---@class TextMeshProUGUI
---@field materialForRendering Material
---@field autoSizeTextContainer boolean
---@field mesh Mesh
---@field canvasRenderer CanvasRenderer
---@field maskOffset Vector4
---@field text string
---@field textPreprocessor ITextPreprocessor
---@field isRightToLeftText boolean
---@field font TMP_FontAsset
---@field fontSharedMaterial Material
---@field fontSharedMaterials Material[]
---@field fontMaterial Material
---@field fontMaterials Material[]
---@field color Color
---@field alpha number
---@field enableVertexGradient boolean
---@field colorGradient VertexGradient
---@field colorGradientPreset TMP_ColorGradient
---@field spriteAsset TMP_SpriteAsset
---@field tintAllSprites boolean
---@field styleSheet TMP_StyleSheet
---@field textStyle TMP_Style
---@field overrideColorTags boolean
---@field faceColor Color32
---@field outlineColor Color32
---@field outlineWidth number
---@field fontSize number
---@field fontWeight FontWeight
---@field pixelsPerUnit number
---@field enableAutoSizing boolean
---@field fontSizeMin number
---@field fontSizeMax number
---@field fontStyle FontStyles
---@field isUsingBold boolean
---@field horizontalAlignment HorizontalAlignmentOptions
---@field verticalAlignment VerticalAlignmentOptions
---@field alignment TextAlignmentOptions
---@field characterSpacing number
---@field characterHorizontalScale number
---@field wordSpacing number
---@field lineSpacing number
---@field lineSpacingAdjustment number
---@field paragraphSpacing number
---@field characterWidthAdjustment number
---@field textWrappingMode TextWrappingModes
---@field wordWrappingRatios number
---@field overflowMode TextOverflowModes
---@field isTextOverflowing boolean
---@field firstOverflowCharacterIndex integer
---@field linkedTextComponent TMP_Text
---@field isTextTruncated boolean
---@field fontFeatures OTL_FeatureTag[]
---@field extraPadding boolean
---@field richText boolean
---@field emojiFallbackSupport boolean
---@field parseCtrlCharacters boolean
---@field isOverlay boolean
---@field isOrthographic boolean
---@field enableCulling boolean
---@field ignoreVisibility boolean
---@field horizontalMapping TextureMappingOptions
---@field verticalMapping TextureMappingOptions
---@field mappingUvLineOffset number
---@field renderMode TextRenderFlags
---@field geometrySortingOrder VertexSortingOrder
---@field isTextObjectScaleStatic boolean
---@field vertexBufferAutoSizeReduction boolean
---@field firstVisibleCharacter integer
---@field maxVisibleCharacters integer
---@field maxVisibleWords integer
---@field maxVisibleLines integer
---@field useMaxVisibleDescender boolean
---@field pageToDisplay integer
---@field margin Vector4
---@field textInfo TMP_TextInfo
---@field havePropertiesChanged boolean
---@field isUsingLegacyAnimationComponent boolean
---@field transform Transform
---@field rectTransform RectTransform
---@field isVolumetricText boolean
---@field bounds Bounds
---@field textBounds Bounds
---@field flexibleHeight number
---@field flexibleWidth number
---@field minWidth number
---@field minHeight number
---@field maxWidth number
---@field maxHeight number
---@field preferredWidth number
---@field preferredHeight number
---@field renderedWidth number
---@field renderedHeight number
---@field layoutPriority integer
---@field onCullStateChanged CullStateChangedEvent
---@field maskable boolean
---@field isMaskingGraphic boolean
---@field raycastTarget boolean
---@field raycastPadding Vector4
---@field depth integer
---@field canvas Canvas
---@field defaultMaterial Material
---@field material Material
---@field mainTexture Texture
---@field destroyCancellationToken CancellationToken
---@field useGUILayout boolean
---@field didStart boolean
---@field didAwake boolean
---@field enabled boolean
---@field isActiveAndEnabled boolean
---@field transformHandle TransformHandle
---@field gameObject GameObject
---@field tag string
---@field name string
---@field hideFlags HideFlags
TextMeshProUGUI = {}

---@return TextMeshProUGUI
function TextMeshProUGUI.__new() end

---@overload fun(self: TextMeshProUGUI)
function TextMeshProUGUI.CalculateLayoutInputHorizontal() end

---@overload fun(self: TextMeshProUGUI)
function TextMeshProUGUI.CalculateLayoutInputVertical() end

---@overload fun(self: TextMeshProUGUI)
function TextMeshProUGUI.SetVerticesDirty() end

---@overload fun(self: TextMeshProUGUI)
function TextMeshProUGUI.SetLayoutDirty() end

---@overload fun(self: TextMeshProUGUI)
function TextMeshProUGUI.SetMaterialDirty() end

---@overload fun(self: TextMeshProUGUI)
function TextMeshProUGUI.SetAllDirty() end

---@overload fun(self: TextMeshProUGUI, update: CanvasUpdate)
---@param update CanvasUpdate
function TextMeshProUGUI.Rebuild(update) end

---@overload fun(self: TextMeshProUGUI, baseMaterial: Material): Material
---@param baseMaterial Material
---@return Material
function TextMeshProUGUI.GetModifiedMaterial(baseMaterial) end

---@overload fun(self: TextMeshProUGUI)
function TextMeshProUGUI.RecalculateClipping() end

---@overload fun(self: TextMeshProUGUI, clipRect: Rect, validRect: boolean)
---@param clipRect Rect
---@param validRect boolean
function TextMeshProUGUI.Cull(clipRect, validRect) end

---@overload fun(self: TextMeshProUGUI)
function TextMeshProUGUI.UpdateMeshPadding() end

---@overload fun(self: TextMeshProUGUI, ignoreActiveState: boolean, forceTextReparsing: boolean)
---@param ignoreActiveState boolean
---@param forceTextReparsing boolean
function TextMeshProUGUI.ForceMeshUpdate(ignoreActiveState, forceTextReparsing) end

---@overload fun(self: TextMeshProUGUI, text: string): TMP_TextInfo
---@param text string
---@return TMP_TextInfo
function TextMeshProUGUI.GetTextInfo(text) end

---@overload fun(self: TextMeshProUGUI)
function TextMeshProUGUI.ClearMesh() end

---@overload fun(self: TextMeshProUGUI, value: fun(arg1: TMP_TextInfo))
---@param value fun(arg1: TMP_TextInfo)
function TextMeshProUGUI.add_OnPreRenderText(value) end

---@overload fun(self: TextMeshProUGUI, value: fun(arg1: TMP_TextInfo))
---@param value fun(arg1: TMP_TextInfo)
function TextMeshProUGUI.remove_OnPreRenderText(value) end

---@overload fun(self: TextMeshProUGUI, mesh: Mesh, index: integer)
---@param mesh Mesh
---@param index integer
function TextMeshProUGUI.UpdateGeometry(mesh, index) end

---@overload fun(flags: TMP_VertexDataUpdateFlags)
---@overload fun(self: TextMeshProUGUI)
---@overload fun(self: TextMeshProUGUI, flags: TMP_VertexDataUpdateFlags)
function TextMeshProUGUI.UpdateVertexData() end

---@overload fun(self: TextMeshProUGUI)
function TextMeshProUGUI.UpdateFontAsset() end

---@overload fun(self: TextMeshProUGUI)
function TextMeshProUGUI.ComputeMarginSize() end

---@class TimeoutSimplePopup: PrefabPopup_TimeoutSimplePopup_
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
TimeoutSimplePopup = {}

---@return TimeoutSimplePopup
function TimeoutSimplePopup.__new() end

---@overload fun(self: TimeoutSimplePopup, title: string, textGenerator: fun(arg1: TimeSpan): string, choices: PopupChoice[], defaultChoiceIndex: integer, timeoutDuration: TimeSpan|nil)
---@overload fun(self: TimeoutSimplePopup, title: string, textGenerator: fun(arg1: TimeSpan): string, choices: PopupChoice[], defaultChoiceIndex: integer)
---@overload fun(self: TimeoutSimplePopup, title: string, textGenerator: fun(arg1: TimeSpan): string, choices: PopupChoice[])
---@param title string
---@param textGenerator fun(arg1: TimeSpan): string
---@param choices PopupChoice[]
---@param defaultChoiceIndex? integer
---@param timeoutDuration? TimeSpan|nil
function TimeoutSimplePopup.Open(title, textGenerator, choices, defaultChoiceIndex, timeoutDuration) end

---Utilitarios de overlay e popups de UI expostos ao Lua.
---@class UiOverlay: UIManager
---@field Instance UiOverlay
---@field OverlayTransform RectTransform
---@field GuiTransform RectTransform
---@field IsOpen boolean
---@field MaxSortOrder integer
---@field MainCamera Camera
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
---@field developmentBuildText TextMeshProUGUI
---@field _mainSayDialogPopupGameObject SayDialogPopup
---@field _speechSayDialogPopup SayDialogPopup
---@field draggedItemPrefab PooledPrefabReference
---@field commonButton PooledPrefabReference
---@field gameItemContainerPrefab PooledPrefabReference
---@field defaultTooltip PooledPrefabReference
---@field defaultFloatingText PooledPrefabReference
---@field itemStats PooledPrefabReference
---@field itemColorSlotPicker PooledPrefabReference
---@field stringAdvancedItemListPrefab PooledPrefabReference
---@field stringGenericDataDisplay PooledPrefabReference
---@field itemModifiableVariableDisplay PooledPrefabReference
---@field modItemListDisplay PooledPrefabReference
---@field NormalColor Color
---@field AltNormalColor Color
---@field ActiveColor Color
---@field InactiveColor Color
---@field GreenColor Color
---@field RedColor Color
---@field DefaultFungusOverlayColor Color
---@field FunugsOverlayLayer integer
---@field PopupLayer integer
---@field SayDialogLayer integer
---@field MenuDialogLayer integer
---@field NameLengthValidation StringValidationDelegate
---@field NameTrimProcessing StringProcessingDelegate
---@field NameTrimToLowerProcessing StringProcessingDelegate
---@field _uiOverlayGameObject GameObject
UiOverlay = {}

---@return UiOverlay
function UiOverlay.__new() end

---@overload fun(self: UiOverlay)
function UiOverlay.Awake() end

---@overload fun(self: UiOverlay, buttonColorType: CommonButtonColorType): ButtonColorPalette
---@param buttonColorType CommonButtonColorType
---@return ButtonColorPalette
function UiOverlay.GetButtonColorPalette(buttonColorType) end

---Opens the game's Fungus overlay.
---@overload fun(overlayColor: Color)
---@overload fun(self: UiOverlay)
---@overload fun(self: UiOverlay, overlayColor: Color)
function UiOverlay.OpenFungusOverlay() end

---Returns whether the Fungus overlay is currently open.
---@overload fun(self: UiOverlay): boolean
---@return boolean
function UiOverlay.HasFungusOverlay() end

---Closes the game's Fungus overlay.
---@overload fun(self: UiOverlay)
function UiOverlay.CloseFungusOverlay() end

---@overload fun(self: UiOverlay, title: string, text: string, loadingCreationFunc: fun(arg1: IProgressManager): UniTask, OnFinished: fun())
---@overload fun(self: UiOverlay, title: string, text: string, loadingCreationFunc: fun(arg1: IProgressManager): UniTask)
---@param title string
---@param text string
---@param loadingCreationFunc fun(arg1: IProgressManager): UniTask
---@param OnFinished? fun()
function UiOverlay.ProgressPopup(title, text, loadingCreationFunc, OnFinished) end

---@overload fun(self: UiOverlay, title: string, price: integer, boughtaction: fun(), text: string, noaction: fun(), nomoneyaction: fun())
---@overload fun(self: UiOverlay, title: string, price: integer, boughtaction: fun(), text: string, noaction: fun())
---@overload fun(self: UiOverlay, title: string, price: integer, boughtaction: fun(), text: string)
---@overload fun(self: UiOverlay, title: string, price: integer, boughtaction: fun())
---@param title string
---@param price integer
---@param boughtaction fun()
---@param text? string
---@param noaction? fun()
---@param nomoneyaction? fun()
function UiOverlay.BuyPopup(title, price, boughtaction, text, noaction, nomoneyaction) end

---@overload fun(self: UiOverlay, title: string, textGenerator: fun(arg1: TimeSpan): string, choices: PopupChoice[], defaultChoiceIndex: integer, timeout: TimeSpan): TimeoutSimplePopup
---@param title string
---@param textGenerator fun(arg1: TimeSpan): string
---@param choices PopupChoice[]
---@param defaultChoiceIndex integer
---@param timeout TimeSpan
---@return TimeoutSimplePopup
function UiOverlay.SimplePopupWithTimeout(title, textGenerator, choices, defaultChoiceIndex, timeout) end

---@overload fun(self: UiOverlay, title: string, text: string, yesaction: fun(), noaction: fun()): SimplePopup
---@overload fun(self: UiOverlay, title: string, text: string, yesaction: fun()): SimplePopup
---@param title string
---@param text string
---@param yesaction fun()
---@param noaction? fun()
---@return SimplePopup
function UiOverlay.SimplePopup(title, text, yesaction, noaction) end

---@overload fun(self: UiOverlay, title: string, text: string, choices: PopupChoice[]): SimplePopup
---@param title string
---@param text string
---@param choices PopupChoice[]
---@return SimplePopup
function UiOverlay.Popup(title, text, choices) end

---@overload fun(self: UiOverlay, description: string, finishFunc: fun(arg1: UploadResult), filters: FileType[], multifile: boolean, allowAllFiles: boolean)
---@overload fun(self: UiOverlay, description: string, finishFunc: fun(arg1: UploadResult), filters: FileType[], multifile: boolean)
---@overload fun(self: UiOverlay, description: string, finishFunc: fun(arg1: UploadResult), filters: FileType[])
---@overload fun(self: UiOverlay, description: string, finishFunc: fun(arg1: UploadResult))
---@param description string
---@param finishFunc fun(arg1: UploadResult)
---@param filters? FileType[]
---@param multifile? boolean
---@param allowAllFiles? boolean
function UiOverlay.FileLoadPopup(description, finishFunc, filters, multifile, allowAllFiles) end

---@overload fun(filename: string, data: string, after: fun(arg1: DownloadResult))
---@overload fun(self: UiOverlay, filename: string, data: integer[], after: fun(arg1: DownloadResult))
---@overload fun(self: UiOverlay, filename: string, data: string, after: fun(arg1: DownloadResult))
---@param filename string
---@param data integer[]
---@param after fun(arg1: DownloadResult)
function UiOverlay.FileSavePopup(filename, data, after) end

---Mostra um popup simples com titulo, texto e acao opcional de OK.
---@overload fun(self: UiOverlay, title: string, text: string, okaction: fun()): SimplePopup
---@overload fun(self: UiOverlay, title: string, text: string): SimplePopup
---@param title string
---@param text string
---@param okaction? fun()
---@return SimplePopup
function UiOverlay.OkPopup(title, text, okaction) end

---@overload fun(self: UiOverlay, text: string, okaction: fun()): SimplePopup
---@overload fun(self: UiOverlay, text: string): SimplePopup
---@param text string
---@param okaction? fun()
---@return SimplePopup
function UiOverlay.OkPopupError(text, okaction) end

---@overload fun(self: UiOverlay, text: string, okaction: fun()): SimplePopup
---@overload fun(self: UiOverlay, text: string): SimplePopup
---@param text string
---@param okaction? fun()
---@return SimplePopup
function UiOverlay.OkPopupSuccess(text, okaction) end

---@overload fun(self: UiOverlay, text: string, okaction: fun()): SimplePopup
---@overload fun(self: UiOverlay, text: string): SimplePopup
---@param text string
---@param okaction? fun()
---@return SimplePopup
function UiOverlay.OkPopupWarning(text, okaction) end

---@overload fun(self: UiOverlay, title: string, text: string, okaction: fun(arg1: string), defaultInput: string, type: ContentType): InputPopup
---@overload fun(self: UiOverlay, title: string, text: string, okaction: fun(arg1: string), defaultInput: string): InputPopup
---@overload fun(self: UiOverlay, title: string, text: string, okaction: fun(arg1: string)): InputPopup
---@param title string
---@param text string
---@param okaction fun(arg1: string)
---@param defaultInput? string
---@param type? ContentType
---@return InputPopup
function UiOverlay.InputPopup(title, text, okaction, defaultInput, type) end

---@overload fun(self: UiOverlay, title: string, text: string, areYouSureText: fun(arg1: string): string, OnPicked: fun(arg1: string), defaultInput: string, type: ContentType, validate: StringValidationDelegate, process: StringProcessingDelegate)
---@overload fun(self: UiOverlay, title: string, text: string, areYouSureText: fun(arg1: string): string, OnPicked: fun(arg1: string), defaultInput: string, type: ContentType, validate: StringValidationDelegate)
---@overload fun(self: UiOverlay, title: string, text: string, areYouSureText: fun(arg1: string): string, OnPicked: fun(arg1: string), defaultInput: string, type: ContentType)
---@overload fun(self: UiOverlay, title: string, text: string, areYouSureText: fun(arg1: string): string, OnPicked: fun(arg1: string), defaultInput: string)
---@overload fun(self: UiOverlay, title: string, text: string, areYouSureText: fun(arg1: string): string, OnPicked: fun(arg1: string))
---@param title string
---@param text string
---@param areYouSureText fun(arg1: string): string
---@param OnPicked fun(arg1: string)
---@param defaultInput? string
---@param type? ContentType
---@param validate? StringValidationDelegate
---@param process? StringProcessingDelegate
function UiOverlay.InputPopupWithValidation(title, text, areYouSureText, OnPicked, defaultInput, type, validate, process) end

---@overload fun(self: UiOverlay)
function UiOverlay.OpenNarrativeLog() end

---@overload fun(self: UiOverlay, onFinished: fun(), isWithBot: boolean): AnnalieShopPopup
---@param onFinished fun()
---@param isWithBot boolean
---@return AnnalieShopPopup
function UiOverlay.OpenAnnalieShop(onFinished, isWithBot) end

---@overload fun(self: UiOverlay, onFinished: fun()): ClothierOrdersPopup
---@param onFinished fun()
---@return ClothierOrdersPopup
function UiOverlay.OpenClothierOrdersShop(onFinished) end

---@overload fun(self: UiOverlay, onFinished: fun()): FisherSellFishPopup
---@param onFinished fun()
---@return FisherSellFishPopup
function UiOverlay.OpenFisherSellFish(onFinished) end

---@overload fun(self: UiOverlay): NunRepairPopup
---@return NunRepairPopup
function UiOverlay.OpenNunRepairShop() end

---@overload fun(self: UiOverlay, id: string, onFinished: fun())
---@param id string
---@param onFinished fun()
function UiOverlay.OpenShop(id, onFinished) end

---@overload fun(self: UiOverlay)
function UiOverlay.OpenSaveMenu() end

---@overload fun(self: UiOverlay)
function UiOverlay.OpenLoadMenu() end

---@overload fun(self: UiOverlay)
function UiOverlay.OpenItemsMenu() end

---@overload fun(self: UiOverlay)
function UiOverlay.OpenAchievements() end

---@overload fun(self: UiOverlay)
function UiOverlay.OpenOptions() end

---@overload fun(self: UiOverlay)
function UiOverlay.OpenToyPopup() end

---@overload fun(self: UiOverlay, items: ItemPrefab[])
---@overload fun(self: UiOverlay)
---@param items? ItemPrefab[]
function UiOverlay.OpenModCreatorPopup(items) end

---@overload fun(self: UiOverlay)
function UiOverlay.OpenModsPopup() end

---@overload fun(self: UiOverlay)
function UiOverlay.OpenFishingJournal() end

---Abre o BotStatusApp interno.
---@overload fun(self: UiOverlay): BotStatusAppPopup
---@return BotStatusAppPopup
function UiOverlay.OpenBotStatusApp() end

---Abre o BotStatusApp em modo/prologo interno.
---@overload fun(self: UiOverlay): BotStatusAppPopup
---@return BotStatusAppPopup
function UiOverlay.OpenBotStatusAppPrologue() end

---@overload fun(self: UiOverlay): SheepPopup
---@return SheepPopup
function UiOverlay.OpenSheepPopup() end

---@overload fun(self: UiOverlay, title: string, text: string, yesaction: fun(arg1: Color), noaction: fun(arg1: Color), startColor: Color32)
---@param title string
---@param text string
---@param yesaction fun(arg1: Color)
---@param noaction fun(arg1: Color)
---@param startColor Color32
function UiOverlay.ColorInputPopup(title, text, yesaction, noaction, startColor) end

---@overload fun(self: UiOverlay, choices: PopupChoice[], addCancel: boolean)
---@overload fun(self: UiOverlay, choices: PopupChoice[])
---@param choices PopupChoice[]
---@param addCancel? boolean
function UiOverlay.OpenContextMenuPopup(choices, addCancel) end

---@overload fun(self: UiOverlay, targetSlot: ItemSlot, onFinished: fun(arg1: PopupFinishTypesEnum))
---@overload fun(self: UiOverlay, targetSlot: ItemSlot)
---@param targetSlot ItemSlot
---@param onFinished? fun(arg1: PopupFinishTypesEnum)
function UiOverlay.OpenSlotEquipItemPopup(targetSlot, onFinished) end

---Abre o browser interno; scripts de cena usam para navegar em websites do jogo.
---@overload fun(self: UiOverlay, website: MdrgKnownWebsiteId|string): BrowserPopup
---@overload fun(self: UiOverlay): BrowserPopup
---@param website? MdrgKnownWebsiteId|string
---@return BrowserPopup
function UiOverlay.OpenBrowser(website) end

---Retorna o BotStatusApp atualmente aberto, quando existir.
---@overload fun(self: UiOverlay): BotStatusAppPopup
---@return BotStatusAppPopup
function UiOverlay.GetCurrentlyOpenedBotStatusApp() end

---Retorna o browser interno atualmente aberto, quando existir.
---@overload fun(self: UiOverlay): BrowserPopup
---@return BrowserPopup
function UiOverlay.GetCurrentlyOpenedBrowser() end

---@overload fun(self: UiOverlay, instanceModPath: string)
---@param instanceModPath string
function UiOverlay.OpenNativeFolderPath(instanceModPath) end

---@overload fun(position: Vector2, text: StringBuilder)
---@overload fun(self: UiOverlay, position: Vector2, text: string)
---@overload fun(self: UiOverlay, position: Vector2, text: StringBuilder)
---@param position Vector2
---@param text string
function UiOverlay.ShowFloatingText(position, text) end

---@overload fun(self: UiOverlay, item: Item, finished: fun())
---@overload fun(self: UiOverlay, item: Item)
---@param item Item
---@param finished? fun()
function UiOverlay.EquipItem(item, finished) end

---@overload fun(self: UiOverlay, item: Item, finished: fun())
---@overload fun(self: UiOverlay, item: Item)
---@param item Item
---@param finished? fun()
function UiOverlay.UnequipItemOrAsk(item, finished) end

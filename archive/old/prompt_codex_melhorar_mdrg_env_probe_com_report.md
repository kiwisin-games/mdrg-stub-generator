# Prompt para Codex — Melhorar `mdrg_env_probe.lua` com base no script atual e no report gerado

Você está trabalhando no repositório atual do addon/stubs LuaLS para MDRG/MoonSharp.

Já existe um script Lua em:

```txt
examples/mdrg_env_probe.lua
```

Esse script roda dentro do jogo via Lua/MoonSharp e gera um report runtime com informações de globals, tabelas, funções, userdata, enums, metatables, `_MOONSHARP`, validações e fallback por `print`.

Quero que você **melhore o script existente**, não reescreva do zero.

## Objetivo

Melhorar o probe runtime para extrair informações mais úteis do ambiente MDRG/MoonSharp, com foco no que o report real revelou:

- A maioria das APIs MDRG aparece como `userdata`.
- `getmetatable()` retorna `nil` para quase todos os userdatas.
- O contexto atual via `LuaPatch`/`exec.lua` expõe `gv` e `flowchart`, mas não expõe `GameVariables` nem `CurrentModGuid`.
- `io` não está disponível, então o report cai em fallback por `print`.
- O dump profundo de `package.loaded` polui bastante o console.
- O probe atual já é útil, mas precisa de field probing controlado baseado nos stubs.

Mantenha o script read-only, defensivo e compatível com Lua 5.2/MoonSharp.

---

# Contexto técnico observado no report

O report gerado mostrou:

```txt
_VERSION: "MoonSharp 2.0.0.0"
_MOONSHARP.luacompat: "5.2"
_MOONSHARP.platform: "limited.unity.dll.mono.clr4.aot"
_MOONSHARP.is_unity: true
_MOONSHARP.is_aot: true
```

Também mostrou:

```txt
CurrentModGuid: missing
GameVariables: missing
gv: userdata <GameVariables>
flowchart: userdata <Main Flowchart (Fungus.Flowchart)>
ModUtilities: userdata <Everything (ModUtilities)>
GameUtilities: userdata <Everything (GameUtilities)>
UiOverlay: userdata <Everything (UiOverlay)>
SoundSingleton: userdata <Everything (SoundSingleton)>
ViewSingleton: userdata <Views (ViewSingleton)>
```

E confirmou que muitos tipos aparecem como `userdata`, por exemplo:

```txt
AllowedModifiers
AtLeastOneBoolVariableTrueRequirement
ColorPalette
ColorPaletteEntry
ColorPaletteManager
ColorSlot
CommonAllowedModifiersEnum
ControllerEnum
CookingSong
CookingSongRuntimeData
EdibleItemNutritionProfile
EdibleItemPrefabData
EdibleTypeEnum
FinishedType
FishingBaitItemPrefabData
FishingBaitType
FishingCatchBehaviourType
FishingRodItemPrefabData
FishItemPrefabData
FishPreferences
GameId
Guid
GlobalFlag
Item
ItemCategory
ItemEnum
ItemModifiableVariableFactory
ItemModifiableVariablesRequirement
ItemPrefab
ItemPrefabManager
ItemScopeCondition
ItemScopeConditionAlwaysTrueCondition
ItemScopeConditionCustom
ItemScopeConditionSpecialVariable
ItemSlot
ItemSubCategory
Live2DControllerSingleton
ModUtilities
NewsId
NoteButtonTypeEnum
R
Recipe
Result
SaveContainer
SaveSingleton
ScratchTextureType
Shop
ShopItem
ShopManager
SimpleLocalizedString
SingleArgumentComparators
SlotEquipData
SlotManager
SlotType
SoundSingleton
StoryAutoBranch
StoryBlockTarget
StoryBotContainerTypeEnum
StoryBotDialogueBranch
StoryBranchTarget
StoryCondition
StoryEnumeratorTarget
StoryLocalizedConversationBranchTarget
StoryMenuBranch
StorySingleton
SusArea
SusModifier
TextureOverriderManager
TimeCheckType
TwoArgumentComparators
UiOverlay
ViewSingleton
```

O script atual colocou muitos desses como `Possibly Undocumented Globals`, mas muitos já existem nos stubs. Então a lista `KNOWN_STUB_SYMBOLS` precisa ser ampliada.

---

# Regras de segurança

Mantenha estas regras:

- Não alterar save.
- Não alterar inventário.
- Não alterar flags.
- Não alterar dinheiro.
- Não alterar UI/cena.
- Não abrir popups/browser.
- Não chamar funções descobertas automaticamente.
- Não fazer rede.
- Não ler arquivos externos.
- Não usar brute force agressivo em userdata.
- Todo acesso arriscado deve usar `pcall`.
- O script deve continuar funcionando mesmo se parte do ambiente estiver ausente.
- Reports são evidência para revisão manual, não fonte autoritativa automática para stubs.

Acessar campos/propriedades por nome conhecido via `pcall` é permitido.

Chamar funções continua proibido por padrão, exceto em uma seção opcional com flag explícita desativada por padrão.

---

# Melhorias obrigatórias

## 1. Separar acesso raw e acesso via index

O script atual usa um helper `safe_get` que tenta `rawget` em tabelas e retorna imediatamente. Isso é seguro, mas pode esconder campos expostos por `__index`.

Refatore para ter helpers separados:

```lua
safe_raw_get(value, key)
safe_index_get(value, key)
```

### `safe_raw_get`

- Usar apenas `rawget` quando `value` for tabela.
- Não acionar `__index`.
- Útil para `_G`, tabelas puras e stdlib.

### `safe_index_get`

- Primeiro tenta `safe_raw_get`.
- Se raw value for `nil`, tenta `value[key]` com `pcall`.
- Útil para userdata e objetos MoonSharp/C#.
- Retorna também a origem, quando possível:
  - `"raw"`;
  - `"index"`;
  - `"missing"`;
  - `"error"`.

Exemplo esperado:

```lua
local ok, value, source = safe_index_get(obj, "SomeField")
```

Use `safe_index_get` para userdatas e símbolos MDRG.

Use `safe_raw_get` para tabelas Lua conhecidas quando quiser evitar metamétodo.

---

## 2. Melhorar enumeração de tabelas

O script atual usa `pairs()`. Em Lua 5.2, `pairs()` pode passar por `__pairs`.

Crie duas estratégias:

```lua
raw_table_entries(tbl, limit, context)
pairs_table_entries(tbl, limit, context)
```

E uma configuração:

```lua
local TABLE_ENUM_MODE = "raw" -- "raw" | "pairs"
```

- `"raw"` deve ser o padrão.
- `"pairs"` pode existir como modo mais exploratório.
- Ambas as opções devem usar `pcall`.
- Não quebrar se `next`, `pairs` ou `rawget` estiverem ausentes.

---

## 3. Corrigir `Report:text()` para não modificar o report

O `Report:text()` não deve alterar `self.lines`.

Se houver `self.dropped > 0`, gere uma cópia temporária das linhas e acrescente o aviso apenas na cópia.

Exemplo:

```lua
function Report:text()
  local copy = {}
  for i = 1, #self.lines do
    copy[i] = self.lines[i]
  end

  if self.dropped > 0 then
    copy[#copy + 1] = ""
    copy[#copy + 1] = "Report line limit reached; dropped lines: " .. tostring(self.dropped)
  end

  return table.concat(copy, "\n")
end
```

Evite duplicar avisos quando `Report:text()` for chamado mais de uma vez.

---

## 4. Reduzir fallback de `print` quando `io` estiver ausente

O report mostrou:

```txt
Fallback reason: io table unavailable
```

Então o script imprimiu um report grande no console.

Adicione detecção antecipada:

```lua
local IO_AVAILABLE = type(io) == "table" and type(io.open) == "function"
```

Se `io` não estiver disponível:

- reduzir `MAX_TOTAL_LINES`;
- desativar dumps profundos;
- não dump de `package.loaded`;
- limitar `Callable Inventory`;
- limitar `Global Dump`;
- incluir no report que está em modo console fallback reduzido.

Sugestão:

```lua
local MAX_TOTAL_LINES_FILE = 50000
local MAX_TOTAL_LINES_CONSOLE = 8000

local ENABLE_DEEP_GLOBAL_DUMP = true
local ENABLE_PACKAGE_LOADED_DUMP = false
local ENABLE_FULL_CONSOLE_REPORT = false
```

Comportamento:

- Se `io.open` existe: report completo.
- Se `io.open` não existe: report reduzido por padrão.
- Se `ENABLE_FULL_CONSOLE_REPORT = true`, permitir imprimir completo.

Remova `PRINT_CHUNK_SIZE` se não for usado, ou implemente chunk real por caracteres. Não deixe config morta.

---

## 5. Remover ou limitar dump profundo de `package.loaded`

O report ficou poluído com `package.loaded.string`, `package.loaded.math`, `package.loaded.debug`, etc.

Altere `GLOBAL_DUMP_ROOTS` para não incluir `package` por padrão.

Ou adicione:

```lua
SKIP_DEEP_DUMP_PATHS = {
  ["package.loaded"] = true,
}
```

No report, basta manter `package` no `Top-level Tables Snapshot`.

Não fazer dump recursivo completo de `package.loaded` por padrão.

---

## 6. Criar fallback efetivo para `GameVariables`

O report mostrou:

```txt
GameVariables: missing
gv: userdata <GameVariables>
```

Crie helper:

```lua
get_effective_game_variables()
```

Ele deve tentar, nesta ordem:

1. `_G.GameVariables`;
2. `_G.gv`;
3. opcionalmente `ModUtilities.GetGameVariables()` apenas se `ENABLE_SAFE_CONTEXT_CALLS = true`.

A flag deve existir e estar desativada por padrão:

```lua
local ENABLE_SAFE_CONTEXT_CALLS = false
```

O report deve mostrar:

```txt
GameVariables global: present/missing
gv legacy alias: present/missing
Effective GameVariables source: GameVariables/gv/ModUtilities.GetGameVariables/none
```

Não chamar `ModUtilities.GetGameVariables()` por padrão.

---

## 7. Criar seção `Legacy/Internal Runtime Context`

Adicionar seção:

```txt
## Legacy/Internal Runtime Context
```

Ela deve reportar:

- `gv`;
- `flowchart`;
- possível relação com `GameVariables`;
- possível relação com Fungus;
- `tostring`;
- tipo;
- known field probe básico.

Exemplo esperado:

```txt
gv: userdata <GameVariables>
flowchart: userdata <Main Flowchart (Fungus.Flowchart)>
GameVariables global: missing
Effective GameVariables source: gv
```

Não chamar métodos do `flowchart`.

---

## 8. Criar `Known Field Probe` para userdata

Como metatables retornaram `none`, o script precisa tentar acessar campos/métodos por nomes conhecidos dos stubs.

Adicionar seção:

```txt
## Known Field Probe
```

Criar tabela:

```lua
local USERDATA_KNOWN_FIELD_PROBES = {
  ModUtilities = { ... },
  GameUtilities = { ... },
  UiOverlay = { ... },
  SoundSingleton = { ... },
  ViewSingleton = { ... },
  Item = { ... },
  ItemPrefab = { ... },
  ItemPrefabManager = { ... },
  GameId = { ... },
  Guid = { ... },
  SaveContainer = { ... },
  SaveSingleton = { ... },
  StoryCondition = { ... },
  StoryBotDialogueBranch = { ... },
  StorySingleton = { ... },
  flowchart = { ... },
  gv = { ... },
}
```

Para cada campo:

```lua
local ok, value, source = safe_index_get(userdata, fieldName)
```

Registrar:

```txt
ModUtilities.GetGameVariables = function [source=index]
GameUtilities.WaitForSecondsYield = function [source=index]
gv.money = number 123 [source=index]
```

Não chamar funções retornadas.

### Campos/métodos sugeridos

Use nomes já vistos nos stubs. Comece com uma lista curta e útil.

#### `ModUtilities`

```txt
GetGameVariables
GetNewGuid
CreateItemPrefab
CreateNewItem
CreateNewItemAutoAssignId
GetController
StartCoroutine
StopCoroutine
WaitForSeconds
```

#### `GameUtilities`

```txt
WaitForSecondsYield
AddItemToInventory
FadeToView
MoveToView
FadeOrMoveToView
GetCurrentYearToInteger
```

#### `UiOverlay`

```txt
OpenBrowser
OpenShop
OpenSimplePopup
CloseAll
```

Se alguns nomes não existirem nos stubs atuais, tudo bem: o probe deve registrar missing sem falhar.

#### `GameId`

```txt
__new
CreateVanilla
CreateModded
CreateGeneric
FromShortString
ToString
ToLuaString
ToShortString
```

#### `Item`

```txt
__new
CreateRandomItem
CreateDefaultItemForLive2DController
GetName
GetDescription
GetCount
GetPrice
GetItemPrefab
IsEquipped
CanBeUsed
CanBeUnpacked
GetQualityString
ColorSlotId
```

#### `ItemPrefab`

```txt
__new
CreateInstance
ColorSlotId
ToLuaString
Clone
```

#### `ItemPrefabManager`

```txt
GetItemPrefab
TryGetItemPrefab
```

#### `SaveContainer`

```txt
HasGlobalFlag
AddGlobalFlag
TryGetGlobalFlag
HasAchievement
UnlockAchievement
RemoveAchievement
GetPercentageOfSeenStoryText
```

#### `SaveSingleton`

```txt
GetSaveContainerAsString
SaveAllChanges
ResetAllData
TryMakeAutoSave
```

#### `flowchart`

```txt
GetName
IsActive
HasBlock
ExecuteBlock
StopBlock
GetIntegerVariable
GetStringVariable
GetBooleanVariable
SetIntegerVariable
SetStringVariable
SetBooleanVariable
```

#### `gv`

```txt
time
money
playerName
botName
stage
CurrentHorniness
Mood
Health
MentalHealth
Stamina
Satiation
GetCumPercent
CheckFlag
GetFlagSetCount
TimeInDay
TimeToHourString
AddMoney
ForceTakeMoney
SetPlayerName
SetBotName
```

A presença de métodos mutantes deve ser registrada, mas eles não devem ser chamados.

---

## 9. Criar `Enum Value Probe` para enums userdata

O report encontrou enums como userdata, mas não conseguiu enumerar valores.

Adicionar seção:

```txt
## Enum Value Probe
```

Criar tabela:

```lua
local ENUM_VALUE_PROBES = {
  ControllerEnum = {
    "NoScene",
    "Missionary",
    "Doggy",
    "Blowjob",
    "Cowgirl",
    "Interaction",
    "Shower",
  },

  CheckType = {
    "Full",
    "Start",
    "End",
  },

  FishingBaitType = {
    "NoBait",
    "WormBait",
    "InsectBait",
    "MeatBait",
    "FishBait",
    "LiveFishBait",
    "PlantBait",
    "CrustaceanBait",
    "MolluskBait",
    "MagnetBait",
  },

  ItemCategory = {
    "Other",
    "Modules",
    "Clothing",
    "Food",
    "FoodCookedDish",
    "Usable",
    "Package",
    "Meds",
    "Room",
    "AnonEquip",
    "Fish",
    "CookingIngredient",
    "FishingTrash",
    "Soap",
  },

  ItemEnum = {
    "None",
    "CatEars",
    "BasicArmL",
    "BasicArmR",
    "BasicLegL",
    "BasicLegR",
    "DefaultSkin",
    "DefaultHair",
    "DefaultEyes",
  },

  EdibleTypeEnum = {
    "Other",
    "Meat",
    "Fish",
    "MainVegetable",
    "FlavourVegetable",
    "Bean",
    "Pasta",
    "Bread",
    "Beverage",
    "Dish",
  },

  FinishedType = {
    "Normal",
    "Stopped",
  },

  FishingCatchBehaviourType = {
    "Normal",
    "Floater",
    "Fighter",
    "Rock",
    "Sinker",
  },

  TimeCheckType = {
    "Before",
    "After",
  },

  StoryBotContainerTypeEnum = {
    "Normal",
  },
}
```

Use somente nomes confirmados ou prováveis dos stubs atuais. Se tiver dúvida sobre algum valor, tudo bem testar via `pcall`, mas não inventar documentação a partir disso sem reportar como “probe attempt”.

Para cada valor:

```lua
local ok, value, source = safe_index_get(enumUserdata, valueName)
```

Registrar:

```txt
ControllerEnum.Missionary = <...> [present]
ControllerEnum.NoScene = <missing>
```

Não chamar valores se retornarem função.

---

## 10. Melhorar `Enum-like Tables / Constants`

O report classificou `ColorSlot` e `GlobalFlag` como enum-like por heurística de nome, mas eles são classes/tipos, não enums.

Ajustar heurística:

- Se o valor é `userdata`, só tratar como enum-like se:
  - o nome está em `ENUM_PRIORITY_NAMES`; ou
  - o nome termina explicitamente com `Enum`, `Type`, `Status`, `Selection`; ou
  - o nome aparece em `ENUM_VALUE_PROBES`.

Não classificar como enum-like apenas por conter `Slot`, `State` ou `Flag`, porque isso gera falso positivo (`ColorSlot`, `GlobalFlag`, `ItemSlot`).

Para tabelas Lua, a heurística por scalar-majority ainda pode existir.

Alterar wording:

```txt
Enum-like Userdata Probe
```

em vez de fingir que é tabela enumerável.

---

## 11. Ampliar `KNOWN_STUB_SYMBOLS`

Atualize `RUNTIME_STUB_SYMBOLS` / `KNOWN_STUB_SYMBOLS` para incluir símbolos que o report mostrou como presentes e que provavelmente já estão nos stubs.

Adicionar pelo menos:

```txt
AllowedModifiers
AtLeastOneBoolVariableTrueRequirement
CommonAllowedModifiersEnum
CookingSong
CookingSongRuntimeData
EdibleItemNutritionProfile
EdibleTypeEnum
FinishedType
FishingBaitItemPrefabData
FishingCatchBehaviourType
FishingRodItemPrefabData
FishItemPrefabData
FishPreferences
GlobalFlag
ItemModifiableVariableFactory
ItemModifiableVariablesRequirement
ItemScopeCondition
ItemScopeConditionAlwaysTrueCondition
ItemScopeConditionCustom
ItemScopeConditionSpecialVariable
ItemSubCategory
Live2DControllerSingleton
NewsId
NoteButtonTypeEnum
R
Recipe
Result
Shop
ShopItem
ShopManager
SingleArgumentComparators
SlotManager
SoundSingleton
StoryAutoBranch
StoryBlockTarget
StoryBotContainerTypeEnum
StoryBranchTarget
StoryEnumeratorTarget
StoryLocalizedConversationBranchTarget
StoryMenuBranch
StorySingleton
SusArea
SusModifier
TimeCheckType
TwoArgumentComparators
ViewSingleton
gv
flowchart
pack
unpack
```

Depois disso, `Possibly Undocumented Globals` deve ficar mais útil.

---

## 12. Melhorar API Safety Map e falsos positivos

O report marcou:

```txt
string.startsWith : dangerous-name
```

Isso é falso positivo causado por substring `Start`.

Ajuste:

- Se o path começa com `string.`, `math.`, `os.`, `json.`, não aplicar `DANGEROUS_CALL_SUBSTRINGS`.
- `string.startsWith`, `string.endsWith`, `string.contains` devem ser read-only.
- `print` deve ser classificado como `Output/Context-dependent` ou `Context-dependent`, não `Unknown`.
- `error` pode ser `Dangerous/Control-flow` ou `Context-dependent`, não simplesmente `Unknown`.
- `collectgarbage` pode ser `Runtime-affecting`, ou `Context-dependent`.
- Se adicionar novas categorias, mantenha o report legível.

Também adicionar motivo de classificação.

Mudar:

```lua
classify_api_safety(path)
```

para retornar:

```lua
category, reason
```

Exemplo no report:

```txt
GameVariables.AddMoney : Save-changing [reason=root GameVariables + Add]
BrowserPopup.ChangeWebsite : UI-changing [reason=root BrowserPopup + ChangeWebsite]
GameId.ToString : Read-only [reason=ToString]
string.startsWith : Read-only [reason=stdlib read-only prefix]
```

---

## 13. Adicionar blocos machine-readable

Adicionar blocos fáceis de parsear por ferramenta futura.

Exemplo:

```txt
BEGIN_MDRG_PROBE_SYMBOLS
symbol|GameVariables|nil|missing
symbol|gv|userdata|present
symbol|flowchart|userdata|present
symbol|ModUtilities|userdata|present
END_MDRG_PROBE_SYMBOLS
```

```txt
BEGIN_MDRG_PROBE_CALLABLES
callable|json.parse|function|Read-only|known-stub-symbol
callable|string.startsWith|function|Read-only|table-field
END_MDRG_PROBE_CALLABLES
```

```txt
BEGIN_MDRG_PROBE_FIELDS
field|gv|money|number|present
field|GameUtilities|WaitForSecondsYield|function|present
END_MDRG_PROBE_FIELDS
```

Esses blocos devem ser curtos e respeitar limites.

Não implementar o ingester agora. Só gerar blocos parseáveis.

---

## 14. Adicionar modo `safe` e `deep`

Adicionar config:

```lua
local PROBE_MODE = "safe" -- "safe" | "deep"
```

### Modo `safe`

Padrão.

- Menos linhas.
- Sem dump profundo de `package.loaded`.
- Field probe limitado.
- Enum probe limitado.
- `TABLE_ENUM_MODE = "raw"`.
- Fallback console reduzido.

### Modo `deep`

Manual.

- Mais campos por userdata.
- Mais callables.
- Mais enum values.
- Pode usar `pairs` se configurado.
- Pode fazer dump global mais extenso.
- Ainda não chama funções descobertas.

Não tornar `deep` perigoso. Ele só deve ser mais verboso.

---

## 15. Melhorar seções existentes

### `Known Stub Symbols Present/Missing`

Distinguir:

```txt
Runtime symbol expected
Legacy/internal runtime alias
Stub-only alias
Context-dependent symbol
Missing in this execution context
```

`GameVariables` missing não deve ser tratado como erro se `gv` existe.

### `Possibly Undocumented Globals`

Depois de ampliar `KNOWN_STUB_SYMBOLS`, ela deve mostrar apenas coisas realmente novas.

### `Errors / Access Failures`

Manter, mas também adicionar contagem:

```txt
Total access failures: 0
```

### `Output`

Quando cair em console fallback, explicar:

```txt
io table unavailable; report printed in reduced console mode.
```

---

# Não fazer nesta etapa

Não fazer agora:

- Não alterar stubs `.d.lua`.
- Não alterar `data/*.json`.
- Não alterar `README.md`.
- Não criar `tools/ingest_probe_report.py`.
- Não criar `API_INDEX.md`.
- Não criar `API_SAFETY.md`.
- Não rodar o jogo.
- Não tentar chamadas state-changing para testar.
- Não adicionar dependências externas.

---

# Validação estática sugerida

Depois de editar o script, rode ou sugira estes checks:

```powershell
rg -n "safe_raw_get|safe_index_get|Known Field Probe|Enum Value Probe|Legacy/Internal Runtime Context|BEGIN_MDRG_PROBE_SYMBOLS|PROBE_MODE" examples/mdrg_env_probe.lua
rg -n "io.open|package.loaded|MAX_TOTAL_LINES_CONSOLE|ENABLE_FULL_CONSOLE_REPORT" examples/mdrg_env_probe.lua
rg -n "AddGlobalFlag|ForceTakeMoney|ChangeWebsite|OpenBrowser|SaveAllChanges|ResetAllData|CreateNewItemAutoAssignId" examples/mdrg_env_probe.lua
git diff -- examples/mdrg_env_probe.lua
```

Se esses nomes perigosos aparecerem, eles devem estar apenas em listas de skip/probe/string, nunca sendo chamados diretamente.

---

# Entrega esperada

Ao final, entregue:

1. Resumo curto das melhorias feitas.
2. Lista dos blocos/seções novas do report.
3. Explicação de como o script agora lida com `userdata`.
4. Explicação de como o script agora lida com `gv`/`flowchart`.
5. Explicação de como o script limita fallback por `print`.
6. Confirmação de que nenhuma função descoberta automaticamente é chamada.
7. `git diff -- examples/mdrg_env_probe.lua`.

Implemente as melhorias em `examples/mdrg_env_probe.lua`.

Mantenha o código em Lua compatível com MoonSharp/Lua 5.2, sem dependências externas.

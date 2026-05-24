# Prompt para Codex — MDRG Debug Plugin Callback/Lifetime v2

Você está trabalhando no repositório atual do addon LuaLS MDRG/MoonSharp.

Já existem:

```txt
examples/mdrg_env_probe.lua
extern/mdrg_safe_io.d.lua
library/mdrg_safe_io.d.lua
tools/probe_runtime_index.py
luas/
library/*.d.lua
```

O projeto já gerou reports runtime em contextos diferentes:

- `LuaExec`/exec depois de save/cena;
- mod real carregado na inicialização;
- mod real com safe IO ativo;
- contexto com `gv` e `flowchart`;
- contexto com `CurrentModGuid`;
- contexto sem `GameVariables`, `gv` e `flowchart`.

Agora quero consolidar e avançar o sistema de diagnóstico.

## Objetivo geral

Criar/melhorar uma infraestrutura de debug para MDRG/MoonSharp que:

1. Classifique o contexto/lifetime do script atual.
2. Compare reports de contextos diferentes.
3. Catalogue callbacks/closures Lua aceitos pelas APIs dos stubs.
4. Analise scripts reais em `luas/`.
5. Crie um helper opt-in para rodar probe dentro de callbacks/closures.
6. Crie um debug plugin/mod opt-in que registra itens/casos de teste para disparar callbacks reais.
7. Gere reports de callback/lifetime.
8. Mantenha tudo read-only por padrão.
9. Não altere stubs gerados manualmente.
10. Não assuma que `OnSaveLoad` existe sem evidência.

---

# Modelo mental obrigatório: lifetime/context

Adicione este modelo nas docs e use-o no probe.

## 1. Registration-time context / OnGameStart-like

É o momento em que o mod é carregado e registra coisas.

Normalmente disponível:

```txt
CurrentModGuid
ModUtilities
GameUtilities
Item
ItemPrefab
ItemPrefabManager
GameId
Guid
ItemCategory
EdibleItemPrefabData
EdibleTypeEnum
SaveContainer
SaveSingleton
StorySingleton
safe IO, se injetado
```

Normalmente ausente:

```txt
GameVariables
gv
flowchart
contexto de save
contexto de cena/Fungus
argumentos runtime de callbacks
```

Uso principal:

```txt
criar ItemPrefab
registrar itens
registrar shops
registrar callbacks
registrar condições
registrar assets
```

Ausência de `GameVariables`, `gv` ou `flowchart` nesse contexto **não significa ausência global da API**. Significa que a API não está disponível nesse lifetime.

## 2. Runtime/save context

É quando o jogo já tem save/cena/sistemas vivos.

Pode aparecer:

```txt
GameVariables
gv
flowchart
variáveis da cena
estado do jogador
estado do mundo
```

Uso principal:

```txt
ler contexto vivo
inspecionar save/cena
verificar flags
testar estado
```

## 3. LuaExec / scene / Fungus context

Reports via LuaExec depois de save/cena mostraram:

```txt
CurrentModGuid: missing
GameVariables: missing
gv: present as userdata <GameVariables>
flowchart: present as userdata <Main Flowchart (Fungus.Flowchart)>
io: may be present if safe IO is injected
Effective GameVariables source: gv
```

Interpretação:

```txt
Contexto provável: LuaExec / console / script injetado manualmente / contexto Fungus/cena.
```

Esse contexto é útil para observar `gv`, `flowchart`, dados de cena e save. Mas não deve ser tratado como mod startup normal.

## 4. Callback/closure invocation context

É quando o jogo chama uma closure Lua registrada anteriormente.

Exemplo:

```lua
local ntf = function(item, nutritionProfile)
  nutritionProfile.Satiation.Value = 0.1
end

local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Beverage, ntf)
```

Nesse caso, `OnGameStart` só registra o callback. O contexto interessante aparece quando o jogo chama `ntf`.

Regra central:

```txt
Treat every Lua callback/closure accepted by the MDRG API as a possible lifecycle boundary.
```

---

# Regras do projeto

Respeite estas regras:

- Não edite `library/*.d.lua` manualmente.
- Se precisar ajustar safe IO, edite `extern/mdrg_safe_io.d.lua`.
- `library/mdrg_safe_io.d.lua` deve ser cópia gerada de `extern/mdrg_safe_io.d.lua`.
- Não recrie pasta `module/`.
- Não remova arquivos raw antigos de `luas/`, `dump/`, `rawdump/` ou similares.
- Não altere stubs gerados diretamente.
- Não altere `data/*.json` sem necessidade clara.
- Não rode o jogo.
- LuaLS pode não estar no PATH; isso deve ser aviso, não falha fatal.
- `validate_addon.py --health` pode falhar por arquivos antigos em `luas/` ainda rastreados; não corrija isso removendo arquivos sem pedido do usuário.
- Não chamar funções descobertas automaticamente.
- Não chamar funções de save/UI/contexto por padrão.
- Não criar evento real em C#/MelonLoader nesta tarefa.
- Não criar bridge nova de eventos nesta tarefa.
- Não assumir que `OnSaveLoad` existe.

---

# Parte A — Melhorar `mdrg_env_probe.lua`

Atualize `examples/mdrg_env_probe.lua` sem reescrever do zero.

## A1. Classificação automática de contexto

Criar função:

```lua
detect_execution_context()
```

Ela deve usar sinais simples:

```txt
CurrentModGuid present
GameVariables present
gv present
flowchart present
io present
io.open present
io.popen present
io.tmpfile present
ModUtilities present
GameUtilities present
SAFE_IO_EXPECTED
PROBE_CONTEXT_LABEL
```

Classificações sugeridas:

```txt
mod-start
mod-with-safe-io-start
luaexec-scene-context
luaexec-with-safe-io-scene-context
save-aware-context
unknown-plugin-context
unknown
```

Heurísticas:

```txt
CurrentModGuid present + gv missing + flowchart missing:
  likely mod-start / OnGameStart-like context.

CurrentModGuid present + io.open present + gv missing + flowchart missing:
  likely mod-with-safe-io-start.

CurrentModGuid missing + gv present + flowchart present:
  likely luaexec-scene-context.

CurrentModGuid missing + gv present + flowchart present + io.open present:
  likely luaexec-with-safe-io-scene-context.

GameVariables present:
  likely save-aware context.

gv present:
  likely legacy/internal GameVariables alias context.

flowchart present:
  likely Fungus/scene script context.
```

Não reportar como certeza absoluta; usar “likely”.

## A2. Configuração manual

No topo do script:

```lua
local PROBE_CONTEXT_LABEL = "auto" -- examples: "mod-start", "mod-safeio-start", "luaexec-scene", "luaexec-safeio-scene"
local SAFE_IO_EXPECTED = false
local ENABLE_SAFE_CONTEXT_CALLS = false
```

`ENABLE_SAFE_CONTEXT_CALLS` deve continuar `false` por padrão.

Não chamar, por padrão:

```txt
ModUtilities.GetGameVariables()
BrowserPopup.ChangeWebsite()
UiOverlay.OpenBrowser()
SaveSingleton.SaveAllChanges()
SaveContainer.AddGlobalFlag()
GameVariables.AddMoney()
GameVariables.ForceTakeMoney()
Item.Equip()
Item.Consume()
```

Se algum dia for ativado manualmente, as chamadas devem ficar em seção própria, lista branca e `pcall`.

## A3. Seção `Execution Context Classification`

Adicionar ao report:

```txt
## Execution Context Classification
```

Exemplo:

```txt
Detected context: mod-with-safe-io-start
Confidence: medium
Reason:
- CurrentModGuid present
- io.open present
- GameVariables missing
- gv missing
- flowchart missing
Interpretation:
- This looks like a real mod script running during initial mod/game startup.
- Save/Fungus context is not available yet.
- Safe IO appears injected by LuaPatch/plugin.
```

Para LuaExec:

```txt
Detected context: luaexec-scene-context
Reason:
- CurrentModGuid missing
- gv present
- flowchart present
Interpretation:
- This looks like manual/plugin execution in a scene/Fungus context.
- It should not be treated as normal mod startup.
```

## A4. Seção `Probe Contamination / Injection Context`

Adicionar/revisar seção:

```txt
## Probe Contamination / Injection Context
```

Reportar:

```txt
io present: yes/no
io.open present: yes/no
io.read present: yes/no
io.write present: yes/no
io.popen present: yes/no
io.tmpfile present: yes/no
safe_io_expected: yes/no
safe_io_likely_injected: yes/no/unknown
native_mdrg_io: unknown
CurrentModGuid present: yes/no
GameVariables present: yes/no
gv present: yes/no
flowchart present: yes/no
ModUtilities present: yes/no
GameUtilities present: yes/no
transport: file/console fallback
```

Se `io` existir, não assumir que é nativo. Escrever:

```txt
io is present in this runtime. If running through LuaPatch/safe IO plugin, treat this as injected bridge API, not native MDRG API.
```

## A5. Machine-readable environment block

Adicionar:

```txt
BEGIN_MDRG_PROBE_ENVIRONMENT
context_label|auto
detected_context|mod-with-safe-io-start
context_confidence|medium
safe_io_expected|false
io_present|true
io_open_present|true
io_popen_present|true
io_tmpfile_present|true
current_mod_guid_present|true
gamevariables_present|false
gv_present|false
flowchart_present|false
effective_gamevariables_source|none
transport|file
END_MDRG_PROBE_ENVIRONMENT
```

## A6. Corrigir Safe Validations

Evitar repetição de:

```txt
MISS _G.GameVariables missing
```

Usar:

```txt
GameVariables global: missing
Effective GameVariables source: none
Reason: startup/mod context likely before save is available
```

Se `gv` existir:

```txt
GameVariables global: missing
gv alias: present
Effective GameVariables source: gv
Safe validation will use gv for read-only probes.
```

Se `GameVariables` existir:

```txt
Effective GameVariables source: GameVariables
```

## A7. Lifecycle Availability Matrix

Adicionar:

```txt
## Lifecycle Availability Matrix
```

Exemplo em mod startup:

```txt
Current context:
- CurrentModGuid: present
- GameVariables: missing
- gv: missing
- flowchart: missing
- io.open: present
- ModUtilities.GetGameVariables: present
- ModUtilities.StartCoroutine: present
- ModUtilities.WaitForSeconds: present

Likely phase:
- Mod startup / OnGameStart-like phase.
- Save/Fungus context not available yet.
```

Exemplo em LuaExec:

```txt
Likely phase:
- Manual LuaExec / scene/Fungus phase.
- Save/Fungus objects are available through gv/flowchart.
- Mod-scoped CurrentModGuid may be absent.
```

## A8. Lifecycle / Event Clues

Adicionar seção:

```txt
## Lifecycle / Event Clues
```

Não chamar nada.

Listar evidências:

```txt
CurrentModGuid present: means mod script context is active.
Path contains OnGameStart: if available through debug/error paths, suggests an OnGameStart script hook.
ModUtilities.StartCoroutine present: can be used for deferred probing in a separate opt-in script.
ModUtilities.WaitForSeconds present: can be used for coroutine yielding.
ModUtilities.GetGameVariables present: possible context-dependent read, not called by default.
StorySingleton.GetFlowchart present: possible context-dependent read, not called by default.
```

Não afirmar que `OnSaveLoad` existe.

## A9. Known Field Probe não chama funções

Garantir que `Known Field Probe` apenas faça index:

```lua
local ok, value, source = safe_index_get(obj, fieldName)
```

Nunca:

```lua
value()
obj[fieldName]()
```

Se retornar função, apenas reportar:

```txt
field|GameUtilities|WaitForSecondsYield|function|present|source=index|not-called
```

Adicionar nota no report:

```txt
Known Field Probe only indexes fields/properties. Functions returned by field probing are never invoked.
```

## A10. Enum Value Probe cauteloso

Para enum `userdata`, tentar apenas:

```lua
safe_index_get(enumObj, valueName)
```

Não chamar nada.

Usar linguagem cautelosa:

```txt
ControllerEnum.Missionary: present via index access
ControllerEnum.NoScene: missing
```

Não dizer que a enum inteira foi confirmada.

## A11. Corrigir enum-like false positives

Para `userdata`, classificar como enum-like apenas se:

```txt
- nome está em ENUM_VALUE_PROBES; ou
- nome está em ENUM_PRIORITY_NAMES; ou
- nome termina com Enum; ou
- nome termina com Type; ou
- nome termina com Status; ou
- nome termina com Selection.
```

Não usar:

```txt
Slot
Flag
State
Category
```

isoladamente para `userdata`.

Isso evita falsos positivos como:

```txt
ColorSlot
GlobalFlag
ItemSlot
```

Para tabela Lua, scalar-majority pode continuar.

## A12. Separar enum candidates não confirmados

Reports mostram falhas consistentes para:

```txt
CheckType.Equal
CheckType.Greater
CheckType.Less
CheckType.NotEqual
FishingBaitType.None
FishingBaitType.Worm
ItemCategory.Misc
SlotType.Normal
```

Mover para:

```lua
ENUM_VALUE_CANDIDATES_UNCONFIRMED = {
  ...
}
```

No report:

```txt
Unconfirmed enum value candidates:
- CheckType.Equal: access failed
```

Manter como confirmed-by-probe:

```txt
ControllerEnum.NoScene
ControllerEnum.Interaction
ControllerEnum.Missionary
CommonAllowedModifiersEnum.None
CommonAllowedModifiersEnum.FishingRod
EdibleTypeEnum.Other
EdibleTypeEnum.Meat
EdibleTypeEnum.Fish
EdibleTypeEnum.Dish
FishingCatchBehaviourType.Normal
FishingCatchBehaviourType.Fighter
FishingCatchBehaviourType.Floater
FishingCatchBehaviourType.Rock
FishingCatchBehaviourType.Sinker
ItemCategory.Clothing
ItemCategory.Food
ItemCategory.Room
ScratchTextureType.Universal
```

Não alterar stubs com base nisso ainda.

## A13. Safe IO como bridge sensível

Tratar `io` como bridge externa e potencialmente sensível.

Classificar:

```txt
io.open: State-changing / file-write-capable
io.write: State-changing / file-write-capable
io.read: File-read-capable
io.popen: Dangerous/Process-capable, even if sandboxed
io.tmpfile: File-capable
```

Não testar `io.popen` chamando a função.

## A14. Limpar `Possibly Undocumented Globals`

Confirmar que `KNOWN_STUB_SYMBOLS` inclui símbolos já conhecidos para evitar falso “undocumented”:

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

Se algum não existir nos stubs, não adicionar como stub. Isso é só lista do probe.

## A15. Notas finais

Adicionar notas:

```txt
- CurrentModGuid present usually indicates real mod script context.
- CurrentModGuid missing + gv/flowchart present usually indicates LuaExec/Fungus/scene context.
- GameVariables missing during mod startup does not mean the API is absent; it may mean save context is not loaded.
- safe IO is plugin-provided bridge API and should not be treated as native MDRG.
- Presence of a callable does not mean it is safe to call.
- Absence in OnGameStart does not mean absence in every context.
- Many APIs are only meaningful later, during runtime or inside callbacks.
```

---

# Parte B — Melhorar `tools/probe_runtime_index.py`

## B1. Parsing com prefixos de console

Garantir que consiga limpar prefixos antes de detectar blocos:

```txt
[LuaPatch] [Lua:exec.lua] BEGIN_MDRG_PROBE_SYMBOLS
[19:07:14.020] [LuaPatch] [Lua:exec.lua] BEGIN_MDRG_PROBE_SYMBOLS
```

Criar função pequena:

```python
def strip_log_prefix(line: str) -> str:
    ...
```

Reconhecer:

```txt
BEGIN_MDRG_PROBE_SYMBOLS
BEGIN_MDRG_PROBE_ALIASES
BEGIN_MDRG_PROBE_CALLABLES
BEGIN_MDRG_PROBE_FIELDS
BEGIN_MDRG_PROBE_ENUM_VALUES
BEGIN_MDRG_PROBE_ENVIRONMENT
BEGIN_MDRG_CALLBACK_CONTEXT
BEGIN_MDRG_CALLBACK_ARGS
BEGIN_MDRG_CALLBACK_FIELDS
```

Manter compatibilidade com reports antigos.

## B2. Armazenar environment no índice

Quando processar report novo, salvar algo como:

```json
{
  "environment": {
    "detected_context": "mod-with-safe-io-start",
    "context_label": "auto",
    "safe_io_expected": false,
    "io_present": true,
    "io_open_present": true,
    "io_popen_present": true,
    "current_mod_guid_present": true,
    "gamevariables_present": false,
    "gv_present": false,
    "flowchart_present": false,
    "effective_gamevariables_source": "none"
  }
}
```

Se o bloco não existir, inferir a partir de símbolos antigos.

## B3. Comparação simples entre reports

Adicionar comando ou função:

```powershell
python tools\probe_runtime_index.py --compare report-a.txt report-b.txt
```

Comparar:

```txt
CurrentModGuid present/missing
GameVariables present/missing
gv present/missing
flowchart present/missing
io present/missing
io.open present/missing
io.popen present/missing
detected_context
effective_gamevariables_source
symbols present only in A/B
field probes present only in A/B
enum values present only in A/B
callback contexts only in A/B
```

Gerar saída simples, texto ou JSON, sem ferramenta gigante.

---

# Parte C — Catalogar callbacks/closures nos stubs

Criar ou atualizar:

```txt
tools/catalog_lua_callbacks.py
```

Procurar nos stubs:

```txt
---@param ... fun(...)
---@field ... fun(...)
---@return ... fun(...)
```

Ignore `---@overload fun(`, mas pode conter clousures nos parametros a func que recebeu oveload

Também procurar `fun(` em geral.

Gerar:

```txt
analysis/lua_callback_contexts.md
```

Para cada callback:

```txt
arquivo
linha
classe/função/campo dono
nome do parâmetro ou field
assinatura da closure
tipos dos argumentos
tipo de retorno
possível contexto
risco provável
se aparece em scripts reais de luas/
```

## C1. Lista detalhada de callbacks por domínio

Procure especialmente:

### Itens / comida / prefabs

```txt
EdibleItemPrefabData.CreateInstance(..., nutritionProfileFiller)
EdibleItemPrefabData.CreateInstance(..., getNutritionProfile)
ItemPrefab.OnUse
ItemPrefab.OnUnpack
ItemPrefab.SpecialEffectAction
ItemPrefab.RandomItemPostProcessing
ItemPrefab.ItemModiferAdditionFunction
ItemPrefab.FillGameStatsModifiersAction
ItemPrefab.CustomShaderMaterialPostProcessing
ItemScopeConditionCustom / conditionFunc
ShopItem callbacks como OnPaid / OnNotBuy / OnNoMoney
```

Prioridade alta:

```txt
EdibleItemPrefabData.CreateInstance(EdibleTypeEnum, fun(item: Item, nutritionProfile: EdibleItemNutritionProfile))
```

### Story / diálogo / condições

```txt
StoryCondition.Lua
StoryCondition.Delegate
StoryAutoBranch
StoryMenuBranch
StoryBotDialogueBranch
Flowchart/Fungus-related callbacks
actions OnActivateAction
onFinished callbacks
enumeratorGenerator fun(): IEnumerator
condition fun(): boolean
```

### UI / popups / browser

```txt
afterClose
OnLinkClicked
yesaction
noaction
okaction
OnPicked
onFinished
finishFunc
after
loadingCreationFunc
boughtaction
noaction
nomoneyaction
```

### Cooking/minigame

```txt
CookingSong.RuntimeDataGenerator
CookingSong.IsUnlockedFunc
CookingSongRuntimeData_Builder.ChannelToNotes buttonDeterminer
createDishItemFunc
```

### Unity/helpers

```txt
parameterGetter
ColorExtractionFunc
ParticleSystem action
View callbacks
Texture/Sprite conversion functions
```

---

# Parte D — Analisar `luas/`

Ler a pasta `luas/`, se existir, especialmente:

```txt
foods.lua
clothes.lua
outros scripts de mods extraídos
```

Procurar:

```txt
function(...)
(function(...)
= function(...)
CreateInstance(... function
.OnUse = function
.OnUnpack = function
.SpecialEffectAction = function
.RandomItemPostProcessing = function
EdibleData = (function()
NutritionProfile
Satiation
ModUtilities.CreateItemPrefab
ModUtilities.CreateNewItemAutoAssignId
AddSingleBuyItemToShop
```

Criar seção em:

```txt
analysis/lua_callback_contexts.md
```

ou arquivo dedicado:

```txt
analysis/callback_debug_cases.md
```

Exemplo:

```md
### foods.lua

Observed pattern:
- `EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Beverage, ntf)`
- `ntf(item, nutritionProfile)`
- callback mutates `nutritionProfile.Satiation.Value`

Inferred callback context:
- food/beverage nutrition profile filler;
- executed after registration;
- receives runtime objects as arguments.
```

Não modificar `luas/`.

---

# Parte E — Callback probe helper

Criar:

```txt
examples/mdrg_callback_context_probe.lua
```

Ou, se fizer sentido:

```txt
examples/callback_debug/mdrg_callback_context_probe.lua
```

## E1. Uso esperado

Exemplo:

```lua
local ntf = MDRG_CALLBACK_PROBE.wrap(
  "EdibleItemPrefabData.NutritionProfileFiller",
  function(item, nutritionProfile)
    nutritionProfile.Satiation.Value = 0.1
  end,
  { "item", "nutritionProfile" }
)
```

## E2. Configuração

No topo:

```lua
local ENABLE_CALLBACK_PROBE = false
local CALLBACK_PROBE_ONCE_PER_CONTEXT = true
local CALLBACK_PROBE_MAX_CALLS = 10
local CALLBACK_PROBE_DEEP_ARGS = false
local CALLBACK_PROBE_COMPARE_BEFORE_AFTER = false
local CALLBACK_PROBE_CONTEXT_LABEL = "auto"
```

Por padrão:

```txt
ENABLE_CALLBACK_PROBE = false
```

## E3. Wrapper seguro

O wrapper deve:

1. registrar contexto antes;
2. registrar argumentos;
3. chamar função original;
4. registrar contexto depois, se configurado;
5. preservar retornos;
6. rethrow de erros;
7. não engolir erro;
8. não alterar comportamento esperado;
9. não chamar callbacks por conta própria.

Conceito:

```lua
local function probe_wrap(callbackName, fn, argNames)
  return function(...)
    local args = { ... }

    callback_probe(callbackName, args, argNames, "before")

    local results = { pcall(fn, ...) }
    local ok = results[1]

    callback_probe(callbackName, args, argNames, "after")

    if not ok then
      local err = results[2]
      error(err)
    end

    table.remove(results, 1)
    return unpack(results)
  end
end
```

Adaptar para Lua 5.2/MoonSharp. `unpack` pode estar global ou em `table.unpack`.

## E4. Coleta dentro de callback

Coletar:

```txt
callback name
phase: before/after/error
call count
timestamp
CurrentModGuid present/missing
GameVariables present/missing
gv present/missing
flowchart present/missing
io present/missing
io.open present/missing
detected execution context
effective GameVariables source
argument names
argument types
argument tostring
argument metatable presence
safe field probe dos argumentos
```

Para `nutritionProfile`, tentar:

```txt
Satiation
Health
MentalHealth
Stamina
```

Dentro de cada um:

```txt
Value
MinValue
MaxValue
```

O probe não deve modificar esses campos.

Para `item`, tentar indexar sem chamar:

```txt
GetName
GetDescription
GetCount
GetPrice
GetItemPrefab
IsEquipped
CanBeUsed
CanBeUnpacked
```

## E5. Callback report

Gerar:

```txt
callback-report-YYYYMMDD-HHMMSS.txt
```

ou:

```txt
report-YYYYMMDD-HHMMSS-callbacks.txt
```

Formato:

```txt
# MDRG Callback Context Report

## Callback Invocation
name: EdibleItemPrefabData.NutritionProfileFiller
phase: before
call_count: 1

## Runtime Context
CurrentModGuid: present
GameVariables: missing
gv: missing/present
flowchart: missing/present
io.open: present/missing
detected_context: callback-invocation
effective_gamevariables_source: ...

## Arguments
arg1 item: userdata <...>
arg2 nutritionProfile: userdata <...>

## Argument Field Probe
nutritionProfile.Satiation: userdata
nutritionProfile.Satiation.Value: number
```

Machine-readable:

```txt
BEGIN_MDRG_CALLBACK_CONTEXT
callback|EdibleItemPrefabData.NutritionProfileFiller
phase|before
call_count|1
current_mod_guid_present|true
gamevariables_present|false
gv_present|false
flowchart_present|false
io_open_present|true
detected_context|callback-invocation
END_MDRG_CALLBACK_CONTEXT

BEGIN_MDRG_CALLBACK_ARGS
arg|item|userdata|<userdata: ...>
arg|nutritionProfile|userdata|<userdata: ...>
END_MDRG_CALLBACK_ARGS

BEGIN_MDRG_CALLBACK_FIELDS
field|nutritionProfile|Satiation|userdata|present
field|nutritionProfile.Satiation|Value|number|present|0.1
END_MDRG_CALLBACK_FIELDS
```

---

# Parte F — Debug plugin/mod opt-in

Criar exemplo de debug mod/plugin em `examples/`.

Sugestão:

```txt
examples/callback_debug_mod/
├── README.md
├── debug_callback_mod.lua
├── mdrg_callback_context_probe.lua
└── generated_cases/
    ├── food_nutrition_probe.lua
    ├── item_on_use_probe.lua
    ├── item_on_unpack_probe.lua
    └── story_condition_probe.lua
```

Não precisa implementar todos os casos se ficar grande. Priorize comida/nutrition.

## F1. Objetivo

Durante registration-time / OnGameStart-like:

1. criar itens/prefabs de debug;
2. registrar callbacks instrumentados;
3. adicionar itens a shop de debug ou shop existente;
4. documentar como testar manualmente;
5. gerar reports quando o jogo executar os callbacks.

## F2. Caso principal — food nutrition profile callback

Criar item de debug baseado em mod real:

```lua
local itemprefab0 = ModUtilities.CreateItemPrefab()
itemprefab0.Name = 'Debug Callback Beverage'
itemprefab0.Description = 'Debug item used to probe EdibleItemPrefabData nutrition callback.'
itemprefab0.Price = 1
itemprefab0.IsIllegal = false
itemprefab0.HasQuality = false
itemprefab0.ThrowingOutForbidden = false
itemprefab0.IsStackable = true
itemprefab0.Category = ItemCategory.Food
itemprefab0.CanChangeColor = false
itemprefab0.ColorSlots = {}
itemprefab0.Partners = {}
itemprefab0.ScratchType = ScratchTextureType.Universal
itemprefab0.SusModifiers = {}

local ntf = MDRG_CALLBACK_PROBE.wrap(
  "EdibleItemPrefabData.NutritionProfileFiller",
  function(item, nutritionProfile)
    nutritionProfile.Satiation.Value = 0.1
  end,
  { "item", "nutritionProfile" }
)

itemprefab0.EdibleData = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Beverage, ntf)

local itemgameid0 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab0)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid0)
```

Ajustar nomes/APIs conforme stubs reais.

## F3. Segurança do debug item

- Nome começa com `Debug`.
- Preço baixo.
- Descrição diz que é item de debug.
- Não usar no build normal.
- Não adicionar automaticamente ao shop se houver risco de poluir save.

Config:

```lua
local DEBUG_ADD_TO_SHOP = false
```

Se o objetivo for teste rápido, pode documentar como trocar para `true`.

## F4. Como testar

README deve explicar:

```txt
1. Instale o debug mod.
2. Ative ENABLE_CALLBACK_PROBE=true.
3. Se necessário, ative DEBUG_ADD_TO_SHOP=true.
4. Inicie o jogo.
5. Carregue um save.
6. Abra a loja onde o item foi registrado.
7. Compre/use/coma o item de debug.
8. Verifique callback-report-*.txt ou console.
9. Compare com report de startup e report via LuaExec.
```

---

# Parte G — Casos de debug gerados

Criar:

```txt
analysis/callback_debug_cases.md
```

Formato:

```md
# Callback Debug Cases

## Food nutrition profile filler

API:
- `EdibleItemPrefabData.CreateInstance`

Callback:
- `fun(item, nutritionProfile)`

Evidence:
- `luas/foods.lua`

Suggested debug item:
- Debug Callback Beverage

Manual test:
- buy/use/eat item
- check callback report

Risk:
- low/moderate, because it registers a test item and changes nutrition profile during normal callback.
```

Outros casos candidatos:

```txt
ItemPrefab.OnUse
ItemPrefab.OnUnpack
StoryCondition.Lua
StoryCondition.Delegate
ShopItem bought/no-money callbacks
UI popup yes/no/afterClose callbacks
CookingSong callbacks
ItemScopeConditionCustom
```

Para cada um:

```txt
priority
risk
evidence
manual test steps
whether it mutates save/UI/game state
```

---

# Parte H — Docs de runtime/lifecycle/events

Criar ou atualizar:

```txt
analysis/runtime_context_notes.md
analysis/lifecycle_event_clues.md
```

## H1. Runtime context notes

Adicionar matriz:

```md
| Context | CurrentModGuid | GameVariables | gv | flowchart | Typical use |
|---|---:|---:|---:|---:|---|
| mod startup / OnGameStart-like | yes | usually no | no | no | register items, prefabs, callbacks |
| mod startup + safe IO | yes | usually no | no | no | same as startup, plus file reports |
| LuaExec scene/Fungus | usually no | no | yes | yes | inspect live scene/save context |
| callback: food nutrition filler | unknown | unknown | unknown | unknown | receives item + nutritionProfile |
| callback: item OnUse | unknown | unknown | unknown | unknown | receives item/use context |
| callback: story condition | unknown | unknown | unknown | maybe | story/Fungus context |
```

Notas:

```txt
Absence in OnGameStart does not mean absence in every context.
Many APIs are only meaningful later, during runtime or inside callbacks.
Callbacks should be probed by wrapping the callback itself.
```

## H2. Lifecycle/event clues

Procurar eventos:

```powershell
rg -n "OnGameStart|OnGameLoad|OnSaveLoad|OnSaveLoaded|OnLoad|OnSave|OnDayStart|OnSceneLoaded|OnUpdate|OnTick|OnUse|OnUnpack" .
```

Registrar achados em:

```txt
analysis/lifecycle_event_clues.md
```

Se `OnSaveLoad` não aparecer:

```txt
No direct Lua-level OnSaveLoad hook confirmed from current files.
A C#/MelonLoader bridge may be needed to expose this as a Lua event.
```

---

# Parte I — Segurança

Manter tudo defensivo:

- Debug plugin é opt-in.
- Callback probe vem desativado por padrão.
- Não chamar callbacks automaticamente.
- Não criar item automaticamente em build normal.
- Não chamar `SaveAllChanges`, `ResetAllData`, `AddGlobalFlag`, `ForceTakeMoney`, `OpenBrowser`, `ChangeWebsite`.
- Não chamar `io.popen`.
- Não assumir que `io` é nativo.
- Não editar stubs gerados manualmente.
- Não usar callbacks de exemplo em build normal.
- Não alterar comportamento original do callback quando wrapper for usado.
- Se callback original erra, rethrow do erro após registrar.
- Se callback original retorna valores, preservar retornos.
- Usar `pcall` em todo acesso arriscado.
- Reports são evidência para revisão manual, não fonte autoritativa automática.

---

# Validação sugerida

Rodar ou sugerir:

```powershell
rg -n "detect_execution_context|Execution Context Classification|Probe Contamination|BEGIN_MDRG_PROBE_ENVIRONMENT|Lifecycle Availability Matrix|Lifecycle / Event Clues" examples tools analysis docs
rg -n "SAFE_IO_EXPECTED|PROBE_CONTEXT_LABEL|ENABLE_SAFE_CONTEXT_CALLS|io_popen|io_tmpfile|effective_gamevariables_source" examples tools
rg -n "fun\\(" library
rg -n "CreateInstance\\(|OnUse|OnUnpack|SpecialEffectAction|RandomItemPostProcessing|NutritionProfile|function\\(" luas examples
rg -n "BEGIN_MDRG_CALLBACK|callback_probe|probe_wrap|ENABLE_CALLBACK_PROBE|DEBUG_ADD_TO_SHOP" examples tools analysis
rg -n "SaveAllChanges\\(|ResetAllData\\(|AddGlobalFlag\\(|ForceTakeMoney\\(|OpenBrowser\\(|ChangeWebsite\\(|io\\.popen\\(" examples
rg -n "OnGameStart|OnSaveLoad|OnSaveLoaded|OnGameLoad|OnSceneLoaded|OnUpdate|OnTick" .
python -m py_compile tools\catalog_lua_callbacks.py tools\probe_runtime_index.py
```

Se houver ferramenta central:

```powershell
python .\tools\dev.py check
```

Se LuaLS não estiver no PATH, aviso apenas.

---

# Entrega esperada

Ao final, entregar:

1. Resumo das mudanças.
2. Arquivos criados/alterados.
3. Como o probe diferencia:
   - mod startup;
   - mod startup com safe IO;
   - LuaExec/Fungus/scene context;
   - callback invocation context.
4. Como o machine-readable environment block funciona.
5. Como `probe_runtime_index.py` processa reports antigos e novos.
6. Como usar o callback helper dentro de uma closure.
7. Principais callbacks `fun(...)` encontrados nos stubs.
8. Padrões encontrados em `luas/`.
9. Casos de debug plugin propostos.
10. Se implementou o caso de comida, explicar como testar no jogo.
11. Confirmação de que debug plugin é opt-in.
12. Confirmação de que callback probe vem desativado por padrão.
13. Confirmação de que callbacks não são chamados artificialmente.
14. Confirmação de que wrapper preserva retorno/erro da função original.
15. Confirmação de que o probe principal continua read-only.
16. Diff relevante.

Não rode o jogo.
Não altere stubs gerados manualmente.
Não assuma `OnSaveLoad` sem evidência.

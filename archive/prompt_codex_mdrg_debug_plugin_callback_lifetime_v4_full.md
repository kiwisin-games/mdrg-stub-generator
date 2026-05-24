# Prompt para Codex — MDRG Debug Plugin Callback/Lifetime v4 FULL com mod real, assets, callbacks e reports

Você está trabalhando no repositório atual do addon LuaLS MDRG/MoonSharp.

Este prompt substitui os anteriores:

```txt
prompt_codex_mdrg_debug_plugin_callback_lifetime_v2.md
prompt_codex_mdrg_debug_plugin_callback_lifetime_v3_assets.md
```

A regra deste v4 é:

```txt
Não remover requisitos do v2.
Adicionar integralmente as melhorias de assets/mod real do v3.
Quando houver sobreposição, manter a versão mais específica e prática.
```

---

# Estado atual do projeto

Já existem ou são esperados no repositório:

```txt
examples/mdrg_env_probe.lua
extern/mdrg_safe_io.d.lua
library/mdrg_safe_io.d.lua
tools/probe_runtime_index.py
luas/
library/*.d.lua
mod/realmod/
```

O projeto já gerou reports runtime em contextos diferentes:

```txt
- LuaExec/exec depois de save/cena;
- mod real carregado na inicialização;
- mod real com safe IO ativo;
- contexto com gv e flowchart;
- contexto com CurrentModGuid;
- contexto sem GameVariables, gv e flowchart;
- contexto com safe IO;
- contexto sem safe IO.
```

Agora também existe uma fonte real de mod com assets:

```txt
mod/realmod/
```

Essa pasta contém os arquivos extraídos do ZIP `realmod.zip`, incluindo:

```txt
mod.json
script.lua
pastas de assets por item/
  *.json
  *.png
```

---

# Objetivo geral

Criar/melhorar uma infraestrutura de debug para MDRG/MoonSharp que:

1. Classifique o contexto/lifetime do script atual.
2. Compare reports de contextos diferentes.
3. Catalogue callbacks/closures Lua aceitos pelas APIs dos stubs.
4. Analise scripts reais em `luas/`.
5. Analise o mod real em `mod/realmod/`.
6. Extraia e documente o schema dos JSONs de assets.
7. Entenda como assets JSON/PNG são consumidos pelo Lua.
8. Crie um helper opt-in para rodar probe dentro de callbacks/closures.
9. Crie um debug plugin/mod real, instalável, com `mod.json`, `script.lua` e assets mínimos.
10. Registre itens/casos de teste para disparar callbacks reais.
11. Gere reports de callback/lifetime.
12. Mantenha tudo read-only por padrão, exceto o necessário para registrar itens de debug quando flags explícitas forem ativadas.
13. Não altere stubs gerados manualmente.
14. Não assuma que `OnSaveLoad` existe sem evidência.
15. Não rode o jogo.

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

# Resumo observado em `mod/realmod`

O ZIP real tem:

```txt
mod.json
script.lua
162 JSONs de PackedTextures
170 PNGs
67 itens criados via ModUtilities.CreateItemPrefab()
assets organizados por pasta de item
```

Categorias observadas no `script.lua`:

```txt
Modules
Clothing
Meds
Other
Room
Package
AnonEquip
Food
Soap
Fish
CookingIngredient
```

Shops observados:

```txt
clothier
ladyparts.ic
```

Padrão principal do mod:

```lua
local itemprefab = ModUtilities.CreateItemPrefab()
-- define campos
local packed = ModUtilities.GetPackedTexture(CurrentModGuid, "/Pasta do Item/arquivo.json")
itemprefab.AddTexture(packed)
local itemgameid = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab)
ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid)
```

O `mod.json` usa:

```json
{
  "name": "...",
  "description": "...",
  "modVersion": "1.0.0",
  "OnGameStart": {
    "luaFiles": [
      "script.lua"
    ]
  },
  "targetVersion": "0.96.6",
  "languageCode": "en",
  "doNotChangeVariablesBelowThis": {
    "timeCreated": 639137165335025018,
    "guid": {
      "serializedGuid": "..."
    }
  }
}
```

---

# Regras do projeto

Respeite estas regras:

- Não edite `library/*.d.lua` manualmente.
- Se precisar ajustar safe IO, edite `extern/mdrg_safe_io.d.lua`.
- `library/mdrg_safe_io.d.lua` deve ser cópia gerada de `extern/mdrg_safe_io.d.lua`.
- Não recrie pasta `module/`.
- Não remova arquivos raw antigos de `luas/`, `dump/`, `rawdump/`, `mod/realmod/` ou similares.
- Não altere stubs gerados diretamente.
- Não altere `data/*.json` sem necessidade clara.
- Não rode o jogo.
- LuaLS pode não estar no PATH; isso deve ser aviso, não falha fatal.
- `validate_addon.py --health` pode falhar por arquivos antigos em `luas/` ainda rastreados; não corrija isso removendo arquivos sem pedido do usuário.
- Não chamar funções descobertas automaticamente.
- Não chamar funções de save/UI/contexto por padrão.
- Não criar evento real em C#/MelonLoader nesta tarefa.
- Não criar bridge C# nova nesta tarefa.
- Não assumir que `OnSaveLoad` existe.
- Não deixar script apontar para asset ausente.
- Não deixar debug mod poluir save sem flags explícitas.
- Não usar `io.popen`.

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
callback-invocation-context
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
BEGIN_MDRG_ASSET_SCHEMA
BEGIN_MDRG_ASSET_VALIDATION
BEGIN_MDRG_DEBUG_ITEM_CASES
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

# Parte C — Analisar `mod/realmod/`

Crie documentação em:

```txt
analysis/realmod_structure.md
analysis/realmod_asset_schema.md
analysis/realmod_item_patterns.md
```

## C1. Estrutura do mod

Analise:

```txt
mod/realmod/mod.json
mod/realmod/script.lua
mod/realmod/**/*.json
mod/realmod/**/*.png
```

Documente:

```txt
- arquivos no topo;
- pastas de assets;
- quantidade de JSONs e PNGs;
- se cada JSON referencia PNG existente;
- se cada PNG é referenciado por algum JSON;
- scripts executados por OnGameStart;
- shops usados;
- categorias usadas;
- slots usados;
- subcategorias usadas;
- quais itens têm textura;
- quais itens não têm textura;
- quais itens têm callbacks/closures.
```

## C2. Estrutura esperada do mod.json

Documente o schema inferido:

```json
{
  "name": "string",
  "description": "string",
  "modVersion": "string",
  "OnGameStart": {
    "luaFiles": ["string"]
  },
  "targetVersion": "string",
  "languageCode": "string",
  "doNotChangeVariablesBelowThis": {
    "timeCreated": "integer",
    "guid": {
      "serializedGuid": "string uuid"
    }
  }
}
```

Notas:

```txt
- OnGameStart.luaFiles define scripts Lua executados na inicialização/registration-time.
- O GUID é usado como CurrentModGuid quando scripts do mod rodam.
- Não editar doNotChangeVariablesBelowThis sem necessidade.
- Para debug mod novo, gerar GUID próprio e manter consistência.
```

## C3. Item patterns do script.lua

Extraia padrões de criação de item:

```txt
ModUtilities.CreateItemPrefab()
SlotEquipData.CreateInstance(...)
ColorSlot.CreateInstance(...)
ColorPaletteManager.GetColorPaletteByName(...)
ModUtilities.GetPackedTexture(CurrentModGuid, "/...json")
itemprefab.AddTexture(...)
ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab)
ModUtilities.AddSingleBuyItemToShop("...", itemgameid)
```

Documente exemplos reais por categoria:

```txt
Modules
Clothing
Meds
Other
Room
Package
AnonEquip
Food
Soap
Fish
CookingIngredient
```

Documente pelo menos um exemplo por:

```txt
- item com SlotData simples;
- item com SlotData manual + ControllerElementOverride;
- item com AddTexture;
- item sem textura;
- item Food com EdibleData;
- item Fish com FishData + EdibleData;
- item Package;
- item Room;
- item Clothing com subcategoria;
- item AnonEquip;
- item com várias ColorSlots;
- item com vários PackedTextures.
```

---

# Parte D — Extrair schema dos assets JSON

Os JSONs de assets em `mod/realmod/**.json` seguem este formato inferido:

```json
{
  "PackedTextures": [
    {
      "TextureName": "string png filename",
      "Layer": 0,
      "PackedDrawables": [
        {
          "Name": "string renderer/drawable name",
          "RectInt": {
            "x": 0,
            "y": 0,
            "width": 0,
            "height": 0
          },
          "ColorIndex": 0,
          "DrawableType": 0,
          "BypassColorScaler": false
        }
      ],
      "Targets": ["missionary", "doggy", "interaction"],
      "DontIncludeVanillaLayers": false
    }
  ]
}
```

Crie um schema formal em:

```txt
analysis/packed_textures.schema.json
```

Use JSON Schema draft 2020-12 ou draft-07.

## D1. Schema inferido

Campos obrigatórios de root:

```txt
PackedTextures: array
```

Campos obrigatórios de cada `PackedTexture`:

```txt
TextureName: string
Layer: integer
PackedDrawables: array
Targets: string[]
DontIncludeVanillaLayers: boolean
```

Campos obrigatórios de cada `PackedDrawable`:

```txt
Name: string
RectInt: object
ColorIndex: integer
DrawableType: integer
BypassColorScaler: boolean
```

Campos obrigatórios de `RectInt`:

```txt
x: integer
y: integer
width: integer
height: integer
```

Valores observados:

```txt
Targets: doggy, missionary, interaction, blowjob, cowgirl, shower
Layer: 0, 1, 2, 3, 10, 50, 51, 100
DrawableType: majoritariamente 0, também 1 em pelo menos um caso
ColorIndex: -1, 0, 1, 2
BypassColorScaler: true/false
DontIncludeVanillaLayers: false nos exemplos observados
```

Notas:

```txt
- Um JSON pode conter 1, 2 ou 4 entradas em PackedTextures.
- TextureName aponta para PNG irmão na mesma pasta do JSON.
- Os PNGs observados são RGBA.
- O sufixo do nome do PNG costuma conter layer, mas o campo Layer no JSON é a fonte de verdade.
- Não assumir que só existe uma textura por JSON.
- Não assumir que ColorIndex sempre é 0.
- Não assumir que DrawableType sempre é 0.
```

## D2. Relação JSON ↔ PNG

Documente que o Lua não carrega PNG diretamente nesse padrão.

O padrão real é:

```lua
local packed = ModUtilities.GetPackedTexture(
  CurrentModGuid,
  "/Orelhas de gato/tex 1 - doggy.json"
)

itemprefab.AddTexture(packed)
```

Então:

```txt
- Lua referencia o JSON pelo caminho do mod, começando com "/".
- O JSON referencia o PNG por TextureName.
- O PNG deve estar na mesma pasta do JSON, salvo evidência contrária.
- O loader resolve o PNG por meio do JSON/asset container.
```

## D3. Origem nos stubs

Procure nos stubs por:

```txt
ModUtilities.GetPackedTexture
PackedTexturesContainer
PackedTexture
PackedTextureJson
PackedTexturesContainerJson
PackedDrawable
PackedDrawable.ToPackable
ItemPrefab.AddTexture
IPackableExpanded
Pack_Layer
Pack_Targets
SaveToModfiles
LoadFromModFiles
LoadFromPath
CheckValidity
ReloadTexturesFromFiles
CreatePackedTexturesFromRenderers
```

Se encontrar, documente em:

```txt
analysis/realmod_asset_schema.md
```

Se os stubs não forem suficientes, continue procurando em fontes locais:

```txt
docs.txt
data/*.json
luas/
dump/
rawdump/
mod/realmod/
```

Não usar web. Usar apenas fontes locais.

## D4. Validador de assets

Criar uma ferramenta leve:

```txt
tools/validate_realmod_assets.py
```

Ela deve validar:

```txt
- todos os JSONs de asset seguem o schema;
- cada TextureName aponta para PNG existente na mesma pasta;
- cada PNG da pasta é referenciado por algum JSON, ou listar como órfão;
- RectInt tem width/height > 0;
- Targets não vazio;
- PackedTextures não vazio;
- PackedDrawables não vazio;
- paths usados em script.lua existem;
- paths de GetPackedTexture começam com "/";
- assets usados por script.lua existem em mod/realmod;
- itens com AddTexture referenciam JSON válido.
```

Gerar relatório:

```txt
analysis/realmod_asset_validation.md
```

---

# Parte E — Catalogar callbacks/closures nos stubs

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

Ignore `---@overload fun(` como callback por si só, mas considere que overloads podem conter parâmetros que são closures.

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
se aparece em mod/realmod/script.lua
```

## E1. Lista detalhada de callbacks por domínio

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

# Parte F — Analisar `luas/` e `mod/realmod/script.lua`

Ler a pasta `luas/`, se existir, especialmente:

```txt
foods.lua
clothes.lua
outros scripts de mods extraídos
```

Além de `luas/`, analise:

```txt
mod/realmod/script.lua
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
FishData
MedicineData
Package
AllowedModifiers
ModUtilities.CreateItemPrefab
ModUtilities.CreateNewItemAutoAssignId
ModUtilities.AddSingleBuyItemToShop
ModUtilities.GetPackedTexture
itemprefab.AddTexture
```

Criar seção em:

```txt
analysis/lua_callback_contexts.md
```

ou arquivo dedicado:

```txt
analysis/callback_debug_cases.md
analysis/realmod_item_patterns.md
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

Não modificar `luas/` nem `mod/realmod/`.

---

# Parte G — Callback probe helper

Criar:

```txt
examples/mdrg_callback_context_probe.lua
```

Ou, se fizer sentido:

```txt
examples/callback_debug/mdrg_callback_context_probe.lua
```

## G1. Uso esperado

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

## G2. Configuração

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

## G3. Wrapper seguro

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

## G4. Coleta dentro de callback

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

## G5. Callback report

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

# Parte H — Criar debug mod real baseado em `mod/realmod`

Criar uma pasta nova, por exemplo:

```txt
examples/callback_debug_mod_real/
```

Estrutura sugerida:

```txt
examples/callback_debug_mod_real/
├── README.md
├── mod.json
├── script.lua
├── mdrg_callback_context_probe.lua
├── assets/
│   └── ...
└── generated_cases/
    ├── food_nutrition_probe.lua
    ├── fish_edible_probe.lua
    ├── clothing_texture_probe.lua
    ├── module_texture_probe.lua
    ├── package_probe.lua
    ├── room_probe.lua
    └── story_condition_probe.lua
```

Não precisa implementar todos os casos se ficar grande. Priorize comida/nutrition e um caso de textura.

## H1. Basear o debug mod em padrões reais

Use `mod/realmod` como referência, não invente estrutura.

O debug mod deve ter:

```txt
mod.json com OnGameStart.luaFiles apontando para script.lua
script.lua compatível com MoonSharp/Lua 5.2
assets JSON/PNG mínimos quando um item usa AddTexture
paths de GetPackedTexture começando com "/"
CurrentModGuid usado para assets e IDs
do ... end ao redor de cada item/caso para evitar limite de 200 locals/upvalues
```

## H2. Asset strategy

Para itens com textura:

```txt
- copiar um conjunto mínimo de JSON+PNG de mod/realmod para examples/callback_debug_mod_real/assets/...
- ou manter uma pasta de asset com o mesmo padrão real
- atualizar caminhos no Lua para bater com o local copiado
- validar que cada JSON referencia PNG existente
```

Não referenciar JSON/PNG que não existe no debug mod.

Se preferir não copiar PNGs grandes:

```txt
- documentar que o debug mod usa assets de exemplo e precisa copiar os PNGs correspondentes;
- criar ASSET_LIST.txt com os caminhos necessários;
- não deixar script.lua apontar para assets ausentes.
```

## H3. Casos de teste obrigatórios

Crie pelo menos estes casos, se houver API/padrão suficiente:

### 1. Food callback item

Baseado em `Energético`/`Salgadinhos`:

```txt
Category: ItemCategory.Food
EdibleData: EdibleItemPrefabData.CreateInstance(...)
callback: nutritionProfileFiller
shop: clothier
```

Instrumentar `ntf` com `MDRG_CALLBACK_PROBE.wrap`.

### 2. Fish item

Baseado em `Bluegill`:

```txt
Category: ItemCategory.Fish
FishData
FishPreferences
EdibleData
callback: nutritionProfileFiller
```

Instrumentar callback de EdibleData.

### 3. CookingIngredient item

Baseado em `Batatas`:

```txt
Category: ItemCategory.CookingIngredient
EdibleData
callback: nutritionProfileFiller
```

### 4. Clothing/module item with textures

Baseado em item com `SlotData`, `GetPackedTexture`, `AddTexture`.

Escolher um item pequeno de `mod/realmod`, por exemplo:

```txt
Batom
Piercing de anel no septo
Tênis esquerdo/direito
Orelhas de gato
```

O objetivo é validar asset loading:

```txt
ModUtilities.GetPackedTexture(CurrentModGuid, "/...json")
itemprefab.AddTexture(packed)
```

### 5. Package item

Baseado em:

```txt
Par de meias
Par de piercings nos mamilos
Par de tênis planos
```

Investigar no script real como packages vinculam itens. Se exigir referências/IDs internos, documentar e não inventar.

### 6. Room item

Baseado em:

```txt
Tapete de abóbora
Pelúcia de aranha
Banner de morcego
Decoração fantasma
```

Documentar se precisa asset/sprite/room data.

### 7. AnonEquip/Fishing item

Baseado em:

```txt
Vara de Pesca
Isca de Minhoca
```

Documentar fields relevantes e riscos.

## H4. Flags de segurança do debug mod

No `script.lua` do debug mod:

```lua
local ENABLE_DEBUG_ITEMS = false
local ENABLE_CALLBACK_PROBE = false
local DEBUG_ADD_TO_SHOP = false
local DEBUG_SHOP_ID = "clothier"
```

Por padrão, nada deve registrar itens se `ENABLE_DEBUG_ITEMS = false`.

Se o objetivo for teste prático, o README deve dizer como ativar.

## H5. Evitar limite de locals/upvalues

O script deve usar:

```lua
do
  local itemprefab = ...
  local itemgameid = ...
end
```

Ou funções pequenas:

```lua
local function register_debug_food()
  ...
end
```

Não gerar:

```lua
local itemprefab0
local itemprefab1
...
```

em um único escopo gigante.

---

# Parte I — Docs e validação do debug mod

Criar:

```txt
examples/callback_debug_mod_real/README.md
analysis/debug_mod_real_plan.md
analysis/debug_mod_real_asset_requirements.md
analysis/callback_debug_cases.md
analysis/runtime_context_notes.md
analysis/lifecycle_event_clues.md
```

## I1. README do debug mod

README deve explicar:

```txt
1. Como ativar ENABLE_DEBUG_ITEMS.
2. Como ativar ENABLE_CALLBACK_PROBE.
3. Como ativar DEBUG_ADD_TO_SHOP.
4. Como instalar/zipar o mod.
5. Como carregar save.
6. Como comprar/usar/comer cada item.
7. Onde os reports aparecem.
8. Como comparar startup report, LuaExec report e callback report.
9. Quais assets foram copiados de mod/realmod.
10. Quais casos ainda são apenas planejados.
```

## I2. Runtime context notes

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

## I3. Lifecycle/event clues

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

## I4. Validação

Criar:

```txt
tools/validate_debug_mod_real.py
```

Ou integrar em `tools/validate_realmod_assets.py`.

Validar:

```txt
- mod.json existe;
- OnGameStart.luaFiles existe e aponta para script.lua;
- script.lua existe;
- assets referenciados por GetPackedTexture existem;
- asset JSONs passam schema;
- PNGs referenciados existem;
- não há chamadas diretas a SaveAllChanges/ResetAllData/ForceTakeMoney/OpenBrowser/ChangeWebsite/io.popen;
- ENABLE_DEBUG_ITEMS=false por padrão;
- ENABLE_CALLBACK_PROBE=false por padrão;
- DEBUG_ADD_TO_SHOP=false por padrão, salvo decisão documentada.
```

---

# Parte J — Segurança

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
- Não deixar script apontar para asset ausente.
- Não deixar debug mod poluir save sem flags explícitas.
- Não assumir `OnSaveLoad`.
- Não rodar o jogo.

---

# Validação sugerida

Rode ou sugira:

```powershell
rg -n "detect_execution_context|Execution Context Classification|Probe Contamination|BEGIN_MDRG_PROBE_ENVIRONMENT|Lifecycle Availability Matrix|Lifecycle / Event Clues" examples tools analysis docs
rg -n "SAFE_IO_EXPECTED|PROBE_CONTEXT_LABEL|ENABLE_SAFE_CONTEXT_CALLS|io_popen|io_tmpfile|effective_gamevariables_source" examples tools
rg -n "GetPackedTexture|AddTexture|PackedTextures|PackedDrawables|TextureName|DontIncludeVanillaLayers|PackedTexturesContainer" mod/realmod library examples tools analysis
rg -n "CreateItemPrefab|CreateNewItemAutoAssignId|AddSingleBuyItemToShop|SlotEquipData|EdibleData|FishData|Package|Room" mod/realmod/script.lua examples
rg -n "fun\\(" library
rg -n "CreateInstance\\(|OnUse|OnUnpack|SpecialEffectAction|RandomItemPostProcessing|NutritionProfile|function\\(" luas mod/realmod examples
rg -n "BEGIN_MDRG_CALLBACK|callback_probe|probe_wrap|ENABLE_CALLBACK_PROBE|ENABLE_DEBUG_ITEMS|DEBUG_ADD_TO_SHOP" examples tools analysis
rg -n "SaveAllChanges\\(|ResetAllData\\(|AddGlobalFlag\\(|ForceTakeMoney\\(|OpenBrowser\\(|ChangeWebsite\\(|io\\.popen\\(" examples
rg -n "OnGameStart|OnSaveLoad|OnSaveLoaded|OnGameLoad|OnSceneLoaded|OnUpdate|OnTick" .
python -m py_compile tools\catalog_lua_callbacks.py tools\probe_runtime_index.py tools\validate_realmod_assets.py tools\validate_debug_mod_real.py
python tools\validate_realmod_assets.py --root mod/realmod
python tools\validate_debug_mod_real.py --root examples/callback_debug_mod_real
```

Se alguma ferramenta não existir, criar de forma simples.

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
6. Schema extraído dos assets JSON.
7. Explicação de como o Lua usa assets via `GetPackedTexture` + `AddTexture`.
8. Resultado da validação JSON/PNG.
9. Padrões de itens extraídos de `mod/realmod/script.lua`.
10. Como o debug mod real foi montado.
11. Quais itens/categorias/callbacks o debug mod cobre.
12. Quais assets foram copiados ou referenciados.
13. Como instalar e testar o debug mod.
14. Como ativar/desativar flags de segurança.
15. Como comparar reports startup/LuaExec/callback.
16. Como usar o callback helper dentro de uma closure.
17. Principais callbacks `fun(...)` encontrados nos stubs.
18. Padrões encontrados em `luas/`.
19. Casos de debug plugin propostos.
20. Confirmação de que callback probe vem desativado por padrão.
21. Confirmação de que debug item/shop vem desativado por padrão, se for essa a decisão.
22. Confirmação de que callbacks não são chamados artificialmente.
23. Confirmação de que wrapper preserva retorno/erro da função original.
24. Confirmação de que o probe principal continua read-only.
25. Confirmação de que stubs gerados não foram editados manualmente.
26. Diff relevante.

Não rode o jogo.
Não altere stubs gerados manualmente.
Não assuma `OnSaveLoad` sem evidência.

## Erratas / clarificações do v4

- Este prompt é autossuficiente; não é necessário abrir o v2/v3, apenas respeitar o conteúdo abaixo.
- `mod/realmod` é corpus read-only. Não editar arquivos dentro dele.
- O ZIP observado tem 162 JSONs de PackedTextures + 1 `mod.json`; validação de asset deve ignorar `mod.json`.
- Validar como PackedTextures apenas JSONs que possuem chave root `PackedTextures`.
- Nunca reutilizar o GUID de `mod/realmod`; o debug mod deve ter GUID próprio.
- APIs de registro de item/shop são permitidas apenas no debug mod e apenas atrás de flags explícitas: `ENABLE_DEBUG_ITEMS=true` e `DEBUG_ADD_TO_SHOP=true`.
- O probe principal `mdrg_env_probe.lua` continua read-only e não deve registrar itens.
- `io.popen` deve ser apenas detectado/classificado, nunca chamado. Presença do campo não prova capacidade real.
- `Targets` no schema devem aceitar strings desconhecidas; valores observados são documentação, não enum fechada.
- PNG órfão deve ser warning, não erro fatal.
- `ItemModiferAdditionFunction` pode ser typo real da API/stub; procurar esse nome exato e também `ItemModifierAdditionFunction`, sem renomear automaticamente.
- O wrapper de callback deve preservar retornos com `nil`; use helper `pack(...)` com `n = select("#", ...)`.
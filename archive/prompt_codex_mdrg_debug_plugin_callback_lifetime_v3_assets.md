# Prompt para Codex — MDRG Debug Plugin Callback/Lifetime v3 com mod real, assets e schema de PackedTextures

Você está trabalhando no repositório atual do addon LuaLS MDRG/MoonSharp.

Use este prompt como substituto do v2:

```txt
prompt_codex_mdrg_debug_plugin_callback_lifetime_v2.md
```

O v2 continua como base conceitual, mas agora há uma nova fonte real de mod com assets:

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

O objetivo agora é consolidar o sistema de debug/lifetime/callbacks **criando um mod real de debug**, baseado na estrutura e nos padrões reais de `mod/realmod`.

---

# Resumo do que foi observado no `realmod.zip`

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
9. Crie um debug mod real, instalável, com `mod.json`, `script.lua` e assets mínimos.
10. Registre itens/casos de teste para disparar callbacks reais.
11. Gere reports de callback/lifetime.
12. Mantenha tudo read-only por padrão, exceto o que for necessário para registrar itens de debug.
13. Não altere stubs gerados manualmente.
14. Não assuma que `OnSaveLoad` existe sem evidência.

---

# Modelo mental obrigatório: lifetime/context

Use este modelo em docs, reports e código.

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

---

# Parte A — Analisar `mod/realmod/`

Crie documentação em:

```txt
analysis/realmod_structure.md
analysis/realmod_asset_schema.md
analysis/realmod_item_patterns.md
```

## A1. Estrutura do mod

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

## A2. Estrutura esperada do mod.json

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

## A3. Item patterns do script.lua

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

# Parte B — Extrair schema dos assets JSON

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

## B1. Schema inferido

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

## B2. Relação JSON ↔ PNG

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

## B3. Origem nos stubs

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

Se os stubs não forem suficientes, adicione no prompt/relatório para o Codex continuar procurando em:

```txt
docs.txt
data/*.json
luas/
dump/
rawdump/
mod/realmod/
```

Não usar web. Usar apenas fontes locais.

## B4. Validador de assets

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

# Parte C — Melhorar `mdrg_env_probe.lua`

Mantenha as melhorias do v2:

```txt
detect_execution_context()
PROBE_CONTEXT_LABEL
SAFE_IO_EXPECTED
ENABLE_SAFE_CONTEXT_CALLS=false
Execution Context Classification
Probe Contamination / Injection Context
BEGIN_MDRG_PROBE_ENVIRONMENT
Safe Validations context-aware
Lifecycle Availability Matrix
Lifecycle / Event Clues
Known Field Probe sem chamar funções
Enum Value Probe cauteloso
enum-like false positive cleanup
safe IO como bridge sensível
Possibly Undocumented Globals limpo
```

Regras específicas:

```txt
- Field probe só indexa, nunca chama função retornada.
- Enum probe só indexa, nunca chama.
- ENABLE_SAFE_CONTEXT_CALLS fica false por padrão.
- io.popen nunca é chamado.
```

---

# Parte D — Melhorar `tools/probe_runtime_index.py`

Mantenha as melhorias do v2:

```txt
strip_log_prefix()
parse de BEGIN_MDRG_PROBE_ENVIRONMENT
parse de BEGIN_MDRG_CALLBACK_*
compatibilidade com reports antigos
--compare report-a report-b
armazenar environment no runtime index
```

Além disso, adicionar suporte para reports de asset/debug mod se forem gerados:

```txt
BEGIN_MDRG_ASSET_SCHEMA
BEGIN_MDRG_ASSET_VALIDATION
BEGIN_MDRG_DEBUG_ITEM_CASES
```

Somente se fizer sentido e sem criar ferramenta grande demais.

---

# Parte E — Catalogar callbacks/closures nos stubs

Criar/atualizar:

```txt
tools/catalog_lua_callbacks.py
analysis/lua_callback_contexts.md
```

Procurar:

```txt
---@param ... fun(...)
---@field ... fun(...)
---@return ... fun(...)
fun(
```

Ignorar `---@overload fun(` como callback por si só, mas considerar que overloads podem conter parâmetros que são closures.

## E1. Callbacks por domínio

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

Documentar padrões reais:

```txt
analysis/lua_callback_contexts.md
analysis/callback_debug_cases.md
analysis/realmod_item_patterns.md
```

---

# Parte G — Callback probe helper

Criar ou atualizar:

```txt
examples/mdrg_callback_context_probe.lua
```

Ou:

```txt
examples/callback_debug/mdrg_callback_context_probe.lua
```

Config padrão:

```lua
local ENABLE_CALLBACK_PROBE = false
local CALLBACK_PROBE_ONCE_PER_CONTEXT = true
local CALLBACK_PROBE_MAX_CALLS = 10
local CALLBACK_PROBE_DEEP_ARGS = false
local CALLBACK_PROBE_COMPARE_BEFORE_AFTER = false
local CALLBACK_PROBE_CONTEXT_LABEL = "auto"
```

Wrapper:

```lua
local ntf = MDRG_CALLBACK_PROBE.wrap(
  "EdibleItemPrefabData.NutritionProfileFiller",
  function(item, nutritionProfile)
    nutritionProfile.Satiation.Value = 0.1
  end,
  { "item", "nutritionProfile" }
)
```

O wrapper deve:

```txt
- registrar contexto antes;
- registrar argumentos;
- chamar função original;
- registrar contexto depois, se configurado;
- preservar retornos;
- rethrow de erros;
- não engolir erro;
- não alterar comportamento esperado;
- não chamar callbacks por conta própria.
```

Reports:

```txt
callback-report-YYYYMMDD-HHMMSS.txt
BEGIN_MDRG_CALLBACK_CONTEXT
BEGIN_MDRG_CALLBACK_ARGS
BEGIN_MDRG_CALLBACK_FIELDS
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
```

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

Criar validação:

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

---

# Validação sugerida

Rode ou sugira:

```powershell
rg -n "GetPackedTexture|AddTexture|PackedTextures|PackedDrawables|TextureName|DontIncludeVanillaLayers|PackedTexturesContainer" mod/realmod library examples tools analysis
rg -n "CreateItemPrefab|CreateNewItemAutoAssignId|AddSingleBuyItemToShop|SlotEquipData|EdibleData|FishData|Package|Room" mod/realmod/script.lua examples
rg -n "fun\\(" library
rg -n "CreateInstance\\(|OnUse|OnUnpack|SpecialEffectAction|RandomItemPostProcessing|NutritionProfile|function\\(" luas mod/realmod examples
rg -n "BEGIN_MDRG_CALLBACK|callback_probe|probe_wrap|ENABLE_CALLBACK_PROBE|ENABLE_DEBUG_ITEMS|DEBUG_ADD_TO_SHOP" examples tools analysis
rg -n "SaveAllChanges\\(|ResetAllData\\(|AddGlobalFlag\\(|ForceTakeMoney\\(|OpenBrowser\\(|ChangeWebsite\\(|io\\.popen\\(" examples
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
3. Schema extraído dos assets JSON.
4. Explicação de como o Lua usa assets via `GetPackedTexture` + `AddTexture`.
5. Resultado da validação JSON/PNG.
6. Padrões de itens extraídos de `mod/realmod/script.lua`.
7. Como o debug mod real foi montado.
8. Quais itens/categorias/callbacks o debug mod cobre.
9. Quais assets foram copiados ou referenciados.
10. Como instalar e testar o debug mod.
11. Como ativar/desativar flags de segurança.
12. Como comparar reports startup/LuaExec/callback.
13. Principais callbacks `fun(...)` encontrados nos stubs.
14. Padrões encontrados em `luas/`.
15. Confirmação de que callback probe vem desativado por padrão.
16. Confirmação de que debug item/shop vem desativado por padrão, se for essa a decisão.
17. Confirmação de que callbacks não são chamados artificialmente.
18. Confirmação de que wrapper preserva retorno/erro da função original.
19. Confirmação de que stubs gerados não foram editados manualmente.
20. Diff relevante.

Não rode o jogo.
Não altere stubs gerados manualmente.
Não assuma `OnSaveLoad` sem evidência.

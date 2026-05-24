# Prompt para Codex — Adicionar probe de contextos de callbacks/closures Lua no MDRG

Você está trabalhando no repositório atual do addon LuaLS MDRG/MoonSharp.

Já existe o probe runtime:

```txt
examples/mdrg_env_probe.lua
```

Ele gera reports do ambiente Lua/MoonSharp em diferentes contextos:

- LuaExec/exec depois de save/cena;
- mod real carregado na inicialização;
- mod real com safe IO;
- contexto inicial sem `GameVariables`, `gv` ou `flowchart`;
- contexto de cena/Fungus com `gv` e `flowchart`.

Agora quero adicionar uma nova dimensão: **contextos de callbacks/closures Lua passadas para APIs do jogo**.

## Motivação

Algumas APIs dos stubs e dos mods extraídos recebem funções Lua/closures que o jogo executa depois, com argumentos e contexto próprios.

Exemplo real de mod de comida:

```lua
local itemprefab0 = ModUtilities.CreateItemPrefab()
itemprefab0.Name = 'Energético'
itemprefab0.Description = 'Te fornece forças para foder (ou jogar) a noite toda.'
itemprefab0.Price = 20
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
itemprefab0.EdibleData = (function()
  local ntf = function(item, nutritionProfile)
    -- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
    nutritionProfile.Satiation.Value = 0.1
  end

  local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Beverage, ntf)
  return ed
end)()

local itemgameid0 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab0)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid0)
```

Nesse exemplo, a closure:

```lua
function(item, nutritionProfile)
  nutritionProfile.Satiation.Value = 0.1
end
```

provavelmente roda em outro momento/contexto, quando o jogo precisa preencher o perfil nutricional. Esse contexto pode expor argumentos, userdatas, fields e globals diferentes do `OnGameStart`.

O probe atual observa o contexto onde o script é executado, mas não observa automaticamente o contexto interno dessas closures.

---

# Objetivo desta tarefa

Melhorar o projeto para investigar callbacks/closures Lua de forma segura.

Você deve:

1. Ler os stubs `.d.lua` para encontrar APIs que recebem `fun(...)` ou têm fields do tipo `fun(...)`.
2. Ler a pasta `luas/`, se existir, especialmente arquivos como:
   - `foods.lua`;
   - `clothes.lua`;
   - outros scripts de mods extraídos.
3. Identificar padrões reais de closures usadas em mods.
4. Criar um catálogo de callback contexts.
5. Criar um helper/probe opt-in para ser usado dentro dessas closures.
6. Criar exemplos seguros mostrando como instrumentar callbacks sem alterar o comportamento do mod.
7. Não chamar callbacks automaticamente.
8. Não alterar stubs gerados manualmente.
9. Não alterar comportamento do jogo por padrão.

---

# Fontes a inspecionar

Use as fontes do projeto:

```txt
docs.txt
library/*.d.lua
data/*.json
luas/
examples/
extern/
tools/
```

Respeite as regras do projeto:

- `library/*.d.lua` é saída gerada; não editar manualmente.
- `extern/*.d.lua` é fonte para stubs externos, como safe IO.
- `luas/` contém scripts extraídos de mods reais e pode estar ignorada/rastreada parcialmente; não mover nem apagar.
- Use `luas/` como evidência de padrões reais de mod, não como fonte absoluta para tipos.

---

# Parte 1 — Catalogar callbacks/closures nos stubs

Criar ou atualizar uma ferramenta leve, por exemplo:

```txt
tools/catalog_lua_callbacks.py
```

Ou integrar em ferramenta existente, se fizer mais sentido.

A ferramenta deve procurar nos stubs:

```txt
---@param ... fun(...)
---@field ... fun(...)
---@return ... fun(...)
```

E gerar um relatório:

```txt
analysis/lua_callback_contexts.md
```

O relatório deve listar APIs que aceitam callbacks Lua.

Para cada callback encontrado:

```txt
- arquivo;
- linha;
- classe/função/campo dono;
- nome do parâmetro ou field;
- assinatura do callback;
- tipos dos argumentos;
- tipo de retorno;
- possível contexto;
- risco provável;
- se aparece em scripts reais de `luas/`.
```

Exemplo de entrada esperada:

```md
## EdibleItemPrefabData.CreateInstance

Source:
- `library/mdrg_items.d.lua`

Callback:
- `nutritionProfileFiller: fun(item: Item, nutritionProfile: EdibleItemNutritionProfile)`

Likely runtime context:
- Executed when the game creates/evaluates nutrition data for an edible item.
- Receives item instance and mutable nutrition profile object.
- The closure is expected to mutate `nutritionProfile`.

Evidence:
- Seen in `luas/foods.lua` or similar extracted mod scripts.

Probe idea:
- Instrument inside the closure to dump `item`, `nutritionProfile`, globals and accessible fields.
```

---

# Parte 2 — Callback contexts importantes para procurar

Procure especialmente por estes tipos de callbacks nos stubs.

## Itens / comida / prefabs

Exemplos esperados:

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

O caso de maior prioridade é:

```txt
EdibleItemPrefabData.CreateInstance(EdibleTypeEnum, fun(item: Item, nutritionProfile: EdibleItemNutritionProfile))
```

porque já existe evidência real no exemplo de comida.

## Story / diálogo / condições

Procure callbacks em:

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

Esses podem rodar em contexto de story/Fungus e talvez tenham `flowchart`, `gv` ou outros globals disponíveis.

## UI / popups / browser

Procure callbacks em:

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

Esses podem rodar com contexto de UI aberto e argumentos específicos.

## Cooking/minigame

Procure callbacks como:

```txt
CookingSong.RuntimeDataGenerator
CookingSong.IsUnlockedFunc
CookingSongRuntimeData_Builder.ChannelToNotes buttonDeterminer
createDishItemFunc
```

Esses podem rodar em contexto de minigame/cooking.

## Unity/helpers

Procure callbacks como:

```txt
parameterGetter
ColorExtractionFunc
ParticleSystem action
View callbacks
Texture/Sprite conversion functions
```

---

# Parte 3 — Analisar scripts reais em `luas/`

Ler a pasta `luas/`, se existir.

Procurar padrões:

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

Criar uma seção no relatório:

```md
## Callback usage found in extracted Lua mods
```

Exemplo:

```md
### foods.lua

Patterns:
- `EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Beverage, ntf)`
- `ntf(item, nutritionProfile)`
- Mutates `nutritionProfile.Satiation.Value`

Likely callback context:
- nutrition profile filling for food/beverage items.
```

Não modificar `luas/`.

---

# Parte 4 — Criar helper opt-in para probe dentro de closures

Criar um arquivo novo, por exemplo:

```txt
examples/mdrg_callback_context_probe.lua
```

Esse arquivo deve ser um helper pequeno e autocontido para ser copiado/usado manualmente dentro de callbacks.

Ele não deve rodar sozinho em todos os contextos nem alterar comportamento por padrão.

## Objetivo do helper

Permitir que um modder instrumente callbacks assim:

```lua
local probe = MDRG_CALLBACK_PROBE

local ntf = function(item, nutritionProfile)
  probe("EdibleItemPrefabData.NutritionProfileFiller", {
    item = item,
    nutritionProfile = nutritionProfile,
  })

  nutritionProfile.Satiation.Value = 0.1
end
```

Ou, se preferir wrapper:

```lua
local ntf = probe_wrap("EdibleItemPrefabData.NutritionProfileFiller", function(item, nutritionProfile)
  nutritionProfile.Satiation.Value = 0.1
end, { "item", "nutritionProfile" })
```

O wrapper deve:

1. registrar o contexto;
2. registrar argumentos;
3. chamar a função original;
4. retornar os mesmos valores;
5. não engolir erro sem reportar;
6. não alterar comportamento esperado.

## Configuração

O helper deve ter flags:

```lua
local ENABLE_CALLBACK_PROBE = false
local CALLBACK_PROBE_ONCE_PER_CONTEXT = true
local CALLBACK_PROBE_MAX_CALLS = 10
local CALLBACK_PROBE_DEEP_ARGS = false
```

Por padrão:

```txt
ENABLE_CALLBACK_PROBE = false
```

Ou seja: não deve gerar dump sem o usuário ativar explicitamente.

## O que coletar dentro da closure

Quando ativado, registrar:

```txt
callback name
timestamp
call count
CurrentModGuid present/missing
GameVariables present/missing
gv present/missing
flowchart present/missing
io/io.open present/missing
effective GameVariables source
argument names
argument types
argument tostring
argument metatable presence
safe field probe dos argumentos
known field probe por tipo aparente
```

Para exemplo `nutritionProfile`, tentar campos seguros:

```txt
Satiation
Health
MentalHealth
Stamina
```

E para cada campo:

```txt
Value
MinValue
MaxValue
```

Somente leitura, exceto o callback original do usuário continuar fazendo o que já fazia.

O probe não deve modificar `nutritionProfile`; apenas observar antes/depois se o usuário ativar comparação.

Opcional:

```lua
CALLBACK_PROBE_COMPARE_BEFORE_AFTER = false
```

Se `true`, capturar campos antes e depois da função original para saber o que mudou. Isso deve ser opt-in.

---

# Parte 5 — Wrapper seguro de callback

Se implementar wrapper, use algo assim conceitualmente:

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
      -- report error, then rethrow so behavior is not hidden
      error(err)
    end

    table.remove(results, 1)
    return unpack(results)
  end
end
```

Adaptar para Lua 5.2/MoonSharp.

Atenção:

- `unpack` pode ser global ou `table.unpack`.
- Não usar Lua 5.4.
- Não depender de externos.
- Se `io.open` não existir, fallback para `print` em chunks.
- Se safe IO existir, usar o writer já conhecido.

---

# Parte 6 — Report de callback context

O helper deve gerar report separado ou seção com nome claro.

Sugestão de arquivo:

```txt
callback-report-YYYYMMDD-HHMMSS.txt
```

Ou, se integrado ao probe:

```txt
report-YYYYMMDD-HHMMSS-callbacks.txt
```

Formato sugerido:

```txt
# MDRG Callback Context Report
Generated at: ...
Probe context label: ...

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
effective_gamevariables_source: ...

## Arguments
arg1 item: userdata <...>
arg2 nutritionProfile: userdata <...>

## Argument Field Probe
nutritionProfile.Satiation: userdata
nutritionProfile.Satiation.Value: number
nutritionProfile.Health: userdata
nutritionProfile.Health.Value: number
...
```

Adicionar blocos machine-readable:

```txt
BEGIN_MDRG_CALLBACK_CONTEXT
callback|EdibleItemPrefabData.NutritionProfileFiller
phase|before
current_mod_guid_present|true
gamevariables_present|false
gv_present|false
flowchart_present|false
io_open_present|true
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

# Parte 7 — Integrar com `tools/probe_runtime_index.py`

Atualizar o ingestor para reconhecer os novos blocos, se existirem:

```txt
BEGIN_MDRG_CALLBACK_CONTEXT
END_MDRG_CALLBACK_CONTEXT
BEGIN_MDRG_CALLBACK_ARGS
END_MDRG_CALLBACK_ARGS
BEGIN_MDRG_CALLBACK_FIELDS
END_MDRG_CALLBACK_FIELDS
```

Se os blocos não existirem, manter compatibilidade com reports antigos.

O índice deve armazenar:

```json
{
  "callback_contexts": [
    {
      "name": "EdibleItemPrefabData.NutritionProfileFiller",
      "phase": "before",
      "args": [...],
      "fields": [...]
    }
  ]
}
```

Não precisa ser perfeito. O objetivo é permitir comparar contextos.

---

# Parte 8 — Criar exemplos de instrumentação

Criar exemplos em `examples/`, sem execução automática.

Sugestões:

```txt
examples/callback_probe_food_nutrition.lua
examples/callback_probe_item_on_use.lua
examples/callback_probe_story_condition.lua
```

## `callback_probe_food_nutrition.lua`

Deve mostrar o padrão:

```lua
local ntf = probe_wrap("EdibleItemPrefabData.NutritionProfileFiller", function(item, nutritionProfile)
  nutritionProfile.Satiation.Value = 0.1
end, { "item", "nutritionProfile" })

local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Beverage, ntf)
```

Adicionar comentário:

```txt
Este exemplo é opt-in. Copie o helper e ative ENABLE_CALLBACK_PROBE=true para gerar report.
```

## `callback_probe_item_on_use.lua`

Mostrar como instrumentar:

```lua
itemprefab.OnUse = probe_wrap("ItemPrefab.OnUse", function(item)
  return true
end, { "item" })
```

Não chamar por conta própria.

## `callback_probe_story_condition.lua`

Mostrar:

```lua
local condition = probe_wrap("StoryCondition.Lua", function()
  return true
end, {})
```

Não conectar a story real sem o usuário adaptar.

---

# Parte 9 — Documentar contextos conhecidos

Criar ou atualizar:

```txt
analysis/runtime_context_notes.md
```

Adicionar seção:

```md
## Callback / closure contexts

Some Lua functions are executed later by the game, with a different runtime context than the script that registered them.

Known examples:
- food nutrition profile filler;
- item use/unpack callbacks;
- story condition callbacks;
- UI popup callbacks;
- cooking/minigame callbacks.

These contexts should be probed by wrapping the callback itself, not by only running `mdrg_env_probe.lua` at startup.
```

Incluir matriz:

```md
| Context | CurrentModGuid | GameVariables | gv | flowchart | typical use |
|---|---:|---:|---:|---:|---|
| mod startup / OnGameStart-like | yes | no | no | no | register items, shops, prefabs |
| LuaExec scene/Fungus | no | no | yes | yes | inspect save/flowchart context |
| callback: food nutrition filler | unknown | unknown | unknown | unknown | inspect item + nutritionProfile args |
| callback: item OnUse | unknown | unknown | unknown | unknown | inspect item and use-time context |
| callback: story condition | unknown | unknown | unknown | maybe | inspect story/Fungus context |
```

---

# Parte 10 — Segurança

Manter tudo defensivo:

- Não chamar callbacks automaticamente.
- Não criar item automaticamente nos exemplos, exceto como exemplo de código para o usuário adaptar.
- Não chamar `SaveAllChanges`, `AddGlobalFlag`, `ForceTakeMoney`, `OpenBrowser`, etc.
- Não chamar `io.popen`.
- Não assumir que `io` é nativo; tratar como safe IO/plugin bridge quando presente.
- Não editar stubs gerados manualmente.
- Não usar callbacks de exemplo em build normal.
- Não alterar comportamento original do callback quando wrapper for usado.
- Se o callback original erra, rethrow do erro após registrar.
- Se callback original retorna valores, preservar retornos.

---

# Validação sugerida

Depois de implementar, rodar:

```powershell
rg -n "fun\\(" library
rg -n "CreateInstance\\(|OnUse|OnUnpack|SpecialEffectAction|RandomItemPostProcessing|NutritionProfile|function\\(" luas examples
rg -n "BEGIN_MDRG_CALLBACK|callback_probe|probe_wrap|ENABLE_CALLBACK_PROBE" examples tools analysis
python -m py_compile tools\catalog_lua_callbacks.py tools\probe_runtime_index.py
```

Se o projeto tiver wrapper central de dev:

```powershell
python .\tools\dev.py check
```

Se LuaLS não estiver no PATH, tratar como aviso local, não falha fatal.

---

# Entrega esperada

Ao final, entregar:

1. Resumo do que foi adicionado.
2. Arquivos criados/alterados.
3. Lista curta dos principais callback contexts encontrados nos stubs.
4. Lista curta dos padrões encontrados em `luas/`.
5. Explicação de como usar o helper dentro de uma closure.
6. Confirmação de que o helper é opt-in/desativado por padrão.
7. Confirmação de que callbacks não são chamados automaticamente.
8. Confirmação de que retornos/erros da função original são preservados pelo wrapper.
9. Se houver `git diff`, mostrar o diff relevante.

Não rode o jogo.
Não altere stubs gerados manualmente.
Não assuma que `OnSaveLoad` existe sem evidência.

# Prompt para Codex — Debug Plugin MDRG para testar lifetime, callbacks e closures Lua

Você está trabalhando no repositório atual do addon LuaLS MDRG/MoonSharp.

Já existem reports runtime gerados por:

```txt
examples/mdrg_env_probe.lua
```

E já foi observado que o ambiente Lua/MoonSharp muda bastante dependendo do contexto:

- mod real carregado na inicialização;
- LuaExec/exec depois de save/cena;
- callback/closure executada pelo jogo;
- safe IO injetado pelo plugin/LuaPatch;
- contexto Fungus/flowchart;
- contexto de save/GameVariables.

Agora quero propor uma melhoria maior: criar um **debug plugin/mod Lua** para registrar itens e rotinas de teste que forcem o jogo a executar callbacks/closures em contextos reais, gerando reports específicos.

---

## Objetivo principal

Criar um plano e, se possível, implementar uma base inicial de um **MDRG Callback Debug Plugin**.

Esse plugin deve:

1. Rodar como mod real no jogo.
2. Registrar itens/prefabs/shops/casos de teste durante `OnGameStart` ou fase equivalente.
3. Usar APIs existentes dos stubs e padrões reais encontrados em `luas/`.
4. Criar itens de debug que acionam callbacks Lua reais.
5. Instrumentar callbacks com um wrapper de probe.
6. Gerar reports quando as closures forem executadas pelo jogo.
7. Ajudar a mapear quais APIs recebem `fun(...)`.
8. Ajudar a descobrir em qual lifetime/contexto cada callback roda.
9. Não chamar callbacks artificialmente se o jogo normalmente deveria chamar.
10. Não alterar save permanentemente sem aviso claro.
11. Ser opt-in e isolado como mod/debug plugin.

---

# Ideia central: lifetime/context model

Adicione explicitamente este modelo mental nos docs/plano.

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
ShopManager / shop APIs, se disponíveis
safe IO, se plugin injetou
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

## 3. Callback/closure invocation context

É quando o jogo chama uma closure Lua registrada anteriormente.

Exemplo:

```lua
local ntf = function(item, nutritionProfile)
  nutritionProfile.Satiation.Value = 0.1
end

local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Beverage, ntf)
```

Nesse caso, a closure só roda quando o jogo avalia/cria o perfil nutricional.

Esse contexto pode conter:

```txt
argumentos reais
item real
nutritionProfile real
possíveis globals diferentes
estado de save/cena dependendo do momento
```

Regra importante:

```txt
Treat every Lua callback/closure accepted by the MDRG API as a possible lifecycle boundary.
```

Ou seja: toda API que aceita `fun(...)` pode trocar o contexto de execução.

---

# Contexto observado nos reports

## Mod startup / OnGameStart-like

Reports de mod real mostraram:

```txt
CurrentModGuid: present
ModUtilities: present
GameUtilities: present
GameVariables: missing
gv: missing
flowchart: missing
io: depends on safe IO injection
```

Interpretação:

```txt
O mod está em contexto de registro/inicialização.
O save/cena/Fungus ainda não está disponível.
Ausência de GameVariables/gv/flowchart não significa que a API não exista.
Significa que ela não está disponível nesse lifetime.
```

## LuaExec / scene/Fungus

Reports via LuaExec depois do save/cena mostraram:

```txt
CurrentModGuid: missing
gv: present
flowchart: present
GameVariables: missing
```

Interpretação:

```txt
Contexto manual/injetado/cena.
Bom para observar GameVariables legado via gv e Flowchart/Fungus via flowchart.
Não representa mod startup normal.
```

## Safe IO

Safe IO pode adicionar:

```txt
io
io.open
io.write
io.read
io.popen
io.tmpfile
```

Interpretação:

```txt
io deve ser tratado como bridge externa do plugin/LuaPatch.
Não é necessariamente API nativa do MDRG.
io.popen deve ser classificado como sensível/perigoso mesmo se a implementação bloquear.
```

---

# Parte 1 — Catalogar callbacks nos stubs

Crie ou atualize uma ferramenta leve, por exemplo:

```txt
tools/catalog_lua_callbacks.py
```

Ela deve procurar nos stubs:

```txt
---@param ... fun(...)
---@field ... fun(...)
---@return ... fun(...)
```

Também procure por `function` em descrições geradas, se existirem.

Gerar:

```txt
analysis/lua_callback_contexts.md
```

Para cada callback encontrado:

```txt
- arquivo;
- linha;
- classe/função/campo dono;
- nome do parâmetro ou field;
- assinatura da closure;
- tipos dos argumentos;
- tipo de retorno;
- contexto provável;
- se parece registration-time, runtime, UI, item, story, cooking, save, etc.;
- risco provável;
- se aparece em `luas/`.
```

Exemplo esperado:

```md
## EdibleItemPrefabData.CreateInstance

Source:
- `library/mdrg_items.d.lua`

Callback:
- `nutritionProfileFiller: fun(item: Item, nutritionProfile: EdibleItemNutritionProfile)`

Likely lifecycle:
- Registered during mod startup.
- Invoked later when the game needs to evaluate nutrition profile.

Arguments:
- `item`
- `nutritionProfile`

Debug plugin test:
- Create a debug beverage item that uses a wrapped nutrition profile filler.
- Add it to a debug shop.
- When the item is consumed/evaluated, generate callback report.
```

---

# Parte 2 — Analisar `luas/`

A pasta `luas/` contém scripts extraídos de mods reais, como:

```txt
foods.lua
clothes.lua
```

Use essa pasta para descobrir padrões reais.

Não mover, não apagar e não modificar esses arquivos.

Procurar padrões:

```txt
function(...)
(function(...)
= function(...)
CreateInstance(... function
OnUse = function
OnUnpack = function
SpecialEffectAction = function
RandomItemPostProcessing = function
EdibleData = (function()
NutritionProfile
Satiation
ModUtilities.CreateItemPrefab
ModUtilities.CreateNewItemAutoAssignId
AddSingleBuyItemToShop
```

Gerar no relatório:

```md
## Callback usage found in extracted Lua mods
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

---

# Parte 3 — Criar helper de callback probe

Criar:

```txt
examples/mdrg_callback_context_probe.lua
```

Ou, se fizer mais sentido, uma pasta:

```txt
examples/callback_debug/
```

O helper deve permitir:

```lua
local ntf = MDRG_CALLBACK_PROBE.wrap(
  "EdibleItemPrefabData.NutritionProfileFiller",
  function(item, nutritionProfile)
    nutritionProfile.Satiation.Value = 0.1
  end,
  { "item", "nutritionProfile" }
)
```

## Requisitos do wrapper

O wrapper deve:

1. Registrar o contexto antes da closure.
2. Registrar argumentos.
3. Chamar a closure original.
4. Registrar o contexto depois da closure, se configurado.
5. Retornar exatamente os mesmos valores.
6. Repassar erros do callback original.
7. Não engolir exceções silenciosamente.
8. Não alterar comportamento esperado do callback.
9. Não chamar callbacks por conta própria.
10. Ser opt-in.

## Configuração

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

Ou seja: nada deve gerar report sem ativação manual.

## Writer

Usar writer parecido com `mdrg_env_probe.lua`:

- se `io.open` existir, salvar em arquivo;
- se não existir, usar `print` em chunks;
- não assumir que `io` é nativo;
- marcar safe IO como bridge externa quando `io` existir.

Nome sugerido:

```txt
callback-report-YYYYMMDD-HHMMSS.txt
```

---

# Parte 4 — O que o callback probe deve coletar

Dentro da closure, coletar:

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

Para argumentos conhecidos, fazer probes específicos.

## Para `nutritionProfile`

Tentar campos seguros:

```txt
Satiation
Health
MentalHealth
Stamina
```

E dentro de cada um:

```txt
Value
MinValue
MaxValue
```

Usar `pcall`.

Não modificar esses campos no probe.

A closure original do usuário pode modificar, mas o probe não.

## Para `item`

Tentar campos/métodos por index, sem chamar métodos:

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

Não chamar métodos por padrão; apenas registrar que existem.

---

# Parte 5 — Report de callback

Formato sugerido:

```txt
# MDRG Callback Context Report
Generated at: ...
Callback probe version: ...

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
nutritionProfile.Health: userdata
nutritionProfile.Health.Value: number
```

Adicionar blocos machine-readable:

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

Atualizar `tools/probe_runtime_index.py` para reconhecer esses blocos se existirem, mantendo compatibilidade com reports antigos.

---

# Parte 6 — Debug plugin/mod que registra itens para testar callbacks

Criar um exemplo de mod/plugin de debug em `examples/`.

Sugestão de estrutura:

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

Não precisa criar tudo se ficar grande. Priorizar o caso de comida.

## Objetivo do debug plugin

Durante `OnGameStart`/registration-time:

1. Criar itens/prefabs de debug.
2. Registrar callbacks instrumentados com `MDRG_CALLBACK_PROBE.wrap`.
3. Adicionar os itens em shop de debug ou shop existente, por exemplo `clothier`, se confirmado nos scripts.
4. Descrever como o usuário testa manualmente no jogo.
5. Gerar reports quando o jogo executar os callbacks.

## Caso 1 — Food nutrition profile callback

Criar item de debug baseado no exemplo real:

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

## Como testar

README deve explicar:

```txt
1. Instale o debug mod.
2. Inicie o jogo.
3. Carregue um save.
4. Abra a loja onde o item foi registrado.
5. Compre/use/coma o item de debug.
6. Verifique `callback-report-*.txt` ou console.
7. Compare com `report-*.txt` de startup e LuaExec.
```

## Segurança do debug item

- Preço baixo.
- Nome começa com `Debug`.
- Não mexe em save além de registrar item/shop.
- Não chamar funções destrutivas.
- O callback só altera nutritionProfile como o próprio exemplo real já faz.
- Se possível, criar flag para não adicionar ao shop automaticamente:

```lua
local DEBUG_ADD_TO_SHOP = false
```

Por padrão, considere deixar `false` se houver risco de poluir save. Se o objetivo for teste manual rápido, deixe documentado como ativar.

---

# Parte 7 — Gerar casos a partir dos stubs e `luas/`

Depois de catalogar callbacks, o Codex deve propor casos de teste.

Não precisa implementar todos.

Gerar em:

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

Outros possíveis casos:

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

Para cada um, classificar:

```txt
priority
risk
evidence
manual test steps
whether it mutates save/UI/game state
```

---

# Parte 8 — Adicionar lifecycle docs

Criar ou atualizar:

```txt
analysis/runtime_context_notes.md
```

Adicionar:

```md
## Lifetime / Context Model

| Context | CurrentModGuid | GameVariables | gv | flowchart | Typical use |
|---|---:|---:|---:|---:|---|
| mod startup / OnGameStart-like | yes | usually no | no | no | register items, prefabs, callbacks |
| LuaExec scene/Fungus | usually no | no | yes | yes | inspect live scene/save context |
| callback: food nutrition filler | unknown | unknown | unknown | unknown | receives item + nutritionProfile |
| callback: item OnUse | unknown | unknown | unknown | unknown | receives item/use context |
| callback: story condition | unknown | unknown | unknown | maybe | story/Fungus context |
```

Adicionar nota:

```txt
Absence in OnGameStart does not mean absence in every context.
Many APIs are only meaningful later, during runtime or inside callbacks.
```

---

# Parte 9 — Investigar eventos/lifecycle por nome

Usar os arquivos do repo para procurar eventos:

```powershell
rg -n "OnGameStart|OnGameLoad|OnSaveLoad|OnSaveLoaded|OnLoad|OnSave|OnDayStart|OnSceneLoaded|OnUpdate|OnTick|OnUse|OnUnpack" .
```

Adicionar os achados em:

```txt
analysis/lifecycle_event_clues.md
```

Não assumir que `OnSaveLoad` existe.

Se não houver evidência de `OnSaveLoad`, escrever:

```txt
No direct Lua-level OnSaveLoad hook confirmed from current files.
A C#/MelonLoader bridge may be needed to expose this as a Lua event.
```

---

# Parte 10 — Segurança e limites

Manter estes limites:

- Debug plugin deve ser claramente opt-in.
- Não deve ser incluído como parte normal do addon LuaLS.
- Não deve rodar automaticamente em produção.
- Não deve chamar callbacks artificialmente.
- Não deve chamar `SaveAllChanges`, `ResetAllData`, `ForceTakeMoney`, `OpenBrowser`, `ChangeWebsite`, etc.
- Não deve usar `io.popen`.
- Não deve assumir que safe IO é nativo.
- Não deve modificar stubs gerados manualmente.
- Não deve esconder erros das callbacks.
- Não deve quebrar retorno das callbacks.
- Não deve executar ações destrutivas para gerar report.
- Deve usar `pcall` em todo acesso arriscado.
- Deve preservar comportamento original das closures instrumentadas.

---

# Validação sugerida

Rodar ou sugerir:

```powershell
rg -n "fun\\(" library
rg -n "CreateInstance\\(|OnUse|OnUnpack|SpecialEffectAction|RandomItemPostProcessing|NutritionProfile|function\\(" luas examples
rg -n "BEGIN_MDRG_CALLBACK|callback_probe|probe_wrap|ENABLE_CALLBACK_PROBE|DEBUG_ADD_TO_SHOP" examples tools analysis
rg -n "SaveAllChanges\\(|ResetAllData\\(|ForceTakeMoney\\(|OpenBrowser\\(|ChangeWebsite\\(|io\\.popen\\(" examples
python -m py_compile tools\catalog_lua_callbacks.py tools\probe_runtime_index.py
```

Se houver ferramenta central:

```powershell
python .\tools\dev.py check
```

Se LuaLS não estiver no PATH, tratar como aviso.

---

# Entrega esperada

Ao final, entregue:

1. Resumo do que foi adicionado.
2. Arquivos criados/alterados.
3. Principais callbacks `fun(...)` encontrados nos stubs.
4. Padrões encontrados em `luas/`.
5. Casos de debug plugin propostos.
6. Se implementou o caso de comida, explicar como testar no jogo.
7. Confirmação de que o debug plugin é opt-in.
8. Confirmação de que callback probe vem desativado por padrão.
9. Confirmação de que callbacks não são chamados artificialmente.
10. Confirmação de que o wrapper preserva retorno/erro da função original.
11. Diff relevante.

Não rode o jogo.
Não altere stubs gerados manualmente.
Não assuma `OnSaveLoad` sem evidência.

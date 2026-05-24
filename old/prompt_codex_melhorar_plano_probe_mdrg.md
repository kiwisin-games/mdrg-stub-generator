# Prompt para Codex — Melhorar o plano do Probe Runtime MDRG/MoonSharp

Você está trabalhando no repositório atual do addon/stubs LuaLS para MDRG/MoonSharp.

Existe um plano para criar `examples/mdrg_env_probe.lua`, um script Lua autocontido que roda dentro do jogo e gera um `report-YYYYMMDD-HHMMSS.txt` com informações do ambiente runtime.

Quero que você **melhore esse plano antes de implementar**, incorporando as melhorias abaixo de forma prática, segura e sem tornar o escopo grande demais.

## Objetivo principal

Atualizar o plano do `mdrg_env_probe.lua` para que ele ajude melhor a:

- descobrir APIs, globals, enums, funções, tabelas, metatables e userdata expostos no runtime;
- comparar o que existe no runtime com os stubs atuais;
- classificar riscos de APIs para evitar chamadas perigosas;
- gerar evidência revisável para futuras melhorias nos stubs;
- manter o script read-only, defensivo e compatível com Lua/MoonSharp.

O resultado esperado desta etapa é um **plano melhorado**, não necessariamente a implementação imediata.

---

## Contexto do plano atual

O plano atual já cobre:

- criação de `examples/mdrg_env_probe.lua`;
- geração de `report-YYYYMMDD-HHMMSS.txt`;
- fallback para `print` se `io.open` não existir;
- limites defensivos:
  - `MAX_DEPTH = 4`;
  - `MAX_KEYS_PER_TABLE = 200`;
  - `MAX_STRING_LEN = 500`;
  - `MAX_TOTAL_LINES = 50000`;
- uso de `pcall`;
- proteção contra ciclos com `visited`;
- dump de globals;
- dump limitado de tabelas;
- dump de metatables;
- introspection segura de userdata;
- comparação de símbolos conhecidos;
- seção `Known Stub Symbols Present/Missing`;
- seção `Enum-like Tables / Constants`;
- validações seguras/context-aware;
- não alterar save, inventário, flags, dinheiro, UI, cenas, lojas, assets ou estado persistente.

Preserve essas ideias.

---

# Melhorias a incorporar no plano

## 1. API Safety Map

Adicionar ao plano uma seção de report chamada:

```txt
## API Safety Map
```

Essa seção deve tentar classificar funções/métodos encontrados ou conhecidos em categorias de risco.

Categorias sugeridas:

```txt
Read-only
Context-dependent
State-changing
UI-changing
Save-changing
Dangerous/Destructive
Unknown
```

A classificação deve ser conservadora. Se não houver certeza, usar `Unknown` ou `Context-dependent`.

### Heurísticas sugeridas

Classificar por nome/caminho, sem chamar as funções:

#### Provavelmente read-only

Nomes contendo:

```txt
Get
Has
Is
Can
Check
Find
TryGet
ToString
ToLuaString
Calculate
Determine
Format
GenerateCode
Explain
Status
Summary
```

Atenção: `Generate` pode criar estado em alguns contextos. Classificar `GenerateCode` e `GenerateTrackingNumber` com cuidado. Se houver dúvida, marcar como `Context-dependent`.

#### Provavelmente state-changing

Nomes contendo:

```txt
Set
Add
Remove
Delete
Clear
Reset
Force
Take
Give
Unlock
Report
Apply
Fill
Replace
Sync
Update
Initialize
NewGame
Transition
Repair
Eat
Swallow
Clean
Manifest
End
Begin
Start
Stop
Activate
Deactivate
Open
Close
Change
Move
Fade
Save
Load
Push
Override
Create
Duplicate
Join
Split
Sort
Optimize
Reload
```

Nem todos são perigosos, mas devem ser tratados como mutantes/context-dependent no probe.

#### Save-changing ou persistente

Nomes/caminhos contendo:

```txt
Save
Slot
Autosave
Achievement
GlobalFlag
Flag
Money
Inventory
Email
Delivery
Contract
Rent
Stats
GameVariables
SaveContainer
SaveSingleton
```

#### UI-changing/context-dependent

Nomes/caminhos contendo:

```txt
Popup
Browser
Ui
View
Scene
Overlay
Open
Close
ChangeWebsite
FadeToView
MoveToView
Refresh
SelectEmail
PrintLine
ClearScreen
StartPlayerInput
```

### Saída esperada no report

Exemplo:

```txt
## API Safety Map

Read-only:
- GameVariables:GetCumPercent
- GameVariables:HealthStatus
- GameId:ToString

Context-dependent:
- GameUtilities:FadeToView
- BrowserPopup:ChangeWebsite

State-changing:
- GameVariables:AddMoney
- GameVariables:SetPlayerName

Save-changing:
- SaveContainer:AddGlobalFlag
- SaveSingleton:SaveAllChanges

Unknown:
- SomeRuntimeObject:UnknownMethod
```

Importante: o probe deve **listar e classificar**, não chamar.

---

## 2. Callable Inventory

Adicionar ao plano uma seção de report chamada:

```txt
## Callable Inventory
```

Essa seção deve listar funções encontradas por nome/caminho/tipo, sem executá-las.

Exemplo:

```txt
_G.print : function
json.parse : function
GameVariables.CheckFlag : function
GameVariables.TimeInDay : function
BrowserPopup.ChangeWebsite : function
```

### Requisitos

- Não chamar funções descobertas automaticamente.
- Registrar caminho completo quando possível.
- Registrar origem aproximada:
  - global;
  - campo de tabela;
  - metatable;
  - userdata known field;
  - known stub symbol.
- Aplicar limites:
  - máximo por tabela;
  - máximo total;
  - não expandir agressivamente userdata.

### Uso futuro

O `Callable Inventory` deve ajudar a:

- descobrir métodos ainda não documentados;
- comparar funções runtime com stubs;
- alimentar futuramente um `API_INDEX.md`;
- alimentar o `API Safety Map`.

---

## 3. Top-level Tables Snapshot

Adicionar ao plano uma seção de report chamada:

```txt
## Top-level Tables Snapshot
```

Essa seção deve listar tabelas globais grandes sem expandir tudo.

Exemplo:

```txt
GameVariables : table, keys ~= 180, functions ~= 60, fields ~= 120
Item : table, keys ~= 80, functions ~= 70, fields ~= 10
json : table, keys ~= 4, functions ~= 3
string : table, keys ~= 20, functions ~= 20
```

### Requisitos

Para cada tabela top-level:

- nome;
- tipo;
- quantidade aproximada de chaves acessíveis;
- quantidade de funções;
- quantidade de subtabelas;
- quantidade de userdata;
- quantidade de valores escalares;
- se possui metatable;
- se parece enum-like/constant-like.

Isso deve ser mais barato e seguro que dump completo.

---

## 4. Melhorar `Enum-like Tables / Constants`

O plano já tem uma seção para enums/constants. Melhore com estes detalhes:

### Detectar enum-like por:

- nome terminando em:
  - `Enum`;
  - `Flag`;
  - `Type`;
  - `Category`;
  - `Slot`;
  - `State`;
  - `Mode`;
- maioria dos campos acessíveis ser:
  - `string`;
  - `number`;
  - `boolean`;
- ausência ou baixa quantidade de funções;
- tabela pequena ou média;
- nomes conhecidos nos stubs.

### Exemplos conhecidos

Tentar detectar, se existirem no runtime:

```txt
ItemEnum
ControllerEnum
SceneEnumFlag
ColoringGroupEnum
FishingBaitType
ItemCategory
ScratchTextureType
CheckType
DeliveryStatus
EquipResults
EyeSelection
ArmState
```

### Regra de precisão

O relatório deve escrever:

```txt
enum-like
constant-like
known enum from stubs
```

Não escrever “enum confirmado” se a evidência for só heurística.

---

## 5. Known Stub Symbols mais útil

Melhorar a lista `KNOWN_STUB_SYMBOLS`.

Ela deve incluir, quando fizer sentido:

### Runtime Lua/MoonSharp

```txt
_G
_VERSION
_MOONSHARP
CurrentModGuid
json
pairs
next
type
tostring
print
pcall
xpcall
getmetatable
setmetatable
rawget
rawset
package
coroutine
os
debug
string
table
math
```

### APIs MDRG centrais

```txt
ModUtilities
GameUtilities
GameVariables
Item
ItemPrefab
ItemPrefabManager
ItemManager
GameId
Guid
ColorSlot
ColorPalette
ColorPaletteEntry
ColorPaletteManager
SimpleLocalizedString
SaveContainer
SaveSingleton
StoryCondition
StoryBotDialogueBranch
Flowchart
BrowserPopup
BotStatusAppPopup
UiOverlay
TextureOverriderManager
LuaPersonalityModuleDefinition
```

### Enums/aliases/tabelas frequentes

```txt
ItemEnum
ControllerEnum
SceneEnumFlag
ColoringGroupEnum
FishingBaitType
ItemCategory
CheckType
DeliveryStatus
EquipResults
EyeSelection
ArmState
MdrgKnownWebsiteId
MdrgKnownStoryFlagId
MdrgKnownPaletteName
```

Observação: aliases `MdrgKnown...` podem não existir em runtime porque são apenas LuaLS. O report deve distinguir:

```txt
Runtime symbol expected
Stub-only alias expected
```

Não marcar aliases de stub como erro real se não aparecem no runtime.

---

## 6. Report Ingester — apenas como etapa futura

Adicionar ao plano uma seção chamada:

```txt
## Future Tooling: Probe Report Ingester
```

Não implementar agora.

Descrever uma etapa futura:

```txt
tools/ingest_probe_report.py
```

Esse script poderia ler `report-*.txt` e gerar:

```txt
docs/probe_findings.md
```

Com sugestões de:

- globals novos;
- funções novas;
- enum-like tables;
- userdata/metatables observados;
- símbolos dos stubs ausentes no runtime;
- divergências de tipo;
- possíveis aliases novos.

Importante:

- Não editar stubs automaticamente no começo.
- Gerar apenas sugestões revisáveis.
- Reports runtime são evidência auxiliar, não fonte autoritativa automática.

---

## 7. Stub Confidence Level — como metadado futuro

Adicionar ao plano uma seção curta:

```txt
## Future Metadata: Stub Confidence Level
```

Não implementar agora, apenas registrar a ideia.

Sugestão de níveis:

```txt
high    = confirmado por docs + uso runtime/probe
medium  = inferido por assinatura + scripts extraídos
low     = vindo do dump, não testado runtime
unknown = sem evidência suficiente
```

Isso pode virar futuramente:

```json
{
  "GameVariables.GetCumPercent": "high",
  "BrowserPopup.ChangeWebsite": "medium",
  "SomeInternalType.SomeMethod": "low"
}
```

---

## 8. Exemplos smoke LuaLS — etapa futura

Adicionar ao plano uma seção futura:

```txt
## Future Tooling: LuaLS Smoke Examples
```

Não implementar agora.

Ideia:

```txt
test-workspace/
├── .luarc.json
└── smoke/
    ├── gamevariables.lua
    ├── item_prefab.lua
    ├── story_dialogue.lua
    ├── ui.lua
    └── stdlib.lua
```

Esses arquivos não rodam no jogo. Servem para validar autocomplete/hover/diagnósticos do LuaLS.

---

# O que manter fora do escopo agora

Não implementar nesta etapa:

- `tools/ingest_probe_report.py`;
- `API_INDEX.md`;
- `API_SAFETY.md`;
- exemplos smoke LuaLS;
- confidence metadata JSON;
- alterações nos stubs `.d.lua`;
- alterações em `data/*.json`;
- alterações no gerador de stubs;
- reestruturação de pastas.

O foco continua sendo:

```txt
examples/mdrg_env_probe.lua
```

e o plano melhorado para ele.

---

# Ajustes de segurança obrigatórios

Reforce no plano:

- o script é read-only por design;
- não chama funções descobertas automaticamente;
- não chama funções classificadas como mutantes/context-dependent;
- todo acesso arriscado usa `pcall`;
- userdata não recebe brute force agressivo;
- dumps têm limites de profundidade, chaves, strings e linhas;
- o script pode falhar parcialmente sem quebrar a execução inteira;
- quando não houver contexto de save/cena, deve registrar skip em vez de tentar forçar.

---

# Entrega esperada

Atualize o plano atual com essas melhorias e mostre:

1. Um resumo do que foi adicionado.
2. O plano revisado.
3. O que ficou explicitamente fora do escopo.
4. Qual seria a próxima etapa segura para implementar.

Não implemente ainda, a menos que eu peça explicitamente.

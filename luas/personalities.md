# Documentação de `personalities.lua`

Arquivo analisado: `personalities.lua`  
Objetivo do arquivo: registrar itens do tipo **módulo de personalidade** na loja do jogo.

> Observação: este relatório documenta estrutura, APIs e padrões. O conteúdo textual sensível das descrições/falas não é reproduzido como documentação principal.

---

## 1. Resumo

| Métrica | Valor |
|---|---:|
| Linhas | `228` |
| Tamanho aproximado | `8882 bytes` |
| Itens criados | `10` |
| `CreateItemPrefab()` | `10` |
| `CreateNewItemAutoAssignId()` | `10` |
| `AddSingleBuyItemToShop()` | `10` |
| `SlotEquipData.CreateInstance()` | `10` |
| Funções declaradas | `0` |
| `PrepareNewPersonalityDefinition()` | `0` |
| `TurnIntoPersonalityModule()` | `0` |
| `PrepareContainer()` | `0` |
| `StoryBotDialogueBranch.__new()` | `0` |

Resumo prático:

- O arquivo cria **10 módulos de personalidade**.
- Todos são vendidos em `ladyparts.ic`.
- Todos usam `SlotData = SlotEquipData.CreateInstance('PersonalityModule')`.
- Todos usam `ItemCategory.Modules`.
- Todos são marcados como ilegais: `IsIllegal = true`.
- Todos são não empilháveis: `IsStackable = false`.
- Nenhum módulo define diálogos diretamente neste arquivo.
- Nenhum módulo usa `PrepareNewPersonalityDefinition()` ou `TurnIntoPersonalityModule()`.

---

## 2. Padrão principal encontrado

O padrão se repete para todos os módulos:

```lua
local itemprefab0 = ModUtilities.CreateItemPrefab()

itemprefab0.Name = 'Nome do módulo'
itemprefab0.Description = 'Descrição do módulo'
itemprefab0.Price = 20000

itemprefab0.SlotData = SlotEquipData.CreateInstance('PersonalityModule')
itemprefab0.IsIllegal = true
itemprefab0.HasQuality = false
itemprefab0.ThrowingOutForbidden = false
itemprefab0.IsPersonalityModule = true
itemprefab0.IsStackable = false
itemprefab0.Category = ItemCategory.Modules
itemprefab0.CanChangeColor = false
itemprefab0.ColorSlots = {}
itemprefab0.Partners = {}
itemprefab0.ScratchType = ScratchTextureType.Universal
itemprefab0.SusModifiers = {}

local itemgameid0 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab0)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid0)
```

Esse arquivo é útil para documentar o **cadastro de módulos de personalidade como itens**, mas não o sistema completo de diálogo.

---

## 3. Catálogo de módulos detectados

| Índice | Nome | Preço | Slot | Loja |
|---:|---|---:|---|---|
| 0 | `Módulo de Personalidade TsunTsun` | `20000` | `PersonalityModule` | `ladyparts.ic` |
| 1 | `Módulo de Personalidade Catgirl` | `20000` | `PersonalityModule` | `ladyparts.ic` |
| 2 | `Módulo de Personalidade Motorista` | `4000` | `PersonalityModule` | `ladyparts.ic` |
| 3 | `Módulo de Personalidade Robô` | `10000` | `PersonalityModule` | `ladyparts.ic` |
| 4 | `Módulo de Personalidade Yandere` | `30000` | `PersonalityModule` | `ladyparts.ic` |
| 5 | `Módulo de Personalidade Vagabunda` | `30000` | `PersonalityModule` | `ladyparts.ic` |
| 6 | `Módulo de Personalidade Femcel` | `15000` | `PersonalityModule` | `ladyparts.ic` |
| 7 | `Módulo de Personalidade Himedere` | `15000` | `PersonalityModule` | `ladyparts.ic` |
| 8 | `Módulo de Personalidade Gato Bobo` | `6000000` | `PersonalityModule` | `ladyparts.ic` |
| 9 | `Módulo de Personalidade: Ara Ara` | `30000` | `PersonalityModule` | `ladyparts.ic` |

Distribuição de preço:

| Preço | Quantidade |
|---:|---:|
| `30000` | 3 |
| `20000` | 2 |
| `15000` | 2 |
| `4000` | 1 |
| `10000` | 1 |
| `6000000` | 1 |

Notas:

- O menor preço encontrado é `4000`.
- O maior preço encontrado é `6000000`.
- O item de preço extremamente alto (`6000000`) parece ser deliberadamente raro/meme.
- O HTML simples aparece em descrição, por exemplo tag `<b>`, sugerindo que descrições podem aceitar alguma formatação rica.

---

## 4. APIs usadas

| API | Usos | O que indica |
|---|---:|---|
| `ModUtilities.CreateItemPrefab` | 10 | Cria o prefab base do item/módulo. |
| `SlotEquipData.CreateInstance` | 10 | Define o slot equipável, aqui sempre `PersonalityModule`. |
| `ModUtilities.CreateNewItemAutoAssignId` | 10 | Registra o prefab no mod e retorna o `GameId`. |
| `ModUtilities.AddSingleBuyItemToShop` | 10 | Adiciona o item registrado em uma loja específica. |

Não aparecem neste arquivo:

```lua
ModUtilities.PrepareNewPersonalityDefinition()
LuaPersonalityModuleDefinition.PrepareContainer()
StoryBotDialogueBranch.__new()
ItemPrefab.TurnIntoPersonalityModule()
StoryCondition.Delegate()
```

Isso é relevante porque, nos relatórios anteriores, essas chamadas apareciam como o padrão de **personalidade com diálogos reais**.

---

## 5. Campos de `ItemPrefab` usados

| Campo | Usos | Valores observados |
|---|---:|---|
| `Name` | 10 | `<string>` (10) |
| `Description` | 10 | `<string>` (10) |
| `Price` | 10 | `30000` (3); `20000` (2); `15000` (2); `4000` (1) |
| `SlotData` | 10 | `SlotEquipData.CreateInstance('PersonalityModule')` (10) |
| `IsIllegal` | 10 | `true` (10) |
| `HasQuality` | 10 | `false` (10) |
| `ThrowingOutForbidden` | 10 | `false` (10) |
| `IsPersonalityModule` | 10 | `true` (10) |
| `IsStackable` | 10 | `false` (10) |
| `Category` | 10 | `ItemCategory.Modules` (10) |
| `CanChangeColor` | 10 | `false` (10) |
| `ColorSlots` | 10 | `{}` (10) |
| `Partners` | 10 | `{}` (10) |
| `ScratchType` | 10 | `ScratchTextureType.Universal` (10) |
| `SusModifiers` | 10 | `{}` (10) |

---

## 6. Interpretação dos campos

### `SlotData`

```lua
itemprefab.SlotData = SlotEquipData.CreateInstance('PersonalityModule')
```

Define que o item ocupa o slot lógico de módulo de personalidade.

Sugestão de documentação:

```lua
---@field SlotData SlotEquipData
--- Dados de slot/equipamento do item. Para módulos de personalidade,
--- normalmente usa `SlotEquipData.CreateInstance('PersonalityModule')`.
```

---

### `IsPersonalityModule`

```lua
itemprefab.IsPersonalityModule = true
```

Marca o item como módulo de personalidade.

Esse campo sozinho indica o tipo do item, mas este arquivo **não mostra** a ligação com uma definição de diálogos.

Sugestão de documentação:

```lua
---@field IsPersonalityModule boolean
--- Marca o item como um módulo de personalidade.
--- Em scripts com diálogos próprios, geralmente é usado em conjunto com
--- `PrepareNewPersonalityDefinition()` e `TurnIntoPersonalityModule()`.
```

---

### `Category`

```lua
itemprefab.Category = ItemCategory.Modules
```

Todos os módulos pertencem à categoria geral de módulos.

Sugestão de documentação:

```lua
---@field Category ItemCategory
--- Categoria usada para organização no inventário/loja.
--- Módulos de personalidade usam `ItemCategory.Modules`.
```

---

### `IsIllegal`

```lua
itemprefab.IsIllegal = true
```

Todos os módulos deste arquivo são ilegais. Isso provavelmente afeta loja, inventário, eventos ou avaliação do item dentro do jogo.

Sugestão de documentação:

```lua
---@field IsIllegal boolean
--- Indica se o item é tratado como ilegal pelo jogo.
--- Muitos módulos avançados ou especiais usam `true`.
```

---

### `ThrowingOutForbidden`

```lua
itemprefab.ThrowingOutForbidden = false
```

Permite descartar o item.

Sugestão de documentação:

```lua
---@field ThrowingOutForbidden boolean
--- Quando `true`, impede que o item seja jogado fora/removido pelo jogador.
```

---

### `CanChangeColor` e `ColorSlots`

```lua
itemprefab.CanChangeColor = false
itemprefab.ColorSlots = {}
```

Módulos de personalidade não possuem textura visual colorível, então não precisam de slots de cor.

Sugestão de documentação:

```lua
---@field CanChangeColor boolean
--- Habilita ou desabilita edição de cor do item.
--- Módulos sem textura/equipamento visual geralmente usam `false`.

---@field ColorSlots ColorSlot[]
--- Lista de canais de cor configuráveis. Para módulos sem cor, use `{}`.
```

---

### `Partners`

```lua
itemprefab.Partners = {}
```

Lista vazia em todos os módulos. Nos relatórios anteriores, `Partners` apareceu como campo usado para restringir/associar itens a parceiros/personagens específicos.

Sugestão de documentação:

```lua
---@field Partners string[]
--- Lista opcional de parceiros/personagens associados ao item.
--- Use `{}` quando o item não for restrito a nenhum parceiro específico.
```

---

### `ScratchType`

```lua
itemprefab.ScratchType = ScratchTextureType.Universal
```

Mesmo sem textura visual, o campo aparece preenchido. Isso sugere que o gerador de scripts coloca esse campo como boilerplate padrão.

Sugestão de documentação:

```lua
---@field ScratchType ScratchTextureType
--- Tipo/base de textura scratch usada pelo item.
--- Em itens genéricos e módulos, `ScratchTextureType.Universal` aparece como padrão.
```

---

### `SusModifiers`

```lua
itemprefab.SusModifiers = {}
```

Não há modificadores de exposição/suspeita neste arquivo.

Sugestão de documentação:

```lua
---@field SusModifiers SusModifier[]
--- Modificadores de exposição/suspeita aplicados pelo item.
--- Use `{}` quando o item não altera nenhuma área visual/suspeita.
```

---

## 7. Diferença entre item de módulo e personalidade funcional

Este arquivo cria **itens marcados como módulos de personalidade**, mas não cria a definição de personalidade em si.

Um módulo completo de personalidade geralmente precisa de algo parecido com:

```lua
local personality = ModUtilities.PrepareNewPersonalityDefinition()

personality.PrepareContainer('Interact_Greeting')
  .AddBranch(StoryBotDialogueBranch.__new('Texto da fala', CurrentModGuid, 0))

itemprefab.TurnIntoPersonalityModule(itemgameid, personality)
```

Neste `personalities.lua`, isso não aparece.

Portanto, existem duas possibilidades:

1. O jogo reconhece `IsPersonalityModule = true` e aplica comportamento por outro sistema externo.
2. O script está incompleto como módulo funcional de diálogo, servindo apenas para registrar os itens na loja.

Pelo padrão visto nos relatórios anteriores, `TurnIntoPersonalityModule()` é o indício mais forte de personalidade com diálogos próprios.

---

## 8. Modelo recomendado para registrar módulo simples

```lua
---@param internalName string
---@param description string
---@param price integer
---@return any itemGameId
local function CreatePersonalityModule(internalName, description, price)
  local prefab = ModUtilities.CreateItemPrefab()

  prefab.Name = internalName
  prefab.Description = description
  prefab.Price = price

  prefab.SlotData = SlotEquipData.CreateInstance('PersonalityModule')
  prefab.IsIllegal = true
  prefab.HasQuality = false
  prefab.ThrowingOutForbidden = false
  prefab.IsPersonalityModule = true
  prefab.IsStackable = false
  prefab.Category = ItemCategory.Modules
  prefab.CanChangeColor = false
  prefab.ColorSlots = {}
  prefab.Partners = {}
  prefab.ScratchType = ScratchTextureType.Universal
  prefab.SusModifiers = {}

  local gameId = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, prefab)
  ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', gameId)

  return gameId
end
```

Esse helper reduziria bastante repetição, já que todos os itens do arquivo seguem o mesmo formato.

---

## 9. Modelo recomendado para módulo com diálogos

```lua
local prefab = ModUtilities.CreateItemPrefab()

prefab.Name = 'Módulo de Personalidade Exemplo'
prefab.Description = 'Exemplo de módulo com diálogos próprios.'
prefab.Price = 10000
prefab.SlotData = SlotEquipData.CreateInstance('PersonalityModule')
prefab.IsIllegal = true
prefab.HasQuality = false
prefab.ThrowingOutForbidden = false
prefab.IsPersonalityModule = true
prefab.IsStackable = false
prefab.Category = ItemCategory.Modules
prefab.CanChangeColor = false
prefab.ColorSlots = {}
prefab.Partners = {}
prefab.ScratchType = ScratchTextureType.Universal
prefab.SusModifiers = {}

local gameId = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, prefab)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', gameId)

local personality = ModUtilities.PrepareNewPersonalityDefinition()

personality.PrepareContainer('Interact_Greeting')
  .AddBranch(StoryBotDialogueBranch.__new('Texto de exemplo.', CurrentModGuid, 0))

personality.PrepareContainer('Interact_Generic')
  .AddBranch(StoryBotDialogueBranch.__new('Outro texto de exemplo.', CurrentModGuid, 1))

prefab.TurnIntoPersonalityModule(gameId, personality)
```

Esse padrão é mais próximo do que foi visto no arquivo grande `mods_mixed.lua`, onde existiam containers e branches.

---

## 10. Sugestões para stubs LuaLS

### Alias para slot de personalidade

```lua
---@alias MdrgPersonalitySlot
---| '"PersonalityModule"'
```

### Documentação para `SlotEquipData.CreateInstance`

```lua
---@class SlotEquipData
local SlotEquipData = {}

---Cria dados de slot para um item equipável.
---Para módulos de personalidade, use `"PersonalityModule"`.
---@param targetSlot? string
---@return SlotEquipData
function SlotEquipData.CreateInstance(targetSlot) end
```

### Documentação para `ItemPrefab.IsPersonalityModule`

```lua
---@class ItemPrefab
---@field IsPersonalityModule boolean Marca o prefab como item de módulo de personalidade.
```

### Documentação para `ItemPrefab.TurnIntoPersonalityModule`

```lua
---Conecta um item registrado a uma definição de personalidade.
---Use após registrar o prefab com `CreateNewItemAutoAssignId`.
---@param gameId any GameId retornado por `CreateNewItemAutoAssignId`.
---@param definition LuaPersonalityModuleDefinition Definição de diálogos/containers.
function ItemPrefab.TurnIntoPersonalityModule(gameId, definition) end
```

### Documentação para `ModUtilities.PrepareNewPersonalityDefinition`

```lua
---Cria uma definição vazia de personalidade.
---Use `PrepareContainer()` para adicionar falas/eventos e depois conecte
---a definição ao item com `ItemPrefab.TurnIntoPersonalityModule()`.
---@return LuaPersonalityModuleDefinition
function ModUtilities.PrepareNewPersonalityDefinition() end
```

### Documentação para `LuaPersonalityModuleDefinition.PrepareContainer`

```lua
---@class LuaPersonalityModuleDefinition

---Obtém ou cria um container de diálogo/evento.
---O nome do container deve corresponder a uma chave reconhecida pelo jogo,
---como containers de interação, saudação, cenas ou estados narrativos.
---@param containerName string
---@return any container
function LuaPersonalityModuleDefinition.PrepareContainer(containerName) end
```

### Documentação para `StoryBotDialogueBranch.__new`

```lua
---@class StoryBotDialogueBranch

---Cria uma branch/variação de diálogo.
---@param text string Texto da fala.
---@param modGuid string GUID do mod atual.
---@param branchId integer Identificador numérico local da branch.
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.__new(text, modGuid, branchId) end
```

---

## 11. Boas práticas extraídas

### 1. Evitar repetição manual

O arquivo é gerado e repete o mesmo bloco 10 vezes. Para scripts feitos à mão, prefira helper:

```lua
CreatePersonalityModule('Nome', 'Descrição', 10000)
```

### 2. Usar nomes claros para variáveis

Em vez de:

```lua
itemprefab0
itemgameid0
```

prefira:

```lua
local robotPersonalityPrefab = ModUtilities.CreateItemPrefab()
local robotPersonalityId = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, robotPersonalityPrefab)
```

### 3. Separar cadastro de item e definição de diálogos

Uma estrutura limpa seria:

```lua
local prefab, gameId = RegisterPersonalityItem(...)
local definition = BuildRobotPersonalityDefinition()
prefab.TurnIntoPersonalityModule(gameId, definition)
```

### 4. Sanitizar descrições se o mod for público

Algumas descrições usam linguagem adulta/ofensiva. Para mods públicos, é melhor separar:

- nome interno;
- nome exibido;
- descrição amigável;
- conteúdo adulto opcional;
- tradução/localização.

### 5. Usar localização quando disponível

Nos arquivos anteriores apareceu:

```lua
SimpleLocalizedString.CreateInstanceReplacement(...)
```

Se descrições/nome puderem usar localização, vale considerar esse padrão.

---

## 12. O que este arquivo adiciona aos relatórios anteriores

Este arquivo confirma:

```lua
SlotEquipData.CreateInstance('PersonalityModule')
ItemCategory.Modules
IsPersonalityModule = true
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', gameId)
```

Ele reforça que `PersonalityModule` é um slot real e importante para autocomplete.

Mas ele **não adiciona** novos containers, eventos de diálogo ou APIs de branch.

---

## 13. Recomendação final para documentação

Para o addon LuaLS, eu documentaria `personalities.lua` como evidência de:

```lua
---@alias MdrgEquipmentSlot
---| '"PersonalityModule"'
```

e como exemplo de item:

```lua
---@class ItemPrefab
---@field IsPersonalityModule boolean
---@field SlotData SlotEquipData
```

Além disso, eu criaria dois exemplos separados:

1. `personality_item_only.lua`  
   Mostra apenas o cadastro do item como módulo.

2. `personality_with_dialogues.lua`  
   Mostra o fluxo completo com `PrepareNewPersonalityDefinition`, `PrepareContainer`, `StoryBotDialogueBranch.__new` e `TurnIntoPersonalityModule`.

A principal conclusão é que `personalities.lua` é útil para **documentar o item de personalidade**, mas não é suficiente para documentar sozinho o sistema completo de **diálogos de personalidade**.

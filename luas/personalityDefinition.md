# Documentação técnica de `personalityDefinition.lua`

Arquivo analisado: `personalityDefinition.lua`  
Objetivo: extrair padrões úteis para documentação, stubs LuaLS e exemplos de módulos de personalidade.

> Observação: este relatório documenta a **estrutura técnica** do arquivo. As falas/conteúdos textuais foram resumidos e não foram copiados integralmente.

---

## 1. Resumo geral

| Métrica | Valor |
|---|---:|
| Tamanho aproximado | `10,574` bytes |
| Linhas | `54` |
| Definições de personalidade | `1` |
| Containers preparados | `49` |
| Branches adicionadas | `49` |
| `StoryBotDialogueBranch.__new` | `49` |
| `TurnIntoPersonalityModule` | `1` |
| `StoryCondition.Delegate` | `0` |
| Criação de `ItemPrefab` no próprio arquivo | `0` |
| Registro de item no próprio arquivo | `0` |
| Adição em shop no próprio arquivo | `0` |

Conclusão rápida: este arquivo não cria o item/prefab sozinho. Ele cria uma definição de personalidade, registra containers de diálogo e, no final, anexa essa personalidade a um item já existente por meio de `itemprefab0.TurnIntoPersonalityModule(itemgameid0, personality)`.

---

## 2. Padrão principal encontrado

O arquivo segue praticamente um único padrão:

```lua
local personality = ModUtilities.PrepareNewPersonalityDefinition()

personality
  .PrepareContainer("Nome_Do_Container")
  .AddBranch(StoryBotDialogueBranch.__new("texto do diálogo", CurrentModGuid, 0))

-- No final:
itemprefab0.TurnIntoPersonalityModule(itemgameid0, personality)
```

Forma real usada no arquivo:

```lua
personality.PrepareContainer("Container_Id")
  .AddBranch(StoryBotDialogueBranch.__new("...", CurrentModGuid, branchId))
```

### Interpretação

- `ModUtilities.PrepareNewPersonalityDefinition()` cria um objeto de personalidade.
- `PrepareContainer(containerId)` abre ou cria um container/evento de fala.
- `AddBranch(branch)` adiciona uma variação de fala nesse container.
- `StoryBotDialogueBranch.__new(text, CurrentModGuid, id)` cria uma branch de diálogo.
- `TurnIntoPersonalityModule(itemGameId, personality)` transforma/anexa a personalidade ao item prefab.

---

## 3. APIs usadas

| API | Ocorrências |
|---|---:|
| `ModUtilities.PrepareNewPersonalityDefinition` | `1` |
| `LuaPersonalityModuleDefinition.PrepareContainer` | `49` |
| `LuaDialogueContainer.AddBranch` | `49` |
| `StoryBotDialogueBranch.__new` | `49` |
| `ItemPrefab.TurnIntoPersonalityModule` | `1` |
| `StoryCondition.Delegate` | `0` |
| `ModUtilities.CreateItemPrefab` | `0` |
| `ModUtilities.CreateNewItemAutoAssignId` | `0` |
| `ModUtilities.AddSingleBuyItemToShop` | `0` |

Esse arquivo é muito focado em `LuaPersonalityModuleDefinition`, `StoryBotDialogueBranch` e `ItemPrefab.TurnIntoPersonalityModule`.

---

## 4. Prefixos de containers

| Prefixo | Quantidade |
|---|---:|
| `Frick` | `26` |
| `Cowgirl` | `13` |
| `Blowjob` | `10` |

Os containers parecem ser agrupados por cena/estado principal. Isso é útil para criar aliases ou documentação por categoria:

```lua
---@alias MdrgPersonalityContainerPrefix
---| '"Frick"'
---| '"Blowjob"'
---| '"Cowgirl"'
```

---

## 5. Containers detectados

| Branch ID | Container | Linha | Alternativas textuais | Diretivas | Placeholders |
|---:|---|---:|---:|---|---|
| `0` | `Frick_CumInside` | `3` | `3` | `#r` | — |
| `1` | `Frick_CumInsideAnal` | `4` | `3` | `#r` | — |
| `2` | `Frick_CumOutside` | `5` | `1` | — | — |
| `3` | `Frick_CumTogether` | `6` | `1` | — | — |
| `4` | `Frick_BotCumming` | `7` | `1` | — | — |
| `5` | `Frick_EdgingOn` | `8` | `1` | — | — |
| `6` | `Frick_EdgingOff` | `9` | `1` | — | — |
| `7` | `Frick_Moan` | `10` | `4` | — | `{f_playerName}` |
| `8` | `Frick_RapeBegStopSuccess` | `11` | `4` | `#pickrandom` | `{f_playerName}` |
| `9` | `Frick_RapeBegStopRefuse` | `12` | `4` | `#pickrandom` | — |
| `10` | `Frick_RapeFlacidReaction` | `13` | `3` | `#pickrandom` | — |
| `11` | `Frick_StartFrick` | `14` | `3` | `#pickrandom` | `{f_playerName}` |
| `12` | `Frick_GenericFuckBrainStateRandomDialogueCockOutside` | `15` | `3` | `#pickrandom` | `{f_playerName}` |
| `13` | `Frick_GenericFuckBrainStateRandomDialogueCockInside` | `16` | `4` | `#pickrandom` | `{f_playerName}` |
| `14` | `Frick_GenericFuckBrainStateRandomDialogueCockInsideAnal` | `17` | `6` | `#pickrandom` | `{f_playerName}` |
| `15` | `Frick_Headpat` | `18` | `7` | `#end`, `#pickrandom` | `{f_playerName}` |
| `16` | `Frick_FingeringDuring` | `19` | `4` | `#r` | `{f_playerName}` |
| `17` | `Frick_FingeringBotCumming` | `20` | `3` | `#r` | `{f_playerName}` |
| `18` | `Frick_BoobFondle` | `21` | `4` | `#r` | `{f_playerName}` |
| `19` | `Frick_NipplePull` | `22` | `3` | `#r` | — |
| `20` | `Frick_PussySpread` | `23` | `4` | `#r` | `{f_playerName}` |
| `21` | `Frick_ClitRub` | `24` | `4` | `#r` | `{f_playerName}` |
| `22` | `Frick_Handholding` | `25` | `5` | `#r` | `{f_playerName}` |
| `23` | `Frick_UpsetOnlySheMoves` | `26` | `5` | `#r` | `{f_playerName}` |
| `24` | `Frick_CumThighjob` | `27` | `3` | `#r` | — |
| `25` | `Frick_FlacidBoredReaction` | `28` | `3` | `#r` | `{f_playerName}` |
| `26` | `Blowjob_EdgingAlmostCame` | `29` | `1` | — | — |
| `27` | `Blowjob_EdgingHadToSlowdown` | `30` | `1` | — | — |
| `28` | `Blowjob_EdgingForceStop` | `31` | `1` | — | — |
| `29` | `Blowjob_SwallowWithMl` | `32` | `2` | `#r` | `{f_Integer}` |
| `30` | `Blowjob_SwallowFull` | `33` | `1` | — | — |
| `31` | `Blowjob_SwallowHalf` | `34` | `1` | — | — |
| `32` | `Blowjob_SwallowLittle` | `35` | `1` | — | — |
| `33` | `Blowjob_SwallowAlmostEmpty` | `36` | `1` | — | — |
| `34` | `Blowjob_SwitchToCowgirlBotLead` | `37` | `2` | `#pickrandom` | — |
| `35` | `Blowjob_SwitchToCowgirlBotRape` | `38` | `4` | `#pickrandom` | — |
| `36` | `Cowgirl_RemovePants` | `39` | `1` | — | — |
| `37` | `Cowgirl_BeforeFirstInsertBotLead` | `40` | `1` | — | — |
| `38` | `Cowgirl_BeforeFirstInsert` | `41` | `1` | — | — |
| `39` | `Cowgirl_EdgingForceStopped` | `42` | `1` | — | — |
| `40` | `Cowgirl_EdgingBreak` | `43` | `1` | — | — |
| `41` | `Cowgirl_FlacidReaction` | `44` | `1` | — | — |
| `42` | `Cowgirl_WhereToCumQuestion` | `45` | `1` | — | — |
| `43` | `Cowgirl_WhereToCumQuestionDidntAnswer` | `46` | `1` | — | — |
| `44` | `Cowgirl_BeforeFirstInsertRape` | `47` | `4` | `#pickrandom` | — |
| `45` | `Cowgirl_MadeMcCumInsideWhileCummingHerself` | `48` | `4` | `#pickrandom` | `{f_playerName}` |
| `46` | `Cowgirl_BeforeSwitchToBlowjobBotLead` | `49` | `3` | `#pickrandom` | — |
| `47` | `Cowgirl_BeforeSwitchToBlowjobRape` | `50` | `4` | `#pickrandom` | — |
| `48` | `Cowgirl_AfterFirstInsertBotRape` | `51` | `3` | `#pickrandom` | — |

### Observações sobre os IDs

- Os IDs vão de `0` até `48`.
- Não há IDs duplicados.
- Cada container recebe exatamente uma branch no arquivo.
- Os IDs são sequenciais, o que sugere geração automática ou organização manual bem linear.

---

## 6. Diretivas de texto encontradas

| Diretiva | Ocorrências |
|---|---:|
| `#pickrandom` | `15` |
| `#r` | `13` |
| `#end` | `1` |

### Interpretação inferida

```lua
#pickrandom
```

Provavelmente indica que o sistema deve escolher uma das linhas disponíveis aleatoriamente.

```lua
#r
```

Aparece em vários containers com múltiplas linhas. Pode ser uma diretiva de randomização, repetição, variação ou regra especial do parser de diálogo. Precisa ser confirmado no dump/documentação real.

```lua
#end
```

Aparece uma vez. Provavelmente sinaliza encerramento explícito de uma sequência ou container.

Sugestão para documentação: marcar essas diretivas como **inferidas por uso**, não como API confirmada.

---

## 7. Placeholders encontrados

| Placeholder | Ocorrências |
|---|---:|
| `{f_playerName}` | `28` |
| `{f_Integer}` | `2` |

### Interpretação inferida

```lua
{f_playerName}
```

Provavelmente é substituído pelo nome do jogador/personagem.

```lua
{f_Integer}
```

Provavelmente recebe um inteiro vindo do contexto do evento. Pelo nome do container onde aparece, pode representar uma quantidade numérica passada pelo sistema.

Sugestão para stub/documentação:

```lua
---@alias MdrgDialoguePlaceholder
---| '"{f_playerName}"' # Nome do jogador/personagem, inferido por uso.
---| '"{f_Integer}"'    # Valor inteiro passado pelo evento, inferido por uso.
```

---

## 8. Estados/nomes secundários mais comuns

Extraído da segunda parte do nome após o prefixo, por exemplo `Frick_CumInside` => `CumInside`.

| Estado / parte do nome | Quantidade |
|---|---:|
| `CumInside` | `1` |
| `CumInsideAnal` | `1` |
| `CumOutside` | `1` |
| `CumTogether` | `1` |
| `BotCumming` | `1` |
| `EdgingOn` | `1` |
| `EdgingOff` | `1` |
| `Moan` | `1` |
| `RapeBegStopSuccess` | `1` |
| `RapeBegStopRefuse` | `1` |
| `RapeFlacidReaction` | `1` |
| `StartFrick` | `1` |
| `GenericFuckBrainStateRandomDialogueCockOutside` | `1` |
| `GenericFuckBrainStateRandomDialogueCockInside` | `1` |
| `GenericFuckBrainStateRandomDialogueCockInsideAnal` | `1` |
| `Headpat` | `1` |
| `FingeringDuring` | `1` |
| `FingeringBotCumming` | `1` |
| `BoobFondle` | `1` |
| `NipplePull` | `1` |
| `PussySpread` | `1` |
| `ClitRub` | `1` |
| `Handholding` | `1` |
| `UpsetOnlySheMoves` | `1` |
| `CumThighjob` | `1` |
| `FlacidBoredReaction` | `1` |
| `EdgingAlmostCame` | `1` |
| `EdgingHadToSlowdown` | `1` |
| `EdgingForceStop` | `1` |
| `SwallowWithMl` | `1` |
| `SwallowFull` | `1` |
| `SwallowHalf` | `1` |
| `SwallowLittle` | `1` |
| `SwallowAlmostEmpty` | `1` |
| `SwitchToCowgirlBotLead` | `1` |
| `SwitchToCowgirlBotRape` | `1` |
| `RemovePants` | `1` |
| `BeforeFirstInsertBotLead` | `1` |
| `BeforeFirstInsert` | `1` |
| `EdgingForceStopped` | `1` |
| `EdgingBreak` | `1` |
| `FlacidReaction` | `1` |
| `WhereToCumQuestion` | `1` |
| `WhereToCumQuestionDidntAnswer` | `1` |
| `BeforeFirstInsertRape` | `1` |
| `MadeMcCumInsideWhileCummingHerself` | `1` |
| `BeforeSwitchToBlowjobBotLead` | `1` |
| `BeforeSwitchToBlowjobRape` | `1` |
| `AfterFirstInsertBotRape` | `1` |

Isso é útil para mapear quais eventos narrativos o jogo espera que um módulo de personalidade possa sobrescrever.

---

## 9. O que este arquivo acrescenta em relação aos relatórios anteriores

Este arquivo é menor e mais especializado que `mods_mixed.lua`, mas é muito bom para entender o **formato mínimo** de uma personality definition.

### Coisas confirmadas

1. Uma personalidade pode ser criada em arquivo separado.
2. A definição é anexada no final a um `ItemPrefab` e `GameId` já existentes.
3. `PrepareContainer(...).AddBranch(...)` funciona em cadeia.
4. `StoryBotDialogueBranch.__new` usa três argumentos no padrão observado:
   - texto/roteiro da fala;
   - `CurrentModGuid`;
   - ID numérico da branch.
5. Containers são strings livres, mas parecem precisar bater com nomes/eventos reconhecidos pelo jogo.
6. Placeholders e diretivas são embutidos diretamente dentro da string do diálogo.

---

## 10. O que este arquivo não demonstra

Este arquivo **não** mostra:

- criação completa de `ItemPrefab`;
- `IsPersonalityModule = true`;
- `ModUtilities.CreateNewItemAutoAssignId`;
- adição do item em loja;
- `StoryCondition.Delegate`;
- múltiplas branches no mesmo container;
- containers com condição;
- fallback de container;
- interação com `GameVariables`;
- uso de `OnUse`, `SpecialEffectAction` ou coroutines.

Então ele deve ser usado como referência para **diálogo/personality definition**, não para item completo.

---

## 11. LuaDoc sugerido para os stubs

### `ModUtilities.PrepareNewPersonalityDefinition`

```lua
---Cria uma nova definição de módulo de personalidade.
---
---A definição recebe containers de diálogo por meio de
---`PrepareContainer(containerId)` e depois pode ser anexada a um
---`ItemPrefab` usando `ItemPrefab.TurnIntoPersonalityModule`.
---
---@return LuaPersonalityModuleDefinition
function ModUtilities.PrepareNewPersonalityDefinition() end
```

### `LuaPersonalityModuleDefinition.PrepareContainer`

```lua
---Obtém ou cria um container de diálogo por ID.
---
---O ID do container normalmente representa um evento/cena reconhecido
---pelo jogo, por exemplo eventos de interação ou cenas específicas.
---
---@param containerId string Nome/ID do container de diálogo.
---@return LuaDialogueContainer container Container onde branches podem ser adicionadas.
function LuaPersonalityModuleDefinition.PrepareContainer(containerId) end
```

### `LuaDialogueContainer.AddBranch`

```lua
---Adiciona uma branch/variação de diálogo ao container.
---
---Cada branch é criada com `StoryBotDialogueBranch.__new`.
---O retorno parece permitir encadeamento, pois o arquivo usa:
---`PrepareContainer(...).AddBranch(...)`.
---
---@param branch StoryBotDialogueBranch
---@return LuaDialogueContainer
function LuaDialogueContainer.AddBranch(branch) end
```

### `StoryBotDialogueBranch.__new`

```lua
---Cria uma branch de diálogo para um container de personalidade.
---
---A string de texto pode conter múltiplas linhas, diretivas como
---`#pickrandom`/`#r`, e placeholders como `{f_playerName}`.
---
---@param text string Texto/roteiro da fala.
---@param modGuid string Normalmente `CurrentModGuid`.
---@param branchId integer ID numérico da branch dentro do mod/personality.
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.__new(text, modGuid, branchId) end
```

### `ItemPrefab.TurnIntoPersonalityModule`

```lua
---Transforma/anexa um item prefab a uma definição de personalidade.
---
---Usado depois que o item já possui um `GameId` registrado.
---O padrão observado é:
---`itemprefab.TurnIntoPersonalityModule(itemGameId, personality)`.
---
---@param itemGameId GameId ID registrado do item.
---@param personality LuaPersonalityModuleDefinition Definição de personalidade.
function ItemPrefab.TurnIntoPersonalityModule(itemGameId, personality) end
```

---

## 12. Aliases sugeridos

### Prefixos de personality containers

```lua
---@alias MdrgPersonalityContainerPrefix
---| '"Frick"'
---| '"Blowjob"'
---| '"Cowgirl"'
```

### Diretivas de diálogo

```lua
---@alias MdrgDialogueDirective
---| '"#pickrandom"' # Escolha aleatória inferida por uso.
---| '"#r"'          # Diretiva de comportamento especial; confirmar no dump.
---| '"#end"'        # Encerramento explícito inferido por uso.
```

### Placeholders de diálogo

```lua
---@alias MdrgDialoguePlaceholder
---| '"{f_playerName}"'
---| '"{f_Integer}"'
```

---

## 13. Exemplo mínimo documentado

```lua
-- Cria a definição de personalidade.
local personality = ModUtilities.PrepareNewPersonalityDefinition()

-- Adiciona uma fala simples a um container conhecido pelo jogo.
personality
  .PrepareContainer("Interact_Greeting")
  .AddBranch(StoryBotDialogueBranch.__new(
    "#pickrandom\nBot: Hello.\nBot: Hi.",
    CurrentModGuid,
    0
  ))

-- Anexa a personalidade ao item já criado/registrado.
-- itemprefab0 e itemgameid0 precisam existir antes deste ponto.
itemprefab0.TurnIntoPersonalityModule(itemgameid0, personality)
```

---

## 14. Exemplo com helper para evitar repetição

O arquivo original repete muito o mesmo formato. Para mods maiores, este helper melhora legibilidade:

```lua
local personality = ModUtilities.PrepareNewPersonalityDefinition()

local function addBranch(containerId, branchId, text)
  personality
    .PrepareContainer(containerId)
    .AddBranch(StoryBotDialogueBranch.__new(text, CurrentModGuid, branchId))
end

addBranch("Interact_Greeting", 0, "#pickrandom\nBot: Hello.\nBot: Hi.")
addBranch("Interact_Thanks", 1, "#pickrandom\nBot: Thanks.\nBot: Thank you.")

itemprefab0.TurnIntoPersonalityModule(itemgameid0, personality)
```

---

## 15. Recomendações práticas

1. **Evitar depender de globais implícitas.**  
   O final do arquivo usa `itemprefab0` e `itemgameid0`, mas eles não são criados no próprio arquivo. Isso funciona se o arquivo for incluído dentro de outro contexto, mas é frágil.

2. **Usar helper para `AddBranch`.**  
   O padrão é muito repetitivo. Um helper reduz erro de ID, container e GUID.

3. **Centralizar nomes de containers.**  
   Criar uma tabela de constantes ajuda autocomplete e evita typo:

   ```lua
   local Containers = {
     Greeting = "Interact_Greeting",
     FrickCumInside = "Frick_CumInside",
   }
   ```

4. **Manter IDs únicos.**  
   Este arquivo usa IDs sequenciais sem duplicação. É um bom padrão.

5. **Documentar diretivas como inferidas.**  
   `#pickrandom`, `#r` e `#end` aparecem no uso real, mas o significado exato deve ser validado contra documentação/dump.

6. **Separar conteúdo textual de estrutura.**  
   Para mods grandes, vale manter uma tabela de falas e iterar sobre ela para gerar os containers.

7. **Usar `do ... end` ou `local` para isolar escopo.**  
   Isso evita conflito quando vários arquivos de personality são carregados juntos.

---

## 16. Exemplo de estrutura mais escalável

```lua
do
  local personality = ModUtilities.PrepareNewPersonalityDefinition()

  local branches = {
    {
      container = "Interact_Greeting",
      id = 0,
      text = "#pickrandom\nBot: Hello.\nBot: Hi.",
    },
    {
      container = "Interact_Thanks",
      id = 1,
      text = "#pickrandom\nBot: Thanks.\nBot: Thank you.",
    },
  }

  for _, branch in ipairs(branches) do
    personality
      .PrepareContainer(branch.container)
      .AddBranch(StoryBotDialogueBranch.__new(
        branch.text,
        CurrentModGuid,
        branch.id
      ))
  end

  itemprefab0.TurnIntoPersonalityModule(itemgameid0, personality)
end
```

---

## 17. Conclusão

`personalityDefinition.lua` é útil como referência concentrada para o sistema de módulos de personalidade.

O valor principal dele está em confirmar:

- formato mínimo de `PrepareNewPersonalityDefinition`;
- uso em cadeia de `PrepareContainer(...).AddBranch(...)`;
- assinatura prática de `StoryBotDialogueBranch.__new`;
- uso de IDs sequenciais por branch;
- diretivas textuais dentro da string;
- placeholders reconhecidos pelo parser de diálogo;
- conexão final via `ItemPrefab.TurnIntoPersonalityModule`.

Para o addon LuaLS, ele reforça a necessidade de documentar bem:

- `LuaPersonalityModuleDefinition`;
- `LuaDialogueContainer`;
- `StoryBotDialogueBranch`;
- `TurnIntoPersonalityModule`;
- aliases de containers, diretivas e placeholders.

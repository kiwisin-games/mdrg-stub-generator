# Relatório de análise — `mainScene.txt`

## Escopo

Este relatório analisa `mainScene.txt`, que parece conter scripts internos extraídos de eventos/flowcharts/Fungus, e não um arquivo de mod Lua comum.

O foco aqui é extrair informações úteis para:

- documentação dos stubs `.d.lua`;
- descoberta de aliases legados;
- identificação de strings que podem virar aliases/“enums” documentais;
- exemplos de uso de `GameVariables`;
- exemplos de browser, BotStatusApp, notícias, save/global flags e flowchart.

## Resumo estatístico

| Métrica | Valor |
|---|---|
| Linhas | 369 |
| Tamanho | 22.346 bytes |
| Entradas `luaScript` | 113 |
| Entradas `luaCompareString` | 256 |
| Ocorrências `gv.<nome>` | 412 |
| Propriedades `gv.*` distintas | 60 |
| Métodos `gv.*(...)` distintos | 11 |
| Flags únicas em `CheckFlag*` | 68 |
| Websites internos únicos | 3 |
| Blog IDs únicos | 9 |

## Conclusão principal

O arquivo é útil principalmente para documentar **runtime interno/legado**.

O símbolo `gv` aparece como um alias para `GameVariables`, mas deve ser tratado como legado/interno. Para scripts novos, a recomendação continua sendo usar `GameVariables`.

```lua
local GV = GameVariables or gv
```

O arquivo também mostra várias APIs que parecem vir de flowcharts, UI interna ou scripts de história. Portanto, a melhor abordagem é criar um stub separado, por exemplo:

```text
mdrg_legacy_runtime_aliases.d.lua
```

Esse arquivo deve ficar separado dos stubs principais para não misturar API moderna de mod com API interna/injetada.

---

# 1. `gv` como alias legado de `GameVariables`

## Evidência geral

Chamadas e campos aparecem no formato:

```lua
gv.CheckFlag("...")
gv.Hour
gv.MentalHealth
gv.money
gv.ForceTakeMoney(...)
```

Recomendação:

```lua
---@deprecated Use GameVariables instead.
---@type GameVariables
gv = GameVariables
```

## Campos/propriedades mais frequentes

| Campo | Ocorrências |
|---|---|
| `gv.Hour` | 39 |
| `gv.money` | 23 |
| `gv.MentalHealth` | 18 |
| `gv.MaxCum` | 14 |
| `gv.Satiation` | 13 |
| `gv.EverStartedStream` | 10 |
| `gv.RiotsActive` | 10 |
| `gv.stamina` | 10 |
| `gv.HalloweenActive` | 8 |
| `gv.IsBritanniaOnIslandEnding` | 6 |
| `gv.newsDataManager` | 5 |
| `gv.RiotsAfter` | 5 |
| `gv.DayOfTheWeek` | 4 |
| `gv.sympathy` | 4 |
| `gv.search` | 4 |
| `gv.lightSwitchOn` | 4 |
| `gv.itemManager` | 3 |
| `gv.Longing` | 3 |
| `gv.IsLandlordOnIslandEnding` | 3 |
| `gv.DispenserLevel` | 2 |
| `gv.sus` | 2 |
| `gv.HasPointyEars` | 2 |
| `gv.HasWitchHat` | 2 |
| `gv.IsNaked` | 2 |
| `gv.IsBotSmart` | 2 |
| `gv.TimesCameAll` | 2 |
| `gv.EverCameInBot` | 2 |
| `gv.EverFuckedBot` | 2 |
| `gv.bathroomLightOn` | 2 |
| `gv.IsThereCumOnHer` | 2 |

## Métodos mais frequentes

| Método | Ocorrências | Uso provável |
|---|---|---|
| `gv.CheckFlag(...)` | 123 | Checa flag de história/progresso. |
| `gv.ForceTakeMoney(...)` | 26 | Remove dinheiro diretamente. |
| `gv.BotCleanWithRagEffect(...)` | 7 | Aplica efeito de limpeza. |
| `gv.CheckFlagAfterRelative(...)` | 4 | Checa se uma flag passou de certo tempo relativo. |
| `gv.ClearMood(...)` | 3 | Limpa/reset de humor. |
| `gv.RemoveAllEmailsWithId(...)` | 2 | Remove emails por ID. |
| `gv.TryTakeMoney(...)` | 2 | Tenta remover dinheiro e retorna sucesso/falha. |
| `gv.TimeInDay(...)` | 1 | Calcula horário/duração dentro do dia. |
| `gv.CheckFlagBeforeRelative(...)` | 1 | Checa se uma flag ainda está dentro de tempo relativo. |
| `gv.ReportSleepEnd(...)` | 1 | Notifica fim de sono. |
| `gv.GetFlagSetCount(...)` | 1 | Conta flags/setups com prefixo ou ID. |

## Campos por categoria

| Categoria | Campos observados |
|---|---|
| tempo_rotina | `Hour` (39), `Minute` (1), `DayOfTheWeek` (4), `TimeDay` (1), `TimeSinceLastStream` (1), `TimeSinceLastSawBot` (1), `AwakeFor` (1), `WorkedTodayAlready` (1), `lastSleptWithBot` (1) |
| status | `MentalHealth` (18), `Satiation` (13), `Health` (1), `Stamina` (1), `stamina` (10), `Longing` (3), `sympathy` (4), `lust` (1), `MaxCum` (14), `money` (23), `search` (4), `followers` (1) |
| historia | `RiotsActive` (10), `RiotsAfter` (5), `HalloweenActive` (8), `EverStartedStream` (10), `EverCameInBot` (2), `EverFuckedBot` (2), `CanStartStream` (1), `StartedStreamingAfterPrologue` (1), `IsBotSmart` (2), `IsNaked` (2) |
| ambiente | `lightSwitchOn` (4), `bathroomLightOn` (2), `LandlordDecorationsUp` (1) |

## Campos que não bateram diretamente com os stubs

| Campo extraído | Interpretação |
|---|---|
| `gv.HasToldBotAHorrorStory` | campo/propriedade não encontrada nos stubs; verificar no dump atual antes de adicionar |
| `gv.isFisherOnIslandEnding` | alias legado; prefira `GameVariables.IsFisherOnIslandEnding` |
| `gv.stamina` | alias legado; prefira `GameVariables.Stamina` |

Sugestão: não transformar `stamina` e `isFisherOnIslandEnding` em campos oficiais. Se forem adicionados, marcar como deprecated e apontar para o nome correto.

```lua
---@deprecated Use GameVariables.Stamina
---@type number
GameVariables.stamina = 0

---@deprecated Use GameVariables.IsFisherOnIslandEnding
---@type boolean
GameVariables.isFisherOnIslandEnding = false
```

`HasToldBotAHorrorStory` precisa ser verificado no dump atual antes de ser adicionado.

---

# 2. Flags de história

## Estatística

Foram encontradas `68` flags únicas em chamadas `CheckFlag`, `CheckFlagAfterRelative` e `CheckFlagBeforeRelative`.

Flags mais frequentes:

| Flag | Ocorrências |
|---|---|
| `riots_beaten_up` | 10 |
| `Melissa22` | 7 |
| `Melissa_dead` | 6 |
| `Annalie_gave_money` | 5 |
| `ClothierHalloweenWithBot2` | 4 |
| `clothiervisit` | 3 |
| `good_soul` | 3 |
| `church-nun_back1` | 3 |
| `church-bigdaddystorylinepart1` | 3 |
| `Karaoke2` | 3 |
| `LandlordConspiracy3` | 2 |
| `bigDaddysAdviceFinished` | 2 |
| `hobo` | 2 |
| `BestClient` | 2 |
| `GoingOutside3` | 2 |
| `church-endJustGoThereGood` | 2 |
| `JoinUs2` | 2 |
| `hobo_failed` | 2 |
| `lastdate` | 2 |
| `church-priestbot_lie` | 2 |
| `artgallery1` | 2 |
| `restaurant1` | 2 |
| `joinusBigDaddy` | 2 |
| `bigDaddysAdvicePart2` | 2 |
| `church-nun_back7` | 2 |
| `Melissa4bot` | 2 |
| `shooting_failure` | 2 |
| `basketball_failure` | 2 |
| `Bathroom1_haggle` | 2 |
| `Melissa_leaves` | 2 |

## Funções de flag observadas

```lua
gv.CheckFlag("flag")
gv.CheckFlagAfterRelative("flag", minutes)
gv.CheckFlagBeforeRelative("flag", minutes)
gv.GetFlagSetCount("prefix")
```

## Condições temporais com flags

| Flag | Tempo |
|---|---|
| `LandlordStaircase` | `12*60` |
| `exposure` | `12*60` |
| `clothiervisit` | `5` |
| `lastdate` | `14*60` |
| `dispenserempty24hours` | `24*60` |

## Recomendação para stubs

Não transformar flags de história em enum fechado. Elas são muito específicas de conteúdo/storyline.

Melhor opção:

```lua
---@alias MdrgStoryFlagId string
```

E, se quiser autocomplete documental, gerar uma lista revisável separada:

```lua
---@alias MdrgKnownStoryFlagId
---| '"clothiervisit"'
---| '"good_soul"'
---| '"riots_beaten_up"'
---| '"Melissa22"'
```

---

# 3. Sistema de tempo e condições

## Operadores de hora encontrados

| Expressão | Ocorrências |
|---|---|
| `gv.Hour >= 7` | 3 |
| `gv.Hour <= 12` | 3 |
| `gv.Hour >= 8` | 2 |
| `gv.Hour < 18` | 2 |
| `gv.Hour <= 19` | 2 |
| `gv.Hour >= 19` | 2 |
| `gv.Hour <= 5` | 2 |
| `gv.Hour >= 23` | 2 |
| `gv.Hour >= 15` | 2 |
| `gv.Hour == 17` | 1 |
| `gv.Hour >= 12` | 1 |
| `gv.Hour <= 24` | 1 |
| `gv.Hour >= 10` | 1 |
| `gv.Hour < 20` | 1 |
| `gv.Hour >= 5` | 1 |
| `gv.Hour <= 10` | 1 |
| `gv.Hour < 23` | 1 |
| `gv.Hour <= 8` | 1 |
| `gv.Hour <= 17` | 1 |
| `gv.Hour >= 9` | 1 |
| `gv.Hour >= 6` | 1 |
| `gv.Hour <= 3` | 1 |
| `gv.Hour < 5` | 1 |
| `gv.Hour == 2` | 1 |
| `gv.Hour >= 13` | 1 |
| `gv.Hour < 6` | 1 |
| `gv.Hour < 15` | 1 |
| `gv.Hour > 17` | 1 |

## Condições de dinheiro encontradas

| Expressão | Ocorrências |
|---|---|
| `gv.money > 1200` | 3 |
| `gv.money > 100000` | 3 |
| `gv.money < 1200` | 2 |
| `gv.money < 5000` | 2 |
| `gv.money > 1000000` | 2 |
| `gv.money > 6000` | 1 |
| `gv.money > 2000` | 1 |
| `gv.money > 11000` | 1 |
| `gv.money > 2000000` | 1 |
| `gv.money > 50000` | 1 |
| `gv.money > 4` | 1 |
| `gv.money > 1000` | 1 |
| `gv.money < 13000000` | 1 |
| `gv.money < 5000000` | 1 |
| `gv.money > 500000` | 1 |

## Padrões úteis para mods

```lua
local function isMorning()
  return GameVariables.Hour >= 7 and GameVariables.Hour <= 12
end

local function isNight()
  return GameVariables.Hour <= 5 or GameVariables.Hour >= 23
end

local function flagOlderThan(flag, minutes)
  return GameVariables.CheckFlagAfterRelative(flag, minutes)
end

local function canPay(amount)
  return GameVariables.money >= amount
end
```

Esses padrões são úteis para:

- diálogos contextuais por horário;
- eventos que só aparecem depois de X horas;
- reações por dinheiro/estado;
- autonomia do bot baseada em rotina.

---

# 4. Browser interno

## Chamadas de `UiOverlay`

| Chamada | Ocorrências |
|---|---|
| `UiOverlay.GetCurrentlyOpenedBrowser(...)` | 18 |
| `UiOverlay.OpenBrowser(...)` | 8 |
| `UiOverlay.GetCurrentlyOpenedBotStatusApp(...)` | 4 |
| `UiOverlay.OpenBotStatusAppPrologue(...)` | 1 |
| `UiOverlay.OpenBotStatusApp(...)` | 1 |

## Chamadas em `browser`

| Chamada | Ocorrências |
|---|---|
| `browser.SelectEmail(...)` | 5 |
| `browser.ChangeWebsite(...)` | 3 |
| `browser.CloseFromUIOverlay(...)` | 1 |

## Websites internos encontrados

| Website | Ocorrências |
|---|---|
| `bang.ic/email` | 5 |
| `casino.ic` | 1 |
| `cocktracts.ic/help` | 1 |

## Exemplo seguro

```lua
local function openWebsite(website)
  if not UiOverlay or not UiOverlay.OpenBrowser then
    return nil
  end

  local browser = UiOverlay.OpenBrowser()
  coroutine.yield(GameUtilities.WaitForSecondsYield(1))

  if browser and browser.ChangeWebsite then
    browser.ChangeWebsite(website)
  end

  return browser
end

-- Exemplo:
-- openWebsite("bang.ic/email")
-- openWebsite("casino.ic")
```

## Alias sugerido

```lua
---@alias MdrgWebsiteId
---| '"bang.ic/email"'
---| '"casino.ic"'
---| '"cocktracts.ic/help"'
```

---

# 5. Blog/Login interno `JoinUs`

## Blog IDs encontrados

| Blog ID | Ocorrências |
|---|---|
| `Blog1` | 1 |
| `Blog2` | 1 |
| `Blog3` | 1 |
| `Blog4` | 1 |
| `BlogBigDaddy1` | 1 |
| `BlogBigDaddy2` | 1 |
| `BlogBigDaddy3` | 1 |
| `BlogRichard1` | 1 |
| `BlogRichard2` | 1 |

## Padrão observado

```lua
UiOverlay.GetCurrentlyOpenedBrowser().JoinUsOpenBlogLoginPage("Blog1")
coroutine.yield(UiOverlay.GetCurrentlyOpenedBrowser().JoinUsLogin_Enumerator())
```

## Alias sugerido

```lua
---@alias MdrgJoinUsBlogId
---| '"Blog1"'
---| '"Blog2"'
---| '"Blog3"'
---| '"Blog4"'
---| '"BlogBigDaddy1"'
---| '"BlogBigDaddy2"'
---| '"BlogBigDaddy3"'
---| '"BlogRichard1"'
---| '"BlogRichard2"'
```

Recomendação: documentar como **interno/experimental**, porque parece amarrado a conteúdo específico do jogo.

---

# 6. BotStatusApp

## Chamadas observadas

| Chamada | Ocorrências |
|---|---|
| `botStatusApp.WaitTillPlayerInputNeeded(...)` | 3 |
| `botStatusApp.ForceSubmitPlayerInput(...)` | 2 |
| `botStatusApp.CloseFromUIOverlay(...)` | 1 |

Também aparecem:

```lua
UiOverlay.OpenBotStatusApp()
UiOverlay.OpenBotStatusAppPrologue()
UiOverlay.GetCurrentlyOpenedBotStatusApp()
```

## Arquivos internos observados

| File ID | Ocorrências |
|---|---|
| `boobs` | 3 |
| `mouth` | 1 |

## Exemplo seguro

```lua
local function showBotStatusFile(fileId)
  local app = UiOverlay.GetCurrentlyOpenedBotStatusApp()
  if not app and UiOverlay.OpenBotStatusApp then
    app = UiOverlay.OpenBotStatusApp()
  end

  if app and app.ShowFile then
    app.ShowFile(fileId)
  end
end

-- Exemplo:
-- showBotStatusFile("mouth")
```

## Alias sugerido

```lua
---@alias MdrgBotStatusFileId
---| '"boobs"'
---| '"mouth"'
```

---

# 7. Notícias

## `NewsId` encontrados

| NewsId | Ocorrências |
|---|---|
| `NewsId.MainNews` | 4 |
| `NewsId.OpinionNews` | 1 |

## `GameId.CreateVanilla(...)` usados com notícias

| GameId | Ocorrências |
|---|---|
| `10001` | 1 |
| `1001` | 1 |
| `1003` | 1 |
| `1004` | 1 |
| `1005` | 1 |

## Padrão observado

```lua
gv.newsDataManager.Force(NewsId.MainNews, GameId.CreateVanilla(1001))
gv.newsDataManager.Force(NewsId.OpinionNews, GameId.CreateVanilla(10001))
```

## Recomendação

Documentar `newsDataManager` como parte de `GameVariables`, mas com cuidado:

```lua
---@class NewsDataManager
---@field Force fun(newsId: NewsId, gameId: GameId)
```

E adicionar nota:

> Uso observado em scripts internos. Verificar disponibilidade em mods comuns antes de recomendar como API estável.

---

# 8. Save/global flags

## Global flags encontradas

| Global flag | Ocorrências |
|---|---|
| `prologueseen` | 2 |

## Padrão observado

```lua
GameUtilities.Save.AddGlobalFlag("prologueseen")
GameUtilities.SaveSingleton.SaveAllChanges()
GameUtilities.Save.HasGlobalFlag("prologueseen")
```

## Interpretação

Existem pelo menos dois sistemas de flags:

| Sistema | Exemplo | Uso provável |
|---|---|---|
| `GameVariables.CheckFlag(...)` | `gv.CheckFlag("clothiervisit")` | flags do save/story atual |
| `GameUtilities.Save.*GlobalFlag(...)` | `GameUtilities.Save.AddGlobalFlag("prologueseen")` | flags globais/persistentes |

Recomendação: documentar como API de persistência avançada, mas não usar em exemplos básicos.

---

# 9. `flowchart` / Fungus runtime

## Chamadas observadas

| Chamada | Ocorrências |
|---|---|
| `flowchart.SetIntegerVariable(...)` | 3 |
| `flowchart.SetBooleanVariable(...)` | 1 |

## Padrão observado

```lua
flowchart.SetIntegerVariable("Integer", value)
flowchart.SetBooleanVariable("Boolean", value)
```

## Interpretação

`flowchart` provavelmente é um objeto injetado no ambiente de scripts internos/Fungus.

Não deve ser documentado como global normal de mod sem confirmação.

Stub recomendado:

```lua
---@class FungusFlowchartRuntime
local FungusFlowchartRuntime = {}

---@param name string
---@param value integer
function FungusFlowchartRuntime.SetIntegerVariable(name, value) end

---@param name string
---@param value boolean
function FungusFlowchartRuntime.SetBooleanVariable(name, value) end

---@type FungusFlowchartRuntime
flowchart = flowchart
```

---

# 10. Strings soltas que podem virar aliases

| Alias | Valores | Confiança | Observação |
|---|---|---|---|
| `MdrgWebsiteId` | `"bang.ic/email"` (5), `"casino.ic"` (1), `"cocktracts.ic/help"` (1) | alta | Usado em `browser.ChangeWebsite`. |
| `MdrgJoinUsBlogId` | `"Blog1"`, `"Blog2"`, `"Blog3"`, `"Blog4"`, `"BlogBigDaddy1"`, `"BlogBigDaddy2"`, `"BlogBigDaddy3"`, `"BlogRichard1"`, `"BlogRichard2"` | média | IDs de páginas internas do JoinUs; parece fluxo interno. |
| `MdrgBotStatusFileId` | `"boobs"` (3), `"mouth"` (1) | média | Usado em `BotStatusApp.ShowFile`. |
| `MdrgGlobalFlagId` | `"prologueseen"` (2) | alta | Usado em `GameUtilities.Save.*GlobalFlag`. |
| `MdrgStoryFlagId` | muitas flags; exemplos: `"riots_beaten_up"` (10), `"Melissa22"` (7), `"Melissa_dead"` (6), `"Annalie_gave_money"` (5), `"ClothierHalloweenWithBot2"` (4), `"clothiervisit"` (3), `"good_soul"` (3), `"church-nun_back1"` (3) | baixa/média | Strings muito específicas de história; usar alias aberto/documental. |

## Regra recomendada

- **Virar alias forte:** websites, blog IDs, BotStatus file IDs, global flags.
- **Virar alias aberto/documental:** story flags.
- **Não virar enum:** nomes de personagens, falas, textos de UI, IDs narrativos muito específicos sem contexto.

---

# 11. Arquivo de stub legado sugerido

Arquivo sugerido:

```text
mdrg_legacy_runtime_aliases.d.lua
```

Conteúdo base:

```lua
---@meta

---Alias legado/interno visto em scripts extraídos de flowcharts/Fungus.
---Em mods novos, prefira usar `GameVariables`.
---@deprecated Use GameVariables instead.
---@type GameVariables
gv = GameVariables

---@alias MdrgWebsiteId
---| '"bang.ic/email"'
---| '"casino.ic"'
---| '"cocktracts.ic/help"'

---@alias MdrgJoinUsBlogId
---| '"Blog1"'
---| '"Blog2"'
---| '"Blog3"'
---| '"Blog4"'
---| '"BlogBigDaddy1"'
---| '"BlogBigDaddy2"'
---| '"BlogBigDaddy3"'
---| '"BlogRichard1"'
---| '"BlogRichard2"'

---@alias MdrgBotStatusFileId
---| '"boobs"'
---| '"mouth"'

---@alias MdrgGlobalFlagId
---| '"prologueseen"'

---@class FungusFlowchartRuntime
local FungusFlowchartRuntime = {}

---@param name string
---@param value integer
function FungusFlowchartRuntime.SetIntegerVariable(name, value) end

---@param name string
---@param value boolean
function FungusFlowchartRuntime.SetBooleanVariable(name, value) end

---Objeto injetado em `luaScript`/flowchart interno.
---Não confirmado como global confiável em scripts normais de mod.
---@type FungusFlowchartRuntime
flowchart = flowchart
```

---

# 12. Helpers úteis derivados desse arquivo

Esses helpers podem entrar em `utils.lua` ou nos exemplos avançados:

```lua
local GV = GameVariables or gv

local function hasFlag(flag)
  return GV and GV.CheckFlag and GV.CheckFlag(flag) or false
end

local function flagOlderThan(flag, minutes)
  return GV and GV.CheckFlagAfterRelative and GV.CheckFlagAfterRelative(flag, minutes) or false
end

local function isHourBetween(startHour, endHour)
  local hour = GV and GV.Hour or 0
  return hour >= startHour and hour <= endHour
end

local function canPay(amount)
  return GV and GV.money and GV.money >= amount
end

local function tryTakeMoney(amount)
  if GV and GV.TryTakeMoney then
    return GV.TryTakeMoney(amount)
  end
  return false
end
```

---

# 13. Diferença para os arquivos de mods analisados anteriormente

| Arquivo | Melhor uso |
|---|---|
| `clothes.lua` | roupas, slots, controller element overrides |
| `foods.lua` | `EdibleData`, nutrição, comida/ingrediente |
| `modules.lua` | módulos corporais, variáveis modificáveis, sliders |
| `personalities.lua` | item prefab de personality module |
| `personalityDefinition.lua` | containers/branches de diálogo |
| `ExtractedOther.txt` | flags, runtime interno, browser, BotStatusApp, flowchart, `gv` legado |

`ExtractedOther.txt` não é bom para exemplos de criação de item, mas é excelente para entender automação narrativa e condições internas.

---

# 14. Melhorias propostas para geração de stubs

## 14.1. Adicionar camada de aliases legados

Gerar um arquivo opcional:

```text
mdrg_legacy_runtime_aliases.d.lua
```

Conteúdo:

- `gv`;
- `flowchart`;
- aliases de website;
- aliases de BotStatus file;
- aliases de JoinUs blog;
- aliases de global flag.

## 14.2. Separar API estável de API interna

Sugestão de organização:

```text
library/
  mdrg_game.d.lua
  mdrg_items.d.lua
  mdrg_ui.d.lua
  mdrg_story.d.lua
  mdrg_enums.d.lua
  mdrg_usage_aliases.d.lua
  mdrg_legacy_runtime_aliases.d.lua
```

## 14.3. Marcar APIs internas com aviso

Exemplo:

```lua
---Uso observado em scripts internos extraídos.
---Pode não estar disponível em scripts normais de mod.
```

## 14.4. Tratar `gv` como deprecated

```lua
---@deprecated Use GameVariables instead.
---@type GameVariables
gv = GameVariables
```

## 14.5. Gerar CSV de strings candidatas

O gerador pode extrair strings por contexto:

| Contexto | Alias |
|---|---|
| `ChangeWebsite("...")` | `MdrgWebsiteId` |
| `ShowFile("...")` | `MdrgBotStatusFileId` |
| `JoinUsOpenBlogLoginPage("...")` | `MdrgJoinUsBlogId` |
| `CheckFlag("...")` | `MdrgKnownStoryFlagId` |
| `AddGlobalFlag("...")` | `MdrgGlobalFlagId` |

---

# 15. Conclusão

`ExtractedOther.txt` acrescenta uma camada que os arquivos de mod não cobrem bem: a camada de **scripts internos de história/UI**.

As informações mais importantes extraídas são:

1. `gv` é um alias legado/interno de `GameVariables`;
2. `GameVariables` tem muitos campos úteis para condições de história e rotina;
3. flags são strings soltas e devem ser aliases abertos, não enums fechados;
4. existem websites internos usados pelo browser;
5. existe fluxo interno para `JoinUs`/blog login;
6. `BotStatusApp` tem métodos úteis para interação com arquivos internos;
7. `newsDataManager` pode forçar notícias;
8. `GameUtilities.Save` possui global flags;
9. `flowchart` é provavelmente objeto injetado por Fungus;
10. o melhor caminho é criar uma camada separada de stubs legados/experimentais.

A maior melhoria prática seria adicionar `mdrg_legacy_runtime_aliases.d.lua`, mantendo os stubs principais limpos e estáveis.

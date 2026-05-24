# Relatório comparativo — `mods_mixed.lua`

Comparação entre:

1. **Relatório anterior**: análise exploratória feita a partir do `mods_mixed.lua`.
2. **Relatório do Codex**: análise gerada por scanner sanitizado, com inferência parcial de tipos e contagem de chamadas/API.

## Veredito geral

Os dois relatórios batem no ponto principal: o arquivo é majoritariamente uma massa de exemplos de mods que usam o mesmo fluxo:

```lua
local prefab = ModUtilities.CreateItemPrefab()
prefab.Name = "..."
prefab.Description = "..."
prefab.Price = ...
prefab.Category = ItemCategory.X
prefab.AddTexture(ModUtilities.GetPackedTexture(CurrentModGuid, "..."))

local id = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, prefab)
ModUtilities.AddSingleBuyItemToShop("shop", id)
```

O **relatório do Codex é melhor para precisão de API/stubs**, porque ele:

- sanitizou strings/comentários antes de contar;
- inferiu variáveis criadas por `ModUtilities.CreateItemPrefab()`;
- separou chamadas reais de API de padrões mais soltos;
- levantou evidência de uso `.` vs `:`;
- cruzou campos de `ItemPrefab` com os stubs atuais.

O **relatório anterior é melhor como mapa prático do conteúdo**, porque levantou:

- slots de equipamento;
- shops;
- paths de room sprite;
- nomes de controllers;
- containers de diálogo;
- duplicação de scripts;
- padrões ruins de modding;
- possíveis inconsistências em `GameVariables`.

A conclusão correta é: **os dois relatórios se complementam**. O Codex serve como base para documentação técnica e geração de stubs; o anterior serve como inventário semântico para autocomplete, enums e listas auxiliares.

---

## Pontos que batem

| Tema | Relatório anterior | Relatório Codex | Avaliação |
|---|---:|---:|---|
| Blocos `script_X.lua` | `537` | `537` | Bate exatamente. |
| `ModUtilities.CreateItemPrefab()` | `2.837` | `2.837` | Bate exatamente no dado mais importante. |
| Uso central de `ItemPrefab` | Sim | Sim | Ambos identificam `ItemPrefab` como núcleo do sistema. |
| `GetPackedTexture` / `AddTexture` | ~`7.678` | `7.676` | Diferença mínima; provavelmente regex/comentários/espaços. |
| `PrepareContainer` / diálogos | ~`3.180` | `3.175` | Diferença pequena; mesma conclusão. |
| `StoryBotDialogueBranch.__new` | Detectado indiretamente | `3.199` | Codex foi mais específico. |
| `CreateNewItemAutoAssignId` | ~`2.833` | `2.842` | Mesma ordem; Codex provavelmente mais correto. |
| Funções `OnUse`, `ChangeTV`, `Changeplush`, etc. | Sim | Sim | Bate no padrão de callbacks. |
| Categorias principais | `Modules`, `Clothing`, `Room`, `Other` | mesmas principais | Bate. |
| Room sprite override | Sim | Sim | Ambos detectam `TextureOverriderManager.RoomManager`. |
| UI popup | Sim | Sim | Codex quantificou melhor com `UiOverlay.OkPopup`. |
| Coroutines | Sim | Sim | Codex detalhou `WaitForSeconds`, `yield`, `StartCoroutine`, `StopCoroutine`. |

---

## Divergências importantes

### 1. Contagem de linhas

- Relatório anterior: `105.104`
- Codex: `105.105`

Isso é só diferença de método:

- `wc -l` conta quebras de linha;
- `splitlines()` pode contar a última linha mesmo sem newline final.

Não muda a análise.

---

### 2. `CreateNewItemAutoAssignId`

- Relatório anterior: `2.833`
- Codex: `2.842`

Aqui eu confiaria mais no Codex.

Motivo: esse tipo de chamada pode aparecer com variações de espaço, comentários, ou dentro de wrappers. O Codex diz que fez inferência de variáveis e scan sanitizado, então tende a separar melhor chamada real de ruído.

Conclusão:

```lua
---@return GameId
function ModUtilities.CreateNewItemAutoAssignId(modGuid, prefab) end
```

Deve entrar como API central.

---

### 3. Funções declaradas

- Relatório anterior: `371` totais, `80` únicas.
- Codex: `360` totais, `77` únicas.

Provável causa:

- meu relatório anterior fez uma varredura mais permissiva;
- o Codex removeu comentários/strings antes de contar;
- algumas strings podem ter parecido código;
- algumas variações podem ter sido interpretadas de forma diferente.

Para documentação, o número exato importa menos que o padrão: existem várias funções globais repetidas, principalmente:

```lua
OnUse
Changeplush
Available
Coroutine
catSpecialEffect
Changerug
Changedoor
Changedesk
ChangeBack
Changewindow
ChangeTV
ChangeTVlight
ChangePC
ChangePCrgb
Changecupboard
Changesofa
Changebed
```

A conclusão permanece: **há risco real de colisão global entre scripts** se tudo for carregado no mesmo ambiente.

---

### 4. Adições em shops

Relatório anterior:

```txt
Adições diretas em shops: ~1.410
```

Codex separou melhor:

```txt
ModUtilities.AddSingleBuyItemToShop = 1.392
ModUtilities.AddGenericItemToShop   = 97
```

Somando as duas, dá:

```txt
1.489 chamadas de adição em shops
```

Essa diferença provavelmente vem do critério usado:

- contar apenas chamadas com shop string explícita;
- contar chamadas via variável;
- contar chamadas sanitizadas;
- contar apenas `AddSingleBuyItemToShop`;
- contar também `AddGenericItemToShop`.

Para stubs, a decisão correta é documentar ambos:

```lua
function ModUtilities.AddSingleBuyItemToShop(shopName, itemGameId) end
function ModUtilities.AddGenericItemToShop(shopName, itemGameIdOrItem) end
```

---

### 5. Campos de `ItemPrefab`

Meu relatório listou os campos principais. O Codex confirmou esses campos e adicionou informação mais útil: **todos os campos inferidos já existem nos stubs atuais**.

Campos mais relevantes confirmados:

```lua
Name
Description
Price
ColorSlots
IsStackable
Category
CanChangeColor
IsIllegal
HasQuality
ScratchType
SusModifiers
PossibleEquipmentSlots
Partners
RequiredSlots
OverrideIcon
ThrowingOutForbidden
SlotData
SpecialEffectAction
ControllerElementOverrides
OnUse
IsPersonalityModule
FishData
EdibleData
ItemModifiableVariables
AllowedModifiersData
FishingRodItemPrefabData
ItemModifiableVariablesRequirements
```

Diferença importante: meu relatório sugeria esses campos como candidatos; o Codex afirma que **não existem gaps contra os stubs atuais**.

Conclusão prática:

- Não precisa adicionar novos campos básicos de `ItemPrefab`, se o stub atual já contém esses.
- O foco agora deve ser melhorar:
  - descrições hover;
  - tipos de callbacks;
  - enums auxiliares;
  - valores conhecidos para slots, shops, palettes e paths.

---

## O que o Codex adicionou de melhor

### 1. Evidência `.` vs `:`

O Codex mostrou que quase todas as chamadas frequentes usam **dot syntax**:

```lua
ModUtilities.CreateItemPrefab()
ModUtilities.GetPackedTexture(...)
itemprefab.AddTexture(...)
TextureOverriderManager.RoomManager.SetSprite(...)
```

E quase nenhuma usa `:`.

Isso é importante para LuaLS.

Em vez de modelar assim:

```lua
function ItemPrefab:AddTexture(texture) end
```

talvez seja mais fiel modelar assim:

```lua
---@param texture PackedTexture
function ItemPrefab.AddTexture(texture) end
```

Ou, se internamente isso representa método C# exposto como membro, ainda dá para adicionar os dois overloads, mas o autocomplete principal deveria priorizar o padrão real usado pelos mods.

---

### 2. APIs candidatas para hover docs

O relatório do Codex identificou candidatos bons para documentação:

```lua
Item.GetCount
Item.GetUniqueGuid
Item.GetMainColorFromAdditionalData
Item.IsEquipped
Item.SetColorIntoAdditionalData

ItemPrefab.AddTexture
ItemPrefab.TurnIntoPersonalityModule
ItemPrefab.MakeSet
ItemPrefab.MakePair

ModUtilities.CreateItemPrefab
ModUtilities.CreateNewItemAutoAssignId
ModUtilities.GetPackedTexture
ModUtilities.GetAsSprite
ModUtilities.GetSprite
ModUtilities.GetSpriteReference
ModUtilities.PrepareNewPersonalityDefinition
ModUtilities.StartCoroutine
ModUtilities.StopCoroutine
ModUtilities.WaitForSeconds

LuaPersonalityModuleDefinition.PrepareContainer
StoryBotDialogueBranch.__new
StoryCondition.Delegate

TextureOverriderManager.RoomManager.SetSprite
TextureOverriderManager.RoomManager.RestoreSprite
TextureOverriderManager.RoomManager.GetSpecialEffectsAction

UiOverlay.OkPopup
UiOverlay.CloseUiOverlay

Live2DControllerSingleton.LuaInstance.UpdateAllTextures
GameUtilities.WaitForSecondsYield
```

Esses nomes são mais importantes que a maioria dos scripts individuais.

---

### 3. Separação entre API atual e legado

O Codex marcou alguns acessos como **legacy/nested runtime calls**:

```lua
fungus.luaenvironment.RunLuaFunction
Live2DControllerSingleton.LuaInstance.UpdateAllTextures
TextureOverriderManager.RoomManager.SetSprite
TextureOverriderManager.RoomManager.RestoreSprite
UiOverlay.OkPopup
UiOverlay.CloseUiOverlay
```

Isso é uma boa cautela.

Nem tudo que aparece no arquivo deve virar API "oficial" do addon LuaLS. Alguns nomes podem ser:

- APIs antigas;
- singletons internos;
- hacks de runtime;
- restos de scripts gerados;
- acessos ainda suportados, mas não recomendados.

Para o addon LuaLS, eu separaria em dois grupos:

```txt
library/core/
  APIs confirmadas e seguras.

library/legacy/
  APIs vistas em mods antigos, mas que devem ser verificadas no dump.
```

---

## O que meu relatório anterior adicionou que o Codex não focou

### 1. Duplicação de scripts

Meu relatório apontou aproximadamente:

```txt
537 blocos totais
312 scripts únicos aproximados
225 entradas duplicadas/repetidas
```

O Codex não destacou isso.

Isso é útil porque explica por que algumas contagens são infladas. O arquivo não representa 537 mods realmente independentes; ele parece misturar scripts repetidos, versões antigas e variações pequenas.

Conclusão:

- Não use frequência absoluta como verdade de design.
- Use frequência para priorizar documentação.
- Exemplo: `AddTexture` com milhares de usos é obviamente central.
- Mas `OnUse` repetido pode estar inflado por scripts duplicados.

---

### 2. Inventário de slots

Meu relatório levantou valores reais de `PossibleEquipmentSlots` e `RequiredSlots`, como:

```lua
HairMain
Back hair
Hair behind ears
hairclip
Side bits
StockingL
StockingR
Horns
Room_Plush
ShoeL
ShoeR
Hairfront
Tail
PersonalityModule
Skin
UpperBody
UpperBodyOuter
LowerBody
Panties
Bra
Room_WallDecoration
Room_Mat
Room_TV
Room_TVlight
Room_PC
Room_PClight
Room_PCrgb
Room_door
Room_desk
Room_cupboard
Room_sofa
Room_bed
Room_win
```

Isso é extremamente útil para autocomplete, mesmo que não seja uma classe C#.

Sugestão:

```lua
---@alias EquipmentSlot
---| '"HairMain"'
---| '"Back hair"'
---| '"Hair behind ears"'
---| '"hairclip"'
---| '"Room_Plush"'
---| '"Room_TV"'
---| '"Room_PC"'
```

---

### 3. Shops reais

Meu relatório levantou shops como:

```lua
clothier
ladyparts.ic
grocery
pharmacy
richpeopleshop
```

Isso também vale como alias:

```lua
---@alias ShopId
---| '"clothier"'
---| '"ladyparts.ic"'
---| '"grocery"'
---| '"pharmacy"'
---| '"richpeopleshop"'
```

---

### 4. Paths de room sprite

Meu relatório levantou paths úteis para `TextureOverriderManager.RoomManager`:

```lua
/Room/SpiderPlush
/Room/mat
/Room/Door
/Room/PC/PC desk
/Room/couch
/Room/back
/Room/Window
/Room/TV/TV
/Room/TV/TV light
/Room/PC/PC
/Room/PC/PC rgb
/Room/Cupboard
/Room/Bed
/Room/PC/Screen light
/Room/BatBanner
/Room/Light Multiply
/Room/Morning Light
/Room/Light
```

Isso pode virar:

```lua
---@alias RoomSpritePath string
```

Ou, se quiser autocomplete forte:

```lua
---@alias KnownRoomSpritePath
---| '"/Room/TV/TV"'
---| '"/Room/TV/TV light"'
---| '"/Room/PC/PC"'
---| '"/Room/PC/PC rgb"'
---| '"/Room/Bed"'
```

---

### 5. Inconsistências em `GameVariables`

Meu relatório apontou que aparecem variações como:

```lua
GameVariables.Satiation
GameVariables.satiation

GameVariables.MentalHealth
GameVariables.mentalHealth

GameVariables.Stamina
GameVariables.stamina
```

Isso é importante para detectar bug, não necessariamente para documentar tudo como correto.

Recomendação:

- Documentar apenas nomes confirmados pelo dump/C#.
- Criar diagnostics opcionais no addon ou numa ferramenta externa:
  - alertar quando usar `mentalHealth` se o correto for `MentalHealth`;
  - alertar quando usar `stamina` se o correto for `Stamina`.

---

## Interpretação final das diferenças

As divergências numéricas não indicam que um relatório está "errado". Elas vêm de critérios diferentes:

| Diferença | Provável causa |
|---|---|
| `105104` vs `105105` linhas | método de contagem de última linha |
| `7678` vs `7676` textures | comentários/strings/espaços/sanitização |
| `3180` vs `3175` containers | regex permissivo vs chamada inferida |
| `371/80` vs `360/77` funções | strings/comentários/funções locais/metodologias |
| `1410` shops vs `1392 + 97` | separação entre `AddSingleBuyItemToShop` e `AddGenericItemToShop` |
| `2833` vs `2842` item registration | regex anterior provavelmente subcontou |

Quando a meta é **documentação LuaLS**, eu usaria a prioridade:

1. **Codex para contagem de API e campos inferidos.**
2. **Relatório anterior para listas semânticas e aliases.**
3. **Dump C#/Il2Cpp como fonte final de verdade.**
4. **`mods_mixed.lua` como evidência de uso real, não como contrato oficial.**

---

## Relatório consolidado recomendado

### APIs centrais a documentar primeiro

```lua
ModUtilities.CreateItemPrefab
ModUtilities.CreateNewItemAutoAssignId
ModUtilities.GetPackedTexture
ModUtilities.GetController
ModUtilities.GetSpriteReference
ModUtilities.GetSprite
ModUtilities.GetAsSprite
ModUtilities.AddSingleBuyItemToShop
ModUtilities.AddGenericItemToShop
ModUtilities.PrepareNewPersonalityDefinition
ModUtilities.WaitForSeconds
ModUtilities.StartCoroutine
ModUtilities.StopCoroutine

ItemPrefab.AddTexture
ItemPrefab.TurnIntoPersonalityModule
ItemPrefab.MakeSet
ItemPrefab.MakePair

ColorSlot.CreateInstance
ColorPaletteManager.GetColorPaletteByName
ColorPaletteEntry.CreateInstanceFromString
ColorPalette.CreateInstance

SusModifier.CreateInstance
SlotEquipData.CreateInstance
SlotEquipData.SetRequiredSlotsString
SlotEquipData.SetForbiddenSlotsString

StoryBotDialogueBranch.__new
StoryCondition.Delegate
LuaPersonalityModuleDefinition.PrepareContainer

TextureOverriderManager.RoomManager.SetSprite
TextureOverriderManager.RoomManager.RestoreSprite
TextureOverriderManager.RoomManager.GetSpecialEffectsAction

UiOverlay.OkPopup
UiOverlay.CloseUiOverlay

Item.GetUniqueGuid
Item.GetCount
Item.IsEquipped
Item.SetColorIntoAdditionalData
Item.GetMainColorFromAdditionalData
```

---

### Classes/tabelas que merecem stubs fortes

```lua
ModUtilities
ItemPrefab
Item
GameId
ColorSlot
ColorPalette
ColorPaletteEntry
ColorPaletteManager
SusModifier
SlotEquipData
LuaPersonalityModuleDefinition
StoryBotDialogueBranch
StoryCondition
TextureOverriderManager
RoomManager
UiOverlay
GameVariables
FishItemPrefabData
EdibleItemPrefabData
```

---

### Aliases/enums auxiliares que valem muito para autocomplete

```lua
---@alias ShopId string
---@alias EquipmentSlot string
---@alias RoomSpritePath string
---@alias ControllerName string
---@alias ColorPaletteName string
---@alias DialogueContainerId string
```

Depois, esses aliases podem ser estreitados com valores reais:

```lua
---@alias ShopId
---| '"clothier"'
---| '"ladyparts.ic"'
---| '"grocery"'
---| '"pharmacy"'
---| '"richpeopleshop"'

---@alias ControllerName
---| '"interaction"'
---| '"missionary"'
---| '"doggy"'
---| '"blowjob"'
---| '"cowgirl"'

---@alias ColorPaletteName
---| '"partpalette"'
---| '"grayscalepalette"'
---| '"skinpalette"'
```

---

## Decisão prática para o addon LuaLS

Eu seguiria esta ordem:

### Etapa 1 — Não mexer nos campos básicos de `ItemPrefab`

O Codex afirma que não há gaps contra os stubs atuais. Então não vale perder tempo adicionando campo duplicado.

Prioridade baixa:

```lua
Name
Description
Price
Category
IsStackable
CanChangeColor
...
```

Apenas revisar tipos e descrições.

---

### Etapa 2 — Melhorar métodos e callbacks

Prioridade alta:

```lua
---@field OnUse fun(item: Item): boolean?
---@field SpecialEffectAction fun(value: boolean, item: Item)
```

E métodos:

```lua
---@param texture PackedTexture
function ItemPrefab.AddTexture(texture) end

---@param itemId GameId
---@param personality LuaPersonalityModuleDefinition
function ItemPrefab.TurnIntoPersonalityModule(itemId, personality) end
```

---

### Etapa 3 — Adicionar hovers curtos

Exemplo:

```lua
---Creates a new item prefab object. Configure its fields, then register it with CreateNewItemAutoAssignId.
---@return ItemPrefab
function ModUtilities.CreateItemPrefab() end

---Registers an ItemPrefab for the current mod and returns its GameId.
---@param modGuid string
---@param prefab ItemPrefab
---@return GameId
function ModUtilities.CreateNewItemAutoAssignId(modGuid, prefab) end

---Loads a packed texture asset from the current mod package.
---@param modGuid string
---@param path string
---@return PackedTexture
function ModUtilities.GetPackedTexture(modGuid, path) end
```

---

### Etapa 4 — Criar arquivos separados no addon

Estrutura sugerida:

```txt
library/
  core/
    mod_utilities.lua
    item_prefab.lua
    item.lua
    color.lua
    dialogue.lua
    room_manager.lua
    ui_overlay.lua
    game_variables.lua

  aliases/
    shop_ids.lua
    equipment_slots.lua
    room_sprite_paths.lua
    controller_names.lua
    color_palette_names.lua
    dialogue_container_ids.lua

  legacy/
    fungus_runtime.lua
    live2d_singletons.lua
```

---

## Conclusão

O relatório do Codex confirma a maior parte do relatório anterior, mas é mais confiável para contagens de API e geração de stubs. O relatório anterior continua útil porque extraiu listas práticas que o Codex não priorizou.

A melhor leitura final é:

```txt
Codex = validação técnica e contagem confiável.
Relatório anterior = inventário semântico e entendimento prático dos mods.
Juntos = base boa para gerar um addon LuaLS mais completo.
```

Próximo passo ideal:

1. confirmar as APIs no dump C#/Il2Cpp;
2. manter campos existentes de `ItemPrefab`;
3. melhorar hovers e tipos de callbacks;
4. adicionar aliases para shops, slots, controllers, palettes e room paths;
5. separar APIs legadas/singletons internos em uma pasta `legacy/`.

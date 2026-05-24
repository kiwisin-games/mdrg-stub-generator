# Relatório de análise — `mods_mixed.lua`

Este relatório resume as informações relevantes extraídas do arquivo `mods_mixed.lua`, com foco em padrões repetidos, funções existentes, APIs usadas e dados úteis para documentação/stubs LuaLS.

## Resumo bruto do arquivo

| Métrica | Valor |
|---|---:|
| Linhas | `105.104` |
| Tamanho | `~5.7 MB` |
| Blocos `script_X.lua` | `537` |
| Scripts únicos aproximados | `312` |
| Scripts duplicados/repetidos | `225` entradas duplicadas |
| `CreateItemPrefab()` | `2.837` |
| `CreateNewItemAutoAssignId()` | `2.833` |
| Funções declaradas | `371` |
| Funções únicas | `80` |
| Diálogos `PrepareContainer()` | `3.180` |
| Containers de diálogo únicos | `86` |
| `AddTexture()` | `7.678` |
| Adições diretas em shops | `1.410` |

## Padrão principal: criação de item

O padrão mais repetido é a criação de um `ItemPrefab`, configuração dos seus campos e registro em uma loja.

```lua
itemprefab0 = ModUtilities.CreateItemPrefab()

itemprefab0.Name = "..."
itemprefab0.Description = "..."
itemprefab0.Price = 100
itemprefab0.PossibleEquipmentSlots = {...}
itemprefab0.RequiredSlots = {}
itemprefab0.IsIllegal = false
itemprefab0.HasQuality = false
itemprefab0.IsStackable = false
itemprefab0.Category = ItemCategory.Clothing
itemprefab0.CanChangeColor = true
itemprefab0.ColorSlots = {...}
itemprefab0.ScratchType = ScratchTextureType.Universal
itemprefab0.SusModifiers = {...}

item0 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab0)
ModUtilities.AddSingleBuyItemToShop("clothier", item0)
```

Isso indica que `ItemPrefab` é o objeto central do sistema de mods.

## Campos mais comuns de `ItemPrefab`

Campos mais recorrentes:

```lua
Name
Description
Price
PossibleEquipmentSlots
RequiredSlots
IsIllegal
HasQuality
IsStackable
Category
CanChangeColor
ColorSlots
ScratchType
SusModifiers
Partners
OverrideIcon
SpecialEffectAction
OnUse
SlotData
ThrowingOutForbidden
IsPersonalityModule
ControllerElementOverrides
```

Exemplo de stub LuaLS possível:

```lua
---@class ItemPrefab
---@field Name string
---@field Description string
---@field Price number
---@field PossibleEquipmentSlots string[]
---@field RequiredSlots string[]
---@field IsIllegal boolean
---@field HasQuality boolean
---@field IsStackable boolean
---@field Category ItemCategory
---@field CanChangeColor boolean
---@field ColorSlots ColorSlot[]
---@field ScratchType ScratchTextureType
---@field SusModifiers SusModifier[]
---@field Partners any[]
---@field OverrideIcon any
---@field SpecialEffectAction fun(value: boolean, item: Item)
---@field OnUse fun(item: Item)
```

## Categorias de item encontradas

```lua
ItemCategory.Modules      -- 1409
ItemCategory.Clothing     -- 832
ItemCategory.Room         -- 178
ItemCategory.Other        -- 83
ItemCategory.Meds         -- 40
ItemCategory.Food         -- 33
ItemCategory.Fish         -- 9
ItemCategory.Usable       -- 6
ItemCategory.FishingTrash -- 6
ItemCategory.AnonEquip    -- 5
ItemCategory.Package      -- 2
```

## Shops encontrados

```lua
clothier        -- 931
ladyparts.ic    -- 446
grocery         -- 20
pharmacy        -- 12
richpeopleshop  -- 1
```

Também aparece:

```lua
ModUtilities.AddGenericItemToShop(...)
```

Principalmente para `grocery` e `pharmacy`.

## Slots de equipamento mais comuns

O arquivo revela vários nomes reais de slots usados pelo jogo/mods:

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

Esse é um dos dados mais úteis do arquivo, pois permite montar um enum/tabela de slots para autocomplete.

## Sistema de textura

Padrão comum:

```lua
local texture = ModUtilities.GetPackedTexture(CurrentModGuid, "/path/file.json")
itemprefab0.AddTexture(texture)
```

Ou com controlador específico:

```lua
itemprefab0.AddTexture(ModUtilities.GetController("missionary"), texture)
itemprefab0.AddTexture(ModUtilities.GetController("doggy"), texture)
itemprefab0.AddTexture(ModUtilities.GetController("interaction"), texture)
itemprefab0.AddTexture(ModUtilities.GetController("blowjob"), texture)
```

Controladores/modos detectados em nomes de textura:

```lua
interaction
missionary
doggy
blowjob
cowgirl
```

Extensões de asset detectadas:

```lua
.json -- 7540 referências
.png  -- 1175 referências
```

## Sistema de cor

Padrão comum:

```lua
ColorSlot.CreateInstance("Main Color", ColorPaletteManager.GetColorPaletteByName("partpalette"))
```

Paletas encontradas:

```lua
partpalette       -- 4168
grayscalepalette  -- 25
skinpalette       -- 2
```

Nomes de `ColorSlot` muito comuns:

```lua
Main color
Main Color
main
Secondary Color
Secondary color
Eyebrow Color
Paw Color
Inner color
Outer color
Decal color
Translucent Color
Stripe color
Base color
Skin color
Glow color
Left iris
Right iris
Sclera
Eye Color
```

## Sistema de diálogos/personality modules

Padrão comum:

```lua
local personality = ModUtilities.PrepareNewPersonalityDefinition()

personality.PrepareContainer("Interact_Greeting")
  .AddBranch(StoryBotDialogueBranch.__new("...", CurrentModGuid, 0))

itemprefab0.TurnIntoPersonalityModule(itemgameid0, personality)
```

Prefixos de containers encontrados:

```lua
Frick     -- 1130
Cowgirl   -- 744
Blowjob   -- 484
Cuddle    -- 452
Kissing   -- 276
Interact  -- 94
```

Isso mostra que `PrepareContainer(name)` define eventos/estados narrativos, e `AddBranch(...)` adiciona falas alternativas.

## Sistema de room override

Padrão repetido:

```lua
function ChangeTV(value, item0)
  if item0.IsEquipped() and value then
    TextureOverriderManager.RoomManager.SetSprite("/Room/TV/TV", sprite)
  else
    TextureOverriderManager.RoomManager.RestoreSprite("/Room/TV/TV", sprite)
  end
end

itemprefab0.SpecialEffectAction = ChangeTV
```

Paths de room mais usados:

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

Esse padrão serve para mods de decoração/quarto.

## Funções existentes

Existem `371` declarações, mas só `80` nomes únicos.

Funções mais repetidas:

```lua
OnUse              -- 97
Changeplush        -- 25
Available          -- 19
Coroutine          -- 12
catSpecialEffect   -- 9
Changerug          -- 8
Changedoor         -- 8
Changedesk         -- 8
ChangeBack         -- 8
Changewindow       -- 8
ChangeTV           -- 7
ChangeTVlight      -- 7
ChangePC           -- 7
ChangePCrgb        -- 7
Changecupboard     -- 7
Changesofa         -- 7
Changebed          -- 7
ntf                -- 7
```

Lista compacta de funções únicas relevantes:

```lua
OnUse
OnUseDebug
OnUseLucky
Available
Coroutine

Changebat
ChangeTV
ChangeTVlight
ChangePC
ChangePClight
ChangePCrgb
Changeplush
Changerug
Changedoor
Changedesk
ChangeBack
Changewindow
ChangewindowLight
Changecupboard
Changesofa
Changebed
ChangeLightMultiply
ChangeMorningLight

CreateItem
createEyeItem
createItemPackage
addBranch
simpleContainer
buildClips
buildCategoryActions

computeLevel
UpdateMoon
startCummingSupervisor
supervisor

Cigarette
Beer
Wine
Lubricant
Pill
SleepPill
Tea
Bread
Burger
Poison
SuperFood
SempillX
Vitalisen
FortuneCookie
LotteryTicket
SexyPhotosOfLandlord
Endurance
Aphrochocolate
Chocorepellent
Brunchly
Grime
Treatables
Drippycheese
Kazy

Vector3
findChildByName
makeSimpleOffset
makeArmAttachOffset
makeInteractionOffset
applyEnlargementToModel
applyBreastEnlargement
```

## APIs externas mais usadas

Prováveis APIs importantes para stub:

```lua
ModUtilities.CreateItemPrefab()
ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, prefab)
ModUtilities.AddSingleBuyItemToShop(shopName, itemId)
ModUtilities.AddGenericItemToShop(shopName, item)
ModUtilities.GetPackedTexture(CurrentModGuid, path)
ModUtilities.GetSpriteReference(CurrentModGuid, path)
ModUtilities.GetSprite(CurrentModGuid, path)
ModUtilities.GetAsSprite(CurrentModGuid, path)
ModUtilities.GetController(controllerName)
ModUtilities.PrepareNewPersonalityDefinition()
ModUtilities.WaitForSeconds(seconds)
ModUtilities.StartCoroutine(fn)
ModUtilities.StopCoroutine(coroutine)

ColorSlot.CreateInstance(name, palette)
ColorPaletteManager.GetColorPaletteByName(name)
ColorPaletteEntry.CreateInstanceFromString(...)
ColorPalette.CreateInstance(...)

StoryBotDialogueBranch.__new(text, modGuid, id)
StoryCondition.Delegate(fn)

SusModifier.CreateInstance(area, value)
SlotEquipData.CreateInstance(...)
GameId.CreateVanilla(...)
UiOverlay.OkPopup(...)
UiOverlay.CloseUiOverlay()

TextureOverriderManager.RoomManager.SetSprite(path, sprite)
TextureOverriderManager.RoomManager.RestoreSprite(path, sprite)
TextureOverriderManager.RoomManager.GetSpecialEffectsAction(...)
```

## `GameVariables` encontradas

O arquivo mostra variáveis de estado manipuláveis:

```lua
GameVariables.longing
GameVariables.Satiation
GameVariables.MentalHealth
GameVariables.sympathy
GameVariables.mood
GameVariables.lust
GameVariables.Stamina
GameVariables.Health
GameVariables.money
GameVariables.remainingCum
GameVariables.casinoTokens
GameVariables.GetCumPercent()
GameVariables.ExtractCumFromBalls()
```

Também há inconsistências de capitalização:

```lua
Satiation / satiation
MentalHealth / mentalHealth
Stamina / stamina
Mood / mood
RemainingCum / remainingCum
MaxCum / maxCum
```

Isso sugere que alguns mods usam nomes errados, aliases ou simplesmente têm bugs.

## Problemas/padrões ruins encontrados

### 1. Muitas funções globais com o mesmo nome

Especialmente:

```lua
OnUse
ChangeTV
Changeplush
Available
Coroutine
```

Em Lua, isso pode sobrescrever funções anteriores se não estiverem dentro de `do ... end`, tabelas locais ou escopos separados.

### 2. Muitos scripts duplicados

Dos `537` blocos, só cerca de `312` são únicos.

### 3. Variáveis globais reutilizadas

Exemplos:

```lua
itemprefab0
item0
item1
personality
```

### 4. Inconsistência de nome/case

Exemplos:

```lua
Main Color
Main color
main color
main

MentalHealth
mentalHealth

Stamina
stamina
```

### 5. Espaçamento inconsistente em chamadas

Exemplos:

```lua
ModUtilities. GetAsSprite(...)
ModUtilities.GetAsSprite(...)
```

### 6. Prováveis typos em variáveis

Foram encontrados nomes parecidos com:

```lua
mentalHGameVariableslth
satiatiGameVariables
remainingCumGameVariables
```

## O que vale extrair para documentação/stubs

O mais útil para o addon LuaLS seria extrair definições para:

```lua
ItemPrefab
ItemCategory
ScratchTextureType
ModUtilities
ColorSlot
ColorPalette
ColorPaletteManager
ColorPaletteEntry
SusModifier
SusArea
SlotEquipData
StoryBotDialogueBranch
StoryCondition
TextureOverriderManager.RoomManager
UiOverlay
GameVariables
GameId
ItemPrefabManager
FishItemPrefabData
FishingBaitType
EdibleItemPrefabData
EdibleTypeEnum
```

Também vale gerar enums/tabelas para:

```lua
EquipmentSlots
ShopIds
RoomSpritePaths
ControllerNames
ColorPaletteNames
ColorSlotNames
DialogueContainerNames
GameVariables fields
```

## Conclusão

Esse `.lua` é uma boa fonte para descobrir como os mods desse jogo são montados na prática.

Ele mostra principalmente:

- como criar itens;
- como registrar itens em lojas;
- como adicionar texturas por controlador;
- como criar módulos de personalidade;
- como substituir sprites do quarto;
- como criar consumíveis via `OnUse`;
- quais slots, categorias, shops, paths e variáveis existem;
- quais funções/APIs devem entrar nos stubs do LuaLS.

O maior valor está menos no código individual e mais nos nomes reais usados pela API: slots, categorias, métodos, campos de prefab, paths de room, controllers e variáveis globais.

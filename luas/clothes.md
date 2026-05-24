# Documentação de `clothes.lua`

> Análise focada em padrões de roupas, slots de equipamento, texturas por cena, `SlotEquipData`, `ControllerElementOverride`, `ColorSlots`, `SusModifiers` e pontos úteis para stubs LuaLS.

## Resumo

Este arquivo é um catálogo gerado automaticamente de roupas e acessórios. Ele não contém lógica de uso (`OnUse`), módulos de personalidade, coroutine, comida, pesca ou override de quarto. O valor principal dele está em mostrar como criar roupas equipáveis com `SlotData`, texturas por cena e, em alguns casos, overrides de elementos específicos do controller.

| Métrica | Valor |
|---|---|
| Linhas | 1551 |
| Tamanho aproximado | 68.5 KB |
| Itens detectados | 40 |
| CreateItemPrefab | 40 |
| CreateNewItemAutoAssignId | 40 |
| AddSingleBuyItemToShop | 40 |
| GetPackedTexture | 154 |
| AddTexture | 154 |
| SlotEquipData.CreateInstance | 40 |
| ColorSlot.CreateInstance | 41 |
| SusModifier.CreateInstance | 27 |

## Padrão principal encontrado

O arquivo repete o mesmo ciclo para cada roupa:

```lua
local itemprefab = ModUtilities.CreateItemPrefab()

itemprefab.Name = 'Nome da roupa'
itemprefab.Description = 'Descrição'
itemprefab.Price = 400

itemprefab.SlotData = SlotEquipData.CreateInstance('UpperBody')
-- ou:
itemprefab.SlotData = (function()
  local sd = SlotEquipData.CreateInstance()
  sd.TargetSlotString = 'UpperBody'
  sd.ControllerElementOverride = {'UpperBody_Shirt'}
  return sd
end)()

itemprefab.IsIllegal = false
itemprefab.HasQuality = false
itemprefab.ThrowingOutForbidden = false
itemprefab.IsStackable = false
itemprefab.Category = ItemCategory.Clothing
itemprefab.CanChangeColor = false
itemprefab.ColorSlots = {
  ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))
}
itemprefab.Partners = {}
itemprefab.ScratchType = ScratchTextureType.Universal
itemprefab.SusModifiers = {
  SusModifier.CreateInstance(SusArea.UpperBody, 0.8)
}

local texture = ModUtilities.GetPackedTexture(CurrentModGuid, '/MinhaRoupa/tex 1 - interaction.json')
itemprefab.AddTexture(texture)

local itemgameid = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid)
```
Esse padrão confirma que, para roupas simples, o fluxo essencial é: **criar prefab → definir slot → adicionar texturas → registrar item → adicionar na loja**.

## APIs e chamadas encontradas

| API/chamada | Usos | Observação |
|---|---|---|
| `ModUtilities.CreateItemPrefab` | 40 | Cria o `ItemPrefab` configurável. |
| `SlotEquipData.CreateInstance` | 40 | Cria a definição de slot/equipamento. |
| `ModUtilities.GetPackedTexture` | 154 | Carrega textura empacotada `.json` do mod. |
| `ItemPrefab.AddTexture` | 154 | Anexa textura ao prefab. |
| `ColorSlot.CreateInstance` | 41 | Define uma cor configurável do item. |
| `ColorPaletteManager.GetColorPaletteByName` | 41 | Obtém palette por string. |
| `SusModifier.CreateInstance` | 27 | Define impacto visual/área sensível do item. |
| `SlotEquipData.SetRequiredSlotsString` | 4 | Define slots obrigatórios para equipar. |
| `SlotEquipData.SetForbiddenSlotsString` | 2 | Define slots incompatíveis/bloqueados. |
| `ModUtilities.CreateNewItemAutoAssignId` | 40 | Registra o item e retorna `GameId`. |
| `ModUtilities.AddSingleBuyItemToShop` | 40 | Adiciona item à loja `clothier`. |

Não há chamadas a `OnUse`, `PrepareNewPersonalityDefinition`, `StoryBotDialogueBranch`, `TextureOverriderManager.RoomManager`, `UiOverlay`, `StartCoroutine`, `EdibleData`, `FishData`, `MakePair` ou `MakeSet`.

## Campos de `ItemPrefab` usados

| Campo | Atribuições |
|---|---|
| `Name` | 40 |
| `Description` | 40 |
| `Price` | 40 |
| `SlotData` | 40 |
| `IsIllegal` | 40 |
| `HasQuality` | 40 |
| `ThrowingOutForbidden` | 40 |
| `IsStackable` | 40 |
| `Category` | 40 |
| `CanChangeColor` | 40 |
| `ColorSlots` | 40 |
| `Partners` | 40 |
| `ScratchType` | 40 |
| `SusModifiers` | 40 |
| `SubCategory` | 11 |

Todos os itens usam `ItemCategory.Clothing`, `ScratchTextureType.Universal`, `IsIllegal = false`, `HasQuality = false`, `IsStackable = false`, `ThrowingOutForbidden = false`, `Partners = {}` e são adicionados à loja `clothier`.

### Categorias e subcategorias

| Categoria | Itens |
|---|---|
| `ItemCategory.Clothing` | 40 |


| Subcategoria | Itens |
|---|---|
| `ItemSubCategory.Clothing_MakeUp` | 6 |
| `ItemSubCategory.Clothing_Piercing` | 5 |

`SubCategory` aparece só para maquiagem e piercings. Isso é útil para documentar organização visual/inventário, mas o script não mostra subcategorias para roupas comuns.

## Catálogo dos itens detectados

| # | Item | Slot | ControllerElementOverride | Preço | Texturas | Controllers/cenas | Notas |
|---|---|---|---|---|---|---|---|
| 0 | Camiseta | `UpperBody` | `UpperBody_Shirt` | 400 | 5 | blowjob, cowgirl, doggy, interaction, missionary | override |
| 1 | Calcinha | `Panties` | - | 300 | 4 | cowgirl, doggy, interaction, missionary | - |
| 2 | Sutiã plano | `Bra` | - | 400 | 5 | blowjob, cowgirl, doggy, interaction, missionary | - |
| 3 | Meia esquerda plana | `StockingL` | - | 270 | 4 | cowgirl, doggy, interaction, missionary | - |
| 4 | Meia direita plana | `StockingR` | - | 270 | 4 | cowgirl, doggy, interaction, missionary | - |
| 5 | Meia lingerie esquerda | `StockingL` | - | 400 | 4 | cowgirl, doggy, interaction, missionary | - |
| 6 | Meia lingerie direita | `StockingR` | - | 400 | 4 | cowgirl, doggy, interaction, missionary | - |
| 7 | Meia longa esquerda | `StockingL` | - | 600 | 4 | cowgirl, doggy, interaction, missionary | - |
| 8 | Meia longa direita | `StockingR` | - | 600 | 4 | cowgirl, doggy, interaction, missionary | - |
| 9 | Calcinha listrada | `Panties` | - | 1000 | 5 | cowgirl, doggy, interaction, missionary | - |
| 10 | Sutiã lingerie | `Bra` | - | 600 | 5 | blowjob, cowgirl, doggy, interaction, missionary | - |
| 11 | Saia plissada | `LowerBody` | `LowerBody_Skirt` | 700 | 4 | cowgirl, doggy, interaction, missionary | override |
| 12 | Minissaia | `LowerBody` | `LowerBody_Skirt` | 5000 | 5 | cowgirl, doggy, interaction, missionary | override |
| 13 | Laço fofo | `HairAccessoryL` | `HairAccessoryL_CuteBow` | 50 | 4 | blowjob, cowgirl, interaction, missionary | override |
| 14 | Faixa de cabeça | `HairAccessoryL` | `HairAccessoryL_Headband` | 600 | 5 | blowjob, cowgirl, doggy, interaction, missionary | override |
| 15 | Gargantilha de coração | `NeckAccessory` | - | 300 | 5 | blowjob, cowgirl, doggy, interaction, missionary | - |
| 16 | Óculos de coração | `Glasses` | - | 200 | 2 | blowjob, cowgirl, doggy, interaction, missionary | - |
| 17 | Piercing na língua | `TongueAccessory` | - | 690 | 3 | blowjob, cowgirl, doggy, interaction, missionary, shower | Clothing_Piercing |
| 18 | Grampos de cabelo brilhantes | `HairAccessoryL` | `HairAccessoryL_CuteBow` | 666 | 1 | blowjob, cowgirl, interaction, missionary | override |
| 19 | Conjunto de manicure | `Manicure` | - | 15000 | 8 | blowjob, doggy, interaction, missionary, shower | Clothing_MakeUp, required, colorível |
| 20 | Colar com fivela de couro | `NeckAccessory` | `NeckAccessory_BellChoker` | 3000 | 6 | blowjob, cowgirl, doggy, interaction, missionary | override |
| 21 | Sombra | `EyeMakeup` | - | 1200 | 2 | blowjob, cowgirl, doggy, interaction, missionary | Clothing_MakeUp, colorível |
| 22 | Perfuração no mamilo esquerdo | `NippleRight` | `NippleRight_Piercing` | 7500 | 4 | cowgirl, doggy, interaction, missionary | Clothing_Piercing, override, sem ColorSlots |
| 23 | Perfuração no mamilo direito | `NippleLeft` | `NippleLeft_Piercing` | 7500 | 4 | cowgirl, interaction, missionary, shower | Clothing_Piercing, override, sem ColorSlots |
| 24 | Piercing no umbigo | `Navel` | `Navel_Piercing` | 7000 | 3 | cowgirl, interaction, missionary | Clothing_Piercing, override, sem ColorSlots |
| 25 | Maquiagem gótica para olhos | `EyeMakeup` | - | 1200 | 2 | blowjob, cowgirl, doggy, interaction, missionary | Clothing_MakeUp, colorível |
| 26 | Delineador | `EyeMakeup` | - | 1400 | 2 | blowjob, cowgirl, doggy, interaction, missionary | Clothing_MakeUp, colorível |
| 27 | Adesivo de coração | `EyeMakeup` | - | 700 | 2 | blowjob, cowgirl, doggy, interaction, missionary | Clothing_MakeUp, colorível |
| 28 | Cílios naturais | `EyeMakeup` | - | 1400 | 2 | blowjob, cowgirl, doggy, interaction, missionary | Clothing_MakeUp, colorível |
| 29 | Pequeno chapéu de feiticeiro | `Head` | `Head_WizardHat` | 1000 | 5 | blowjob, cowgirl, doggy, interaction, missionary | override, sem ColorSlots |
| 30 | Grampo de abóbora | `HairAccessoryL` | `HairAccessoryL_CuteBow` | 600 | 1 | blowjob, cowgirl, interaction, missionary | override, sem ColorSlots |
| 31 | Piercing de anel no septo | `Septum` | - | 250 | 2 | blowjob, cowgirl, doggy, interaction, missionary | Clothing_Piercing |
| 32 | Tênis esquerdo plano | `ShoeL` | - | 500 | 1 | interaction | - |
| 33 | Tênis direito plano | `ShoeR` | - | 500 | 1 | interaction | - |
| 34 | Calças largas | `LowerBody` | `LowerBody_Pants` | 4000 | 4 | cowgirl, doggy, interaction, missionary | override, required |
| 35 | Moletom folgado | `UpperBodyOuter` | `UpperBodyOuter_Hoodie` | 5000 | 5 | blowjob, cowgirl, doggy, interaction, missionary | override, required |
| 36 | Vestido Vintage | `UpperBody` | `UpperBody_Dress2` | 20000 | 7 | blowjob, cowgirl, doggy, interaction, missionary | override, required, forbidden |
| 37 | Vestido slip | `UpperBody` | `UpperBody_Dress1` | 40000 | 5 | blowjob, cowgirl, doggy, interaction, missionary | override, forbidden |
| 38 | Camiseta de pesca | `UpperBody` | `UpperBody_Shirt` | 800 | 6 | blowjob, cowgirl, doggy, interaction, missionary, shower | override |
| 39 | Calcinha "Yaranaika" | `Panties` | - | 600 | 5 | blowjob, cowgirl, doggy, interaction, missionary, shower | - |
## Slots de equipamento encontrados

| Slot | Itens |
|---|---|
| `EyeMakeup` | 5 |
| `UpperBody` | 4 |
| `HairAccessoryL` | 4 |
| `Panties` | 3 |
| `StockingL` | 3 |
| `StockingR` | 3 |
| `LowerBody` | 3 |
| `Bra` | 2 |
| `NeckAccessory` | 2 |
| `Glasses` | 1 |
| `TongueAccessory` | 1 |
| `Manicure` | 1 |
| `NippleRight` | 1 |
| `NippleLeft` | 1 |
| `Navel` | 1 |
| `Head` | 1 |
| `Septum` | 1 |
| `ShoeL` | 1 |
| `ShoeR` | 1 |
| `UpperBodyOuter` | 1 |

Slots úteis para autocomplete/aliases:

```lua
---| '"UpperBody"'
---| '"Panties"'
---| '"Bra"'
---| '"StockingL"'
---| '"StockingR"'
---| '"LowerBody"'
---| '"HairAccessoryL"'
---| '"NeckAccessory"'
---| '"Glasses"'
---| '"TongueAccessory"'
---| '"Manicure"'
---| '"EyeMakeup"'
---| '"NippleRight"'
---| '"NippleLeft"'
---| '"Navel"'
---| '"Head"'
---| '"Septum"'
---| '"ShoeL"'
---| '"ShoeR"'
---| '"UpperBodyOuter"'
```
## `ControllerElementOverride`

Quando o item precisa substituir um elemento específico dentro do controller, o script usa `SlotEquipData.CreateInstance()` sem argumento, depois define `TargetSlotString` e `ControllerElementOverride` manualmente.

```lua
itemprefab.SlotData = (function()
  local sd = SlotEquipData.CreateInstance()
  sd.TargetSlotString = 'UpperBody'
  sd.ControllerElementOverride = {'UpperBody_Shirt'}
  return sd
end)()
```
Overrides encontrados:

| ControllerElementOverride | Uso |
|---|---|
| `HairAccessoryL_CuteBow` | 3 |
| `UpperBody_Shirt` | 2 |
| `LowerBody_Skirt` | 2 |
| `HairAccessoryL_Headband` | 1 |
| `NeckAccessory_BellChoker` | 1 |
| `NippleRight_Piercing` | 1 |
| `NippleLeft_Piercing` | 1 |
| `Navel_Piercing` | 1 |
| `Head_WizardHat` | 1 |
| `LowerBody_Pants` | 1 |
| `UpperBodyOuter_Hoodie` | 1 |
| `UpperBody_Dress2` | 1 |
| `UpperBody_Dress1` | 1 |

Esse dado é especialmente útil para stubs porque os nomes de override são strings mágicas. Eles merecem um alias separado, por exemplo:

```lua
---@alias MdrgControllerElementOverride
---| '"UpperBody_Shirt"'
---| '"LowerBody_Skirt"'
---| '"HairAccessoryL_CuteBow"'
---| '"HairAccessoryL_Headband"'
---| '"NeckAccessory_BellChoker"'
---| '"NippleRight_Piercing"'
---| '"NippleLeft_Piercing"'
---| '"Navel_Piercing"'
---| '"Head_WizardHat"'
---| '"LowerBody_Pants"'
---| '"UpperBodyOuter_Hoodie"'
---| '"UpperBody_Dress2"'
---| '"UpperBody_Dress1"'
```
## Regras de slots: required/forbidden

Algumas peças usam `SetRequiredSlotsString()` para exigir partes do corpo/equipamentos e `SetForbiddenSlotsString()` para impedir combinações incompatíveis.

### Required slots

| Slot requerido | Uso |
|---|---|
| `ArmL` | 3 |
| `ArmR` | 3 |
| `LegL` | 1 |
| `LegR` | 1 |

### Forbidden slots

| Slot proibido | Uso |
|---|---|
| `LowerBody` | 2 |
| `UpperBodyOuter` | 2 |

Exemplo do padrão:

```lua
itemprefab.SlotData = (function()
  local sd = SlotEquipData.CreateInstance()
  sd.TargetSlotString = 'UpperBody'
  sd.ControllerElementOverride = {'UpperBody_Dress2'}
  sd.SetRequiredSlotsString({'ArmL', 'ArmR'})
  sd.SetForbiddenSlotsString({'LowerBody', 'UpperBodyOuter'})
  return sd
end)()
```
Uso prático: vestidos e moletons podem exigir braços, enquanto vestidos podem bloquear `LowerBody` e `UpperBodyOuter` para evitar sobreposição visual.

## Texturas e controllers/cenas

O arquivo usa `GetPackedTexture(CurrentModGuid, path)` seguido de `AddTexture(texture)`. Os nomes dos arquivos indicam a cena/controller em que a textura se aplica.

| Controller/cena detectado no path | Referências |
|---|---|
| `interaction` | 45 |
| `missionary` | 42 |
| `cowgirl` | 41 |
| `doggy` | 37 |
| `blowjob` | 27 |
| `shower` | 5 |

Itens cobertos por controller/cena:

| Controller/cena | Itens com pelo menos uma textura |
|---|---|
| `blowjob` | 24 |
| `cowgirl` | 37 |
| `doggy` | 33 |
| `interaction` | 40 |
| `missionary` | 38 |
| `shower` | 5 |

Observação: alguns paths agrupam múltiplas cenas no próprio nome do arquivo, por exemplo `tex 1 - blowjob, cowgirl, interaction, missionary.json`. Isso sugere que um único atlas/packed texture pode ser usado em várias cenas, dependendo de como o exportador nomeou o asset.

Controllers/cenas úteis para alias:

```lua
---@alias MdrgSceneController
---| '"blowjob"'
---| '"cowgirl"'
---| '"doggy"'
---| '"interaction"'
---| '"missionary"'
---| '"shower"'
```
## Cores e palettes

Itens com `CanChangeColor = true`: 6. Itens com `CanChangeColor = false`: 34.

### Palettes usadas

| Palette | Uso |
|---|---|
| `partpalette` | 38 |
| `grayscalepalette` | 3 |

### Nomes de ColorSlot

| ColorSlot | Uso |
|---|---|
| `Cor principal` | 32 |
| `Cor do cinto` | 2 |
| `Cores das listras` | 1 |
| `Cor das unhas da mão direita` | 1 |
| `Cor das unhas da mão esquerda` | 1 |
| `Cor da fivela` | 1 |
| `Cor do barbante` | 1 |
| `Cor secundária` | 1 |
| `Cor básica` | 1 |

Itens coloríveis:

| Item | Slot | ColorSlots |
|---|---|---|
| Conjunto de manicure | Manicure | Cor das unhas da mão direita, Cor das unhas da mão esquerda |
| Sombra | EyeMakeup | Cor principal |
| Maquiagem gótica para olhos | EyeMakeup | Cor principal |
| Delineador | EyeMakeup | Cor principal |
| Adesivo de coração | EyeMakeup | Cor principal |
| Cílios naturais | EyeMakeup | Cor principal |

Itens sem `ColorSlots`:

`Perfuração no mamilo esquerdo`, `Perfuração no mamilo direito`, `Piercing no umbigo`, `Pequeno chapéu de feiticeiro`, `Grampo de abóbora`.

Padrão útil para comentários:

```lua
---@field CanChangeColor boolean
---Se true, o item expõe suas entradas de `ColorSlots` para customização de cor.
---Mesmo com `CanChangeColor = false`, alguns itens ainda declaram `ColorSlots`;
---nesse caso, a cor pode servir como metadado/padrão interno, não necessariamente UI editável.
```
## `SusModifiers`

O arquivo usa `SusModifiers` para associar a roupa a uma área do corpo e uma intensidade. Nem todos os acessórios têm modificadores.

| SusArea | Uso |
|---|---|
| `SusArea.LegL` | 6 |
| `SusArea.UpperBody` | 5 |
| `SusArea.LowerBody` | 5 |
| `SusArea.LegR` | 4 |
| `SusArea.Pussy` | 3 |
| `SusArea.Boobs` | 2 |
| `SusArea.ArmL` | 1 |
| `SusArea.ArmR` | 1 |

Pares área/intensidade mais comuns:

| SusArea | Valor | Uso |
|---|---|---|
| `SusArea.UpperBody` | `0.8` | 4 |
| `SusArea.Pussy` | `1` | 3 |
| `SusArea.LegL` | `0.5` | 3 |
| `SusArea.Boobs` | `1` | 2 |
| `SusArea.LowerBody` | `0.8` | 2 |
| `SusArea.LegL` | `0.8` | 2 |
| `SusArea.LegR` | `0.5` | 1 |
| `SusArea.LegL` | `1` | 1 |
| `SusArea.LegR` | `1` | 1 |
| `SusArea.LowerBody` | `0.7` | 1 |
| `SusArea.LowerBody` | `0.5` | 1 |
| `SusArea.LowerBody` | `0.9` | 1 |
| `SusArea.ArmL` | `0.8` | 1 |
| `SusArea.ArmR` | `0.8` | 1 |
| `SusArea.LegR` | `0.8` | 1 |
| `SusArea.UpperBody` | `0.5` | 1 |
| `SusArea.LegR` | `0.1` | 1 |

Exemplo:

```lua
itemprefab.SusModifiers = {
  SusModifier.CreateInstance(SusArea.UpperBody, 0.8)
}
```
## Observações de qualidade / possíveis problemas

| Item | Possível problema |
|---|---|
| Meia direita plana | Slot direito (`StockingR`), mas `SusModifier` aponta para `SusArea.LegL`. Provável troca para `SusArea.LegR`. |
| Perfuração no mamilo esquerdo | Nome diz esquerdo, mas `TargetSlotString` usa `NippleRight`. Verificar convenção esquerda/direita do jogo. |
| Perfuração no mamilo direito | Nome diz direito, mas `TargetSlotString` usa `NippleLeft`. Verificar convenção esquerda/direita do jogo. |
| Calcinha listrada | Tem mais de uma textura para o mesmo controller/cena: `cowgirl` x2. Pode ser intencional por camadas, mas vale verificar. |
| Minissaia | Tem mais de uma textura para o mesmo controller/cena: `doggy` x2. Pode ser intencional por camadas, mas vale verificar. |
| Conjunto de manicure | Tem mais de uma textura para o mesmo controller/cena: `interaction` x2, `blowjob` x2, `missionary` x2. Pode ser intencional por camadas, mas vale verificar. |
| Colar com fivela de couro | Tem mais de uma textura para o mesmo controller/cena: `missionary` x2, `interaction` x2, `blowjob` x2, `cowgirl` x2. Pode ser intencional por camadas, mas vale verificar. |
| Vestido Vintage | Tem mais de uma textura para o mesmo controller/cena: `doggy` x2, `interaction` x2. Pode ser intencional por camadas, mas vale verificar. |
| Camiseta de pesca | Tem mais de uma textura para o mesmo controller/cena: `doggy` x2, `missionary` x2, `interaction` x2, `blowjob` x2, `cowgirl` x2. Pode ser intencional por camadas, mas vale verificar. |
| Calcinha "Yaranaika" | Tem mais de uma textura para o mesmo controller/cena: `doggy` x2, `missionary` x2, `interaction` x2, `cowgirl` x2. Pode ser intencional por camadas, mas vale verificar. |

Também há itens esquerda/direita separados manualmente, mas o script não usa `ItemPrefab.MakePair` nem `ItemPrefab.MakeSet`. Se o jogo suportar pares/conjuntos para compra/equipamento agrupado, esses itens poderiam ser candidatos a pareamento posterior.

## Comentários LuaDoc sugeridos para stubs

### `SlotEquipData`

```lua
---@class SlotEquipData
---@field TargetSlotString string Nome textual do slot alvo onde o item será equipado.
---@field ControllerElementOverride string[] Lista de elementos específicos do controller que este item substitui/ativa.

---Cria dados de slot para um item equipável.
---Pode receber diretamente o nome do slot, ou ser chamado sem argumento para configuração manual.
---@param slotString? string Ex.: "UpperBody", "Panties", "HairAccessoryL".
---@return SlotEquipData
function SlotEquipData.CreateInstance(slotString) end

---Substitui a lista de slots obrigatórios para o item poder ser equipado.
---Usado para peças que dependem de partes corporais ou módulos presentes.
---@param requiredSlots string[] Ex.: {"ArmL", "ArmR"}.
function SlotEquipData.SetRequiredSlotsString(requiredSlots) end

---Substitui a lista de slots incompatíveis com este item.
---Usado para evitar sobreposição visual, como vestido bloqueando calça/casaco.
---@param forbiddenSlots string[] Ex.: {"LowerBody", "UpperBodyOuter"}.
function SlotEquipData.SetForbiddenSlotsString(forbiddenSlots) end
```
### `ItemPrefab` para roupas

```lua
---@class ItemPrefab
---@field SlotData SlotEquipData Define onde e como o item é equipado.
---@field SubCategory? ItemSubCategory Subcategoria visual/organizacional, usada aqui para maquiagem e piercings.
---@field CanChangeColor boolean Controla se a UI deve permitir mudar cores do item.
---@field ColorSlots ColorSlot[] Lista de cores configuráveis ou padrões de cor usados pelo item.
---@field SusModifiers SusModifier[] Áreas/intensidades associadas visualmente ao item.
---@field ScratchType ScratchTextureType Tipo de scratch/texture behavior usado pelo item.
```
### Aliases recomendados

```lua
---@alias MdrgClothingSlot
---| '"UpperBody"'
---| '"Panties"'
---| '"Bra"'
---| '"StockingL"'
---| '"StockingR"'
---| '"LowerBody"'
---| '"HairAccessoryL"'
---| '"NeckAccessory"'
---| '"Glasses"'
---| '"TongueAccessory"'
---| '"Manicure"'
---| '"EyeMakeup"'
---| '"NippleRight"'
---| '"NippleLeft"'
---| '"Navel"'
---| '"Head"'
---| '"Septum"'
---| '"ShoeL"'
---| '"ShoeR"'
---| '"UpperBodyOuter"'
```
```lua
---@alias MdrgClothingSubCategory
---| '"Clothing_Piercing"'
---| '"Clothing_MakeUp"'
```
```lua
---@alias MdrgKnownPalette
---| '"partpalette"'
---| '"grayscalepalette"'
```
## Exemplos úteis derivados deste arquivo

### Roupa simples sem override

```lua
local prefab = ModUtilities.CreateItemPrefab()
prefab.Name = 'Minha calcinha'
prefab.Description = 'Exemplo simples de roupa íntima.'
prefab.Price = 300
prefab.SlotData = SlotEquipData.CreateInstance('Panties')
prefab.Category = ItemCategory.Clothing
prefab.CanChangeColor = false
prefab.ColorSlots = {
  ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))
}
prefab.ScratchType = ScratchTextureType.Universal
prefab.SusModifiers = {SusModifier.CreateInstance(SusArea.Pussy, 1)}

local tex = ModUtilities.GetPackedTexture(CurrentModGuid, '/MinhaCalcinha/tex 1 - interaction.json')
prefab.AddTexture(tex)

local id = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, prefab)
ModUtilities.AddSingleBuyItemToShop('clothier', id)
```
### Roupa com override de elemento

```lua
local prefab = ModUtilities.CreateItemPrefab()
prefab.Name = 'Minha camiseta'
prefab.Description = 'Exemplo de UpperBody com override.'
prefab.Price = 400
prefab.SlotData = (function()
  local sd = SlotEquipData.CreateInstance()
  sd.TargetSlotString = 'UpperBody'
  sd.ControllerElementOverride = {'UpperBody_Shirt'}
  return sd
end)()
prefab.Category = ItemCategory.Clothing
```
### Vestido que bloqueia outras peças

```lua
local prefab = ModUtilities.CreateItemPrefab()
prefab.Name = 'Meu vestido'
prefab.Description = 'Exemplo com slots requeridos e proibidos.'
prefab.Price = 20000
prefab.SlotData = (function()
  local sd = SlotEquipData.CreateInstance()
  sd.TargetSlotString = 'UpperBody'
  sd.ControllerElementOverride = {'UpperBody_Dress2'}
  sd.SetRequiredSlotsString({'ArmL', 'ArmR'})
  sd.SetForbiddenSlotsString({'LowerBody', 'UpperBodyOuter'})
  return sd
end)()
prefab.Category = ItemCategory.Clothing
```
### Item cosmético colorível

```lua
local prefab = ModUtilities.CreateItemPrefab()
prefab.Name = 'Minha sombra'
prefab.Description = 'Exemplo de maquiagem colorível.'
prefab.Price = 1200
prefab.SlotData = SlotEquipData.CreateInstance('EyeMakeup')
prefab.Category = ItemCategory.Clothing
prefab.SubCategory = ItemSubCategory.Clothing_MakeUp
prefab.CanChangeColor = true
prefab.ColorSlots = {
  ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))
}
```
## Recomendações para melhorar documentação/addon LuaLS

1. Adicionar aliases para os slots de roupa vistos aqui, principalmente `Manicure`, `Glasses`, `TongueAccessory`, `Navel`, `Septum`, `EyeMakeup`, `NippleLeft` e `NippleRight`.

2. Documentar `ControllerElementOverride` como lista de strings de elementos visuais do controller, não como slot de inventário.

3. Documentar `SetRequiredSlotsString` e `SetForbiddenSlotsString` com exemplos reais de roupas que exigem braços/pernas ou bloqueiam sobreposição.

4. Adicionar exemplos de `ItemSubCategory.Clothing_MakeUp` e `ItemSubCategory.Clothing_Piercing`.

5. Adicionar `shower` aos controllers/cenas conhecidos, mesmo aparecendo menos que `interaction`, `missionary`, `doggy`, `cowgirl` e `blowjob`.

6. Verificar manualmente os itens marcados como possível esquerda/direita invertida antes de usar esse arquivo como fonte de verdade para nomes de slots.

7. Considerar exemplos separados de roupas comuns, maquiagem colorível, piercing, roupa com required slots, roupa com forbidden slots e acessórios de cabelo.

## Conclusão

`clothes.lua` é útil principalmente como referência prática para roupas e acessórios. Ele confirma o uso moderno de `SlotData`, mostra vários slots reais de equipamento, evidencia `ControllerElementOverride`, reforça o padrão de texturas por cena e traz exemplos concretos de `SetRequiredSlotsString`/`SetForbiddenSlotsString`. Ele não adiciona informações relevantes sobre diálogos, personalidade, coroutines, room overrides ou `OnUse`.

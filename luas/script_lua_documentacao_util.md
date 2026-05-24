# Documentação extraída de `script.lua`

Arquivo analisado: `script.lua`  
Objetivo: registrar informações úteis para documentação, stubs LuaLS, exemplos de modding e entendimento dos padrões atuais de criação de itens.

> Este documento complementa os relatórios anteriores sobre `mods_mixed.lua`. O foco aqui é o script único enviado depois, que parece ser um catálogo gerado automaticamente de itens.

---

## 1. Visão geral

O arquivo começa com comentários de geração automática:

```lua
--This script was generated automatically!
--Good luck with making the mod!
--May Sheep be with you!
```

Ele usa um bloco `do ... end`, o que ajuda a evitar vazamento de variáveis locais para o escopo global.

Resumo quantitativo:

| Métrica | Valor |
|---|---:|
| Linhas | `3312` |
| Itens criados | `81` |
| `ModUtilities.CreateItemPrefab()` | `81` |
| `ModUtilities.CreateNewItemAutoAssignId()` | `81` |
| `ModUtilities.AddSingleBuyItemToShop()` | `81` |
| `ModUtilities.GetPackedTexture()` | `368` |
| `ItemPrefab.AddTexture()` | `368` |
| `SlotEquipData.CreateInstance()` | `77` |
| `EdibleItemPrefabData.CreateInstance()` | `4` |
| `ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable()` | `12` |
| `ItemModifiableVariableFactory.CreateInstanceFloatVariable()` | `6` |
| `ItemScopeConditionSpecialVariable.CreateInstance()` | `12` |
| `AtLeastOneBoolVariableTrueRequirement.CreateInstance()` | `3` |
| `SimpleLocalizedString.CreateInstanceReplacement()` | `18` |

Conclusão rápida:

- É um script muito bom para entender o padrão moderno de **itens equipáveis**.
- É especialmente útil para documentar `SlotData`, `ControllerElementOverride`, `ElementActiveConditions`, `ItemModifiableVariables` e `EdibleData`.
- Não é tão útil para diálogos, personalidade complexa, coroutines, room override ou UI popup.

---

## 2. Padrão principal de item

O padrão central é:

```lua
local itemprefab0 = ModUtilities.CreateItemPrefab()
itemprefab0.Name = 'Nome do item'
itemprefab0.Description = 'Descrição do item'
itemprefab0.Price = 150
itemprefab0.IsIllegal = false
itemprefab0.HasQuality = false
itemprefab0.ThrowingOutForbidden = false
itemprefab0.IsStackable = true
itemprefab0.Category = ItemCategory.CookingIngredient
itemprefab0.CanChangeColor = false
itemprefab0.ColorSlots = {}
itemprefab0.Partners = {}
itemprefab0.ScratchType = ScratchTextureType.Universal
itemprefab0.SusModifiers = {}

local itemgameid0 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab0)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid0)
```

Esse padrão confirma o fluxo já visto nos relatórios anteriores:

1. Criar um `ItemPrefab`.
2. Configurar campos diretamente.
3. Registrar com `CreateNewItemAutoAssignId`.
4. Adicionar o `GameId` gerado em uma loja.

---

## 3. Categorias encontradas

Categorias usadas no script:

| Categoria | Ocorrências | Observação |
|---|---:|---|
| `ItemCategory.Modules` | `63` | Categoria dominante. Usada para módulos, partes corporais e modificações. |
| `ItemCategory.Clothing` | `14` | Roupas, acessórios, piercings, maquiagem. |
| `ItemCategory.Food` | `3` | Itens comestíveis. |
| `ItemCategory.CookingIngredient` | `1` | Ingrediente culinário. Importante por aparecer pouco nos relatórios anteriores. |

### Comentário sugerido para documentação

```lua
---@enum ItemCategory
---Categoria principal do item no inventário/lojas.
---
---Observações extraídas de scripts reais:
---- `Modules` aparece com frequência para módulos corporais, caudas, orelhas e alterações visuais.
---- `Clothing` cobre roupas, maquiagem, piercings e acessórios visuais.
---- `Food` e `CookingIngredient` são usados junto com `EdibleData`.
```

---

## 4. Subcategorias encontradas

Subcategorias usadas:

| Subcategoria | Ocorrências | Uso provável |
|---|---:|---|
| `ItemSubCategory.Clothing_Piercing` | `3` | Piercings. |
| `ItemSubCategory.Modules_CatEars` | `2` | Orelhas de gato/módulos similares. |
| `ItemSubCategory.Clothing_MakeUp` | `2` | Maquiagem. |

### Comentário sugerido

```lua
---@enum ItemSubCategory
---Subcategoria visual/organizacional usada para refinar onde o item aparece na UI.
---Scripts reais usam, por exemplo:
---- `Modules_CatEars` para orelhas/módulos de cabeça.
---- `Clothing_MakeUp` para maquiagem.
---- `Clothing_Piercing` para piercings.
```

---

## 5. Uso moderno de `SlotData`

Este é o achado mais importante do `script.lua`.

Nos relatórios anteriores apareciam muitos campos antigos/diretos:

```lua
itemprefab.PossibleEquipmentSlots = { 'HairMain' }
itemprefab.RequiredSlots = {}
```

Neste script, o padrão principal é:

```lua
itemprefab.SlotData = SlotEquipData.CreateInstance('ArmL')
```

Ou, para casos avançados:

```lua
itemprefab.SlotData = (function()
  local sd = SlotEquipData.CreateInstance()
  sd.TargetSlotString = 'HairMain'
  sd.ControllerElementOverride = {
    'Hair1_Top',
    'Hair1_Front',
    'Hair1_Side',
    'Hair1_Back',
    'Eyebrows_BasicEyebrows'
  }
  return sd
end)()
```

### Interpretação

`SlotData` parece ser o formato mais atual e mais expressivo para itens equipáveis.

Ele permite:

- definir o slot-alvo do item;
- sobrescrever elementos específicos do controller/modelo;
- adicionar condições de ativação de elementos;
- definir slots obrigatórios;
- definir slots proibidos;
- controlar melhor conflitos de equipamento.

### Comentário sugerido para `ItemPrefab.SlotData`

```lua
---@field SlotData SlotEquipData?
---Dados avançados de equipamento do item.
---Em scripts modernos, este campo é preferido para itens equipáveis em vez de usar apenas
---`PossibleEquipmentSlots` e `RequiredSlots`.
---
---Usos vistos em scripts reais:
---- Definir o slot-alvo via `SlotEquipData.CreateInstance('ArmL')`.
---- Definir `TargetSlotString` manualmente para slots como `HairMain`, `Head`, `UpperBody`.
---- Definir `ControllerElementOverride` para substituir elementos visuais específicos.
---- Definir `ElementActiveConditions` para ativar/desativar partes com variáveis modificáveis.
---- Usar `SetRequiredSlotsString` e `SetForbiddenSlotsString` para controlar compatibilidade.
```

---

## 6. Slots encontrados

Slots passados diretamente para `SlotEquipData.CreateInstance(...)`:

| Slot | Ocorrências |
|---|---:|
| `PersonalityModule` | `10` |
| `Tail` | `8` |
| `ArmL` | `5` |
| `ArmR` | `5` |
| `LegL` | `5` |
| `LegR` | `5` |
| `Skin` | `3` |
| `HairAugmentation` | `3` |
| `Ears` | `2` |
| `AssBodyModules` | `1` |
| `BoobsBodyModules` | `1` |
| `CalfBodyModules` | `1` |
| `EyeMakeup` | `1` |
| `Eyes` | `1` |
| `FeetBodyModules` | `1` |
| `Flesh` | `1` |
| `Hologram` | `1` |
| `Lips` | `1` |
| `Panties` | `1` |
| `Septum` | `1` |
| `ShoeL` | `1` |
| `ShoeR` | `1` |
| `ThighBodyModules` | `1` |

Slots usados via `sd.TargetSlotString`:

| TargetSlotString | Ocorrências |
|---|---:|
| `HairMain` | `3` |
| `Head` | `2` |
| `HairAccessoryL` | `2` |
| `HairAdditional` | `2` |
| `Teeth` | `2` |
| `UpperBody` | `2` |
| `LowerBody` | `1` |
| `NippleLeft` | `1` |
| `NippleRight` | `1` |
| `UpperBodyOuter` | `1` |

### Slots especialmente úteis para autocomplete

Estes slots deveriam entrar em um alias/tabela de documentação:

```lua
---@alias MdrgEquipmentSlot
---| 'PersonalityModule'
---| 'Tail'
---| 'ArmL'
---| 'ArmR'
---| 'LegL'
---| 'LegR'
---| 'Skin'
---| 'HairMain'
---| 'HairAugmentation'
---| 'HairAdditional'
---| 'Head'
---| 'Teeth'
---| 'Ears'
---| 'HairAccessoryL'
---| 'UpperBody'
---| 'UpperBodyOuter'
---| 'LowerBody'
---| 'Panties'
---| 'ShoeL'
---| 'ShoeR'
---| 'Eyes'
---| 'EyeMakeup'
---| 'Lips'
---| 'Septum'
---| 'NippleRight'
---| 'NippleLeft'
---| 'Flesh'
---| 'Hologram'
---| 'ThighBodyModules'
---| 'CalfBodyModules'
---| 'FeetBodyModules'
---| 'BoobsBodyModules'
---| 'AssBodyModules'
```

---

## 7. `ControllerElementOverride`

O script mostra várias ocorrências de:

```lua
sd.ControllerElementOverride = {
  'Head_CatEars'
}
```

ou:

```lua
sd.ControllerElementOverride = {
  'Hair1_Top',
  'Hair1_Front',
  'Hair1_Side',
  'Hair1_Back',
  'Eyebrows_BasicEyebrows'
}
```

### Interpretação

`ControllerElementOverride` indica quais elementos visuais do controller/modelo serão substituídos, afetados ou ativados pelo item.

Ele é muito importante para:

- cabelo com várias partes;
- orelhas;
- roupas que substituem elementos específicos;
- piercings;
- maquiagem;
- módulos corporais;
- itens com várias variações internas.

### Elementos vistos no script

Exemplos importantes:

```lua
Head_CatEars
Hair1_Top
Hair1_Front
Hair1_Side
Hair1_Back
Eyebrows_BasicEyebrows
UpperBodyOuter_Hoodie
UpperBody_Dress1
HairAccessoryL_CuteBow
HairAccessoryL_Headband
NippleRight_Piercing
NippleLeft_Piercing
LowerBody_Skirt
```

### Comentário sugerido

```lua
---@field ControllerElementOverride string[]?
---Lista de elementos do controller/modelo que este slot deve substituir ou controlar.
---Usado principalmente em itens visuais complexos, como cabelo, orelhas, roupas, maquiagem e piercings.
---
---Exemplos reais:
---- `{ 'Head_CatEars' }`
---- `{ 'Hair1_Top', 'Hair1_Front', 'Hair1_Side', 'Hair1_Back' }`
---- `{ 'UpperBodyOuter_Hoodie' }`
```

---

## 8. `ElementActiveConditions`

Um dos padrões mais úteis do script:

```lua
sd.ElementActiveConditions = {
  ItemScopeConditionSpecialVariable.CreateInstance('Ahoge'),
  ItemScopeConditionSpecialVariable.CreateInstance('Front'),
  ItemScopeConditionSpecialVariable.CreateInstance('Side'),
  ItemScopeConditionSpecialVariable.CreateInstance('Back')
}
```

### Interpretação

`ElementActiveConditions` permite ativar/desativar partes visuais de um item com base em variáveis do próprio item.

Combina diretamente com:

```lua
itemprefab.ItemModifiableVariables = {
  ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
    'Front',
    SimpleLocalizedString.CreateInstanceReplacement('Frente'),
    true
  )
}
```

Ou seja:

1. `ItemModifiableVariables` cria opções configuráveis do item.
2. `ItemScopeConditionSpecialVariable.CreateInstance('Front')` cria uma condição baseada nessa opção.
3. `ElementActiveConditions` usa essa condição para controlar quais elementos ficam ativos.

### Comentário sugerido

```lua
---@field ElementActiveConditions ItemScopeCondition[]?
---Condições que controlam se elementos visuais do slot ficam ativos.
---Normalmente usado junto com `ItemModifiableVariables`.
---
---Exemplo:
---Uma variável booleana chamada `Front` pode controlar se a parte frontal do cabelo aparece.
```

---

## 9. `ItemModifiableVariables`

O script usa dois tipos de variáveis modificáveis:

### 9.1 Boolean backed variable

```lua
ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
  'Front',
  SimpleLocalizedString.CreateInstanceReplacement('Frente'),
  true
)
```

Uso provável:

- checkbox/toggle na UI;
- ligar/desligar partes de um item;
- controlar condições visuais.

Nomes encontrados:

```lua
Ahoge
Front
Side
Back
Braid
```

### 9.2 Float variable

```lua
ItemModifiableVariableFactory.CreateInstanceFloatVariable(
  'boobSize',
  SimpleLocalizedString.CreateInstanceReplacement('Tamanho do peito'),
  0.5
)
```

Uso provável:

- slider numérico;
- módulos corporais;
- escala/tamanho de partes do corpo;
- parâmetros contínuos.

Nomes encontrados:

```lua
thighSize
calfSize
feetLength
feetWidth
boobSize
assSize
```

### Comentário sugerido para `ItemPrefab.ItemModifiableVariables`

```lua
---@field ItemModifiableVariables ItemModifiableVariable[]?
---Variáveis configuráveis associadas ao item.
---Scripts reais usam este campo para criar toggles e sliders que alteram partes visuais.
---
---Padrões vistos:
---- `CreateInstanceBoolBackedVariable` para opções liga/desliga.
---- `CreateInstanceFloatVariable` para valores numéricos, como tamanho de partes corporais.
---
---Essas variáveis podem ser usadas por `ItemScopeConditionSpecialVariable` dentro de `ElementActiveConditions`.
```

### Comentário sugerido para factory

```lua
---@class ItemModifiableVariableFactory
---Factory para criar variáveis configuráveis de item.

---@param key string Identificador interno da variável. Deve bater com condições que usam esta variável.
---@param displayName SimpleLocalizedString Nome exibido na UI.
---@param defaultValue boolean Valor inicial.
---@return ItemModifiableVariable
function ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(key, displayName, defaultValue) end

---@param key string Identificador interno da variável.
---@param displayName SimpleLocalizedString Nome exibido na UI.
---@param defaultValue number Valor inicial.
---@return ItemModifiableVariable
function ItemModifiableVariableFactory.CreateInstanceFloatVariable(key, displayName, defaultValue) end
```

---

## 10. `ItemModifiableVariablesRequirements`

O script mostra:

```lua
itemprefab.ItemModifiableVariablesRequirements = {
  AtLeastOneBoolVariableTrueRequirement.CreateInstance({0, 1, 2, 3})
}
```

### Interpretação

Esse padrão sugere uma regra de validação para as variáveis modificáveis.

O caso visto parece significar:

> Pelo menos uma das variáveis booleanas indicadas por índice precisa continuar ativa.

Exemplo prático:

- cabelo com partes `Ahoge`, `Front`, `Side`, `Back`;
- o jogador pode desligar algumas partes;
- mas não pode desligar todas ao mesmo tempo.

### Comentário sugerido

```lua
---@field ItemModifiableVariablesRequirements ItemModifiableVariableRequirement[]?
---Regras de validação aplicadas às variáveis modificáveis do item.
---
---Uso real observado:
---`AtLeastOneBoolVariableTrueRequirement.CreateInstance({0, 1, 2, 3})`
---para exigir que pelo menos uma opção booleana continue ativa.
```

---

## 11. `SimpleLocalizedString.CreateInstanceReplacement`

O script usa:

```lua
SimpleLocalizedString.CreateInstanceReplacement('Frente')
```

Uso observado:

- criar nomes exibidos na UI para variáveis modificáveis;
- labels de toggles/sliders;
- texto simples sem depender de tabela de tradução externa.

### Comentário sugerido

```lua
---@class SimpleLocalizedString
---Representa um texto simples/localizável usado pela UI.

---@param text string Texto a ser exibido diretamente.
---@return SimpleLocalizedString
---Cria uma string localizada simples usando o texto informado como substituição direta.
function SimpleLocalizedString.CreateInstanceReplacement(text) end
```

---

## 12. `EdibleData`

O script traz um padrão limpo de alimento/ingrediente:

```lua
itemprefab.EdibleData = (function()
  local ntf = function(item, nutritionProfile)
    -- Here you can set the nutritional values of the dish.
    -- This data is dynamic and cannot be exported to lua!
    nutritionProfile.Satiation.Value = 0.1
  end

  local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
  return ed
end)()
```

### Tipos de `EdibleTypeEnum` encontrados

| Tipo | Ocorrências |
|---|---:|
| `EdibleTypeEnum.Other` | `2` |
| `EdibleTypeEnum.Beverage` | `1` |
| `EdibleTypeEnum.MainVegetable` | `1` |

### Campo de nutrição visto

```lua
nutritionProfile.Satiation.Value
```

### Interpretação

`EdibleData` não é a mesma coisa que `OnUse`.

- `OnUse` é callback de uso genérico.
- `EdibleData` parece entrar no sistema próprio de comida/nutrição.
- O callback recebe `item` e `nutritionProfile`.
- O script comenta que os valores nutricionais são dinâmicos e não podem ser exportados automaticamente para Lua.

### Comentário sugerido para `ItemPrefab.EdibleData`

```lua
---@field EdibleData EdibleItemPrefabData?
---Dados de item comestível.
---Usado em itens das categorias `Food` e `CookingIngredient`.
---O callback de nutrição recebe `(item, nutritionProfile)` e pode ajustar valores como
---`nutritionProfile.Satiation.Value`.
```

### Comentário sugerido para `EdibleItemPrefabData.CreateInstance`

```lua
---@class EdibleItemPrefabData
---Dados adicionais para itens comestíveis.

---@param edibleType EdibleTypeEnum Tipo de alimento/bebida/ingrediente.
---@param nutritionCallback fun(item: Item, nutritionProfile: NutritionProfile)
---@return EdibleItemPrefabData
---Cria os dados de alimento e associa um callback dinâmico de nutrição.
function EdibleItemPrefabData.CreateInstance(edibleType, nutritionCallback) end
```

---

## 13. Paletas encontradas

Paletas usadas via `ColorPaletteManager.GetColorPaletteByName(...)`:

| Paleta | Ocorrências | Observação |
|---|---:|---|
| `partpalette` | `74` | Paleta dominante para partes/roupas. |
| `grayscalepalette` | `3` | Tons de cinza. |
| `skinTonePalette` | `1` | Paleta de tom de pele; importante adicionar à documentação. |

### Alias sugerido

```lua
---@alias MdrgColorPaletteName
---| 'partpalette'
---| 'grayscalepalette'
---| 'skinpalette'
---| 'skinTonePalette'
```

### Comentário sugerido

```lua
---@param name MdrgColorPaletteName|string Nome da paleta.
---@return ColorPalette
---Busca uma paleta de cores pelo nome.
---Nomes vistos em scripts reais incluem `partpalette`, `grayscalepalette`, `skinpalette` e `skinTonePalette`.
function ColorPaletteManager.GetColorPaletteByName(name) end
```

---

## 14. Controllers/cenas encontrados

O script usa texturas para várias cenas/controladores.

Tokens encontrados no arquivo:

| Controller/cena | Ocorrências aproximadas do token |
|---|---:|
| `missionary` | `252` |
| `interaction` | `246` |
| `cowgirl` | `243` |
| `doggy` | `234` |
| `blowjob` | `198` |
| `shower` | `111` |

### Observação importante

`shower` aparece como cena/controller relevante e deve ser adicionado à lista de controllers conhecidos. Ele não estava tão destacado no relatório do arquivo grande.

### Alias sugerido

```lua
---@alias MdrgControllerName
---| 'interaction'
---| 'missionary'
---| 'doggy'
---| 'cowgirl'
---| 'blowjob'
---| 'shower'
```

### Comentário sugerido para `ModUtilities.GetController`

```lua
---@param name MdrgControllerName|string Nome do controller/cena.
---@return Live2DController
---Retorna um controller usado para registrar texturas específicas de uma cena.
---Nomes vistos em scripts reais incluem `interaction`, `missionary`, `doggy`, `cowgirl`, `blowjob` e `shower`.
function ModUtilities.GetController(name) end
```

---

## 15. Padrão de textura

O padrão de textura continua igual ao visto nos relatórios anteriores:

```lua
local texture = ModUtilities.GetPackedTexture(CurrentModGuid, '/path/to/texture.json')
itemprefab.AddTexture(texture)
```

ou com controller explícito:

```lua
local texture = ModUtilities.GetPackedTexture(CurrentModGuid, '/path/to/texture.json')
itemprefab.AddTexture(ModUtilities.GetController('shower'), texture)
```

### Comentário sugerido para `GetPackedTexture`

```lua
---@param modGuid string Guid do mod atual. Normalmente `CurrentModGuid`.
---@param path string Caminho do asset empacotado dentro do mod.
---@return PackedTexture
---Carrega uma textura empacotada do mod.
---Em scripts reais, normalmente aponta para arquivos `.json` gerados/exportados para Live2D ou sprites do item.
function ModUtilities.GetPackedTexture(modGuid, path) end
```

### Comentário sugerido para `ItemPrefab.AddTexture`

```lua
---@overload fun(self: ItemPrefab, texture: PackedTexture)
---@overload fun(self: ItemPrefab, controller: Live2DController, texture: PackedTexture)
---Adiciona uma textura ao item.
---Pode ser chamada apenas com a textura ou com um controller/cena específico.
---Scripts reais usam este método para registrar variações por cena, como `interaction`, `missionary`, `doggy`, `cowgirl`, `blowjob` e `shower`.
function ItemPrefab.AddTexture(...) end
```

---

## 16. Slots obrigatórios e proibidos

O script mostra uso de:

```lua
sd.SetRequiredSlotsString({ 'ArmL', 'ArmR' })
```

E:

```lua
sd.SetForbiddenSlotsString({ 'LowerBody', 'UpperBodyOuter' })
```

### Interpretação

`SetRequiredSlotsString` define slots que precisam existir/estar equipados para este item funcionar.

`SetForbiddenSlotsString` define slots incompatíveis com o item.

Exemplos práticos:

- Uma roupa de torso pode exigir braços (`ArmL`, `ArmR`).
- Um vestido pode bloquear `LowerBody` e `UpperBodyOuter`.
- Um item de corpo pode impedir outro módulo no mesmo grupo.

### Comentários sugeridos

```lua
---@param slots MdrgEquipmentSlot[]|string[] Slots obrigatórios.
---Define quais slots devem estar presentes/equipados para este item ser válido.
function SlotEquipData.SetRequiredSlotsString(slots) end

---@param slots MdrgEquipmentSlot[]|string[] Slots incompatíveis/proibidos.
---Define quais slots este item bloqueia ou com quais ele não pode coexistir.
function SlotEquipData.SetForbiddenSlotsString(slots) end
```

---

## 17. O que o script confirma dos relatórios anteriores

Este `script.lua` confirma os seguintes pontos já vistos no `mods_mixed.lua`:

- `CreateItemPrefab` é a base de criação de itens.
- Campos de `ItemPrefab` são configurados diretamente.
- `CreateNewItemAutoAssignId(CurrentModGuid, itemprefab)` registra o item.
- `AddSingleBuyItemToShop(shop, gameId)` adiciona o item à loja.
- `GetPackedTexture` + `AddTexture` é o padrão principal de textura.
- `ColorSlots` usa `ColorSlot.CreateInstance(...)` com `ColorPaletteManager.GetColorPaletteByName(...)`.
- `ScratchType` normalmente usa `ScratchTextureType.Universal`.
- `SusModifiers` pode ficar vazio.
- `Partners` frequentemente é `{}`.

---

## 18. O que o script adiciona de novo

Em relação aos relatórios anteriores, este arquivo adiciona ou reforça melhor:

1. Uso moderno de `SlotData`.
2. Uso prático de `ControllerElementOverride`.
3. Uso prático de `ElementActiveConditions`.
4. Uso real de `ItemModifiableVariables`.
5. Uso real de `ItemModifiableVariablesRequirements`.
6. Uso de `AtLeastOneBoolVariableTrueRequirement`.
7. Uso de `SimpleLocalizedString.CreateInstanceReplacement`.
8. Uso de `EdibleData` com callback de nutrição.
9. Categoria `ItemCategory.CookingIngredient`.
10. Subcategorias `Modules_CatEars`, `Clothing_MakeUp`, `Clothing_Piercing`.
11. Paleta `skinTonePalette`.
12. Controller/cena `shower`.
13. Slots corporais modernos como `BoobsBodyModules`, `AssBodyModules`, `ThighBodyModules`, `CalfBodyModules`, `FeetBodyModules`.

---

## 19. Coisas que o script não cobre bem

O arquivo não é uma boa fonte para documentar:

```lua
PersonalityModuleDefinition
PrepareContainer
StoryBotDialogueBranch
TextureOverriderManager.RoomManager
UiOverlay
Coroutine
WaitForSeconds
OnUse
Room sprite override
MakePair
MakeSet
AddGenericItemToShop
```

Para esses tópicos, os relatórios anteriores baseados em `mods_mixed.lua` continuam sendo melhores.

---

## 20. Recomendações para atualizar os stubs LuaLS

### 20.1 Adicionar aliases conhecidos

Adicionar aliases ajuda muito no autocomplete sem travar a API em valores fechados demais.

```lua
---@alias MdrgEquipmentSlot
---| 'PersonalityModule'
---| 'Tail'
---| 'ArmL'
---| 'ArmR'
---| 'LegL'
---| 'LegR'
---| 'Skin'
---| 'HairMain'
---| 'HairAugmentation'
---| 'HairAdditional'
---| 'Head'
---| 'Teeth'
---| 'Ears'
---| 'HairAccessoryL'
---| 'UpperBody'
---| 'UpperBodyOuter'
---| 'LowerBody'
---| 'Panties'
---| 'ShoeL'
---| 'ShoeR'
---| 'Eyes'
---| 'EyeMakeup'
---| 'Lips'
---| 'Septum'
---| 'NippleRight'
---| 'NippleLeft'
---| 'Flesh'
---| 'Hologram'
---| 'ThighBodyModules'
---| 'CalfBodyModules'
---| 'FeetBodyModules'
---| 'BoobsBodyModules'
---| 'AssBodyModules'

---@alias MdrgControllerName
---| 'interaction'
---| 'missionary'
---| 'doggy'
---| 'cowgirl'
---| 'blowjob'
---| 'shower'

---@alias MdrgColorPaletteName
---| 'partpalette'
---| 'grayscalepalette'
---| 'skinpalette'
---| 'skinTonePalette'
```

### 20.2 Melhorar documentação de `SlotEquipData`

Prioridade alta:

```lua
---@class SlotEquipData
---@field TargetSlotString MdrgEquipmentSlot|string Slot principal alvo.
---@field ControllerElementOverride string[]? Elementos visuais controlados/substituídos.
---@field ElementActiveConditions ItemScopeCondition[]? Condições para ativar elementos.
---@field TextureActiveConditions ItemScopeCondition[]? Condições para ativar texturas, caso suportado.
```

### 20.3 Melhorar documentação de variáveis modificáveis

Prioridade alta:

```lua
---@class ItemModifiableVariableFactory
---@class ItemScopeConditionSpecialVariable
---@class AtLeastOneBoolVariableTrueRequirement
---@class SimpleLocalizedString
```

Essas classes/factories devem receber comentários de uso, porque o padrão é difícil de deduzir só pela assinatura.

### 20.4 Melhorar documentação de `EdibleData`

Prioridade média/alta:

```lua
---@class EdibleItemPrefabData
---@class NutritionProfile
```

O callback `(item, nutritionProfile)` deveria ser documentado explicitamente.

---

## 21. Exemplos úteis derivados do script

### 21.1 Item simples comestível

```lua
local itemprefab = ModUtilities.CreateItemPrefab()
itemprefab.Name = 'Massa de Taco'
itemprefab.Description = 'Ingrediente culinário simples.'
itemprefab.Price = 150
itemprefab.IsStackable = true
itemprefab.Category = ItemCategory.CookingIngredient
itemprefab.CanChangeColor = false
itemprefab.ColorSlots = {}
itemprefab.Partners = {}
itemprefab.ScratchType = ScratchTextureType.Universal
itemprefab.SusModifiers = {}

itemprefab.EdibleData = (function()
  local nutritionCallback = function(item, nutritionProfile)
    nutritionProfile.Satiation.Value = 0.1
  end

  return EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, nutritionCallback)
end)()

local gameId = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab)
ModUtilities.AddSingleBuyItemToShop('clothier', gameId)
```

### 21.2 Item equipável simples com `SlotData`

```lua
local itemprefab = ModUtilities.CreateItemPrefab()
itemprefab.Name = 'Cauda Simples'
itemprefab.Description = 'Exemplo de item equipável em slot de cauda.'
itemprefab.Price = 500
itemprefab.Category = ItemCategory.Modules
itemprefab.IsStackable = false
itemprefab.CanChangeColor = true
itemprefab.ColorSlots = {
  ColorSlot.CreateInstance('Main Color', ColorPaletteManager.GetColorPaletteByName('partpalette'))
}
itemprefab.ScratchType = ScratchTextureType.Universal
itemprefab.SusModifiers = {}

itemprefab.SlotData = SlotEquipData.CreateInstance('Tail')

local texture = ModUtilities.GetPackedTexture(CurrentModGuid, '/assets/tail/interaction.json')
itemprefab.AddTexture(ModUtilities.GetController('interaction'), texture)

local gameId = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab)
ModUtilities.AddSingleBuyItemToShop('clothier', gameId)
```

### 21.3 Cabelo com partes opcionais

```lua
local itemprefab = ModUtilities.CreateItemPrefab()
itemprefab.Name = 'Cabelo Modular'
itemprefab.Description = 'Cabelo com partes ativáveis/desativáveis.'
itemprefab.Price = 1000
itemprefab.Category = ItemCategory.Modules
itemprefab.IsStackable = false
itemprefab.CanChangeColor = true
itemprefab.ColorSlots = {
  ColorSlot.CreateInstance('Main Color', ColorPaletteManager.GetColorPaletteByName('partpalette'))
}
itemprefab.ScratchType = ScratchTextureType.Universal
itemprefab.SusModifiers = {}

itemprefab.ItemModifiableVariables = {
  ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
    'Front',
    SimpleLocalizedString.CreateInstanceReplacement('Frente'),
    true
  ),
  ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
    'Side',
    SimpleLocalizedString.CreateInstanceReplacement('Lado'),
    true
  ),
  ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
    'Back',
    SimpleLocalizedString.CreateInstanceReplacement('Trás'),
    true
  )
}

itemprefab.ItemModifiableVariablesRequirements = {
  AtLeastOneBoolVariableTrueRequirement.CreateInstance({0, 1, 2})
}

itemprefab.SlotData = (function()
  local sd = SlotEquipData.CreateInstance()
  sd.TargetSlotString = 'HairMain'
  sd.ControllerElementOverride = {
    'Hair1_Front',
    'Hair1_Side',
    'Hair1_Back'
  }
  sd.ElementActiveConditions = {
    ItemScopeConditionSpecialVariable.CreateInstance('Front'),
    ItemScopeConditionSpecialVariable.CreateInstance('Side'),
    ItemScopeConditionSpecialVariable.CreateInstance('Back')
  }
  return sd
end)()

local gameId = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab)
ModUtilities.AddSingleBuyItemToShop('clothier', gameId)
```

### 21.4 Módulo corporal com slider

```lua
local itemprefab = ModUtilities.CreateItemPrefab()
itemprefab.Name = 'Módulo de Corpo'
itemprefab.Description = 'Exemplo de módulo com variável numérica.'
itemprefab.Price = 2000
itemprefab.Category = ItemCategory.Modules
itemprefab.IsStackable = false
itemprefab.CanChangeColor = false
itemprefab.ColorSlots = {}
itemprefab.ScratchType = ScratchTextureType.Universal
itemprefab.SusModifiers = {}

itemprefab.SlotData = SlotEquipData.CreateInstance('BoobsBodyModules')

itemprefab.ItemModifiableVariables = {
  ItemModifiableVariableFactory.CreateInstanceFloatVariable(
    'boobSize',
    SimpleLocalizedString.CreateInstanceReplacement('Tamanho do peito'),
    0.5
  )
}

local gameId = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab)
ModUtilities.AddSingleBuyItemToShop('clothier', gameId)
```

---

## 22. Checklist prático para documentação

Use este script como evidência para documentar:

- [x] `ItemPrefab.SlotData`
- [x] `SlotEquipData.CreateInstance`
- [x] `SlotEquipData.TargetSlotString`
- [x] `SlotEquipData.ControllerElementOverride`
- [x] `SlotEquipData.ElementActiveConditions`
- [x] `SlotEquipData.SetRequiredSlotsString`
- [x] `SlotEquipData.SetForbiddenSlotsString`
- [x] `ItemPrefab.ItemModifiableVariables`
- [x] `ItemPrefab.ItemModifiableVariablesRequirements`
- [x] `ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable`
- [x] `ItemModifiableVariableFactory.CreateInstanceFloatVariable`
- [x] `ItemScopeConditionSpecialVariable.CreateInstance`
- [x] `AtLeastOneBoolVariableTrueRequirement.CreateInstance`
- [x] `SimpleLocalizedString.CreateInstanceReplacement`
- [x] `ItemPrefab.EdibleData`
- [x] `EdibleItemPrefabData.CreateInstance`
- [x] `EdibleTypeEnum.Other`
- [x] `EdibleTypeEnum.Beverage`
- [x] `EdibleTypeEnum.MainVegetable`
- [x] `ItemCategory.CookingIngredient`
- [x] `ItemSubCategory.Modules_CatEars`
- [x] `ItemSubCategory.Clothing_MakeUp`
- [x] `ItemSubCategory.Clothing_Piercing`
- [x] controller/cena `shower`
- [x] palette `skinTonePalette`

---

## 23. Conclusão

Este `script.lua` é mais valioso para documentar o lado moderno de **itens equipáveis customizáveis**.

A maior diferença para os relatórios anteriores é que aqui aparecem com clareza:

- `SlotData` como estrutura central de equipamento;
- `ControllerElementOverride` como ponte entre item e elementos visuais;
- `ElementActiveConditions` como controle de partes visuais;
- `ItemModifiableVariables` como sistema de toggles/sliders;
- `ItemModifiableVariablesRequirements` como validação dessas opções;
- `EdibleData` como sistema próprio para comida/nutrição.

Para o addon LuaLS, o melhor uso deste arquivo é enriquecer comentários, aliases e exemplos dos stubs, principalmente em `mdrg_items.d.lua`, `mdrg_types.d.lua` e `mdrg_enums.d.lua`.

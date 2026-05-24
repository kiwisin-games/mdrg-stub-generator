# Documentação de `foods.lua`

> Análise focada em itens de comida, ingredientes de cozinha, `EdibleData`, `EdibleTypeEnum`, callback nutricional e pontos úteis para stubs LuaLS.

## Resumo

Este arquivo é um catálogo gerado automaticamente de comidas e ingredientes. Ele não possui texturas, roupas, slots de equipamento, módulos de personalidade, `OnUse`, coroutine, UI popup, pesca ou override de quarto.

O valor principal dele está em mostrar o padrão limpo de **item comestível** usando:

```lua
itemprefab.EdibleData = (function()
  local ntf = function(item, nutritionProfile)
    nutritionProfile.Satiation.Value = 0.1
  end

  local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
  return ed
end)()
```

Esse padrão confirma que o efeito de comida/ingrediente não precisa passar por `OnUse`; ele é definido por `EdibleData` e pelo callback que preenche um `EdibleItemNutritionProfile`.

| Métrica | Valor |
|---|---:|
| Linhas | 959 |
| Tamanho aproximado | 35.4 KB |
| Itens detectados | 34 |
| `CreateItemPrefab` | 34 |
| `CreateNewItemAutoAssignId` | 34 |
| `AddSingleBuyItemToShop` | 34 |
| `EdibleItemPrefabData.CreateInstance` | 34 |
| Callbacks locais `ntf` | 34 |
| `nutritionProfile.Satiation.Value` | 34 |

## Padrão principal encontrado

O ciclo se repete para todos os itens:

```lua
local itemprefab = ModUtilities.CreateItemPrefab()

itemprefab.Name = "Nome"
itemprefab.Description = "Descrição"
itemprefab.Price = 100
itemprefab.IsIllegal = false
itemprefab.HasQuality = false
itemprefab.ThrowingOutForbidden = false
itemprefab.IsStackable = true
itemprefab.Category = ItemCategory.Food
itemprefab.CanChangeColor = false
itemprefab.ColorSlots = {}
itemprefab.Partners = {}
itemprefab.ScratchType = ScratchTextureType.Universal
itemprefab.SusModifiers = {}

itemprefab.EdibleData = (function()
  local ntf = function(item, nutritionProfile)
    nutritionProfile.Satiation.Value = 0.1
  end

  local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
  return ed
end)()

local itemgameid = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab)
ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid)
```

Fluxo essencial:

1. cria `ItemPrefab`;
2. configura campos básicos;
3. define `EdibleData`;
4. registra com `CreateNewItemAutoAssignId`;
5. adiciona à loja.

## APIs e chamadas encontradas

| API/chamada | Usos | Observação |
|---|---:|---|
| `ModUtilities.CreateItemPrefab` | 34 | Cria o `ItemPrefab` base de cada comida/ingrediente. |
| `EdibleItemPrefabData.CreateInstance` | 34 | Cria os dados comestíveis e recebe callback para preencher o perfil nutricional. |
| `ModUtilities.CreateNewItemAutoAssignId` | 34 | Registra o prefab no mod e retorna o `GameId` do item. |
| `ModUtilities.AddSingleBuyItemToShop` | 34 | Adiciona o item registrado a uma loja por string. |

Não há chamadas para:

```lua
ModUtilities.GetPackedTexture
ItemPrefab.AddTexture
ColorSlot.CreateInstance
SlotEquipData.CreateInstance
SusModifier.CreateInstance
ModUtilities.PrepareNewPersonalityDefinition
StoryBotDialogueBranch.__new
TextureOverriderManager.RoomManager.SetSprite
UiOverlay.OkPopup
ModUtilities.StartCoroutine
ItemPrefab.MakePair
ItemPrefab.MakeSet
```

## Campos de `ItemPrefab` usados

| Campo | Atribuições |
|---|---:|
| `Name` | 34 |
| `Description` | 34 |
| `Price` | 34 |
| `IsIllegal` | 34 |
| `HasQuality` | 34 |
| `ThrowingOutForbidden` | 34 |
| `IsStackable` | 34 |
| `Category` | 34 |
| `CanChangeColor` | 34 |
| `ColorSlots` | 34 |
| `Partners` | 34 |
| `ScratchType` | 34 |
| `SusModifiers` | 34 |
| `EdibleData` | 34 |

Todos os itens usam a mesma estrutura de campos. Os campos constantes são:

| Campo | Valor usado em todos os itens |
|---|---|
| `IsIllegal` | `false` |
| `HasQuality` | `false` |
| `ThrowingOutForbidden` | `false` |
| `IsStackable` | `true` |
| `CanChangeColor` | `false` |
| `ColorSlots` | `{}` |
| `Partners` | `{}` |
| `ScratchType` | `ScratchTextureType.Universal` |
| `SusModifiers` | `{}` |

## Categorias encontradas

| Categoria | Itens |
|---|---:|
| `ItemCategory.CookingIngredient` | 21 |
| `ItemCategory.Food` | 13 |

Interpretação prática:

- `ItemCategory.Food`: comida pronta ou consumível direto.
- `ItemCategory.CookingIngredient`: ingrediente usado para cozinhar, mas ainda com `EdibleData`, então também pode ser consumível.
- Ambos são registrados na loja `clothier` neste script. Isso pode ser intencional para teste, mas para organização de jogo normalmente faria mais sentido usar uma loja como `grocery` se ela existir no projeto.

## Tipos de comida `EdibleTypeEnum`

| EdibleTypeEnum | Itens |
|---|---:|
| `EdibleTypeEnum.Other` | 15 |
| `EdibleTypeEnum.MainVegetable` | 5 |
| `EdibleTypeEnum.Meat` | 4 |
| `EdibleTypeEnum.Beverage` | 3 |
| `EdibleTypeEnum.FlavourVegetable` | 3 |
| `EdibleTypeEnum.Pasta` | 2 |
| `EdibleTypeEnum.Bread` | 1 |
| `EdibleTypeEnum.Bean` | 1 |

### Itens por tipo comestível

| Tipo | Itens | Exemplos/itens |
|---|---:|---|
| `EdibleTypeEnum.Other` | 15 | Barra de cereais, Salgadinhos, Doces, Nuggets de Frango, Massa de Taco, Arroz, Farinha, Ovo, Leite, Molho de Soja, Vinagre, Açúcar, Manteiga, Queijo, Iogurte |
| `EdibleTypeEnum.MainVegetable` | 5 | Cebolas em conserva, Vegetais Genéticamente Modificados, Batatas, Tomate, Cenoura |
| `EdibleTypeEnum.Meat` | 4 | Linguiça, Bife Cru, Carne de Frango Crua, Carne Moída Crua |
| `EdibleTypeEnum.Beverage` | 3 | Energético, Refrigerante, Soyrent |
| `EdibleTypeEnum.FlavourVegetable` | 3 | Cebola, Alho, Gengibre |
| `EdibleTypeEnum.Pasta` | 2 | Macarrão instantâneo, Macarrão |
| `EdibleTypeEnum.Bean` | 1 | Lata de feijão cozido |
| `EdibleTypeEnum.Bread` | 1 | Pão do dispensador |

Tipos úteis confirmados para documentação/autocomplete:

```lua
---| '"Other"'
---| '"Beverage"'
---| '"Bread"'
---| '"Bean"'
---| '"MainVegetable"'
---| '"Meat"'
---| '"Pasta"'
---| '"FlavourVegetable"'
```

O enum dos stubs também expõe `Fish` e `Dish`, mas este arquivo não usa esses dois.

## Perfil nutricional

O único campo nutricional alterado neste arquivo é:

```lua
nutritionProfile.Satiation.Value = 0.1
```

Isso aparece em todos os 34 itens.

Pelo stub `EdibleItemNutritionProfile`, existem outros campos documentáveis que poderiam ser usados em comidas futuras:

```lua
nutritionProfile.IsSafeToEat
nutritionProfile.EatSound
nutritionProfile.Satiation
nutritionProfile.RawHealthChange
nutritionProfile.StaminaChange
nutritionProfile.MentalHealthChange
nutritionProfile.MaxSafeCumChange
nutritionProfile.MaxUnsafeCumChange
nutritionProfile.CurrentCumChange
nutritionProfile.CurrentCumChangePercentMaxCum
```

Exemplo de documentação recomendada:

```lua
---@class EdibleItemNutritionProfile
---@field Satiation GameStatFixedValue Valor de saciedade aplicado ao consumir.
---@field RawHealthChange GameStatFixedValue Alteração direta de vida.
---@field StaminaChange GameStatFixedValue Alteração de stamina.
---@field MentalHealthChange GameStatFixedValue Alteração de saúde mental.
```

Exemplo mais expressivo de comida com efeitos múltiplos:

```lua
itemprefab.EdibleData = (function()
  ---@param item Item
  ---@param nutritionProfile EdibleItemNutritionProfile
  local fillNutrition = function(item, nutritionProfile)
    nutritionProfile.Satiation.Value = 0.25
    nutritionProfile.StaminaChange.Value = 0.10
    nutritionProfile.MentalHealthChange.Value = 0.05
  end

  return EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Beverage, fillNutrition)
end)()
```

## Catálogo dos itens detectados

| # | Item | Categoria | Tipo comestível | Preço | Loja | Nutrição |
|---:|---|---|---|---:|---|---|
| 0 | Energético | `ItemCategory.Food` | `EdibleTypeEnum.Beverage` | 20 | `clothier` | `Satiation.Value = 0.1` |
| 1 | Barra de cereais | `ItemCategory.Food` | `EdibleTypeEnum.Other` | 5 | `clothier` | `Satiation.Value = 0.1` |
| 2 | Salgadinhos | `ItemCategory.Food` | `EdibleTypeEnum.Other` | 5 | `clothier` | `Satiation.Value = 0.1` |
| 3 | Refrigerante | `ItemCategory.Food` | `EdibleTypeEnum.Beverage` | 5 | `clothier` | `Satiation.Value = 0.1` |
| 4 | Doces | `ItemCategory.Food` | `EdibleTypeEnum.Other` | 2 | `clothier` | `Satiation.Value = 0.1` |
| 5 | Soyrent | `ItemCategory.Food` | `EdibleTypeEnum.Beverage` | 50 | `clothier` | `Satiation.Value = 0.1` |
| 6 | Nuggets de Frango | `ItemCategory.Food` | `EdibleTypeEnum.Other` | 45 | `clothier` | `Satiation.Value = 0.1` |
| 7 | Pão do dispensador | `ItemCategory.Food` | `EdibleTypeEnum.Bread` | 1 | `clothier` | `Satiation.Value = 0.1` |
| 8 | Lata de feijão cozido | `ItemCategory.Food` | `EdibleTypeEnum.Bean` | 40 | `clothier` | `Satiation.Value = 0.1` |
| 9 | Cebolas em conserva | `ItemCategory.Food` | `EdibleTypeEnum.MainVegetable` | 100 | `clothier` | `Satiation.Value = 0.1` |
| 10 | Vegetais Genéticamente Modificados | `ItemCategory.Food` | `EdibleTypeEnum.MainVegetable` | 7 | `clothier` | `Satiation.Value = 0.1` |
| 11 | Linguiça | `ItemCategory.Food` | `EdibleTypeEnum.Meat` | 50 | `clothier` | `Satiation.Value = 0.1` |
| 12 | Macarrão instantâneo | `ItemCategory.Food` | `EdibleTypeEnum.Pasta` | 4 | `clothier` | `Satiation.Value = 0.1` |
| 13 | Massa de Taco | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Other` | 150 | `clothier` | `Satiation.Value = 0.1` |
| 14 | Arroz | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Other` | 1500 | `clothier` | `Satiation.Value = 0.1` |
| 15 | Batatas | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.MainVegetable` | 1800 | `clothier` | `Satiation.Value = 0.1` |
| 16 | Farinha | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Other` | 1400 | `clothier` | `Satiation.Value = 0.1` |
| 17 | Tomate | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.MainVegetable` | 2500 | `clothier` | `Satiation.Value = 0.1` |
| 18 | Cenoura | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.MainVegetable` | 2000 | `clothier` | `Satiation.Value = 0.1` |
| 19 | Bife Cru | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Meat` | 22000 | `clothier` | `Satiation.Value = 0.1` |
| 20 | Carne de Frango Crua | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Meat` | 4000 | `clothier` | `Satiation.Value = 0.1` |
| 21 | Cebola | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.FlavourVegetable` | 2200 | `clothier` | `Satiation.Value = 0.1` |
| 22 | Ovo | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Other` | 3750 | `clothier` | `Satiation.Value = 0.1` |
| 23 | Leite | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Other` | 2500 | `clothier` | `Satiation.Value = 0.1` |
| 24 | Alho | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.FlavourVegetable` | 3000 | `clothier` | `Satiation.Value = 0.1` |
| 25 | Gengibre | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.FlavourVegetable` | 3500 | `clothier` | `Satiation.Value = 0.1` |
| 26 | Molho de Soja | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Other` | 1500 | `clothier` | `Satiation.Value = 0.1` |
| 27 | Vinagre | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Other` | 1500 | `clothier` | `Satiation.Value = 0.1` |
| 28 | Macarrão | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Pasta` | 1500 | `clothier` | `Satiation.Value = 0.1` |
| 29 | Carne Moída Crua | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Meat` | 7000 | `clothier` | `Satiation.Value = 0.1` |
| 30 | Açúcar | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Other` | 4000 | `clothier` | `Satiation.Value = 0.1` |
| 31 | Manteiga | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Other` | 6500 | `clothier` | `Satiation.Value = 0.1` |
| 32 | Queijo | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Other` | 21000 | `clothier` | `Satiation.Value = 0.1` |
| 33 | Iogurte | `ItemCategory.CookingIngredient` | `EdibleTypeEnum.Other` | 5000 | `clothier` | `Satiation.Value = 0.1` |

## Distribuição de preços

| Categoria | Itens | Menor preço | Maior preço | Média aprox. | Mediana |
|---|---:|---:|---:|---:|---:|
| `ItemCategory.Food` | 13 | 1 | 100 | 25.7 | 7.0 |
| `ItemCategory.CookingIngredient` | 21 | 150 | 22000 | 4681.0 | 2500.0 |

Observações:

- Itens `Food` são baratos: mínimo `1`, máximo `100`, mediana `7.0`.
- Ingredientes `CookingIngredient` são muito mais caros: mínimo `150`, máximo `22000`, mediana `2500.0`.
- Isso sugere uma separação econômica clara entre **comida pronta barata** e **ingredientes de culinária**.

## Loja usada

| Loja | Itens |
|---|---:|
| `clothier` | 34 |

Todos os itens foram adicionados em:

```lua
ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid)
```

Isso é tecnicamente válido pelo padrão da API, mas conceitualmente estranho para comida. Nos relatórios anteriores apareceram lojas como:

```lua
"grocery"
"pharmacy"
"clothier"
"ladyparts.ic"
```

Para um mod final, recomenda-se testar se `grocery` aceita esses itens:

```lua
ModUtilities.AddSingleBuyItemToShop("grocery", itemgameid)
```

ou usar a loja desejada conforme a intenção do mod.

## O que este arquivo confirma

### `EdibleData` é o ponto central para comida

Este arquivo confirma que comida/ingrediente usa `ItemPrefab.EdibleData`, não `OnUse`.

```lua
itemprefab.EdibleData = EdibleItemPrefabData.CreateInstance(tipo, callback)
```

### O callback recebe `Item` e `EdibleItemNutritionProfile`

A assinatura prática é:

```lua
---@param item Item
---@param nutritionProfile EdibleItemNutritionProfile
local ntf = function(item, nutritionProfile)
  nutritionProfile.Satiation.Value = 0.1
end
```

### Ingredientes também podem ser consumíveis

Mesmo itens em `ItemCategory.CookingIngredient` recebem `EdibleData`. Isso indica que ingredientes podem participar de receitas e também possuir perfil nutricional próprio.

### Não precisa de textura obrigatória

Nenhum item usa `GetPackedTexture` ou `AddTexture`. Portanto, comidas podem existir só com dados de item, sem textura customizada explícita no script.

## Pontos úteis para stubs LuaLS

### `EdibleItemPrefabData.CreateInstance`

Sugestão de comentário:

```lua
---Cria dados de item comestível para um `ItemPrefab`.
---
---O callback recebe o item runtime e um perfil nutricional mutável.
---Dentro dele, configure campos como `Satiation.Value`,
---`StaminaChange.Value`, `RawHealthChange.Value` e outros.
---
---@param edibleTypeEnum EdibleTypeEnum Tipo culinário/nutricional do item.
---@param getNutritionProfile fun(item: Item, nutritionProfile: EdibleItemNutritionProfile)
---@return EdibleItemPrefabData
function EdibleItemPrefabData.CreateInstance(edibleTypeEnum, getNutritionProfile) end
```

### `ItemPrefab.EdibleData`

Sugestão de campo:

```lua
---@field EdibleData EdibleItemPrefabData? Dados usados quando o item é comestível ou ingrediente.
```

### `EdibleTypeEnum`

Sugestão de comentário por valor:

```lua
---@alias EdibleTypeEnum
---| '"Other"'             # Tipo genérico.
---| '"Meat"'              # Carne.
---| '"Fish"'              # Peixe.
---| '"MainVegetable"'     # Vegetal principal.
---| '"FlavourVegetable"'  # Vegetal/tempero aromático.
---| '"Bean"'              # Feijão/leguminosa.
---| '"Pasta"'             # Massa/macarrão.
---| '"Bread"'             # Pão.
---| '"Beverage"'          # Bebida.
---| '"Dish"'              # Prato preparado.
```

### Alias de categoria útil

```lua
---@alias MdrgFoodCategory
---| "Food"
---| "CookingIngredient"
```

## Exemplo base recomendado para documentação

```lua
do
  local prefab = ModUtilities.CreateItemPrefab()

  prefab.Name = "Suco energético"
  prefab.Description = "Bebida simples com bônus de stamina."
  prefab.Price = 25
  prefab.IsIllegal = false
  prefab.HasQuality = false
  prefab.ThrowingOutForbidden = false
  prefab.IsStackable = true
  prefab.Category = ItemCategory.Food
  prefab.CanChangeColor = false
  prefab.ColorSlots = {}
  prefab.Partners = {}
  prefab.ScratchType = ScratchTextureType.Universal
  prefab.SusModifiers = {}

  prefab.EdibleData = (function()
    ---@param item Item
    ---@param nutritionProfile EdibleItemNutritionProfile
    local fillNutrition = function(item, nutritionProfile)
      nutritionProfile.Satiation.Value = 0.1
      nutritionProfile.StaminaChange.Value = 0.15
    end

    return EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Beverage, fillNutrition)
  end)()

  local id = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, prefab)
  ModUtilities.AddSingleBuyItemToShop("grocery", id)
end
```

## Exemplo de ingrediente

```lua
do
  local prefab = ModUtilities.CreateItemPrefab()

  prefab.Name = "Tomate customizado"
  prefab.Description = "Ingrediente usado em receitas."
  prefab.Price = 2500
  prefab.IsIllegal = false
  prefab.HasQuality = false
  prefab.ThrowingOutForbidden = false
  prefab.IsStackable = true
  prefab.Category = ItemCategory.CookingIngredient
  prefab.CanChangeColor = false
  prefab.ColorSlots = {}
  prefab.Partners = {}
  prefab.ScratchType = ScratchTextureType.Universal
  prefab.SusModifiers = {}

  prefab.EdibleData = (function()
    ---@param item Item
    ---@param nutritionProfile EdibleItemNutritionProfile
    local fillNutrition = function(item, nutritionProfile)
      nutritionProfile.Satiation.Value = 0.08
    end

    return EdibleItemPrefabData.CreateInstance(
      EdibleTypeEnum.MainVegetable,
      fillNutrition
    )
  end)()

  local id = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, prefab)
  ModUtilities.AddSingleBuyItemToShop("grocery", id)
end
```

## Diferenças em relação a `clothes.lua` e `script.lua`

| Aspecto | `foods.lua` | `clothes.lua` / `script.lua` |
|---|---|---|
| `SlotData` | Não usa | Usa muito |
| Texturas | Não usa | Usa `GetPackedTexture` + `AddTexture` |
| `ColorSlots` | Sempre vazio | Frequentemente usa `ColorSlot.CreateInstance` |
| `SusModifiers` | Sempre vazio | Roupas usam por área corporal |
| `EdibleData` | Uso central | Pouco ou nenhum uso |
| `IsStackable` | Sempre `true` | Roupas geralmente `false` |
| Categoria principal | `Food` / `CookingIngredient` | `Clothing` / `Modules` |
| Callback | `ntf(item, nutritionProfile)` | `SpecialEffectAction`, `OnUse`, etc. |

## Possíveis problemas ou pontos de revisão

1. **Todos os itens vão para `clothier`**  
   Para comida, isso parece mais útil para teste do que para mod final. Verifique se a loja correta deveria ser `grocery`.

2. **Todos os itens têm a mesma nutrição**  
   `Satiation.Value = 0.1` em todos os itens deixa comidas caras e baratas com o mesmo efeito. Para balanceamento, preços maiores deveriam ter efeitos maiores, ou ingredientes deveriam ter valores menores.

3. **Nenhum item usa ícone ou textura customizada**  
   Isso pode depender do jogo gerar ícone automaticamente, mas se a UI ficar genérica, será necessário investigar `OverrideIcon` ou assets.

4. **Sem `SubCategory`**  
   O script não organiza alimentos em subcategorias. Se existirem subcategorias de comida nos stubs/dump, vale testar.

5. **Nomes de callbacks repetidos como `ntf`**  
   Como cada `ntf` é `local` dentro de uma função anônima, não há colisão global. O padrão é seguro, mas pouco descritivo.

## Conclusão prática

`foods.lua` é útil para documentar o sistema de comida/ingrediente. Ele confirma:

- como criar item comestível;
- como configurar `EdibleData`;
- como usar `EdibleItemPrefabData.CreateInstance`;
- como preencher `EdibleItemNutritionProfile`;
- quais `EdibleTypeEnum` aparecem na prática;
- que `CookingIngredient` também pode ter nutrição;
- que `OnUse` não é necessário para comida.

O principal material que vale reaproveitar nos stubs é a documentação de `EdibleItemPrefabData`, `EdibleItemNutritionProfile`, `ItemPrefab.EdibleData`, `ItemCategory.Food`, `ItemCategory.CookingIngredient` e `EdibleTypeEnum`.

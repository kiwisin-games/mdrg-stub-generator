# Documentação útil extraída de `modules.lua`

Este relatório documenta o arquivo `modules.lua` no mesmo estilo dos relatórios anteriores. O foco aqui é extrair padrões reutilizáveis para documentação, stubs LuaLS, exemplos de modding e autocomplete.

O arquivo é um catálogo de **módulos corporais/visuais**. Diferente de `foods.lua`, ele não trabalha com `EdibleData`. Diferente de `clothes.lua`, ele não usa `ItemCategory.Clothing`. Todos os itens criados aqui usam `ItemCategory.Modules`.

---

## 1. Resumo executivo

| Métrica | Valor |
|---|---:|
| Linhas | `2448` |
| Tamanho aproximado | `120.2 KB` |
| Itens criados | `53` |
| Registros `CreateNewItemAutoAssignId()` | `53` |
| Adições em loja | `53` |
| `GetPackedTexture()` | `318` |
| `AddTexture()` | `318` |
| `SlotEquipData.CreateInstance()` | `53` |
| Variáveis booleanas modificáveis | `12` |
| Variáveis float modificáveis | `6` |
| Condições por variável especial | `12` |
| Requisitos `AtLeastOneBoolVariableTrueRequirement` | `3` |

Conclusão curta:

- O arquivo é muito útil para documentar **módulos equipáveis**.
- O padrão atual é usar `SlotData`, não `PossibleEquipmentSlots`.
- O arquivo confirma uso de `ControllerElementOverride`, `ElementActiveConditions`, `TextureActiveConditions`, `ItemModifiableVariables` e `ItemModifiableVariablesRequirements`.
- Também confirma slots corporais importantes como `ThighBodyModules`, `CalfBodyModules`, `FeetBodyModules`, `BoobsBodyModules` e `AssBodyModules`.

---

## 2. Padrão principal de item de módulo

O padrão base do arquivo é:

```lua
local itemprefab = ModUtilities.CreateItemPrefab()

itemprefab.Name = "Nome do módulo"
itemprefab.Description = "Descrição do módulo"
itemprefab.Price = 10000

itemprefab.SlotData = SlotEquipData.CreateInstance("Tail")

itemprefab.IsIllegal = true
itemprefab.HasQuality = false
itemprefab.ThrowingOutForbidden = false
itemprefab.IsStackable = false
itemprefab.Category = ItemCategory.Modules
itemprefab.CanChangeColor = true
itemprefab.ColorSlots = {
  ColorSlot.CreateInstance(
    "Cor principal",
    ColorPaletteManager.GetColorPaletteByName("partpalette")
  )
}
itemprefab.Partners = {}
itemprefab.ScratchType = ScratchTextureType.Universal
itemprefab.SusModifiers = {}

local texture = ModUtilities.GetPackedTexture(CurrentModGuid, "/Meu Item/tex 1 - interaction.json")
itemprefab.AddTexture(texture)

local itemId = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab)
ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemId)
```

Esse padrão é a base para módulos simples: caudas, braços, pernas, pele, olhos, cabelo, orelhas, dentes e módulos corporais.

---

## 3. Chamadas de API mais importantes

| API | Usos |
|---|---:|
| `ModUtilities.GetPackedTexture` | 318 |
| `ItemPrefab.AddTexture` | 318 |
| `ColorSlot.CreateInstance` | 61 |
| `ColorPaletteManager.GetColorPaletteByName` | 61 |
| `ModUtilities.CreateItemPrefab` | 53 |
| `SlotEquipData.CreateInstance` | 53 |
| `ModUtilities.CreateNewItemAutoAssignId` | 53 |
| `ModUtilities.AddSingleBuyItemToShop` | 53 |
| `SimpleLocalizedString.CreateInstanceReplacement` | 18 |
| `ItemScopeConditionSpecialVariable.CreateInstance` | 12 |
| `ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable` | 12 |
| `ItemModifiableVariableFactory.CreateInstanceFloatVariable` | 6 |
| `AtLeastOneBoolVariableTrueRequirement.CreateInstance` | 3 |
| `SusModifier.CreateInstance` | 3 |

As chamadas mais relevantes para documentação são:

- `SlotEquipData.CreateInstance`: define onde o módulo será equipado.
- `ControllerElementOverride`: troca elementos específicos do controlador Live2D.
- `ItemModifiableVariableFactory`: cria opções editáveis pelo jogador.
- `ItemScopeConditionSpecialVariable`: conecta opções editáveis a elementos visuais.
- `AtLeastOneBoolVariableTrueRequirement`: impede combinações inválidas de toggles.
- `GetPackedTexture` + `AddTexture`: registra texturas por cena/controller.

---

## 4. Campos de `ItemPrefab` usados

| Valor | Contagem |
|---|---:|
| `Name` | 53 |
| `Description` | 53 |
| `Price` | 53 |
| `SlotData` | 53 |
| `IsIllegal` | 53 |
| `HasQuality` | 53 |
| `ThrowingOutForbidden` | 53 |
| `IsStackable` | 53 |
| `Category` | 53 |
| `CanChangeColor` | 53 |
| `ColorSlots` | 53 |
| `Partners` | 53 |
| `ScratchType` | 53 |
| `SusModifiers` | 53 |
| `ItemModifiableVariables` | 8 |
| `ItemModifiableVariablesRequirements` | 3 |
| `SubCategory` | 2 |

Campos mais importantes neste arquivo:

```lua
Name
Description
Price
SlotData
ItemModifiableVariables
ItemModifiableVariablesRequirements
IsIllegal
HasQuality
ThrowingOutForbidden
IsStackable
Category
SubCategory
CanChangeColor
ColorSlots
Partners
ScratchType
SusModifiers
```

Observação importante: este arquivo **não usa** `PossibleEquipmentSlots` nem `RequiredSlots` diretamente. Ele usa `SlotData`, que parece ser o padrão mais moderno para módulos equipáveis.

---

## 5. Categorias, subcategorias e lojas

### Categorias

| Valor | Contagem |
|---|---:|
| `Modules` | 53 |

Todos os itens são módulos.

### Subcategorias

| Valor | Contagem |
|---|---:|
| `Modules_CatEars` | 2 |

A subcategoria encontrada é útil para documentar módulos específicos de orelha de gato:

```lua
ItemSubCategory.Modules_CatEars
```

### Lojas

| Loja | Itens |
|---|---:|
| `ladyparts.ic` | 51 |
| `clothier` | 2 |

Interpretação:

- `ladyparts.ic` é a loja principal para módulos.
- `clothier` aparece apenas para dois itens, provavelmente acessórios mais próximos de roupa/visual leve.

---

## 6. Slots encontrados

| Slot | Itens |
|---|---:|
| `Tail` | 8 |
| `ArmL` | 5 |
| `ArmR` | 5 |
| `LegL` | 5 |
| `LegR` | 5 |
| `Skin` | 3 |
| `HairMain` | 3 |
| `HairAugmentation` | 3 |
| `Head` | 2 |
| `Teeth` | 2 |
| `Ears` | 2 |
| `HairAdditional` | 2 |
| `Eyes` | 1 |
| `Flesh` | 1 |
| `Hologram` | 1 |
| `ThighBodyModules` | 1 |
| `CalfBodyModules` | 1 |
| `FeetBodyModules` | 1 |
| `BoobsBodyModules` | 1 |
| `AssBodyModules` | 1 |

Lista útil para autocomplete/alias:

```lua
---@alias MdrgModuleSlot
---| '"Tail"'
---| '"ArmL"'
---| '"ArmR"'
---| '"LegL"'
---| '"LegR"'
---| '"HairMain"'
---| '"Skin"'
---| '"HairAugmentation"'
---| '"Head"'
---| '"Teeth"'
---| '"HairAdditional"'
---| '"Ears"'
---| '"Eyes"'
---| '"Flesh"'
---| '"Hologram"'
---| '"ThighBodyModules"'
---| '"CalfBodyModules"'
---| '"FeetBodyModules"'
---| '"BoobsBodyModules"'
---| '"AssBodyModules"'
```

Slots especialmente importantes que este arquivo confirma:

```lua
ThighBodyModules
CalfBodyModules
FeetBodyModules
BoobsBodyModules
AssBodyModules
HairAugmentation
HairAdditional
Hologram
Flesh
```

Esses são bons candidatos para documentação específica porque não são slots genéricos de roupa.

---

## 7. Catálogo resumido por slot

| Slot | Itens |
|---|---|
| `Tail` | Cauda de Gato, Cauda de Gato com Hiper Camuflagem, Cauda de Gato (Ponta Diferente) , Cauda de Gato (Ponta Diferente) com Hiper Camuflagem, Cauda Felpuda, Cauda Felpuda com Hiper Camuflagem, Cauda Felpuda Listrada, Cauda Felpuda Listrada com Hiper Camuflagem |
| `ArmL` | Braço Esquerdo, Braço Esquerdo com Hiper Camuflagem, Braço Esquerdo da VolksAuto, Braço Esquerdo Experimental, Braço Esquerdo Experimental com Hiper Camuflagem |
| `ArmR` | Braço Direito, Braço Direito com Hiper Camuflagem, Braço Direito da VolksAuto, Braço Direito Experimental, Braço Direito Experimental com Hiper Camuflagem |
| `LegL` | Perna Esquerda, Perna Esquerda com Hiper Camuflagem, Perna Esquerda da VolksAuto, Perna Esquerda Experimental, Perna Esquerda Experimental com Hiper Camuflagem |
| `LegR` | Perna Direita, Perna Direita com Hiper Camuflagem, Perna Direita da VolksAuto , Perna Direita Experimental, Perna Direita Experimental com Hiper Camuflagem |
| `Skin` | Pele com Hiper Camuflagem, Pele com Hiper camuflagem de Alta Tecnologia, Pele Arco-íris |
| `HairMain` | Cabelo com Hiper camuflagem, Cabelo de pano com Hiper Camuflagem, Cabelo com corte Hiper Camuflagem |
| `HairAugmentation` | Cabelo Arco-ìris, Cabelo Galáctico, Cabelo da Quarta Dimensão |
| `Head` | Orelhas de gato, Orelhas de gato com Hiper camuflagem |
| `Teeth` | Dentes Afiados, Dentes Afiados com Hiper Camuflagem |
| `Ears` | Orelhas Pontudas com Hiper camuflagem, Orelhas pontudas |
| `HairAdditional` | Cabelo com rabo de cavalo com Hiper Camuflagem, Franja de cobertura ocular com Hiper Camuflagemm |
| `Eyes` | Olhos com Hiper camuflagem |
| `Flesh` | Pele com Hiper camuflagem |
| `Hologram` | Desativar holograma |
| `ThighBodyModules` | Módulo de tamanho da coxa |
| `CalfBodyModules` | Módulo de tamanho da panturrilha |
| `FeetBodyModules` | Módulo de tamanho dos pés |
| `BoobsBodyModules` | Módulo de tamanho de peito |
| `AssBodyModules` | Módulo de tamanho de bunda |

---

## 8. Catálogo item por item

| # | Item | Slot | Preço | Cor | Qualidade | Texturas | Variáveis |
|---:|---|---|---:|---|---|---:|---|
| 1 | Orelhas de gato | `Head` | 10000 | não | sim | 5 | - |
| 2 | Braço Esquerdo | `ArmL` | 12500 | não | sim | 6 | - |
| 3 | Braço Direito | `ArmR` | 12500 | não | sim | 6 | - |
| 4 | Perna Esquerda | `LegL` | 13500 | não | sim | 5 | - |
| 5 | Perna Direita | `LegR` | 13500 | não | sim | 5 | - |
| 6 | Dentes Afiados | `Teeth` | 12500 | não | sim | 5 | - |
| 7 | Braço Esquerdo com Hiper Camuflagem | `ArmL` | 18000 | sim | sim | 6 | - |
| 8 | Braço Direito com Hiper Camuflagem | `ArmR` | 18000 | sim | sim | 6 | - |
| 9 | Perna Esquerda com Hiper Camuflagem | `LegL` | 19000 | sim | sim | 5 | - |
| 10 | Perna Direita com Hiper Camuflagem | `LegR` | 19000 | sim | sim | 5 | - |
| 11 | Pele com Hiper Camuflagem | `Skin` | 19000 | sim | não | 6 | - |
| 12 | Olhos com Hiper camuflagem | `Eyes` | 18000 | sim | sim | 6 | - |
| 13 | Pele com Hiper camuflagem | `Flesh` | 18000 | sim | sim | 6 | - |
| 14 | Orelhas de gato com Hiper camuflagem | `Head` | 18000 | sim | sim | 5 | - |
| 15 | Orelhas Pontudas com Hiper camuflagem | `Ears` | 4500 | sim | não | 5 | - |
| 16 | Pele com Hiper camuflagem de Alta Tecnologia | `Skin` | 54000 | sim | não | 11 | - |
| 17 | Pele Arco-íris | `Skin` | 190000 | não | não | 6 | - |
| 18 | Desativar holograma | `Hologram` | 2500 | não | não | 0 | - |
| 19 | Orelhas pontudas | `Ears` | 200 | não | não | 5 | - |
| 20 | Cabelo com Hiper camuflagem | `HairMain` | 19250 | sim | sim | 34 | Ahoge, Front, Side, Back, Braid |
| 21 | Cabelo de pano com Hiper Camuflagem | `HairMain` | 23000 | sim | sim | 27 | Ahoge, Front, Side, Back |
| 22 | Cabelo com corte Hiper Camuflagem | `HairMain` | 23000 | sim | sim | 22 | Front, Side, Back |
| 23 | Cabelo com rabo de cavalo com Hiper Camuflagem | `HairAdditional` | 23000 | sim | sim | 10 | - |
| 24 | Franja de cobertura ocular com Hiper Camuflagemm | `HairAdditional` | 19250 | sim | sim | 6 | - |
| 25 | Cabelo Arco-ìris | `HairAugmentation` | 180000 | não | não | 0 | - |
| 26 | Cabelo Galáctico | `HairAugmentation` | 216000 | não | não | 0 | - |
| 27 | Cabelo da Quarta Dimensão | `HairAugmentation` | 360000 | não | não | 0 | - |
| 28 | Cauda de Gato | `Tail` | 14000 | não | não | 5 | - |
| 29 | Cauda de Gato com Hiper Camuflagem | `Tail` | 48000 | sim | não | 5 | - |
| 30 | Cauda de Gato (Ponta Diferente)  | `Tail` | 17000 | não | não | 7 | - |
| 31 | Cauda de Gato (Ponta Diferente) com Hiper Camuflagem | `Tail` | 52500 | sim | não | 7 | - |
| 32 | Cauda Felpuda | `Tail` | 25000 | não | não | 3 | - |
| 33 | Cauda Felpuda com Hiper Camuflagem | `Tail` | 64500 | sim | não | 3 | - |
| 34 | Cauda Felpuda Listrada | `Tail` | 50000 | não | não | 5 | - |
| 35 | Cauda Felpuda Listrada com Hiper Camuflagem | `Tail` | 102000 | sim | não | 5 | - |
| 36 | Módulo de tamanho da coxa | `ThighBodyModules` | 200000 | não | não | 0 | thighSize |
| 37 | Módulo de tamanho da panturrilha | `CalfBodyModules` | 100000 | não | não | 0 | calfSize |
| 38 | Módulo de tamanho dos pés | `FeetBodyModules` | 690420 | não | não | 0 | feetLength, feetWidth |
| 39 | Módulo de tamanho de peito | `BoobsBodyModules` | 12000000 | não | não | 0 | boobSize |
| 40 | Módulo de tamanho de bunda | `AssBodyModules` | 4000000 | não | não | 0 | assSize |
| 41 | Braço Esquerdo da VolksAuto | `ArmL` | 30000 | não | sim | 6 | - |
| 42 | Braço Direito da VolksAuto | `ArmR` | 30000 | não | sim | 6 | - |
| 43 | Perna Esquerda da VolksAuto | `LegL` | 30000 | não | sim | 5 | - |
| 44 | Perna Direita da VolksAuto  | `LegR` | 30000 | não | sim | 5 | - |
| 45 | Braço Esquerdo Experimental | `ArmL` | 15000 | não | sim | 7 | - |
| 46 | Braço Direito Experimental | `ArmR` | 15000 | não | sim | 7 | - |
| 47 | Perna Esquerda Experimental | `LegL` | 15000 | não | sim | 5 | - |
| 48 | Perna Direita Experimental | `LegR` | 15000 | não | sim | 5 | - |
| 49 | Braço Esquerdo Experimental com Hiper Camuflagem | `ArmL` | 49500 | sim | sim | 7 | - |
| 50 | Braço Direito Experimental com Hiper Camuflagem | `ArmR` | 49500 | sim | sim | 7 | - |
| 51 | Perna Esquerda Experimental com Hiper Camuflagem | `LegL` | 49500 | sim | sim | 5 | - |
| 52 | Perna Direita Experimental com Hiper Camuflagem | `LegR` | 49500 | sim | sim | 5 | - |
| 53 | Dentes Afiados com Hiper Camuflagem | `Teeth` | 45750 | sim | sim | 5 | - |

Notas:

- `Texturas = 0` geralmente indica módulo puramente lógico, como slider/toggle, ou item que ativa/desativa um recurso sem textura própria.
- `Variáveis` mostra itens que expõem configurações modificáveis para o jogador.
- A média de preço fica distorcida por módulos muito caros. Resumo: mínimo `200`, mediana `23000`, média aproximada `360818.3`, máximo `12000000`.

---

## 9. `SlotData` simples

Formato simples:

```lua
itemprefab.SlotData = SlotEquipData.CreateInstance("Tail")
```

Uso indicado:

- módulo ocupa exatamente um slot;
- não precisa substituir elementos internos específicos;
- não precisa de partes ativáveis/desativáveis.

Exemplos de slots usados assim:

```lua
Tail
ArmL
ArmR
LegL
LegR
Skin
Eyes
Flesh
Hologram
ThighBodyModules
CalfBodyModules
FeetBodyModules
BoobsBodyModules
AssBodyModules
```

Sugestão LuaDoc:

```lua
---@class SlotEquipData
---@field TargetSlotString string Slot alvo usado pelo item.
---@field ControllerElementOverride string[]? Elementos específicos do controlador substituídos pelo item.
---@field ElementActiveConditions any[]? Condições que controlam ativação de elementos.
---@field TextureActiveConditions any[]? Condições que controlam ativação de texturas.
```

---

## 10. `SlotData` avançado com `ControllerElementOverride`

Formato usado no arquivo:

```lua
itemprefab.SlotData = (function()
  local sd = SlotEquipData.CreateInstance()
  sd.TargetSlotString = "HairMain"
  sd.ControllerElementOverride = {
    "Hair0_Top",
    "Hair0_Front",
    "Hair0_Side",
    "Hair0_Back",
    "Hair0_Braid",
    "Eyebrows_BasicEyebrows"
  }
  return sd
end)()
```

Elementos de controller encontrados:

| Elemento | Usos |
|---|---:|
| `Eyebrows_BasicEyebrows` | 3 |
| `Head_CatEars` | 2 |
| `Teeth_SharpTeeth` | 2 |
| `Hair0_Top` | 1 |
| `Hair0_Front` | 1 |
| `Hair0_Side` | 1 |
| `Hair0_Back` | 1 |
| `Hair0_Braid` | 1 |
| `Hair1_Top` | 1 |
| `Hair1_Front` | 1 |
| `Hair1_Side` | 1 |
| `Hair1_Back` | 1 |
| `Hair3_Front` | 1 |
| `Hair3_Side` | 1 |
| `Hair3_Back` | 1 |
| `Hair4_Ponytail` | 1 |
| `Hair4_Knot` | 1 |
| `Hair2_Front` | 1 |

Interpretação prática:

- `TargetSlotString` diz o slot geral.
- `ControllerElementOverride` diz quais partes internas do modelo/controller serão substituídas.
- Isso é especialmente útil para cabelos, dentes e orelhas.

Sugestão de comentário para documentação:

```lua
--- Lista de elementos específicos do controlador visual que este item substitui.
--- Útil quando um único slot possui várias partes internas, como HairMain.
--- Exemplo: Hair0_Top, Hair0_Front, Hair0_Side, Hair0_Back.
---@type string[]?
sd.ControllerElementOverride = {"Hair0_Top", "Hair0_Front"}
```

---

## 11. Variáveis modificáveis do item

O arquivo confirma dois tipos de variável modificável.

### Boolean backed variable

```lua
ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
  "Front",
  SimpleLocalizedString.CreateInstanceReplacement("Frente"),
  true
)
```

Variáveis booleanas encontradas:

| Variável | Usos |
|---|---:|
| `Front` | 3 |
| `Side` | 3 |
| `Back` | 3 |
| `Ahoge` | 2 |
| `Braid` | 1 |

Uso prático:

- ligar/desligar parte frontal do cabelo;
- ligar/desligar lateral;
- ligar/desligar parte traseira;
- ligar/desligar ahoge;
- ligar/desligar trança.

### Float variable

```lua
ItemModifiableVariableFactory.CreateInstanceFloatVariable(
  "boobSize",
  SimpleLocalizedString.CreateInstanceReplacement("Tamanho do peito"),
  0.5
)
```

Variáveis float encontradas:

| Variável | Usos |
|---|---:|
| `thighSize` | 1 |
| `calfSize` | 1 |
| `feetLength` | 1 |
| `feetWidth` | 1 |
| `boobSize` | 1 |
| `assSize` | 1 |

Uso prático:

- sliders corporais;
- tamanho de coxa;
- tamanho de panturrilha;
- comprimento/largura do pé;
- tamanho de peito;
- tamanho de bunda.

Sugestão LuaDoc:

```lua
---@class ItemModifiableVariableFactory
ItemModifiableVariableFactory = {}

--- Cria uma variável booleana editável pelo jogador.
--- Normalmente usada para ativar/desativar partes visuais de um item.
---@param id string Identificador interno da variável.
---@param label SimpleLocalizedString Texto exibido na UI.
---@param defaultValue boolean Valor inicial.
---@return any
function ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(id, label, defaultValue) end

--- Cria uma variável numérica editável pelo jogador.
--- Normalmente usada para sliders de tamanho/intensidade.
---@param id string Identificador interno da variável.
---@param label SimpleLocalizedString Texto exibido na UI.
---@param defaultValue number Valor inicial.
---@return any
function ItemModifiableVariableFactory.CreateInstanceFloatVariable(id, label, defaultValue) end
```

---

## 12. `ElementActiveConditions`

Padrão encontrado:

```lua
sd.ElementActiveConditions = {
  ItemScopeConditionSpecialVariable.CreateInstance("Ahoge"),
  ItemScopeConditionSpecialVariable.CreateInstance("Front"),
  ItemScopeConditionSpecialVariable.CreateInstance("Side"),
  ItemScopeConditionSpecialVariable.CreateInstance("Back")
}
```

Variáveis usadas como condição:

| Condição | Usos |
|---|---:|
| `Front` | 3 |
| `Side` | 3 |
| `Back` | 3 |
| `Ahoge` | 2 |
| `Braid` | 1 |

Interpretação:

- cada condição aponta para uma variável criada em `ItemModifiableVariables`;
- a ordem das condições parece corresponder à ordem dos elementos no `ControllerElementOverride`;
- quando a variável está desligada, a parte visual correspondente pode ser ocultada/desativada.

Sugestão LuaDoc:

```lua
---@class ItemScopeConditionSpecialVariable
ItemScopeConditionSpecialVariable = {}

--- Cria uma condição baseada em uma variável modificável do próprio item.
--- Usada em ElementActiveConditions ou TextureActiveConditions.
---@param variableName string Nome da variável criada em ItemModifiableVariables.
---@return any
function ItemScopeConditionSpecialVariable.CreateInstance(variableName) end
```

---

## 13. `ItemModifiableVariablesRequirements`

Padrão encontrado:

```lua
itemprefab.ItemModifiableVariablesRequirements = {
  AtLeastOneBoolVariableTrueRequirement.CreateInstance({0, 1, 2, 3})
}
```

Uso prático:

- impede que o jogador desligue todas as partes de um item;
- especialmente útil para cabelos customizáveis;
- os índices parecem apontar para a posição das variáveis em `ItemModifiableVariables`.

Sugestão LuaDoc:

```lua
---@class AtLeastOneBoolVariableTrueRequirement
AtLeastOneBoolVariableTrueRequirement = {}

--- Exige que pelo menos uma das variáveis booleanas indicadas esteja ativa.
--- Os índices parecem se referir à ordem das variáveis em ItemModifiableVariables.
---@param variableIndices integer[]
---@return any
function AtLeastOneBoolVariableTrueRequirement.CreateInstance(variableIndices) end
```

---

## 14. `TextureActiveConditions`

O arquivo usa:

```lua
sd.TextureActiveConditions = {}
```

Neste arquivo, o campo aparece vazio. Ainda assim, ele é importante para documentação porque provavelmente segue a mesma ideia de `ElementActiveConditions`, mas aplicada a texturas.

Sugestão cautelosa de documentação:

```lua
--- Condições usadas para controlar quais texturas do item ficam ativas.
--- Neste arquivo aparece como tabela vazia, então a semântica exata precisa ser validada em mais exemplos.
---@type any[]?
sd.TextureActiveConditions = {}
```

---

## 15. Texturas e controllers/cenas

Todas as texturas carregadas são `.json` por `ModUtilities.GetPackedTexture`.

Controllers/cenas detectados nos nomes dos arquivos:

| Controller/Cena | Texturas |
|---|---:|
| `interaction` | 44 |
| `doggy` | 42 |
| `cowgirl` | 40 |
| `missionary` | 40 |
| `blowjob` | 30 |
| `shower` | 30 |

Padrão de path:

```lua
local texture = ModUtilities.GetPackedTexture(
  CurrentModGuid,
  "/Nome do Item/tex 1 - doggy.json"
)

itemprefab.AddTexture(texture)
```

Também aparecem arquivos que parecem cobrir múltiplas cenas no mesmo nome, por exemplo:

```lua
"/Item/tex 1 - blowjob, cowgirl, interaction, missionary.json"
```

Conclusão para documentação:

- `doggy`, `missionary`, `interaction`, `blowjob`, `cowgirl` e `shower` devem ser tratados como nomes de cena/controller conhecidos.
- `shower` aparece novamente como controller/cena válido.

Sugestão de alias:

```lua
---@alias MdrgControllerName
---| '"interaction"'
---| '"missionary"'
---| '"doggy"'
---| '"blowjob"'
---| '"cowgirl"'
---| '"shower"'
```

---

## 16. Cores e palettes

### Palettes encontradas

| Palette | Usos |
|---|---:|
| `partpalette` | 60 |
| `skinTonePalette` | 1 |

### Nomes de color slots

| ColorSlot | Usos |
|---|---:|
| `Cor principal` | 35 |
| `Cor Principal` | 5 |
| `Cor Secundária` | 3 |
| `Cor dos pelos` | 2 |
| `Cor da ponta da cauda` | 2 |
| `Cor da listra` | 2 |
| `Pupila Esquerda` | 1 |
| `Pupila Direita` | 1 |
| `Íris Esquerda` | 1 |
| `Íris Direita` | 1 |
| `Esclera` | 1 |
| `Boca` | 1 |
| `Mamilos` | 1 |
| `Vagina` | 1 |
| `Cor principal ` | 1 |
| `Cor secundária` | 1 |
| `Cor do laço de cabelo` | 1 |
| `Cor do elástico` | 1 |

Observações:

- `partpalette` é a palette principal.
- `skinTonePalette` aparece uma vez e deve continuar documentada.
- Existem variações de capitalização e espaçamento:
  - `Cor principal`
  - `Cor Principal`
  - `Cor principal ` com espaço final

Recomendação:

- Não assumir que nomes de color slot são enums rígidos.
- Documentar como string livre exibida na UI.
- Para exemplos, padronizar nomes sem espaço final.

Sugestão LuaDoc:

```lua
---@alias MdrgKnownPalette
---| '"partpalette"'
---| '"skinTonePalette"'
---| '"grayscalepalette"'
```

---

## 17. `ScratchType`, ilegalidade, qualidade e cor

### ScratchType

| ScratchType | Itens |
|---|---:|
| `Universal` | 30 |
| `Hard` | 23 |

### IsIllegal

| Valor | Itens |
|---|---:|
| `true` | 51 |
| `false` | 2 |

### HasQuality

| Valor | Itens |
|---|---:|
| `true` | 31 |
| `false` | 22 |

### CanChangeColor

| Valor | Itens |
|---|---:|
| `false` | 29 |
| `true` | 24 |

Interpretação:

- Módulos normais/visuais usam bastante `ScratchTextureType.Universal`.
- Partes corporais como braços, pernas e dentes aparecem com `ScratchTextureType.Hard`.
- Quase todos os módulos são ilegais.
- `HasQuality = true` aparece principalmente em módulos físicos/texturizados.
- Módulos de slider/tamanho geralmente têm `HasQuality = false` e `GetPackedTexture = 0`.

---

## 18. `SusModifiers`

O arquivo usa pouco `SusModifier.CreateInstance`.

| Chamada | Usos |
|---|---:|
| `SusArea.Skin, 0.5` | 2 |
| `SusArea.Skin, 0.9` | 1 |

Interpretação:

- `SusModifiers` existe em todos os itens, mas quase sempre como tabela vazia.
- Quando usado, serve para marcar áreas de corpo/visual com valor de exposição/suspeita.
- Este arquivo não é a melhor fonte para mapear todos os `SusArea`.

---

## 19. Coisas que este arquivo confirma para os stubs

### Classes/fábricas que devem estar documentadas

```lua
ModUtilities
ItemPrefab
SlotEquipData
ColorSlot
ColorPaletteManager
ItemModifiableVariableFactory
SimpleLocalizedString
ItemScopeConditionSpecialVariable
AtLeastOneBoolVariableTrueRequirement
SusModifier
```

### Campos importantes de `ItemPrefab`

```lua
---@class ItemPrefab
---@field SlotData SlotEquipData
---@field ItemModifiableVariables any[]?
---@field ItemModifiableVariablesRequirements any[]?
---@field SubCategory ItemSubCategory?
```

### Campos importantes de `SlotEquipData`

```lua
---@class SlotEquipData
---@field TargetSlotString string
---@field ControllerElementOverride string[]?
---@field ElementActiveConditions any[]?
---@field TextureActiveConditions any[]?
```

### Enums/aliases úteis

```lua
---@alias MdrgModuleShop
---| '"ladyparts.ic"'
---| '"clothier"'

---@alias MdrgScratchType
---| '"Universal"'
---| '"Hard"'
```

---

## 20. Exemplos úteis derivados do arquivo

### Exemplo: módulo simples de cauda

```lua
local prefab = ModUtilities.CreateItemPrefab()
prefab.Name = "Minha Cauda"
prefab.Description = "Exemplo de módulo simples."
prefab.Price = 10000
prefab.SlotData = SlotEquipData.CreateInstance("Tail")
prefab.IsIllegal = true
prefab.HasQuality = false
prefab.ThrowingOutForbidden = false
prefab.IsStackable = false
prefab.Category = ItemCategory.Modules
prefab.CanChangeColor = true
prefab.ColorSlots = {
  ColorSlot.CreateInstance(
    "Cor principal",
    ColorPaletteManager.GetColorPaletteByName("partpalette")
  )
}
prefab.Partners = {}
prefab.ScratchType = ScratchTextureType.Universal
prefab.SusModifiers = {}

local tex = ModUtilities.GetPackedTexture(CurrentModGuid, "/Minha Cauda/tex 1 - interaction.json")
prefab.AddTexture(tex)

local id = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, prefab)
ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", id)
```

### Exemplo: cabelo com partes ativáveis

```lua
local prefab = ModUtilities.CreateItemPrefab()
prefab.Name = "Cabelo Modular"
prefab.Description = "Exemplo com partes ativáveis."
prefab.Price = 20000

prefab.SlotData = (function()
  local sd = SlotEquipData.CreateInstance()
  sd.TargetSlotString = "HairMain"
  sd.ControllerElementOverride = {
    "Hair0_Top",
    "Hair0_Front",
    "Hair0_Side",
    "Hair0_Back"
  }
  sd.ElementActiveConditions = {
    ItemScopeConditionSpecialVariable.CreateInstance("Top"),
    ItemScopeConditionSpecialVariable.CreateInstance("Front"),
    ItemScopeConditionSpecialVariable.CreateInstance("Side"),
    ItemScopeConditionSpecialVariable.CreateInstance("Back")
  }
  sd.TextureActiveConditions = {}
  return sd
end)()

prefab.ItemModifiableVariables = {
  ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
    "Top",
    SimpleLocalizedString.CreateInstanceReplacement("Topo"),
    true
  ),
  ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
    "Front",
    SimpleLocalizedString.CreateInstanceReplacement("Frente"),
    true
  ),
  ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
    "Side",
    SimpleLocalizedString.CreateInstanceReplacement("Lado"),
    true
  ),
  ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
    "Back",
    SimpleLocalizedString.CreateInstanceReplacement("Parte de trás"),
    true
  )
}

prefab.ItemModifiableVariablesRequirements = {
  AtLeastOneBoolVariableTrueRequirement.CreateInstance({0, 1, 2, 3})
}
```

### Exemplo: módulo com slider numérico

```lua
local prefab = ModUtilities.CreateItemPrefab()
prefab.Name = "Módulo de Escala"
prefab.Description = "Exemplo de módulo com valor numérico editável."
prefab.Price = 100000
prefab.SlotData = SlotEquipData.CreateInstance("ThighBodyModules")
prefab.Category = ItemCategory.Modules

prefab.ItemModifiableVariables = {
  ItemModifiableVariableFactory.CreateInstanceFloatVariable(
    "thighSize",
    SimpleLocalizedString.CreateInstanceReplacement("Tamanho da coxa"),
    0.5
  )
}
```

---

## 21. Possíveis problemas/pontos de atenção

1. **Nomes de color slot inconsistentes**  
   Existem variações como `Cor principal`, `Cor Principal` e `Cor principal ` com espaço final.

2. **Preços muito discrepantes**  
   A média é pouco útil porque existem módulos com preço muito alto, como módulos de tamanho corporal.

3. **Itens sem textura**  
   Alguns módulos têm `0` texturas. Isso parece intencional quando o item só altera variável/tamanho, mas é algo para verificar em testes.

4. **`TextureActiveConditions` aparece vazio**  
   O campo existe, mas o arquivo não mostra uso real com condições preenchidas.

5. **Poucos `SusModifiers`**  
   O campo existe em todos os itens, mas este arquivo não é suficiente para documentar a semântica completa de `SusArea`.

---

## 22. Conclusão prática

`modules.lua` é especialmente útil para documentar:

- módulos corporais;
- slots corporais especiais;
- `SlotData` moderno;
- `ControllerElementOverride`;
- `ItemModifiableVariables`;
- `ElementActiveConditions`;
- `ItemModifiableVariablesRequirements`;
- sliders com `CreateInstanceFloatVariable`;
- toggles visuais com `CreateInstanceBoolBackedVariable`;
- controllers/cenas usados em texturas.

O maior ganho para o addon LuaLS seria adicionar documentação forte para:

```lua
SlotEquipData
ItemModifiableVariableFactory
ItemScopeConditionSpecialVariable
AtLeastOneBoolVariableTrueRequirement
SimpleLocalizedString
```

E adicionar aliases/autocomplete para:

```lua
MdrgModuleSlot
MdrgControllerName
MdrgKnownPalette
MdrgModuleShop
```

# Documentação LuaDoc sugerida para os stubs MDRG

Este arquivo reúne comentários `---`/LuaDoc para adicionar aos stubs `.d.lua` enviados. O foco não é documentar todo o dump C#, mas sim as APIs e padrões que apareceram nos relatórios do `mods_mixed.lua` e que já existem, em grande parte, nos stubs atuais.

## Critério usado

- Prioridade alta: APIs muito repetidas no `mods_mixed.lua`, como criação de item, textura, cor, shop, personalidade, diálogo, room override, popup e coroutine.
- Prioridade média: APIs menos frequentes, mas importantes para padrões reais de mod.
- Pendência: chamadas detectadas nos mods, mas não encontradas claramente nos stubs atuais; devem ser confirmadas no dump antes de virar stub oficial.
- Os comentários abaixo evitam copiar diálogos ou conteúdo de mods; descrevem apenas comportamento de API e padrões de uso.

## Checklist por arquivo

| Arquivo alvo | O que adicionar/melhorar |
|---|---|
| `mdrg_globals.d.lua` | Comentário de `CurrentModGuid`. |
| `mdrg_game.d.lua` | `ModUtilities`, `GameUtilities`, `GameVariables`, `Live2DControllerSingleton`. |
| `mdrg_items.d.lua` | `ItemPrefab`, `Item`, `ColorSlot`, `ColorPalette`, `SlotEquipData`, `SusModifier`, dados de comida/peixe/modificadores. |
| `mdrg_story.d.lua` | `StoryBotDialogueBranch`, `StoryBotDialogueBranchContainer`, `StoryCondition`. |
| `mdrg_ui.d.lua` | `UiOverlay` e popups usados por itens. |
| `mdrg_unity.d.lua` | `TextureOverriderManager`, especialmente `RoomManager`. |
| `mdrg_enums.d.lua` | Comentários para enums usados em mods e aliases auxiliares de strings descobertas. |

---

# 1. `mdrg_globals.d.lua`

```lua
---Guid do mod cuja janela/script Lua está executando agora.
---Use esse valor como primeiro argumento em chamadas de assets e registro de item,
---por exemplo `ModUtilities.GetPackedTexture(CurrentModGuid, path)` e
---`ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, prefab)`.
---@type Guid
CurrentModGuid = CurrentModGuid
```

---

# 2. `mdrg_game.d.lua` — `ModUtilities`

## Comentário de classe

```lua
---Helper global exposto para scripts Lua de mods.
---Centraliza criação/registro de itens, carregamento de assets do pacote do mod,
---adição de itens a lojas, criação de personality modules, acesso a controllers
---Live2D e utilidades de coroutine do runtime MoonSharp.
---
---Padrão mais comum observado:
---1. criar `ItemPrefab`;
---2. preencher campos como `Name`, `Price`, `Category`, `ColorSlots`;
---3. anexar texturas com `ItemPrefab.AddTexture(...)`;
---4. registrar com `CreateNewItemAutoAssignId(CurrentModGuid, prefab)`;
---5. adicionar a uma loja com `AddSingleBuyItemToShop(...)` ou `AddGenericItemToShop(...)`.
---@class ModUtilities: SingletonMonoBehaviour_ModUtilities_
ModUtilities = {}
```

## Criação e registro de item

```lua
---Cria um `ItemPrefab` vazio para ser configurado via atribuição de campos.
---É o ponto de partida mais comum para criar roupas, módulos, itens de quarto,
---consumíveis, comida, peixe, pacotes e outros itens de mod.
---
---Depois de preencher o prefab, registre com `CreateNewItemAutoAssignId` ou
---`CreateNewItem` para receber um `GameId` utilizável em shops e referências.
---@return ItemPrefab
function ModUtilities.CreateItemPrefab() end

---Registra um `ItemPrefab` como item do mod atual e gera automaticamente um `GameId`.
---Use normalmente com `CurrentModGuid`.
---
---O `GameId` retornado é o identificador que deve ser passado para lojas,
---sets, pairs, personality modules e outras APIs que referenciam itens.
---@param modGuid Guid Guid do mod, normalmente `CurrentModGuid`.
---@param itemPrefab ItemPrefab Prefab já configurado.
---@return GameId itemId Identificador gerado para o item registrado.
function ModUtilities.CreateNewItemAutoAssignId(modGuid, itemPrefab) end

---Registra um `ItemPrefab` usando um id explícito ou usando overload equivalente ao auto assign.
---Prefira `CreateNewItemAutoAssignId` quando não precisar controlar manualmente o id.
---@param modGuid Guid
---@param itemPrefab ItemPrefab
---@return GameId
function ModUtilities.CreateNewItem(modGuid, itemPrefab) end
```

## Shops

```lua
---Adiciona um item registrado a uma loja como compra única.
---Usado principalmente para itens que aparecem uma vez para compra.
---
---`shopId` é uma string de loja. IDs observados nos mods incluem:
---`"clothier"`, `"ladyparts.ic"`, `"grocery"`, `"pharmacy"` e `"richpeopleshop"`.
---
---`availabilityFunc`, quando fornecida, deve retornar `true` quando o item puder aparecer.
---`occurenceRate`, quando fornecido, controla chance/peso de ocorrência conforme a loja.
---@param shopId string Identificador textual da loja.
---@param gameId GameId Item registrado.
---@param availabilityFunc? fun(): boolean Condição opcional de disponibilidade.
---@param occurenceRate? number Peso/chance opcional de ocorrência.
function ModUtilities.AddSingleBuyItemToShop(shopId, gameId, availabilityFunc, occurenceRate) end

---Adiciona um item registrado a uma loja como item genérico/recomprável.
---Usado com mais frequência para consumíveis, farmácia, mercado e itens que podem reaparecer.
---@param shopId string Identificador textual da loja.
---@param gameId GameId Item registrado.
---@param availabilityFunc? fun(): boolean Condição opcional de disponibilidade.
---@param occurenceRate? number Peso/chance opcional de ocorrência.
function ModUtilities.AddGenericItemToShop(shopId, gameId, availabilityFunc, occurenceRate) end
```

## Assets do mod

```lua
---Retorna um arquivo empacotado do mod pelo caminho relativo dentro do pacote.
---Use normalmente caminhos iniciados por `/`, como `"/folder/file.ext"`.
---@param modGuid Guid Normalmente `CurrentModGuid`.
---@param path string Caminho relativo do asset dentro do mod.
---@return ModFileBase
function ModUtilities.GetModFile(modGuid, path) end

---Carrega um pacote de texturas a partir de um asset do mod.
---É a chamada de asset mais comum nos mods analisados e geralmente alimenta
---`ItemPrefab.AddTexture(...)`.
---
---Padrão comum:
---```lua
---local tex = ModUtilities.GetPackedTexture(CurrentModGuid, "/item/texture.json")
---prefab.AddTexture(tex)
---```
---@param modGuid Guid Normalmente `CurrentModGuid`.
---@param formatPath string Caminho do asset de textura empacotada, frequentemente `.json`.
---@return PackedTexturesContainer
function ModUtilities.GetPackedTexture(modGuid, formatPath) end

---Carrega uma textura 2D diretamente do pacote do mod.
---Use quando precisar de `Texture2D`, não de referência/pacote de textura.
---@param modGuid Guid
---@param path string
---@return Texture2D
function ModUtilities.GetTexture(modGuid, path) end

---Retorna uma referência automática para uma textura do mod.
---Útil quando a API espera `IReference`/referência serializável em vez do asset carregado.
---@param modGuid Guid
---@param path string
---@return Texture2DModFileAutomaticReference
function ModUtilities.GetTextureReference(modGuid, path) end

---Carrega um sprite diretamente do pacote do mod.
---Usado em ícones, overlays e substituições visuais quando a API espera `Sprite`.
---@param modGuid Guid
---@param path string
---@param ppu? number Pixels por unidade opcional.
---@return Sprite
function ModUtilities.GetSprite(modGuid, path, ppu) end

---Retorna uma referência para sprite do pacote do mod.
---Muito usado com `TextureOverriderManager.RoomManager.SetSprite/RestoreSprite`,
---porque room overrides normalmente usam referências (`IReference`).
---@param modGuid Guid
---@param path string
---@param ppu? number Pixels por unidade opcional.
---@return IReference
function ModUtilities.GetSpriteReference(modGuid, path, ppu) end

---Carrega um asset como referência de sprite.
---Nos mods analisados aparece principalmente para ícones e overlays de quarto.
---@param modGuid Guid
---@param path string
---@param ppu? number Pixels por unidade opcional.
---@return IReference
function ModUtilities.GetAsSprite(modGuid, path, ppu) end
```

## Personality modules e controllers

```lua
---Cria uma definição Lua de personality module.
---Scripts costumam chamar `PrepareContainer(...)` nessa definição para adicionar branches
---de diálogo, e depois anexar a um item com `ItemPrefab.TurnIntoPersonalityModule(...)`.
---@return LuaPersonalityModuleDefinition
function ModUtilities.PrepareNewPersonalityDefinition() end

---Retorna o controller padrão da cena missionary.
---Use com `ItemPrefab.AddTexture(controller, packedTexture)` quando a textura deve valer
---somente para esse controller/cena.
---@return ControllerEnum
function ModUtilities.GetMissionaryController() end

---Retorna o controller padrão da cena doggy.
---@return ControllerEnum
function ModUtilities.GetDoggyController() end

---Retorna o controller padrão de interação.
---@return ControllerEnum
function ModUtilities.GetInteractController() end

---Retorna um controller por id textual.
---IDs observados nos mods incluem `"interaction"`, `"missionary"`, `"doggy"`,
---`"cowgirl"` e outros controllers de cena disponíveis no jogo.
---@param id string Id textual do controller.
---@return ControllerEnum
function ModUtilities.GetController(id) end
```

## Coroutines

```lua
---Inicia uma coroutine gerenciada a partir de uma closure Lua/MoonSharp.
---Use para rotinas que precisam esperar tempo ou executar atualizações assíncronas no runtime.
---A closure pode usar `coroutine.yield(ModUtilities.WaitForSeconds(seconds))`.
---@param closure function Função que será executada como coroutine.
---@param onFinished? fun() Callback opcional ao finalizar.
---@return ManagedCoroutineWithTarget
function ModUtilities.StartCoroutine(closure, onFinished) end

---Cria uma instrução de espera para ser usada com `coroutine.yield` dentro de coroutine.
---Padrão observado:
---```lua
---coroutine.yield(ModUtilities.WaitForSeconds(1.0))
---```
---@param seconds number Tempo em segundos.
---@return WaitForSeconds
function ModUtilities.WaitForSeconds(seconds) end

---Para uma coroutine iniciada por `ModUtilities.StartCoroutine`.
---@param coroutine ManagedCoroutineWithTarget Coroutine retornada por `StartCoroutine`.
function ModUtilities.StopCoroutine(coroutine) end

---Retorna o objeto global de variáveis do jogo.
---Em muitos scripts, campos também aparecem acessados diretamente via `GameVariables.Current`
---ou singleton equivalente; prefira a forma confirmada pelos stubs atuais.
---@return GameVariables
function ModUtilities.GetGameVariables() end
```

---

# 3. `mdrg_game.d.lua` — `GameUtilities`, `GameVariables`, `Live2DControllerSingleton`

```lua
---Cria uma instrução de espera para coroutines.
---Funciona como alternativa utilitária a `ModUtilities.WaitForSeconds` quando disponível.
---@param seconds number Tempo em segundos.
---@return WaitForSeconds
function GameUtilities.WaitForSecondsYield(seconds) end
```

## Campos de `GameVariables` mais relevantes em mods

```lua
---@class GameVariables
---@field money integer Dinheiro atual do jogador/salvamento.
---@field maxMoney integer Limite ou referência máxima de dinheiro quando usado pelo sistema.
---@field casinoTokens integer Tokens de cassino disponíveis.
---@field RemainingCum number Quantidade restante do recurso interno de cum.
---@field MaxCum number Capacidade máxima do recurso interno de cum.
---@field Stamina number Energia/stamina atual.
---@field IsOutOfStamina boolean `true` quando stamina está esgotada.
---@field Satiation number Saciedade/fome atual.
---@field MentalHealth number Estado mental efetivo atual.
---@field MentalHealthTemporary number Modificador temporário de saúde mental.
---@field Health number Vida/saúde atual.
---@field lust integer Valor de desejo/libido usado por diálogos e condições.
---@field sympathy integer Simpatia/afinidade usada por diálogos e condições.
---@field Longing number Saudade/longing usado por mood e diálogos.
---@field Mood number Humor atual.
```

```lua
---Consome/retira o recurso interno acumulado e retorna a quantidade extraída.
---@return number
function GameVariables.ExtractCumFromBalls() end

---Retorna o percentual atual do recurso interno relativo ao máximo.
---@return number
function GameVariables.GetCumPercent() end

---Tenta gastar dinheiro. Deve retornar falso quando não há dinheiro suficiente.
---@param amount integer
---@return boolean
function GameVariables.TryTakeMoney(amount) end

---Remove dinheiro sem checar se a operação é possível.
---@param amount integer
---@type fun(amount: integer)
GameVariables.ForceTakeMoney = GameVariables.ForceTakeMoney

---Adiciona dinheiro ao estado atual.
---@param amount integer
function GameVariables.AddMoney(amount) end
```

```lua
---Força atualização de todas as texturas Live2D instanciadas.
---Aparece em scripts que alteram textura/cor em runtime e precisam refletir a mudança
---imediatamente nos controllers ativos.
function Live2DControllerSingleton.UpdateAllTextures() end
```

---

# 4. `mdrg_items.d.lua` — `ItemPrefab`

## Comentário de classe e campos usados

```lua
---Definição de um item antes de ser registrado no jogo.
---Scripts de mod normalmente criam um prefab, preenchem campos públicos,
---adicionam texturas/dados opcionais e então registram o item com `ModUtilities`.
---
---Campos legados como `PossibleEquipmentSlots`, `RequiredSlots`, `ForbiddenSlots`
---e `OverrideIcon` ainda aparecem em mods antigos, mas os stubs atuais indicam
---preferência por `SlotData` e `OverrideIconReference` quando possível.
---@class ItemPrefab
---@field Name string Nome exibido do item.
---@field Description string Descrição exibida do item.
---@field Price integer Preço base em shops.
---@field Category ItemCategory Categoria principal usada por inventário, lojas e UI.
---@field SubCategory ItemSubCategory Subcategoria opcional quando disponível.
---@field IsIllegal boolean Marca item como ilegal para sistemas que checam contrabando/suspeita.
---@field CanChangeColor boolean Permite alteração de cor pelo sistema de color slots.
---@field HasQuality boolean Indica se o item usa qualidade/estado de conservação.
---@field IsStackable boolean Indica se múltiplas unidades podem empilhar.
---@field ThrowingOutForbidden boolean Impede descarte quando verdadeiro.
---@field IsPersonalityModule boolean Marcado automaticamente/manualmente para itens de personality module.
---@field ColorSlots ColorSlot[] Slots de cor disponíveis para customização.
---@field ScratchType ScratchTextureType Tipo de scratch/rasgo usado por textura/equipamento.
---@field SusModifiers SusModifier[] Cobertura/suspeita por área corporal.
---@field Partners string[] Parceiros/autores associados ao item.
---@field SlotData SlotEquipData Dados modernos de slot/equipamento.
---@field PossibleEquipmentSlots string[] Campo legado com slots onde o item pode equipar.
---@field RequiredSlots string[] Campo legado com slots exigidos.
---@field ForbiddenSlots string[] Campo legado com slots proibidos.
---@field OverrideIcon Sprite Campo legado de ícone. Prefira `OverrideIconReference`.
---@field OverrideIconReference IReference Referência de ícone do item.
---@field SpecialEffectAction fun(value: boolean, item: Item) Callback chamado ao ativar/desativar efeito especial do item.
---@field OnUse fun(item: Item): boolean Callback de uso de consumível/item utilizável.
---@field ControllerElementOverrides string[][] Overrides de elementos por controller.
---@field FishData FishItemPrefabData Dados específicos de peixe.
---@field EdibleData EdibleItemPrefabData Dados específicos de comida/consumível com nutrição.
---@field AllowedModifiersData AllowedModifiers Modificadores permitidos para o item.
---@field ItemModifiableVariables ItemModifiableVariable[] Variáveis customizáveis do item.
---@field ItemModifiableVariablesRequirements ItemModifiableVariablesRequirement[] Regras para variáveis modificáveis.
```

## Métodos de textura e visual

```lua
---Anexa textura empacotada ao prefab.
---Forma mais comum:
---```lua
---prefab.AddTexture(ModUtilities.GetPackedTexture(CurrentModGuid, "/path/file.json"))
---```
---
---Também pode receber um controller alvo:
---```lua
---prefab.AddTexture(ModUtilities.GetController("interaction"), packed)
---```
---Nesse caso a textura fica associada ao controller/cena informado.
---@param holder SpecialTextureHolder|PackedTexturesContainer|ControllerEnum
---@return ItemPrefab self Permite encadeamento em alguns padrões.
function ItemPrefab.AddTexture(holder) end

---Define slots de cor padrão do prefab.
---Pode receber uma lista de `ColorSlot`, uma lista de nomes, ou quantidade/paleta conforme overload.
---@param colorSlots ColorSlot[]|string[]|integer
---@return ItemPrefab
function ItemPrefab.SetDefaultColorSlots(colorSlots) end

---Adiciona cobertura/suspeita para uma área do corpo.
---Equivalente prático a adicionar `SusModifier.CreateInstance(area, cover)` em `SusModifiers`.
---@param area SusArea Área afetada.
---@param cover number Fração/percentual de cobertura.
---@return ItemPrefab
function ItemPrefab.AddSusModifier(area, cover) end
```

## Sets, pares e personality modules

```lua
---Registra relação de par entre dois itens.
---Usado em mods para itens que funcionam como conjunto de duas partes ou par visual.
---@param i1 GameId Primeiro item.
---@param i2 GameId Segundo item.
---@param registerAsMatching? boolean Quando disponível, registra os itens como correspondentes.
---@return ItemPrefab
function ItemPrefab.MakePair(i1, i2, registerAsMatching) end

---Registra um conjunto de itens relacionados.
---Usado para agrupar variações/partes de um mesmo set.
---@param id GameId[] Lista de ids registrados.
---@return ItemPrefab
function ItemPrefab.MakeSet(id) end

---Transforma o prefab registrado em um personality module.
---O `id` deve ser o `GameId` retornado pelo registro do item.
---A definição de personalidade geralmente vem de `ModUtilities.PrepareNewPersonalityDefinition()`
---e recebe containers/branches antes de ser anexada.
---@param id GameId GameId do item registrado.
---@param personalityDefinition PersonalityModuleDefinition Definição de personalidade configurada.
function ItemPrefab.TurnIntoPersonalityModule(id, personalityDefinition) end
```

## Callbacks de `ItemPrefab`

```lua
---Callback chamado quando o item é usado pelo jogador/UI.
---Muito comum em consumíveis. Retorne `true` quando o uso deve ser considerado bem-sucedido
---e o sistema puder aplicar consumo/efeitos esperados.
---@alias ItemOnUseCallback fun(item: Item): boolean

---Callback chamado quando um efeito especial do item deve ser ativado ou desativado.
---`value == true` geralmente indica aplicar o efeito; `false` indica restaurar/desligar.
---Padrão típico: verificar `item.IsEquipped()` e trocar/restaurar sprite do quarto.
---@alias ItemSpecialEffectCallback fun(value: boolean, item: Item)

---Callback opcional executado após geração/processamento de item aleatório.
---@alias ItemRandomPostProcessingCallback fun(item: Item)
```

---

# 5. `mdrg_items.d.lua` — `Item`

```lua
---Instância runtime de um item no inventário/equipamento.
---Diferente de `ItemPrefab`, que descreve o item antes/depois do registro.
---@class Item
```

```lua
---Retorna a quantidade empilhada desse item.
---Usado com frequência em callbacks `OnUse` para mostrar mensagens ou aplicar consumo.
---@return integer
function Item.GetCount() end

---Define a quantidade empilhada desse item.
---@param count integer
function Item.SetCount(count) end

---Retorna um Guid único da instância do item.
---Útil para efeitos visuais que precisam ser escopados por item, como room sprite overrides.
---@return Guid
function Item.GetUniqueGuid() end

---Retorna o Guid original/fonte quando o item é clone/derivado, ou o próprio Guid caso contrário.
---@return Guid
function Item.GetSourceOrThisUniqueGuid() end

---Checa se a instância está equipada no momento.
---Muito usado por callbacks de `SpecialEffectAction` antes de aplicar/restaurar efeitos.
---@return boolean
function Item.IsEquipped() end

---Chama manualmente o `SpecialEffectAction` do prefab associado.
---@param value boolean
function Item.CallSpecialEffectsAction(value) end

---Retorna o `ItemPrefab` associado a esta instância.
---@return ItemPrefab
function Item.GetItemPrefab() end

---Obtém uma cor configurada no item pelo índice de color slot.
---@param index integer
---@return Color
function Item.GetColor(index) end

---Define uma cor no item pelo índice de color slot.
---@param index integer
---@param color Color
function Item.SetColor(index, color) end

---Retorna a cor principal do item.
---@return Color
function Item.GetMainColor() end
```

## Pendências vistas nos mods, mas não confirmadas nos stubs atuais

Estas chamadas apareceram no relatório como uso real ou legado, mas não foram encontradas claramente nos stubs enviados. Não adicionar como oficial sem confirmar no dump atual.

```lua
---PENDENTE: detectado em scripts antigos/legados; confirmar nome exato no dump.
---Lê a cor principal armazenada em additional data da instância de item.
---@param item Item
---@return Color
-- function Item.GetMainColorFromAdditionalData(item) end

---PENDENTE: detectado em scripts antigos/legados; confirmar nome exato no dump.
---Escreve uma cor em additional data associada a um color slot.
---@param item Item
---@param slotId string
---@param color Color
-- function Item.SetColorIntoAdditionalData(item, slotId, color) end
```

---

# 6. `mdrg_items.d.lua` — cor, paletas e slots

```lua
---Paleta de cores usada por `ColorSlot`.
---@class ColorPalette
---@field Entries ColorPaletteEntry[] Cores disponíveis na paleta.
---@field Id string Id interno da paleta.
---@field Name string Nome da paleta.
```

```lua
---Cria uma paleta de cores customizada.
---Aparece em mods mais avançados que definem suas próprias entradas de cor.
---@param id string Id interno da paleta.
---@param name string Nome exibido/lógico da paleta.
---@param entries ColorPaletteEntry[] Entradas de cor.
---@return ColorPalette
function ColorPalette.CreateInstance(id, name, entries) end
```

```lua
---Entrada individual de uma paleta de cor.
---@class ColorPaletteEntry
---@field Color Color32 Cor armazenada.
```

```lua
---Cria uma entrada de paleta a partir de string.
---Útil para reconstruir cores serializadas em formato textual usado por scripts/exportadores.
---@param str string Representação textual da cor/entrada.
---@return ColorPaletteEntry
function ColorPaletteEntry.CreateInstanceFromString(str) end
```

```lua
---Gerenciador global de paletas de cor.
---Nos mods analisados, a chamada mais comum é `GetColorPaletteByName` para criar `ColorSlot`.
---@class ColorPaletteManager
```

```lua
---Busca uma paleta por nome.
---Paletas observadas em uso real incluem `"partpalette"`, `"grayscalepalette"`
---e `"skinpalette"`. A disponibilidade final depende da versão do jogo/dump.
---@param name string Nome/id textual da paleta.
---@return ColorPalette
function ColorPaletteManager.GetColorPaletteByName(name) end
```

```lua
---Slot de cor customizável de um item.
---O nome do slot é o rótulo lógico/visual; a paleta define quais cores são aceitas.
---@class ColorSlot
---@field Name string Nome do slot, por exemplo `"Main Color"`.
---@field Palette ColorPalette Paleta associada.
```

```lua
---Cria um slot de cor.
---Padrão observado:
---```lua
---ColorSlot.CreateInstance("Main Color", ColorPaletteManager.GetColorPaletteByName("partpalette"))
---```
---@param name string Nome/rótulo do slot.
---@param palette? ColorPalette Paleta opcional conforme overload.
---@return ColorSlot
function ColorSlot.CreateInstance(name, palette) end
```

---

# 7. `mdrg_items.d.lua` — slot, suspeita, comida e peixe

```lua
---Dados modernos de equipamento/slot para `ItemPrefab`.
---Preferível aos campos legados `PossibleEquipmentSlots`, `RequiredSlots` e `ForbiddenSlots`
---quando o stub/API atual permitir.
---@class SlotEquipData
```

```lua
---Cria dados de equipamento para um slot textual.
---Slots observados em mods incluem cabelo, acessórios, roupa, quarto e partes de corpo.
---@param slotString string Id textual do slot.
---@return SlotEquipData
function SlotEquipData.CreateInstance(slotString) end

---Define a lista de slots obrigatórios para equipar o item.
---@param requiredSlots string[]
function SlotEquipData.SetRequiredSlotsString(requiredSlots) end

---Define a lista de slots proibidos/incompatíveis para equipar o item.
---@param forbiddenSlots string[]
function SlotEquipData.SetForbiddenSlotsString(forbiddenSlots) end
```

```lua
---Modificador de cobertura/suspeita por área.
---Usado em `ItemPrefab.SusModifiers` para dizer quanto uma área fica coberta/alterada.
---@class SusModifier
---@field Area SusArea Área afetada.
---@field CoverPercentage number Fração/percentual de cobertura.
```

```lua
---Cria um modificador de suspeita/cobertura para uma área.
---@param area SusArea Área afetada, como `SusArea.Skin` ou `SusArea.UpperBody`.
---@param coverPercentage number Valor de cobertura.
---@return SusModifier
function SusModifier.CreateInstance(area, coverPercentage) end
```

```lua
---Dados específicos para item comestível/consumível.
---@class EdibleItemPrefabData
---@field EdibleType EdibleTypeEnum Tipo de alimento.
---@field NutritionProfileFiller fun(item: Item, profile: EdibleItemNutritionProfile) Função que preenche efeitos nutricionais.
```

```lua
---Cria dados de item comestível.
---Use em `ItemPrefab.EdibleData` para itens de comida, bebida ou consumíveis nutricionais.
---@param edibleTypeEnum EdibleTypeEnum Tipo de alimento.
---@param getNutritionProfile fun(item: Item, profile: EdibleItemNutritionProfile) Função que preenche o perfil nutricional.
---@return EdibleItemPrefabData
function EdibleItemPrefabData.CreateInstance(edibleTypeEnum, getNutritionProfile) end
```

```lua
---Dados específicos para item de peixe.
---@class FishItemPrefabData
---@field AverageWeightKg number Peso médio.
---@field SizeDistribution01 number Distribuição/tendência de tamanho.
---@field MaxWeightKg number Peso máximo.
---@field StrengthMultiplier number Multiplicador de força no minigame.
---@field BehaviourType FishingCatchBehaviourType Comportamento do peixe.
---@field FishPreferences FishPreferences Preferências de isca/local.
```

```lua
---Cria dados de peixe.
---Use em `ItemPrefab.FishData` para itens da categoria `ItemCategory.Fish`.
---@return FishItemPrefabData
function FishItemPrefabData.CreateInstance() end
```

---

# 8. `mdrg_story.d.lua` — diálogos, personality module e condições

```lua
---Definição Lua de personality module.
---Scripts criam uma instância com `ModUtilities.PrepareNewPersonalityDefinition()`,
---preparam containers por tag/evento e adicionam branches de diálogo.
---@class LuaPersonalityModuleDefinition: PersonalityModuleDefinition
```

```lua
---Obtém ou cria um container de diálogo/evento dentro de uma personality definition.
---`tagId` é a chave textual do container. `stageNr`, quando usado, diferencia estágio/variação.
---
---Padrão observado:
---```lua
---local personality = ModUtilities.PrepareNewPersonalityDefinition()
---personality.PrepareContainer("Interact_Greeting").AddBranch(branch)
---```
---@param tagId string Chave textual do container/evento.
---@param stageNr? integer Estágio opcional.
---@return StoryBotDialogueBranchContainer
function LuaPersonalityModuleDefinition.PrepareContainer(tagId, stageNr) end
```

```lua
---Branch individual de diálogo do story bot.
---Em scripts Lua de mod, aparece frequentemente criada a partir de texto, guid do mod e índice.
---@class StoryBotDialogueBranch
```

```lua
---Cria uma branch de diálogo.
---Overload observada em mods:
---```lua
---StoryBotDialogueBranch.__new(text, CurrentModGuid, index)
---```
---O stub atual também expõe overloads por `GameId`/`StoryBranchTarget`.
---@param id GameId|string Texto ou id, conforme overload disponível.
---@param branchTarget StoryBranchTarget|Guid Alvo ou guid do mod, conforme overload.
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.__new(id, branchTarget) end

---Define uma ação Lua executada quando a branch é ativada.
---@param action fun()
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.SetOnActivateAction(action) end

---Define peso/probabilidade da branch ser escolhida.
---@param odds number
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.SetOdds(odds) end

---Marca a branch como one-time/uso único.
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.MarkOneTime() end

---Define prioridade da branch em relação a outras candidatas.
---@param i integer
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.SetPriority(i) end

---Adiciona condições adicionais para a branch poder ocorrer.
---@param addedAdditionalConditions StoryCondition[]
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.AddConditions(addedAdditionalConditions) end
```

```lua
---Container de branches de diálogo para uma tag/evento.
---@class StoryBotDialogueBranchContainer
---@field SourceTag StoryBotDialogueTag Tag/evento associado.
---@field BranchCount integer Quantidade de branches.
---@field AllBranches StoryBotDialogueBranch[] Branches registradas.
```

```lua
---Adiciona uma branch ao container e retorna o próprio container.
---Padrão comum logo após `PrepareContainer(...)`.
---@param branch StoryBotDialogueBranch
---@return StoryBotDialogueBranchContainer
function StoryBotDialogueBranchContainer.AddBranch(branch) end

---Define condições globais do container.
---@param newConditions StoryCondition[]
function StoryBotDialogueBranchContainer.SetConditions(newConditions) end

---Retorna se as condições globais do container passam no momento atual.
---@return boolean
function StoryBotDialogueBranchContainer.ConditionsMet() end
```

```lua
---Cria uma condição de história a partir de função Lua.
---Use para disponibilidade dinâmica de dialogue branches/containers.
---@param condition fun(): boolean Função que retorna `true` quando a condição passa.
---@param negate? boolean Inverte o resultado quando verdadeiro.
---@return DelegateCondition
function StoryCondition.Delegate(condition, negate) end

---Cria uma condição de história a partir de código Lua em string.
---Mais flexível, porém mais frágil que `Delegate` para autocomplete e refactor.
---@param conditionCode string Código Lua que será compilado pelo runtime.
---@param negate? boolean Inverte o resultado quando verdadeiro.
---@return LuaStoryCondition
function StoryCondition.Lua(conditionCode, negate) end
```

---

# 9. `mdrg_ui.d.lua` — `UiOverlay`

```lua
---Gerenciador de overlays/popups de UI.
---Mods analisados usam principalmente popups simples para feedback de `OnUse`.
---@class UiOverlay: UIManager
```

```lua
---Fecha o overlay de UI atualmente aberto, quando houver.
---Usado antes de abrir outro popup ou depois de ações de item.
function UiOverlay.CloseUiOverlay() end

---Mostra um popup simples com botão OK.
---Usado com frequência por itens consumíveis/debug para explicar efeito ou erro.
---@param title string Título do popup.
---@param text string Texto principal.
---@param okaction? fun() Callback opcional ao confirmar.
function UiOverlay.OkPopup(title, text, okaction) end

---Mostra popup de erro com botão OK.
---@param text string Texto de erro.
---@param okaction? fun()
function UiOverlay.OkPopupError(text, okaction) end

---Mostra popup de sucesso com botão OK.
---@param text string Texto de sucesso.
---@param okaction? fun()
function UiOverlay.OkPopupSuccess(text, okaction) end

---Mostra popup de aviso com botão OK.
---@param text string Texto de aviso.
---@param okaction? fun()
function UiOverlay.OkPopupWarning(text, okaction) end
```

---

# 10. `mdrg_unity.d.lua` — `TextureOverriderManager`

```lua
---Gerencia substituições temporárias de sprites/texturas por alvo.
---Nos mods analisados, `TextureOverriderManager.RoomManager` é usado para trocar
---sprites do quarto quando um item está equipado/ativo, e restaurar ao desativar.
---@class TextureOverriderManager: MonoBehaviour
---@field RoomManager TextureOverriderManager Manager de overrides do quarto.
---@field ClothierManager TextureOverriderManager Manager de overrides do clothier quando disponível.
```

```lua
---Constrói um callback compatível com `ItemPrefab.SpecialEffectAction`.
---Útil quando um item deve trocar automaticamente um sprite alvo enquanto estiver ativo.
---@param targetId string Id/path do sprite alvo, por exemplo um path dentro de `/Room/...`.
---@param sprite IReference Referência do sprite substituto.
---@return fun(value: boolean, item: Item)
function TextureOverriderManager.GetSpecialEffectsAction(targetId, sprite) end

---Aplica/substitui um sprite alvo por uma referência de sprite do mod.
---Quando chamado em `RoomManager`, `targetId` normalmente é um path de room sprite.
---@param targetId string Id/path do alvo.
---@param sprite IReference Sprite substituto.
function TextureOverriderManager.SetSprite(targetId, sprite) end

---Restaura o sprite alvo para o estado anterior/original.
---Use no ramo `false` de `SpecialEffectAction` ou quando o item deixar de estar equipado.
---@param targetId string Id/path do alvo.
---@param sprite? IReference Sprite usado na substituição, quando a overload exigir.
function TextureOverriderManager.RestoreSprite(targetId, sprite) end

---Remove/restaura todos os overrides controlados por esse manager.
function TextureOverriderManager.RestoreAll() end
```

## Padrão recomendado para item de quarto

```lua
---Exemplo de padrão documentável para `SpecialEffectAction` de room item.
---Não é uma API nova; é apenas o padrão visto repetidamente nos mods.
---@param value boolean
---@param item Item
local function RoomItemSpecialEffect(value, item)
  if item.IsEquipped() and value then
    TextureOverriderManager.RoomManager.SetSprite(
      "/Room/SomeTarget",
      ModUtilities.GetSpriteReference(CurrentModGuid, "/sprites/some_target.png")
    )
  else
    TextureOverriderManager.RoomManager.RestoreSprite("/Room/SomeTarget")
  end
end
```

---

# 11. `mdrg_enums.d.lua` — enums e aliases úteis

## Comentários para enums já existentes

```lua
---Categoria principal de um `ItemPrefab`.
---Categorias mais observadas em mods: `Modules`, `Clothing`, `Room`, `Other`, `Meds`,
---`Food`, `Fish`, `Usable`, `FishingTrash`, `AnonEquip` e `Package`.
---@alias ItemCategory
---| '"Other"'
---| '"Modules"'
---| '"Clothing"'
---| '"Food"'
---| '"FoodCookedDish"'
---| '"Usable"'
---| '"Package"'
---| '"Meds"'
---| '"Room"'
---| '"AnonEquip"'
---| '"Fish"'
---| '"CookingIngredient"'
---| '"FishingTrash"'
---| '"Soap"'
```

```lua
---Tipo de scratch/rasgo usado por texturas de itens.
---Nos mods analisados, `Universal` foi muito mais comum que `Hard`.
---@alias ScratchTextureType
---| '"Universal"'
---| '"Hard"'
```

```lua
---Área usada por `SusModifier` para definir cobertura/suspeita.
---@alias SusArea
---| '"ArmL"'
---| '"ArmR"'
---| '"LegL"'
---| '"LegR"'
---| '"UpperBody"'
---| '"Boobs"'
---| '"LowerBody"'
---| '"Pussy"'
---| '"Skin"'
```

## Aliases auxiliares descobertos nos mods

Esses aliases não precisam substituir os enums oficiais. Eles podem entrar em um arquivo auxiliar, por exemplo `mdrg_usage_ids.d.lua`, para melhorar autocomplete de strings reais observadas.

```lua
---@alias MdrgKnownShopId
---| '"clothier"'        # Loja de roupas; a mais comum nos mods analisados.
---| '"ladyparts.ic"'    # Loja/site usado por módulos e itens específicos.
---| '"grocery"'         # Mercado; comum para comida/consumíveis.
---| '"pharmacy"'        # Farmácia; comum para remédios/consumíveis.
---| '"richpeopleshop"'  # Loja rara observada uma vez.
```

```lua
---@alias MdrgKnownControllerId
---| '"interaction"'
---| '"missionary"'
---| '"doggy"'
---| '"cowgirl"'
---| '"blowjob"'
```

```lua
---@alias MdrgKnownPaletteName
---| '"partpalette"'
---| '"grayscalepalette"'
---| '"skinpalette"'
```

```lua
---@alias MdrgKnownCommonColorSlotName
---| '"Main Color"'
---| '"Main color"'
---| '"main"'
---| '"Secondary Color"'
---| '"Secondary color"'
---| '"Skin color"'
---| '"Eye Color"'
---| '"Left iris"'
---| '"Right iris"'
---| '"Sclera"'
---| '"Glow color"'
```

```lua
---@alias MdrgKnownEquipmentSlotId
---| '"HairMain"'
---| '"Back hair"'
---| '"Hair behind ears"'
---| '"hairclip"'
---| '"Side bits"'
---| '"StockingL"'
---| '"StockingR"'
---| '"Horns"'
---| '"ShoeL"'
---| '"ShoeR"'
---| '"Hairfront"'
---| '"Tail"'
---| '"PersonalityModule"'
---| '"Skin"'
---| '"UpperBody"'
---| '"UpperBodyOuter"'
---| '"LowerBody"'
---| '"Panties"'
---| '"Bra"'
---| '"Room_Plush"'
---| '"Room_WallDecoration"'
---| '"Room_Mat"'
---| '"Room_TV"'
---| '"Room_TVlight"'
---| '"Room_PC"'
---| '"Room_PClight"'
---| '"Room_PCrgb"'
---| '"Room_door"'
---| '"Room_desk"'
---| '"Room_cupboard"'
---| '"Room_sofa"'
---| '"Room_bed"'
---| '"Room_win"'
```

```lua
---@alias MdrgKnownRoomSpriteTargetId
---| '"/Room/SpiderPlush"'
---| '"/Room/mat"'
---| '"/Room/Door"'
---| '"/Room/PC/PC desk"'
---| '"/Room/couch"'
---| '"/Room/back"'
---| '"/Room/Window"'
---| '"/Room/TV/TV"'
---| '"/Room/TV/TV light"'
---| '"/Room/PC/PC"'
---| '"/Room/PC/PC rgb"'
---| '"/Room/Cupboard"'
---| '"/Room/Bed"'
---| '"/Room/PC/Screen light"'
---| '"/Room/BatBanner"'
---| '"/Room/Light Multiply"'
---| '"/Room/Morning Light"'
---| '"/Room/Light"'
```

```lua
---@alias MdrgKnownDialogueContainerPrefix
---| '"Interact"'
---| '"Cuddle"'
---| '"Kissing"'
---| '"Frick"'
---| '"Cowgirl"'
---| '"Blowjob"'
```

---

# 12. Padrões documentáveis para snippets

Estes blocos não são stubs oficiais; são bons candidatos para snippets/comentários de exemplo no addon LuaLS.

## Item básico com textura e shop

```lua
---Cria, registra e adiciona um item básico a uma loja.
---Substitua paths, categoria, slots e preço conforme o item.
local prefab = ModUtilities.CreateItemPrefab()
prefab.Name = "Item Name"
prefab.Description = "Item description."
prefab.Price = 100
prefab.Category = ItemCategory.Clothing
prefab.IsIllegal = false
prefab.HasQuality = false
prefab.IsStackable = false
prefab.CanChangeColor = true
prefab.ColorSlots = {
  ColorSlot.CreateInstance(
    "Main Color",
    ColorPaletteManager.GetColorPaletteByName("partpalette")
  )
}
prefab.ScratchType = ScratchTextureType.Universal
prefab.SusModifiers = {}
prefab.PossibleEquipmentSlots = { "HairMain" }
prefab.RequiredSlots = {}

local texture = ModUtilities.GetPackedTexture(CurrentModGuid, "/path/item_texture.json")
prefab.AddTexture(texture)

local itemId = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, prefab)
ModUtilities.AddSingleBuyItemToShop("clothier", itemId)
```

## Item com textura por controller

```lua
---Anexa texturas diferentes para controllers/cenas diferentes.
local prefab = ModUtilities.CreateItemPrefab()
local interactionTexture = ModUtilities.GetPackedTexture(CurrentModGuid, "/path/interaction.json")
local doggyTexture = ModUtilities.GetPackedTexture(CurrentModGuid, "/path/doggy.json")

prefab.AddTexture(ModUtilities.GetController("interaction"), interactionTexture)
prefab.AddTexture(ModUtilities.GetController("doggy"), doggyTexture)
```

## Consumível com `OnUse`

```lua
---Callback de uso de item consumível.
---@param item Item
---@return boolean
local function OnUse(item)
  local count = item.GetCount()
  UiOverlay.OkPopup("Item used", "Stack count: " .. tostring(count))
  return true
end

local prefab = ModUtilities.CreateItemPrefab()
prefab.Category = ItemCategory.Usable
prefab.IsStackable = true
prefab.OnUse = OnUse
```

## Personality module

```lua
---Cria um item que libera/adiciona um personality module.
local personality = ModUtilities.PrepareNewPersonalityDefinition()

local branch = StoryBotDialogueBranch.__new("Dialogue text", CurrentModGuid, 0)
personality
  .PrepareContainer("Interact_Greeting")
  .AddBranch(branch)

local prefab = ModUtilities.CreateItemPrefab()
prefab.Name = "Personality Module"
prefab.Category = ItemCategory.Modules

local itemId = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, prefab)
prefab.TurnIntoPersonalityModule(itemId, personality)
ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemId)
```

## Coroutine

```lua
---Executa rotina com espera temporal no runtime MoonSharp.
local runningCoroutine

local function Coroutine()
  while true do
    coroutine.yield(ModUtilities.WaitForSeconds(1.0))
    -- lógica repetida aqui
  end
end

runningCoroutine = ModUtilities.StartCoroutine(Coroutine)

-- Depois, se necessário:
-- ModUtilities.StopCoroutine(runningCoroutine)
```

---

# 13. Coisas a evitar/documentar como alerta

```lua
---ALERTA: evite funções globais genéricas como `OnUse`, `Available`, `ChangeTV`
---sem `local`, porque vários scripts misturados usam os mesmos nomes.
---Prefira:
local function MyMod_OnUse(item)
  return true
end

---ALERTA: campos legados ainda aparecem em mods antigos.
---Quando possível, prefira `SlotData` em vez de `PossibleEquipmentSlots`/`RequiredSlots`,
---e `OverrideIconReference` em vez de `OverrideIcon`.

---ALERTA: os relatórios mostraram chamadas majoritariamente com ponto (`.`), não dois-pontos (`:`),
---mesmo para membros que semanticamente parecem métodos. Preserve a assinatura dos stubs/dump.
---Não trocar automaticamente `prefab.AddTexture(texture)` por `prefab:AddTexture(texture)`.
```

---

# 14. Pendências para confirmar no dump antes de documentar oficialmente

| Chamada detectada | Status sugerido | Motivo |
|---|---|---|
| `Item.GetMainColorFromAdditionalData` | Verificar | Detectada nos scripts, mas não apareceu claramente nos stubs enviados. |
| `Item.SetColorIntoAdditionalData` | Verificar | Detectada nos scripts, mas não apareceu claramente nos stubs enviados. |
| `fungus.luaenvironment.RunLuaFunction` | Legacy/nested | Parece acesso interno/antigo; não transformar em API pública sem confirmação. |
| `Live2DControllerSingleton.LuaInstance.UpdateAllTextures` | Parcialmente confirmado | `UpdateAllTextures` existe; verificar se `LuaInstance` é o caminho recomendado. |
| `ModUtilities.GetAsSprite` | Confirmado, mas pouco usado | Documentar como asset/reference helper, sem exagerar comportamento. |
| `TextureOverriderManager.RoomManager.*` | Confirmado via campo + métodos | Documentar como padrão de uso, mas lembrar que `RoomManager` é instância de `TextureOverriderManager`. |

---

# 15. Ordem recomendada para aplicar nos stubs

1. Adicionar comentários de `ModUtilities` primeiro. É o núcleo dos mods.
2. Melhorar `ItemPrefab` e `Item`, especialmente campos e callbacks.
3. Adicionar comentários de cor: `ColorSlot`, `ColorPaletteManager`, `ColorPaletteEntry`.
4. Documentar `LuaPersonalityModuleDefinition`, `StoryBotDialogueBranch` e `StoryCondition.Delegate`.
5. Documentar `TextureOverriderManager.RoomManager` e `UiOverlay.OkPopup`.
6. Criar um arquivo auxiliar opcional `mdrg_usage_ids.d.lua` com aliases de strings observadas.
7. Manter uma seção `PENDENTE` separada para APIs vistas em scripts antigos, mas não confirmadas no dump atual.

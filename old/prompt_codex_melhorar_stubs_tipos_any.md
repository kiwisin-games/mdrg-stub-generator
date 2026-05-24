# Prompt para Codex — Melhorar stubs LuaLS removendo tipos C# crus e reduzindo `any[]`

## Objetivo

Melhorar a qualidade dos stubs `.d.lua` do addon LuaLS do MDRG sem reestruturar todo o projeto.

O foco desta passada é apenas:

1. **Remover tipos C# crus** que vazaram para os stubs.
2. **Evitar `any[]` quando for possível inferir um tipo mais específico.**

Não altere nomes públicos sem necessidade. Não invente comportamento runtime. O objetivo é melhorar autocomplete, hover, diagnósticos e assinatura de funções no LuaLS.

---

## Escopo

Aplicar em todos os arquivos `.d.lua` da pasta `library/` e subpastas.

Arquivos esperados podem incluir nomes como:

```txt
mdrg_game.d.lua
mdrg_items.d.lua
mdrg_story.d.lua
mdrg_ui.d.lua
mdrg_unity.d.lua
mdrg_types.d.lua
mdrg_enums.d.lua
mdrg_globals.d.lua
mdrg_stdlib.d.lua
mdrg_usage.d.lua
mdrg_legacy_runtime_aliases.d.lua
```

Não modificar arquivos `.lua` reais de runtime, exemplos ou scripts do jogo, a menos que sejam stubs `.d.lua`.

---

# Parte 1 — Remover tipos C# crus

## Problema

Alguns tipos vindos do dump C#/Unity podem aparecer nos stubs em formato bruto, como:

```lua
---@param value System.String
---@return System.Boolean
---@field Items System.Collections.Generic.List`1[Item]
---@field Map System.Collections.Generic.Dictionary`2[System.String,Item]
---@param callback System.Action
---@param predicate System.Func`2[Item,System.Boolean]
```

Isso é ruim para LuaLS porque:

- o tipo não é reconhecido corretamente;
- autocomplete fica pior;
- hover fica poluído;
- o usuário do addon precisa pensar em C#, não em Lua;
- o tipo real esperado em Lua/MoonSharp é mais simples.

A tarefa é converter esses tipos para anotações LuaLS idiomáticas.

---

## Regras de conversão de tipos primitivos

Converter tipos C# primitivos para tipos LuaLS:

```txt
System.String     -> string
String            -> string
System.Boolean    -> boolean
Boolean           -> boolean
bool              -> boolean
System.Int32      -> integer
Int32             -> integer
int               -> integer
System.Int64      -> integer
Int64             -> integer
long              -> integer
System.UInt32     -> integer
UInt32            -> integer
System.UInt64     -> integer
UInt64            -> integer
System.Single     -> number
Single            -> number
float             -> number
System.Double     -> number
Double            -> number
double            -> number
System.Object     -> any
Object            -> any
object            -> any
System.Void       -> nil
Void              -> nil
```

Exemplo antes:

```lua
---@param name System.String
---@param count System.Int32
---@param enabled System.Boolean
---@return System.Single
function Example.DoThing(name, count, enabled) end
```

Depois:

```lua
---@param name string
---@param count integer
---@param enabled boolean
---@return number
function Example.DoThing(name, count, enabled) end
```

---

## Regras de conversão para arrays e listas

Converter coleções C# para arrays LuaLS.

### Arrays C# simples

```txt
Item[]             -> Item[]
System.String[]    -> string[]
System.Int32[]     -> integer[]
System.Single[]    -> number[]
System.Boolean[]   -> boolean[]
```

Exemplo:

```lua
---@field Names System.String[]
```

vira:

```lua
---@field Names string[]
```

### List<T>

Converter:

```txt
System.Collections.Generic.List`1[Item]        -> Item[]
System.Collections.Generic.List<Item>          -> Item[]
List`1[Item]                                   -> Item[]
List<Item>                                     -> Item[]
```

Exemplo antes:

```lua
---@field DeliveryItems System.Collections.Generic.List`1[Item]
```

Depois:

```lua
---@field DeliveryItems Item[]
```

### IReadOnlyList<T>, ReadOnlyCollection<T>, IEnumerable<T>

Converter para array quando o uso em Lua parece ser somente leitura/enumeração:

```txt
IEnumerable<Item>             -> Item[]
System.Collections.Generic.IEnumerable`1[Item] -> Item[]
ReadOnlyCollection<Item>      -> Item[]
IReadOnlyList<Item>           -> Item[]
ICollection<Item>             -> Item[]
```

Exemplo:

```lua
---@return System.Collections.ObjectModel.ReadOnlyCollection`1[SaveSlotData]
```

vira:

```lua
---@return SaveSlotData[]
```

---

## Regras de conversão para dicionários

Converter dicionários C# para `table<K, V>`.

```txt
Dictionary<string, Item>                                 -> table<string, Item>
System.Collections.Generic.Dictionary`2[System.String,Item] -> table<string, Item>
Dictionary<GameId, number>                               -> table<GameId, number>
Dictionary<string, SerializableAutomaticReference>        -> table<string, SerializableAutomaticReference>
```

Exemplo antes:

```lua
---@field RelativePathToFirst System.Collections.Generic.Dictionary`2[System.String,SerializableAutomaticReference]
```

Depois:

```lua
---@field RelativePathToFirst table<string, SerializableAutomaticReference>
```

Exemplo antes:

```lua
---@param lottery System.Collections.Generic.Dictionary`2[GameId,System.Single]
```

Depois:

```lua
---@param lottery table<GameId, number>
```

---

## Regras para delegates C#

Converter delegates para tipos `fun(...)`.

### Action

```txt
Action                  -> fun()
System.Action           -> fun()
Action<T>               -> fun(arg1: T)
Action<T1, T2>          -> fun(arg1: T1, arg2: T2)
System.Action`1[Item]   -> fun(arg1: Item)
System.Action`2[Item,integer] -> fun(arg1: Item, arg2: integer)
```

Exemplo antes:

```lua
---@param onFinished System.Action
```

Depois:

```lua
---@param onFinished fun()
```

Exemplo antes:

```lua
---@field OnActivateAction System.Action
```

Depois:

```lua
---@field OnActivateAction fun()
```

### Func

```txt
Func<TResult>                    -> fun(): TResult
Func<T, TResult>                 -> fun(arg1: T): TResult
Func<T1, T2, TResult>            -> fun(arg1: T1, arg2: T2): TResult
System.Func`2[Item,System.Boolean] -> fun(arg1: Item): boolean
```

Exemplo antes:

```lua
---@param isUnlockedFunc System.Func`2[CookingMinigameManager,System.Boolean]
```

Depois:

```lua
---@param isUnlockedFunc fun(arg1: CookingMinigameManager): boolean
```

Exemplo antes:

```lua
---@field RuntimeDataGenerator System.Func`2[CookingSong,CookingSongRuntimeData]
```

Depois:

```lua
---@field RuntimeDataGenerator fun(arg1: CookingSong): CookingSongRuntimeData
```

---

## Regras para Nullable<T>

Converter `Nullable<T>` para união com `nil`.

```txt
System.Nullable`1[System.Int32] -> integer|nil
Nullable<int>                   -> integer|nil
System.Nullable`1[System.Single] -> number|nil
Nullable<float>                 -> number|nil
Nullable<Boolean>               -> boolean|nil
```

Exemplo:

```lua
---@param quality System.Nullable`1[System.Single]
```

vira:

```lua
---@param quality number|nil
```

Se o parâmetro for opcional, preferir:

```lua
---@param quality? number
```

---

## Regras para Tuple, ValueTuple e KeyValuePair

Quando possível, criar uma classe auxiliar nomeada. Se não houver informação suficiente, usar `table`.

### ValueTuple simples

Se o significado for conhecido:

```lua
---@class ContractSource
---@field source string
---@field index integer
```

E trocar:

```lua
---@return ValueTuple
```

por:

```lua
---@return ContractSource
```

Se não for conhecido:

```lua
---@return table
```

### KeyValuePair<K, V>

```txt
KeyValuePair<string, Item> -> table
```

Ou, se for um array de pares:

```lua
---@return table<string, Item>
```

Não inventar nomes sem evidência. Preferir `table` quando a estrutura for desconhecida.

---

## Regras para tipos Unity/C# que devem permanecer

Nem todo tipo C# deve ser convertido.

Manter tipos do domínio do jogo ou Unity quando eles representam objetos reais expostos ao Lua:

```txt
Vector2
Vector3
Color
Color32
Rect
RectInt
Texture
Texture2D
AudioClip
Transform
GameObject
MonoBehaviour
ScriptableObject
CancellationToken
UniTask
IEnumerator
DateTime
TimeSpan
Guid
StringBuilder
Regex
```

Esses tipos podem continuar como classes nos stubs.

O problema não é um tipo ter origem C#/Unity. O problema é aparecer como nome C# cru em vez de tipo LuaLS limpo.

---

## Padrão de limpeza recomendado

Implementar uma função de normalização no gerador ou em um script pós-processador.

Pseudo-algoritmo:

```txt
for each .d.lua file:
    read text
    normalize primitive types
    normalize generic List<T> to T[]
    normalize IEnumerable<T> / IReadOnlyList<T> / ReadOnlyCollection<T> to T[]
    normalize Dictionary<K,V> to table<K,V>
    normalize Action/Func delegates to fun(...)
    normalize Nullable<T> to T|nil
    write file
```

A normalização deve ser aplicada em:

```txt
---@param
---@return
---@field
---@type
---@alias
---@overload
```

---

## Checklist da Parte 1

Após a alteração, procurar por estes padrões. Idealmente nenhum deve aparecer, exceto em comentário explicativo ou nome de classe válido:

```txt
System.
Collections.Generic
Collections.ObjectModel
List`
Dictionary`
IEnumerable`
IReadOnlyList`
ReadOnlyCollection`
Nullable`
Action`
Func`
System.String
System.Int32
System.Single
System.Boolean
System.Double
System.Object
```

Também verificar formas genéricas alternativas:

```txt
List<
Dictionary<
IEnumerable<
IReadOnlyList<
ReadOnlyCollection<
Nullable<
Action<
Func<
```

---

# Parte 2 — Evitar `any[]` quando der para inferir

## Problema

O tipo `any[]` é melhor que nada, mas reduz muito a utilidade do LuaLS.

Exemplo ruim:

```lua
---@return any[]
function GameVariables.GetPresetColors() end
```

O usuário perde autocomplete dos itens retornados.

Melhor:

```lua
---@return Color[]
function GameVariables:GetPresetColors() end
```

Outro exemplo ruim:

```lua
---@return any[]
function PackedTexturesContainer.GetAffectedControllers() end
```

Melhor, se os valores forem controllers:

```lua
---@return ControllerEnum[]
function PackedTexturesContainer:GetAffectedControllers() end
```

---

## Regras gerais de inferência

Substituir `any[]` somente quando houver boa evidência.

Fontes de evidência aceitáveis:

```txt
1. Nome da função.
2. Nome do campo.
3. Tipo de parâmetros relacionados.
4. Classe onde o método está.
5. Comentário existente.
6. Padrões repetidos no próprio stub.
7. Dados do dump original, se disponível.
8. Uso observado em scripts extraídos do jogo.
```

Não trocar `any[]` por um tipo inventado sem evidência suficiente.

---

## Casos fáceis

### Métodos `Get...Colors`, `GetPresetColors`, `AllColors`

```lua
---@return Color[]
function GameVariables:GetPresetColors() end
```

ou, se o jogo usa entradas de paleta:

```lua
---@return ColorPaletteEntry[]
function ColorPaletteManager:GetSomethingColors() end
```

Usar `Color[]` para cores runtime.
Usar `ColorPaletteEntry[]` para entradas de paleta nomeadas.

---

### Métodos que retornam itens

Nomes que indicam itens:

```txt
GetItems
GetInventoryItems
GetDeliveryItems
GetCurrentItems
GetShopItems
GetAllItems
```

Preferir:

```lua
---@return Item[]
```

Exemplo:

```lua
---@return Item[]
function ItemManager:GetInventoryItems() end
```

---

### Métodos que retornam prefabs de itens

Nomes que indicam prefabs:

```txt
GetItemPrefabs
GetAllPrefabs
GetPrefabList
```

Preferir:

```lua
---@return ItemPrefab[]
```

---

### Métodos que retornam controllers

Se o método fala de controllers:

```lua
---@return ControllerEnum[]
function PackedTexturesContainer:GetAffectedControllers() end
```

Se retorna instâncias de controller Live2D:

```lua
---@return Live2DController[]
```

Decidir pelo contexto.

---

### Métodos que retornam drawables/textures

Para `PackedTexturesContainer` e classes relacionadas:

```lua
---@return PackedDrawable[]
function PackedTexturesContainer:GetPackedDrawablesByTarget(target) end

---@return PackedDrawable[]
function PackedTexturesContainer:GetRelated(target, rendererName) end
```

Se o método realmente retorna pares ou estruturas intermediárias, criar tipo auxiliar:

```lua
---@class PackedDrawableWithTexture
---@field Drawable PackedDrawable
---@field Texture PackedTexture
```

E usar:

```lua
---@return PackedDrawableWithTexture[]
```

Mas só criar esse tipo se houver evidência no dump ou no uso.

---

### Métodos que retornam save slots

```lua
---@return SaveSlotData[]
function SaveContainer:GetSaveSlotReadonly(saveType) end
```

---

### Métodos que retornam streamers, contratos, parceiros, eventos

Se a classe já tem campos tipados, usar esses campos como referência.

Exemplo:

```lua
---@class CockTwitchManager
---@field RuntimeEvents RuntimeEvent[]
```

Se existe:

```lua
---@field AllContracts CocktractContract[]
---@field CurrentContracts CocktractContract[]
---@field PastContracts CocktractContract[]
```

Então métodos relacionados devem retornar:

```lua
---@return CocktractContract[]
function CocktractManager:GetCurrentContracts() end
```

Para streamers:

```lua
---@return CockTwitchStreamer[]
function CockTwitchManager:GetActiveStreamers(count) end

---@return CockTwitchStreamer[]
function CockTwitchManager:GetTopStreamers(count) end
```

Se `CockTwitchStreamer` ainda não existir, procurar no dump. Se não existir, criar stub mínimo apenas se houver evidência clara:

```lua
---@class CockTwitchStreamer
```

Não adicionar campos inventados.

---

## Quando manter `any[]`

Manter `any[]` quando:

```txt
- O retorno é realmente heterogêneo.
- O método retorna dados internos desconhecidos.
- O nome não indica o tipo.
- Não há campo correlato.
- O tipo real não existe nos stubs.
- A inferência seria chute.
```

Exemplo aceitável:

```lua
---@return any[]
function SomeInternalReflectionHelper:GetValues() end
```

Melhor manter `any[]` do que colocar tipo errado.

---

## Quando trocar para `table`

Se `any[]` parece errado porque o retorno não é array, mas também não há estrutura clara, usar `table`.

Exemplo:

```lua
---@return table
function SomeClass:GetSerializedData() end
```

Use `table<string, any>` se for claramente mapa por string:

```lua
---@return table<string, any>
function SomeClass:GetJsonObject() end
```

---

## Criar tipos auxiliares mínimos

Quando um retorno aparece várias vezes como `any[]`, mas o domínio indica um tipo ausente, criar uma classe mínima.

Exemplo:

```lua
---@class PackedDrawableWithTexture
---@field Drawable PackedDrawable
---@field Texture PackedTexture
```

Outro exemplo:

```lua
---@class ContractSource
---@field Source string
---@field Index integer
```

Regras:

```txt
- Criar tipos auxiliares somente se usados em pelo menos 2 lugares ou se destravam uma API importante.
- Não inventar fields sem evidência.
- Se só souber o nome do tipo, declare classe vazia:
```

```lua
---@class CockTwitchStreamer
CockTwitchStreamer = {}
```

---

## Padrões de busca para `any[]`

Procurar em todos os `.d.lua`:

```txt
---@return any[]
---@field .* any[]
---@param .* any[]
```

Para cada ocorrência, decidir:

```txt
1. É array mesmo?
2. O nome da função/campo indica tipo?
3. Existe classe relacionada?
4. Existe field na mesma classe com tipo equivalente?
5. Existe uso observado em scripts?
6. Dá para trocar com segurança?
```

---

## Exemplos de correções esperadas

### Antes

```lua
---Retorna preset colors.
---@overload fun(self: GameVariables): any[]
---@return any[]
function GameVariables.GetPresetColors() end
```

### Depois

```lua
---Retorna preset colors.
---@return Color[]
function GameVariables:GetPresetColors() end
```

---

### Antes

```lua
---Retorna affected controllers.
---@overload fun(self: PackedTexturesContainer): any[]
---@return any[]
function PackedTexturesContainer.GetAffectedControllers() end
```

### Depois

```lua
---Retorna affected controllers.
---@return ControllerEnum[]
function PackedTexturesContainer:GetAffectedControllers() end
```

---

### Antes

```lua
---Retorna packed drawables by alvo.
---@overload fun(id: string): any[]
---@overload fun(self: PackedTexturesContainer, target: ControllerEnum): any[]
---@overload fun(self: PackedTexturesContainer, id: string): any[]
---@param target ControllerEnum
---@return any[]
function PackedTexturesContainer.GetPackedDrawablesByTarget(target) end
```

### Depois

```lua
---Retorna packed drawables por alvo.
---@overload fun(id: string): PackedDrawable[]
---@overload fun(self: PackedTexturesContainer, target: ControllerEnum): PackedDrawable[]
---@overload fun(self: PackedTexturesContainer, id: string): PackedDrawable[]
---@param target ControllerEnum|string
---@return PackedDrawable[]
function PackedTexturesContainer:GetPackedDrawablesByTarget(target) end
```

Se não quiser corrigir `.` vs `:` nesta passada, mantenha o estilo atual e altere apenas os tipos:

```lua
---@return PackedDrawable[]
function PackedTexturesContainer.GetPackedDrawablesByTarget(target) end
```

---

## Não fazer nesta passada

Não fazer as seguintes mudanças agora:

```txt
- Não reestruturar pastas.
- Não renomear classes.
- Não alterar enums.
- Não trocar todos os métodos de . para : se isso não estiver no escopo.
- Não remover APIs internas.
- Não mudar comentários em massa.
- Não gerar documentação nova.
- Não criar exemplos novos.
- Não alterar comportamento runtime.
```

O objetivo é uma passada pequena, segura e verificável.

---

# Validação final

Depois das alterações, rodar uma validação textual simples.

## Comandos sugeridos no PowerShell

```powershell
Get-ChildItem -Recurse -Filter *.d.lua | Select-String "System\."
Get-ChildItem -Recurse -Filter *.d.lua | Select-String "Collections\.Generic"
Get-ChildItem -Recurse -Filter *.d.lua | Select-String "List`"
Get-ChildItem -Recurse -Filter *.d.lua | Select-String "Dictionary`"
Get-ChildItem -Recurse -Filter *.d.lua | Select-String "IEnumerable`"
Get-ChildItem -Recurse -Filter *.d.lua | Select-String "ReadOnlyCollection"
Get-ChildItem -Recurse -Filter *.d.lua | Select-String "Nullable`"
Get-ChildItem -Recurse -Filter *.d.lua | Select-String "Action`"
Get-ChildItem -Recurse -Filter *.d.lua | Select-String "Func`"
Get-ChildItem -Recurse -Filter *.d.lua | Select-String "any\[\]"
```

## Resultado esperado

- Ocorrências de tipos C# crus devem ser zero ou quase zero.
- Ocorrências de `any[]` devem diminuir.
- `any[]` restante deve ser justificável.
- O addon deve continuar carregando no LuaLS.
- Nenhum stub deve conter código runtime real.

---

# Critérios de aceite

A tarefa está completa quando:

```txt
[ ] Todos os tipos C# primitivos foram convertidos para tipos LuaLS.
[ ] List<T>, IEnumerable<T> e ReadOnlyCollection<T> foram convertidos para T[].
[ ] Dictionary<K,V> foi convertido para table<K,V>.
[ ] Action/Func foram convertidos para fun(...).
[ ] Nullable<T> foi convertido para T|nil ou parâmetro opcional.
[ ] `any[]` foi substituído nos casos óbvios e seguros.
[ ] `any[]` restante foi mantido apenas quando a inferência seria insegura.
[ ] O LuaLS não mostra erros novos nos arquivos `.d.lua`.
[ ] O autocomplete melhorou para retornos comuns como itens, cores, controllers, drawables e save slots.
```

---
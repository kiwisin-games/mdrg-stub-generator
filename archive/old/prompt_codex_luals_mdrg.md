# Prompt para Codex: criar addon LuaLS/Sumneko Lua baseado em `docs.txt`

Você é um agente de desenvolvimento especializado em LuaLS, antigo Sumneko Lua, LuaCATS annotations e geração de definition files `.d.lua`.

Quero que você crie um addon local para a extensão LuaLS/Sumneko Lua baseado no arquivo `docs.txt`.

## Objetivo

Criar um addon chamado `mdrg` para LuaLS que forneça autocomplete, hover documentation, type checking básico e signatures para a API Lua descrita em `docs.txt`.

O arquivo `docs.txt` contém:

- valores globais disponíveis no runtime Lua;
- funções globais;
- bibliotecas como `string`, `table`, `math`, `coroutine`, `os`, `debug`, `json`;
- userdata expostos para Lua;
- enums;
- classes/tipos C# expostos via MoonSharp;
- métodos, propriedades e overloads;
- nomes de parâmetros no formato `name__System.Type`.

Use esse arquivo como fonte principal para gerar as definições Lua.

## Primeiro passo: pesquisa obrigatória

Antes de implementar, pesquise a documentação oficial e atual sobre:

1. Como criar addons para LuaLS.
2. Estrutura correta de um addon:
   - `info.json`
   - `config.json`
   - pasta `library/`
   - arquivos `.d.lua`
3. Como usar `workspace.library` e `workspace.userThirdParty`.
4. Como escrever annotations LuaCATS:
   - `---@meta`
   - `---@class`
   - `---@field`
   - `---@alias`
   - `---@enum`
   - `---@param`
   - `---@return`
   - `---@overload`
   - `---@type`
   - `---@generic`
5. Como representar APIs globais e userdata externos.
6. Como representar enums e valores globais no LuaLS.
7. Como evitar código executável dentro de arquivos de definição.

Use principalmente documentação oficial do LuaLS, e só use fontes externas se a documentação oficial não cobrir algum detalhe.

## Resultado esperado

Crie a seguinte estrutura:

```txt
mdrg-luals-addon/
├── info.json
├── config.json
├── README.md
└── library/
    ├── mdrg_globals.d.lua
    ├── mdrg_stdlib.d.lua
    ├── mdrg_enums.d.lua
    ├── mdrg_types.d.lua
    ├── mdrg_items.d.lua
    ├── mdrg_story.d.lua
    ├── mdrg_ui.d.lua
    ├── mdrg_game.d.lua
    └── mdrg_unity.d.lua
```

Pode ajustar os nomes dos arquivos se encontrar uma organização melhor, mas mantenha tudo separado por domínio.

## Regras de geração

### 1. Não gerar implementação real

Todos os arquivos dentro de `library/` devem ser definition files.

Cada arquivo deve começar com:

```lua
---@meta
```

Não implemente comportamento real. Use somente stubs:

```lua
function Item:GetName(itemNameInclude) end
```

ou:

```lua
---@class Item
---@field Quality number
---@field GameId GameId
Item = {}
```

### 2. Converter tipos C# para tipos LuaLS

Converta tipos C# comuns para tipos Lua:

```txt
System.String      -> string
System.Int32       -> integer
System.Single      -> number
System.Double      -> number
System.Boolean     -> boolean
System.Object      -> any
System.Void        -> nil
System.Guid        -> Guid
T[]                -> T[]
IEnumerable<T>     -> T[]
List<T>            -> T[]
Dictionary<K,V>    -> table<K, V>
Func<T,R>          -> fun(arg: T): R
Action<T>          -> fun(arg: T)
Action<T,U>        -> fun(arg1: T, arg2: U)
```

Quando o tipo for desconhecido, preserve o nome simplificado como uma classe LuaLS.

Exemplo:

```txt
System.Collections.Generic.List`1[Item]
```

deve virar:

```lua
---@return Item[]
```

### 3. Converter nomes de parâmetros

O `docs.txt` usa parâmetros assim:

```txt
name__System.String
count__System.Int32
item__Item
```

Converta para:

```lua
---@param name string
---@param count integer
---@param item Item
```

### 4. Classes

Para cada tipo com membros, gere uma classe:

```lua
---@class Item
---@field Quality number
---@field GameId GameId
---@field EquippedSlot string
Item = {}
```

Métodos de instância devem usar `:`:

```lua
---@return string
function Item:GetDescription() end
```

Métodos estáticos devem usar `.`:

```lua
---@param gameId GameId
---@return Item
function Item.CreateRandomItem(gameId, allowModifiers) end
```

Se não for possível saber com certeza se é estático ou instância, escolha com base no padrão:

- métodos que parecem construtores/factory: `.`
- métodos que operam em `self`: `:`
- propriedades: `---@field`

### 5. Construtores

Métodos `__new(...)` devem virar overloads ou funções de constructor:

```lua
---@class Item
Item = {}

---@overload fun(id: GameId, quality: number): Item
---@overload fun(id: ItemEnum, quality: number): Item
function Item.__new(...) end
```

Se LuaLS não lidar bem com isso, use:

```lua
---@param id GameId|ItemEnum
---@param quality number
---@return Item
function Item.new(id, quality) end
```

Mas documente no README qual estratégia foi usada.

### 6. Enums

Enums do `docs.txt` devem virar aliases literais ou classes com fields.

Preferência:

```lua
---@alias ControllerEnum
---| "NoScene"
---| "Missionary"
---| "Doggy"
---| "Blowjob"
---| "Cowgirl"
---| "Interaction"
---| "Shower"
```

Se algum enum for usado como userdata real, também pode criar tabela:

```lua
---@class ControllerEnumTable
---@field NoScene ControllerEnum
---@field Missionary ControllerEnum
ControllerEnum = {}
```

Escolha a opção que dá melhor autocomplete no LuaLS.

### 7. Globais

Declare todos os globais relevantes do `docs.txt`, incluindo:

```lua
---@type table
_G = _G

---@type string
_VERSION = _VERSION

---@type table
_MOONSHARP = _MOONSHARP
```

Também declare globais do jogo, por exemplo:

```lua
---@type ModUtilities
ModUtilities = {}

---@type GameUtilities
GameUtilities = {}

---@type ViewSingleton
ViewSingleton = {}

---@type SaveSingleton
SaveSingleton = {}
```

### 8. Bibliotecas padrão expostas pelo runtime MoonSharp

O runtime parece ser MoonSharp com Lua compatível com 5.2. Gere definições para as bibliotecas presentes no `docs.txt`, mas não sobrescreva a stdlib inteira se LuaLS já oferecer isso.

Se necessário, crie só as funções extras ou diferenças, por exemplo:

```lua
---@param s string
---@param prefix string
---@return boolean
function string.startsWith(s, prefix) end

---@param s string
---@param suffix string
---@return boolean
function string.endsWith(s, suffix) end

---@param s string
---@param value string
---@return boolean
function string.contains(s, value) end
```

### 9. APIs prioritárias

Priorize estas áreas primeiro:

1. `GameId`
2. `Item`
3. `ItemPrefab`
4. `ItemPrefabManager`
5. `ItemManager`
6. `ColorSlot`
7. `SusModifier`
8. `AllowedModifiers`
9. `SlotEquipData`
10. `ItemScopeCondition`
11. `FishItemPrefabData`
12. `FishingRodItemPrefabData`
13. `FishingBaitItemPrefabData`
14. `Shop`
15. `ShopManager`
16. `StorySingleton`
17. `SaveSingleton`
18. `SoundSingleton`
19. `ModUtilities`
20. `GameUtilities`
21. `UiOverlay`
22. `ViewSingleton`

Depois continue cobrindo o restante do `docs.txt`.

### 10. Não inventar documentação

Não invente comportamento que não esteja no `docs.txt`.

Se a função não tiver descrição, gere apenas assinatura e tipos.

Exemplo:

```lua
---Generated from docs.txt. No behavior description available.
---@param item Item
---@return boolean
function ItemPrefab:CanGoInto(item) end
```

### 11. README

Crie um `README.md` explicando:

- o que é o addon;
- como instalar localmente;
- como usar com `workspace.library`;
- como usar com `workspace.userThirdParty`;
- exemplo de `.luarc.json`;
- limitações;
- como regenerar as definições a partir do `docs.txt`;
- quais arquivos foram gerados;
- quais APIs ainda precisam de revisão manual.

Inclua exemplo:

```json
{
  "runtime.version": "Lua 5.2",
  "workspace.library": [
    "./mdrg-luals-addon/library"
  ],
  "diagnostics.globals": [
    "ModUtilities",
    "GameUtilities",
    "Item",
    "ItemPrefab",
    "GameId"
  ]
}
```

### 12. Validação

Depois de gerar o addon:

1. Verifique se todos os arquivos `.d.lua` têm `---@meta`.
2. Verifique se não existe lógica executável real.
3. Verifique se classes usadas em parâmetros existem.
4. Verifique se enums foram gerados.
5. Verifique se globals principais foram declarados.
6. Crie um arquivo `examples/test.lua` com código usando:
   - `GameId`
   - `Item`
   - `ItemPrefab`
   - `ItemPrefabManager`
   - `ModUtilities`
   - `GameUtilities`
   - `json`
   - `string.startsWith`
7. O exemplo deve servir para testar autocomplete no editor.

## Arquivos finais esperados

Ao final, entregue:

```txt
mdrg-luals-addon/
├── info.json
├── config.json
├── README.md
├── examples/
│   └── test.lua
└── library/
    ├── *.d.lua
```

## Estilo

- Código limpo.
- Definições pequenas e organizadas.
- Evite arquivos gigantes quando possível.
- Use nomes consistentes.
- Preserve nomes originais das classes.
- Quando houver tipos C# aninhados como `Item+ItemManager`, use nomes LuaLS válidos como `ItemManager`.
- Quando houver namespaces como `ItemConditions.ItemScopeCondition`, use `ItemScopeCondition` ou `ItemConditions_ItemScopeCondition`, escolhendo a forma mais compatível com LuaLS.
- Documente no README qualquer normalização de nome feita.

## Importante

Não faça apenas um arquivo mínimo. Gere um addon realmente utilizável para autocomplete e type hints no VS Code com LuaLS/Sumneko Lua.

Comece pesquisando a documentação oficial, depois leia `docs.txt`, depois gere os arquivos.

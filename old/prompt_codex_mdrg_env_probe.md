# Prompt para Codex — Criar script de inspeção/dump do ambiente MDRG/MoonSharp

Crie um script Lua para rodar dentro do ambiente do jogo MDRG/MoonSharp, usando apenas APIs compatíveis com o Lua disponível no jogo e com os stubs/docs atuais do projeto.

## Objetivo

Criar um script de inspeção/dump seguro que rode dentro do jogo e gere um relatório local chamado:

```txt
report-YYYYMMDD-HHMMSS.txt
```

O script deve tentar extrair o máximo possível de informações úteis sobre o ambiente Lua/MoonSharp, globals, funções, tabelas, enums, userdata, metatables e APIs expostas que ainda não estejam bem documentadas nos stubs.

## Contexto

- O projeto mantém stubs `.d.lua` para LuaLS do MDRG/MoonSharp.
- O ambiente é MoonSharp dentro de Unity.
- Existem globals conhecidos como `_G`, `_VERSION`, `_MOONSHARP`, `CurrentModGuid`, `GameVariables`, `GameUtilities`, `Item`, `ItemPrefab`, `GameId`, `json`, etc.
- Algumas APIs só funcionam com cena/save/contexto correto carregado.
- O script deve ser defensivo: nunca assumir que uma função pode ser chamada com segurança.
- O objetivo é documentação/local introspection, não modificar save, não alterar estado do jogo e não fazer rede.

---

## Requisitos principais

## 1. Rodar dentro do jogo

- Criar um script Lua autocontido.
- Não depender de bibliotecas externas.
- Usar somente funções disponíveis no ambiente Lua/MoonSharp do jogo.
- Evitar APIs de arquivo se não forem suportadas; se o ambiente não permitir escrita direta, gerar fallback com `print` em blocos ou outra API disponível no projeto.
- O script deve tentar salvar o relatório em arquivo local `report-timestamp.txt` quando possível.

---

## 2. Gerar relatório completo

O relatório deve conter seções claras:

- Header com timestamp, `_VERSION`, `_MOONSHARP`, `CurrentModGuid`, etc.
- Lista de globals em `_G`.
- Tipos dos globals.
- Tabelas conhecidas.
- Funções globais.
- Userdata globais.
- Metatables detectáveis.
- Campos e métodos acessíveis de objetos/tabelas.
- Informações sobre MoonSharp.
- Informações úteis sobre Unity/jogo, quando acessível.
- Validações de APIs conhecidas.
- Erros encontrados durante introspection.
- Limitações do dump.

---

## 3. Dump seguro de tabelas

Implementar função de dump recursivo com proteção contra:

- tabelas auto-referenciais;
- ciclos;
- profundidade excessiva;
- quantidade excessiva de campos;
- strings grandes;
- funções que não podem ser serializadas;
- userdata que explode ao acessar campos;
- metatables com `__index` perigoso.

Configurações sugeridas:

```lua
MAX_DEPTH = 4
MAX_KEYS_PER_TABLE = 200
MAX_STRING_LEN = 500
MAX_TOTAL_LINES = 50000
```

Usar tabela `visited` para detectar ciclos:

```lua
visited[t] = path
```

Quando encontrar ciclo, escrever algo como:

```txt
<cycle: already visited at _G.SomePath>
```

---

## 4. Introspection defensiva

Toda operação arriscada deve usar `pcall`.

Criar helpers como:

```lua
safe_tostring(value)
safe_type(value)
safe_pairs(table)
safe_get(table, key)
safe_call(name, fn, ...)
safe_metatable(value)
```

Nunca chamar funções desconhecidas automaticamente só porque foram encontradas.

Funções só podem ser chamadas em uma seção de validação controlada, com lista branca e argumentos seguros.

---

## 5. Metatables e userdata

Para cada valor interessante:

- tentar `getmetatable(value)` com `pcall`;
- registrar se existe metatable;
- tentar listar campos da metatable, se for tabela;
- tentar identificar `__index`, `__newindex`, `__tostring`, `__call`;
- se for userdata, tentar:
  - `tostring(userdata)`;
  - `type(userdata)`;
  - `getmetatable(userdata)`;
  - acesso controlado a campos conhecidos, apenas se houver lista branca.

Não fazer brute force agressivo em userdata.

---

## 6. Descobrir coisas não listadas nas docs/stubs

Comparar globals encontrados com uma lista de símbolos conhecidos.

Criar uma tabela `KNOWN_SYMBOLS` com símbolos esperados, por exemplo:

```lua
KNOWN_SYMBOLS = {
  _G = true,
  _VERSION = true,
  _MOONSHARP = true,
  CurrentModGuid = true,
  GameVariables = true,
  GameUtilities = true,
  Item = true,
  ItemPrefab = true,
  ItemPrefabManager = true,
  GameId = true,
  Guid = true,
  json = true,
}
```

No relatório, criar seção:

```txt
Possibly undocumented globals
```

Listando globals que não estão em `KNOWN_SYMBOLS`.

Também criar seção:

```txt
Known symbols missing
```

Listando símbolos esperados que não existem naquele contexto.

---

## 7. Validações conhecidas, com cuidado de contexto

Criar uma seção de validações controladas para confirmar informações já conhecidas.

Exemplos seguros:

- `_VERSION`
- `_MOONSHARP.version`
- `_MOONSHARP.platform`
- existência de `json.parse`, `json.serialize`, `json.isnull`
- existência de `string.startsWith`, `string.endsWith`, `string.contains`
- existência de `GameVariables`
- existência de `GameVariables.Current`
- existência de campos simples em `GameVariables.Current`, se disponível:
  - `time`
  - `money`
  - `playerName`
  - `botName`
  - `stage`
- existência de métodos, sem necessariamente chamá-los:
  - `GameVariables.CheckFlag`
  - `GameVariables.GetCumPercent`
  - `GameVariables.TimeInDay`
  - `GameUtilities.WaitForSecondsYield`

Regra importante:

Não chamar funções que possam alterar estado, save, inventário, cena, dinheiro, flags, emails, UI ou progresso do jogo.

Separar validações em categorias:

```txt
Safe read validation
Context-dependent validation
Skipped dangerous validation
```

Se `GameVariables.Current` não existir ou save/cena não estiver carregado, registrar isso no relatório em vez de falhar.

---

## 8. Sistema de escrita de relatório

Implementar um writer simples:

```lua
Report = {}
Report.lines = {}

function Report:line(text)
  -- adiciona linha respeitando MAX_TOTAL_LINES
end

function Report:section(title)
  -- adiciona separador de seção
end

function Report:save()
  -- tenta salvar em arquivo
  -- fallback para print
end
```

Tentar usar `io.open` se existir:

```lua
local ok, f = pcall(io.open, filename, "w")
```

Se não existir `io`, usar fallback:

- imprimir o relatório em chunks com `print`;
- dividir em blocos para não quebrar console/log.

O script deve informar claramente se salvou em arquivo ou se usou fallback.

---

## 9. Timestamp

Criar timestamp seguro.

Se `os.date` existir:

```lua
os.date("%Y%m%d-%H%M%S")
```

Se não existir, usar fallback:

```lua
"unknown-time"
```

---

## 10. Organização do script

Organize o script em blocos:

```lua
-- config
-- report writer
-- safe helpers
-- value formatting
-- table dumping
-- metatable dumping
-- global scanning
-- known symbol comparison
-- MoonSharp info
-- Unity/game info
-- safe validations
-- save/fallback output
-- main()
```

---

## 11. Formato do relatório

O relatório deve ser legível em texto puro.

Exemplo de seções:

```txt
# MDRG Lua Environment Report
Generated at: ...
Script version: ...

## Runtime
_VERSION: ...
_MOONSHARP.version: ...
_MOONSHARP.platform: ...
CurrentModGuid: ...

## Globals Summary
Total globals: ...
Functions: ...
Tables: ...
Userdata: ...
Strings: ...
Numbers: ...
Booleans: ...

## Known Symbols
...

## Possibly Undocumented Globals
...

## Global Dump
...

## Metatables
...

## MoonSharp Details
...

## Game/Unity Context
...

## Safe Validations
...

## Errors / Access Failures
...

## Notes
...
```

---

## 12. Segurança e estabilidade

O script deve:

- evitar alterações de estado;
- evitar chamadas destrutivas;
- evitar loops infinitos;
- limitar profundidade;
- limitar quantidade de linhas;
- usar `pcall` em tudo que pode falhar;
- registrar erros sem interromper o dump inteiro;
- não fazer chamadas de rede;
- não ler arquivos externos desnecessários;
- não tentar acessar dados sensíveis fora do contexto do jogo.

---

## 13. Entrega

Entregue:

1. Um arquivo Lua principal, por exemplo:

```txt
mdrg_env_probe.lua
```

2. Se útil, um pequeno README ou comentário no topo explicando:
   - onde colocar/rodar;
   - o que o script coleta;
   - limitações;
   - como interpretar o relatório.

3. Não altere os stubs existentes nesta tarefa, a menos que seja necessário apenas para referência. O foco é gerar o script de dump.

Antes de finalizar:

- Revise se o script é compatível com Lua/MoonSharp.
- Evite sintaxe Lua 5.4 se não tiver certeza.
- Evite dependências externas.
- Garanta que todo acesso perigoso esteja dentro de `pcall`.
- Garanta que dump recursivo tenha `visited`, `MAX_DEPTH`, `MAX_KEYS_PER_TABLE` e `MAX_TOTAL_LINES`.

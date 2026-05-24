# Prompt para Codex — Corrigir segurança padrão do debug mod e robustez do validador

Você está trabalhando no repositório atual do addon LuaLS MDRG/MoonSharp.

## Problema observado

No ZIP atual, `examples/callback_debug_mod_real/script.lua` está com opt-ins ligados:

```lua
local ENABLE_DEBUG_ITEMS = true
local ENABLE_CALLBACK_PROBE = true
local DEBUG_ADD_TO_SHOP = true
local DEBUG_ENABLE_UI_CALLBACK_CASES = true
local DEBUG_ENABLE_STORY_CONDITION_CASES = true
local DEBUG_ENABLE_COROUTINE_CASES = true
local DEBUG_ENABLE_TEXTURE_CALLBACK_CASES = true
```

Isso contradiz a política do projeto:

```txt
O debug mod deve ser inerte por padrão.
```

Além disso, `tools/validate_debug_mod_real.py` falha ao ler a matriz de coverage quando `DEBUG_CALLBACK_COVERAGE` e `DEBUG_ITEM_CATEGORIES` estão formatados em múltiplas linhas. O validador usa parsing linha-a-linha com regex simples, então detecta:

```txt
coverage_entries=0
category_cases=0
```

mesmo com as tabelas presentes no script.

## Objetivo

1. Voltar o debug mod para estado seguro por padrão.
2. Fazer o validador entender tabelas Lua formatadas em múltiplas linhas.
3. Manter a possibilidade de teste runtime com opt-ins locais, sem commitar isso como padrão.

---

## Regras

- Não rode o jogo.
- Não edite `library/*.d.lua` manualmente.
- Não edite `mod/realmod/**`.
- Não chame callbacks artificialmente.
- Não chame `io.popen`.
- Não remova cobertura real do debug mod.
- Não simplifique a matriz de callbacks só para agradar o parser.
- Preserve comentários sobre `OnUnpack` precisar de C# bridge.

---

## Parte 1 — Restaurar flags padrão seguras

Em:

```txt
examples/callback_debug_mod_real/script.lua
```

deixar por padrão:

```lua
local ENABLE_DEBUG_ITEMS = false
local ENABLE_CALLBACK_PROBE = false
local DEBUG_ADD_TO_SHOP = false
local DEBUG_ENABLE_UI_CALLBACK_CASES = false
local DEBUG_ENABLE_STORY_CONDITION_CASES = false
local DEBUG_ENABLE_COROUTINE_CASES = false
local DEBUG_ENABLE_TEXTURE_CALLBACK_CASES = false
```

Adicionar perto das flags um bloco claro:

```lua
-- Runtime testing:
-- Change these flags manually only in a disposable test copy/save.
-- Do not commit them enabled by default.
```

Se quiser, criar um arquivo exemplo separado:

```txt
examples/callback_debug_mod_real/script.flags.example.lua
```

ou documentar no README, mas não mudar o carregamento do jogo para depender disso.

---

## Parte 2 — Corrigir parser de coverage no validador

Atualizar:

```txt
tools/validate_debug_mod_real.py
```

Hoje o parser procura campos em uma única linha com:

```python
LUA_STRING_FIELD_RE.findall(line)
```

Isso quebra para tabelas formatadas assim:

```lua
{
  callback_key = "ItemPrefab.OnUse",
  case_id = "category-matrix",
  status = "covered",
}
```

Implementar parser simples e robusto para blocos Lua table:

### Requisitos

- Extrair entradas dentro de `local DEBUG_CALLBACK_COVERAGE = { ... }`.
- Extrair entradas dentro de `local DEBUG_ITEM_CATEGORIES = { ... }`.
- Suportar campos string em linhas separadas.
- Suportar vírgula opcional.
- Suportar aspas duplas e simples.
- Suportar campos booleanos se necessário.
- Não precisa ser parser Lua completo, apenas robusto o bastante para esses blocos.
- Não executar Lua.

### Estratégia aceitável

Implementar funções:

```python
extract_lua_table_block(text: str, local_name: str) -> str
split_top_level_table_entries(block: str) -> list[str]
parse_lua_key_values(entry: str) -> dict[str, str]
```

Usar contador de `{` e `}` para separar entradas de primeiro nível.

---

## Parte 3 — Ajustar coverage de casos não atribuíveis

Confirmar que `ItemPrefab.OnUnpack` está como:

```txt
status = "justified"
```

e motivo menciona:

```txt
System.Func<Item, Item[]>
MoonSharp não converte Lua function/tabela em Item[] CLR sem C# bridge
```

Confirmar que `TextureOverriderManager.GetSpecialEffectsAction` está como:

```txt
covered se houver instância válida
ou justified/conditional se depende de manager runtime
```

O validador pode aceitar status:

```txt
covered
justified
conditional
```

desde que `conditional` exija `reason` ou `trigger_hint`.

---

## Parte 4 — Atualizar README do debug mod

Em:

```txt
examples/callback_debug_mod_real/README.md
```

explicar:

```txt
- flags vêm false por padrão;
- para teste manual em save descartável, ativar flags no script.lua;
- não commitar flags true;
- OnUnpack requer bridge C#;
- texture callback depende de TextureOverriderManager instance.
```

---

## Validações

Rodar:

```powershell
python -m py_compile tools\validate_debug_mod_real.py
python tools\validate_debug_mod_real.py --root examples\callback_debug_mod_real
python tools\catalog_lua_callbacks.py
```

Também rodar:

```powershell
rg -n "local ENABLE_DEBUG_ITEMS = true|local ENABLE_CALLBACK_PROBE = true|local DEBUG_ADD_TO_SHOP = true" examples/callback_debug_mod_real/script.lua
```

Esse `rg` não deve encontrar nada no script padrão.

---

## Entrega esperada

Ao final, entregue:

1. Resumo das mudanças.
2. Confirmação de flags false por padrão.
3. Explicação da melhoria do parser Lua table.
4. Resultado de `validate_debug_mod_real.py`.
5. Confirmação de que `OnUnpack` permanece justified/bridge-required.
6. Diff relevante.

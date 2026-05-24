# Prompt para Codex — Alinhar `mdrg_callback_context_probe.lua` com o sistema do `mdrg_env_probe.lua`

Você está trabalhando no repositório atual do addon LuaLS MDRG/MoonSharp.

Já existem:

```txt
examples/mdrg_env_probe.lua
examples/callback_debug_mod_real/
examples/callback_debug_mod_real/mdrg_callback_context_probe.lua
examples/callback_debug_mod_real/script.lua
tools/probe_runtime_index.py
```

O objetivo desta tarefa é **melhorar o callback probe helper** usado pelo debug mod real, reaproveitando os padrões técnicos do `mdrg_env_probe.lua`.

Importante:

```txt
Não transforme `mdrg_callback_context_probe.lua` em uma cópia completa do `mdrg_env_probe.lua`.
Não mude o papel do `mdrg_env_probe.lua`.
Não registre itens no `mdrg_env_probe.lua`.
Não chame callbacks artificialmente.
```

O `mdrg_env_probe.lua` continua sendo o probe geral/read-only de ambiente.

O `mdrg_callback_context_probe.lua` deve continuar sendo um helper menor, especializado para rodar dentro de callbacks/closures.

---

# Objetivo

Comparar:

```txt
examples/mdrg_env_probe.lua
examples/callback_debug_mod_real/mdrg_callback_context_probe.lua
```

E portar para o callback helper apenas os padrões essenciais do env probe:

```txt
- detecção robusta de contexto;
- detecção de safe IO;
- effective GameVariables source;
- report humano mais legível;
- blocos machine-readable consistentes;
- escaping seguro para machine-readable;
- safe field/index access com source;
- nested field probe para argumentos;
- logging de erros de acesso;
- limites de report;
- lifecycle matrix para callback invocation;
- integração com tools/probe_runtime_index.py.
```

---

# Regras obrigatórias

## Segurança

- Não chamar funções descobertas automaticamente.
- Não chamar callbacks artificialmente.
- Não chamar `io.popen`.
- Não chamar `SaveAllChanges`, `ResetAllData`, `AddGlobalFlag`, `ForceTakeMoney`, `OpenBrowser`, `ChangeWebsite`.
- Não registrar itens dentro de `mdrg_env_probe.lua`.
- Não alterar `mod/realmod/**`.
- Não editar `library/*.d.lua` manualmente.
- Não rodar o jogo.
- Não assumir que `OnSaveLoad` existe.
- Reports são evidência auxiliar, não fonte autoritativa automática.

## Flags padrão

Preservar flags desligadas por padrão no debug mod:

```lua
ENABLE_DEBUG_ITEMS = false
ENABLE_CALLBACK_PROBE = false
DEBUG_ADD_TO_SHOP = false
```

No callback helper, preservar:

```lua
ENABLE_CALLBACK_PROBE = false
```

ou equivalente, se a flag estiver no `script.lua`.

## Escopo

Fazer mudanças pequenas e focadas em:

```txt
examples/callback_debug_mod_real/mdrg_callback_context_probe.lua
tools/probe_runtime_index.py
examples/callback_debug_mod_real/README.md
analysis/*, se houver docs relacionadas
```

Só alterar `examples/mdrg_env_probe.lua` se for necessário corrigir uma incompatibilidade pequena. Não reescrever.

---

# Parte 1 — Portar detecção de contexto em versão reduzida

No `mdrg_callback_context_probe.lua`, adicionar uma versão reduzida dos conceitos do `mdrg_env_probe.lua`.

Criar helpers:

```lua
runtime_signals()
detect_execution_context(signals)
get_effective_gamevariables_source(signals)
```

## `runtime_signals()`

Deve detectar, com `pcall` quando necessário:

```txt
CurrentModGuid present
GameVariables present
gv present
flowchart present
io present
io.open present
io.read present
io.write present
io.popen present
io.tmpfile present
ModUtilities present
GameUtilities present
```

Não chamar nenhuma dessas funções. Apenas verificar presença/tipo.

## `detect_execution_context(signals)`

Classificações sugeridas:

```txt
callback-invocation
callback-invocation-with-safe-io
mod-start
mod-with-safe-io-start
luaexec-scene-context
luaexec-with-safe-io-scene-context
save-aware-context
unknown-plugin-context
unknown
```

Heurísticas:

```txt
inside callback helper:
  detected_context deve pelo menos indicar callback-invocation.

CurrentModGuid present + gv missing + flowchart missing:
  likely mod-start or callback from mod context.

CurrentModGuid present + io.open present + gv missing + flowchart missing:
  likely mod-with-safe-io-start or callback-with-safe-io.

CurrentModGuid missing + gv present + flowchart present:
  likely luaexec-scene-context.

CurrentModGuid missing + gv present + flowchart present + io.open present:
  likely luaexec-with-safe-io-scene-context.

GameVariables present:
  likely save-aware-context.

gv present:
  likely legacy/internal GameVariables alias context.

flowchart present:
  likely Fungus/scene script context.
```

Como o helper roda dentro de callback, o report deve deixar claro:

```txt
This is a callback/closure invocation context. The surrounding runtime signals may indicate mod, LuaExec, scene/Fungus or safe IO.
```

Não reportar como certeza absoluta. Use “likely”.

## `get_effective_gamevariables_source(signals)`

Retornar:

```txt
GameVariables
gv
none
```

Não chamar `ModUtilities.GetGameVariables()`.

---

# Parte 2 — Adicionar report humano de runtime/injection context

Hoje o callback report deve ganhar seções humanas legíveis.

Adicionar ao report:

```txt
# MDRG Callback Context Report
Generated at: ...
Callback probe version: ...
Report file: ...

## Callback Invocation
callback id: ...
callback name: ...
phase: before/after/error
call count: ...

## Callback Runtime / Injection Context
CurrentModGuid: present/missing
GameVariables: present/missing
gv: present/missing
flowchart: present/missing
io: present/missing
io.open: present/missing
io.popen: present/missing
io.tmpfile: present/missing
ModUtilities: present/missing
GameUtilities: present/missing
effective GameVariables source: GameVariables/gv/none
detected context: ...
transport: file/console-fallback
safe IO likely injected: yes/no/unknown

## Callback Lifecycle Matrix
Callback:
- name: ...
- phase: ...

Current runtime signals:
- CurrentModGuid: ...
- GameVariables: ...
- gv: ...
- flowchart: ...
- io.open: ...

Likely phase:
- callback invocation during gameplay or system evaluation
- registered earlier by mod startup / OnGameStart-like script
- exact caller is not guaranteed unless callback name identifies it
```

Se `io.open` existir:

```txt
io is present. If running through LuaPatch/safe IO plugin, treat this as injected bridge API, not native MDRG API.
```

Se `io.popen` existir:

```txt
io.popen field is present but was not called. Presence does not prove process execution capability.
```

---

# Parte 3 — Padronizar blocos machine-readable

O `mdrg_env_probe.lua` usa blocos machine-readable. O callback helper precisa gerar blocos consistentes e parseáveis.

Adicionar/ajustar:

```txt
BEGIN_MDRG_CALLBACK_CONTEXT
...
END_MDRG_CALLBACK_CONTEXT

BEGIN_MDRG_CALLBACK_ARGS
...
END_MDRG_CALLBACK_ARGS

BEGIN_MDRG_CALLBACK_FIELDS
...
END_MDRG_CALLBACK_FIELDS

BEGIN_MDRG_CALLBACK_ERRORS
...
END_MDRG_CALLBACK_ERRORS
```

## Formato recomendado

Usar pipe-delimited, como:

```txt
callback|callback_id|category-food.nutrition-filler
callback|callback_name|category-food.nutrition-filler
callback|phase|before
callback|call_count|1
callback|detected_context|callback-invocation-with-safe-io
callback|current_mod_guid_present|true
callback|gamevariables_present|false
callback|gv_present|false
callback|flowchart_present|false
callback|io_present|true
callback|io_open_present|true
callback|io_popen_present|true
callback|io_tmpfile_present|true
callback|effective_gamevariables_source|none
callback|transport|file
```

Argumentos:

```txt
arg|1|item|userdata|<userdata: ...>
arg|2|nutritionProfile|userdata|<userdata: ...>
```

Campos:

```txt
field|nutritionProfile|Satiation|userdata|present|index|<userdata: ...>
field|nutritionProfile.Satiation|Value|number|present|index|0.1
field|nutritionProfile.Satiation|MinValue|number|missing|missing|
field|nutritionProfile.Satiation|MaxValue|number|error|error|<error text>
```

Erros:

```txt
error|field_access|nutritionProfile.Satiation.MaxValue|<error text>
```

Se o callback helper já usa formato `key=value`, há duas opções:

1. Migrar para pipe-delimited; ou
2. manter `key=value`, mas atualizar `tools/probe_runtime_index.py` para suportar ambos.

Preferência: pipe-delimited para consistência com `mdrg_env_probe.lua`.

---

# Parte 4 — Adicionar escaping seguro para machine-readable

Portar/adaptar do `mdrg_env_probe.lua` um helper tipo:

```lua
machine_text(value)
```

Ele deve:

```txt
- converter nil para "";
- converter valor para string com safe_tostring;
- substituir quebras de linha por "\n";
- substituir carriage return por "\r";
- substituir tabs por "\t";
- substituir pipe "|" por "\|", ou outro escape estável;
- truncar strings longas;
- nunca lançar erro.
```

Usar `machine_text()` em todos os valores machine-readable.

Especialmente:

```txt
callback id/name
phase
arg name
arg tostring
field value
error text
trigger_hint
expected_signature
```

---

# Parte 5 — Melhorar safe access

O callback helper deve ter helpers equivalentes, mas menores, aos do env probe:

```lua
safe_tostring(value)
safe_type(value)
safe_raw_get(value, key)
safe_index_get(value, key)
```

## `safe_index_get`

Deve retornar:

```lua
ok, value, source
```

Onde `source` pode ser:

```txt
raw
index
missing
error
```

Comportamento:

1. Se for tabela, tentar `rawget`.
2. Se raw value não for nil, retornar `raw`.
3. Tentar `value[key]` com `pcall`.
4. Se retornar nil, marcar `missing`.
5. Se falhar, marcar `error`.

Não chamar métodos retornados.

---

# Parte 6 — Nested field probe para argumentos

Adicionar nested field probe para argumentos conhecidos.

## `nutritionProfile`

Para argumento chamado `nutritionProfile`, tentar:

```txt
Satiation
Health
MentalHealth
Stamina
```

Para cada um, tentar nested fields:

```txt
Value
MinValue
MaxValue
```

Exemplo:

```txt
nutritionProfile.Satiation
nutritionProfile.Satiation.Value
nutritionProfile.Satiation.MinValue
nutritionProfile.Satiation.MaxValue
```

Tudo via `safe_index_get`.

O probe não deve modificar esses campos.

## `item`

Para argumento chamado `item`, tentar indexar, sem chamar:

```txt
GetName
GetDescription
GetCount
GetPrice
GetItemPrefab
IsEquipped
CanBeUsed
CanBeUnpacked
```

Se retornar função, reportar `function` e `not-called`.

## Outros argumentos

Para argumentos desconhecidos:

```txt
- registrar tipo;
- tostring;
- metatable presence, se seguro;
- fazer field probe raso apenas se uma lista de campos conhecida existir;
- não fazer brute force agressivo em userdata.
```

---

# Parte 7 — Logging de erros de acesso

O callback helper deve registrar erros de field access.

Não basta tratar erro como `missing`.

Status possíveis:

```txt
present
missing
error
```

Se `safe_index_get` falhar:

```txt
field|nutritionProfile.Satiation|MaxValue|nil|error|error|<error text>
error|field_access|nutritionProfile.Satiation.MaxValue|<error text>
```

Adicionar seção humana:

```txt
## Access Errors
Total access errors: N
- ...
```

Se não houver erros:

```txt
Total access errors: 0
```

---

# Parte 8 — Limites de report

Adicionar limites para evitar reports gigantes por callback:

```lua
local CALLBACK_PROBE_MAX_LINES_PER_REPORT = 2000
local CALLBACK_PROBE_MAX_FIELDS_PER_ARG = 80
local CALLBACK_PROBE_MAX_ERRORS = 100
local CALLBACK_PROBE_MAX_STRING_LEN = 500
```

Se o limite for atingido, adicionar nota:

```txt
Report line limit reached; truncated.
```

Não travar callback se limite for atingido.

---

# Parte 9 — Writer/transport

O callback helper deve manter writer simples:

```txt
- se io.open existir, salvar em callback-report-YYYYMMDD-HHMMSS.txt;
- se io.open não existir, imprimir em console fallback;
- nunca chamar io.popen;
- reportar transport=file ou transport=console-fallback.
```

Se `io.open` existir, mas falhar:

```txt
transport=console-fallback
fallback reason: <error>
```

Se `io.open` existir por safe IO, reportar como bridge externa possível.

---

# Parte 10 — Atualizar `tools/probe_runtime_index.py`

Atualizar parser para reconhecer os blocos novos ou ajustados:

```txt
BEGIN_MDRG_CALLBACK_CONTEXT
END_MDRG_CALLBACK_CONTEXT
BEGIN_MDRG_CALLBACK_ARGS
END_MDRG_CALLBACK_ARGS
BEGIN_MDRG_CALLBACK_FIELDS
END_MDRG_CALLBACK_FIELDS
BEGIN_MDRG_CALLBACK_ERRORS
END_MDRG_CALLBACK_ERRORS
```

Se o parser já suporta algum formato antigo `key=value`, manter compatibilidade.

Também garantir `strip_log_prefix()` para linhas como:

```txt
[LuaPatch] [Lua:exec.lua] BEGIN_MDRG_CALLBACK_CONTEXT
[19:07:14.020] [LuaPatch] [Lua:exec.lua] callback|phase|before
```

O parser deve armazenar callback contexts em algo como:

```json
{
  "callback_contexts": [
    {
      "callback_id": "...",
      "callback_name": "...",
      "phase": "before",
      "detected_context": "...",
      "args": [],
      "fields": [],
      "errors": []
    }
  ]
}
```

Se houver comando `--compare`, ele deve incluir diferenças de callback contexts quando possível.

---

# Parte 11 — Atualizar README do debug mod

Atualizar:

```txt
examples/callback_debug_mod_real/README.md
```

Adicionar:

```txt
- o helper de callback não é o env probe completo;
- ele reutiliza os padrões essenciais do env probe;
- reports de callback agora incluem runtime/injection context;
- reports de callback agora têm nested field probe;
- como comparar callback-report com report de startup e report via LuaExec;
- onde ficam os reports;
- flags continuam desativadas por padrão.
```

---

# Parte 12 — Validações

Rodar ou sugerir:

```powershell
rg -n "runtime_signals|detect_execution_context|effective_gamevariables|Callback Runtime / Injection Context|Callback Lifecycle Matrix|BEGIN_MDRG_CALLBACK_ERRORS|machine_text|safe_raw_get|safe_index_get" examples/callback_debug_mod_real tools
rg -n "nutritionProfile\\.Satiation|MinValue|MaxValue|CALLBACK_PROBE_MAX_LINES_PER_REPORT|CALLBACK_PROBE_MAX_FIELDS_PER_ARG" examples/callback_debug_mod_real
rg -n "io\\.popen\\(" examples/callback_debug_mod_real examples/mdrg_env_probe.lua
rg -n "SaveAllChanges\\(|ResetAllData\\(|AddGlobalFlag\\(|ForceTakeMoney\\(|OpenBrowser\\(|ChangeWebsite\\(" examples/callback_debug_mod_real
python -m py_compile tools/probe_runtime_index.py
python tools/validate_debug_mod_real.py --root examples/callback_debug_mod_real
```

Se algum nome perigoso aparecer, verificar se está apenas em string/lista de validação e não é chamado.

Não rodar o jogo.

---

# Entrega esperada

Ao final, entregue:

1. Resumo do que mudou.
2. Arquivos alterados.
3. O que foi portado do `mdrg_env_probe.lua`.
4. O que propositalmente não foi portado.
5. Como o callback helper detecta contexto.
6. Como o callback helper detecta safe IO.
7. Como o callback helper gera blocos machine-readable.
8. Como nested field probe funciona.
9. Como erros de acesso são registrados.
10. Como `probe_runtime_index.py` processa os blocos novos.
11. Confirmação de que o callback helper não chama callbacks artificialmente.
12. Confirmação de que `io.popen` não é chamado.
13. Confirmação de que flags padrão continuam desligadas.
14. Resultado das validações.
15. Diff relevante.

# Prompt para Codex — Usar callback reports para melhorar stubs com evidência runtime

Você está trabalhando no repositório atual do addon LuaLS MDRG/MoonSharp.

Já existem:

```txt
examples/mdrg_env_probe.lua
examples/mdrg_callback_context_probe.lua
examples/callback_debug_mod_real/
tools/probe_runtime_index.py
tools/summarize_runtime_tests.py
tools/catalog_lua_callbacks.py
tools/validate_debug_mod_real.py
probe/runtime_test_*/
analysis/
data/
library/*.d.lua
```

O objetivo desta tarefa é criar um pipeline que usa os `callback-report-*.txt` gerados nos testes runtime para produzir **evidência estruturada** e **sugestões revisáveis** de melhoria dos stubs.

Importante:

```txt
Não editar `library/*.d.lua` automaticamente.
Não criar API nova automaticamente.
Não tratar um único report como verdade absoluta.
Reports são evidência runtime, não fonte autoritativa única.
```

---

# Objetivo geral

Criar ferramentas e relatórios para transformar reports runtime em:

```txt
data/runtime_callback_evidence.json
analysis/runtime_confirmed_callbacks.md
analysis/runtime_stub_findings.md
analysis/suggested_stub_updates.md
```

Esses arquivos devem ajudar a melhorar os stubs de forma revisada e conservadora.

---

# Regras obrigatórias

- Não rode o jogo.
- Não edite `library/*.d.lua` manualmente nesta tarefa.
- Não edite `mod/realmod/**`.
- Não apague reports em `probe/runtime_test_*`.
- Não chame callbacks artificialmente.
- Não chame `io.popen`.
- Não chame APIs destrutivas:
  - `SaveAllChanges`
  - `ResetAllData`
  - `AddGlobalFlag`
  - `ForceTakeMoney`
  - `OpenBrowser`
  - `ChangeWebsite`
- Não assumir que `OnSaveLoad` existe.
- Não promover evidência de um contexto para todos os contextos sem marcar incerteza.
- Se um campo/callback aparece em `OnGameStart` mas não em callback runtime, ou vice-versa, preservar o contexto/lifetime na conclusão.

---

# Modelo de classificação

Cada callback/field observado deve ser classificado em um destes buckets:

```txt
runtime-confirmed
registered-but-not-triggered
assignable-but-not-triggered
not-assignable-from-plain-lua
requires-runtime-instance
requires-csharp-bridge
manual-ui-only
dangerous/state-sensitive
inaccessible-or-missing-at-runtime
unknown
```

Exemplos esperados:

```txt
ItemPrefab.OnUse -> runtime-confirmed
EdibleItemPrefabData.CreateInstance -> runtime-confirmed
ItemScopeConditionCustom.CreateInstance -> runtime-confirmed
ItemPrefab.OnUnpack -> not-assignable-from-plain-lua / requires-csharp-bridge
StoryCondition.Delegate -> registered-but-not-triggered, se só foi criado mas não avaliado
StoryCondition.Lua -> registered-but-not-triggered, se só foi criado mas não avaliado
UiOverlay.* -> manual-ui-only
ItemManager.*events -> requires unsubscribe policy / manual lifecycle
ItemPrefab.SetCustomShader -> requires shader asset
```

---

# Parte 1 — Criar ferramenta `tools/build_runtime_callback_evidence.py`

Criar:

```txt
tools/build_runtime_callback_evidence.py
```

Ela deve ler:

```txt
probe/runtime_test_*/
probe/runtime_test_*/callback-report-*.txt
probe/runtime_test_*/notes.txt
probe/runtime_test_*/runtime_test_summary.json
```

Também pode reutilizar funções/parsers de:

```txt
tools/probe_runtime_index.py
tools/summarize_runtime_tests.py
tools/catalog_lua_callbacks.py
```

Se a reutilização direta for difícil, extrair parsing comum para um módulo pequeno, por exemplo:

```txt
tools/mdrg_probe_parse.py
```

Mas evite refactor grande desnecessário.

---

# Parte 2 — Gerar `data/runtime_callback_evidence.json`

Criar ou atualizar:

```txt
data/runtime_callback_evidence.json
```

Estrutura sugerida:

```json
{
  "schema_version": 1,
  "generated_at_utc": "...",
  "source_runtime_tests": [
    "probe/runtime_test_001",
    "probe/runtime_test_002"
  ],
  "callbacks": {
    "ItemPrefab.OnUse": {
      "status": "runtime-confirmed",
      "observed_count": 15,
      "contexts": {
        "callback-invocation-with-safe-io": 15
      },
      "phases": {
        "before": 15
      },
      "callback_ids": {
        "category-food.on-use": 1
      },
      "observed_args": [
        {
          "name": "item",
          "type": "userdata",
          "examples": ["<userdata: callback probe Food>"]
        }
      ],
      "observed_fields": [
        {
          "owner": "item",
          "field": "GetName",
          "type": "function",
          "status": "present",
          "source": "index"
        }
      ],
      "evidence_reports": [
        "probe/runtime_test_002/callback-report-....txt"
      ],
      "notes": []
    }
  },
  "field_findings": {
    "EdibleItemNutritionProfile": {
      "confirmed": [
        {
          "path": "Satiation",
          "type": "userdata"
        },
        {
          "path": "Satiation.Value",
          "type": "number"
        }
      ],
      "not_confirmed_or_inaccessible": [
        {
          "path": "Health",
          "status": "error"
        },
        {
          "path": "MentalHealth",
          "status": "error"
        },
        {
          "path": "Stamina",
          "status": "error"
        },
        {
          "path": "Satiation.MinValue",
          "status": "error"
        },
        {
          "path": "Satiation.MaxValue",
          "status": "error"
        }
      ]
    }
  },
  "incompatible_callbacks": {
    "ItemPrefab.OnUnpack": {
      "status": "not-assignable-from-plain-lua",
      "reason": "Runtime field is System.Func<Item, Item[]>; MoonSharp could not convert plain Lua function.",
      "suggested_action": "Document as requiring C# bridge or native helper."
    }
  }
}
```

Não precisa ser exatamente essa estrutura, mas precisa conter:

```txt
- callback source/stub;
- status;
- contagens;
- contexts;
- args observados;
- fields observados;
- erros de acesso;
- reports fonte;
- notas;
- possíveis sugestões.
```

---

# Parte 3 — Gerar `analysis/runtime_confirmed_callbacks.md`

Criar relatório humano:

```txt
analysis/runtime_confirmed_callbacks.md
```

Conteúdo mínimo:

```md
# Runtime confirmed callbacks

Generated from `probe/runtime_test_*`.

## Confirmed

| Callback | Count | Contexts | Args | Notes |
|---|---:|---|---|---|
| `ItemPrefab.OnUse` | 15 | callback-invocation-with-safe-io | item: userdata | Lua assignment and runtime invocation confirmed |

## Registered but not triggered

| Callback | Reason |
|---|---|
| `StoryCondition.Delegate` | Created but no report proved runtime evaluation |
| `StoryCondition.Lua` | Created but no report proved runtime evaluation |

## Not assignable from plain Lua

| Callback | Reason |
|---|---|
| `ItemPrefab.OnUnpack` | Runtime expects `System.Func<Item, Item[]>`; plain Lua function assignment failed |

## Manual/contextual

| Callback | Reason |
|---|---|
| `UiOverlay.*` | Requires explicit UI trigger |
| `ItemManager.*events` | Requires subscribe/unsubscribe lifecycle policy |
```

---

# Parte 4 — Gerar `analysis/runtime_stub_findings.md`

Criar relatório com achados relevantes para stubs.

Conteúdo esperado:

````md
# Runtime stub findings

## Callback signatures

### ItemPrefab.OnUse

Stub signature:
```lua
---@field OnUse fun(arg1: Item): boolean
```

Runtime result:
- Lua assignment: confirmed.
- Runtime invocation: confirmed.
- Observed arg:
  - `item`: userdata.
- Return:
  - boolean accepted.

Suggested stub note:
- `Lua callback assignment and runtime invocation confirmed.`

### ItemPrefab.OnUnpack

Stub signature:
```lua
---@field OnUnpack fun(arg1: Item): Item[]
```

Runtime result:
- Lua assignment failed.
- Error:
  - `cannot convert a function to System.Func<Item, Item[]>`

Suggested stub note:
- `CLR delegate requiring Item[] return; plain Lua function assignment failed. Requires bridge/native helper.`

## Runtime-confirmed fields

### EdibleItemNutritionProfile

Confirmed:
- `Satiation`
- `Satiation.Value: number`

Inaccessible/not confirmed:
- `Satiation.MinValue`
- `Satiation.MaxValue`
- `Health`
- `MentalHealth`
- `Stamina`

Suggested action:
- Do not add inaccessible fields as public fields without additional evidence.
````
---

# Parte 5 — Gerar `analysis/suggested_stub_updates.md`

Criar um arquivo de sugestões, não aplicar automaticamente.

Formato:

````md
# Suggested stub updates

Do not apply blindly. Review each suggestion manually.

## Safe documentation-only notes

### `ItemPrefab.OnUse`

Suggested note:
```lua
---@field OnUse fun(arg1: Item): boolean # Runtime-confirmed Lua callback.
```

Evidence:
- Reports: N
- Tests: runtime_test_*

## Caution notes

### `ItemPrefab.OnUnpack`

Suggested note:
```lua
---@field OnUnpack fun(arg1: Item): Item[] # Exposed as CLR Func<Item, Item[]>; plain Lua assignment failed in runtime test. Requires bridge/native helper.
```

Evidence:
- Runtime error during assignment.
- No runtime callback report generated.

## Possible type refinements

### `EdibleItemNutritionProfile`

Suggested:
```lua
---@field Satiation any # Runtime-confirmed; `.Value` observed as number.
```

Do not add:
```lua
---@field Health any
---@field MentalHealth any
---@field Stamina any
```

unless future reports confirm them.
````
---

# Parte 6 — Integrar com `tools/summarize_runtime_tests.py`

Atualizar `tools/summarize_runtime_tests.py` para:

```txt
- chamar ou mencionar `build_runtime_callback_evidence.py`;
- incluir no summary global os callbacks confirmados;
- incluir seção de “stub-relevant findings”;
- opcionalmente escrever `analysis/runtime_tests_summary.md`.
```

Evite duplicar lógica demais. Se possível, compartilhe parsing.

---

# Parte 7 — Integrar com `tools/catalog_lua_callbacks.py`

Atualizar `tools/catalog_lua_callbacks.py` para cruzar:

```txt
callback catalog dos stubs
+
data/runtime_callback_evidence.json
```

E marcar nos relatórios:

```txt
runtime-confirmed
not-assignable-from-plain-lua
registered-but-not-triggered
manual-ui-only
requires-csharp-bridge
```

Atualizar:

```txt
analysis/lua_callback_contexts.md
analysis/callback_debug_cases.md
analysis/callback_debug_coverage.md
```

com uma coluna/seção de runtime evidence quando existir.

---

# Parte 8 — Não editar stubs ainda

Nesta tarefa, não editar:

```txt
library/*.d.lua
```

A ferramenta deve gerar apenas:

```txt
data/runtime_callback_evidence.json
analysis/runtime_confirmed_callbacks.md
analysis/runtime_stub_findings.md
analysis/suggested_stub_updates.md
```

Se quiser preparar uma segunda etapa, criar apenas um prompt/nota:

```txt
analysis/next_prompt_apply_reviewed_stub_notes.md
```

Mas não aplicar.

---

# Parte 9 — Validações

Rodar:

```powershell
python -m py_compile `
  tools\build_runtime_callback_evidence.py `
  tools\summarize_runtime_tests.py `
  tools\catalog_lua_callbacks.py `
  tools\probe_runtime_index.py
```

Rodar:

```powershell
python tools\build_runtime_callback_evidence.py --root probe
python tools\summarize_runtime_tests.py --root probe
python tools\catalog_lua_callbacks.py
```

Se não houver `probe/runtime_test_*`, a ferramenta deve:

```txt
- não falhar;
- gerar relatório vazio/pendente;
- explicar que ainda não há runtime tests.
```

Checks:

```powershell
rg -n "runtime_callback_evidence|runtime_stub_findings|suggested_stub_updates|runtime-confirmed|requires-csharp-bridge" tools analysis data
rg -n "SaveAllChanges\(|ResetAllData\(|AddGlobalFlag\(|ForceTakeMoney\(|OpenBrowser\(|ChangeWebsite\(|io\.popen\(" tools examples
```

Se chamadas perigosas aparecerem apenas em listas de bloqueio/validação, ok.

---

# Entrega esperada

Ao final, entregar:

1. Resumo das mudanças.
2. Arquivos criados/alterados.
3. Como `runtime_callback_evidence.json` é gerado.
4. Quais callbacks ficaram:
   - runtime-confirmed;
   - registered-but-not-triggered;
   - not-assignable-from-plain-lua;
   - requires-csharp-bridge;
   - manual-ui-only.
5. Principais achados para stubs.
6. Confirmação de que `library/*.d.lua` não foi editado.
7. Confirmação de que reports não são aplicados automaticamente aos stubs.
8. Resultado das validações.

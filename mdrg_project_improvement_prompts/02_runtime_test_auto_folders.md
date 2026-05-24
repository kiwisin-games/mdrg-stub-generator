# Prompt para Codex — Automatizar `probe/runtime_test_NNN` e enriquecer reports

Você está trabalhando no repositório atual do addon LuaLS MDRG/MoonSharp.

## Situação

Os reports runtime foram organizados manualmente em pastas como:

```txt
probe/runtime_test_01/
probe/runtime_test_02/
probe/runtime_test_03/
```

Queremos automatizar isso. Cada sessão de teste deve gerar sua própria pasta, seus reports com nomes únicos e um `notes.txt` com contexto do teste.

## Objetivo

Implementar:

```txt
probe/runtime_test_001_label/
├── notes.txt
├── callback-report-YYYYMMDD-HHMMSS-001-callback-id-before.txt
├── callback-report-YYYYMMDD-HHMMSS-002-callback-id-before.txt
└── runtime_test_summary.json
```

---

## Regras

- Não rode o jogo.
- Não chame callbacks artificialmente.
- Não chame `io.popen`.
- Não edite `library/*.d.lua`.
- Não edite `mod/realmod/**`.
- Não faça o helper depender de API destrutiva/salvar jogo.
- Deve funcionar com safe IO quando `io.open` existir e cair para console fallback quando não existir.

---

## Parte 1 — API de runtime test no callback helper

Em:

```txt
examples/mdrg_callback_context_probe.lua
examples/callback_debug_mod_real/mdrg_callback_context_probe.lua
```

adicionar API:

```lua
MDRG_CALLBACK_PROBE.configure_runtime_test({
  enabled = true,
  root = "probe",
  id = "auto",
  label = "debug_mod_real",
  objective = "Manual runtime callback test for MDRG debug mod",
  actions = {
    "Use/equip/eat debug items",
    "Open clothier if DEBUG_ADD_TO_SHOP is true",
    "Check callback reports",
  },
  flags = {
    ENABLE_DEBUG_ITEMS = ENABLE_DEBUG_ITEMS,
    ENABLE_CALLBACK_PROBE = ENABLE_CALLBACK_PROBE,
    DEBUG_ADD_TO_SHOP = DEBUG_ADD_TO_SHOP,
    DEBUG_ENABLE_UI_CALLBACK_CASES = DEBUG_ENABLE_UI_CALLBACK_CASES,
    DEBUG_ENABLE_STORY_CONDITION_CASES = DEBUG_ENABLE_STORY_CONDITION_CASES,
    DEBUG_ENABLE_COROUTINE_CASES = DEBUG_ENABLE_COROUTINE_CASES,
    DEBUG_ENABLE_TEXTURE_CALLBACK_CASES = DEBUG_ENABLE_TEXTURE_CALLBACK_CASES,
  },
})
```

Se `id = "auto"`, escolher o próximo `runtime_test_NNN`.

Se `label` existir, sanitizar:

```txt
debug_mod_real -> runtime_test_001_debug_mod_real
personality module -> runtime_test_002_personality_module
```

---

## Parte 2 — Nome único para reports

Trocar:

```txt
callback-report-YYYYMMDD-HHMMSS.txt
```

por:

```txt
callback-report-YYYYMMDD-HHMMSS-SEQ-CALLBACKID-PHASE.txt
```

Exemplo:

```txt
callback-report-20260507-221030-001-category-modules-personality-on-use-before.txt
```

Regras:

- `SEQ` é contador global do helper.
- `CALLBACKID` é sanitizado.
- `PHASE` é `before`, `after` ou `error`.
- Se o arquivo existir, adicionar `-dup01`, `-dup02`, etc.
- Nunca sobrescrever report existente.

---

## Parte 3 — notes.txt automático

Criar:

```txt
probe/runtime_test_NNN_label/notes.txt
```

Conteúdo inicial:

```txt
# MDRG Runtime Test

test_id: runtime_test_001_debug_mod_real
created_at: ...
runtime_test_label: debug_mod_real
objective: ...

## Configuration

ENABLE_DEBUG_ITEMS: ...
ENABLE_CALLBACK_PROBE: ...
DEBUG_ADD_TO_SHOP: ...
DEBUG_ENABLE_UI_CALLBACK_CASES: ...
DEBUG_ENABLE_STORY_CONDITION_CASES: ...
DEBUG_ENABLE_COROUTINE_CASES: ...
DEBUG_ENABLE_TEXTURE_CALLBACK_CASES: ...

## Runtime Signals At First Callback

CurrentModGuid: present/missing
GameVariables: present/missing
gv: present/missing
flowchart: present/missing
io.open: present/missing
effective_gamevariables_source: ...
detected_context: ...
transport: file/console-fallback

## Manual Actions

- User may edit this section after the test.

## Reports

Generated reports:
- ...
```

Se `notes.txt` existir, não apagar notas manuais. Atualizar/anexar somente a seção `Reports` ou adicionar seção final `Generated reports update`.

---

## Parte 4 — Item context por report

Adicionar seção humana:

```txt
## Item Context

item present: yes
item tostring: <userdata: callback probe ModulesPersonality>
item type: userdata
debug inferred name: callback probe ModulesPersonality
debug case id: category-modules-personality
callback kind: on-use
source stub: ItemPrefab.OnUse
```

Adicionar bloco machine-readable:

```txt
BEGIN_MDRG_CALLBACK_ITEM_CONTEXT
item|callback_id|category-modules-personality.on-use
item|phase|before
item|arg_name|item
item|type|userdata
item|value|<userdata: callback probe ModulesPersonality>
item|debug_case_id|category-modules-personality
item|callback_kind|on-use
item|source_stub|ItemPrefab.OnUse
item|expected_signature|fun(item: Item): boolean
item|inferred_item_label|callback probe ModulesPersonality
END_MDRG_CALLBACK_ITEM_CONTEXT
```

Não chamar getters de item por padrão.

---

## Parte 5 — Atualizar `tools/probe_runtime_index.py`

Adicionar parser para:

```txt
BEGIN_MDRG_CALLBACK_ITEM_CONTEXT
END_MDRG_CALLBACK_ITEM_CONTEXT
```

Indexar em:

```json
"callback_item_contexts": []
```

Se fizer sentido, adicionar:

```json
"runtime_test": {
  "id": "...",
  "label": "...",
  "folder": "probe/runtime_test_001_debug_mod_real"
}
```

---

## Parte 6 — Criar `tools/summarize_runtime_tests.py`

Criar ferramenta:

```txt
tools/summarize_runtime_tests.py
```

CLI:

```powershell
python tools\summarize_runtime_tests.py --root probe
python tools\summarize_runtime_tests.py --test probe\runtime_test_003_personality_module
```

Ela deve:

- Ler `probe/runtime_test_*`.
- Parsear `callback-report-*.txt` usando `probe_runtime_index.py` ou lógica compartilhada.
- Gerar/atualizar:
  - `runtime_test_summary.json`
  - `notes.txt` sem apagar notas manuais
  - `analysis/runtime_tests_summary.md`

Resumo por teste:

```txt
- total reports;
- callbacks por source_stub;
- callbacks por callback_id;
- phases;
- detected_contexts;
- item labels;
- item args;
- access errors;
- first/last timestamp.
```

---

## Parte 7 — Atualizar debug mod

Em:

```txt
examples/callback_debug_mod_real/script.lua
```

chamar `configure_runtime_test(...)` se existir.

Manter flags padrão false.

---

## Validações

Rodar:

```powershell
python -m py_compile tools\probe_runtime_index.py tools\summarize_runtime_tests.py tools\validate_debug_mod_real.py
python tools\validate_debug_mod_real.py --root examples\callback_debug_mod_real
python tools\summarize_runtime_tests.py --root probe
```

Checks:

```powershell
rg -n "configure_runtime_test|runtime_test_|BEGIN_MDRG_CALLBACK_ITEM_CONTEXT|summarize_runtime_tests" examples tools analysis
rg -n "io\.popen\(" examples tools
```

`io.popen` só pode aparecer em validação/lista de bloqueio, nunca chamada real.

---

## Entrega esperada

1. Resumo.
2. Arquivos alterados/criados.
3. Como runtime_test_NNN é escolhido.
4. Como filenames evitam sobrescrita.
5. O que entra em notes.txt.
6. O que entra em runtime_test_summary.json.
7. Como item context é inferido.
8. Como rodar summarize_runtime_tests.py.
9. Resultados de validação.

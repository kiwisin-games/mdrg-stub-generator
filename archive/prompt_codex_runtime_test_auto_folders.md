# Prompt para Codex — Automatizar runtime_test_N e enriquecer reports de callback

Você está trabalhando no repositório atual do addon LuaLS MDRG/MoonSharp.

Já existem:

```txt
examples/mdrg_env_probe.lua
examples/mdrg_callback_context_probe.lua
examples/callback_debug_mod_real/
tools/probe_runtime_index.py
tools/validate_debug_mod_real.py
tools/validate_realmod_assets.py
tools/catalog_lua_callbacks.py
probe/
analysis/
```

O objetivo desta tarefa é melhorar a organização dos testes runtime.

Hoje os reports `callback-report-*.txt` são gerados soltos e depois organizados manualmente em pastas como:

```txt
probe/runtime_test_01/
probe/runtime_test_02/
probe/runtime_test_03/
```

Agora queremos que isso seja **automatizado**.

---

# Objetivo geral

Implementar um sistema onde cada execução/teste runtime tenha uma pasta própria:

```txt
probe/runtime_test_001/
probe/runtime_test_002/
probe/runtime_test_003/
```

ou com label:

```txt
probe/runtime_test_001_startup/
probe/runtime_test_002_food_callbacks/
probe/runtime_test_003_personality_module/
```

Dentro da pasta, cada report deve ser salvo individualmente, com nome único, e também deve existir um `notes.txt` com dump do contexto do teste.

Exemplo desejado:

```txt
probe/runtime_test_003_personality_module/
├── notes.txt
├── callback-report-20260507-221030-001-category-modules-personality-on-use-before.txt
├── callback-report-20260507-221031-002-category-modules-personality-random-item-post-processing-before.txt
├── callback-report-20260507-221032-003-category-modules-personality-item-scope-condition-before.txt
└── runtime_test_summary.json
```

---

# Regras obrigatórias

- Não rodar o jogo.
- Não editar `library/*.d.lua` manualmente.
- Não editar `mod/realmod/**`.
- Não chamar callbacks artificialmente.
- Não chamar `io.popen`.
- Não chamar APIs destrutivas:
  - `SaveAllChanges`
  - `ResetAllData`
  - `AddGlobalFlag`
  - `ForceTakeMoney`
  - `OpenBrowser`
  - `ChangeWebsite`
- Manter flags desligadas por padrão no debug mod, salvo se o usuário já ativou manualmente em um arquivo local.
- Não assumir que `OnSaveLoad` existe.
- O sistema deve funcionar com safe IO quando disponível, e cair para console fallback se não houver `io.open`.

---

# Parte 1 — Configuração de runtime test

Adicionar ao callback helper e/ou ao `script.lua` do debug mod uma configuração explícita:

```lua
local RUNTIME_TEST_ENABLED = true
local RUNTIME_TEST_ROOT = "probe"
local RUNTIME_TEST_LABEL = "manual"
local RUNTIME_TEST_ID = "auto"
local RUNTIME_TEST_NOTES = {
  objective = "Manual callback runtime test",
  flags = {},
  actions = {},
}
```

Mas a configuração real deve preferir uma API no helper:

```lua
MDRG_CALLBACK_PROBE.configure_runtime_test({
  enabled = true,
  root = "probe",
  id = "auto",
  label = "personality_module",
  objective = "Test PersonalityModule runtime callback behavior",
  actions = {
    "Equip/use ModulesPersonality item",
    "Trigger item scope condition",
    "Observe callback context reports"
  },
})
```

Se `id = "auto"`, criar automaticamente o próximo índice disponível:

```txt
runtime_test_001
runtime_test_002
runtime_test_003
```

Se `label` existir, sanitizar e usar:

```txt
runtime_test_003_personality_module
```

Sanitização:

```txt
- lowercase;
- trocar espaços por `_`;
- remover caracteres inválidos para path;
- limitar tamanho.
```

---

# Parte 2 — Criar pasta automaticamente

Quando o primeiro report do teste for gerado, o helper deve:

1. Verificar se `RUNTIME_TEST_ENABLED=true`.
2. Garantir que a pasta `probe/` existe.
3. Descobrir o próximo `runtime_test_NNN` se `id=auto`.
4. Criar a pasta.
5. Salvar o caminho em uma variável global/cache do helper para todos os reports seguintes da mesma sessão.
6. Criar `notes.txt` se ainda não existir.
7. Nunca sobrescrever reports existentes.

Importante:

```txt
A pasta deve ser criada uma vez por sessão do mod/teste, não uma pasta nova por callback.
```

---

# Parte 3 — Nome único por report

Mudar o nome dos reports para evitar sobrescrita.

Formato recomendado:

```txt
callback-report-YYYYMMDD-HHMMSS-SEQ-CALLBACKID-PHASE.txt
```

Exemplo:

```txt
callback-report-20260507-221030-001-category-modules-personality-on-use-before.txt
```

Regras:

```txt
- `SEQ` deve ser contador global do helper, iniciado em 001.
- `CALLBACKID` deve ser sanitizado.
- `PHASE` deve ser before/after/error.
- Se arquivo já existir, incrementar sufixo extra: `-dup01`, `-dup02`.
```

Também aplicar para reports do env probe, se o projeto quiser integrar depois, mas nesta tarefa foque no callback helper.

---

# Parte 4 — Mais informações sobre o item no report

Cada callback report deve incluir mais contexto sobre o item quando houver argumento `item`.

Adicionar uma seção humana:

```txt
## Item Context

item present: yes
item tostring: <userdata: callback probe ModulesPersonality>
item type: userdata
item metatable: ...
debug inferred name: callback probe ModulesPersonality
debug inferred category: ModulesPersonality
debug case id: category-modules-personality
```

Como o probe não deve chamar métodos automaticamente por padrão, usar primeiro dados seguros:

```txt
- tostring(item);
- arg name;
- callback metadata;
- case id;
- callback id/name;
- campos acessados sem chamada.
```

Se o helper tiver opção explícita:

```lua
CALLBACK_PROBE_CALL_SAFE_ITEM_GETTERS = false
```

mantê-la `false` por padrão.

Se algum dia ativada manualmente, pode tentar com `pcall`:

```txt
item.GetName()
item.GetDescription()
item.GetCount()
item.GetPrice()
item.IsEquipped()
item.CanBeUsed()
item.CanBeUnpacked()
```

Mas por padrão **não chamar**.

---

# Parte 5 — Machine-readable de item context

Adicionar bloco:

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

Atualizar `tools/probe_runtime_index.py` para parsear esse bloco.

Adicionar no índice:

```json
"callback_item_contexts": []
```

E no compare, opcionalmente comparar item contexts.

---

# Parte 6 — notes.txt automático

Gerar ou atualizar:

```txt
probe/runtime_test_NNN_label/notes.txt
```

O arquivo deve conter dump do contexto do runtime_test.

Formato sugerido:

```txt
# MDRG Runtime Test

test_id: runtime_test_003_personality_module
created_at: 2026-05-07 22:10:30
runtime_test_label: personality_module
objective: Test PersonalityModule runtime callback behavior

## Configuration

ENABLE_DEBUG_ITEMS: true
ENABLE_CALLBACK_PROBE: true
DEBUG_ADD_TO_SHOP: true
DEBUG_ENABLE_UI_CALLBACK_CASES: true/false
DEBUG_ENABLE_STORY_CONDITION_CASES: true/false
DEBUG_ENABLE_COROUTINE_CASES: true/false
DEBUG_ENABLE_TEXTURE_CALLBACK_CASES: true/false

callback_probe_enabled: true
callback_probe_once_per_context: false
callback_probe_max_calls: 120
context_label: debug-mod-real

## Runtime Signals At First Callback

CurrentModGuid: present
GameVariables: missing/present
gv: present/missing
flowchart: present/missing
io: present
io.open: present
io.popen: present/missing
io.tmpfile: present/missing
effective_gamevariables_source: gv/none
detected_context: callback-invocation-with-safe-io
transport: file

## Debug Mod Cases

Categories:
- Clothing
- Food
- FoodCookedDish
- Usable
- Package
- Room
- Modules
- ModulesPersonality
- Fish
- CookingIngredient
- FishingTrash
- Meds
- Soap
- AnonEquip
- Other

Callback coverage:
- ItemPrefab.OnUse
- EdibleItemPrefabData.CreateInstance
- ItemScopeConditionCustom.CreateInstance
- etc.

## Manual Actions

- User should edit/fill this section after test if needed.
- Example: equipped ModulesPersonality item.
- Example: ate Food item.
- Example: opened clothier.

## Reports

Generated reports:
- callback-report-...
- callback-report-...

## Notes

- This file is generated by the callback probe helper.
- It can be edited manually after the test.
```

Se `notes.txt` já existir, não sobrescrever tudo. Preferir:

```txt
- criar se não existe;
- se existe, anexar seção `## Reports` ou atualizar resumo com cuidado;
- não apagar notas manuais do usuário.
```

---

# Parte 7 — runtime_test_summary.json

Além de `notes.txt`, gerar/atualizar:

```txt
runtime_test_summary.json
```

Conteúdo sugerido:

```json
{
  "test_id": "runtime_test_003_personality_module",
  "label": "personality_module",
  "created_at": "...",
  "report_count": 16,
  "callbacks": {
    "ItemPrefab.OnUse": 1,
    "ItemScopeConditionCustom.CreateInstance": 9
  },
  "callback_ids": {
    "category-modules-personality.on-use": 1
  },
  "contexts": {
    "callback-invocation-with-safe-io": 16
  },
  "items": {
    "callback probe ModulesPersonality": 11
  }
}
```

Se for difícil atualizar JSON dentro do jogo com Lua, pode deixar isso para uma ferramenta Python.

Preferência:

```txt
- Lua helper cria reports + notes.txt;
- Python tool gera/atualiza runtime_test_summary.json lendo os reports.
```

---

# Parte 8 — Tool Python para agrupar/sumarizar testes

Criar ferramenta:

```txt
tools/summarize_runtime_tests.py
```

Ela deve:

```txt
- ler `probe/runtime_test_*`;
- parsear todos os callback-report-*.txt;
- usar `tools/probe_runtime_index.py` ou lógica compartilhada;
- gerar/atualizar:
  - `notes.txt` com resumo;
  - `runtime_test_summary.json`;
  - opcionalmente `analysis/runtime_tests_summary.md`.
```

CLI:

```powershell
python tools\summarize_runtime_tests.py --root probe
python tools\summarize_runtime_tests.py --test probe\runtime_test_003_personality_module
```

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
- missing/erro fields;
- first/last timestamp;
```

Resumo global:

```md
# Runtime Tests Summary

| Test | Reports | Contexts | Confirmed callbacks | Items | Errors |
|---|---:|---|---|---|---|
| runtime_test_001 | 62 | callback-invocation-with-safe-io | OnUse, nutrition, scope | Food, Modules | 0 |
```

---

# Parte 9 — Atualizar probe_runtime_index.py

Adicionar suporte para:

```txt
BEGIN_MDRG_CALLBACK_ITEM_CONTEXT
END_MDRG_CALLBACK_ITEM_CONTEXT
```

E se fizer sentido:

```txt
BEGIN_MDRG_RUNTIME_TEST_CONTEXT
END_MDRG_RUNTIME_TEST_CONTEXT
```

Índice deve incluir:

```json
"runtime_test": {
  "id": "...",
  "label": "...",
  "folder": "probe/runtime_test_003_personality_module"
},
"callback_item_contexts": []
```

---

# Parte 10 — Atualizar debug mod script.lua

No `examples/callback_debug_mod_real/script.lua`, passar contexto do runtime test para o helper:

```lua
if callback_probe and callback_probe.configure_runtime_test then
  callback_probe.configure_runtime_test({
    enabled = true,
    root = "probe",
    id = "auto",
    label = "debug_mod_real",
    objective = "Manual runtime callback test for MDRG debug mod",
    actions = {
      "Use/equip/eat debug items",
      "Open clothier if DEBUG_ADD_TO_SHOP is true",
      "Check callback reports"
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
end
```

---

# Parte 11 — Validação

Rodar:

```powershell
python -m py_compile tools\probe_runtime_index.py tools\summarize_runtime_tests.py tools\validate_debug_mod_real.py
```

Rodar:

```powershell
python tools\validate_debug_mod_real.py --root examples\callback_debug_mod_real
```

Se já houver pastas `probe/runtime_test_*`, rodar:

```powershell
python tools\summarize_runtime_tests.py --root probe
```

Checks:

```powershell
rg -n "configure_runtime_test|runtime_test_|BEGIN_MDRG_CALLBACK_ITEM_CONTEXT|summarize_runtime_tests" examples tools analysis
rg -n "io\.popen\(" examples tools
```

Se `io.popen` aparecer só em lista de bloqueio/validação, ok. Não pode aparecer como chamada real.

---

# Entrega esperada

Ao final, entregar:

1. Resumo das mudanças.
2. Arquivos alterados/criados.
3. Como a pasta `runtime_test_NNN` é escolhida/criada.
4. Como os report filenames evitam sobrescrita.
5. O que entra em `notes.txt`.
6. O que entra em `runtime_test_summary.json`.
7. Como o item context é inferido.
8. Como `probe_runtime_index.py` parseia `CALLBACK_ITEM_CONTEXT`.
9. Como rodar `summarize_runtime_tests.py`.
10. Resultado das validações.
11. Confirmação de segurança:
    - não roda jogo;
    - não chama callbacks artificialmente;
    - não chama `io.popen`;
    - não edita stubs gerados;
    - não edita `mod/realmod`.

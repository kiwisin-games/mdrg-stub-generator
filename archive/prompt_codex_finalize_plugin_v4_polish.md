# Prompt para Codex — Finalizar polish do plugin_v4 MDRG

Você está trabalhando no repositório atual do addon LuaLS MDRG/MoonSharp.

O `plugin_v4` está praticamente completo. Já existem:

```txt
examples/mdrg_env_probe.lua
examples/mdrg_callback_context_probe.lua
examples/callback_debug_mod_real/
tools/probe_runtime_index.py
tools/validate_realmod_assets.py
tools/validate_debug_mod_real.py
tools/catalog_lua_callbacks.py
analysis/*.md
analysis/packed_textures.schema.json
```

A tarefa agora não é reimplementar o v4 inteiro. Faça apenas o acabamento final de robustez, compatibilidade e validação.

---

## Objetivo

Finalizar o `plugin_v4` com foco em:

1. Melhorar o parser/comparador de reports.
2. Adicionar modo compatível/tolerante para assets de mods antigos.
3. Confirmar que arquivos esperados existem.
4. Rodar validações estáticas.
5. Manter todo o comportamento seguro e opt-in.

---

## Regras obrigatórias

- Não rode o jogo.
- Não edite `library/*.d.lua` manualmente.
- Não edite `mod/realmod/**`; ele é corpus read-only.
- Não chame callbacks artificialmente.
- Não chame `io.popen`.
- Não chame APIs destrutivas ou sensíveis:
  - `SaveAllChanges`
  - `ResetAllData`
  - `AddGlobalFlag`
  - `ForceTakeMoney`
  - `OpenBrowser`
  - `ChangeWebsite`
- Preserve flags desligadas por padrão:
  - `ENABLE_DEBUG_ITEMS = false`
  - `ENABLE_CALLBACK_PROBE = false`
  - `DEBUG_ADD_TO_SHOP = false`
- Não assuma que `OnSaveLoad` existe.
- Mantenha compatibilidade com reports antigos.

---

# Parte 1 — Ajustar `tools/probe_runtime_index.py`

Revise e ajuste `tools/probe_runtime_index.py`.

## 1.1 Reconhecer nomes de reports de callback

Hoje o parser deve aceitar também estes formatos:

```txt
callback-report-YYYYMMDD-HHMMSS.txt
callback-report-YYYYMMDD-HHMMSS-001.txt
callback-report-YYYYMMDD-HHMMSS-category-food-before-1.txt
report-YYYYMMDD-HHMMSS-callbacks.txt
```

A função de timestamp deve extrair:

```txt
YYYYMMDD-HHMMSS
```

de qualquer um desses formatos.

Não quebre o formato antigo:

```txt
report-YYYYMMDD-HHMMSS.txt
```

---

## 1.2 Ignorar chunk markers de callback

`clean_report_lines()` já ignora `MDRG_ENV_PROBE_CHUNK`.

Também ignore:

```txt
MDRG_CALLBACK_PROBE_CHUNK
```

Preferência: implementar de forma genérica:

```txt
MDRG_*_PROBE_CHUNK
```

---

## 1.3 Melhorar `safe_io_info()`

A função deve usar também o bloco `environment`, quando existir.

Incluir no índice:

```json
{
  "safe_io": {
    "io_present": true,
    "io_open_present": true,
    "io_popen_present": true,
    "io_tmpfile_present": true,
    "safe_io_expected": false,
    "safe_io_likely_injected": "likely",
    "transport": "file",
    "console_fallback": false
  }
}
```

Se `environment` não existir, manter fallback legado.

Não inferir que `io.popen` funciona. Apenas reportar presença.

---

## 1.4 Reconhecer blocos futuros de asset/debug

O parser hoje reconhece `BEGIN_MDRG_PROBE_*` e `BEGIN_MDRG_CALLBACK_*`.

Adicionar suporte para:

```txt
BEGIN_MDRG_ASSET_SCHEMA
END_MDRG_ASSET_SCHEMA

BEGIN_MDRG_ASSET_VALIDATION
END_MDRG_ASSET_VALIDATION

BEGIN_MDRG_DEBUG_ITEM_CASES
END_MDRG_DEBUG_ITEM_CASES
```

Ou tornar o parser genérico para qualquer bloco:

```txt
BEGIN_MDRG_*
END_MDRG_*
```

Sem quebrar os nomes atuais.

---

## 1.5 Melhorar comparação de reports

O comando:

```powershell
python tools\probe_runtime_index.py --compare report-a.txt report-b.txt
```

já compara environment, symbols, fields, enums e callback contexts.

Adicionar também comparação de:

```txt
callback_args
callback_fields
callback_errors
```

Sugestões de chave:

```txt
callback field:
callback_id|phase|owner.field|status|type

callback error:
callback_id|phase|kind|path
```

A saída deve ter seções novas:

```md
## Callback fields

## Callback errors
```

---

## 1.6 Evitar `surrounding=None`

Em `render_runtime_probe_report()`, se `surrounding_context` não existir, não imprimir `None`.

Use fallback:

```txt
surrounding_context or detected_context or ""
```

---

# Parte 2 — Modo compat em `tools/validate_realmod_assets.py`

O validador atual está adequado para `mod/realmod`, mas pode ser rígido demais para dumps/mods antigos.

Adicione um modo compatível/tolerante.

## 2.1 CLI

Adicionar opção:

```powershell
python tools\validate_realmod_assets.py --root mod\realmod --mode strict
python tools\validate_realmod_assets.py --root caminho\mods_antigos --mode compat
```

Ou:

```powershell
--compat
```

Escolha o formato mais simples.

Padrão:

```txt
strict
```

para manter comportamento atual no `mod/realmod`.

---

## 2.2 Diferença entre strict e compat

### Strict

Usado para `mod/realmod` e debug mod atual.

Pode exigir:

```txt
Targets
DrawableType
BypassColorScaler
DontIncludeVanillaLayers
```

### Compat

Usado para dumps/mods antigos.

Em compat, os campos abaixo devem gerar warning, não erro:

```txt
Targets
DrawableType
BypassColorScaler
DontIncludeVanillaLayers
```

Campos extras devem ser aceitos.

O campo legado abaixo deve ser aceito como variação antiga:

```txt
Texture
```

---

## 2.3 Erros fatais mesmo em compat

Mesmo em modo compat, estes continuam erro:

```txt
JSON inválido
PackedTextures ausente em JSON de asset
PackedTextures vazio
TextureName ausente
TextureName apontando para PNG inexistente
PackedDrawables ausente
PackedDrawables vazio
RectInt ausente
RectInt.width <= 0
RectInt.height <= 0
```

---

## 2.4 Relatório

O relatório deve indicar o modo usado:

```md
- Validation mode: strict
```

ou:

```md
- Validation mode: compat
```

Se houver warnings por campos antigos/ausentes, agrupar como:

```md
## Compatibility warnings
```

---

# Parte 3 — Confirmar arquivos esperados

Confirme se existem no repo:

```txt
TODO.md
examples/mdrg_callback_context_probe.lua
examples/callback_debug_mod_real/README.md
analysis/callback_debug_coverage.md
analysis/callback_debug_manual_test_steps.md
analysis/lua_callback_contexts.md
analysis/callback_debug_cases.md
analysis/debug_mod_real_asset_requirements.md
analysis/debug_mod_real_plan.md
analysis/runtime_context_notes.md
analysis/lifecycle_event_clues.md
analysis/realmod_structure.md
analysis/realmod_asset_schema.md
analysis/realmod_asset_validation.md
analysis/realmod_item_patterns.md
analysis/packed_textures.schema.json
```

Se algum não existir:

- crie apenas se for claramente derivável das ferramentas já existentes;
- caso contrário, documente como pendente no `TODO.md`.

Não recrie conteúdo grande desnecessariamente.

---

# Parte 4 — README e documentação final

Revise o README do debug mod:

```txt
examples/callback_debug_mod_real/README.md
```

Ele deve explicar claramente:

1. O mod é opt-in.
2. Quais flags ativar para teste mínimo:

```lua
ENABLE_DEBUG_ITEMS = true
ENABLE_CALLBACK_PROBE = true
DEBUG_ADD_TO_SHOP = true
```

3. Qual shop usar.
4. Quais itens/categorias existem.
5. Quais callbacks são esperados.
6. Onde os reports aparecem.
7. Como comparar startup report, LuaExec report e callback report.
8. Quais casos são experimentais ou contextuais:
   - UI callbacks;
   - story callbacks;
   - coroutine callbacks;
   - texture callback;
   - manager events.
9. Que `mod/realmod` é apenas referência read-only.
10. Que callbacks não são chamados artificialmente.

---

# Parte 5 — Validações

Rode:

```powershell
python -m py_compile `
  tools\catalog_lua_callbacks.py `
  tools\probe_runtime_index.py `
  tools\validate_realmod_assets.py `
  tools\validate_debug_mod_real.py
```

Rode:

```powershell
python tools\validate_realmod_assets.py --root mod\realmod
python tools\validate_debug_mod_real.py --root examples\callback_debug_mod_real
python tools\catalog_lua_callbacks.py
```

Se implementar `--mode compat`, rode também algum teste simples se houver corpus disponível:

```powershell
python tools\validate_realmod_assets.py --root mod\realmod --mode compat
```

Rode checks de segurança:

```powershell
rg -n "SaveAllChanges\(|ResetAllData\(|AddGlobalFlag\(|ForceTakeMoney\(|OpenBrowser\(|ChangeWebsite\(|io\.popen\(" examples tools
```

Se aparecerem em listas de validação, regex ou texto de README, não tratar como erro. Tratar como erro apenas chamada real em código runtime do debug mod/helper.

Rode checks de presença:

```powershell
rg -n "BEGIN_MDRG_CALLBACK|callback_fields|callback_errors|MDRG_CALLBACK_PROBE_CHUNK|callback-report" tools examples analysis
rg -n "mode|compat|strict|Compatibility warnings" tools\validate_realmod_assets.py analysis
```

---

# Entrega esperada

Ao final, entregue:

1. Resumo das mudanças.
2. Arquivos alterados.
3. O que foi ajustado no `probe_runtime_index.py`.
4. O que foi ajustado no `validate_realmod_assets.py`.
5. Se o modo compat foi criado, explicar diferença entre strict e compat.
6. Quais arquivos esperados foram confirmados.
7. Quais arquivos, se algum, ficaram pendentes.
8. Resultado das validações.
9. Confirmação de que:
   - o jogo não foi rodado;
   - `mod/realmod` não foi editado;
   - `library/*.d.lua` não foi editado manualmente;
   - flags continuam desligadas por padrão;
   - `io.popen` não é chamado;
   - callbacks não são chamados artificialmente.
10. Diff relevante.

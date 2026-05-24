# Prompt para Codex — Refatorar `generate_luals_addon.py` em módulos menores

Você está trabalhando no repositório MDRG LuaLS addon.

## Problema

`tools/generate_luals_addon.py` tem aproximadamente 3000 linhas e acumula muitas responsabilidades:

```txt
- parsing de docs.txt;
- normalização de tipos;
- geração de classes/aliases/enums;
- merge de documented_functions.md;
- uso de runtime_probe_index;
- uso de unity/lua indexes;
- emissão de arquivos library/*.d.lua;
- cópia de extern/*.d.lua;
- geração de relatórios.
```

Isso torna manutenção arriscada.

## Objetivo

Refatorar sem mudar a saída gerada.

---

## Regras

- Não alterar conteúdo gerado em `library/*.d.lua` sem necessidade.
- Não mudar comportamento funcional no primeiro passo.
- Fazer refatoração em fases pequenas.
- Após cada fase, rodar geração e comparar diff.
- Se a saída gerada mudar, explicar por quê; idealmente não deve mudar.
- Não mexer em stubs manualmente.

---

## Parte 1 — Auditoria interna

Criar:

```txt
analysis/generator_refactor_plan.md
```

Listar funções de `generate_luals_addon.py` por responsabilidade:

```txt
- parsing;
- type normalization;
- LuaCATS rendering;
- docs/comments import;
- indexes loading;
- file writing;
- validation helpers;
- constants/config.
```

Identificar funções que podem mover sem dependências circulares.

---

## Parte 2 — Criar módulos candidatos

Estrutura sugerida:

```txt
tools/generator/
  __init__.py
  paths.py
  models.py
  type_normalization.py
  docs_parser.py
  comments.py
  render_luacats.py
  emit_library.py
  extern_stubs.py
```

Manter `tools/generate_luals_addon.py` como entrypoint fino.

Se isso for grande demais, começar apenas com:

```txt
tools/generator_type_normalization.py
tools/generator_rendering.py
```

---

## Parte 3 — Proteger comportamento com snapshots

Antes de refatorar:

```powershell
python tools\generate_luals_addon.py
```

Gerar snapshot hash dos `library/*.d.lua`:

```txt
analysis/generator_output_snapshot_before.json
```

Depois da refatoração:

```txt
analysis/generator_output_snapshot_after.json
```

Comparar hashes. Se iguais, registrar sucesso.

Criar tool simples se necessário:

```txt
tools/hash_generated_library.py
```

---

## Parte 4 — Testes mínimos

Rodar:

```powershell
python -m py_compile tools\*.py tools\generator\*.py
python tools\generate_luals_addon.py
python tools\validate_addon.py
```

Se `dev.py check` já cobre isso, usar:

```powershell
python tools\dev.py check
```

---

## Entrega esperada

1. Plano de refatoração em `analysis/generator_refactor_plan.md`.
2. Módulos criados.
3. Entry point preservado.
4. Hash/diff antes/depois.
5. Validações.
6. Confirmação se output de `library/` mudou ou não.

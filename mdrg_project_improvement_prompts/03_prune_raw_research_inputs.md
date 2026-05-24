# Prompt para Codex — Separar raw/research inputs do addon distributable

Você está trabalhando no repositório MDRG LuaLS addon.

## Problema

O ZIP atual mistura arquivos necessários ao addon com raw/research inputs grandes.

Exemplos observados:

```txt
json/mdrg_jsondump_tools/all_mods_dump/texture_json_dump.txt  ~11.6 MB
json/mdrg_jsondump_tools/all_mods_dump/png_asset_list.txt     ~1.1 MB
examples/mods_mixed.lua                                      ~5.7 MB
probe/report-*.txt                                           ~215 KB
old/*.md
archive/*.md
```

Esses arquivos são úteis para pesquisa, mas não deveriam estar no pacote/distribuição normal do addon.

## Objetivo

Criar uma política clara para separar:

```txt
1. addon runtime/distributable;
2. source-of-truth tracked;
3. generated outputs;
4. raw/research local inputs;
5. archived prompts/history.
```

---

## Regras

- Não delete arquivos automaticamente.
- Não edite `library/*.d.lua` manualmente.
- Não edite `mod/realmod/**`.
- Não apague dados de pesquisa sem mover para uma pasta acordada.
- Preserve reproducibilidade dos `data/*.json`.

---

## Parte 1 — Classificação dos arquivos

Criar relatório:

```txt
analysis/repository_payload_audit.md
```

Ele deve listar:

```txt
- arquivos maiores que 500 KB;
- diretórios por tamanho;
- arquivos que parecem raw input;
- arquivos que parecem generated output;
- arquivos que parecem distributable;
- arquivos que parecem archive/history.
```

Inclua tabela:

```md
| Path | Size | Category | Recommendation |
|---|---:|---|---|
```

Categorias sugeridas:

```txt
addon-core
source-of-truth
curated-index
generated-stub
generated-report
raw-research-input
runtime-probe-output
archive-prompt
debug-example
tooling
```

---

## Parte 2 — Propor nova estrutura

Não precisa mover tudo na primeira passada, mas propor:

```txt
research/
  json_dumps/
  mods_mixed/
  runtime_probes/

archive/
  prompts/
  old_plans/

analysis/
  generated/

examples/
  small_examples_only/

dist/
  mdrg-luals-addon.zip
```

Ou manter pastas atuais, mas documentar política de ignore/package.

---

## Parte 3 — Atualizar `.gitignore`

Revisar `.gitignore`.

Hoje ele ignora:

```txt
dump/
rawdump/
examples/mods_mixed.lua
__pycache__/
*.pyc
.luals-*/
.tmp_raw_sources/
```

Considere adicionar, se alinhado com a política:

```txt
probe/runtime_test_*/
probe/report-*.txt
json/mdrg_jsondump_tools/all_mods_dump/
json/mdrg_jsondump_tools/output/
dist/
*.zip
```

Cuidado:

- Não ignore `analysis/*.md` se eles forem parte rastreada do projeto.
- Não ignore `data/*.json` porque são índices curados.
- Não ignore `library/*.d.lua`, porque são saída do addon.

---

## Parte 4 — Mover ou arquivar com segurança

Se o usuário aceitar aplicar:

- mover `json/mdrg_jsondump_tools/all_mods_dump/` para `research/json_dumps/all_mods_dump/`;
- mover `examples/mods_mixed.lua` para `research/mods_mixed/mods_mixed.lua`;
- manter `json/mdrg_jsondump_tools/process_mdrg_json_dumps.py` ou mover para `tools/research/`;
- mover prompts soltos da raiz para `archive/prompts/`.

Mas nesta tarefa, se houver dúvida, só gere o relatório e atualize docs. Não faça remoções agressivas.

---

## Parte 5 — Atualizar README/AGENTS/SKILL

Atualizar:

```txt
README.md
AGENTS.md
SKILL.md
```

para explicar:

```txt
- o que é core do addon;
- o que é pesquisa local;
- o que é output gerado;
- o que entra em pacote final;
- o que não deve ser versionado ou empacotado.
```

---

## Validação

Rodar:

```powershell
python tools\validate_addon.py
python -m py_compile tools\*.py
```

Se mexer em `.gitignore`, não use comandos destrutivos.

---

## Entrega esperada

1. `analysis/repository_payload_audit.md`.
2. Proposta de layout.
3. `.gitignore` atualizado se apropriado.
4. README/AGENTS/SKILL atualizados.
5. Lista de arquivos que poderiam ser movidos/removidos, sem apagá-los.

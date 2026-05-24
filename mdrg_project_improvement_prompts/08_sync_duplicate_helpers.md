# Prompt para Codex — Sincronizar helpers duplicados sem drift

Você está trabalhando no repositório MDRG LuaLS addon.

## Problema

Há um par de arquivos exatamente duplicados:

```txt
examples/mdrg_callback_context_probe.lua
examples/callback_debug_mod_real/mdrg_callback_context_probe.lua
```

Isso pode ser intencional:

- o primeiro é helper standalone;
- o segundo é cópia empacotada dentro do debug mod real.

Mas, se um for editado e o outro não, eles vão divergir.

Também há cópia intencional:

```txt
extern/mdrg_safe_io.d.lua
library/mdrg_safe_io.d.lua
```

Essa segunda já deve ser gerada/copied durante `generate_luals_addon.py`.

## Objetivo

Criar regra/tool de sincronização para helpers duplicados.

---

## Parte 1 — Definir fonte de verdade

Documentar em:

```txt
analysis/duplicate_helpers_policy.md
```

Proposta:

```txt
examples/mdrg_callback_context_probe.lua = fonte de verdade
examples/callback_debug_mod_real/mdrg_callback_context_probe.lua = cópia empacotada
```

Ou o inverso, se preferir. Escolha uma só.

Para safe IO:

```txt
extern/mdrg_safe_io.d.lua = fonte de verdade
library/mdrg_safe_io.d.lua = saída gerada
```

---

## Parte 2 — Criar sync tool

Criar:

```txt
tools/sync_example_helpers.py
```

Com opções:

```powershell
python tools\sync_example_helpers.py --check
python tools\sync_example_helpers.py --write
```

Comportamento:

- `--check`: compara hashes e falha se cópias divergirem.
- `--write`: copia fonte de verdade para destino.
- Nunca edita `library/*.d.lua`, exceto se for fluxo já existente de geração para safe IO.
- Para callback helper, copiar standalone para debug mod.

---

## Parte 3 — Integrar ao dev.py

Adicionar comando opcional:

```powershell
python tools\dev.py sync
```

ou incluir em:

```powershell
python tools\dev.py check
```

com apenas `--check`, não `--write`.

---

## Parte 4 — README/AGENTS

Documentar:

```txt
- edite o helper standalone;
- rode sync para atualizar cópia do debug mod;
- não edite cópia empacotada diretamente, salvo teste local.
```

---

## Validação

Rodar:

```powershell
python -m py_compile tools\sync_example_helpers.py
python tools\sync_example_helpers.py --check
```

Se divergirem, rodar:

```powershell
python tools\sync_example_helpers.py --write
python tools\sync_example_helpers.py --check
```

---

## Entrega esperada

1. `analysis/duplicate_helpers_policy.md`.
2. `tools/sync_example_helpers.py`.
3. `dev.py` atualizado se apropriado.
4. README/AGENTS atualizados.
5. Validação.

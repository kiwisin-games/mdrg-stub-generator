# Prompt para Codex — Health check final do projeto MDRG LuaLS addon

Você está trabalhando no repositório MDRG LuaLS addon.

## Objetivo

Executar uma revisão final de saúde do projeto após as limpezas/refactors.

---

## Checks obrigatórios

### Python

```powershell
python -m py_compile tools\*.py
python tools\validate_addon.py
python tools\validate_debug_mod_real.py --root examples\callback_debug_mod_real
python tools\catalog_lua_callbacks.py
```

Se `mod/realmod` existir:

```powershell
python tools\validate_realmod_assets.py --root mod\realmod --mode strict
python tools\validate_realmod_assets.py --root mod\realmod --mode compat
```

Se houver runtime tests:

```powershell
python tools\summarize_runtime_tests.py --root probe
```

### Segurança

```powershell
rg -n "SaveAllChanges\(|ResetAllData\(|AddGlobalFlag\(|ForceTakeMoney\(|OpenBrowser\(|ChangeWebsite\(|io\.popen\(" examples tools
```

Interpretar corretamente:

- ocorrência em regex/lista de bloqueio/documentação = ok;
- chamada real em runtime/helper/debug mod = erro.

### Duplicatas

```powershell
python tools\sync_example_helpers.py --check
```

se essa ferramenta existir.

### Payload

Gerar ou atualizar:

```txt
analysis/repository_payload_audit.md
```

Confirmar que não há raw dumps enormes em pacote final.

---

## Auditoria de consistência

Verificar:

```txt
README.md
AGENTS.md
SKILL.md
TODO.md ou STATUS.md
.gitignore
tools/dev.py
```

Procurar contradições sobre:

```txt
luas/
probe/
json dumps
mod/realmod
library/
extern/
analysis/
archive/
```

---

## Entrega esperada

Criar:

```txt
analysis/final_health_check.md
```

Com:

```md
# Final health check

## Validation results

| Command | Result | Notes |
|---|---|---|

## Known warnings

## Remaining intentional exceptions

## Files still large

## Recommended next work
```

Não fazer mudanças grandes nesta tarefa. Apenas correções pequenas e seguras.

---

## Critérios de aceite

- Python compile passa.
- Addon validation passa.
- Debug mod validation passa com flags false por padrão.
- Não há chamadas perigosas reais.
- `library/*.d.lua` não foi editado manualmente.
- Packaging limpo existe ou está documentado.
- Raw/research inputs estão ignorados, movidos ou documentados.

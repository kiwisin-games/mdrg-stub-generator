# Prompt para Codex — Criar empacotamento limpo do addon LuaLS

Você está trabalhando no repositório MDRG LuaLS addon.

## Problema

O diretório de desenvolvimento contém muito mais do que o addon LuaLS precisa para funcionar:

```txt
analysis/
archive/
old/
probe/
json/mdrg_jsondump_tools/all_mods_dump/
examples/callback_debug_mod_real/
tools/
luas/
documented_functions.md
undocumented_functions.md
```

Para distribuição/instalação do LuaLS addon, provavelmente basta algo como:

```txt
config.json
info.json
README.md
library/
```

Talvez também:

```txt
AGENTS.md
SKILL.md
extern/
examples/test.lua
```

dependendo do público.

## Objetivo

Criar um processo de empacotamento que gere um ZIP limpo sem raw dumps, probes, prompts e research inputs.

---

## Parte 1 — Definir manifest de distribuição

Criar:

```txt
dist/manifest.addon.json
```

ou:

```txt
tools/package_manifest.json
```

Com includes:

```json
{
  "include": [
    "config.json",
    "info.json",
    "README.md",
    "library/**/*.d.lua",
    "examples/test.lua"
  ],
  "optional_include": [
    "extern/**/*",
    "AGENTS.md",
    "SKILL.md"
  ],
  "exclude": [
    "dump/**",
    "rawdump/**",
    "luas/**",
    "probe/**",
    "analysis/**",
    "archive/**",
    "old/**",
    "json/mdrg_jsondump_tools/all_mods_dump/**",
    "examples/mods_mixed.lua",
    "examples/callback_debug_mod_real/**",
    "tools/**",
    "*.zip"
  ]
}
```

---

## Parte 2 — Criar package script

Criar:

```txt
tools/package_addon.py
```

CLI:

```powershell
python tools\package_addon.py
python tools\package_addon.py --output dist\mdrg-luals-addon.zip
python tools\package_addon.py --include-dev-docs
```

O script deve:

- validar addon antes de empacotar;
- copiar/zipar apenas includes;
- listar tamanho final;
- gerar relatório:

```txt
dist/package_report.md
```

com arquivos incluídos/excluídos.

---

## Parte 3 — Proteger contra arquivos pesados

O script deve falhar ou avisar se tentar incluir:

```txt
*.txt > 1 MB
*.lua > 1 MB fora de library/
json/mdrg_jsondump_tools/all_mods_dump/
examples/mods_mixed.lua
probe/
```

---

## Parte 4 — README

Adicionar seção:

```md
## Packaging

python tools\package_addon.py
```

Explicar diferença entre:

```txt
development repository
LuaLS addon package
debug mod examples
research inputs
```

---

## Validação

Rodar:

```powershell
python -m py_compile tools\package_addon.py
python tools\validate_addon.py
python tools\package_addon.py
```

Inspecionar ZIP gerado e confirmar que não contém:

```txt
json/mdrg_jsondump_tools/all_mods_dump/
probe/
archive/
old/
examples/mods_mixed.lua
```

---

## Entrega esperada

1. `tools/package_addon.py`.
2. Manifest de packaging.
3. `dist/package_report.md`.
4. README atualizado.
5. Confirmação do tamanho final do ZIP.

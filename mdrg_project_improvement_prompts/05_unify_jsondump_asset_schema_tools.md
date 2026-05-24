# Prompt para Codex — Unificar ferramentas de JSON dump/assets schema

Você está trabalhando no repositório MDRG LuaLS addon.

## Problema

Existem pelo menos dois fluxos relacionados a JSON/assets:

```txt
json/mdrg_jsondump_tools/process_mdrg_json_dumps.py
tools/validate_realmod_assets.py
analysis/packed_textures.schema.json
json/mdrg_jsondump_tools/output/assets.schema.json
json/mdrg_jsondump_tools/output/mod.schema.json
```

Isso cria risco de divergência:

- schema do `realmod` vs schema dos dumps grandes;
- strict vs compat;
- relatórios em `analysis/` vs `json/mdrg_jsondump_tools/output/`;
- scripts fora de `tools/`.

## Objetivo

Consolidar o fluxo de asset schema/dumps sem perder pesquisa.

---

## Regras

- Não apagar dumps automaticamente.
- Não editar `mod/realmod/**`.
- Não alterar `data/*.json` sem necessidade.
- Não quebrar `validate_realmod_assets.py --root mod/realmod`.
- Preservar modo `strict` e `compat`.

---

## Parte 1 — Auditar ferramentas existentes

Comparar:

```txt
json/mdrg_jsondump_tools/process_mdrg_json_dumps.py
tools/validate_realmod_assets.py
```

Criar:

```txt
analysis/jsondump_asset_tooling_audit.md
```

Listar:

```txt
- entradas esperadas;
- saídas geradas;
- schemas produzidos;
- regras strict/compat;
- campos exigidos;
- divergências.
```

---

## Parte 2 — Definir fonte única de schema

Escolher um dos caminhos:

### Opção A — Centralizar em `tools/asset_schema.py`

Criar módulo compartilhado:

```txt
tools/asset_schema.py
```

Com:

```python
PACKED_TEXTURES_SCHEMA_STRICT
PACKED_TEXTURES_SCHEMA_COMPAT
validate_packed_texture_json(...)
infer_asset_schema(...)
```

`validate_realmod_assets.py` e `process_mdrg_json_dumps.py` importam esse módulo.

### Opção B — Manter ferramentas separadas, mas documentar claramente

Se preferir não refatorar agora:

- `validate_realmod_assets.py`: validador de mod real/debug/strict.
- `process_mdrg_json_dumps.py`: ferramenta de pesquisa para dumps massivos.
- Escrever no README de cada uma que as saídas são diferentes.

Recomendação: Opção A, se a refatoração for pequena.

---

## Parte 3 — Unificar outputs

Padronizar saídas:

```txt
analysis/packed_textures.schema.json
analysis/packed_textures.compat.schema.json
analysis/realmod_asset_validation.md
analysis/jsondump_summary.md
analysis/jsondump_texture_asset_validation.md
```

Evitar manter outputs grandes em:

```txt
json/mdrg_jsondump_tools/output/
```

a menos que esse diretório seja explicitamente tratado como research output ignorado.

---

## Parte 4 — Compat mode

Garantir:

- `strict` exige campos modernos para `mod/realmod`.
- `compat` aceita campos antigos e transforma ausências em warnings:
  - `Targets`
  - `DrawableType`
  - `BypassColorScaler`
  - `DontIncludeVanillaLayers`
- `Texture` legado é aceito.
- Erros fatais continuam fatais:
  - JSON inválido;
  - `PackedTextures` ausente/vazio;
  - `TextureName` ausente ou PNG inexistente;
  - `PackedDrawables` ausente/vazio;
  - `RectInt` ausente;
  - `width/height <= 0`.

---

## Parte 5 — README

Atualizar:

```txt
json/mdrg_jsondump_tools/README.md
README.md
```

Explicar:

```txt
- quando usar validate_realmod_assets;
- quando usar process_mdrg_json_dumps;
- onde ficam dumps grandes;
- onde ficam outputs curados;
- quais outputs entram no repositório.
```

---

## Validação

Rodar:

```powershell
python -m py_compile tools\validate_realmod_assets.py json\mdrg_jsondump_tools\process_mdrg_json_dumps.py
python tools\validate_realmod_assets.py --root mod\realmod --mode strict
python tools\validate_realmod_assets.py --root mod\realmod --mode compat
```

Se `mod/realmod` não existir localmente, pular com mensagem clara.

---

## Entrega esperada

1. Relatório de auditoria.
2. Decisão de arquitetura.
3. Schema strict e compat consistentes.
4. Outputs documentados.
5. Validações.

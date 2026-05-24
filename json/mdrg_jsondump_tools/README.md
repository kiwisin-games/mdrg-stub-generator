# MDRG JSON Dump Tools

Ferramentas para processar dumps de `mod.json`, JSONs de `PackedTextures` e lista de assets gerados a partir de mods MDRG.

## Arquivos

```txt
process_mdrg_json_dumps.py
  Lê `mod_json_dump.txt`, `texture_json_dump.txt` e `png_asset_list.txt`.
  Gera schemas tolerantes, estatísticas e relatórios.
```

## Uso

```powershell
python .\json\mdrg_jsondump_tools\process_mdrg_json_dumps.py `
  --input-dir C:\caminho\para\dump-extraido `
  --output-dir analysis\jsondump
```

A pasta de input deve conter:

```txt
mod_json_dump.txt
texture_json_dump.txt
png_asset_list.txt
```

## Arquivos gerados

```txt
assets.schema.json
mod.schema.json
texture_schema_findings.json
mod_schema_findings.json
texture_asset_validation.json
texture_asset_validation.md
jsondump_summary.md
```

## Notas importantes

- O schema é intencionalmente tolerante, porque o dump contém mods antigos.
- `mod.json` não é validado como asset.
- Apenas JSONs com root `PackedTextures` entram no schema de asset.
- `Targets`, `DrawableType`, `BypassColorScaler` e `DontIncludeVanillaLayers` não são universais no dump.
- `Texture` aparece em mods antigos como referência Unity; por isso `additionalProperties` permanece `true`.
- PNG órfão é warning, não erro fatal.
- `png_asset_list.txt` do dump enviado contém vários tipos de arquivo, não só PNG; a ferramenta filtra por extensão.

## Relação com `validate_realmod_assets.py`

Use `tools\validate_realmod_assets.py` para validar um mod real ou debug mod
com assets presentes no disco:

```powershell
python .\tools\validate_realmod_assets.py --root mod\realmod --mode strict
python .\tools\validate_realmod_assets.py --root caminho\mod_antigo --mode compat
```

Use este diretório somente para pesquisa em dumps massivos. `all_mods_dump/` e
`output/` são tratados como pesquisa local ignorada e não entram no pacote do
addon.

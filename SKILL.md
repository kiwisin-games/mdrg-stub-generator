---
name: mdrg-luals-addon-maintenance
description: Maintain the MDRG LuaLS addon by updating generators, curated indexes, LuaCATS documentation, aliases, and validation without manually editing generated stubs.
---

# MDRG LuaLS addon maintenance skill

Use esta skill ao trabalhar no addon LuaLS MDRG: stubs LuaCATS, documentacao, aliases, indices curados, validacao estrutural ou melhorias no gerador.

## Workflow

1. Leia `README.md`, `AGENTS.md` e o pedido atual.
2. Localize a fonte de verdade antes de editar:
   - `docs.txt` para existencia publica e assinatura.
   - `data/*.json` para evidencia curada.
   - `documented_functions.md` para comentarios revisados.
   - `extern/*.d.lua` para stubs de plugins/bridges externos, como safe IO.
   - `mod/realmod/` somente como corpus read-only de mod real/assets.
   - `tools/*.py` para regras de geracao.
3. Nao edite `library/*.d.lua` manualmente.
4. Corrija `tools/generate_luals_addon.py`, indexadores ou dados curados.
5. Regere somente quando a tarefa exigir saida gerada.
6. Valide com `python .\tools\dev.py check` ou, para mudancas documentais simples, com buscas/diff nao mutantes.
7. Rode `python .\tools\dev.py sync` quando editar helpers duplicados em `examples/`.
8. Limpe caches com `python .\tools\dev.py clean` quando comandos Python criarem `__pycache__` ou `.luals-*`.

## Fontes e precedencia

- `docs.txt` decide se um simbolo existe e qual assinatura publica deve ser emitida.
- `dump/` e `rawdump/` servem apenas como evidencia C# para indices curados.
- `data/*.json` deve permitir regeneracao sem depender dos raw dumps locais.
- `extern/*.d.lua` e fonte rastreada e e copiada verbatim para `library/` apos a geracao dos stubs MDRG.
- `luas/` e corpus rastreado pequeno de pesquisa; ele complementa autocomplete, comentarios e callback reports quando ha uso real observado.
- `unity/mainScene` complementa aliases/runtime legacy quando ha uso real observado.
- `probe/` contem runtime reports locais; use `tools/summarize_runtime_tests.py` para resumir, mas nao trate como fonte automatica.
- `data/runtime_callback_evidence.json` e gerado por `tools/build_runtime_callback_evidence.py` a partir de callback reports e serve apenas como evidencia revisavel.
- `mod/realmod/` pode embasar docs, validadores e exemplos, mas nao deve ser editado.
- `documented_functions.md` complementa comentarios, mas nao deve alterar tipos, parametros, overloads ou existencia de membros.

## Padroes tecnicos

- Para stubs, corrija o pipeline e regenere; nao faca pos-processamento textual em `library/`.
- Comentarios devem ser curtos e verificaveis. Omita comentarios obvios como "retorna X" quando a assinatura ja explica.
- Para aliases de strings observadas, use `MdrgKnown...` e preserve `|string` em parametros quando mods podem usar valores customizados.
- Refine `any[]` somente com tipo C# unico e seguro. Se houver ambiguidade, mantenha `any[]`.
- `ValueTuple` e `KeyValuePair` devem ficar como `table` ou `table[]`; nao invente campos.
- Tipos C# comuns devem ser normalizados: colecoes para `T[]`, dicionarios para `table<K, V>`, `Action`/`Func` para `fun(...)`.
- Heranca deve vir preferencialmente do indice C# de `dump/`; interfaces nao devem virar pai LuaLS por padrao.
- `.` e `:` devem seguir o indice C# e os fallbacks existentes. Nao altere separador por inferencia visual de um script isolado.
- Campos obsoletos devem usar `---@deprecated` quando houver evidencia C# ou regra curada.
- `extern/mdrg_safe_io.d.lua` substitui a visao da `io` padrao pelo `io` seguro injetado pelo LuaPatch; nao duplique esse stub no gerador principal.
- Callback/lifetime debug deve ser opt-in: helpers e debug mods ficam inertes por padrao e nao chamam callbacks artificialmente.
- Evidencia runtime de callbacks pode confirmar comportamento por contexto, mas nao cria API, campo ou assinatura sem revisao e alinhamento com `docs.txt`.
- O helper standalone `examples/mdrg_callback_context_probe.lua` e fonte de verdade; a copia em `examples/callback_debug_mod_real/` deve ser sincronizada.
- Packaging limpo deve passar por `tools/package_addon.py`; `luas/`, raw dumps, probes e debug mods nao entram no ZIP normal.

## Contexto recente

- O projeto usa `library/` como saida unica do addon; a pasta `module/` nao deve ser recriada.
- `mdrg_usage.d.lua` guarda aliases derivados de scripts Lua de mods gerados pelo jogo.
- `mdrg_legacy_runtime_aliases.d.lua` guarda camada legacy/interna de Fungus/Unity mainScene, incluindo `gv`, `flowchart` e aliases internos.
- `mdrg_safe_io.d.lua` entra no addon por copia de `extern/` e deve ser validado como stub externo, nao inferido de `docs.txt`.
- `MdrgKnownWebsiteId` inclui websites internos observados em Lua/mainScene/browser scripts.
- LuaLS pode nao estar no PATH; isso deve ser tratado como aviso local, nao falha fatal do projeto.
- `validate_addon.py` aceita `luas/` rastreado, mas deve falhar se dumps grandes como `dump/`, `rawdump/` ou `examples/mods_mixed.lua` entrarem no Git.
- Contextos `CurrentModGuid`, `gv`, `flowchart` e safe IO variam por lifetime; ausencia em um report nao prova ausencia global.

## Comandos uteis

```powershell
python .\tools\dev.py generate
python .\tools\dev.py index
python .\tools\dev.py validate
python .\tools\dev.py check
python .\tools\dev.py sync
python .\tools\dev.py clean
```

Use `dev.py index` apenas quando os raw sources locais forem atualizados. Para mudancas de regra no gerador, normalmente `dev.py generate` e suficiente.

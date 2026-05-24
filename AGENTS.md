# AGENTS.md

Guia operacional para agentes Codex trabalhando no addon LuaLS MDRG.

## Contexto do projeto

Este repositorio gera um addon LuaLS/Sumneko para a API Lua MoonSharp do MDRG. O addon consumido pelo editor e formado principalmente por `config.json` e `library/*.d.lua`.

Use este diretorio como workspace:

```text
C:\Users\user\AppData\Roaming\Code\User\globalStorage\sumneko.lua\addonManager\addons\mdrg
```

## Fontes de verdade

- `docs.txt`: fonte autoritativa para existencia de classes, membros, assinaturas e tipos C# brutos expostos.
- `data/*.json`: indices curados e rastreados derivados de dumps C#, scripts Lua gerados pelo jogo e Unity mainScene.
- `data/runtime_callback_evidence.json`: evidencia revisavel de callbacks extraida de `probe/runtime_test_*`; nao aplica stubs automaticamente.
- `documented_functions.md`: documentacao revisada, importada somente quando alinhada ao `docs.txt`.
- `extern/*.d.lua`: stubs externos rastreados para plugins/bridges que nao pertencem ao dump MDRG, copiados para `library/` durante a geracao.
- `luas/`: corpus pequeno rastreado de Lua gerado pelo jogo, usado por ferramentas de uso/callback.
- `README.md`: detalhes de instalacao, layout e comandos publicos.

Raw sources grandes como `dump/`, `rawdump/` e `examples/mods_mixed.lua` sao entradas locais de pesquisa/rebuild e devem continuar ignorados pelo Git, salvo pedido explicito do usuario.
`luas/` e uma excecao intencional: fica rastreado para manter evidencias pequenas e reproduziveis, mas nao entra no pacote final.
`mod/realmod/` e corpus read-only para analise de mod real/assets. Nao edite arquivos dentro dele.

## Saida gerada

- `library/*.d.lua`: stubs LuaCATS gerados para o LuaLS.
- `library/mdrg_safe_io.d.lua`: copia de `extern/mdrg_safe_io.d.lua`, documentando o `io` seguro injetado pelo LuaPatch quando ativo.
- `config.json`, `info.json` e `README.md`: metadados do addon.
- `analysis/*.md`: relatorios de auditoria e geracao.

Nao edite `library/*.d.lua` manualmente. Corrija o gerador, os indexadores ou os dados curados e regenere.
Para stubs externos, edite `extern/*.d.lua`; a copia em `library/` e saida de build.

## Comandos principais

```powershell
python .\tools\dev.py check
python .\tools\dev.py generate
python .\tools\dev.py index
python .\tools\dev.py sync
python .\tools\dev.py validate
python .\tools\dev.py clean
```

- Use `dev.py generate` para regenerar stubs a partir de `docs.txt` e `data/*.json`.
- Use `dev.py index` somente depois de atualizar fontes de pesquisa como `dump/`, `rawdump/`, `luas/` ou `unity/mainScene`.
- Use `dev.py check` antes de entregar mudancas de geracao.
- Use `dev.py sync` para copiar o callback helper standalone para o debug mod empacotado.
- Use `dev.py clean` para remover caches locais como `__pycache__` e `.luals-*`.
- Use `python .\tools\build_runtime_callback_evidence.py --root probe` depois de obter callback reports locais para atualizar achados revisaveis.

LuaLS e opcional no PATH. Quando `lua-language-server` nao estiver disponivel, o projeto deve registrar aviso, nao falha fatal.

## Regras para mudancas

- Nao recrie a pasta `module/`.
- Nao apague `dump/`, `rawdump/`, `luas/` ou outros dados de pesquisa sem pedido explicito.
- `probe/` contem saidas runtime locais e nao deve entrar no pacote final.
- `json/mdrg_jsondump_tools/all_mods_dump/` e pesquisa local ignorada.
- Nao edite `mod/realmod/**`; crie exemplos/debug mods separados em `examples/`.
- Nao reverta mudancas do usuario. Se encontrar worktree suja, trabalhe ao redor dela.
- Nao troque `.` por `:` ou vice-versa sem evidencia do indice C# ou pedido claro.
- Nao invente campos, classes, aliases ou comportamento runtime que nao exista em `docs.txt` ou nos indices curados.
- Comentarios LuaDoc devem ser conservadores: omita texto redundante ou incerto.
- Quando valores customizados sao possiveis, aliases de autocomplete devem manter fallback `|string`.
- Nao gere uma `io` padrao separada quando `extern/mdrg_safe_io.d.lua` estiver presente; o contexto alvo usa `io` sandboxed do LuaPatch.

## Estado conhecido

`validate_addon.py` permite `luas/` como corpus rastreado, mas ainda falha se `dump/`, `rawdump/` ou `examples/mods_mixed.lua` entrarem no Git. `package_addon.py` deve excluir `luas/` do ZIP final.

## Padroes recentes importantes

- Heranca direta vem preferencialmente do indice C# derivado de `dump/`.
- Retornos `any[]` so sao refinados quando ha tipo C# unico e seguro em indice curado.
- `ValueTuple` e `KeyValuePair` viram `table` ou `table[]`; nao crie classes auxiliares com campos inventados.
- Aliases de uso pratico ficam em `mdrg_usage.d.lua`.
- Globais e aliases legacy/internos ficam isolados em `mdrg_legacy_runtime_aliases.d.lua`.
- `MdrgKnownWebsiteId` inclui websites internos observados em scripts de browser/mainScene.
- Runtime/lifetime deve ser tratado por contexto: mod startup, LuaExec/Fungus, save-aware e callbacks podem expor globais diferentes.
- Callback probes e debug mods devem ser opt-in e desativados por padrao.
- Reports de callback geram somente evidencias e sugestoes em `analysis/`; nunca aplique automaticamente em `library/`.
- Edite `examples/mdrg_callback_context_probe.lua` como fonte de verdade e sincronize `examples/callback_debug_mod_real/mdrg_callback_context_probe.lua`.
- Use `tools/package_addon.py` para gerar ZIP limpo; nao empacote `probe/`, `dump/`, `rawdump/`, `luas/`, `analysis/`, `archive/` ou debug mods.

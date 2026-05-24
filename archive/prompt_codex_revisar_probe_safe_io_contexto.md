# Prompt para Codex — Revisar melhorias finais do `mdrg_env_probe.lua` e safe IO

Você está trabalhando no repositório atual do addon LuaLS MDRG/MoonSharp.

Já foram implementadas melhorias no script:

```txt
examples/mdrg_env_probe.lua
```

E também foi integrado um stub externo de safe IO:

```txt
extern/mdrg_safe_io.d.lua
library/mdrg_safe_io.d.lua
```

Quero que você faça uma passada final de revisão e pequenos ajustes, sem reescrever tudo do zero.

## Objetivo

Garantir que o probe runtime:

- continue read-only;
- diferencie ambiente MDRG puro de ambiente injetado pelo LuaPatch/plugin;
- trate `io`/safe IO como bridge externa, não como API nativa do jogo;
- use `gv` como fallback para `GameVariables`;
- use `flowchart` como contexto interno/Fungus quando presente;
- faça field probing em `userdata` sem chamar funções;
- faça enum value probing de forma cautelosa;
- gere blocos machine-readable parseáveis mesmo quando o console adiciona prefixos;
- mantenha `library/*.d.lua` como saída gerada e `extern/*.d.lua` como fonte.

Não altere o escopo do projeto. Não crie ferramentas grandes novas nesta etapa.

---

# Contexto atual

O último resumo de implementação informou que já existem:

```txt
safe_raw_get / safe_index_get
TABLE_ENUM_MODE = "raw"
Report:text() sem mutar Report.lines
modo console reduzido quando io.open não existe
get_effective_game_variables(): GameVariables -> gv
seções Legacy/Internal Runtime Context, Known Field Probe, Enum Value Probe
blocos machine-readable BEGIN_MDRG_PROBE_*
skip de dump profundo em console-safe mode
extern/mdrg_safe_io.d.lua copiado para library/mdrg_safe_io.d.lua pelo gerador
probe_runtime_index.py lendo blocos machine-readable
```

O report antigo mostrou que:

```txt
GameVariables: missing
gv: userdata <GameVariables>
flowchart: userdata <Main Flowchart (Fungus.Flowchart)>
io: missing no report antigo
fallback por print foi usado
a maioria das APIs MDRG aparece como userdata
getmetatable() retornou none para quase tudo
```

Agora existe um plugin que pode injetar safe IO. Portanto o próximo report pode mostrar `io` presente, mas isso deve ser tratado como API injetada pelo LuaPatch/plugin, não como API nativa do MDRG.

---

# Regras do projeto

Respeite estas regras:

- Não edite `library/*.d.lua` manualmente.
- Se precisar ajustar o stub de safe IO, edite `extern/mdrg_safe_io.d.lua`.
- `library/mdrg_safe_io.d.lua` deve ser cópia gerada de `extern/mdrg_safe_io.d.lua`.
- Não recrie pasta `module/`.
- Não remova arquivos raw antigos de `luas/`, `dump/`, `rawdump/` ou similares.
- Não altere stubs gerados diretamente.
- Não altere `data/*.json` sem necessidade clara.
- LuaLS pode não estar no PATH; isso deve ser aviso, não falha fatal.
- `validate_addon.py --health` pode falhar por arquivos antigos em `luas/` ainda rastreados; não corrija isso removendo arquivos sem pedido do usuário.

---

# Melhorias e revisões obrigatórias

## 1. Marcar safe IO como contexto injetado

No `examples/mdrg_env_probe.lua`, adicione ou revise uma seção do report:

```txt
## Probe Contamination / Injection Context
```

Ela deve detectar e reportar:

```txt
io
io.open
io.read
io.write
io.safe / safe flags, se existirem
debug
package
gv
flowchart
CurrentModGuid
GameVariables
ModUtilities
GameUtilities
```

A seção deve deixar claro:

```txt
io present: yes/no
io.open present: yes/no
safe io likely injected: yes/no/unknown
native MDRG io: unknown
execution context: LuaPatch/exec/mod/fungus/unknown
```

Se `io` existir, não assumir que é nativo. Escrever algo como:

```txt
io is present in this runtime. If running through LuaPatch/safe IO plugin, treat this as injected bridge API, not native MDRG API.
```

Se `io` não existir:

```txt
io missing; console fallback mode expected.
```

## 2. Configuração manual de contexto do probe

Adicionar no topo do script uma configuração simples:

```lua
local PROBE_CONTEXT_LABEL = "unknown" -- examples: "luapatch-exec-safeio", "luapatch-exec-no-safeio", "normal-mod"
local SAFE_IO_EXPECTED = false
```

O report deve imprimir esses valores.

Isso ajuda a comparar reports diferentes:

```txt
report-luapatch-exec-safeio.txt
report-luapatch-exec-no-safeio.txt
report-normal-mod.txt
```

Não use isso para alterar comportamento perigoso. É apenas metadata.

## 3. Garantir que Known Field Probe nunca chama função

Revise `Known Field Probe`.

Ele pode fazer:

```lua
local ok, value, source = safe_index_get(obj, fieldName)
```

Mas não pode fazer:

```lua
value()
obj[fieldName]()
```

Se o campo retornado for `function`, apenas reportar:

```txt
field|GameUtilities|WaitForSecondsYield|function|present|source=index|not-called
```

Adicionar uma nota explícita no report:

```txt
Known Field Probe only indexes fields/properties. Functions returned by field probing are never invoked.
```

Procure no script por padrões perigosos próximos do field probe:

```txt
()
:SomeName(
.Call(
safe_call(
```

`safe_call` só deve ser usado para APIs internas do próprio script ou chamadas explicitamente permitidas, como `os.date` e `io.open`, nunca para funções descobertas no field probe.

## 4. `ENABLE_SAFE_CONTEXT_CALLS` deve continuar `false`

Se existir esta flag:

```lua
local ENABLE_SAFE_CONTEXT_CALLS = false
```

Confirme que:

- ela está desativada por padrão;
- nenhuma função MDRG contextual é chamada se ela estiver `false`;
- se algum dia for ativada manualmente, as chamadas ficam em uma seção própria e com lista branca.

Por padrão, não chamar:

```txt
ModUtilities.GetGameVariables()
BrowserPopup.ChangeWebsite()
UiOverlay.OpenBrowser()
SaveSingleton.SaveAllChanges()
SaveContainer.AddGlobalFlag()
GameVariables.AddMoney()
GameVariables.ForceTakeMoney()
Item.Equip()
Item.Consume()
```

## 5. Melhorar `gv` como fallback efetivo

Revise `get_effective_game_variables()`.

Ele deve reportar:

```txt
GameVariables global: present/missing
gv legacy alias: present/missing
Effective GameVariables source: GameVariables/gv/none
```

Se `GameVariables` estiver ausente e `gv` presente:

```txt
Effective GameVariables source: gv
```

Não trate `GameVariables` missing como erro real quando `gv` existe em contexto `exec.lua`/Fungus.

## 6. Melhorar seção `Legacy/Internal Runtime Context`

A seção deve mostrar:

```txt
gv: present/missing
gv type
gv tostring
flowchart: present/missing
flowchart type
flowchart tostring
CurrentModGuid present/missing
GameVariables present/missing
```

Se `flowchart` parece ser Fungus:

```txt
flowchart appears to be scene/Fungus context; treat as internal/contextual, not stable mod global.
```

Se `gv` existe:

```txt
gv appears to be legacy/internal GameVariables alias.
```

## 7. Enum Value Probe cauteloso

Revise `Enum Value Probe`.

Para enums `userdata`, ele deve apenas tentar acesso por nome:

```lua
safe_index_get(enumObj, valueName)
```

Não chamar nada.

O report deve usar linguagem cautelosa:

```txt
ControllerEnum.Missionary: present via index access
ControllerEnum.NoScene: missing
```

Não escrever que a enum inteira está confirmada. Usar:

```txt
probe attempt
present via index access
missing in this context
access failed
```

## 8. Evitar falsos positivos em Enum-like

O report antigo classificou alguns tipos como enum-like por heurística ampla.

Ajuste a heurística:

- Para `userdata`, só marcar como enum-like se:
  - nome está em `ENUM_PRIORITY_NAMES`; ou
  - nome está em `ENUM_VALUE_PROBES`; ou
  - nome termina explicitamente com:
    - `Enum`
    - `Type`
    - `Status`
    - `Selection`

Não marque como enum-like apenas por conter:

```txt
Slot
State
Flag
```

Isso evita falsos positivos como:

```txt
ColorSlot
GlobalFlag
ItemSlot
```

Para tabelas Lua, a heurística por scalar-majority ainda pode existir.

## 9. Machine-readable precisa ser parseável com prefixos de console

O console pode prefixar cada linha assim:

```txt
[LuaPatch] [Lua:exec.lua] BEGIN_MDRG_PROBE_SYMBOLS
```

Revise `tools/probe_runtime_index.py` para garantir que ele consiga limpar prefixos antes de detectar:

```txt
BEGIN_MDRG_PROBE_SYMBOLS
END_MDRG_PROBE_SYMBOLS
BEGIN_MDRG_PROBE_CALLABLES
END_MDRG_PROBE_CALLABLES
BEGIN_MDRG_PROBE_FIELDS
END_MDRG_PROBE_FIELDS
BEGIN_MDRG_PROBE_ENUM_VALUES
END_MDRG_PROBE_ENUM_VALUES
```

Se a ferramenta já faz isso, apenas confirme.

Se não fizer, adicionar uma função pequena tipo:

```python
def strip_log_prefix(line: str) -> str:
    # remove prefixes like:
    # [19:07:14.020] [LuaPatch] [Lua:exec.lua] actual text
    # [Lua:exec.lua] actual text
    return cleaned
```

Não transformar o ingester em ferramenta complexa. Só garanta parsing robusto dos blocos.

## 10. Machine-readable deve incluir safe IO

Se ainda não existir, incluir no bloco machine-readable:

```txt
BEGIN_MDRG_PROBE_SYMBOLS
symbol|io|table|present|source=runtime
symbol|io.open|function|present|source=runtime
symbol|gv|userdata|present|source=runtime
symbol|flowchart|userdata|present|source=runtime
END_MDRG_PROBE_SYMBOLS
```

E, se fizer sentido:

```txt
BEGIN_MDRG_PROBE_ENVIRONMENT
context_label|luapatch-exec-safeio
safe_io_expected|true
io_present|true
io_open_present|true
effective_game_variables_source|gv
END_MDRG_PROBE_ENVIRONMENT
```

Se adicionar esse novo bloco, atualizar `probe_runtime_index.py` para reconhecer sem quebrar reports antigos.

## 11. `Possibly Undocumented Globals` deve ficar mais limpa

Como vários símbolos que apareceram no report antigo já existem nos stubs, confirme que `KNOWN_STUB_SYMBOLS` inclui pelo menos:

```txt
AllowedModifiers
AtLeastOneBoolVariableTrueRequirement
CommonAllowedModifiersEnum
CookingSong
CookingSongRuntimeData
EdibleItemNutritionProfile
EdibleTypeEnum
FinishedType
FishingBaitItemPrefabData
FishingCatchBehaviourType
FishingRodItemPrefabData
FishItemPrefabData
FishPreferences
GlobalFlag
ItemModifiableVariableFactory
ItemModifiableVariablesRequirement
ItemScopeCondition
ItemScopeConditionAlwaysTrueCondition
ItemScopeConditionCustom
ItemScopeConditionSpecialVariable
ItemSubCategory
Live2DControllerSingleton
NewsId
NoteButtonTypeEnum
R
Recipe
Result
Shop
ShopItem
ShopManager
SingleArgumentComparators
SlotManager
SoundSingleton
StoryAutoBranch
StoryBlockTarget
StoryBotContainerTypeEnum
StoryBranchTarget
StoryEnumeratorTarget
StoryLocalizedConversationBranchTarget
StoryMenuBranch
StorySingleton
SusArea
SusModifier
TimeCheckType
TwoArgumentComparators
ViewSingleton
gv
flowchart
pack
unpack
```

Se algum desses não existir nos stubs, não adicione como stub. Aqui é só a lista do probe para evitar falso “undocumented” baseado no report antigo.

## 12. Output/fallback

Quando `io.open` não existir:

```txt
Result: printed to console fallback.
Fallback mode: reduced.
Reason: io table unavailable.
```

Quando `io.open` existir por safe IO:

```txt
Result: saved with io.open.
io source: present; may be injected safe IO depending on PROBE_CONTEXT_LABEL/SAFE_IO_EXPECTED.
```

Se `SAFE_IO_EXPECTED = true` e `io.open` existir:

```txt
Safe IO expected and io.open present.
```

Se `SAFE_IO_EXPECTED = true` e `io.open` não existir:

```txt
Safe IO expected but io.open missing.
```

---

# Validação estática

Depois de alterar, rode ou sugira:

```powershell
rg -n "Probe Contamination|PROBE_CONTEXT_LABEL|SAFE_IO_EXPECTED|BEGIN_MDRG_PROBE_ENVIRONMENT|strip_log_prefix|Known Field Probe|Enum Value Probe" .
rg -n "safe_call|GetGameVariables|ChangeWebsite|OpenBrowser|SaveAllChanges|AddGlobalFlag|ForceTakeMoney|Item.Equip|Item.Consume" examples tools extern
git diff -- examples/mdrg_env_probe.lua tools/probe_runtime_index.py extern/mdrg_safe_io.d.lua tools/generate_luals_addon.py
```

Se nomes perigosos aparecerem em `examples/mdrg_env_probe.lua`, verifique que estão apenas em strings/listas de skip/probe e não são chamados.

---

# Entrega esperada

Ao final, entregue:

1. Resumo curto das mudanças.
2. Arquivos alterados.
3. Confirmação de que `library/*.d.lua` não foi editado manualmente.
4. Confirmação de que `extern/mdrg_safe_io.d.lua` é fonte do safe IO.
5. Confirmação de que field probe não chama funções.
6. Confirmação de que `ENABLE_SAFE_CONTEXT_CALLS` continua `false`.
7. Confirmação de que `probe_runtime_index.py` parseia blocos com prefixo de console.
8. `git diff` relevante ou resumo do diff.

Não rode o jogo. Não gere novo report. O usuário vai rodar depois e enviar para comparação.

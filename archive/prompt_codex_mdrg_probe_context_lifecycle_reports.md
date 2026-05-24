# Prompt para Codex — Melhorar o probe runtime MDRG com classificação de contexto, comparação de reports e lifecycle/events

Você está trabalhando no repositório atual do addon LuaLS MDRG/MoonSharp.

Já existe o script:

```txt
examples/mdrg_env_probe.lua
```

Ele gera reports runtime do ambiente Lua/MoonSharp do jogo.

Também existe um safe IO injetado pelo plugin/LuaPatch e documentado via stub externo:

```txt
extern/mdrg_safe_io.d.lua
library/mdrg_safe_io.d.lua
```

Quero que você faça uma nova rodada de melhorias **sem reescrever tudo do zero**.

O foco agora é usar as diferenças entre os reports para classificar o contexto de execução:

- report via `LuaExec`/exec depois do save/cena;
- report carregado por um mod na inicialização;
- report carregado por um mod com safe IO ativo.

---

## O que os reports mostraram

### Report via LuaExec/exec depois do save/cena

Características observadas:

```txt
CurrentModGuid: missing
GameVariables: missing
gv: present as userdata <GameVariables>
flowchart: present as userdata <Main Flowchart (Fungus.Flowchart)>
io: may be present if safe IO is injected
Effective GameVariables source: gv
```

Interpretação:

```txt
Contexto provável: LuaExec / console / script injetado manualmente / contexto Fungus/cena.
```

Esse contexto é bom para observar:

- `gv`;
- `flowchart`;
- campos runtime de `GameVariables`;
- funções de `flowchart`;
- contexto de save/cena já carregado.

Mas não deve ser tratado como mod normal, porque `CurrentModGuid` pode faltar.

---

### Report carregado por mod na inicialização

Características observadas:

```txt
CurrentModGuid: present
GameVariables: missing
gv: missing
flowchart: missing
ModUtilities: present
GameUtilities: present
SaveContainer: present
SaveSingleton: present
StorySingleton: present
io: may be missing if safe IO não foi carregado ainda
```

Interpretação:

```txt
Contexto provável: script de mod real, fase OnGameStart / inicialização do mod, antes de save/cena/Fungus estar disponível.
```

Esse contexto é bom para observar:

- `CurrentModGuid`;
- APIs globais de mod;
- `ModUtilities`;
- `GameUtilities`;
- classes/tipos/constructors expostos;
- APIs registráveis ou de setup.

Mas não é bom para observar:

- `gv`;
- `flowchart`;
- `GameVariables`;
- estado do save;
- variáveis de cena.

---

### Report carregado por mod com safe IO corrigido

Características observadas:

```txt
CurrentModGuid: present
io: present
io.open: present
io.popen: present
io.tmpfile: present
Result: saved with io.open
GameVariables/gv/flowchart: still missing in OnGameStart-like context
```

Interpretação:

```txt
Contexto provável: mod real + safe IO bridge ativa + fase inicial antes do save/cena.
```

Importante:

- `io` não deve ser tratado como API nativa do MDRG.
- `io` deve ser classificado como bridge externa do LuaPatch/plugin.
- Se `SAFE_IO_EXPECTED = true`, a presença de `io` deve ser reportada como esperada/injetada.

---

# Objetivo desta tarefa

Atualizar o probe e ferramentas relacionadas para:

1. Classificar automaticamente o contexto de execução.
2. Diferenciar LuaExec/console de mod real carregado pelo sistema do jogo.
3. Diferenciar mod inicializado antes de save/cena de contexto pós-save/Fungus.
4. Reportar safe IO como bridge/plugin, não como API nativa do jogo.
5. Melhorar o machine-readable output para comparar reports.
6. Criar base para investigação segura de lifecycle/events como `OnGameStart`, possível `OnSaveLoad`, etc.
7. Corrigir validações que ainda tratam `GameVariables` missing de forma repetida e pouco informativa.
8. Manter tudo read-only por padrão.

---

# Restrições

Não fazer nesta tarefa:

- Não alterar stubs gerados em `library/*.d.lua` manualmente.
- Não alterar save.
- Não alterar inventário.
- Não alterar flags.
- Não alterar dinheiro.
- Não abrir UI/browser.
- Não chamar funções descobertas automaticamente.
- Não chamar funções de save/UI/contexto por padrão.
- Não criar evento real em C#/MelonLoader nesta tarefa.
- Não criar bridge nova de eventos nesta tarefa.
- Não assumir que `OnSaveLoad` existe.
- Não alterar `data/*.json` sem necessidade clara.
- Não apagar arquivos raw antigos.
- Não recriar pasta `module/`.

Se precisar ajustar safe IO, edite apenas:

```txt
extern/mdrg_safe_io.d.lua
```

e deixe o gerador copiar para:

```txt
library/mdrg_safe_io.d.lua
```

---

# Melhorias obrigatórias no `mdrg_env_probe.lua`

## 1. Adicionar classificação de contexto

Criar função:

```lua
detect_execution_context()
```

Ela deve usar sinais simples e reportáveis.

### Sinais

```txt
CurrentModGuid present
GameVariables present
gv present
flowchart present
io present
io.open present
ModUtilities present
GameUtilities present
safe IO expected
PROBE_CONTEXT_LABEL manual
```

### Classificações sugeridas

Retornar algo como:

```txt
mod-start
mod-with-safe-io-start
luaexec-scene-context
luaexec-with-safe-io-scene-context
unknown-plugin-context
unknown
```

### Heurísticas

```txt
CurrentModGuid present + gv missing + flowchart missing:
  likely mod-start / OnGameStart-like context.

CurrentModGuid present + io.open present + gv missing + flowchart missing:
  likely mod-with-safe-io-start.

CurrentModGuid missing + gv present + flowchart present:
  likely luaexec-scene-context.

CurrentModGuid missing + gv present + flowchart present + io.open present:
  likely luaexec-with-safe-io-scene-context.

GameVariables present:
  likely save-aware context.

gv present:
  likely legacy/internal GameVariables alias context.

flowchart present:
  likely Fungus/scene script context.
```

Não usar essa classificação como certeza absoluta. Reportar como “likely”.

---

## 2. Adicionar seção `Execution Context Classification`

Adicionar ao report:

```txt
## Execution Context Classification
```

Com saída parecida:

```txt
Detected context: mod-with-safe-io-start
Confidence: medium
Reason:
- CurrentModGuid present
- io.open present
- GameVariables missing
- gv missing
- flowchart missing
Interpretation:
- This looks like a real mod script running during initial mod/game startup.
- Save/Fungus context is not available yet.
- Safe IO appears injected by LuaPatch/plugin.
```

Para LuaExec:

```txt
Detected context: luaexec-scene-context
Reason:
- CurrentModGuid missing
- gv present
- flowchart present
Interpretation:
- This looks like manual/plugin execution in a scene/Fungus context.
- It should not be treated as normal mod startup.
```

---

## 3. Adicionar `PROBE_CONTEXT_LABEL` e safe IO metadata

No topo do script:

```lua
local PROBE_CONTEXT_LABEL = "auto" -- examples: "mod-start", "mod-safeio-start", "luaexec-scene", "luaexec-safeio-scene"
local SAFE_IO_EXPECTED = false
```

Se o usuário quiser, ele pode editar manualmente antes de rodar.

O report deve mostrar:

```txt
PROBE_CONTEXT_LABEL: auto
SAFE_IO_EXPECTED: false/true
```

Se `SAFE_IO_EXPECTED = true` e `io.open` existir:

```txt
Safe IO expected and io.open present.
```

Se `SAFE_IO_EXPECTED = true` e `io.open` não existir:

```txt
Safe IO expected but io.open missing.
```

Se `SAFE_IO_EXPECTED = false` e `io.open` existir:

```txt
io.open present; source unknown. If running under LuaPatch safe IO, treat as injected bridge.
```

---

## 4. Adicionar seção `Probe Contamination / Injection Context`

Criar seção:

```txt
## Probe Contamination / Injection Context
```

Deve reportar:

```txt
io present: yes/no
io.open present: yes/no
io.popen present: yes/no
io.tmpfile present: yes/no
safe_io_expected: yes/no
safe_io_likely_injected: yes/no/unknown
native_mdrg_io: unknown
CurrentModGuid present: yes/no
gv present: yes/no
flowchart present: yes/no
transport: file/console fallback
```

Importante:

- Não afirmar que `io` é nativo.
- Não afirmar que `io` é seguro sem `SAFE_IO_EXPECTED` ou outra evidência clara.
- Classificar `io.popen` como especialmente sensível/dangerous no Safety Map.

---

## 5. Adicionar bloco machine-readable de ambiente

Adicionar novo bloco:

```txt
BEGIN_MDRG_PROBE_ENVIRONMENT
context_label|auto
detected_context|mod-with-safe-io-start
context_confidence|medium
safe_io_expected|false
io_present|true
io_open_present|true
io_popen_present|true
io_tmpfile_present|true
current_mod_guid_present|true
gamevariables_present|false
gv_present|false
flowchart_present|false
effective_gamevariables_source|none
transport|file
END_MDRG_PROBE_ENVIRONMENT
```

Atualizar `tools/probe_runtime_index.py` para ler esse bloco sem quebrar reports antigos.

Se o bloco não existir em reports antigos, manter fallback com base em `BEGIN_MDRG_PROBE_SYMBOLS`.

---

## 6. Melhorar `probe_runtime_index.py` para comparar reports

Adicionar ou melhorar uma função de comparação simples.

Objetivo:

```txt
Comparar dois ou mais reports e gerar diferenças úteis.
```

Pode ser via comando novo, se o projeto já tiver CLI:

```powershell
python tools\probe_runtime_index.py --compare report-a.txt report-b.txt
```

Ou só adicionar base interna se já existir outro padrão.

### Diferenças importantes

Comparar:

```txt
CurrentModGuid present/missing
GameVariables present/missing
gv present/missing
flowchart present/missing
io present/missing
io.open present/missing
io.popen present/missing
detected_context
effective_gamevariables_source
symbols present only in report A
symbols present only in report B
field probes present only in report A
field probes present only in report B
enum values present only in report A
enum values present only in report B
```

Gerar saída em texto ou JSON existente do projeto, sem complexidade excessiva.

Não implementar ferramenta gigante. Uma comparação simples já basta.

---

## 7. Melhorar o índice runtime para armazenar contexto

Quando `tools/probe_runtime_index.py` processar um report, salvar no índice algo como:

```json
{
  "environment": {
    "detected_context": "mod-with-safe-io-start",
    "context_label": "auto",
    "safe_io_expected": false,
    "io_present": true,
    "io_open_present": true,
    "io_popen_present": true,
    "current_mod_guid_present": true,
    "gamevariables_present": false,
    "gv_present": false,
    "flowchart_present": false,
    "effective_gamevariables_source": "none"
  }
}
```

Se o projeto já usa outro formato, adaptar ao formato existente.

---

## 8. Corrigir Safe Validations para usar contexto

Hoje o report ainda repete várias linhas:

```txt
MISS _G.GameVariables missing
```

Melhorar para:

```txt
GameVariables global: missing
Effective GameVariables source: none
Reason: startup/mod context likely before save is available
```

Se `gv` existir:

```txt
GameVariables global: missing
gv alias: present
Effective GameVariables source: gv
Safe validation will use gv for read-only probes.
```

Se `GameVariables` existir:

```txt
Effective GameVariables source: GameVariables
```

Não repetir o mesmo missing várias vezes.

---

## 9. Adicionar `Lifecycle Availability Matrix`

Adicionar ao report uma seção:

```txt
## Lifecycle Availability Matrix
```

Ela deve ser inferida a partir do report atual, não de histórico externo.

Exemplo em cada report:

```txt
Current context:
- CurrentModGuid: present
- GameVariables: missing
- gv: missing
- flowchart: missing
- io.open: present
- ModUtilities.GetGameVariables: present
- ModUtilities.StartCoroutine: present
- ModUtilities.WaitForSeconds: present

Likely phase:
- Mod startup / OnGameStart-like phase.
- Save/Fungus context not available yet.
```

Em LuaExec report:

```txt
Likely phase:
- Manual LuaExec / scene/Fungus phase.
- Save/Fungus objects are available through gv/flowchart.
- Mod-scoped CurrentModGuid may be absent.
```

---

## 10. Melhorar investigação segura de lifecycle/events

Adicionar uma seção no report:

```txt
## Lifecycle / Event Clues
```

Não chamar nada.

A seção deve listar evidências:

```txt
CurrentModGuid present: means mod script context is active.
Path contains OnGameStart: if available through debug/error paths, suggests an OnGameStart script hook.
ModUtilities.StartCoroutine present: can be used for deferred probing in a separate opt-in script.
ModUtilities.WaitForSeconds present: can be used for coroutine yielding.
ModUtilities.GetGameVariables present: possible context-dependent read, not called by default.
StorySingleton.GetFlowchart present: possible context-dependent read, not called by default.
```

Não afirmar que `OnSaveLoad` existe.

### Opcional: gerar um exemplo separado

Se fizer sentido, criar um arquivo separado, sem ativar por padrão:

```txt
examples/mdrg_lifecycle_wait_for_gamevariables.lua
```

Esse script deve ser opt-in e pequeno.

Objetivo:

- Rodar em mod startup.
- Usar coroutine para tentar detectar quando `ModUtilities.GetGameVariables()` começa a retornar algo.
- Não alterar estado.
- Não chamar save-changing/UI-changing.
- Não rodar automaticamente pelo probe.
- Ter flags explícitas no topo.

Exemplo conceitual:

```lua
local ENABLE_CONTEXT_CALLS = false
local MAX_ATTEMPTS = 60
local WAIT_SECONDS = 1

if not ENABLE_CONTEXT_CALLS then
  print("Disabled. Set ENABLE_CONTEXT_CALLS=true to run.")
  return
end

ModUtilities.StartCoroutine(function()
  for i = 1, MAX_ATTEMPTS do
    local ok, gv = pcall(function()
      return ModUtilities.GetGameVariables()
    end)

    print("attempt", i, "ok", ok, "gv", gv)

    if ok and gv ~= nil then
      print("GameVariables became available")
      break
    end

    coroutine.yield(ModUtilities.WaitForSeconds(WAIT_SECONDS))
  end
end)
```

Só criar esse arquivo se ficar claro que é útil e seguro. Não deve ser chamado pelo probe.

---

## 11. Adicionar sugestões para procurar eventos por nome

Adicionar ao README ou em comentário do probe? Preferência: criar em `docs/` ou `analysis/`, se já existir padrão.

Criar um pequeno arquivo de notas, por exemplo:

```txt
analysis/runtime_context_notes.md
```

ou atualizar um arquivo existente se houver.

Incluir comandos sugeridos:

```powershell
rg -n "OnGameStart|OnGameLoad|OnSaveLoad|OnSaveLoaded|OnLoad|OnSave|OnDayStart|OnSceneLoaded|OnUpdate|OnTick" .
```

E explicar:

```txt
O report sugere OnGameStart pelo caminho de script gerado/dumpado, mas não confirma OnSaveLoad.
Se OnSaveLoad não aparecer em dumps/scripts, o caminho mais robusto é uma bridge C#/MelonLoader que chama Lua ao detectar o evento real.
```

Não fazer pesquisa web. Usar apenas arquivos do repositório.

---

## 12. Corrigir enum-like false positives

Ainda aparecem falsos positivos como:

```txt
ColorSlot
GlobalFlag
ItemSlot
```

como enum-like userdata.

Ajustar heurística:

Para `userdata`, classificar enum-like apenas se:

```txt
- nome está em ENUM_VALUE_PROBES; ou
- nome está em ENUM_PRIORITY_NAMES; ou
- nome termina com Enum; ou
- nome termina com Type; ou
- nome termina com Status; ou
- nome termina com Selection.
```

Não usar `Slot`, `Flag`, `State`, `Category` isoladamente para userdata.

Para tabela Lua, scalar-majority pode continuar.

---

## 13. Ajustar candidatos de enum que falham

Os reports mostram falhas consistentes para:

```txt
CheckType.Equal
CheckType.Greater
CheckType.Less
CheckType.NotEqual
FishingBaitType.None
FishingBaitType.Worm
ItemCategory.Misc
SlotType.Normal
```

Não remover necessariamente, mas marcar como “candidate/unconfirmed” ou mover para uma lista separada:

```lua
ENUM_VALUE_CANDIDATES_UNCONFIRMED = {
  ...
}
```

No report:

```txt
Unconfirmed enum value candidates:
- CheckType.Equal: access failed
```

Para os que funcionaram, manter como confirmed-by-probe:

```txt
ControllerEnum.NoScene
ControllerEnum.Interaction
ControllerEnum.Missionary
CommonAllowedModifiersEnum.None
CommonAllowedModifiersEnum.FishingRod
EdibleTypeEnum.Other
EdibleTypeEnum.Meat
EdibleTypeEnum.Fish
EdibleTypeEnum.Dish
FishingCatchBehaviourType.Normal
FishingCatchBehaviourType.Fighter
FishingCatchBehaviourType.Floater
FishingCatchBehaviourType.Rock
FishingCatchBehaviourType.Sinker
ItemCategory.Clothing
ItemCategory.Food
ItemCategory.Room
ScratchTextureType.Universal
```

Não alterar stubs com base nisso ainda. Apenas melhorar report/índice.

---

## 14. Safe IO: tratar como bridge externa e potencialmente sensível

Como o safe IO agora está ativo no mod report, o probe deve reportar:

```txt
io table present
io.open present
io.popen present
io.tmpfile present
```

Mas a classificação deve ser conservadora:

```txt
io.open: State-changing / file-write-capable
io.write: State-changing / file-write-capable
io.read: File-read-capable
io.popen: Dangerous/Process-capable, even if sandboxed
io.tmpfile: File-capable
```

Se o safe IO realmente bloqueia `popen`, mas expõe uma função dummy, o report deve indicar apenas presença de campo, não capacidade real.

Não testar `io.popen` chamando a função.

---

## 15. Melhorar notas finais do report

Adicionar notas como:

```txt
- CurrentModGuid present usually indicates real mod script context.
- CurrentModGuid missing + gv/flowchart present usually indicates LuaExec/Fungus/scene context.
- GameVariables missing during mod startup does not mean the API is absent; it may mean save context is not loaded.
- safe IO is plugin-provided bridge API and should not be treated as native MDRG.
- Presence of a callable does not mean it is safe to call.
```

---

# Validação sugerida

Depois de alterar, rode ou sugira:

```powershell
rg -n "detect_execution_context|Execution Context Classification|Probe Contamination|BEGIN_MDRG_PROBE_ENVIRONMENT|Lifecycle Availability Matrix|Lifecycle / Event Clues" examples tools analysis docs
rg -n "SAFE_IO_EXPECTED|PROBE_CONTEXT_LABEL|io_popen|io_tmpfile|effective_gamevariables_source" examples tools
rg -n "OnGameStart|OnSaveLoad|OnSaveLoaded|OnGameLoad|OnSceneLoaded|OnUpdate|OnTick" .
python -m py_compile tools\probe_runtime_index.py
python tools\probe_runtime_index.py --report probe\report-20260506-200247.txt
```

Se criar `examples/mdrg_lifecycle_wait_for_gamevariables.lua`, valide visualmente que:

```txt
ENABLE_CONTEXT_CALLS = false
```

por padrão.

Também verificar que não há chamadas diretas perigosas em `mdrg_env_probe.lua`:

```powershell
rg -n "SaveAllChanges\(|ResetAllData\(|AddGlobalFlag\(|ForceTakeMoney\(|OpenBrowser\(|ChangeWebsite\(|CreateNewItemAutoAssignId\(" examples
```

Esses nomes podem aparecer em strings/listas, mas não como chamadas executadas.

---

# Entrega esperada

Ao final, entregue:

1. Resumo das mudanças.
2. Arquivos alterados.
3. Como o probe agora diferencia:
   - mod startup;
   - mod startup com safe IO;
   - LuaExec/Fungus/scene context.
4. Como o machine-readable environment block funciona.
5. Como `probe_runtime_index.py` processa reports antigos e novos.
6. Se foi criado exemplo opt-in de lifecycle, explicar que ele vem desativado por padrão.
7. Confirmação de que o probe principal continua read-only.
8. Confirmação de que funções descobertas não são chamadas.
9. Diff relevante.

Não rode o jogo.
Não altere stubs gerados manualmente.
Não assuma que `OnSaveLoad` existe sem evidência.

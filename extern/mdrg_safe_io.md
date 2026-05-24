# MDRG Safe IO LuaLS Stubs

Este pacote contém stubs LuaLS para o `io` falso/sandboxed injetado pelo `LuaPatch`.

## Arquivo

- `mdrg_safe_io.d.lua`

## Root em runtime

Todas as chamadas de arquivo são resolvidas dentro de:

```txt
UserData/LuaExec
```

Exemplo:

```lua
local f, err = io.open("logs/test.txt", "w")
if not f then
  print(err)
  return
end

f:write("hello\n")
f:close()

for line in io.lines("logs/test.txt") do
  print(line)
end
```

O arquivo real será:

```txt
UserData/LuaExec/logs/test.txt
```

## Observação

Os stubs descrevem a API compatível com `io` implementada pelo bridge. Ela imita o comportamento Lua/MoonSharp, mas bloqueia caminhos absolutos e qualquer tentativa de sair de `UserData/LuaExec`.

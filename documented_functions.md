# documented_functions.md

Generated: 2026-04-29 18:24:23

Fonte gerada para revisar e copiar LuaDoc para os stubs MDRG. Cada entrada vem de `undocumented_functions.md` e recebe uma descricao balanceada com `Confidence` e `Evidence`.

Notas:
- `rawdump/` e `dump/` sao usados como evidencias de assinatura/contexto; wrappers Il2CppInterop nao sao descritos como comportamento.
- Descricoes de baixa confianca sao intencionalmente conservadoras.
- Este arquivo nao altera `library/` nem o gerador dos stubs.

## _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__

- Source type: `` GameStat`1[[System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] ``
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/GameStat.cs`
- Dump fallback: `` dump/GameAssembly/GameStat`1.cs ``
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__
```

### `__new`
- Source: `docs.txt:1709`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStat.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param defaultValue boolean
---@return _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__.__new(defaultValue) end
```

### `ResetStat`
- Source: `docs.txt:1711`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStat.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__.ResetStat() end
```

### `SetValue`
- Source: `docs.txt:1710`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStat.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param value boolean
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__.SetValue(value) end
```

### `ToString`
- Source: `docs.txt:1712`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStat.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__.ToString() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2

- Source type: `` StoryConditions.DataCondition`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] ``
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Dump fallback: `` dump/GameAssembly/StoryConditions/DataCondition`1.cs ``
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2
```

### `__new`
- Source: `docs.txt:7142`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param value DataConditionValue
---@param comparator DataConditionComparator
---@param negate boolean
---@return _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2.__new(value, comparator, negate) end
```

### `Equals`
- Source: `docs.txt:7146`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param other DataCondition
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2.Equals(other) end
```

### `Equals`
- Source: `docs.txt:7147`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2.Equals(obj) end
```

### `Explain`
- Source: `docs.txt:7143`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2.Explain() end
```

### `GenerateCode`
- Source: `docs.txt:7145`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2.GenerateCode() end
```

### `GenerateVariableName`
- Source: `docs.txt:7144`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2.GenerateVariableName() end
```

### `GetHashCode`
- Source: `docs.txt:7148`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__2.GetHashCode() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3

- Source type: `` StoryConditions.DataCondition`1[[System.Single, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] ``
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Dump fallback: `` dump/GameAssembly/StoryConditions/DataCondition`1.cs ``
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3
```

### `__new`
- Source: `docs.txt:7154`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param value DataConditionValue
---@param comparator DataConditionComparator
---@param negate boolean
---@return _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3.__new(value, comparator, negate) end
```

### `Equals`
- Source: `docs.txt:7158`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param other DataCondition
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3.Equals(other) end
```

### `Equals`
- Source: `docs.txt:7159`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3.Equals(obj) end
```

### `Explain`
- Source: `docs.txt:7155`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3.Explain() end
```

### `GenerateCode`
- Source: `docs.txt:7157`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3.GenerateCode() end
```

### `GenerateVariableName`
- Source: `docs.txt:7156`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3.GenerateVariableName() end
```

### `GetHashCode`
- Source: `docs.txt:7160`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__3.GetHashCode() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4

- Source type: `` StoryConditions.DataCondition`1[[System.Boolean, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] ``
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Dump fallback: `` dump/GameAssembly/StoryConditions/DataCondition`1.cs ``
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4
```

### `__new`
- Source: `docs.txt:7166`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param value DataConditionValue
---@param comparator DataConditionComparator
---@param negate boolean
---@return _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4.__new(value, comparator, negate) end
```

### `Equals`
- Source: `docs.txt:7170`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param other DataCondition
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4.Equals(other) end
```

### `Equals`
- Source: `docs.txt:7171`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4.Equals(obj) end
```

### `Explain`
- Source: `docs.txt:7167`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4.Explain() end
```

### `GenerateCode`
- Source: `docs.txt:7169`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4.GenerateCode() end
```

### `GenerateVariableName`
- Source: `docs.txt:7168`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4.GenerateVariableName() end
```

### `GetHashCode`
- Source: `docs.txt:7172`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DataCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function _0_0_0__Culture_neutral__PublicKeyToken_b77a5c561934e089__4.GetHashCode() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_null__

- Source type: `` GameStat`1[[GameVariables+EatSound, GameAssembly, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null]] ``
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/GameStat.cs`
- Dump fallback: `` dump/GameAssembly/GameStat`1.cs ``
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_null__
```

### `__new`
- Source: `docs.txt:1718`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStat.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param defaultValue EatSound
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__
function _0_0_0__Culture_neutral__PublicKeyToken_null__.__new(defaultValue) end
```

### `ResetStat`
- Source: `docs.txt:1720`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStat.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
function _0_0_0__Culture_neutral__PublicKeyToken_null__.ResetStat() end
```

### `SetValue`
- Source: `docs.txt:1719`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStat.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param value EatSound
function _0_0_0__Culture_neutral__PublicKeyToken_null__.SetValue(value) end
```

### `ToString`
- Source: `docs.txt:1721`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStat.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return string
function _0_0_0__Culture_neutral__PublicKeyToken_null__.ToString() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_null__10

- Source type: `` IC.AutomaticReference.SerializableAutomaticReference`1[[UnityEngine.AudioClip, UnityEngine.AudioModule, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null]] ``
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_null__10
```

### `__new`
- Source: `docs.txt:5524`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__10
function _0_0_0__Culture_neutral__PublicKeyToken_null__10.__new() end
```

### `GetIdentifier`
- Source: `docs.txt:5526`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__10.GetIdentifier() end
```

### `IsNull`
- Source: `docs.txt:5525`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__10.IsNull() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_null__11

- Source type: `` IC.AutomaticReference.SerializableAutomaticReference`1[[UnityEngine.Sprite, UnityEngine.CoreModule, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null]] ``
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_null__11
```

### `__new`
- Source: `docs.txt:5996`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__11
function _0_0_0__Culture_neutral__PublicKeyToken_null__11.__new() end
```

### `GetIdentifier`
- Source: `docs.txt:5998`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__11.GetIdentifier() end
```

### `IsNull`
- Source: `docs.txt:5997`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__11.IsNull() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_null__12

- Source type: `` IC.AutomaticReference.SerializableAutomaticReference`1[[UnityEngine.TextAsset, UnityEngine.CoreModule, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null]] ``
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_null__12
```

### `__new`
- Source: `docs.txt:6052`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__12
function _0_0_0__Culture_neutral__PublicKeyToken_null__12.__new() end
```

### `GetIdentifier`
- Source: `docs.txt:6054`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__12.GetIdentifier() end
```

### `IsNull`
- Source: `docs.txt:6053`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__12.IsNull() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_null__13

- Source type: `` IC.AutomaticReference.CustomConversionReference`2[[UnityEngine.Texture2D, UnityEngine.CoreModule, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null],[UnityEngine.Sprite, UnityEngine.CoreModule, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null]] ``
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_null__13
```

### `__new`
- Source: `docs.txt:7477`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param inputResource IReference
---@param conversionFunc fun(arg1: Texture2D): Sprite
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__13
function _0_0_0__Culture_neutral__PublicKeyToken_null__13.__new(inputResource, conversionFunc) end
```

## _0_0_0__Culture_neutral__PublicKeyToken_null__2

- Source type: `` IC.AutomaticReference.SerializableAutomaticReference`1[[TMPro.TextMeshProUGUI, Unity.TextMeshPro, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null]] ``
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_null__2
```

### `__new`
- Source: `docs.txt:4525`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__2
function _0_0_0__Culture_neutral__PublicKeyToken_null__2.__new() end
```

### `GetIdentifier`
- Source: `docs.txt:4527`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__2.GetIdentifier() end
```

### `IsNull`
- Source: `docs.txt:4526`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__2.IsNull() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_null__3

- Source type: `` IC.AutomaticReference.SerializableAutomaticReference`1[[MusicGroup, GameAssembly, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null]] ``
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_null__3
```

### `__new`
- Source: `docs.txt:4792`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__3
function _0_0_0__Culture_neutral__PublicKeyToken_null__3.__new() end
```

### `GetIdentifier`
- Source: `docs.txt:4794`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__3.GetIdentifier() end
```

### `IsNull`
- Source: `docs.txt:4793`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__3.IsNull() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_null__4

- Source type: `` IC.AutomaticReference.SerializableAutomaticReference`1[[MusicWithInfo, GameAssembly, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null]] ``
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_null__4
```

### `__new`
- Source: `docs.txt:4828`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__4
function _0_0_0__Culture_neutral__PublicKeyToken_null__4.__new() end
```

### `GetIdentifier`
- Source: `docs.txt:4830`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__4.GetIdentifier() end
```

### `IsNull`
- Source: `docs.txt:4829`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__4.IsNull() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_null__5

- Source type: `` IC.AutomaticReference.SerializableAutomaticReference`1[[MusicArtist, GameAssembly, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null]] ``
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_null__5
```

### `__new`
- Source: `docs.txt:4850`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__5
function _0_0_0__Culture_neutral__PublicKeyToken_null__5.__new() end
```

### `GetIdentifier`
- Source: `docs.txt:4852`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__5.GetIdentifier() end
```

### `IsNull`
- Source: `docs.txt:4851`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__5.IsNull() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_null__6

- Source type: `` IC.AutomaticReference.SerializableAutomaticReference`1[[MidiSongAsset, GameAssembly, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null]] ``
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_null__6
```

### `__new`
- Source: `docs.txt:4865`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__6
function _0_0_0__Culture_neutral__PublicKeyToken_null__6.__new() end
```

### `GetIdentifier`
- Source: `docs.txt:4867`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__6.GetIdentifier() end
```

### `IsNull`
- Source: `docs.txt:4866`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__6.IsNull() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_null__7

- Source type: `` IC.AutomaticReference.SerializableAutomaticReference`1[[UnityEngine.ParticleSystem, UnityEngine.ParticleSystemModule, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null]] ``
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_null__7
```

### `__new`
- Source: `docs.txt:5077`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__7
function _0_0_0__Culture_neutral__PublicKeyToken_null__7.__new() end
```

### `GetIdentifier`
- Source: `docs.txt:5079`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__7.GetIdentifier() end
```

### `IsNull`
- Source: `docs.txt:5078`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__7.IsNull() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_null__8

- Source type: `` IC.AutomaticReference.SerializableAutomaticReference`1[[ParticleSystemGroup, GameAssembly, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null]] ``
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_null__8
```

### `__new`
- Source: `docs.txt:5109`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__8
function _0_0_0__Culture_neutral__PublicKeyToken_null__8.__new() end
```

### `GetIdentifier`
- Source: `docs.txt:5111`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__8.GetIdentifier() end
```

### `IsNull`
- Source: `docs.txt:5110`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__8.IsNull() end
```

## _0_0_0__Culture_neutral__PublicKeyToken_null__9

- Source type: `` IC.AutomaticReference.SerializableAutomaticReference`1[[UnityEngine.Shader, UnityEngine.CoreModule, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null]] ``
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class _0_0_0__Culture_neutral__PublicKeyToken_null__9
```

### `__new`
- Source: `docs.txt:5247`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return _0_0_0__Culture_neutral__PublicKeyToken_null__9
function _0_0_0__Culture_neutral__PublicKeyToken_null__9.__new() end
```

### `GetIdentifier`
- Source: `docs.txt:5249`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ValueTuple
function _0_0_0__Culture_neutral__PublicKeyToken_null__9.GetIdentifier() end
```

### `IsNull`
- Source: `docs.txt:5248`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function _0_0_0__Culture_neutral__PublicKeyToken_null__9.IsNull() end
```

## AdditionalDataHolder

- Source type: `Item+AdditionalDataHolder`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class AdditionalDataHolder
```

### `__new`
- Source: `docs.txt:412`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return AdditionalDataHolder
function AdditionalDataHolder.__new() end
```

## AdditionalDataSlot

- Source type: `Item+AdditionalDataSlot`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class AdditionalDataSlot
```

### `__new`
- Source: `docs.txt:417`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return AdditionalDataSlot
function AdditionalDataSlot.__new() end
```

### `Clone`
- Source: `docs.txt:419`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return AdditionalDataSlot
function AdditionalDataSlot.Clone() end
```

### `GetDataAsColor`
- Source: `docs.txt:418`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Color
function AdditionalDataSlot.GetDataAsColor() end
```

## AllDefinedPersonalities

- Source type: `StorySingleton+AllDefinedPersonalities`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class AllDefinedPersonalities
```

### `__new`
- Source: `docs.txt:6722`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param storySingleton StorySingleton
---@return AllDefinedPersonalities
function AllDefinedPersonalities.__new(storySingleton) end
```

## AllowedModifiers

- Source type: `AllowedModifiers`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/AllowedModifiers.cs`
- Dump fallback: `dump/GameAssembly/AllowedModifiers.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class AllowedModifiers
```

### `CreateBuilder`
- Source: `docs.txt:1434`, `rawdump/Il2CppGameAssembly/Il2Cpp/AllowedModifiers.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return AllowedModifiers_Builder
function AllowedModifiers.CreateBuilder() end
```

### `GetCommon`
- Source: `docs.txt:1433`, `rawdump/Il2CppGameAssembly/Il2Cpp/AllowedModifiers.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param commonAllowedModifiersEnum CommonAllowedModifiersEnum
---@return AllowedModifiers
function AllowedModifiers.GetCommon(commonAllowedModifiersEnum) end
```

### `SetRandomModifiers`
- Source: `docs.txt:1435`, `rawdump/Il2CppGameAssembly/Il2Cpp/AllowedModifiers.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
function AllowedModifiers.SetRandomModifiers(item) end
```

### `ToLuaString`
- Source: `docs.txt:1436`, `rawdump/Il2CppGameAssembly/Il2Cpp/AllowedModifiers.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function AllowedModifiers.ToLuaString() end
```

## AllowedModifiers_Builder

- Source type: `AllowedModifiers+Builder`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class AllowedModifiers_Builder
```

### `__new`
- Source: `docs.txt:1424`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return AllowedModifiers_Builder
function AllowedModifiers_Builder.__new() end
```

### `Build`
- Source: `docs.txt:1429`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return AllowedModifiers
function AllowedModifiers_Builder.Build() end
```

### `WithItemModifiers`
- Source: `docs.txt:1425`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param lottery table<GameId, number>
---@return AllowedModifiers_Builder
function AllowedModifiers_Builder.WithItemModifiers(lottery) end
```

### `WithMaxModifierCount`
- Source: `docs.txt:1428`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param count integer
---@return AllowedModifiers_Builder
function AllowedModifiers_Builder.WithMaxModifierCount(count) end
```

### `WithMultipleModifierOdds`
- Source: `docs.txt:1427`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param odds number
---@return AllowedModifiers_Builder
function AllowedModifiers_Builder.WithMultipleModifierOdds(odds) end
```

### `WithNoModifierOdds`
- Source: `docs.txt:1426`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param odds number
---@return AllowedModifiers_Builder
function AllowedModifiers_Builder.WithNoModifierOdds(odds) end
```

## AltBackgroundsContainer

- Source type: `SpriteTextureDataGenerated+AltBackgroundsContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class AltBackgroundsContainer
```

### `__new`
- Source: `docs.txt:5531`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return AltBackgroundsContainer
function AltBackgroundsContainer.__new() end
```

## AndCondition

- Source type: `StoryConditions.AndCondition`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/AndCondition.cs`
- Dump fallback: `dump/GameAssembly/StoryConditions/AndCondition.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class AndCondition
```

### `__new`
- Source: `docs.txt:7132`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/AndCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param operands StoryCondition[]
---@param negate boolean
---@return AndCondition
function AndCondition.__new(operands, negate) end
```

### `Equals`
- Source: `docs.txt:7135`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/AndCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param other AndCondition
---@return boolean
function AndCondition.Equals(other) end
```

### `Equals`
- Source: `docs.txt:7136`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/AndCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function AndCondition.Equals(obj) end
```

### `Explain`
- Source: `docs.txt:7133`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/AndCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function AndCondition.Explain() end
```

### `GenerateCode`
- Source: `docs.txt:7134`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/AndCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function AndCondition.GenerateCode() end
```

### `GetHashCode`
- Source: `docs.txt:7137`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/AndCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function AndCondition.GetHashCode() end
```

## AnnalieShopPopup

- Source type: `AnnalieShopPopup`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/AnnalieShopPopup.cs`
- Dump fallback: `dump/GameAssembly/AnnalieShopPopup.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class AnnalieShopPopup
```

### `__new`
- Source: `docs.txt:7863`, `rawdump/Il2CppGameAssembly/Il2Cpp/AnnalieShopPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return AnnalieShopPopup
function AnnalieShopPopup.__new() end
```

### `CloseInner`
- Source: `docs.txt:7865`, `rawdump/Il2CppGameAssembly/Il2Cpp/AnnalieShopPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function AnnalieShopPopup.CloseInner() end
```

### `Open`
- Source: `docs.txt:7864`, `rawdump/Il2CppGameAssembly/Il2Cpp/AnnalieShopPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param onFinished fun()
---@param isWithBot boolean
function AnnalieShopPopup.Open(onFinished, isWithBot) end
```

## AnonWrapper

- Source type: `MoonSharp.Interpreter.Interop.AnonWrapper`
- Rawdump: `rawdump/Il2CppFungus/Il2CppMoonSharp/Interpreter/Interop/AnonWrapper.cs`
- Dump fallback: `not found`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class AnonWrapper
```

### `__new`
- Source: `docs.txt:330`, `rawdump/Il2CppFungus/Il2CppMoonSharp/Interpreter/Interop/AnonWrapper.cs`
- Confidence: `low`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return AnonWrapper
function AnonWrapper.__new() end
```

## AraAraPersonalityDefinition

- Source type: `StorySingleton+AraAraPersonalityDefinition`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class AraAraPersonalityDefinition
```

### `__new`
- Source: `docs.txt:6718`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param storySingleton StorySingleton
---@return AraAraPersonalityDefinition
function AraAraPersonalityDefinition.__new(storySingleton) end
```

## AraAraPersonalityModuleConversations

- Source type: `StorySingleton+AraAraPersonalityModuleConversations`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class AraAraPersonalityModuleConversations
```

### `__new`
- Source: `docs.txt:6618`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return AraAraPersonalityModuleConversations
function AraAraPersonalityModuleConversations.__new() end
```

## ArtistsContainer

- Source type: `MusicDataGenerated+ArtistsContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ArtistsContainer
```

### `__new`
- Source: `docs.txt:4718`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ArtistsContainer
function ArtistsContainer.__new() end
```

## AtLeastOneBoolVariableTrueRequirement

- Source type: `AtLeastOneBoolVariableTrueRequirement`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/AtLeastOneBoolVariableTrueRequirement.cs`
- Dump fallback: `dump/GameAssembly/AtLeastOneBoolVariableTrueRequirement.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class AtLeastOneBoolVariableTrueRequirement
```

### `__new`
- Source: `docs.txt:1560`, `rawdump/Il2CppGameAssembly/Il2Cpp/AtLeastOneBoolVariableTrueRequirement.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param targetIndices integer[]
---@return AtLeastOneBoolVariableTrueRequirement
function AtLeastOneBoolVariableTrueRequirement.__new(targetIndices) end
```

### `Clone`
- Source: `docs.txt:1565`, `rawdump/Il2CppGameAssembly/Il2Cpp/AtLeastOneBoolVariableTrueRequirement.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemModifiableVariablesRequirement
function AtLeastOneBoolVariableTrueRequirement.Clone() end
```

### `CreateInstance`
- Source: `docs.txt:1561`, `rawdump/Il2CppGameAssembly/Il2Cpp/AtLeastOneBoolVariableTrueRequirement.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param targetIndices integer[]
---@return AtLeastOneBoolVariableTrueRequirement
function AtLeastOneBoolVariableTrueRequirement.CreateInstance(targetIndices) end
```

### `Enforce`
- Source: `docs.txt:1562`, `rawdump/Il2CppGameAssembly/Il2Cpp/AtLeastOneBoolVariableTrueRequirement.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param itemPrefab ItemPrefab
---@param lastModified integer
function AtLeastOneBoolVariableTrueRequirement.Enforce(item, itemPrefab, lastModified) end
```

### `IsBoolChangeAllowed`
- Source: `docs.txt:1563`, `rawdump/Il2CppGameAssembly/Il2Cpp/AtLeastOneBoolVariableTrueRequirement.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@param itemPrefab ItemPrefab
---@param modifiableVariableIndex integer
---@param newValue boolean
---@return boolean
function AtLeastOneBoolVariableTrueRequirement.IsBoolChangeAllowed(item, itemPrefab, modifiableVariableIndex, newValue) end
```

### `ToLuaString`
- Source: `docs.txt:1564`, `rawdump/Il2CppGameAssembly/Il2Cpp/AtLeastOneBoolVariableTrueRequirement.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function AtLeastOneBoolVariableTrueRequirement.ToLuaString() end
```

## AudioClip

- Source type: `UnityEngine.AudioClip`
- Rawdump: `rawdump/UnityEngine.AudioModule/UnityEngine/AudioClip.cs`
- Dump fallback: `dump/UnityEngine.AudioModule/UnityEngine/AudioClip.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class AudioClip
```

### `Create`
- Source: `docs.txt:5505`, `rawdump/UnityEngine.AudioModule/UnityEngine/AudioClip.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param lengthSamples integer
---@param channels integer
---@param frequency integer
---@param stream boolean
---@return AudioClip
function AudioClip.Create(name, lengthSamples, channels, frequency, stream) end
```

### `Create`
- Source: `docs.txt:5506`, `rawdump/UnityEngine.AudioModule/UnityEngine/AudioClip.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param lengthSamples integer
---@param channels integer
---@param frequency integer
---@param stream boolean
---@param pcmreadercallback PCMReaderCallback
---@return AudioClip
function AudioClip.Create(name, lengthSamples, channels, frequency, stream, pcmreadercallback) end
```

### `Create`
- Source: `docs.txt:5507`, `rawdump/UnityEngine.AudioModule/UnityEngine/AudioClip.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param lengthSamples integer
---@param channels integer
---@param frequency integer
---@param stream boolean
---@param pcmreadercallback PCMReaderCallback
---@param pcmsetpositioncallback PCMSetPositionCallback
---@return AudioClip
function AudioClip.Create(name, lengthSamples, channels, frequency, stream, pcmreadercallback, pcmsetpositioncallback) end
```

### `GetData`
- Source: `docs.txt:5501`, `rawdump/UnityEngine.AudioModule/UnityEngine/AudioClip.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param data number[]
---@param offsetSamples integer
---@return boolean
function AudioClip.GetData(data, offsetSamples) end
```

### `GetData`
- Source: `docs.txt:5502`, `rawdump/UnityEngine.AudioModule/UnityEngine/AudioClip.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param data number[]
---@param offsetSamples integer
---@return boolean
function AudioClip.GetData(data, offsetSamples) end
```

### `LoadAudioData`
- Source: `docs.txt:5499`, `rawdump/UnityEngine.AudioModule/UnityEngine/AudioClip.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function AudioClip.LoadAudioData() end
```

### `SetData`
- Source: `docs.txt:5503`, `rawdump/UnityEngine.AudioModule/UnityEngine/AudioClip.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param data number[]
---@param offsetSamples integer
---@return boolean
function AudioClip.SetData(data, offsetSamples) end
```

### `SetData`
- Source: `docs.txt:5504`, `rawdump/UnityEngine.AudioModule/UnityEngine/AudioClip.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param data number[]
---@param offsetSamples integer
---@return boolean
function AudioClip.SetData(data, offsetSamples) end
```

### `UnloadAudioData`
- Source: `docs.txt:5500`, `rawdump/UnityEngine.AudioModule/UnityEngine/AudioClip.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function AudioClip.UnloadAudioData() end
```

## BlowjobCockInsertionFuckAxis

- Source type: `Live2DBlowjobController+BlowjobCockInsertionFuckAxis`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class BlowjobCockInsertionFuckAxis
```

### `__new`
- Source: `docs.txt:3310`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param controller Live2DBlowjobController
---@return BlowjobCockInsertionFuckAxis
function BlowjobCockInsertionFuckAxis.__new(controller) end
```

### `CanThrustBackwards`
- Source: `docs.txt:3317`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function BlowjobCockInsertionFuckAxis.CanThrustBackwards() end
```

### `CanThrustForward`
- Source: `docs.txt:3316`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function BlowjobCockInsertionFuckAxis.CanThrustForward() end
```

### `FixedUpdate`
- Source: `docs.txt:3319`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BlowjobCockInsertionFuckAxis.FixedUpdate() end
```

### `GetAngleX`
- Source: `docs.txt:3313`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return number
function BlowjobCockInsertionFuckAxis.GetAngleX() end
```

### `GetAngleY`
- Source: `docs.txt:3314`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return number
function BlowjobCockInsertionFuckAxis.GetAngleY() end
```

### `GetCurrentInsertionPosition`
- Source: `docs.txt:3321`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return number
function BlowjobCockInsertionFuckAxis.GetCurrentInsertionPosition() end
```

### `GetCurrentRealInsertionPosition`
- Source: `docs.txt:3320`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return number
function BlowjobCockInsertionFuckAxis.GetCurrentRealInsertionPosition() end
```

### `GetPenisInfo`
- Source: `docs.txt:3312`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return IPenisInfo
function BlowjobCockInsertionFuckAxis.GetPenisInfo() end
```

### `Reset`
- Source: `docs.txt:3315`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BlowjobCockInsertionFuckAxis.Reset() end
```

### `ResetAccumulatedMovementToCurrentPosition`
- Source: `docs.txt:3322`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BlowjobCockInsertionFuckAxis.ResetAccumulatedMovementToCurrentPosition() end
```

### `Start`
- Source: `docs.txt:3311`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param penisInfo IPenisInfo
function BlowjobCockInsertionFuckAxis.Start(penisInfo) end
```

### `ThrustBot`
- Source: `docs.txt:3323`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param direction number
function BlowjobCockInsertionFuckAxis.ThrustBot(direction) end
```

### `Update`
- Source: `docs.txt:3318`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BlowjobCockInsertionFuckAxis.Update() end
```

## BotStatusAppPopup

- Source type: `BotStatusAppPopup`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Dump fallback: `dump/GameAssembly/BotStatusAppPopup.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class BotStatusAppPopup
```

### `__new`
- Source: `docs.txt:7705`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return BotStatusAppPopup
function BotStatusAppPopup.__new() end
```

### `AddCharToInput`
- Source: `docs.txt:7726`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param c string
function BotStatusAppPopup.AddCharToInput(c) end
```

### `ClearScreen`
- Source: `docs.txt:7713`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BotStatusAppPopup.ClearScreen() end
```

### `CloseInner`
- Source: `docs.txt:7733`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function BotStatusAppPopup.CloseInner() end
```

### `DoFungusBlock`
- Source: `docs.txt:7725`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param fungusBlockReference FungusBlockReference
---@return UniTask
function BotStatusAppPopup.DoFungusBlock(fungusBlockReference) end
```

### `EndPlayerInput`
- Source: `docs.txt:7721`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BotStatusAppPopup.EndPlayerInput() end
```

### `FakeLoading`
- Source: `docs.txt:7716`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param length number
---@param width integer
---@param hideAfterDone boolean
---@param cancellationToken CancellationToken
---@return UniTask
function BotStatusAppPopup.FakeLoading(length, width, hideAfterDone, cancellationToken) end
```

### `ForceSubmitPlayerInput`
- Source: `docs.txt:7729`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param input string
function BotStatusAppPopup.ForceSubmitPlayerInput(input) end
```

### `GetConsoleStyle`
- Source: `docs.txt:7707`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return ConsoleStyleStruct
function BotStatusAppPopup.GetConsoleStyle() end
```

### `GetPlayerInput`
- Source: `docs.txt:7722`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param saveInMemory boolean
---@param cancellationToken CancellationToken
---@return UniTask
function BotStatusAppPopup.GetPlayerInput(saveInMemory, cancellationToken) end
```

### `GetStringBuilderConsoleLine`
- Source: `docs.txt:7710`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return StringBuilderConsoleLine
function BotStatusAppPopup.GetStringBuilderConsoleLine() end
```

### `GetStringConsoleLine`
- Source: `docs.txt:7709`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param data string
---@return StringConsoleLine
function BotStatusAppPopup.GetStringConsoleLine(data) end
```

### `LoadConsoleLook`
- Source: `docs.txt:7706`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BotStatusAppPopup.LoadConsoleLook() end
```

### `Open`
- Source: `docs.txt:7732`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param isPrologue boolean
function BotStatusAppPopup.Open(isPrologue) end
```

### `PrintLine`
- Source: `docs.txt:7711`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param s ConsoleLine
---@return ConsoleLine
function BotStatusAppPopup.PrintLine(s) end
```

### `PrintLineDelay`
- Source: `docs.txt:7715`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param s ConsoleLine
---@param delay number
---@param randomDelay number
---@param cancellationToken CancellationToken
---@return UniTask
function BotStatusAppPopup.PrintLineDelay(s, delay, randomDelay, cancellationToken) end
```

### `RaiseStopFlag`
- Source: `docs.txt:7724`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BotStatusAppPopup.RaiseStopFlag() end
```

### `RemoveLine`
- Source: `docs.txt:7712`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param inputLine ConsoleLine
---@return boolean
function BotStatusAppPopup.RemoveLine(inputLine) end
```

### `SetConsoleStyle`
- Source: `docs.txt:7708`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param style ConsoleStyleStruct
function BotStatusAppPopup.SetConsoleStyle(style) end
```

### `SetPlayerInput`
- Source: `docs.txt:7727`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param t string
function BotStatusAppPopup.SetPlayerInput(t) end
```

### `ShowEquipment`
- Source: `docs.txt:7723`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param cancellationToken CancellationToken
---@return UniTask
function BotStatusAppPopup.ShowEquipment(cancellationToken) end
```

### `ShowFile`
- Source: `docs.txt:7728`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param text string
function BotStatusAppPopup.ShowFile(text) end
```

### `StartPlayerInput`
- Source: `docs.txt:7719`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BotStatusAppPopup.StartPlayerInput() end
```

### `TryEatPlayerInput`
- Source: `docs.txt:7720`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param str string
---@return boolean
function BotStatusAppPopup.TryEatPlayerInput(str) end
```

### `Update`
- Source: `docs.txt:7731`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BotStatusAppPopup.Update() end
```

### `UpdateDisplay`
- Source: `docs.txt:7714`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BotStatusAppPopup.UpdateDisplay() end
```

### `WaitRandomLongDelay`
- Source: `docs.txt:7718`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param cancellationToken CancellationToken
---@return UniTask
function BotStatusAppPopup.WaitRandomLongDelay(cancellationToken) end
```

### `WaitRandomShortDelay`
- Source: `docs.txt:7717`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param cancellationToken CancellationToken
---@return UniTask
function BotStatusAppPopup.WaitRandomShortDelay(cancellationToken) end
```

### `WaitTillPlayerInputNeeded`
- Source: `docs.txt:7730`, `rawdump/Il2CppGameAssembly/Il2Cpp/BotStatusAppPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@return IEnumerator
function BotStatusAppPopup.WaitTillPlayerInputNeeded() end
```

## BrowserPopup

- Source type: `BrowserPopup`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Dump fallback: `dump/GameAssembly/BrowserPopup.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class BrowserPopup
```

### `__new`
- Source: `docs.txt:7594`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return BrowserPopup
function BrowserPopup.__new() end
```

### `Awake`
- Source: `docs.txt:7596`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BrowserPopup.Awake() end
```

### `CanClose`
- Source: `docs.txt:7606`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function BrowserPopup.CanClose() end
```

### `ChangeWebsite`
- Source: `docs.txt:7598`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
function BrowserPopup.ChangeWebsite() end
```

### `ChangeWebsite`
- Source: `docs.txt:7599`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param address string
function BrowserPopup.ChangeWebsite(address) end
```

### `ChangeWebsite`
- Source: `docs.txt:7600`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param address string
---@param addToHistory boolean
function BrowserPopup.ChangeWebsite(address, addToHistory) end
```

### `ChangeWebsite`
- Source: `docs.txt:7601`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param address GameUrlWithArguments
---@param addToHistory boolean
function BrowserPopup.ChangeWebsite(address, addToHistory) end
```

### `FinishLoading`
- Source: `docs.txt:7605`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BrowserPopup.FinishLoading() end
```

### `FixedUpdate`
- Source: `docs.txt:7610`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BrowserPopup.FixedUpdate() end
```

### `FormatLink`
- Source: `docs.txt:7595`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param link string
---@param text string
---@return string
function BrowserPopup.FormatLink(link, text) end
```

### `JoinUsLogin_Enumerator`
- Source: `docs.txt:7613`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@return IEnumerator
function BrowserPopup.JoinUsLogin_Enumerator() end
```

### `JoinUsOpenBlog_Enumerator`
- Source: `docs.txt:7614`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param key string
---@return IEnumerator
function BrowserPopup.JoinUsOpenBlog_Enumerator(key) end
```

### `JoinUsOpenBlogLoginPage`
- Source: `docs.txt:7612`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param key string
function BrowserPopup.JoinUsOpenBlogLoginPage(key) end
```

### `OnDisable`
- Source: `docs.txt:7602`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BrowserPopup.OnDisable() end
```

### `Open`
- Source: `docs.txt:7607`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BrowserPopup.Open() end
```

### `Open`
- Source: `docs.txt:7608`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param website string
function BrowserPopup.Open(website) end
```

### `PrevWebsite`
- Source: `docs.txt:7603`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BrowserPopup.PrevWebsite() end
```

### `Refresh`
- Source: `docs.txt:7609`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
function BrowserPopup.Refresh() end
```

### `RemovePreviousWebsite`
- Source: `docs.txt:7597`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
function BrowserPopup.RemovePreviousWebsite() end
```

### `SelectEmail`
- Source: `docs.txt:7611`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param index integer
function BrowserPopup.SelectEmail(index) end
```

### `SyncBackButton`
- Source: `docs.txt:7604`, `rawdump/Il2CppGameAssembly/Il2Cpp/BrowserPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function BrowserPopup.SyncBackButton() end
```

## Burst

- Source type: `UnityEngine.ParticleSystem+Burst`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class Burst
```

### `__new`
- Source: `docs.txt:4971`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Burst
function Burst.__new() end
```

## CardsCasinoContainer

- Source type: `SpriteTextureDataGenerated+CardsCasinoContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class CardsCasinoContainer
```

### `__new`
- Source: `docs.txt:5777`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return CardsCasinoContainer
function CardsCasinoContainer.__new() end
```

## CardsMainContainer

- Source type: `SpriteTextureDataGenerated+CardsMainContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class CardsMainContainer
```

### `__new`
- Source: `docs.txt:5716`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return CardsMainContainer
function CardsMainContainer.__new() end
```

## CatBellLive2DControllerItemModifier

- Source type: `Live2DController+CatBellLive2DControllerItemModifier`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class CatBellLive2DControllerItemModifier
```

### `__new`
- Source: `docs.txt:2941`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return CatBellLive2DControllerItemModifier
function CatBellLive2DControllerItemModifier.__new() end
```

### `Activate`
- Source: `docs.txt:2942`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param live2DController Live2DController
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function CatBellLive2DControllerItemModifier.Activate(live2DController, type) end
```

### `Deactivate`
- Source: `docs.txt:2944`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param live2DController Live2DController
function CatBellLive2DControllerItemModifier.Deactivate(live2DController) end
```

### `FixedUpdate`
- Source: `docs.txt:2943`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param live2DController Live2DController
function CatBellLive2DControllerItemModifier.FixedUpdate(live2DController) end
```

## CatgirlPersonalityDefinition

- Source type: `StorySingleton+CatgirlPersonalityDefinition`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class CatgirlPersonalityDefinition
```

### `__new`
- Source: `docs.txt:6686`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param storySingleton StorySingleton
---@return CatgirlPersonalityDefinition
function CatgirlPersonalityDefinition.__new(storySingleton) end
```

## CatgirlPersonalityModuleConversations

- Source type: `StorySingleton+CatgirlPersonalityModuleConversations`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class CatgirlPersonalityModuleConversations
```

### `__new`
- Source: `docs.txt:6233`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return CatgirlPersonalityModuleConversations
function CatgirlPersonalityModuleConversations.__new() end
```

## CharArrayConsoleLine

- Source type: `BotStatusAppPopup+CharArrayConsoleLine`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class CharArrayConsoleLine
```

### `__new`
- Source: `docs.txt:7685`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param width integer
---@param printType CharArrayPrintTypesEnum
---@return CharArrayConsoleLine
function CharArrayConsoleLine.__new(width, printType) end
```

### `__new`
- Source: `docs.txt:7686`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param charArray string[]
---@return CharArrayConsoleLine
function CharArrayConsoleLine.__new(charArray) end
```

### `__new`
- Source: `docs.txt:7687`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param charArray string[]
---@param width integer
---@param height integer
---@param printType CharArrayPrintTypesEnum
---@return CharArrayConsoleLine
function CharArrayConsoleLine.__new(charArray, width, height, printType) end
```

### `DoTextInfoProcessing`
- Source: `docs.txt:7690`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param linkIndex integer
---@param _consoleText TextMeshProUGUI
function CharArrayConsoleLine.DoTextInfoProcessing(linkIndex, _consoleText) end
```

### `GetApproximateLineCount`
- Source: `docs.txt:7691`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param popup BotStatusAppPopup
---@return integer
function CharArrayConsoleLine.GetApproximateLineCount(popup) end
```

### `PrintTo`
- Source: `docs.txt:7692`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param consoleStringBuilder StringBuilder
---@param _popup BotStatusAppPopup
function CharArrayConsoleLine.PrintTo(consoleStringBuilder, _popup) end
```

### `SetAsProgress`
- Source: `docs.txt:7688`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param percent number
---@param loadedChar string
---@param notLoadedChar string
function CharArrayConsoleLine.SetAsProgress(percent, loadedChar, notLoadedChar) end
```

### `SetAsProgress`
- Source: `docs.txt:7689`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param startIndex integer
---@param endIndex integer
---@param percent number
---@param loadedChar string
---@param notLoadedChar string
function CharArrayConsoleLine.SetAsProgress(startIndex, endIndex, percent, loadedChar, notLoadedChar) end
```

## ClothierOrdersPopup

- Source type: `ClothierOrdersPopup`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ClothierOrdersPopup.cs`
- Dump fallback: `dump/GameAssembly/ClothierOrdersPopup.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ClothierOrdersPopup
```

### `__new`
- Source: `docs.txt:7839`, `rawdump/Il2CppGameAssembly/Il2Cpp/ClothierOrdersPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ClothierOrdersPopup
function ClothierOrdersPopup.__new() end
```

### `CloseInner`
- Source: `docs.txt:7841`, `rawdump/Il2CppGameAssembly/Il2Cpp/ClothierOrdersPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function ClothierOrdersPopup.CloseInner() end
```

### `Open`
- Source: `docs.txt:7840`, `rawdump/Il2CppGameAssembly/Il2Cpp/ClothierOrdersPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param afterClose fun()
function ClothierOrdersPopup.Open(afterClose) end
```

## ClothierViewScene

- Source type: `ClothierViewScene`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ClothierViewScene.cs`
- Dump fallback: `dump/GameAssembly/ClothierViewScene.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ClothierViewScene
```

### `__new`
- Source: `docs.txt:7574`, `rawdump/Il2CppGameAssembly/Il2Cpp/ClothierViewScene.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ClothierViewScene
function ClothierViewScene.__new() end
```

## CocktractManager

- Source type: `CocktractManager`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Dump fallback: `dump/GameAssembly/CocktractManager.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class CocktractManager
```

### `__new`
- Source: `docs.txt:2474`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return CocktractManager
function CocktractManager.__new() end
```

### `AbandonContract`
- Source: `docs.txt:2482`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param cocktractContract CocktractContract
function CocktractManager.AbandonContract(cocktractContract) end
```

### `AcceptContract`
- Source: `docs.txt:2480`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param cocktractContract CocktractContract
function CocktractManager.AcceptContract(cocktractContract) end
```

### `AddPastContract`
- Source: `docs.txt:2476`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param contract CocktractContract
function CocktractManager.AddPastContract(contract) end
```

### `AddRespect`
- Source: `docs.txt:2484`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param respect number
function CocktractManager.AddRespect(respect) end
```

### `CompleteContract`
- Source: `docs.txt:2483`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param cocktractContract CocktractContract
function CocktractManager.CompleteContract(cocktractContract) end
```

### `CreateInstance`
- Source: `docs.txt:2475`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return CocktractManager
function CocktractManager.CreateInstance() end
```

### `EndOfDay`
- Source: `docs.txt:2491`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CocktractManager.EndOfDay() end
```

### `FillPrefabData`
- Source: `docs.txt:2485`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CocktractManager.FillPrefabData() end
```

### `GenerateAllContracts`
- Source: `docs.txt:2488`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CocktractManager.GenerateAllContracts() end
```

### `GenerateRandomMoneyReward`
- Source: `docs.txt:2489`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param multi number
---@return integer
function CocktractManager.GenerateRandomMoneyReward(multi) end
```

### `GetSource`
- Source: `docs.txt:2477`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param cocktractContract CocktractContract
---@return ValueTuple
function CocktractManager.GetSource(cocktractContract) end
```

### `HourlyUpdate`
- Source: `docs.txt:2490`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CocktractManager.HourlyUpdate() end
```

### `RejectContract`
- Source: `docs.txt:2481`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param cocktractContract CocktractContract
function CocktractManager.RejectContract(cocktractContract) end
```

### `ShowCurrentContract`
- Source: `docs.txt:2479`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CocktractManager.ShowCurrentContract() end
```

### `TryGetContract`
- Source: `docs.txt:2478`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param source string
---@param index integer
---@param cocktractContract CocktractContract
---@return boolean
function CocktractManager.TryGetContract(source, index, cocktractContract) end
```

### `TryGetPartnerById`
- Source: `docs.txt:2486`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param key string
---@param partner CocktractPartner
---@return boolean
function CocktractManager.TryGetPartnerById(key, partner) end
```

### `UpdatePartners`
- Source: `docs.txt:2487`, `rawdump/Il2CppGameAssembly/Il2Cpp/CocktractManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CocktractManager.UpdatePartners() end
```

## CocktwitchEmailSubReadEventTarget

- Source type: `CockTwitchManager+CocktwitchEmailSubReadEventTarget`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class CocktwitchEmailSubReadEventTarget
```

### `__new`
- Source: `docs.txt:2451`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return CocktwitchEmailSubReadEventTarget
function CocktwitchEmailSubReadEventTarget.__new() end
```

### `Start`
- Source: `docs.txt:2452`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param parent NewEmail
---@return boolean
function CocktwitchEmailSubReadEventTarget.Start(parent) end
```

## CockTwitchManager

- Source type: `CockTwitchManager`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/CockTwitchManager.cs`
- Dump fallback: `dump/GameAssembly/CockTwitchManager.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class CockTwitchManager
```

### `__new`
- Source: `docs.txt:2456`, `rawdump/Il2CppGameAssembly/Il2Cpp/CockTwitchManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return CockTwitchManager
function CockTwitchManager.__new() end
```

### `CalculateViewerShipTimeMultiplier`
- Source: `docs.txt:2464`, `rawdump/Il2CppGameAssembly/Il2Cpp/CockTwitchManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param dayOfTheWeek integer
---@param hour integer
---@return number
function CockTwitchManager.CalculateViewerShipTimeMultiplier(dayOfTheWeek, hour) end
```

### `CreateInstance`
- Source: `docs.txt:2457`, `rawdump/Il2CppGameAssembly/Il2Cpp/CockTwitchManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return CockTwitchManager
function CockTwitchManager.CreateInstance() end
```

### `EndOfDay`
- Source: `docs.txt:2463`, `rawdump/Il2CppGameAssembly/Il2Cpp/CockTwitchManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CockTwitchManager.EndOfDay() end
```

### `FormatViewers`
- Source: `docs.txt:2458`, `rawdump/Il2CppGameAssembly/Il2Cpp/CockTwitchManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param num integer
---@return string
function CockTwitchManager.FormatViewers(num) end
```

### `GetActiveStreamers`
- Source: `docs.txt:2460`, `rawdump/Il2CppGameAssembly/Il2Cpp/CockTwitchManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param count integer
---@return any[]
function CockTwitchManager.GetActiveStreamers(count) end
```

### `GetTopStreamers`
- Source: `docs.txt:2461`, `rawdump/Il2CppGameAssembly/Il2Cpp/CockTwitchManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param count integer
---@return any[]
function CockTwitchManager.GetTopStreamers(count) end
```

### `InitializeNewGame`
- Source: `docs.txt:2459`, `rawdump/Il2CppGameAssembly/Il2Cpp/CockTwitchManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CockTwitchManager.InitializeNewGame() end
```

### `MinutePassed`
- Source: `docs.txt:2462`, `rawdump/Il2CppGameAssembly/Il2Cpp/CockTwitchManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CockTwitchManager.MinutePassed() end
```

### `OnAfterDeserialize`
- Source: `docs.txt:2466`, `rawdump/Il2CppGameAssembly/Il2Cpp/CockTwitchManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CockTwitchManager.OnAfterDeserialize() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:2465`, `rawdump/Il2CppGameAssembly/Il2Cpp/CockTwitchManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CockTwitchManager.OnBeforeSerialize() end
```

## ColoringGroup

- Source type: `Live2DController+ColoringGroup`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ColoringGroup
```

### `__new`
- Source: `docs.txt:2772`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param coloringGroupEnum ColoringGroupEnum
---@param parts Part[]
---@return ColoringGroup
function ColoringGroup.__new(coloringGroupEnum, parts) end
```

### `Color`
- Source: `docs.txt:2775`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param color Color
function ColoringGroup.Color(color) end
```

### `ColorAndToggle`
- Source: `docs.txt:2774`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value boolean
---@param color Color
function ColoringGroup.ColorAndToggle(value, color) end
```

### `GetCubismRenderers`
- Source: `docs.txt:2776`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return CubismRenderer[]
function ColoringGroup.GetCubismRenderers() end
```

### `PrepareAsSkinning`
- Source: `docs.txt:2777`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param mainPartId string
function ColoringGroup.PrepareAsSkinning(mainPartId) end
```

### `Toggle`
- Source: `docs.txt:2773`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value boolean
function ColoringGroup.Toggle(value) end
```

## ColorOverLifetimeModule

- Source type: `UnityEngine.ParticleSystem+ColorOverLifetimeModule`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ColorOverLifetimeModule
```

### `__new`
- Source: `docs.txt:5007`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ColorOverLifetimeModule
function ColorOverLifetimeModule.__new() end
```

## ColorPalette

- Source type: `ColorPaletteManager+ColorPalette`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `high`
- Class evidence: `manual, usage`
- Class motivation:
```lua
---Colecao de cores configuraveis usada por slots de cor.
---@class ColorPalette
```

### `AddColor`
- Source: `docs.txt:1805`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param color ColorPaletteEntry
function ColorPalette.AddColor(color) end
```

### `CreateInstance`
- Source: `docs.txt:1803`, `not found`
- Confidence: `medium`
- Evidence: `usage, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param id string
---@param name string
---@param entries ColorPaletteEntry[]
---@return ColorPalette
function ColorPalette.CreateInstance(id, name, entries) end
```

### `GetLocalizedName`
- Source: `docs.txt:1807`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ColorPalette.GetLocalizedName() end
```

### `GetRandomColor`
- Source: `docs.txt:1804`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ColorPaletteEntry
function ColorPalette.GetRandomColor() end
```

### `GetRawName`
- Source: `docs.txt:1806`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ColorPalette.GetRawName() end
```

### `ToString`
- Source: `docs.txt:1808`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ColorPalette.ToString() end
```

## ColorPaletteEntry

- Source type: `ColorPaletteManager+ColorPaletteEntry`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ColorPaletteEntry
```

### `__toColor`
- Source: `docs.txt:1820`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param c ColorPaletteEntry
---@return Color
function ColorPaletteEntry.__toColor(c) end
```

### `__toColor32`
- Source: `docs.txt:1819`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param c ColorPaletteEntry
---@return Color32
function ColorPaletteEntry.__toColor32(c) end
```

### `CreateInstance`
- Source: `docs.txt:1817`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@param color Color32
---@return ColorPaletteEntry
function ColorPaletteEntry.CreateInstance(name, color) end
```

### `CreateInstanceFromString`
- Source: `docs.txt:1818`, `not found`
- Confidence: `medium`
- Evidence: `usage, name-pattern`
```lua
---Cria instance from string e retorna ColorPaletteEntry.
---@param str string
---@return ColorPaletteEntry
function ColorPaletteEntry.CreateInstanceFromString(str) end
```

### `GetLocalizedName`
- Source: `docs.txt:1822`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ColorPaletteEntry.GetLocalizedName() end
```

### `GetRawName`
- Source: `docs.txt:1821`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ColorPaletteEntry.GetRawName() end
```

## ColorPaletteManager

- Source type: `ColorPaletteManager`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ColorPaletteManager.cs`
- Dump fallback: `dump/GameAssembly/ColorPaletteManager.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Acesso a paletas de cor registradas pelo jogo.
---@class ColorPaletteManager
```

### `__new`
- Source: `docs.txt:1828`, `rawdump/Il2CppGameAssembly/Il2Cpp/ColorPaletteManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ColorPaletteManager
function ColorPaletteManager.__new() end
```

### `FindName`
- Source: `docs.txt:1831`, `rawdump/Il2CppGameAssembly/Il2Cpp/ColorPaletteManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param color Color32
---@return string
function ColorPaletteManager.FindName(color) end
```

### `GetColorPaletteByName`
- Source: `docs.txt:1829`, `rawdump/Il2CppGameAssembly/Il2Cpp/ColorPaletteManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Retorna cor paleta by nome.
---@param name string
---@return ColorPalette
function ColorPaletteManager.GetColorPaletteByName(name) end
```

### `TryFindEntry`
- Source: `docs.txt:1830`, `rawdump/Il2CppGameAssembly/Il2Cpp/ColorPaletteManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param color Color32
---@param colorPaletteEntry ColorPaletteEntry
---@return boolean
function ColorPaletteManager.TryFindEntry(color, colorPaletteEntry) end
```

## ColorScaler

- Source type: `Live2DController+ColorScaler`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ColorScaler
```

### `__new`
- Source: `docs.txt:2870`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param strength number
---@return ColorScaler
function ColorScaler.__new(strength) end
```

### `__new`
- Source: `docs.txt:2871`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param baseColor Color
---@return ColorScaler
function ColorScaler.__new(baseColor) end
```

### `__new`
- Source: `docs.txt:2872`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param colorMin Color
---@param colorMax Color
---@return ColorScaler
function ColorScaler.__new(colorMin, colorMax) end
```

### `Scale`
- Source: `docs.txt:2873`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param color Color
---@return Color
function ColorScaler.Scale(color) end
```

## ColorSlot

- Source type: `ColorSlot`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ColorSlot.cs`
- Dump fallback: `dump/GameAssembly/ColorSlot.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Define um slot de cor editavel de item, normalmente associado a uma paleta.
---@class ColorSlot
```

### `__new`
- Source: `docs.txt:1405`, `rawdump/Il2CppGameAssembly/Il2Cpp/ColorSlot.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@return ColorSlot
function ColorSlot.__new(name) end
```

### `__new`
- Source: `docs.txt:1406`, `rawdump/Il2CppGameAssembly/Il2Cpp/ColorSlot.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@param palette ColorPalette
---@return ColorSlot
function ColorSlot.__new(name, palette) end
```

### `Clone`
- Source: `docs.txt:1410`, `rawdump/Il2CppGameAssembly/Il2Cpp/ColorSlot.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return ColorSlot
function ColorSlot.Clone() end
```

### `CreateInstance`
- Source: `docs.txt:1407`, `rawdump/Il2CppGameAssembly/Il2Cpp/ColorSlot.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param name string
---@return ColorSlot
function ColorSlot.CreateInstance(name) end
```

### `CreateInstance`
- Source: `docs.txt:1408`, `rawdump/Il2CppGameAssembly/Il2Cpp/ColorSlot.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param name string
---@param palette ColorPalette
---@return ColorSlot
function ColorSlot.CreateInstance(name, palette) end
```

### `ToLuaString`
- Source: `docs.txt:1409`, `rawdump/Il2CppGameAssembly/Il2Cpp/ColorSlot.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ColorSlot.ToLuaString() end
```

## CommonConditionsContainer

- Source type: `StoryConditions.StoryCondition+CommonConditionsContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class CommonConditionsContainer
```

### `__new`
- Source: `docs.txt:6898`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return CommonConditionsContainer
function CommonConditionsContainer.__new() end
```

## ConsoleLine

- Source type: `BotStatusAppPopup+ConsoleLine`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ConsoleLine
```

### `__toConsoleLine`
- Source: `docs.txt:7640`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param s string
---@return ConsoleLine
function ConsoleLine.__toConsoleLine(s) end
```

### `__toConsoleLine`
- Source: `docs.txt:7641`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param sb StringBuilder
---@return ConsoleLine
function ConsoleLine.__toConsoleLine(sb) end
```

### `DoTextInfoProcessing`
- Source: `docs.txt:7638`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param linkIndex integer
---@param _consoleText TextMeshProUGUI
function ConsoleLine.DoTextInfoProcessing(linkIndex, _consoleText) end
```

### `GetApproximateLineCount`
- Source: `docs.txt:7637`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param popup BotStatusAppPopup
---@return integer
function ConsoleLine.GetApproximateLineCount(popup) end
```

### `PrintTo`
- Source: `docs.txt:7639`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param consoleStringBuilder StringBuilder
---@param _popup BotStatusAppPopup
function ConsoleLine.PrintTo(consoleStringBuilder, _popup) end
```

## ConstCondition

- Source type: `StoryConditions.ConstCondition`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ConstCondition.cs`
- Dump fallback: `dump/GameAssembly/StoryConditions/ConstCondition.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ConstCondition
```

### `__new`
- Source: `docs.txt:7079`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ConstCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param negate boolean
---@return ConstCondition
function ConstCondition.__new(negate) end
```

### `Equals`
- Source: `docs.txt:7082`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ConstCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param other ConstCondition
---@return boolean
function ConstCondition.Equals(other) end
```

### `Equals`
- Source: `docs.txt:7083`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ConstCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function ConstCondition.Equals(obj) end
```

### `Explain`
- Source: `docs.txt:7080`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ConstCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function ConstCondition.Explain() end
```

### `GenerateCode`
- Source: `docs.txt:7081`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ConstCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function ConstCondition.GenerateCode() end
```

### `GetHashCode`
- Source: `docs.txt:7084`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ConstCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function ConstCondition.GetHashCode() end
```

## CookingSong

- Source type: `CookingSong`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/CookingSong.cs`
- Dump fallback: `dump/GameAssembly/CookingSong.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class CookingSong
```

### `CreateInstance`
- Source: `docs.txt:4235`, `rawdump/Il2CppGameAssembly/Il2Cpp/CookingSong.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param key GameId
---@param musicReference IReference
---@param runtimeDataGenerator fun(arg1: CookingSong): CookingSongRuntimeData
---@param recipe Recipe
---@param isUnlockedFunc fun(arg1: CookingMinigameManager): boolean
---@param hideIfLocked boolean
---@return CookingSong
function CookingSong.CreateInstance(key, musicReference, runtimeDataGenerator, recipe, isUnlockedFunc, hideIfLocked) end
```

### `GetMusic`
- Source: `docs.txt:4236`, `rawdump/Il2CppGameAssembly/Il2Cpp/CookingSong.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return IMusicWithInfo
function CookingSong.GetMusic() end
```

### `GetSave`
- Source: `docs.txt:4238`, `rawdump/Il2CppGameAssembly/Il2Cpp/CookingSong.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return CookingSongSave
function CookingSong.GetSave() end
```

### `IsUnlockedFast`
- Source: `docs.txt:4237`, `rawdump/Il2CppGameAssembly/Il2Cpp/CookingSong.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param cookingMinigameManager CookingMinigameManager
---@return boolean
function CookingSong.IsUnlockedFast(cookingMinigameManager) end
```

## CookingSongRuntimeData

- Source type: `CookingSongRuntimeData`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/CookingSongRuntimeData.cs`
- Dump fallback: `dump/GameAssembly/CookingSongRuntimeData.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class CookingSongRuntimeData
```

### `GetDefaultDifficulty`
- Source: `docs.txt:4284`, `rawdump/Il2CppGameAssembly/Il2Cpp/CookingSongRuntimeData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return CookingSongDifficulty
function CookingSongRuntimeData.GetDefaultDifficulty() end
```

### `GetDifficulty`
- Source: `docs.txt:4285`, `rawdump/Il2CppGameAssembly/Il2Cpp/CookingSongRuntimeData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param modifiers CookingGameplayModifiers
---@return CookingSongDifficulty
function CookingSongRuntimeData.GetDifficulty(modifiers) end
```

### `GetPerfectScoreReadonly`
- Source: `docs.txt:4288`, `rawdump/Il2CppGameAssembly/Il2Cpp/CookingSongRuntimeData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return CookingGameplayScoreData
function CookingSongRuntimeData.GetPerfectScoreReadonly() end
```

### `GetSongLength`
- Source: `docs.txt:4286`, `rawdump/Il2CppGameAssembly/Il2Cpp/CookingSongRuntimeData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param modifiers CookingGameplayModifiers
---@return number
function CookingSongRuntimeData.GetSongLength(modifiers) end
```

### `GetSongLengthDiscreet`
- Source: `docs.txt:4287`, `rawdump/Il2CppGameAssembly/Il2Cpp/CookingSongRuntimeData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param modifiers CookingGameplayModifiers
---@param minutes integer
---@param seconds integer
function CookingSongRuntimeData.GetSongLengthDiscreet(modifiers, minutes, seconds) end
```

### `StartBuilder`
- Source: `docs.txt:4289`, `rawdump/Il2CppGameAssembly/Il2Cpp/CookingSongRuntimeData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param midiFile IReference
---@param cookingSong CookingSong
---@return CookingSongRuntimeData_Builder
function CookingSongRuntimeData.StartBuilder(midiFile, cookingSong) end
```

## CookingSongRuntimeData_Builder

- Source type: `CookingSongRuntimeData+Builder`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class CookingSongRuntimeData_Builder
```

### `__new`
- Source: `docs.txt:4270`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param midiFile MidiFile
---@param cookingSong CookingSong
---@return CookingSongRuntimeData_Builder
function CookingSongRuntimeData_Builder.__new(midiFile, cookingSong) end
```

### `Build`
- Source: `docs.txt:4276`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return CookingSongRuntimeData
function CookingSongRuntimeData_Builder.Build() end
```

### `ChannelToNotes`
- Source: `docs.txt:4271`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param channel integer
---@param buttonDeterminer fun(arg1: CookingSongRuntimeData_Builder, arg2: integer, arg3: Note): NoteButtonTypeEnum
---@param ignoreLength boolean
---@return CookingSongRuntimeData_Builder
function CookingSongRuntimeData_Builder.ChannelToNotes(channel, buttonDeterminer, ignoreLength) end
```

### `ChannelToNotesAllTheSame`
- Source: `docs.txt:4272`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param channel integer
---@param button NoteButtonTypeEnum
---@param ignoreLength boolean
---@return CookingSongRuntimeData_Builder
function CookingSongRuntimeData_Builder.ChannelToNotesAllTheSame(channel, button, ignoreLength) end
```

### `WithPixelsPerSecondDifficulty`
- Source: `docs.txt:4274`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param difficulty number
---@return CookingSongRuntimeData_Builder
function CookingSongRuntimeData_Builder.WithPixelsPerSecondDifficulty(difficulty) end
```

### `WithSongOffset`
- Source: `docs.txt:4275`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param f number
---@return CookingSongRuntimeData_Builder
function CookingSongRuntimeData_Builder.WithSongOffset(f) end
```

### `WithVersion`
- Source: `docs.txt:4273`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param version integer
---@return CookingSongRuntimeData_Builder
function CookingSongRuntimeData_Builder.WithVersion(version) end
```

## CowgirlCockInsertionFuckAxis

- Source type: `Live2DCowgirlController+CowgirlCockInsertionFuckAxis`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class CowgirlCockInsertionFuckAxis
```

### `__new`
- Source: `docs.txt:3494`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param cowgirlController Live2DCowgirlController
---@param botBodyMovementYParameter Live2DParameter
---@param paramCockInside Live2DParameter
---@param thrustParameter Live2DParameter
---@param dickAngleYParameter Live2DParameter
---@param dickAngleXParameter Live2DParameter
---@return CowgirlCockInsertionFuckAxis
function CowgirlCockInsertionFuckAxis.__new(cowgirlController, botBodyMovementYParameter, paramCockInside, thrustParameter, dickAngleYParameter, dickAngleXParameter) end
```

### `CanThrustBackwards`
- Source: `docs.txt:3502`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function CowgirlCockInsertionFuckAxis.CanThrustBackwards() end
```

### `CanThrustForward`
- Source: `docs.txt:3501`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function CowgirlCockInsertionFuckAxis.CanThrustForward() end
```

### `GetAngleX`
- Source: `docs.txt:3498`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return number
function CowgirlCockInsertionFuckAxis.GetAngleX() end
```

### `GetAngleY`
- Source: `docs.txt:3499`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return number
function CowgirlCockInsertionFuckAxis.GetAngleY() end
```

### `GetCurrentInsertionPosition`
- Source: `docs.txt:3505`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return number
function CowgirlCockInsertionFuckAxis.GetCurrentInsertionPosition() end
```

### `GetCurrentRealInsertionPosition`
- Source: `docs.txt:3504`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return number
function CowgirlCockInsertionFuckAxis.GetCurrentRealInsertionPosition() end
```

### `GetPenisInfo`
- Source: `docs.txt:3497`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return IPenisInfo
function CowgirlCockInsertionFuckAxis.GetPenisInfo() end
```

### `PutInside`
- Source: `docs.txt:3495`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CowgirlCockInsertionFuckAxis.PutInside() end
```

### `Reset`
- Source: `docs.txt:3500`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CowgirlCockInsertionFuckAxis.Reset() end
```

### `ResetAccumulatedMovementToCurrentPosition`
- Source: `docs.txt:3506`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CowgirlCockInsertionFuckAxis.ResetAccumulatedMovementToCurrentPosition() end
```

### `Start`
- Source: `docs.txt:3496`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param penisInfo IPenisInfo
function CowgirlCockInsertionFuckAxis.Start(penisInfo) end
```

### `Update`
- Source: `docs.txt:3503`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function CowgirlCockInsertionFuckAxis.Update() end
```

## CreditsTextContainer

- Source type: `TextDataGenerated+CreditsTextContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class CreditsTextContainer
```

### `__new`
- Source: `docs.txt:6003`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return CreditsTextContainer
function CreditsTextContainer.__new() end
```

## CustomDataModule

- Source type: `UnityEngine.ParticleSystem+CustomDataModule`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class CustomDataModule
```

### `__new`
- Source: `docs.txt:5018`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return CustomDataModule
function CustomDataModule.__new() end
```

### `SetColor`
- Source: `docs.txt:5019`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param stream ParticleSystemCustomData
---@param gradient MinMaxGradient
function CustomDataModule.SetColor(stream, gradient) end
```

## Data

- Source type: `Live2DController+ParameterLive2DControllerItemModifier+Data`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class Data
```

### `__new`
- Source: `docs.txt:2957`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param floatVariable ItemModifiableVariableFloat01Percent
---@param parameterGetter fun(arg1: Live2DController): Live2DParameter
---@return Data
function Data.__new(floatVariable, parameterGetter) end
```

### `Activate`
- Source: `docs.txt:2958`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param controller Live2DController
---@param sourceItem Item
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function Data.Activate(controller, sourceItem, type) end
```

### `ApplyValue`
- Source: `docs.txt:2960`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param controller Live2DController
---@param sourceItem Item
function Data.ApplyValue(controller, sourceItem) end
```

### `Deactivate`
- Source: `docs.txt:2959`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Data.Deactivate() end
```

### `FinishMove`
- Source: `docs.txt:2961`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Data.FinishMove() end
```

## DefaultTextureLayer

- Source type: `Live2DController+Part+DefaultTextureLayer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class DefaultTextureLayer
```

### `__new`
- Source: `docs.txt:2609`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param layer integer
---@param color Color
---@param relatedItem Item
---@return DefaultTextureLayer
function DefaultTextureLayer.__new(layer, color, relatedItem) end
```

### `Draw`
- Source: `docs.txt:2610`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param part Part
---@param mainTexture Texture
---@param targetRect Rect
function DefaultTextureLayer.Draw(part, mainTexture, targetRect) end
```

## DelayItemManagerCallback

- Source type: `Item+ItemManager+DelayItemManagerCallback`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class DelayItemManagerCallback
```

### `__new`
- Source: `docs.txt:483`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return DelayItemManagerCallback
function DelayItemManagerCallback.__new() end
```

### `Dispose`
- Source: `docs.txt:485`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function DelayItemManagerCallback.Dispose() end
```

### `FillData`
- Source: `docs.txt:484`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param source string
function DelayItemManagerCallback.FillData(source) end
```

## DelegateCondition

- Source type: `StoryConditions.DelegateCondition`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DelegateCondition.cs`
- Dump fallback: `dump/GameAssembly/StoryConditions/DelegateCondition.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class DelegateCondition
```

### `__new`
- Source: `docs.txt:7101`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DelegateCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param condition fun(): boolean
---@param negate boolean
---@return DelegateCondition
function DelegateCondition.__new(condition, negate) end
```

### `Equals`
- Source: `docs.txt:7104`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DelegateCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param other DelegateCondition
---@return boolean
function DelegateCondition.Equals(other) end
```

### `Equals`
- Source: `docs.txt:7105`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DelegateCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function DelegateCondition.Equals(obj) end
```

### `Explain`
- Source: `docs.txt:7102`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DelegateCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function DelegateCondition.Explain() end
```

### `GenerateCode`
- Source: `docs.txt:7103`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DelegateCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function DelegateCondition.GenerateCode() end
```

### `GetHashCode`
- Source: `docs.txt:7106`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/DelegateCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function DelegateCondition.GetHashCode() end
```

## Delivery

- Source type: `DeliveryManager+Delivery`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class Delivery
```

### `__new`
- Source: `docs.txt:2524`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param trackingNumber string
---@param deliveryItems Item[]
---@param sentTime integer
---@param deliveryDuration integer
---@param sender SimpleLocalizedString
---@return Delivery
function Delivery.__new(trackingNumber, deliveryItems, sentTime, deliveryDuration, sender) end
```

### `AcquirePremiumDelivery`
- Source: `docs.txt:2527`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param currentTime integer
function Delivery.AcquirePremiumDelivery(currentTime) end
```

### `CanBeJoined`
- Source: `docs.txt:2525`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param currentTime integer
---@param secondDelivery Delivery
---@return boolean
function Delivery.CanBeJoined(currentTime, secondDelivery) end
```

### `ContentSummary`
- Source: `docs.txt:2531`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function Delivery.ContentSummary() end
```

### `DeliveryTypeSummary`
- Source: `docs.txt:2535`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function Delivery.DeliveryTypeSummary() end
```

### `HasArrived`
- Source: `docs.txt:2530`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param time integer
---@return boolean
function Delivery.HasArrived(time) end
```

### `JoinPackages`
- Source: `docs.txt:2526`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param newTrackingNumber string
---@param secondDelivery Delivery
function Delivery.JoinPackages(newTrackingNumber, secondDelivery) end
```

### `LongSummary`
- Source: `docs.txt:2534`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function Delivery.LongSummary() end
```

### `PredictedArrivalTime`
- Source: `docs.txt:2529`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param uncertainityPercentage number
---@return integer
function Delivery.PredictedArrivalTime(uncertainityPercentage) end
```

### `Status`
- Source: `docs.txt:2528`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param currentTime integer
---@return DeliveryStatus
function Delivery.Status(currentTime) end
```

### `StatusSummary`
- Source: `docs.txt:2532`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function Delivery.StatusSummary() end
```

### `TimeSummary`
- Source: `docs.txt:2533`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function Delivery.TimeSummary() end
```

## DeliveryManager

- Source type: `DeliveryManager`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/DeliveryManager.cs`
- Dump fallback: `dump/GameAssembly/DeliveryManager.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class DeliveryManager
```

### `__new`
- Source: `docs.txt:2551`, `rawdump/Il2CppGameAssembly/Il2Cpp/DeliveryManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return DeliveryManager
function DeliveryManager.__new() end
```

### `CreateDelivery`
- Source: `docs.txt:2552`, `rawdump/Il2CppGameAssembly/Il2Cpp/DeliveryManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param serializableDeliveryData SerializableDeliveryData
---@return Delivery
function DeliveryManager.CreateDelivery(serializableDeliveryData) end
```

### `CreateDelivery`
- Source: `docs.txt:2553`, `rawdump/Il2CppGameAssembly/Il2Cpp/DeliveryManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param timeTillDelivery integer
---@param sender SimpleLocalizedString
---@param contents Item[]
---@return Delivery
function DeliveryManager.CreateDelivery(timeTillDelivery, sender, contents) end
```

### `GenerateTrackingNumber`
- Source: `docs.txt:2556`, `rawdump/Il2CppGameAssembly/Il2Cpp/DeliveryManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function DeliveryManager.GenerateTrackingNumber() end
```

### `TryJoiningDelivery`
- Source: `docs.txt:2554`, `rawdump/Il2CppGameAssembly/Il2Cpp/DeliveryManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param mainDelivery Delivery
function DeliveryManager.TryJoiningDelivery(mainDelivery) end
```

### `UpdateDeliveries`
- Source: `docs.txt:2555`, `rawdump/Il2CppGameAssembly/Il2Cpp/DeliveryManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function DeliveryManager.UpdateDeliveries() end
```

## DriverPersonalityDefinition

- Source type: `StorySingleton+DriverPersonalityDefinition`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class DriverPersonalityDefinition
```

### `__new`
- Source: `docs.txt:6690`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param storySingleton StorySingleton
---@return DriverPersonalityDefinition
function DriverPersonalityDefinition.__new(storySingleton) end
```

## DriverPersonalityModuleConversations

- Source type: `StorySingleton+DriverPersonalityModuleConversations`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class DriverPersonalityModuleConversations
```

### `__new`
- Source: `docs.txt:6287`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return DriverPersonalityModuleConversations
function DriverPersonalityModuleConversations.__new() end
```

## EdibleItemNutritionProfile

- Source type: `EdibleItemNutritionProfile`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/EdibleItemNutritionProfile.cs`
- Dump fallback: `dump/GameAssembly/EdibleItemNutritionProfile.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class EdibleItemNutritionProfile
```

### `__new`
- Source: `docs.txt:1587`, `rawdump/Il2CppGameAssembly/Il2Cpp/EdibleItemNutritionProfile.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return EdibleItemNutritionProfile
function EdibleItemNutritionProfile.__new() end
```

### `AddDishSubItem`
- Source: `docs.txt:1589`, `rawdump/Il2CppGameAssembly/Il2Cpp/EdibleItemNutritionProfile.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param subItemProfile EdibleItemNutritionProfile
---@param count integer
function EdibleItemNutritionProfile.AddDishSubItem(subItemProfile, count) end
```

### `AppendDescribeEffects`
- Source: `docs.txt:1591`, `rawdump/Il2CppGameAssembly/Il2Cpp/EdibleItemNutritionProfile.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param stringBuilder StringBuilder
function EdibleItemNutritionProfile.AppendDescribeEffects(stringBuilder) end
```

### `Apply`
- Source: `docs.txt:1588`, `rawdump/Il2CppGameAssembly/Il2Cpp/EdibleItemNutritionProfile.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param gameVariables GameVariables
function EdibleItemNutritionProfile.Apply(gameVariables) end
```

### `FinishDishCalculation`
- Source: `docs.txt:1590`, `rawdump/Il2CppGameAssembly/Il2Cpp/EdibleItemNutritionProfile.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param dishQuality number
---@param itemPriceSum integer
---@param itemCount integer
function EdibleItemNutritionProfile.FinishDishCalculation(dishQuality, itemPriceSum, itemCount) end
```

## EdibleItemPrefabData

- Source type: `EdibleItemPrefabData`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/EdibleItemPrefabData.cs`
- Dump fallback: `dump/GameAssembly/EdibleItemPrefabData.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Dados especificos de comida/consumivel associados a ItemPrefab.EdibleData.
---@class EdibleItemPrefabData
```

### `__new`
- Source: `docs.txt:1570`, `rawdump/Il2CppGameAssembly/Il2Cpp/EdibleItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param edibleType EdibleTypeEnum
---@param nutritionProfileFiller fun(arg1: Item, arg2: EdibleItemNutritionProfile)
---@return EdibleItemPrefabData
function EdibleItemPrefabData.__new(edibleType, nutritionProfileFiller) end
```

### `Clone`
- Source: `docs.txt:1576`, `rawdump/Il2CppGameAssembly/Il2Cpp/EdibleItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return EdibleItemPrefabData
function EdibleItemPrefabData.Clone() end
```

### `CreateInstance`
- Source: `docs.txt:1571`, `rawdump/Il2CppGameAssembly/Il2Cpp/EdibleItemPrefabData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param edibleTypeEnum EdibleTypeEnum
---@param getNutritionProfile fun(arg1: Item, arg2: EdibleItemNutritionProfile)
---@return EdibleItemPrefabData
function EdibleItemPrefabData.CreateInstance(edibleTypeEnum, getNutritionProfile) end
```

### `CreateInstanceDish`
- Source: `docs.txt:1572`, `rawdump/Il2CppGameAssembly/Il2Cpp/EdibleItemPrefabData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param getNutritionProfile fun(arg1: Item, arg2: EdibleItemNutritionProfile)
---@return EdibleItemPrefabData
function EdibleItemPrefabData.CreateInstanceDish(getNutritionProfile) end
```

### `DefaultDishNutritionProfileCalculator`
- Source: `docs.txt:1573`, `rawdump/Il2CppGameAssembly/Il2Cpp/EdibleItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param profile EdibleItemNutritionProfile
function EdibleItemPrefabData.DefaultDishNutritionProfileCalculator(item, profile) end
```

### `FillNutritionProfile`
- Source: `docs.txt:1574`, `rawdump/Il2CppGameAssembly/Il2Cpp/EdibleItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param profile EdibleItemNutritionProfile
function EdibleItemPrefabData.FillNutritionProfile(item, profile) end
```

### `ToLuaString`
- Source: `docs.txt:1575`, `rawdump/Il2CppGameAssembly/Il2Cpp/EdibleItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function EdibleItemPrefabData.ToLuaString() end
```

## ElementColoringGroup

- Source type: `Live2DController+Live2DControllerElement+ElementColoringGroup`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ElementColoringGroup
```

### `__new`
- Source: `docs.txt:2880`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param colorScaler ColorScaler
---@param groups ColoringGroupEnum[]
---@return ElementColoringGroup
function ElementColoringGroup.__new(colorScaler, groups) end
```

### `CreateInstanceColorIndex0`
- Source: `docs.txt:2881`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param colorScaler ColorScaler
---@param groups ColoringGroupEnum[]
---@return ElementColoringGroup
function ElementColoringGroup.CreateInstanceColorIndex0(colorScaler, groups) end
```

### `CreateInstanceDifferentColor`
- Source: `docs.txt:2884`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param index integer
---@param colorScaler ColorScaler
---@param groups ColoringGroupEnum[]
---@return ElementColoringGroup
function ElementColoringGroup.CreateInstanceDifferentColor(index, colorScaler, groups) end
```

### `CreateInstanceParameter`
- Source: `docs.txt:2882`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param colorScaler ColorScaler
---@param enableParam Live2DParameter
---@param groups ColoringGroupEnum[]
---@return ElementColoringGroup
function ElementColoringGroup.CreateInstanceParameter(colorScaler, enableParam, groups) end
```

### `CreateInstanceParameterForceToggle`
- Source: `docs.txt:2883`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param colorScaler ColorScaler
---@param enableParam Live2DParameter
---@param groups ColoringGroupEnum[]
---@return ElementColoringGroup
function ElementColoringGroup.CreateInstanceParameterForceToggle(colorScaler, enableParam, groups) end
```

### `GetColor`
- Source: `docs.txt:2885`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@return Color
function ElementColoringGroup.GetColor(item) end
```

### `Init`
- Source: `docs.txt:2886`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param controller Live2DController
function ElementColoringGroup.Init(controller) end
```

## EmissionModule

- Source type: `UnityEngine.ParticleSystem+EmissionModule`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class EmissionModule
```

### `__new`
- Source: `docs.txt:4922`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return EmissionModule
function EmissionModule.__new() end
```

### `GetBurst`
- Source: `docs.txt:4923`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param index integer
---@return Burst
function EmissionModule.GetBurst(index) end
```

## EmitParams

- Source type: `UnityEngine.ParticleSystem+EmitParams`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class EmitParams
```

### `__new`
- Source: `docs.txt:5000`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return EmitParams
function EmitParams.__new() end
```

## EventManager

- Source type: `EventManager`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/EventManager.cs`
- Dump fallback: `dump/GameAssembly/EventManager.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class EventManager
```

### `__new`
- Source: `docs.txt:2429`, `rawdump/Il2CppGameAssembly/Il2Cpp/EventManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return EventManager
function EventManager.__new() end
```

### `ConvertOldShittyEvents`
- Source: `docs.txt:2434`, `rawdump/Il2CppGameAssembly/Il2Cpp/EventManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function EventManager.ConvertOldShittyEvents() end
```

### `CreateInstance`
- Source: `docs.txt:2430`, `rawdump/Il2CppGameAssembly/Il2Cpp/EventManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return EventManager
function EventManager.CreateInstance() end
```

### `FillRuntimeEvents`
- Source: `docs.txt:2433`, `rawdump/Il2CppGameAssembly/Il2Cpp/EventManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param toFill RuntimeEvent[]
function EventManager.FillRuntimeEvents(toFill) end
```

### `OnAfterDeserialize`
- Source: `docs.txt:2432`, `rawdump/Il2CppGameAssembly/Il2Cpp/EventManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function EventManager.OnAfterDeserialize() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:2431`, `rawdump/Il2CppGameAssembly/Il2Cpp/EventManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function EventManager.OnBeforeSerialize() end
```

### `SyncConditionalEvents`
- Source: `docs.txt:2435`, `rawdump/Il2CppGameAssembly/Il2Cpp/EventManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function EventManager.SyncConditionalEvents() end
```

### `SyncEvents`
- Source: `docs.txt:2436`, `rawdump/Il2CppGameAssembly/Il2Cpp/EventManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function EventManager.SyncEvents() end
```

## FemcelPersonalityDefinition

- Source type: `StorySingleton+FemcelPersonalityDefinition`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class FemcelPersonalityDefinition
```

### `__new`
- Source: `docs.txt:6706`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param storySingleton StorySingleton
---@return FemcelPersonalityDefinition
function FemcelPersonalityDefinition.__new(storySingleton) end
```

## FemcelPersonalityModuleConversations

- Source type: `StorySingleton+FemcelPersonalityModuleConversations`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class FemcelPersonalityModuleConversations
```

### `__new`
- Source: `docs.txt:6456`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return FemcelPersonalityModuleConversations
function FemcelPersonalityModuleConversations.__new() end
```

## FisherSellFishPopup

- Source type: `FisherSellFishPopup`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/FisherSellFishPopup.cs`
- Dump fallback: `dump/GameAssembly/FisherSellFishPopup.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class FisherSellFishPopup
```

### `__new`
- Source: `docs.txt:7815`, `rawdump/Il2CppGameAssembly/Il2Cpp/FisherSellFishPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return FisherSellFishPopup
function FisherSellFishPopup.__new() end
```

### `CloseInner`
- Source: `docs.txt:7817`, `rawdump/Il2CppGameAssembly/Il2Cpp/FisherSellFishPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function FisherSellFishPopup.CloseInner() end
```

### `Open`
- Source: `docs.txt:7816`, `rawdump/Il2CppGameAssembly/Il2Cpp/FisherSellFishPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param onFinished fun()
function FisherSellFishPopup.Open(onFinished) end
```

## FishingBackgroundsContainer

- Source type: `SpriteTextureDataGenerated+FishingBackgroundsContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class FishingBackgroundsContainer
```

### `__new`
- Source: `docs.txt:5545`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return FishingBackgroundsContainer
function FishingBackgroundsContainer.__new() end
```

## FishingBaitItemPrefabData

- Source type: `FishingBaitItemPrefabData`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/FishingBaitItemPrefabData.cs`
- Dump fallback: `dump/GameAssembly/FishingBaitItemPrefabData.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class FishingBaitItemPrefabData
```

### `__new`
- Source: `docs.txt:1667`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishingBaitItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param fishingBaitComposition table<FishingBaitType, number>
---@return FishingBaitItemPrefabData
function FishingBaitItemPrefabData.__new(fishingBaitComposition) end
```

### `Clone`
- Source: `docs.txt:1671`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishingBaitItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return FishingBaitItemPrefabData
function FishingBaitItemPrefabData.Clone() end
```

### `CreateInstance`
- Source: `docs.txt:1668`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishingBaitItemPrefabData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param fishingBaitComposition table<FishingBaitType, number>
---@return FishingBaitItemPrefabData
function FishingBaitItemPrefabData.CreateInstance(fishingBaitComposition) end
```

### `CreateInstance`
- Source: `docs.txt:1669`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishingBaitItemPrefabData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param fishingBaitType FishingBaitType
---@param fishingBaitStrength number
---@return FishingBaitItemPrefabData
function FishingBaitItemPrefabData.CreateInstance(fishingBaitType, fishingBaitStrength) end
```

### `ToLuaString`
- Source: `docs.txt:1670`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishingBaitItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function FishingBaitItemPrefabData.ToLuaString() end
```

## FishingRodItemPrefabData

- Source type: `FishingRodItemPrefabData`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/FishingRodItemPrefabData.cs`
- Dump fallback: `dump/GameAssembly/FishingRodItemPrefabData.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class FishingRodItemPrefabData
```

### `Clone`
- Source: `docs.txt:1659`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishingRodItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return FishingRodItemPrefabData
function FishingRodItemPrefabData.Clone() end
```

### `CreateInstance`
- Source: `docs.txt:1657`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishingRodItemPrefabData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param fishingRodSize01 number
---@param fishingRodAcceleration01 number
---@param fishReelingSpeed01 number
---@param maxEffectiveFishWeightKg number
---@return FishingRodItemPrefabData
function FishingRodItemPrefabData.CreateInstance(fishingRodSize01, fishingRodAcceleration01, fishReelingSpeed01, maxEffectiveFishWeightKg) end
```

### `ToLuaString`
- Source: `docs.txt:1658`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishingRodItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function FishingRodItemPrefabData.ToLuaString() end
```

## FishItemPrefabData

- Source type: `FishItemPrefabData`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/FishItemPrefabData.cs`
- Dump fallback: `dump/GameAssembly/FishItemPrefabData.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Dados especificos de peixe associados a ItemPrefab.FishData.
---@class FishItemPrefabData
```

### `__new`
- Source: `docs.txt:1621`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return FishItemPrefabData
function FishItemPrefabData.__new() end
```

### `Clone`
- Source: `docs.txt:1627`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return FishItemPrefabData
function FishItemPrefabData.Clone() end
```

### `CreateInstance`
- Source: `docs.txt:1622`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishItemPrefabData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param sizeDistribution01 number
---@param maxWeight number
---@param fishPreferences FishPreferences
---@param behaviourType FishingCatchBehaviourType
---@param strengthMultiplier number
---@return FishItemPrefabData
function FishItemPrefabData.CreateInstance(sizeDistribution01, maxWeight, fishPreferences, behaviourType, strengthMultiplier) end
```

### `CreateInstance`
- Source: `docs.txt:1623`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishItemPrefabData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return FishItemPrefabData
function FishItemPrefabData.CreateInstance() end
```

### `DetermineFishPercentile`
- Source: `docs.txt:1626`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param weight number
---@return number
function FishItemPrefabData.DetermineFishPercentile(weight) end
```

### `FillFishData`
- Source: `docs.txt:1625`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param throwValue number
---@param fishItem Item
---@param fishingGameStats FishingGameStats
---@param fishingLocationData FishingLocationData
function FishItemPrefabData.FillFishData(throwValue, fishItem, fishingGameStats, fishingLocationData) end
```

### `ToLuaString`
- Source: `docs.txt:1624`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishItemPrefabData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function FishItemPrefabData.ToLuaString() end
```

## FishPreferences

- Source type: `FishPreferences`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/FishPreferences.cs`
- Dump fallback: `dump/GameAssembly/FishPreferences.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class FishPreferences
```

### `__new`
- Source: `docs.txt:1639`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishPreferences.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return FishPreferences
function FishPreferences.__new() end
```

### `Clone`
- Source: `docs.txt:1644`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishPreferences.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return FishPreferences
function FishPreferences.Clone() end
```

### `CreateInstance`
- Source: `docs.txt:1640`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishPreferences.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param fishingBaitTypesPreference table<FishingBaitType, number>
---@param specificFishingBaitItemPreference table<GameId, number>
---@return FishPreferences
function FishPreferences.CreateInstance(fishingBaitTypesPreference, specificFishingBaitItemPreference) end
```

### `CreateInstance`
- Source: `docs.txt:1641`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishPreferences.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return FishPreferences
function FishPreferences.CreateInstance() end
```

### `DetermineActiveHourModifier`
- Source: `docs.txt:1642`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishPreferences.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param currentHour integer
---@return number
function FishPreferences.DetermineActiveHourModifier(currentHour) end
```

### `ToLuaString`
- Source: `docs.txt:1643`, `rawdump/Il2CppGameAssembly/Il2Cpp/FishPreferences.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function FishPreferences.ToLuaString() end
```

## Flag

- Source type: `GameVariables+Flag`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class Flag
```

### `__new`
- Source: `docs.txt:2064`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param _name string
---@param _firstTimeAdded integer
---@return Flag
function Flag.__new(_name, _firstTimeAdded) end
```

### `EnsureValid`
- Source: `docs.txt:2066`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Flag.EnsureValid() end
```

### `Report`
- Source: `docs.txt:2065`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param time integer
function Flag.Report(time) end
```

## FlagConditionBasic

- Source type: `StoryConditions.FlagConditionBasic`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionBasic.cs`
- Dump fallback: `dump/GameAssembly/StoryConditions/FlagConditionBasic.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class FlagConditionBasic
```

### `__new`
- Source: `docs.txt:7023`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionBasic.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param flag string
---@param negate boolean
---@return FlagConditionBasic
function FlagConditionBasic.__new(flag, negate) end
```

### `Equals`
- Source: `docs.txt:7026`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionBasic.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param other FlagConditionBasic
---@return boolean
function FlagConditionBasic.Equals(other) end
```

### `Equals`
- Source: `docs.txt:7027`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionBasic.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function FlagConditionBasic.Equals(obj) end
```

### `Explain`
- Source: `docs.txt:7024`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionBasic.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function FlagConditionBasic.Explain() end
```

### `GenerateCode`
- Source: `docs.txt:7025`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionBasic.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function FlagConditionBasic.GenerateCode() end
```

### `GetHashCode`
- Source: `docs.txt:7028`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionBasic.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function FlagConditionBasic.GetHashCode() end
```

## FlagConditionSpecialWithTime

- Source type: `StoryConditions.FlagConditionSpecialWithTime`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionSpecialWithTime.cs`
- Dump fallback: `dump/GameAssembly/StoryConditions/FlagConditionSpecialWithTime.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class FlagConditionSpecialWithTime
```

### `__new`
- Source: `docs.txt:7042`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionSpecialWithTime.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param flag string
---@param checkType CheckType
---@param timePeriod integer
---@param timeCheck TimeCheckType
---@param negate boolean
---@return FlagConditionSpecialWithTime
function FlagConditionSpecialWithTime.__new(flag, checkType, timePeriod, timeCheck, negate) end
```

### `Equals`
- Source: `docs.txt:7045`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionSpecialWithTime.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param other FlagConditionSpecialWithTime
---@return boolean
function FlagConditionSpecialWithTime.Equals(other) end
```

### `Equals`
- Source: `docs.txt:7046`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionSpecialWithTime.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function FlagConditionSpecialWithTime.Equals(obj) end
```

### `Explain`
- Source: `docs.txt:7043`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionSpecialWithTime.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function FlagConditionSpecialWithTime.Explain() end
```

### `GenerateCode`
- Source: `docs.txt:7044`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionSpecialWithTime.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function FlagConditionSpecialWithTime.GenerateCode() end
```

### `GetHashCode`
- Source: `docs.txt:7047`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionSpecialWithTime.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function FlagConditionSpecialWithTime.GetHashCode() end
```

## FlagConditionWithTime

- Source type: `StoryConditions.FlagConditionWithTime`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionWithTime.cs`
- Dump fallback: `dump/GameAssembly/StoryConditions/FlagConditionWithTime.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class FlagConditionWithTime
```

### `__new`
- Source: `docs.txt:7033`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionWithTime.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param flag string
---@param timePeriod integer
---@param timeCheck TimeCheckType
---@param negate boolean
---@return FlagConditionWithTime
function FlagConditionWithTime.__new(flag, timePeriod, timeCheck, negate) end
```

### `Equals`
- Source: `docs.txt:7036`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionWithTime.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param other FlagConditionWithTime
---@return boolean
function FlagConditionWithTime.Equals(other) end
```

### `Equals`
- Source: `docs.txt:7037`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionWithTime.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function FlagConditionWithTime.Equals(obj) end
```

### `Explain`
- Source: `docs.txt:7034`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionWithTime.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function FlagConditionWithTime.Explain() end
```

### `GenerateCode`
- Source: `docs.txt:7035`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionWithTime.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function FlagConditionWithTime.GenerateCode() end
```

### `GetHashCode`
- Source: `docs.txt:7038`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/FlagConditionWithTime.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function FlagConditionWithTime.GetHashCode() end
```

## Flowchart

- Source type: `Fungus.Flowchart`
- Rawdump: `rawdump/Il2CppFungus/Flowchart.cs`
- Dump fallback: `not found`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class Flowchart
```

### `__new`
- Source: `docs.txt:7486`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Flowchart
function Flowchart.__new() end
```

### `AddSelectedBlock`
- Source: `docs.txt:7522`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param block Block
function Flowchart.AddSelectedBlock(block) end
```

### `AddSelectedCommand`
- Source: `docs.txt:7520`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param command Command
function Flowchart.AddSelectedCommand(command) end
```

### `CheckItemIds`
- Source: `docs.txt:7487`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Flowchart.CheckItemIds() end
```

### `ClearSelectedBlocks`
- Source: `docs.txt:7521`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Flowchart.ClearSelectedBlocks() end
```

### `ClearSelectedCommands`
- Source: `docs.txt:7519`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Flowchart.ClearSelectedCommands() end
```

### `CreateBlock`
- Source: `docs.txt:7491`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param position Vector2
---@param blockName string
---@return Block
function Flowchart.CreateBlock(position, blockName) end
```

### `DeselectBlock`
- Source: `docs.txt:7523`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param block Block
---@return boolean
function Flowchart.DeselectBlock(block) end
```

### `DeselectBlockNoCheck`
- Source: `docs.txt:7524`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param b Block
function Flowchart.DeselectBlockNoCheck(b) end
```

### `DetermineSubstituteVariables`
- Source: `docs.txt:7533`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param str string
---@param vars Variable[]
function Flowchart.DetermineSubstituteVariables(str, vars) end
```

### `ExecuteBlock`
- Source: `docs.txt:7495`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param blockName string
function Flowchart.ExecuteBlock(blockName) end
```

### `ExecuteBlock`
- Source: `docs.txt:7496`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param block Block
---@param commandIndex integer
---@param onComplete fun()
---@return boolean
function Flowchart.ExecuteBlock(block, commandIndex, onComplete) end
```

### `ExecuteIfHasBlock`
- Source: `docs.txt:7494`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param blockName string
---@return boolean
function Flowchart.ExecuteIfHasBlock(blockName) end
```

### `GetAllBlocks`
- Source: `docs.txt:7531`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return any[]
function Flowchart.GetAllBlocks() end
```

### `GetBooleanVariable`
- Source: `docs.txt:7506`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@return boolean
function Flowchart.GetBooleanVariable(key) end
```

### `GetExecutingBlocks`
- Source: `docs.txt:7530`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return any[]
function Flowchart.GetExecutingBlocks() end
```

### `GetFloatVariable`
- Source: `docs.txt:7510`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@return number
function Flowchart.GetFloatVariable(key) end
```

### `GetGameObjectVariable`
- Source: `docs.txt:7514`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@return GameObject
function Flowchart.GetGameObjectVariable(key) end
```

### `GetIntegerVariable`
- Source: `docs.txt:7508`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@return integer
function Flowchart.GetIntegerVariable(key) end
```

### `GetName`
- Source: `docs.txt:7489`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function Flowchart.GetName() end
```

### `GetPublicVariables`
- Source: `docs.txt:7505`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return any[]
function Flowchart.GetPublicVariables() end
```

### `GetStringVariable`
- Source: `docs.txt:7512`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@return string
function Flowchart.GetStringVariable(key) end
```

### `GetTransformVariable`
- Source: `docs.txt:7516`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@return Transform
function Flowchart.GetTransformVariable(key) end
```

### `GetUniqueBlockKey`
- Source: `docs.txt:7500`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param originalKey string
---@param ignoreBlock Block
---@return string
function Flowchart.GetUniqueBlockKey(originalKey, ignoreBlock) end
```

### `GetUniqueLabelKey`
- Source: `docs.txt:7501`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param originalKey string
---@param ignoreLabel Label
---@return string
function Flowchart.GetUniqueLabelKey(originalKey, ignoreLabel) end
```

### `GetUniqueVariableKey`
- Source: `docs.txt:7499`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param originalKey string
---@param ignoreVariable Variable
---@return string
function Flowchart.GetUniqueVariableKey(originalKey, ignoreVariable) end
```

### `GetVariable`
- Source: `docs.txt:7502`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@return Variable
function Flowchart.GetVariable(key) end
```

### `GetVariableNames`
- Source: `docs.txt:7504`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string[]
function Flowchart.GetVariableNames() end
```

### `HasBlock`
- Source: `docs.txt:7493`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param blockName string
---@return boolean
function Flowchart.HasBlock(blockName) end
```

### `HasExecutingBlocks`
- Source: `docs.txt:7529`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return boolean
function Flowchart.HasExecutingBlocks() end
```

### `HasVariable`
- Source: `docs.txt:7503`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@return boolean
function Flowchart.HasVariable(key) end
```

### `IsActive`
- Source: `docs.txt:7488`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return boolean
function Flowchart.IsActive() end
```

### `IsCommandSupported`
- Source: `docs.txt:7528`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param commandInfo CommandInfoAttribute
---@return boolean
function Flowchart.IsCommandSupported(commandInfo) end
```

### `NextItemId`
- Source: `docs.txt:7490`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return integer
function Flowchart.NextItemId() end
```

### `Reset`
- Source: `docs.txt:7527`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param resetCommands boolean
---@param resetVariables boolean
function Flowchart.Reset(resetCommands, resetVariables) end
```

### `ReverseUpdateSelectedCache`
- Source: `docs.txt:7526`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Flowchart.ReverseUpdateSelectedCache() end
```

### `SetBooleanVariable`
- Source: `docs.txt:7507`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, usage, name-pattern`
```lua
---Configura booleana variavel.
---@param key string
---@param value boolean
function Flowchart.SetBooleanVariable(key, value) end
```

### `SetFloatVariable`
- Source: `docs.txt:7511`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@param value number
function Flowchart.SetFloatVariable(key, value) end
```

### `SetGameObjectVariable`
- Source: `docs.txt:7515`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@param value GameObject
function Flowchart.SetGameObjectVariable(key, value) end
```

### `SetIntegerVariable`
- Source: `docs.txt:7509`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, usage, name-pattern`
```lua
---Configura integer variavel.
---@param key string
---@param value integer
function Flowchart.SetIntegerVariable(key, value) end
```

### `SetStringVariable`
- Source: `docs.txt:7513`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@param value string
function Flowchart.SetStringVariable(key, value) end
```

### `SetTransformVariable`
- Source: `docs.txt:7517`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `medium`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@param value Transform
function Flowchart.SetTransformVariable(key, value) end
```

### `StopAllBlocks`
- Source: `docs.txt:7498`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Flowchart.StopAllBlocks() end
```

### `StopBlock`
- Source: `docs.txt:7497`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param blockName string
function Flowchart.StopBlock(blockName) end
```

### `SubstituteVariables`
- Source: `docs.txt:7532`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param input string
---@return string
function Flowchart.SubstituteVariables(input) end
```

### `TryGetBlock`
- Source: `docs.txt:7492`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param blockName string
---@param block Block
---@return boolean
function Flowchart.TryGetBlock(blockName, block) end
```

### `UpdateBlockCommandIndicesNextFrame`
- Source: `docs.txt:7534`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param block Block
function Flowchart.UpdateBlockCommandIndicesNextFrame(block) end
```

### `UpdateHideFlags`
- Source: `docs.txt:7518`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Flowchart.UpdateHideFlags() end
```

### `UpdateSelectedCache`
- Source: `docs.txt:7525`, `rawdump/Il2CppFungus/Flowchart.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Flowchart.UpdateSelectedCache() end
```

## FontDataGenerated

- Source type: `FontDataGenerated`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/FontDataGenerated.cs`
- Dump fallback: `dump/GameAssembly/FontDataGenerated.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class FontDataGenerated
```

### `__new`
- Source: `docs.txt:4374`, `rawdump/Il2CppGameAssembly/Il2Cpp/FontDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return FontDataGenerated
function FontDataGenerated.__new() end
```

### `OnAfterDeserialize`
- Source: `docs.txt:4376`, `rawdump/Il2CppGameAssembly/Il2Cpp/FontDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function FontDataGenerated.OnAfterDeserialize() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:4375`, `rawdump/Il2CppGameAssembly/Il2Cpp/FontDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function FontDataGenerated.OnBeforeSerialize() end
```

### `RegisterLua`
- Source: `docs.txt:4377`, `rawdump/Il2CppGameAssembly/Il2Cpp/FontDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function FontDataGenerated.RegisterLua() end
```

## GameId

- Source type: `GameId`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Dump fallback: `dump/GameAssembly/GameId.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Identificador de item ou recurso do jogo, incluindo itens vanilla e itens registrados por mods.
---@class GameId
```

### `__new`
- Source: `docs.txt:379`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return GameId
function GameId.__new() end
```

### `__toGameId`
- Source: `docs.txt:380`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param id integer
---@return GameId
function GameId.__toGameId(id) end
```

### `CompareTo`
- Source: `docs.txt:395`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param other GameId
---@return integer
function GameId.CompareTo(other) end
```

### `CreateGeneric`
- Source: `docs.txt:387`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param guid Guid
---@param id integer
---@return GameId
function GameId.CreateGeneric(guid, id) end
```

### `CreateModded`
- Source: `docs.txt:386`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param mod Mod
---@param id integer
---@return GameId
function GameId.CreateModded(mod, id) end
```

### `CreateVanilla`
- Source: `docs.txt:381`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Cria vanilla e retorna GameId.
---@param id ItemEnum
---@return GameId
function GameId.CreateVanilla(id) end
```

### `CreateVanilla`
- Source: `docs.txt:382`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Cria vanilla e retorna GameId.
---@param id CookingSongEnumGI
---@return GameId
function GameId.CreateVanilla(id) end
```

### `CreateVanilla`
- Source: `docs.txt:383`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Cria vanilla e retorna GameId.
---@param id FishingLocationEnumGI
---@return GameId
function GameId.CreateVanilla(id) end
```

### `CreateVanilla`
- Source: `docs.txt:384`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Cria vanilla e retorna GameId.
---@param id ItemModifierEnumGI
---@return GameId
function GameId.CreateVanilla(id) end
```

### `CreateVanilla`
- Source: `docs.txt:385`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Cria vanilla e retorna GameId.
---@param id integer
---@return GameId
function GameId.CreateVanilla(id) end
```

### `Equals`
- Source: `docs.txt:390`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function GameId.Equals(obj) end
```

### `Equals`
- Source: `docs.txt:391`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param b2 GameId
---@return boolean
function GameId.Equals(b2) end
```

### `FromShortString`
- Source: `docs.txt:397`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param s string
---@param gameId GameId
---@return boolean
function GameId.FromShortString(s, gameId) end
```

### `GetHashCode`
- Source: `docs.txt:392`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function GameId.GetHashCode() end
```

### `op_Equality`
- Source: `docs.txt:388`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param b1 GameId
---@param b2 GameId
---@return boolean
function GameId.op_Equality(b1, b2) end
```

### `op_Inequality`
- Source: `docs.txt:389`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param b1 GameId
---@param b2 GameId
---@return boolean
function GameId.op_Inequality(b1, b2) end
```

### `ToLuaString`
- Source: `docs.txt:394`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function GameId.ToLuaString() end
```

### `ToShortString`
- Source: `docs.txt:396`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function GameId.ToShortString() end
```

### `ToString`
- Source: `docs.txt:393`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameId.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return string
function GameId.ToString() end
```

## GameLogoContainer

- Source type: `SpriteTextureDataGenerated+GameLogoContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class GameLogoContainer
```

### `__new`
- Source: `docs.txt:5916`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return GameLogoContainer
function GameLogoContainer.__new() end
```

## GameStatFixedValue

- Source type: `GameStatFixedValue`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatFixedValue.cs`
- Dump fallback: `dump/GameAssembly/GameStatFixedValue.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class GameStatFixedValue
```

### `__new`
- Source: `docs.txt:1699`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatFixedValue.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param defaultValue number
---@return GameStatFixedValue
function GameStatFixedValue.__new(defaultValue) end
```

### `Calculate`
- Source: `docs.txt:1702`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatFixedValue.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param add number
---@return number
function GameStatFixedValue.Calculate(add) end
```

### `ResetStat`
- Source: `docs.txt:1701`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatFixedValue.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
function GameStatFixedValue.ResetStat() end
```

### `SetValue`
- Source: `docs.txt:1700`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatFixedValue.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param value number
function GameStatFixedValue.SetValue(value) end
```

### `ToString`
- Source: `docs.txt:1703`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatFixedValue.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return string
function GameStatFixedValue.ToString() end
```

## GameStatPercentBoost

- Source type: `GameStatPercentBoost`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatPercentBoost.cs`
- Dump fallback: `dump/GameAssembly/GameStatPercentBoost.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class GameStatPercentBoost
```

### `__new`
- Source: `docs.txt:1727`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatPercentBoost.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param minAllowedPercent number
---@param maxAllowedPercent number
---@return GameStatPercentBoost
function GameStatPercentBoost.__new(minAllowedPercent, maxAllowedPercent) end
```

### `CalculateBoosted`
- Source: `docs.txt:1729`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatPercentBoost.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value number
---@return number
function GameStatPercentBoost.CalculateBoosted(value) end
```

### `CalculateBoostedInt`
- Source: `docs.txt:1730`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatPercentBoost.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value integer
---@return integer
function GameStatPercentBoost.CalculateBoostedInt(value) end
```

### `ResetStat`
- Source: `docs.txt:1728`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatPercentBoost.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
function GameStatPercentBoost.ResetStat() end
```

### `ToString`
- Source: `docs.txt:1731`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatPercentBoost.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return string
function GameStatPercentBoost.ToString() end
```

## GameStatRandomPercentage

- Source type: `GameStatRandomPercentage`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatRandomPercentage.cs`
- Dump fallback: `dump/GameAssembly/GameStatRandomPercentage.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class GameStatRandomPercentage
```

### `__new`
- Source: `docs.txt:1738`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatRandomPercentage.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param defaultValue number
---@param defaultMultiply number
---@return GameStatRandomPercentage
function GameStatRandomPercentage.__new(defaultValue, defaultMultiply) end
```

### `Calculate`
- Source: `docs.txt:1740`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatRandomPercentage.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param add number
---@param multi number
---@return number
function GameStatRandomPercentage.Calculate(add, multi) end
```

### `Check`
- Source: `docs.txt:1741`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatRandomPercentage.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param add number
---@param multi number
---@return boolean
function GameStatRandomPercentage.Check(add, multi) end
```

### `ResetStat`
- Source: `docs.txt:1739`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatRandomPercentage.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
function GameStatRandomPercentage.ResetStat() end
```

### `ToString`
- Source: `docs.txt:1742`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameStatRandomPercentage.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return string
function GameStatRandomPercentage.ToString() end
```

## GameUtilities

- Source type: `GameUtilities`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/GameUtilities.cs`
- Dump fallback: `dump/GameAssembly/GameUtilities.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Utilitarios gerais do jogo expostos ao Lua, incluindo transicoes de view, inventario e esperas para coroutine.
---@class GameUtilities
```

### `__new`
- Source: `docs.txt:8170`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameUtilities.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return GameUtilities
function GameUtilities.__new() end
```

### `AddItemToInventory`
- Source: `docs.txt:8171`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameUtilities.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
function GameUtilities.AddItemToInventory(item) end
```

### `FadeOrMoveToView`
- Source: `docs.txt:8175`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameUtilities.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param targetView View
---@param afterFinished fun()
---@param duration number
function GameUtilities.FadeOrMoveToView(targetView, afterFinished, duration) end
```

### `FadeToView`
- Source: `docs.txt:8172`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameUtilities.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param targetView View
---@param afterFinished fun()
---@param duration number
---@param fadeOut boolean
---@param color Color|nil
function GameUtilities.FadeToView(targetView, afterFinished, duration, fadeOut, color) end
```

### `GetCurrentYearToInteger`
- Source: `docs.txt:8173`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameUtilities.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
function GameUtilities.GetCurrentYearToInteger() end
```

### `MoveToView`
- Source: `docs.txt:8174`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameUtilities.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param targetView View
---@param afterFinished fun()
---@param duration number
---@param panType PanType
function GameUtilities.MoveToView(targetView, afterFinished, duration, panType) end
```

## GameVariables

- Source type: `GameVariables`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Dump fallback: `dump/GameAssembly/GameVariables.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Estado global do jogo exposto para leitura, escrita e condicoes.
---@class GameVariables
```

### `AddEmail`
- Source: `docs.txt:2093`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param email NewEmail
function GameVariables.AddEmail(email) end
```

### `AddFlag`
- Source: `docs.txt:2133`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param flag string
function GameVariables.AddFlag(flag) end
```

### `AddMoney`
- Source: `docs.txt:2146`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param amount integer
function GameVariables.AddMoney(amount) end
```

### `AfterLoad`
- Source: `docs.txt:2109`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.AfterLoad() end
```

### `AnonShowerEffect`
- Source: `docs.txt:2122`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.AnonShowerEffect() end
```

### `AnonShowerStatus`
- Source: `docs.txt:2119`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function GameVariables.AnonShowerStatus() end
```

### `BeforeUnload`
- Source: `docs.txt:2108`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.BeforeUnload() end
```

### `BotCleanWithRagEffect`
- Source: `docs.txt:2124`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
function GameVariables.BotCleanWithRagEffect() end
```

### `BotShowerEffect`
- Source: `docs.txt:2123`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
function GameVariables.BotShowerEffect() end
```

### `BotShowerStatus`
- Source: `docs.txt:2120`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function GameVariables.BotShowerStatus() end
```

### `CheckFlag`
- Source: `docs.txt:2135`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param flag string
---@return boolean
function GameVariables.CheckFlag(flag) end
```

### `CheckFlagAfterRelative`
- Source: `docs.txt:2138`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param flag string
---@param t integer
---@return boolean
function GameVariables.CheckFlagAfterRelative(flag, t) end
```

### `CheckFlagBeforeRelative`
- Source: `docs.txt:2137`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param flag string
---@param t integer
---@return boolean
function GameVariables.CheckFlagBeforeRelative(flag, t) end
```

### `CheckFlagSpecial`
- Source: `docs.txt:2140`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param flag string
---@param type CheckType
---@return boolean
function GameVariables.CheckFlagSpecial(flag, type) end
```

### `CheckFlagSpecialWithTime`
- Source: `docs.txt:2141`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param flag string
---@param type CheckType
---@param timePeriod integer
---@param timeCheck TimeCheckType
---@return boolean
function GameVariables.CheckFlagSpecialWithTime(flag, type, timePeriod, timeCheck) end
```

### `CheckFlagWithTime`
- Source: `docs.txt:2139`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param flag string
---@param timePeriod integer
---@param timeCheck TimeCheckType
---@return boolean
function GameVariables.CheckFlagWithTime(flag, timePeriod, timeCheck) end
```

### `CleanCumOutside`
- Source: `docs.txt:2125`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.CleanCumOutside() end
```

### `ClearMood`
- Source: `docs.txt:2128`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
function GameVariables.ClearMood() end
```

### `CreateStartOfTheGame`
- Source: `docs.txt:2100`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param time integer
---@param money integer
---@return GameVariables
function GameVariables.CreateStartOfTheGame(time, money) end
```

### `CumStatus`
- Source: `docs.txt:2116`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function GameVariables.CumStatus() end
```

### `DayToDayOfTheWeek`
- Source: `docs.txt:2153`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param day integer
---@return integer
function GameVariables.DayToDayOfTheWeek(day) end
```

### `Eat`
- Source: `docs.txt:2113`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
function GameVariables.Eat(item) end
```

### `EndSex`
- Source: `docs.txt:2127`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.EndSex() end
```

### `ExtractCumFromBalls`
- Source: `docs.txt:2114`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return number
function GameVariables.ExtractCumFromBalls() end
```

### `ForceTakeMoney`
- Source: `docs.txt:2145`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param amount integer
---@return boolean
function GameVariables.ForceTakeMoney(amount) end
```

### `FullStatusText`
- Source: `docs.txt:2121`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function GameVariables.FullStatusText() end
```

### `GetCumPercent`
- Source: `docs.txt:2115`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return number
function GameVariables.GetCumPercent() end
```

### `GetDialogueChainMemory`
- Source: `docs.txt:2106`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param source string
---@return DialogueChainMemory
function GameVariables.GetDialogueChainMemory(source) end
```

### `GetFlagLastTimeOrDefault`
- Source: `docs.txt:2131`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param flag string
---@param defaultValue integer
---@return integer
function GameVariables.GetFlagLastTimeOrDefault(flag, defaultValue) end
```

### `GetFlagSetCount`
- Source: `docs.txt:2136`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Retorna flag set count.
---@param flag string
---@return integer
function GameVariables.GetFlagSetCount(flag) end
```

### `GetGameStats`
- Source: `docs.txt:2098`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return GameStats
function GameVariables.GetGameStats() end
```

### `GetPersonalityGameStats`
- Source: `docs.txt:2099`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return PersonalityGameStats
function GameVariables.GetPersonalityGameStats() end
```

### `GetPresetColors`
- Source: `docs.txt:2105`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return any[]
function GameVariables.GetPresetColors() end
```

### `GetRentData`
- Source: `docs.txt:2110`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param daysTillRent integer
---@param paidToday boolean
function GameVariables.GetRentData(daysTillRent, paidToday) end
```

### `HappenedRecently`
- Source: `docs.txt:2160`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param occuredTime integer
---@param currentTime integer
---@param recentTimeMinutes integer
---@return boolean
function GameVariables.HappenedRecently(occuredTime, currentTime, recentTimeMinutes) end
```

### `HealthStatus`
- Source: `docs.txt:2118`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function GameVariables.HealthStatus() end
```

### `InvalidateGameStats`
- Source: `docs.txt:2097`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.InvalidateGameStats() end
```

### `IsAValidSaveAfter075Update`
- Source: `docs.txt:2102`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return boolean
function GameVariables.IsAValidSaveAfter075Update() end
```

### `LastMultiple`
- Source: `docs.txt:2159`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param time integer
---@param number integer
---@return integer
function GameVariables.LastMultiple(time, number) end
```

### `ManifestHorninessAndResetFrickData`
- Source: `docs.txt:2126`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.ManifestHorninessAndResetFrickData() end
```

### `MinutePassed`
- Source: `docs.txt:2112`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param type StaminaSyncType
---@param suppressEvents boolean
function GameVariables.MinutePassed(type, suppressEvents) end
```

### `NewGameInitialization`
- Source: `docs.txt:2101`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.NewGameInitialization() end
```

### `OnAfterDeserialize`
- Source: `docs.txt:2130`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.OnAfterDeserialize() end
```

### `OnAfterDeserializeDialogueChain`
- Source: `docs.txt:2107`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.OnAfterDeserializeDialogueChain() end
```

### `OnAfterDeserializeEmail`
- Source: `docs.txt:2096`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.OnAfterDeserializeEmail() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:2129`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.OnBeforeSerialize() end
```

### `OnBeforeSerializeEmail`
- Source: `docs.txt:2095`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.OnBeforeSerializeEmail() end
```

### `PlanEmail`
- Source: `docs.txt:2094`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param email NewEmail
---@param planningData PlanningData
function GameVariables.PlanEmail(email, planningData) end
```

### `RawGameTimeToGameDateTime`
- Source: `docs.txt:2151`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param time integer
---@return DateTime
function GameVariables.RawGameTimeToGameDateTime(time) end
```

### `RemoveAllEmailsWithId`
- Source: `docs.txt:2090`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Remove todos emails with id.
---@param id string
function GameVariables.RemoveAllEmailsWithId(id) end
```

### `RemoveEmail`
- Source: `docs.txt:2091`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param email NewEmail
function GameVariables.RemoveEmail(email) end
```

### `RemoveFlag`
- Source: `docs.txt:2134`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param flag string
function GameVariables.RemoveFlag(flag) end
```

### `RemoveOpenedSpamEmails`
- Source: `docs.txt:2092`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
function GameVariables.RemoveOpenedSpamEmails() end
```

### `ReportSleepEnd`
- Source: `docs.txt:2150`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param withBot boolean
function GameVariables.ReportSleepEnd(withBot) end
```

### `ResetChurchStoryline`
- Source: `docs.txt:2143`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.ResetChurchStoryline() end
```

### `SatiationStatus`
- Source: `docs.txt:2117`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function GameVariables.SatiationStatus() end
```

### `SetBotName`
- Source: `docs.txt:2149`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
function GameVariables.SetBotName(name) end
```

### `SetPlayerName`
- Source: `docs.txt:2148`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
function GameVariables.SetPlayerName(name) end
```

### `SetPresetColors`
- Source: `docs.txt:2104`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param colors Color[]
function GameVariables.SetPresetColors(colors) end
```

### `SwallowCum`
- Source: `docs.txt:2147`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param ml number
function GameVariables.SwallowCum(ml) end
```

### `TimeCheckTypeString`
- Source: `docs.txt:2142`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param timeCheckType TimeCheckType
---@param value string
---@return string
function GameVariables.TimeCheckTypeString(timeCheckType, value) end
```

### `TimeFromDate`
- Source: `docs.txt:2155`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param day integer
---@param hour integer
---@param minute integer
---@return integer
function GameVariables.TimeFromDate(day, hour, minute) end
```

### `TimeInDay`
- Source: `docs.txt:2156`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param hour integer
---@param minute integer
---@return integer
function GameVariables.TimeInDay(hour, minute) end
```

### `TimeToDateString`
- Source: `docs.txt:2158`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param time integer
---@return string
function GameVariables.TimeToDateString(time) end
```

### `TimeToDay`
- Source: `docs.txt:2154`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param time integer
---@return integer
function GameVariables.TimeToDay(time) end
```

### `TimeToDayOfTheWeek`
- Source: `docs.txt:2152`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param time integer
---@return integer
function GameVariables.TimeToDayOfTheWeek(time) end
```

### `TimeToHour`
- Source: `docs.txt:2161`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param time integer
---@return integer
function GameVariables.TimeToHour(time) end
```

### `TimeToHourString`
- Source: `docs.txt:2157`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param time integer
---@return string
function GameVariables.TimeToHourString(time) end
```

### `TransitionGameVersion`
- Source: `docs.txt:2103`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param infoText string
---@return Result
function GameVariables.TransitionGameVersion(infoText) end
```

### `TryGetFlag`
- Source: `docs.txt:2132`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param flagString string
---@param flag Flag
---@return boolean
function GameVariables.TryGetFlag(flagString, flag) end
```

### `TryTakeMoney`
- Source: `docs.txt:2144`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param amount integer
---@return boolean
function GameVariables.TryTakeMoney(amount) end
```

### `UpdateRentStatus`
- Source: `docs.txt:2111`, `rawdump/Il2CppGameAssembly/Il2Cpp/GameVariables.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function GameVariables.UpdateRentStatus() end
```

## GlobalFlag

- Source type: `GlobalFlag`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/GlobalFlag.cs`
- Dump fallback: `dump/GameAssembly/GlobalFlag.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class GlobalFlag
```

### `__new`
- Source: `docs.txt:7469`, `rawdump/Il2CppGameAssembly/Il2Cpp/GlobalFlag.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return GlobalFlag
function GlobalFlag.__new() end
```

### `SetFlag`
- Source: `docs.txt:7470`, `rawdump/Il2CppGameAssembly/Il2Cpp/GlobalFlag.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
function GlobalFlag.SetFlag() end
```

## Guid

- Source type: `System.Guid`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class Guid
```

### `__new`
- Source: `docs.txt:351`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param b integer[]
---@return Guid
function Guid.__new(b) end
```

### `__new`
- Source: `docs.txt:352`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param b integer[]
---@return Guid
function Guid.__new(b) end
```

### `__new`
- Source: `docs.txt:353`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param a integer
---@param b integer
---@param c integer
---@param d integer
---@param e integer
---@param f integer
---@param g integer
---@param h integer
---@param i integer
---@param j integer
---@param k integer
---@return Guid
function Guid.__new(a, b, c, d, e, f, g, h, i, j, k) end
```

### `__new`
- Source: `docs.txt:354`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param g string
---@return Guid
function Guid.__new(g) end
```

### `__new`
- Source: `docs.txt:355`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Guid
function Guid.__new() end
```

### `CompareTo`
- Source: `docs.txt:370`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value any
---@return integer
function Guid.CompareTo(value) end
```

### `CompareTo`
- Source: `docs.txt:371`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value Guid
---@return integer
function Guid.CompareTo(value) end
```

### `Equals`
- Source: `docs.txt:368`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param o any
---@return boolean
function Guid.Equals(o) end
```

### `Equals`
- Source: `docs.txt:369`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param g Guid
---@return boolean
function Guid.Equals(g) end
```

### `GetHashCode`
- Source: `docs.txt:367`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return integer
function Guid.GetHashCode() end
```

### `NewGuid`
- Source: `docs.txt:356`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return Guid
function Guid.NewGuid() end
```

### `op_Equality`
- Source: `docs.txt:372`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param a Guid
---@param b Guid
---@return boolean
function Guid.op_Equality(a, b) end
```

### `op_Inequality`
- Source: `docs.txt:373`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param a Guid
---@param b Guid
---@return boolean
function Guid.op_Inequality(a, b) end
```

### `Parse`
- Source: `docs.txt:357`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param input string
---@return Guid
function Guid.Parse(input) end
```

### `Parse`
- Source: `docs.txt:358`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param input string[]
---@return Guid
function Guid.Parse(input) end
```

### `ToByteArray`
- Source: `docs.txt:363`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return integer[]
function Guid.ToByteArray() end
```

### `ToString`
- Source: `docs.txt:364`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function Guid.ToString() end
```

### `ToString`
- Source: `docs.txt:365`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param format string
---@return string
function Guid.ToString(format) end
```

### `ToString`
- Source: `docs.txt:366`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param format string
---@param provider IFormatProvider
---@return string
function Guid.ToString(format, provider) end
```

### `TryFormat`
- Source: `docs.txt:374`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param destination string[]
---@param charsWritten integer
---@param format string[]
---@return boolean
function Guid.TryFormat(destination, charsWritten, format) end
```

### `TryParse`
- Source: `docs.txt:359`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param input string
---@param result Guid
---@return boolean
function Guid.TryParse(input, result) end
```

### `TryParse`
- Source: `docs.txt:360`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param input string[]
---@param result Guid
---@return boolean
function Guid.TryParse(input, result) end
```

### `TryParseExact`
- Source: `docs.txt:361`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param input string
---@param format string
---@param result Guid
---@return boolean
function Guid.TryParseExact(input, format, result) end
```

### `TryParseExact`
- Source: `docs.txt:362`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param input string[]
---@param format string[]
---@param result Guid
---@return boolean
function Guid.TryParseExact(input, format, result) end
```

## HimederePersonalityDefinition

- Source type: `StorySingleton+HimederePersonalityDefinition`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class HimederePersonalityDefinition
```

### `__new`
- Source: `docs.txt:6710`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param storySingleton StorySingleton
---@return HimederePersonalityDefinition
function HimederePersonalityDefinition.__new(storySingleton) end
```

## HimederePersonalityModuleConversations

- Source type: `StorySingleton+HimederePersonalityModuleConversations`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class HimederePersonalityModuleConversations
```

### `__new`
- Source: `docs.txt:6510`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return HimederePersonalityModuleConversations
function HimederePersonalityModuleConversations.__new() end
```

## IconsContainer

- Source type: `SpriteTextureDataGenerated+IconsContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class IconsContainer
```

### `__new`
- Source: `docs.txt:5639`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return IconsContainer
function IconsContainer.__new() end
```

## ILive2DControllerManager_EndUsage

- Source type: `Live2DController+ILive2DControllerManager_EndUsage`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ILive2DControllerManager_EndUsage
```

### `EndUsage`
- Source: `docs.txt:2752`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ILive2DControllerManager_EndUsage.EndUsage() end
```

## ILive2DControllerManager_FixedUpdate

- Source type: `Live2DController+ILive2DControllerManager_FixedUpdate`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ILive2DControllerManager_FixedUpdate
```

### `FixedUpdate`
- Source: `docs.txt:2744`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ILive2DControllerManager_FixedUpdate.FixedUpdate() end
```

## ILive2DControllerManager_OnDisable

- Source type: `Live2DController+ILive2DControllerManager_OnDisable`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ILive2DControllerManager_OnDisable
```

### `OnDisable`
- Source: `docs.txt:2756`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ILive2DControllerManager_OnDisable.OnDisable() end
```

## ILive2DControllerManager_ResetStage1

- Source type: `Live2DController+ILive2DControllerManager_ResetStage1`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ILive2DControllerManager_ResetStage1
```

### `ResetStage1`
- Source: `docs.txt:2760`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ILive2DControllerManager_ResetStage1.ResetStage1() end
```

## ILive2DControllerManager_SerializedState

- Source type: `Live2DController+ILive2DControllerManager_SerializedState`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ILive2DControllerManager_SerializedState
```

### `LoadState`
- Source: `docs.txt:2736`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param state Live2DControllerCommonState
function ILive2DControllerManager_SerializedState.LoadState(state) end
```

### `SaveState`
- Source: `docs.txt:2735`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param state Live2DControllerCommonState
function ILive2DControllerManager_SerializedState.SaveState(state) end
```

## ILive2DControllerManager_StartUsageGameplay

- Source type: `Live2DController+ILive2DControllerManager_StartUsageGameplay`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ILive2DControllerManager_StartUsageGameplay
```

### `StartUsageGameplay`
- Source: `docs.txt:2748`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ILive2DControllerManager_StartUsageGameplay.StartUsageGameplay() end
```

## ILive2DControllerManager_Update

- Source type: `Live2DController+ILive2DControllerManager_Update`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ILive2DControllerManager_Update
```

### `Update`
- Source: `docs.txt:2740`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ILive2DControllerManager_Update.Update() end
```

## Item

- Source type: `Item`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Dump fallback: `dump/GameAssembly/Item.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Instancia runtime de um item no inventario/equipamento, usada em callbacks como OnUse e SpecialEffectAction.
---@class Item
```

### `__new`
- Source: `docs.txt:611`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param id GameId
---@param quality number
---@return Item
function Item.__new(id, quality) end
```

### `__new`
- Source: `docs.txt:612`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param id ItemEnum
---@param quality number
---@return Item
function Item.__new(id, quality) end
```

### `AddItemModifier`
- Source: `docs.txt:657`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param itemModifierId GameId
function Item.AddItemModifier(itemModifierId) end
```

### `AddItemModifier`
- Source: `docs.txt:658`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param itemModifier ItemModifier
function Item.AddItemModifier(itemModifier) end
```

### `CallSpecialEffectsAction`
- Source: `docs.txt:641`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value boolean
function Item.CallSpecialEffectsAction(value) end
```

### `CanBeRepaired`
- Source: `docs.txt:642`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return Result
function Item.CanBeRepaired() end
```

### `CanBeUnpacked`
- Source: `docs.txt:622`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function Item.CanBeUnpacked() end
```

### `CanBeUsed`
- Source: `docs.txt:621`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function Item.CanBeUsed() end
```

### `CanGoInto`
- Source: `docs.txt:638`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot ItemSlot
---@return boolean
function Item.CanGoInto(slot) end
```

### `ClearItemModifiers`
- Source: `docs.txt:655`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Item.ClearItemModifiers() end
```

### `Clone`
- Source: `docs.txt:666`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return Item
function Item.Clone() end
```

### `ColorSlotId`
- Source: `docs.txt:631`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param index integer
---@return string
function Item.ColorSlotId(index) end
```

### `CreateDefaultItemForLive2DController`
- Source: `docs.txt:614`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param gameId GameId
---@return Item
function Item.CreateDefaultItemForLive2DController(gameId) end
```

### `CreateRandomItem`
- Source: `docs.txt:613`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param gameId GameId
---@param allowModifiers boolean
---@return Item
function Item.CreateRandomItem(gameId, allowModifiers) end
```

### `Equals_ColorsChangeNotPossible`
- Source: `docs.txt:662`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item2 Item
---@return boolean
function Item.Equals_ColorsChangeNotPossible(item2) end
```

### `Equals_Complex`
- Source: `docs.txt:664`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item2 Item
---@param enforceUniqueId boolean
---@param checkColors boolean
---@return boolean
function Item.Equals_Complex(item2, enforceUniqueId, checkColors) end
```

### `Equals_IdAndColors`
- Source: `docs.txt:661`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item2 Item
---@return boolean
function Item.Equals_IdAndColors(item2) end
```

### `Equals_IdAndEqualsColorsAndQuality`
- Source: `docs.txt:660`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item2 Item
---@return boolean
function Item.Equals_IdAndEqualsColorsAndQuality(item2) end
```

### `Equals_UniqueGuid`
- Source: `docs.txt:663`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item2 Item
---@return boolean
function Item.Equals_UniqueGuid(item2) end
```

### `FillDishData`
- Source: `docs.txt:653`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param dishQuality number
---@param executionItems Item[]
function Item.FillDishData(dishQuality, executionItems) end
```

### `FillUIButtons`
- Source: `docs.txt:667`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param _itemStatsButtonList IModificationPeriodButtonList
---@param itemUIAllowedButtons ItemUIAllowedButtons
function Item.FillUIButtons(_itemStatsButtonList, itemUIAllowedButtons) end
```

### `GetColor`
- Source: `docs.txt:647`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param index integer
---@return Color
function Item.GetColor(index) end
```

### `GetColors`
- Source: `docs.txt:650`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return Color[]
function Item.GetColors() end
```

### `GetCount`
- Source: `docs.txt:624`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Retorna a quantidade empilhada da instancia runtime do item.
---@return integer
function Item.GetCount() end
```

### `GetDescription`
- Source: `docs.txt:619`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function Item.GetDescription() end
```

### `GetDescriptionStringBuilder`
- Source: `docs.txt:618`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param stringBuilder StringBuilder
function Item.GetDescriptionStringBuilder(stringBuilder) end
```

### `GetDishItems`
- Source: `docs.txt:652`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return any[]
function Item.GetDishItems() end
```

### `GetDishQualityDescription`
- Source: `docs.txt:654`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param dishQuality number
---@return string
function Item.GetDishQualityDescription(dishQuality) end
```

### `GetItemPrefab`
- Source: `docs.txt:645`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Retorna o ItemPrefab associado a esta instancia runtime do item.
---@return ItemPrefab
function Item.GetItemPrefab() end
```

### `GetMainColor`
- Source: `docs.txt:651`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return Color
function Item.GetMainColor() end
```

### `GetName`
- Source: `docs.txt:617`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param itemNameInclude ItemNameIncludeEnum
---@return string
function Item.GetName(itemNameInclude) end
```

### `GetNameStringBuilder`
- Source: `docs.txt:616`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param stringBuilder StringBuilder
---@param itemNameInclude ItemNameIncludeEnum
---@return StringBuilder
function Item.GetNameStringBuilder(stringBuilder, itemNameInclude) end
```

### `GetPrice`
- Source: `docs.txt:625`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return integer
function Item.GetPrice() end
```

### `GetQualityDescriptor`
- Source: `docs.txt:629`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param quality number
---@return QualityDescriptor
function Item.GetQualityDescriptor(quality) end
```

### `GetQualityString`
- Source: `docs.txt:627`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function Item.GetQualityString() end
```

### `GetQualityString`
- Source: `docs.txt:628`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param quality number
---@return string
function Item.GetQualityString(quality) end
```

### `GetRawNameSls`
- Source: `docs.txt:615`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return SimpleLocalizedString
function Item.GetRawNameSls() end
```

### `GetSourceOrThisUniqueGuid`
- Source: `docs.txt:635`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return Guid
function Item.GetSourceOrThisUniqueGuid() end
```

### `GetUniqueGuid`
- Source: `docs.txt:634`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Retorna o Guid unico da instancia runtime do item.
---@return Guid
function Item.GetUniqueGuid() end
```

### `GetVanillaItemEnum`
- Source: `docs.txt:630`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return ItemEnum
function Item.GetVanillaItemEnum() end
```

### `HasTag`
- Source: `docs.txt:646`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param tag ItemPrefabTag
---@return boolean
function Item.HasTag(tag) end
```

### `IsEquipped`
- Source: `docs.txt:639`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Retorna se a instancia runtime do item esta equipada.
---@return boolean
function Item.IsEquipped() end
```

### `IsSameSource`
- Source: `docs.txt:637`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param uniqueIdOfOriginal Guid
---@return boolean
function Item.IsSameSource(uniqueIdOfOriginal) end
```

### `IsWronglyEquipped`
- Source: `docs.txt:640`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return boolean
function Item.IsWronglyEquipped() end
```

### `OnAfterDeserialize`
- Source: `docs.txt:633`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Item.OnAfterDeserialize() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:632`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Item.OnBeforeSerialize() end
```

### `PopulateGameStatModifierList`
- Source: `docs.txt:659`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param gameStatModifiers IGameStatModifier[]
function Item.PopulateGameStatModifierList(gameStatModifiers) end
```

### `PriceChangeByRepairAmount`
- Source: `docs.txt:643`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param repairAmount number
---@return number
function Item.PriceChangeByRepairAmount(repairAmount) end
```

### `Repair`
- Source: `docs.txt:644`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param amount number
function Item.Repair(amount) end
```

### `SetColor`
- Source: `docs.txt:648`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param index integer
---@param color Color
function Item.SetColor(index, color) end
```

### `SetColors`
- Source: `docs.txt:649`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param colors Color[]
function Item.SetColors(colors) end
```

### `SetCount`
- Source: `docs.txt:623`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param count integer
---@return boolean
function Item.SetCount(count) end
```

### `SetItemModifiers`
- Source: `docs.txt:656`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param itemModifierIds GameId[]
function Item.SetItemModifiers(itemModifierIds) end
```

### `SetQuality`
- Source: `docs.txt:626`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param quality number
function Item.SetQuality(quality) end
```

### `ToString`
- Source: `docs.txt:620`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return string
function Item.ToString() end
```

### `TryGetSourceUniqueId`
- Source: `docs.txt:636`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param uniqueIdOfOriginal Guid
---@return boolean
function Item.TryGetSourceUniqueId(uniqueIdOfOriginal) end
```

### `UnpackClone`
- Source: `docs.txt:665`, `rawdump/Il2CppGameAssembly/Il2Cpp/Item.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param id GameId
---@return Item
function Item.UnpackClone(id) end
```

## ItemCondition

- Source type: `StoryConditions.ItemCondition`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ItemCondition.cs`
- Dump fallback: `dump/GameAssembly/StoryConditions/ItemCondition.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ItemCondition
```

### `__new`
- Source: `docs.txt:7057`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ItemCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param relatedItem GameId
---@param itemComparisonType ItemComparisonTypeEnum
---@param negate boolean
---@return ItemCondition
function ItemCondition.__new(relatedItem, itemComparisonType, negate) end
```

### `Equals`
- Source: `docs.txt:7060`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ItemCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param other ItemCondition
---@return boolean
function ItemCondition.Equals(other) end
```

### `Equals`
- Source: `docs.txt:7061`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ItemCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function ItemCondition.Equals(obj) end
```

### `Explain`
- Source: `docs.txt:7058`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ItemCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function ItemCondition.Explain() end
```

### `GenerateCode`
- Source: `docs.txt:7059`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ItemCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function ItemCondition.GenerateCode() end
```

### `GetHashCode`
- Source: `docs.txt:7062`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ItemCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function ItemCondition.GetHashCode() end
```

## ItemInSlotCondition

- Source type: `StoryConditions.ItemInSlotCondition`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ItemInSlotCondition.cs`
- Dump fallback: `dump/GameAssembly/StoryConditions/ItemInSlotCondition.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ItemInSlotCondition
```

### `__new`
- Source: `docs.txt:7069`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ItemInSlotCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param negate boolean
---@param slot string
---@return ItemInSlotCondition
function ItemInSlotCondition.__new(negate, slot) end
```

### `Equals`
- Source: `docs.txt:7072`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ItemInSlotCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param other ItemInSlotCondition
---@return boolean
function ItemInSlotCondition.Equals(other) end
```

### `Equals`
- Source: `docs.txt:7073`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ItemInSlotCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function ItemInSlotCondition.Equals(obj) end
```

### `Explain`
- Source: `docs.txt:7070`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ItemInSlotCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function ItemInSlotCondition.Explain() end
```

### `GenerateCode`
- Source: `docs.txt:7071`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ItemInSlotCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function ItemInSlotCondition.GenerateCode() end
```

### `GetHashCode`
- Source: `docs.txt:7074`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/ItemInSlotCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function ItemInSlotCondition.GetHashCode() end
```

## ItemManager

- Source type: `Item+ItemManager`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ItemManager
```

### `__new`
- Source: `docs.txt:512`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemManager
function ItemManager.__new() end
```

### `add_OnEquippedItemsModified`
- Source: `docs.txt:554`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value fun()
function ItemManager.add_OnEquippedItemsModified(value) end
```

### `add_OnItemEquipped`
- Source: `docs.txt:542`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value fun(arg1: string, arg2: Item)
function ItemManager.add_OnItemEquipped(value) end
```

### `add_OnItemsModified`
- Source: `docs.txt:552`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value fun()
function ItemManager.add_OnItemsModified(value) end
```

### `add_OnItemUnequipped`
- Source: `docs.txt:544`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value fun(arg1: string, arg2: Item)
function ItemManager.add_OnItemUnequipped(value) end
```

### `AddClothierOrder`
- Source: `docs.txt:589`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param itemOrder ItemOrder
function ItemManager.AddClothierOrder(itemOrder) end
```

### `AddEquipmentSet`
- Source: `docs.txt:584`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param newSet EquipmentSet
function ItemManager.AddEquipmentSet(newSet) end
```

### `AddItem`
- Source: `docs.txt:548`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param itemLocationEnum ItemLocationEnum
function ItemManager.AddItem(item, itemLocationEnum) end
```

### `AllEquippedItems`
- Source: `docs.txt:520`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return any[]
function ItemManager.AllEquippedItems() end
```

### `AllEquippedItemsDictionary`
- Source: `docs.txt:519`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return table<any, any>
function ItemManager.AllEquippedItemsDictionary() end
```

### `AllEquippedItemsInEquipmentOrder`
- Source: `docs.txt:521`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return any[]
function ItemManager.AllEquippedItemsInEquipmentOrder() end
```

### `AllItemRequiredSlotsEquipped`
- Source: `docs.txt:529`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param slot string
---@return boolean
function ItemManager.AllItemRequiredSlotsEquipped(item, slot) end
```

### `AllItemsEnumerable`
- Source: `docs.txt:579`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return any[]
function ItemManager.AllItemsEnumerable() end
```

### `AllItemsReadonlyCollection`
- Source: `docs.txt:578`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return any[]
function ItemManager.AllItemsReadonlyCollection() end
```

### `AppendItemsByGameId`
- Source: `docs.txt:565`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param gameId GameId
---@param items Item[]
---@return boolean
function ItemManager.AppendItemsByGameId(gameId, items) end
```

### `BorrowItemFromShop`
- Source: `docs.txt:558`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param shopItem ShopItem
function ItemManager.BorrowItemFromShop(shopItem) end
```

### `BotEquippedItems`
- Source: `docs.txt:522`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return any[]
function ItemManager.BotEquippedItems() end
```

### `CalculateStreamingBonus`
- Source: `docs.txt:577`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return number
function ItemManager.CalculateStreamingBonus() end
```

### `ConsumeItem`
- Source: `docs.txt:516`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param count integer
---@return boolean
function ItemManager.ConsumeItem(item, count) end
```

### `ConsumeItem`
- Source: `docs.txt:517`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param count integer
---@param outCopy Item
---@return boolean
function ItemManager.ConsumeItem(item, count, outCopy) end
```

### `CreateInstance`
- Source: `docs.txt:513`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemManager
function ItemManager.CreateInstance() end
```

### `DelayCallbacks`
- Source: `docs.txt:556`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param source string
---@return DelayItemManagerCallback
function ItemManager.DelayCallbacks(source) end
```

### `DeleteSlot`
- Source: `docs.txt:593`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot string
function ItemManager.DeleteSlot(slot) end
```

### `Equip`
- Source: `docs.txt:531`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param forceRemoveForbidden boolean
---@return EquipResults
function ItemManager.Equip(item, forceRemoveForbidden) end
```

### `Equip`
- Source: `docs.txt:532`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param newItem Item
---@param slotId string
---@param forceRemoveForbidden boolean
---@return EquipResults
function ItemManager.Equip(newItem, slotId, forceRemoveForbidden) end
```

### `Equip`
- Source: `docs.txt:533`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param newItem Item
---@param slot ItemSlot
---@param forceRemoveForbidden boolean
---@param infoStringBuilder StringBuilder
---@return EquipResults
function ItemManager.Equip(newItem, slot, forceRemoveForbidden, infoStringBuilder) end
```

### `FinishCurrentNunRepairOrder`
- Source: `docs.txt:587`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return Result
function ItemManager.FinishCurrentNunRepairOrder() end
```

### `FirstItemAtSlotHasTag`
- Source: `docs.txt:528`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot string
---@param tag ItemPrefabTag
---@return boolean
function ItemManager.FirstItemAtSlotHasTag(slot, tag) end
```

### `GetAllFishes`
- Source: `docs.txt:576`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return any[]
function ItemManager.GetAllFishes() end
```

### `GetAllItemsAtSlot`
- Source: `docs.txt:580`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot ItemSlot
---@param slotItems Item[]
---@return any[]
function ItemManager.GetAllItemsAtSlot(slot, slotItems) end
```

### `GetAllPairedItems`
- Source: `docs.txt:582`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param groups ItemPairContainer[]
---@return any[]
function ItemManager.GetAllPairedItems(groups) end
```

### `GetAllPairsAtSlots`
- Source: `docs.txt:581`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot1 ItemSlot
---@param slot2 ItemSlot
---@param slotItems Item[]
---@return any[]
function ItemManager.GetAllPairsAtSlots(slot1, slot2, slotItems) end
```

### `GetAllRepairableItems`
- Source: `docs.txt:575`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return any[]
function ItemManager.GetAllRepairableItems() end
```

### `GetFirstItemAtSlot`
- Source: `docs.txt:527`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot string
---@return Item
function ItemManager.GetFirstItemAtSlot(slot) end
```

### `GetItemCount`
- Source: `docs.txt:570`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param gameId GameId
---@return integer
function ItemManager.GetItemCount(gameId) end
```

### `GetItemsThatRequireThisEquipped`
- Source: `docs.txt:530`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param itemToRemove Item
---@return any[]
function ItemManager.GetItemsThatRequireThisEquipped(itemToRemove) end
```

### `HasAnyMerch`
- Source: `docs.txt:573`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param partnerId string
---@return boolean
function ItemManager.HasAnyMerch(partnerId) end
```

### `HasItem`
- Source: `docs.txt:568`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param gameId GameId
---@return boolean
function ItemManager.HasItem(gameId) end
```

### `HasItem`
- Source: `docs.txt:569`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param predicate fun(arg1: Item): boolean
---@return boolean
function ItemManager.HasItem(predicate) end
```

### `HasItemAtSlot`
- Source: `docs.txt:526`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot ItemSlot
---@return boolean
function ItemManager.HasItemAtSlot(slot) end
```

### `InventoryDebugStrings`
- Source: `docs.txt:518`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return any[]
function ItemManager.InventoryDebugStrings() end
```

### `IsEquipped`
- Source: `docs.txt:566`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param item ItemEnum
---@return boolean
function ItemManager.IsEquipped(item) end
```

### `IsEquipped`
- Source: `docs.txt:567`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param gameId GameId
---@return boolean
function ItemManager.IsEquipped(gameId) end
```

### `IsEquippedComplex`
- Source: `docs.txt:571`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param enforceUniqueId boolean
---@param checkColors boolean
---@return boolean
function ItemManager.IsEquippedComplex(item, enforceUniqueId, checkColors) end
```

### `IsEquippedMerch`
- Source: `docs.txt:572`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param partnerId string
---@return boolean
function ItemManager.IsEquippedMerch(partnerId) end
```

### `MakeNunRepairOrder`
- Source: `docs.txt:588`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
function ItemManager.MakeNunRepairOrder(item) end
```

### `MerchCount`
- Source: `docs.txt:574`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param partnerId string
---@return integer
function ItemManager.MerchCount(partnerId) end
```

### `MoveBotEquippedToCarried`
- Source: `docs.txt:560`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ItemManager.MoveBotEquippedToCarried() end
```

### `MoveCarriedToHome`
- Source: `docs.txt:559`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ItemManager.MoveCarriedToHome() end
```

### `MoveItemToOtherItemsPosition`
- Source: `docs.txt:551`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param target Item
---@param source Item
---@return boolean
function ItemManager.MoveItemToOtherItemsPosition(target, source) end
```

### `OnAfterDeserialize`
- Source: `docs.txt:592`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ItemManager.OnAfterDeserialize() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:591`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ItemManager.OnBeforeSerialize() end
```

### `ReloadTexturesInAllEquippedItems`
- Source: `docs.txt:546`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param logSb StringBuilder
function ItemManager.ReloadTexturesInAllEquippedItems(logSb) end
```

### `remove_OnEquippedItemsModified`
- Source: `docs.txt:555`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value fun()
function ItemManager.remove_OnEquippedItemsModified(value) end
```

### `remove_OnItemEquipped`
- Source: `docs.txt:543`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value fun(arg1: string, arg2: Item)
function ItemManager.remove_OnItemEquipped(value) end
```

### `remove_OnItemsModified`
- Source: `docs.txt:553`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value fun()
function ItemManager.remove_OnItemsModified(value) end
```

### `remove_OnItemUnequipped`
- Source: `docs.txt:545`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value fun(arg1: string, arg2: Item)
function ItemManager.remove_OnItemUnequipped(value) end
```

### `RemoveEquipmentSet`
- Source: `docs.txt:585`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param value EquipmentSet
function ItemManager.RemoveEquipmentSet(value) end
```

### `RemoveItem`
- Source: `docs.txt:549`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
function ItemManager.RemoveItem(item) end
```

### `RemoveItemAt`
- Source: `docs.txt:550`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param index integer
---@param item Item
function ItemManager.RemoveItemAt(index, item) end
```

### `RemoveOrder`
- Source: `docs.txt:590`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param itemOrder ItemOrder
function ItemManager.RemoveOrder(itemOrder) end
```

### `ReportChangeInItemData`
- Source: `docs.txt:557`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
function ItemManager.ReportChangeInItemData(item) end
```

### `ReturnAllBorrowedItems`
- Source: `docs.txt:561`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param shopId string
---@return integer
function ItemManager.ReturnAllBorrowedItems(shopId) end
```

### `ReturnItemToShop`
- Source: `docs.txt:562`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param shopId string
---@param itemToReturn Item
function ItemManager.ReturnItemToShop(shopId, itemToReturn) end
```

### `ToggleSpecialEffects`
- Source: `docs.txt:547`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value boolean
function ItemManager.ToggleSpecialEffects(value) end
```

### `TryEquippingARandomItemAtSlot`
- Source: `docs.txt:563`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot ItemSlot
---@return boolean
function ItemManager.TryEquippingARandomItemAtSlot(slot) end
```

### `TryFindBestItemForSlot`
- Source: `docs.txt:583`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot ItemSlot
---@param bestItem Item
---@return boolean
function ItemManager.TryFindBestItemForSlot(slot, bestItem) end
```

### `TryGetCurrentNunRepairOrder`
- Source: `docs.txt:586`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param itemRepairOrder ItemRepairOrder
---@return boolean
function ItemManager.TryGetCurrentNunRepairOrder(itemRepairOrder) end
```

### `TryGetItemAtSlot`
- Source: `docs.txt:525`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot ItemSlot
---@param item Item
---@return boolean
function ItemManager.TryGetItemAtSlot(slot, item) end
```

### `TryGetItemsAtSlot`
- Source: `docs.txt:523`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot string
---@param _items Item[]
---@return boolean
function ItemManager.TryGetItemsAtSlot(slot, _items) end
```

### `TryGetItemsAtSlot`
- Source: `docs.txt:524`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot ItemSlot
---@param _items Item[]
---@return boolean
function ItemManager.TryGetItemsAtSlot(slot, _items) end
```

### `TryGetItemsByGameId`
- Source: `docs.txt:564`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param gameId GameId
---@param gameIdItems Item[]
---@return boolean
function ItemManager.TryGetItemsByGameId(gameId, gameIdItems) end
```

### `UnequipAllBotClothes`
- Source: `docs.txt:534`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ItemManager.UnequipAllBotClothes() end
```

### `UnequipAllBotItems`
- Source: `docs.txt:539`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ItemManager.UnequipAllBotItems() end
```

### `UnequipAllByPredicate`
- Source: `docs.txt:540`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param predicate fun(arg1: Item): boolean
function ItemManager.UnequipAllByPredicate(predicate) end
```

### `UnequipAllItemsAtSlotWithDependencies`
- Source: `docs.txt:537`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot string
function ItemManager.UnequipAllItemsAtSlotWithDependencies(slot) end
```

### `UnequipItem`
- Source: `docs.txt:538`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot string
---@param withDependencies boolean
---@return Result
function ItemManager.UnequipItem(slot, withDependencies) end
```

### `UnequipItemDescription`
- Source: `docs.txt:541`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param withDependencies boolean
---@return Result
function ItemManager.UnequipItemDescription(item, withDependencies) end
```

### `UnequipItemWithDependencies`
- Source: `docs.txt:535`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot string
function ItemManager.UnequipItemWithDependencies(slot) end
```

### `UnequipItemWithDependencies`
- Source: `docs.txt:536`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
function ItemManager.UnequipItemWithDependencies(item) end
```

### `UnpackItem`
- Source: `docs.txt:514`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@return Item[]
function ItemManager.UnpackItem(item) end
```

### `UseItem`
- Source: `docs.txt:515`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
function ItemManager.UseItem(item) end
```

## ItemModifiableVariable

- Source type: `ItemModifiableVariable`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariable.cs`
- Dump fallback: `dump/GameAssembly/ItemModifiableVariable.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ItemModifiableVariable
```

### `Clone`
- Source: `docs.txt:1517`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariable.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemModifiableVariable
function ItemModifiableVariable.Clone() end
```

### `GetLocalizedDescription`
- Source: `docs.txt:1516`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariable.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@param stringBuilder StringBuilder
function ItemModifiableVariable.GetLocalizedDescription(item, stringBuilder) end
```

### `GetLocalizedName`
- Source: `docs.txt:1514`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariable.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function ItemModifiableVariable.GetLocalizedName() end
```

### `ToLuaString`
- Source: `docs.txt:1515`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariable.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ItemModifiableVariable.ToLuaString() end
```

## ItemModifiableVariableFactory

- Source type: `ItemModifiableVariableFactory`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableFactory.cs`
- Dump fallback: `dump/GameAssembly/ItemModifiableVariableFactory.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Factory de variaveis modificaveis associadas a itens e condicoes de elementos visuais.
---@class ItemModifiableVariableFactory
```

### `__new`
- Source: `docs.txt:1508`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableFactory.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemModifiableVariableFactory
function ItemModifiableVariableFactory.__new() end
```

### `CreateInstanceBoolBackedVariable`
- Source: `docs.txt:1509`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableFactory.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Cria instance booleana backed variavel e retorna ItemModifiableVariableIntBackedBool.
---@param variableName string
---@param localizedString SimpleLocalizedString
---@param defaultValue boolean
---@return ItemModifiableVariableIntBackedBool
function ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(variableName, localizedString, defaultValue) end
```

### `CreateInstanceFloatVariable`
- Source: `docs.txt:1510`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableFactory.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Cria instance float variavel e retorna ItemModifiableVariableFloat01Percent.
---@param variableName string
---@param localizedString SimpleLocalizedString
---@param defaultValue number
---@return ItemModifiableVariableFloat01Percent
function ItemModifiableVariableFactory.CreateInstanceFloatVariable(variableName, localizedString, defaultValue) end
```

## ItemModifiableVariableFloat01Percent

- Source type: `ItemModifiableVariableFloat01Percent`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableFloat01Percent.cs`
- Dump fallback: `dump/GameAssembly/ItemModifiableVariableFloat01Percent.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ItemModifiableVariableFloat01Percent
```

### `__new`
- Source: `docs.txt:1540`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableFloat01Percent.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param varId string
---@param nameSls SimpleLocalizedString
---@param defaultValue number
---@return ItemModifiableVariableFloat01Percent
function ItemModifiableVariableFloat01Percent.__new(varId, nameSls, defaultValue) end
```

### `Clone`
- Source: `docs.txt:1545`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableFloat01Percent.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemModifiableVariable
function ItemModifiableVariableFloat01Percent.Clone() end
```

### `GetLocalizedDescription`
- Source: `docs.txt:1544`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableFloat01Percent.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@param stringBuilder StringBuilder
function ItemModifiableVariableFloat01Percent.GetLocalizedDescription(item, stringBuilder) end
```

### `GetValue`
- Source: `docs.txt:1542`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableFloat01Percent.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@return number
function ItemModifiableVariableFloat01Percent.GetValue(item) end
```

### `SetValue`
- Source: `docs.txt:1543`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableFloat01Percent.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@param value number
function ItemModifiableVariableFloat01Percent.SetValue(item, value) end
```

### `ToLuaString`
- Source: `docs.txt:1541`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableFloat01Percent.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ItemModifiableVariableFloat01Percent.ToLuaString() end
```

## ItemModifiableVariableIntBackedBool

- Source type: `ItemModifiableVariableIntBackedBool`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableIntBackedBool.cs`
- Dump fallback: `dump/GameAssembly/ItemModifiableVariableIntBackedBool.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ItemModifiableVariableIntBackedBool
```

### `__new`
- Source: `docs.txt:1523`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableIntBackedBool.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param varId string
---@param nameSls SimpleLocalizedString
---@param defaultValue boolean
---@return ItemModifiableVariableIntBackedBool
function ItemModifiableVariableIntBackedBool.__new(varId, nameSls, defaultValue) end
```

### `Clone`
- Source: `docs.txt:1528`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableIntBackedBool.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemModifiableVariable
function ItemModifiableVariableIntBackedBool.Clone() end
```

### `GetLocalizedDescription`
- Source: `docs.txt:1527`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableIntBackedBool.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@param stringBuilder StringBuilder
function ItemModifiableVariableIntBackedBool.GetLocalizedDescription(item, stringBuilder) end
```

### `GetValue`
- Source: `docs.txt:1525`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableIntBackedBool.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@return boolean
function ItemModifiableVariableIntBackedBool.GetValue(item) end
```

### `SetValueRaw`
- Source: `docs.txt:1526`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableIntBackedBool.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@param value boolean
function ItemModifiableVariableIntBackedBool.SetValueRaw(item, value) end
```

### `ToLuaString`
- Source: `docs.txt:1524`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariableIntBackedBool.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ItemModifiableVariableIntBackedBool.ToLuaString() end
```

## ItemModifiableVariablesRequirement

- Source type: `ItemModifiableVariablesRequirement`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariablesRequirement.cs`
- Dump fallback: `dump/GameAssembly/ItemModifiableVariablesRequirement.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ItemModifiableVariablesRequirement
```

### `Clone`
- Source: `docs.txt:1556`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariablesRequirement.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemModifiableVariablesRequirement
function ItemModifiableVariablesRequirement.Clone() end
```

### `Enforce`
- Source: `docs.txt:1553`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariablesRequirement.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param itemPrefab ItemPrefab
---@param lastModified integer
function ItemModifiableVariablesRequirement.Enforce(item, itemPrefab, lastModified) end
```

### `IsBoolChangeAllowed`
- Source: `docs.txt:1554`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariablesRequirement.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@param itemPrefab ItemPrefab
---@param modifiableVariableIndex integer
---@param newValue boolean
---@return boolean
function ItemModifiableVariablesRequirement.IsBoolChangeAllowed(item, itemPrefab, modifiableVariableIndex, newValue) end
```

### `ToLuaString`
- Source: `docs.txt:1555`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemModifiableVariablesRequirement.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ItemModifiableVariablesRequirement.ToLuaString() end
```

## ItemPairContainer

- Source type: `Item+ItemManager+ItemPairContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ItemPairContainer
```

### `__new`
- Source: `docs.txt:500`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemPairContainer
function ItemPairContainer.__new() end
```

### `Dispose`
- Source: `docs.txt:504`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ItemPairContainer.Dispose() end
```

### `GetRandomPair`
- Source: `docs.txt:502`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ValueTuple
function ItemPairContainer.GetRandomPair() end
```

### `Prepare`
- Source: `docs.txt:503`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
function ItemPairContainer.Prepare() end
```

### `ToString`
- Source: `docs.txt:505`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ItemPairContainer.ToString() end
```

### `TryGetRandomPairMatchColor`
- Source: `docs.txt:501`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param i1 Item
---@param i2 Item
---@return boolean
function ItemPairContainer.TryGetRandomPairMatchColor(i1, i2) end
```

## ItemPrefab

- Source type: `ItemPrefab`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Dump fallback: `dump/GameAssembly/ItemPrefab.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Modelo configuravel de item antes/depois do registro no jogo; scripts normalmente preenchem campos, anexam texturas/dados opcionais e registram o item via ModUtilities.
---@class ItemPrefab
```

### `__new`
- Source: `docs.txt:745`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@param description string
---@param possibleSlot ItemSlot
---@param price integer
---@param onUse fun(arg1: Item): boolean
---@return ItemPrefab
function ItemPrefab.__new(name, description, possibleSlot, price, onUse) end
```

### `AddAtLeastOneEnabledAllModifiableVariablesRequirement`
- Source: `docs.txt:804`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Adiciona requisito para que pelo menos uma variavel modificavel do item esteja habilitada.
---@return ItemPrefab
function ItemPrefab.AddAtLeastOneEnabledAllModifiableVariablesRequirement() end
```

### `AddAtLeastOneEnabledModifiableVariablesRequirement`
- Source: `docs.txt:807`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Adiciona requisito para que pelo menos uma das variaveis modificaveis indicadas esteja habilitada.
---@param indices integer[]
---@return ItemPrefab
function ItemPrefab.AddAtLeastOneEnabledModifiableVariablesRequirement(indices) end
```

### `AddBoolModifiableVariable`
- Source: `docs.txt:802`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Adiciona uma variavel modificavel booleana ao prefab.
---@param Id string
---@param simpleLocalizedString SimpleLocalizedString
---@param defaultValue boolean
---@return ItemPrefab
function ItemPrefab.AddBoolModifiableVariable(Id, simpleLocalizedString, defaultValue) end
```

### `AddHoodieLogoTexture`
- Source: `docs.txt:771`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Adiciona uma textura de logo modificavel para hoodie/roupa compativel.
---@param textureReference IReference
---@param colorIndex integer
---@param layer integer
---@return ItemPrefab
function ItemPrefab.AddHoodieLogoTexture(textureReference, colorIndex, layer) end
```

### `AddItemModifiableVariablesRequirement`
- Source: `docs.txt:803`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Adiciona um requisito baseado nas variaveis modificaveis do item.
---@param itemModifiableVariablesRequirement ItemModifiableVariablesRequirement
---@return ItemPrefab
function ItemPrefab.AddItemModifiableVariablesRequirement(itemModifiableVariablesRequirement) end
```

### `AddModdableLogos`
- Source: `docs.txt:769`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Adiciona configuracoes de logos modificaveis ao prefab.
---@param drawables table[]
---@param spriteReference IReference
---@param colorIndex integer
---@param layer integer
---@return ItemPrefab
function ItemPrefab.AddModdableLogos(drawables, spriteReference, colorIndex, layer) end
```

### `AddOnlyOneEnabledAllModifiableVariablesRequirement`
- Source: `docs.txt:805`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return ItemPrefab
function ItemPrefab.AddOnlyOneEnabledAllModifiableVariablesRequirement() end
```

### `AddOnlyOneEnabledModifiableVariablesRequirement`
- Source: `docs.txt:806`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param indices integer[]
---@return ItemPrefab
function ItemPrefab.AddOnlyOneEnabledModifiableVariablesRequirement(indices) end
```

### `AddPantiesLogoTexture`
- Source: `docs.txt:770`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param textureReference IReference
---@param colorIndex integer
---@param layer integer
---@return ItemPrefab
function ItemPrefab.AddPantiesLogoTexture(textureReference, colorIndex, layer) end
```

### `AddRequiredSlot`
- Source: `docs.txt:788`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param slot string
---@return ItemPrefab
function ItemPrefab.AddRequiredSlot(slot) end
```

### `AddRequiredSlot`
- Source: `docs.txt:789`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param slot ItemSlot
---@return ItemPrefab
function ItemPrefab.AddRequiredSlot(slot) end
```

### `AddShirtLogoTextureAll`
- Source: `docs.txt:772`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param textureReference IReference
---@param colorIndex integer
---@param layer integer
---@return ItemPrefab
function ItemPrefab.AddShirtLogoTextureAll(textureReference, colorIndex, layer) end
```

### `AddShirtLogoTextureAllMirroredSleeve`
- Source: `docs.txt:773`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param textureReference IReference
---@param colorIndex integer
---@param layer integer
---@return ItemPrefab
function ItemPrefab.AddShirtLogoTextureAllMirroredSleeve(textureReference, colorIndex, layer) end
```

### `AddShirtLogoTextureMainOnly`
- Source: `docs.txt:774`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param textureReference IReference
---@param colorIndex integer
---@param layer integer
---@return ItemPrefab
function ItemPrefab.AddShirtLogoTextureMainOnly(textureReference, colorIndex, layer) end
```

### `AddShirtLogoTextureSleeveOnly`
- Source: `docs.txt:775`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param textureReference IReference
---@param colorIndex integer
---@param layer integer
---@return ItemPrefab
function ItemPrefab.AddShirtLogoTextureSleeveOnly(textureReference, colorIndex, layer) end
```

### `AddSusModifier`
- Source: `docs.txt:765`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param area SusArea
---@param cover number
---@return ItemPrefab
function ItemPrefab.AddSusModifier(area, cover) end
```

### `AddTexture`
- Source: `docs.txt:766`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Anexa uma textura empacotada ao prefab, opcionalmente limitada a um controller/cena.
---@param holder SpecialTextureHolder
---@return ItemPrefab
function ItemPrefab.AddTexture(holder) end
```

### `AddTexture`
- Source: `docs.txt:767`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Anexa uma textura empacotada ao prefab, opcionalmente limitada a um controller/cena.
---@param target ControllerEnum
---@param packed PackedTexturesContainer
---@return ItemPrefab
function ItemPrefab.AddTexture(target, packed) end
```

### `AddTexture`
- Source: `docs.txt:768`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Anexa uma textura empacotada ao prefab, opcionalmente limitada a um controller/cena.
---@param packed PackedTexturesContainer
---@return ItemPrefab
function ItemPrefab.AddTexture(packed) end
```

### `BoolModifiableVariableChangeAllowed`
- Source: `docs.txt:748`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param variableIndex integer
---@param newValue boolean
---@return boolean
function ItemPrefab.BoolModifiableVariableChangeAllowed(item, variableIndex, newValue) end
```

### `CanGoInto`
- Source: `docs.txt:755`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot string
---@return boolean
function ItemPrefab.CanGoInto(slot) end
```

### `CanGoInto`
- Source: `docs.txt:756`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot ItemSlot
---@return boolean
function ItemPrefab.CanGoInto(slot) end
```

### `ChangeNameDescriptionAndPrice`
- Source: `docs.txt:758`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@param description string
---@param price integer
---@return ItemPrefab
function ItemPrefab.ChangeNameDescriptionAndPrice(name, description, price) end
```

### `Clone`
- Source: `docs.txt:750`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemPrefab
function ItemPrefab.Clone() end
```

### `CloneWithTextures`
- Source: `docs.txt:751`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param allControllers ModCreationLive2DControllersContainer
---@return ItemPrefab
function ItemPrefab.CloneWithTextures(allControllers) end
```

### `CreateDefault`
- Source: `docs.txt:746`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param slot ItemSlot
---@param defaultColors Color[]
---@return ItemPrefab
function ItemPrefab.CreateDefault(slot, defaultColors) end
```

### `GetForbiddenSlotCount`
- Source: `docs.txt:799`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param equippedSlot string
---@return integer
function ItemPrefab.GetForbiddenSlotCount(equippedSlot) end
```

### `GetForbiddenSlots`
- Source: `docs.txt:798`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param equippedSlot string
---@return any[]
function ItemPrefab.GetForbiddenSlots(equippedSlot) end
```

### `GetIcon`
- Source: `docs.txt:813`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return Sprite
function ItemPrefab.GetIcon() end
```

### `GetRequiredSlotCount`
- Source: `docs.txt:797`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param equippedSlot string
---@return integer
function ItemPrefab.GetRequiredSlotCount(equippedSlot) end
```

### `GetRequiredSlots`
- Source: `docs.txt:796`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param equippedSlot string
---@return any[]
function ItemPrefab.GetRequiredSlots(equippedSlot) end
```

### `HasAtLeastOneBoolVariableTrueRequirement`
- Source: `docs.txt:808`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return boolean
function ItemPrefab.HasAtLeastOneBoolVariableTrueRequirement() end
```

### `HasTag`
- Source: `docs.txt:757`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param tag ItemPrefabTag
---@return boolean
function ItemPrefab.HasTag(tag) end
```

### `IsEquipable`
- Source: `docs.txt:747`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param slotEquipData SlotEquipData
---@return boolean
function ItemPrefab.IsEquipable(slotEquipData) end
```

### `IsMadeByPartner`
- Source: `docs.txt:754`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param partnerId string
---@return boolean
function ItemPrefab.IsMadeByPartner(partnerId) end
```

### `MakeHoodieMerch`
- Source: `docs.txt:787`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param partnerId string
---@param forcedLogo IReference
---@param forcedBrandColorsSet BrandColorsSet
---@param name string
---@param description string
---@return ItemPrefab
function ItemPrefab.MakeHoodieMerch(partnerId, forcedLogo, forcedBrandColorsSet, name, description) end
```

### `MakeHypercamo`
- Source: `docs.txt:793`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return ItemPrefab
function ItemPrefab.MakeHypercamo() end
```

### `MakePair`
- Source: `docs.txt:762`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Marca dois itens como par/conjunto relacionado.
---@param i1 GameId
---@param i2 GameId
---@return ItemPrefab
function ItemPrefab.MakePair(i1, i2) end
```

### `MakePair`
- Source: `docs.txt:763`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Marca dois itens como par/conjunto relacionado.
---@param i1 GameId
---@param i2 GameId
---@param registerAsMatching boolean
---@return ItemPrefab
function ItemPrefab.MakePair(i1, i2, registerAsMatching) end
```

### `MakeSet`
- Source: `docs.txt:764`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Marca ou cria associacao de conjunto entre itens relacionados.
---@param id GameId[]
---@return ItemPrefab
function ItemPrefab.MakeSet(id) end
```

### `MakeShirtMerch`
- Source: `docs.txt:786`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param partnerId string
---@param forcedLogo IReference
---@param forcedBrandColorsSet BrandColorsSet
---@param name string
---@param description string
---@return ItemPrefab
function ItemPrefab.MakeShirtMerch(partnerId, forcedLogo, forcedBrandColorsSet, name, description) end
```

### `ReloadTextures`
- Source: `docs.txt:814`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param logSb StringBuilder
function ItemPrefab.ReloadTextures(logSb) end
```

### `SetBoolModifiableVariableRespectRequirements`
- Source: `docs.txt:749`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@param variable ItemModifiableVariableIntBackedBool
---@param newValue boolean
---@return boolean
function ItemPrefab.SetBoolModifiableVariableRespectRequirements(item, variable, newValue) end
```

### `SetBrandColor`
- Source: `docs.txt:779`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@param colorSet BrandColorsSet
function ItemPrefab.SetBrandColor(item, colorSet) end
```

### `SetBrandColor`
- Source: `docs.txt:780`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
function ItemPrefab.SetBrandColor(item) end
```

### `SetBrandColorSetForcedColor`
- Source: `docs.txt:782`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param forcedBrandColorsSet BrandColorsSet
---@return ItemPrefab
function ItemPrefab.SetBrandColorSetForcedColor(forcedBrandColorsSet) end
```

### `SetControllerElementOverride`
- Source: `docs.txt:800`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param element string[]
---@return ItemPrefab
function ItemPrefab.SetControllerElementOverride(element) end
```

### `SetCustomShader`
- Source: `docs.txt:790`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param shader IReference
---@param customShaderPostProcessing fun(arg1: Material, arg2: any[])
---@param customShaderType CustomShaderTypeEnum
---@return ItemPrefab
function ItemPrefab.SetCustomShader(shader, customShaderPostProcessing, customShaderType) end
```

### `SetDefaultColorSlots`
- Source: `docs.txt:759`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param colorSlots string[]
---@param palette ColorPalette
---@return ItemPrefab
function ItemPrefab.SetDefaultColorSlots(colorSlots, palette) end
```

### `SetDefaultColorSlots`
- Source: `docs.txt:760`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param count integer
---@param palette ColorPalette
---@return ItemPrefab
function ItemPrefab.SetDefaultColorSlots(count, palette) end
```

### `SetDefaultColorSlots`
- Source: `docs.txt:761`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param colorSlots ColorSlot[]
---@return ItemPrefab
function ItemPrefab.SetDefaultColorSlots(colorSlots) end
```

### `SetElementAtIndexCondition`
- Source: `docs.txt:809`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param index integer
---@param condition ItemScopeCondition
---@return ItemPrefab
function ItemPrefab.SetElementAtIndexCondition(index, condition) end
```

### `SetElementAtIndexConditionBoolModifiableVariable`
- Source: `docs.txt:811`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param index integer
---@param variableId string
---@param variableSls SimpleLocalizedString
---@param defaultValue boolean
---@return ItemPrefab
function ItemPrefab.SetElementAtIndexConditionBoolModifiableVariable(index, variableId, variableSls, defaultValue) end
```

### `SetMovingTextureShader`
- Source: `docs.txt:795`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param textureReference IReference
---@param shaderType CustomShaderTypeEnum
---@return ItemPrefab
function ItemPrefab.SetMovingTextureShader(textureReference, shaderType) end
```

### `SetNotExpectedInShop`
- Source: `docs.txt:784`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return ItemPrefab
function ItemPrefab.SetNotExpectedInShop() end
```

### `SetPartnerBrandColorForcedColor`
- Source: `docs.txt:781`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return ItemPrefab
function ItemPrefab.SetPartnerBrandColorForcedColor() end
```

### `SetPartnerId`
- Source: `docs.txt:785`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param partnerId string
---@return ItemPrefab
function ItemPrefab.SetPartnerId(partnerId) end
```

### `SetRainbowShader`
- Source: `docs.txt:791`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param customShaderType CustomShaderTypeEnum
---@return ItemPrefab
function ItemPrefab.SetRainbowShader(customShaderType) end
```

### `SetRandomItemForcedColor`
- Source: `docs.txt:777`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param randomItemColors Color[]
---@return ItemPrefab
function ItemPrefab.SetRandomItemForcedColor(randomItemColors) end
```

### `SetRandomItemForcedColor`
- Source: `docs.txt:778`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param randomItemColors Color[]
---@return ItemPrefab
function ItemPrefab.SetRandomItemForcedColor(randomItemColors) end
```

### `SetRandomItemPostProcessing`
- Source: `docs.txt:776`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param randomItemPostprocessing fun(arg1: Item)
---@return ItemPrefab
function ItemPrefab.SetRandomItemPostProcessing(randomItemPostprocessing) end
```

### `SetRayMarchingShader`
- Source: `docs.txt:792`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param customShaderType CustomShaderTypeEnum
---@return ItemPrefab
function ItemPrefab.SetRayMarchingShader(customShaderType) end
```

### `SetShillingLinkId`
- Source: `docs.txt:783`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param linkId string
---@return ItemPrefab
function ItemPrefab.SetShillingLinkId(linkId) end
```

### `SetSlotAndOverride`
- Source: `docs.txt:801`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param slot ItemSlot
---@param element string[]
---@return ItemPrefab
function ItemPrefab.SetSlotAndOverride(slot, element) end
```

### `SetTextureAtIndexCondition`
- Source: `docs.txt:810`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param index integer
---@param condition ItemScopeCondition
---@return ItemPrefab
function ItemPrefab.SetTextureAtIndexCondition(index, condition) end
```

### `SetTextureAtIndexConditionBoolModifiableVariable`
- Source: `docs.txt:812`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param index integer
---@param variableId string
---@param variableSls SimpleLocalizedString
---@param defaultValue boolean
---@return ItemPrefab
function ItemPrefab.SetTextureAtIndexConditionBoolModifiableVariable(index, variableId, variableSls, defaultValue) end
```

### `ToLua`
- Source: `docs.txt:753`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param prefabVar string
---@param script StringBuilder
function ItemPrefab.ToLua(prefabVar, script) end
```

### `ToString`
- Source: `docs.txt:752`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return string
function ItemPrefab.ToString() end
```

### `TryGetItemGameId`
- Source: `docs.txt:815`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param gameId GameId
---@return boolean
function ItemPrefab.TryGetItemGameId(gameId) end
```

### `TurnIntoPersonalityModule`
- Source: `docs.txt:794`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemPrefab.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Configura o item registrado como personality module usando uma definicao Lua.
---@param id GameId
---@param personalityDefinition PersonalityModuleDefinition
function ItemPrefab.TurnIntoPersonalityModule(id, personalityDefinition) end
```

## ItemPrefabManager

- Source type: `ItemPrefab+ItemPrefabManager`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ItemPrefabManager
```

### `__new`
- Source: `docs.txt:727`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemPrefabManager
function ItemPrefabManager.__new() end
```

### `AddModItem`
- Source: `docs.txt:735`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param guid Guid
---@param itemPrefab ItemPrefab
---@param id integer
---@return GameId
function ItemPrefabManager.AddModItem(guid, itemPrefab, id) end
```

### `AllPrefabsFromSource`
- Source: `docs.txt:731`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param guid Guid
---@return any[]
function ItemPrefabManager.AllPrefabsFromSource(guid) end
```

### `CreateLocalizationEntries`
- Source: `docs.txt:733`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
function ItemPrefabManager.CreateLocalizationEntries() end
```

### `GetItemById`
- Source: `docs.txt:732`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param itemId GameId
---@return ItemPrefab
function ItemPrefabManager.GetItemById(itemId) end
```

### `GetItemNameSls`
- Source: `docs.txt:734`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@return SimpleLocalizedString
function ItemPrefabManager.GetItemNameSls(item) end
```

### `HasAnyItems`
- Source: `docs.txt:730`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param guid Guid
---@return boolean
function ItemPrefabManager.HasAnyItems(guid) end
```

### `PrepareItems`
- Source: `docs.txt:736`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return UniTask
function ItemPrefabManager.PrepareItems() end
```

### `RegisterItemPair`
- Source: `docs.txt:728`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param gameId1 GameId
---@param gameId2 GameId
function ItemPrefabManager.RegisterItemPair(gameId1, gameId2) end
```

### `TryGetItemPairIndex`
- Source: `docs.txt:729`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param itemPairIndex integer
---@return boolean
function ItemPrefabManager.TryGetItemPairIndex(item, itemPairIndex) end
```

## ItemScopeCondition

- Source type: `ItemConditions.ItemScopeCondition`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeCondition.cs`
- Dump fallback: `dump/GameAssembly/ItemConditions/ItemScopeCondition.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Base de condicoes de escopo de item usadas por requisitos e elementos dependentes de variaveis.
---@class ItemScopeCondition
```

### `Clone`
- Source: `docs.txt:1479`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemScopeCondition
function ItemScopeCondition.Clone() end
```

### `IsActive`
- Source: `docs.txt:1477`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@return boolean
function ItemScopeCondition.IsActive(item) end
```

### `ToLuaString`
- Source: `docs.txt:1478`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ItemScopeCondition.ToLuaString() end
```

## ItemScopeConditionAlwaysTrueCondition

- Source type: `ItemConditions.ItemScopeConditionAlwaysTrueCondition`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionAlwaysTrueCondition.cs`
- Dump fallback: `dump/GameAssembly/ItemConditions/ItemScopeConditionAlwaysTrueCondition.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ItemScopeConditionAlwaysTrueCondition
```

### `__new`
- Source: `docs.txt:1500`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionAlwaysTrueCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemScopeConditionAlwaysTrueCondition
function ItemScopeConditionAlwaysTrueCondition.__new() end
```

### `Clone`
- Source: `docs.txt:1503`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionAlwaysTrueCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemScopeCondition
function ItemScopeConditionAlwaysTrueCondition.Clone() end
```

### `IsActive`
- Source: `docs.txt:1501`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionAlwaysTrueCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@return boolean
function ItemScopeConditionAlwaysTrueCondition.IsActive(item) end
```

### `ToLuaString`
- Source: `docs.txt:1502`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionAlwaysTrueCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ItemScopeConditionAlwaysTrueCondition.ToLuaString() end
```

## ItemScopeConditionCustom

- Source type: `ItemConditions.ItemScopeConditionCustom`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionCustom.cs`
- Dump fallback: `dump/GameAssembly/ItemConditions/ItemScopeConditionCustom.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ItemScopeConditionCustom
```

### `Clone`
- Source: `docs.txt:1486`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionCustom.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemScopeCondition
function ItemScopeConditionCustom.Clone() end
```

### `CreateInstance`
- Source: `docs.txt:1483`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionCustom.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param conditionFunc fun(arg1: Item): boolean
---@return ItemScopeConditionCustom
function ItemScopeConditionCustom.CreateInstance(conditionFunc) end
```

### `IsActive`
- Source: `docs.txt:1484`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionCustom.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@return boolean
function ItemScopeConditionCustom.IsActive(item) end
```

### `ToLuaString`
- Source: `docs.txt:1485`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionCustom.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ItemScopeConditionCustom.ToLuaString() end
```

## ItemScopeConditionSpecialVariable

- Source type: `ItemConditions.ItemScopeConditionSpecialVariable`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionSpecialVariable.cs`
- Dump fallback: `dump/GameAssembly/ItemConditions/ItemScopeConditionSpecialVariable.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Condicao de escopo de item baseada em variavel especial/modificavel.
---@class ItemScopeConditionSpecialVariable
```

### `__new`
- Source: `docs.txt:1491`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionSpecialVariable.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param variableName string
---@return ItemScopeConditionSpecialVariable
function ItemScopeConditionSpecialVariable.__new(variableName) end
```

### `Clone`
- Source: `docs.txt:1495`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionSpecialVariable.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return ItemScopeCondition
function ItemScopeConditionSpecialVariable.Clone() end
```

### `CreateInstance`
- Source: `docs.txt:1492`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionSpecialVariable.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param variableName string
---@return ItemScopeConditionSpecialVariable
function ItemScopeConditionSpecialVariable.CreateInstance(variableName) end
```

### `IsActive`
- Source: `docs.txt:1493`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionSpecialVariable.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@return boolean
function ItemScopeConditionSpecialVariable.IsActive(item) end
```

### `ToLuaString`
- Source: `docs.txt:1494`, `rawdump/Il2CppGameAssembly/Il2CppItemConditions/ItemScopeConditionSpecialVariable.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function ItemScopeConditionSpecialVariable.ToLuaString() end
```

## ItemSlot

- Source type: `ItemSlot`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ItemSlot.cs`
- Dump fallback: `dump/GameAssembly/ItemSlot.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ItemSlot
```

### `AllowMultipleItems`
- Source: `docs.txt:2028`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemSlot.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ItemSlot.AllowMultipleItems() end
```

### `CreateInstance`
- Source: `docs.txt:2025`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemSlot.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param id string
---@param friendlyName SimpleLocalizedString
---@param type SlotType
---@return ItemSlot
function ItemSlot.CreateInstance(id, friendlyName, type) end
```

### `IsBotSlot`
- Source: `docs.txt:2026`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemSlot.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param slotType SlotType
---@return boolean
function ItemSlot.IsBotSlot(slotType) end
```

### `IsBotSlot`
- Source: `docs.txt:2027`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemSlot.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param slot string
---@return boolean
function ItemSlot.IsBotSlot(slot) end
```

### `IsDependantOn`
- Source: `docs.txt:2030`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemSlot.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param slotName string
---@return boolean
function ItemSlot.IsDependantOn(slotName) end
```

### `MakeDependent`
- Source: `docs.txt:2029`, `rawdump/Il2CppGameAssembly/Il2Cpp/ItemSlot.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param on ItemSlot
function ItemSlot.MakeDependent(on) end
```

## ItemWithCurrentData

- Source type: `Live2DController+ItemWithCurrentData`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ItemWithCurrentData
```

### `__new`
- Source: `docs.txt:2711`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@return ItemWithCurrentData
function ItemWithCurrentData.__new(item) end
```

### `Dispose`
- Source: `docs.txt:2713`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ItemWithCurrentData.Dispose() end
```

### `UpdateData`
- Source: `docs.txt:2712`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param controller string
function ItemWithCurrentData.UpdateData(controller) end
```

## JsonNull

- Source type: `MoonSharp.Interpreter.Serialization.Json.JsonNull`
- Rawdump: `rawdump/Il2CppFungus/Il2CppMoonSharp/Interpreter/Serialization/Json/JsonNull.cs`
- Dump fallback: `not found`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class JsonNull
```

### `__new`
- Source: `docs.txt:335`, `rawdump/Il2CppFungus/Il2CppMoonSharp/Interpreter/Serialization/Json/JsonNull.cs`
- Confidence: `low`
- Evidence: `rawdump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return JsonNull
function JsonNull.__new() end
```

### `isNull`
- Source: `docs.txt:336`, `rawdump/Il2CppFungus/Il2CppMoonSharp/Interpreter/Serialization/Json/JsonNull.cs`
- Confidence: `low`
- Evidence: `rawdump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function JsonNull.isNull() end
```

## KissingDialogueArea

- Source type: `Live2DController+KissingDialogueArea`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class KissingDialogueArea
```

### `__new`
- Source: `docs.txt:2915`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return KissingDialogueArea
function KissingDialogueArea.__new() end
```

### `GetPrefix`
- Source: `docs.txt:2916`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function KissingDialogueArea.GetPrefix() end
```

## Live2DBlowjobController

- Source type: `Live2DBlowjobController`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DBlowjobController.cs`
- Dump fallback: `dump/GameAssembly/Live2DBlowjobController.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class Live2DBlowjobController
```

### `__new`
- Source: `docs.txt:3335`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DBlowjobController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Live2DBlowjobController
function Live2DBlowjobController.__new() end
```

### `InitializeGenerated`
- Source: `docs.txt:3336`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DBlowjobController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DBlowjobController.InitializeGenerated() end
```

## Live2DController

- Source type: `Live2DController`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Dump fallback: `dump/GameAssembly/Live2DController.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class Live2DController
```

### `AddGenericInteractable`
- Source: `docs.txt:3070`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param renderers CubismRenderer[]
---@param layernr integer
---@return Live2DGenericInteractable
function Live2DController.AddGenericInteractable(renderers, layernr) end
```

### `Awake`
- Source: `docs.txt:3050`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.Awake() end
```

### `BeforeDestroy`
- Source: `docs.txt:3046`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.BeforeDestroy() end
```

### `ChangeLayer`
- Source: `docs.txt:3069`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param to integer
function Live2DController.ChangeLayer(to) end
```

### `ColorMagic`
- Source: `docs.txt:3061`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param color Color
---@param strength number
---@return Color
function Live2DController.ColorMagic(color, strength) end
```

### `ColorMagicV2`
- Source: `docs.txt:3060`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param color Color
---@param min Color
---@param max Color
---@return Color
function Live2DController.ColorMagicV2(color, min, max) end
```

### `EndKiss`
- Source: `docs.txt:3089`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.EndKiss() end
```

### `EndUsage`
- Source: `docs.txt:3049`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param user ILive2DModelUser
function Live2DController.EndUsage(user) end
```

### `EnsureBrain`
- Source: `docs.txt:3047`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param characterId string
function Live2DController.EnsureBrain(characterId) end
```

### `EnsureLimbs`
- Source: `docs.txt:3079`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param limbUsage ILimbUsage
---@return boolean
function Live2DController.EnsureLimbs(limbUsage) end
```

### `FinishAllMoves`
- Source: `docs.txt:3091`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.FinishAllMoves() end
```

### `FireEvent`
- Source: `docs.txt:3022`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param e InteractionMemoryEventEnum
function Live2DController.FireEvent(e) end
```

### `FixedUpdate`
- Source: `docs.txt:3055`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.FixedUpdate() end
```

### `FixedUpdateHologram`
- Source: `docs.txt:3023`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.FixedUpdateHologram() end
```

### `GetAllElements`
- Source: `docs.txt:3062`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return any[]
function Live2DController.GetAllElements() end
```

### `GetAllItemParts`
- Source: `docs.txt:3038`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item Item
---@return any[]
function Live2DController.GetAllItemParts(item) end
```

### `GetCachedPart`
- Source: `docs.txt:3024`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param cubismDrawable CubismDrawable
---@return Part
function Live2DController.GetCachedPart(cubismDrawable) end
```

### `GetCachedPart`
- Source: `docs.txt:3025`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param cubismRenderer CubismRenderer
---@return Part
function Live2DController.GetCachedPart(cubismRenderer) end
```

### `GetCachedPart`
- Source: `docs.txt:3026`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param id string
---@return Part
function Live2DController.GetCachedPart(id) end
```

### `GetCopyLimbUsages`
- Source: `docs.txt:3078`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param limbUsages ILimbUsage[]
---@return any[]
function Live2DController.GetCopyLimbUsages(limbUsages) end
```

### `GetDistinctLimbUsages`
- Source: `docs.txt:3077`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return any[]
function Live2DController.GetDistinctLimbUsages() end
```

### `GetDrawables`
- Source: `docs.txt:3030`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return CubismDrawable[]
function Live2DController.GetDrawables() end
```

### `GetElementById`
- Source: `docs.txt:3063`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param id string
---@return Live2DControllerElement
function Live2DController.GetElementById(id) end
```

### `GetGroup`
- Source: `docs.txt:3059`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param group ColoringGroupEnum
---@return ColoringGroup
function Live2DController.GetGroup(group) end
```

### `GetGroups`
- Source: `docs.txt:3058`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return any[]
function Live2DController.GetGroups() end
```

### `GetMouthOffset`
- Source: `docs.txt:3056`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return Vector3
function Live2DController.GetMouthOffset() end
```

### `GetParamByPropertyName`
- Source: `docs.txt:3092`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param parameterName string
---@return ParameterBase
function Live2DController.GetParamByPropertyName(parameterName) end
```

### `GetParts`
- Source: `docs.txt:3032`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return any[]
function Live2DController.GetParts() end
```

### `GetRenderersInDrawOrder`
- Source: `docs.txt:3031`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return any[]
function Live2DController.GetRenderersInDrawOrder() end
```

### `GetStoryEmoteManager`
- Source: `docs.txt:3093`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return StoryEmoteManager
function Live2DController.GetStoryEmoteManager() end
```

### `GroupColor`
- Source: `docs.txt:3057`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param group ColoringGroupEnum
---@param color Color
function Live2DController.GroupColor(group, color) end
```

### `InitializeAll`
- Source: `docs.txt:3044`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.InitializeAll() end
```

### `InitializeGenerated`
- Source: `docs.txt:3021`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.InitializeGenerated() end
```

### `IsAnySubElementActive`
- Source: `docs.txt:3065`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param id string
---@return boolean
function Live2DController.IsAnySubElementActive(id) end
```

### `IsApproximatelyDefaultFaceAngle`
- Source: `docs.txt:3086`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return boolean
function Live2DController.IsApproximatelyDefaultFaceAngle() end
```

### `IsElementActive`
- Source: `docs.txt:3064`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param id string
---@return boolean
function Live2DController.IsElementActive(id) end
```

### `IsHeld`
- Source: `docs.txt:3068`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param interactable ILive2DInteractable
---@return boolean
function Live2DController.IsHeld(interactable) end
```

### `IsLimbActive`
- Source: `docs.txt:3085`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param flag LimbUsageChoiceEnum
---@return boolean
function Live2DController.IsLimbActive(flag) end
```

### `IsLimbUsageExactlyCorrect`
- Source: `docs.txt:3083`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param limbUsage ILimbUsage
---@return boolean
function Live2DController.IsLimbUsageExactlyCorrect(limbUsage) end
```

### `IsValidEmote`
- Source: `docs.txt:3096`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param emote EmoteData
---@return Result
function Live2DController.IsValidEmote(emote) end
```

### `LetGoIfHeld`
- Source: `docs.txt:3074`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param interactable ILive2DInteractable
function Live2DController.LetGoIfHeld(interactable) end
```

### `LetGoLimbs`
- Source: `docs.txt:3081`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param limbUsage ILimbUsage
---@param letGoLimbsCaller LetGoLimbsCaller
function Live2DController.LetGoLimbs(limbUsage, letGoLimbsCaller) end
```

### `LetGoLimbs`
- Source: `docs.txt:3082`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param limbUsageChoiceEnum LimbUsageChoiceEnum
---@param letGoLimbsCaller LetGoLimbsCaller
function Live2DController.LetGoLimbs(limbUsageChoiceEnum, letGoLimbsCaller) end
```

### `LetGoOfCurrentlyHeld`
- Source: `docs.txt:3075`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.LetGoOfCurrentlyHeld() end
```

### `LoadSerializedState`
- Source: `docs.txt:3043`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.LoadSerializedState() end
```

### `OnDisable`
- Source: `docs.txt:3052`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.OnDisable() end
```

### `OnDisableKissing`
- Source: `docs.txt:3090`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.OnDisableKissing() end
```

### `OnLateUpdate`
- Source: `docs.txt:3054`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.OnLateUpdate() end
```

### `PrepareForDialogue`
- Source: `docs.txt:3041`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
function Live2DController.PrepareForDialogue() end
```

### `RemoveInteractable`
- Source: `docs.txt:3072`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param interactable ILive2DInteractableHoverable
function Live2DController.RemoveInteractable(interactable) end
```

### `RenderCoroutine`
- Source: `docs.txt:3040`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param OnFinished fun(arg1: RenderTexture)
---@return IEnumerator
function Live2DController.RenderCoroutine(item, OnFinished) end
```

### `ResetBasic`
- Source: `docs.txt:3035`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.ResetBasic() end
```

### `ResetEverything`
- Source: `docs.txt:3036`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.ResetEverything() end
```

### `ResetParameters`
- Source: `docs.txt:3034`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.ResetParameters() end
```

### `RestoreOriginalTextures`
- Source: `docs.txt:3033`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.RestoreOriginalTextures() end
```

### `RotateInputToTransformRotation`
- Source: `docs.txt:3073`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param v Vector2
function Live2DController.RotateInputToTransformRotation(v) end
```

### `SaveSerializedState`
- Source: `docs.txt:3042`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.SaveSerializedState() end
```

### `SetCurrentToolSelectorActive`
- Source: `docs.txt:3066`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param value boolean
function Live2DController.SetCurrentToolSelectorActive(value) end
```

### `SetDefaultEmote`
- Source: `docs.txt:3094`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param instantly boolean
function Live2DController.SetDefaultEmote(instantly) end
```

### `SetEmote`
- Source: `docs.txt:3095`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param emoteDatas EmoteData[]
function Live2DController.SetEmote(emoteDatas) end
```

### `SetEnabled`
- Source: `docs.txt:3045`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param v boolean
function Live2DController.SetEnabled(v) end
```

### `SetFullBodyInteractable`
- Source: `docs.txt:3071`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param fullBodyInteractable Live2DFullBodyInteractable
---@param layernr integer
---@return Live2DFullBodyInteractable
function Live2DController.SetFullBodyInteractable(fullBodyInteractable, layernr) end
```

### `Start`
- Source: `docs.txt:3051`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.Start() end
```

### `StartKiss`
- Source: `docs.txt:3088`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param targetDrawable CubismDrawable
---@param kissStartPositionType KissStartPositionType
---@param offset Vector2
function Live2DController.StartKiss(targetDrawable, kissStartPositionType, offset) end
```

### `StartUsage`
- Source: `docs.txt:3048`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param characterId string
---@param user ILive2DModelUser
function Live2DController.StartUsage(characterId, user) end
```

### `ToDefaultFaceAngle`
- Source: `docs.txt:3087`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.ToDefaultFaceAngle() end
```

### `ToggleDrawable`
- Source: `docs.txt:3028`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param drawablename string
---@param value boolean
function Live2DController.ToggleDrawable(drawablename, value) end
```

### `ToggleDrawable`
- Source: `docs.txt:3029`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param drawablename string
---@param value boolean
---@param color Color|nil
function Live2DController.ToggleDrawable(drawablename, value, color) end
```

### `TryEstimateItemWorldBounds`
- Source: `docs.txt:3039`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param bounds Bounds
---@return boolean
function Live2DController.TryEstimateItemWorldBounds(item, bounds) end
```

### `TryGetCachedPart`
- Source: `docs.txt:3027`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param id string
---@param part Part
---@return boolean
function Live2DController.TryGetCachedPart(id, part) end
```

### `TryGetCurrentlyHoveredOrHeldInteractablePosition`
- Source: `docs.txt:3076`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param position Vector3
---@return boolean
function Live2DController.TryGetCurrentlyHoveredOrHeldInteractablePosition(position) end
```

### `TryGetHeldInteractable`
- Source: `docs.txt:3067`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param interactable ILive2DInteractable
---@return boolean
function Live2DController.TryGetHeldInteractable(interactable) end
```

### `TryGetLimbUsageAt`
- Source: `docs.txt:3084`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param flag LimbUsageChoiceEnum
---@param limbUsage ILimbUsage
---@return boolean
function Live2DController.TryGetLimbUsageAt(flag, limbUsage) end
```

### `Update`
- Source: `docs.txt:3053`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DController.Update() end
```

### `UpdateTexturesFromCurrentlyEquipped`
- Source: `docs.txt:3037`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function Live2DController.UpdateTexturesFromCurrentlyEquipped(type) end
```

### `UseLimbs`
- Source: `docs.txt:3080`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param limbUsage ILimbUsage
---@param letGoLimbsCaller LetGoLimbsCaller
function Live2DController.UseLimbs(limbUsage, letGoLimbsCaller) end
```

## Live2DControllerElement

- Source type: `Live2DController+Live2DControllerElement`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class Live2DControllerElement
```

### `__new`
- Source: `docs.txt:2897`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param id string
---@param group ElementColoringGroup[]
---@return Live2DControllerElement
function Live2DControllerElement.__new(id, group) end
```

### `Activate`
- Source: `docs.txt:2898`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item ItemWithCurrentData
function Live2DControllerElement.Activate(item) end
```

### `AllPartsNonSegmented`
- Source: `docs.txt:2901`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param controller Live2DController
---@return any[]
function Live2DControllerElement.AllPartsNonSegmented(controller) end
```

### `AllPartsOnTextureWithColor`
- Source: `docs.txt:2899`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param controller Live2DController
---@param item Item
---@return any[]
function Live2DControllerElement.AllPartsOnTextureWithColor(controller, item) end
```

### `AllPartsWithOnTextureColoringGroup`
- Source: `docs.txt:2900`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param controller Live2DController
---@return any[]
function Live2DControllerElement.AllPartsWithOnTextureColoringGroup(controller) end
```

## Live2DControllerItemModifier

- Source type: `Live2DController+Live2DControllerItemModifier`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class Live2DControllerItemModifier
```

### `Activate`
- Source: `docs.txt:2933`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param live2DController Live2DController
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function Live2DControllerItemModifier.Activate(live2DController, type) end
```

### `Deactivate`
- Source: `docs.txt:2936`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param live2DController Live2DController
function Live2DControllerItemModifier.Deactivate(live2DController) end
```

### `FixedUpdate`
- Source: `docs.txt:2935`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param live2DController Live2DController
function Live2DControllerItemModifier.FixedUpdate(live2DController) end
```

### `OnReactivate`
- Source: `docs.txt:2934`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param live2DController Live2DController
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function Live2DControllerItemModifier.OnReactivate(live2DController, type) end
```

### `SetSourceItem`
- Source: `docs.txt:2932`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
function Live2DControllerItemModifier.SetSourceItem(item) end
```

## Live2DControllerSingleton

- Source type: `Live2DControllerSingleton`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Dump fallback: `dump/GameAssembly/Live2DControllerSingleton.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class Live2DControllerSingleton
```

### `__new`
- Source: `docs.txt:4180`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Live2DControllerSingleton
function Live2DControllerSingleton.__new() end
```

### `AllCurrentlyUsedControllersFor`
- Source: `docs.txt:4184`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param characterId string
---@return any[]
function Live2DControllerSingleton.AllCurrentlyUsedControllersFor(characterId) end
```

### `AllInstantiatedControllersFor`
- Source: `docs.txt:4183`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param characterId string
---@return any[]
function Live2DControllerSingleton.AllInstantiatedControllersFor(characterId) end
```

### `GetModCreationData`
- Source: `docs.txt:4187`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param usageName string
---@return ModCreationLive2DControllersContainer
function Live2DControllerSingleton.GetModCreationData(usageName) end
```

### `GetReadyController`
- Source: `docs.txt:4186`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param characterId string
---@return Live2DController
function Live2DControllerSingleton.GetReadyController(characterId) end
```

### `GetRenderTexture`
- Source: `docs.txt:4193`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return RenderTexture
function Live2DControllerSingleton.GetRenderTexture() end
```

### `IsAnyControllerActiveAndTalkingWithOverlay`
- Source: `docs.txt:4185`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param characterId string
---@return boolean
function Live2DControllerSingleton.IsAnyControllerActiveAndTalkingWithOverlay(characterId) end
```

### `OnValidate`
- Source: `docs.txt:4188`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DControllerSingleton.OnValidate() end
```

### `ResetAllTextures`
- Source: `docs.txt:4191`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DControllerSingleton.ResetAllTextures() end
```

### `ReturnToPoll`
- Source: `docs.txt:4192`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param texture Texture
function Live2DControllerSingleton.ReturnToPoll(texture) end
```

### `Start`
- Source: `docs.txt:4189`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DControllerSingleton.Start() end
```

### `ToFlags`
- Source: `docs.txt:4181`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param e ControllerEnum
---@return SceneEnumFlag
function Live2DControllerSingleton.ToFlags(e) end
```

### `ToFlags`
- Source: `docs.txt:4182`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param e ControllerEnum[]
---@return SceneEnumFlag
function Live2DControllerSingleton.ToFlags(e) end
```

### `UpdateAllTextures`
- Source: `docs.txt:4190`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DControllerSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DControllerSingleton.UpdateAllTextures() end
```

## Live2DCowgirlController

- Source type: `Live2DCowgirlController`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DCowgirlController.cs`
- Dump fallback: `dump/GameAssembly/Live2DCowgirlController.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class Live2DCowgirlController
```

### `__new`
- Source: `docs.txt:3521`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DCowgirlController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Live2DCowgirlController
function Live2DCowgirlController.__new() end
```

### `InitializeGenerated`
- Source: `docs.txt:3524`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DCowgirlController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DCowgirlController.InitializeGenerated() end
```

### `PrepareBoobInteractables`
- Source: `docs.txt:3523`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DCowgirlController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param thisController Live2DCowgirlController
function Live2DCowgirlController.PrepareBoobInteractables(thisController) end
```

### `PrepareNippleInteractables`
- Source: `docs.txt:3522`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DCowgirlController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param thisController Live2DCowgirlController
function Live2DCowgirlController.PrepareNippleInteractables(thisController) end
```

## Live2DInteractionController

- Source type: `Live2DInteractionController`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Dump fallback: `dump/GameAssembly/Live2DInteractionController.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class Live2DInteractionController
```

### `__new`
- Source: `docs.txt:3793`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Live2DInteractionController
function Live2DInteractionController.__new() end
```

### `GetMouthOffset`
- Source: `docs.txt:3794`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return Vector3
function Live2DInteractionController.GetMouthOffset() end
```

### `InitializeGenerated`
- Source: `docs.txt:3807`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DInteractionController.InitializeGenerated() end
```

### `PrepareBoobsInteractables`
- Source: `docs.txt:3799`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param thisController Live2DInteractionController
---@param boobL Live2DInteractableLimbUsage
---@param boobR Live2DInteractableLimbUsage
---@param boobsBoth Live2DInteractableLimbUsage
function Live2DInteractionController.PrepareBoobsInteractables(thisController, boobL, boobR, boobsBoth) end
```

### `PrepareCuddleHeadpatInteractable`
- Source: `docs.txt:3803`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param thisController Live2DInteractionController
---@param _headpatInteractable Live2DInteractableLimbUsage
function Live2DInteractionController.PrepareCuddleHeadpatInteractable(thisController, _headpatInteractable) end
```

### `PrepareFaceRubInteractable`
- Source: `docs.txt:3801`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param thisController Live2DInteractionController
---@param interactable Live2DInteractableLimbUsage
function Live2DInteractionController.PrepareFaceRubInteractable(thisController, interactable) end
```

### `PrepareHandHoldingCuddleInteractable`
- Source: `docs.txt:3804`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param thisController Live2DInteractionController
---@param _handholdingInteractable Live2DInteractableLimbUsage
function Live2DInteractionController.PrepareHandHoldingCuddleInteractable(thisController, _handholdingInteractable) end
```

### `PrepareHandholdingInteractable`
- Source: `docs.txt:3800`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param thisController Live2DInteractionController
---@param armL Live2DInteractableLimbUsage
---@param armR Live2DInteractableLimbUsage
function Live2DInteractionController.PrepareHandholdingInteractable(thisController, armL, armR) end
```

### `PreparePantiesAndSkirt`
- Source: `docs.txt:3802`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param thisController Live2DInteractionController
---@param _pantiesInteractable Live2DInteractableLimbUsage
---@param _skirtInteractable Live2DInteractableLimbUsage
function Live2DInteractionController.PreparePantiesAndSkirt(thisController, _pantiesInteractable, _skirtInteractable) end
```

### `PrepareThumbMouthInteractables`
- Source: `docs.txt:3805`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param thisController Live2DInteractionController
---@param _thumbMouthInteractable Live2DInteractableLimbUsage
function Live2DInteractionController.PrepareThumbMouthInteractables(thisController, _thumbMouthInteractable) end
```

### `ResetBasic`
- Source: `docs.txt:3806`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DInteractionController.ResetBasic() end
```

### `ResetEverything`
- Source: `docs.txt:3798`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param interactionSceneType InteractionSceneTypeEnum
function Live2DInteractionController.ResetEverything(interactionSceneType) end
```

### `SetArmLCuddle`
- Source: `docs.txt:3796`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param armLCuddleState ArmLCuddleState
function Live2DInteractionController.SetArmLCuddle(armLCuddleState) end
```

### `SetArmLNormal`
- Source: `docs.txt:3797`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param armState ArmState
function Live2DInteractionController.SetArmLNormal(armState) end
```

### `SetArmState`
- Source: `docs.txt:3795`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DInteractionController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param state ArmState
---@param selection ArmSelection
function Live2DInteractionController.SetArmState(state, selection) end
```

## Live2DLewdSceneController

- Source type: `Live2DLewdSceneController`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DLewdSceneController.cs`
- Dump fallback: `dump/GameAssembly/Live2DLewdSceneController.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class Live2DLewdSceneController
```

### `ActivateBotFullLeadIfPossible`
- Source: `docs.txt:3232`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DLewdSceneController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DLewdSceneController.ActivateBotFullLeadIfPossible() end
```

### `ManifestHorninessAndResetFrickCommonData`
- Source: `docs.txt:3231`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DLewdSceneController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DLewdSceneController.ManifestHorninessAndResetFrickCommonData() end
```

## Live2DShadersContainer

- Source type: `ShaderDataGenerated+Live2DShadersContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class Live2DShadersContainer
```

### `__new`
- Source: `docs.txt:5116`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Live2DShadersContainer
function Live2DShadersContainer.__new() end
```

## Live2DShowerController

- Source type: `Live2DShowerController`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Dump fallback: `dump/GameAssembly/Live2DShowerController.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class Live2DShowerController
```

### `__new`
- Source: `docs.txt:4008`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Live2DShowerController
function Live2DShowerController.__new() end
```

### `DestroyAllSoap`
- Source: `docs.txt:4017`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DShowerController.DestroyAllSoap() end
```

### `FixedUpdate`
- Source: `docs.txt:4019`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DShowerController.FixedUpdate() end
```

### `GetCleaningProgress`
- Source: `docs.txt:4012`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return number
function Live2DShowerController.GetCleaningProgress() end
```

### `GetSoapUsageLeft`
- Source: `docs.txt:4009`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return number
function Live2DShowerController.GetSoapUsageLeft() end
```

### `HasAppliedEnoughSoap`
- Source: `docs.txt:4011`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return boolean
function Live2DShowerController.HasAppliedEnoughSoap() end
```

### `HasFinishedCleaning`
- Source: `docs.txt:4013`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return boolean
function Live2DShowerController.HasFinishedCleaning() end
```

### `InitializeGenerated`
- Source: `docs.txt:4021`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DShowerController.InitializeGenerated() end
```

### `LiftSpongeAt`
- Source: `docs.txt:4015`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param position Vector3
function Live2DShowerController.LiftSpongeAt(position) end
```

### `MoveAllSoapInEyeArea`
- Source: `docs.txt:4014`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function Live2DShowerController.MoveAllSoapInEyeArea() end
```

### `SpreadSoap`
- Source: `docs.txt:4016`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param soapPrefab SoapScript
---@param lastMousePosition Vector2
---@param newMousePosition Vector2
function Live2DShowerController.SpreadSoap(soapPrefab, lastMousePosition, newMousePosition) end
```

### `TryCreateSoap`
- Source: `docs.txt:4018`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param soapPrefab SoapScript
---@param position Vector2
---@param soapItemData SoapItemData
---@param soapParticleType SoapParticleType
---@param soapStrength number
---@return boolean
function Live2DShowerController.TryCreateSoap(soapPrefab, position, soapItemData, soapParticleType, soapStrength) end
```

### `Update`
- Source: `docs.txt:4020`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Live2DShowerController.Update() end
```

### `UsedAnySoap`
- Source: `docs.txt:4010`, `rawdump/Il2CppGameAssembly/Il2Cpp/Live2DShowerController.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function Live2DShowerController.UsedAnySoap() end
```

## Localization

- Source type: `ItemPrefab+ItemPrefabManager+Localization`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class Localization
```

### `__new`
- Source: `docs.txt:722`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Localization
function Localization.__new() end
```

### `RunItemsLocalization`
- Source: `docs.txt:723`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return UniTask
function Localization.RunItemsLocalization() end
```

## LuaPersonalityModuleDefinition

- Source type: `StorySingleton+LuaPersonalityModuleDefinition`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `high`
- Class evidence: `manual, usage`
- Class motivation:
```lua
---Definicao Lua de personality module; agrupa containers de dialogo e depois e ligada a um item registrado.
---@class LuaPersonalityModuleDefinition
```

### `__new`
- Source: `docs.txt:6677`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return LuaPersonalityModuleDefinition
function LuaPersonalityModuleDefinition.__new() end
```

### `PrepareContainer`
- Source: `docs.txt:6678`, `not found`
- Confidence: `high`
- Evidence: `manual, usage`
```lua
---Retorna ou prepara um container de dialogo identificado por tag/stage.
---@param tagId string
---@param stageNr integer
---@return StoryBotDialogueBranchContainer
function LuaPersonalityModuleDefinition.PrepareContainer(tagId, stageNr) end
```

## LuaStoryCondition

- Source type: `StoryConditions.LuaStoryCondition`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/LuaStoryCondition.cs`
- Dump fallback: `dump/GameAssembly/StoryConditions/LuaStoryCondition.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Condicao de historia baseada em codigo Lua/MoonSharp informado por script.
---@class LuaStoryCondition
```

### `__new`
- Source: `docs.txt:7088`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/LuaStoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param conditionCode string
---@param negate boolean
---@return LuaStoryCondition
function LuaStoryCondition.__new(conditionCode, negate) end
```

### `Equals`
- Source: `docs.txt:7093`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/LuaStoryCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param other LuaStoryCondition
---@return boolean
function LuaStoryCondition.Equals(other) end
```

### `Equals`
- Source: `docs.txt:7094`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/LuaStoryCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function LuaStoryCondition.Equals(obj) end
```

### `GetHashCode`
- Source: `docs.txt:7095`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/LuaStoryCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function LuaStoryCondition.GetHashCode() end
```

## MainModule

- Source type: `UnityEngine.ParticleSystem+MainModule`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class MainModule
```

### `__new`
- Source: `docs.txt:4901`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return MainModule
function MainModule.__new() end
```

## ManagedCoroutineWithTarget

- Source type: `ManagedCoroutineWithTarget`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ManagedCoroutineWithTarget
```

### `__new`
- Source: `docs.txt:7327`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ManagedCoroutineWithTarget
function ManagedCoroutineWithTarget.__new() end
```

### `MoveNext`
- Source: `docs.txt:7332`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function ManagedCoroutineWithTarget.MoveNext() end
```

### `Reset`
- Source: `docs.txt:7333`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ManagedCoroutineWithTarget.Reset() end
```

### `SetTarget`
- Source: `docs.txt:7328`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param target MonoBehaviour
function ManagedCoroutineWithTarget.SetTarget(target) end
```

### `Start`
- Source: `docs.txt:7329`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param enumerator IEnumerator
---@param onFinished fun()
function ManagedCoroutineWithTarget.Start(enumerator, onFinished) end
```

### `Start`
- Source: `docs.txt:7330`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param enumerator IEnumerator
---@param onFinished fun(arg1: FinishedType)
function ManagedCoroutineWithTarget.Start(enumerator, onFinished) end
```

### `Stop`
- Source: `docs.txt:7331`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ManagedCoroutineWithTarget.Stop() end
```

## MidiContainer

- Source type: `MusicDataGenerated+MidiContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class MidiContainer
```

### `__new`
- Source: `docs.txt:4740`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return MidiContainer
function MidiContainer.__new() end
```

## MidiFile

- Source type: `Melanchall.DryWetMidi.Core.MidiFile`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class MidiFile
```

### `__new`
- Source: `docs.txt:4225`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return MidiFile
function MidiFile.__new() end
```

### `__new`
- Source: `docs.txt:4226`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param chunks MidiChunk[]
---@return MidiFile
function MidiFile.__new(chunks) end
```

### `__new`
- Source: `docs.txt:4227`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param chunks MidiChunk[]
---@return MidiFile
function MidiFile.__new(chunks) end
```

### `Clone`
- Source: `docs.txt:4229`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return MidiFile
function MidiFile.Clone() end
```

### `Read`
- Source: `docs.txt:4228`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param stream Stream
---@param settings ReadingSettings
---@return MidiFile
function MidiFile.Read(stream, settings) end
```

## MidiSongAsset

- Source type: `MidiSongAsset`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/MidiSongAsset.cs`
- Dump fallback: `dump/GameAssembly/MidiSongAsset.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class MidiSongAsset
```

### `__new`
- Source: `docs.txt:4857`, `rawdump/Il2CppGameAssembly/Il2Cpp/MidiSongAsset.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return MidiSongAsset
function MidiSongAsset.__new() end
```

### `GetMidiFile`
- Source: `docs.txt:4859`, `rawdump/Il2CppGameAssembly/Il2Cpp/MidiSongAsset.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return MidiFile
function MidiSongAsset.GetMidiFile() end
```

### `SetMidiFileData`
- Source: `docs.txt:4858`, `rawdump/Il2CppGameAssembly/Il2Cpp/MidiSongAsset.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param bytes integer[]
function MidiSongAsset.SetMidiFileData(bytes) end
```

## MinMaxCurve

- Source type: `UnityEngine.ParticleSystem+MinMaxCurve`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class MinMaxCurve
```

### `__new`
- Source: `docs.txt:4980`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param constant number
---@return MinMaxCurve
function MinMaxCurve.__new(constant) end
```

### `__new`
- Source: `docs.txt:4981`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return MinMaxCurve
function MinMaxCurve.__new() end
```

### `__toMinMaxCurve`
- Source: `docs.txt:4984`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param constant number
---@return MinMaxCurve
function MinMaxCurve.__toMinMaxCurve(constant) end
```

### `Evaluate`
- Source: `docs.txt:4982`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param time number
---@return number
function MinMaxCurve.Evaluate(time) end
```

### `Evaluate`
- Source: `docs.txt:4983`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param time number
---@param lerpFactor number
---@return number
function MinMaxCurve.Evaluate(time, lerpFactor) end
```

## MinMaxGradient

- Source type: `UnityEngine.ParticleSystem+MinMaxGradient`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class MinMaxGradient
```

### `__new`
- Source: `docs.txt:4992`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param color Color
---@return MinMaxGradient
function MinMaxGradient.__new(color) end
```

### `__new`
- Source: `docs.txt:4993`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param gradient Gradient
---@return MinMaxGradient
function MinMaxGradient.__new(gradient) end
```

### `__new`
- Source: `docs.txt:4994`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return MinMaxGradient
function MinMaxGradient.__new() end
```

### `__toMinMaxGradient`
- Source: `docs.txt:4995`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param color Color
---@return MinMaxGradient
function MinMaxGradient.__toMinMaxGradient(color) end
```

### `__toMinMaxGradient`
- Source: `docs.txt:4996`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param gradient Gradient
---@return MinMaxGradient
function MinMaxGradient.__toMinMaxGradient(gradient) end
```

## ModCustomStringReference

- Source type: `ModCustomStringReference`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ModCustomStringReference.cs`
- Dump fallback: `dump/GameAssembly/ModCustomStringReference.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ModCustomStringReference
```

### `__new`
- Source: `docs.txt:8267`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModCustomStringReference.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param sourceMod Mod
---@param key string
---@param isSmartString boolean
---@return ModCustomStringReference
function ModCustomStringReference.__new(sourceMod, key, isSmartString) end
```

### `Get`
- Source: `docs.txt:8268`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModCustomStringReference.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function ModCustomStringReference.Get() end
```

### `Get`
- Source: `docs.txt:8269`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModCustomStringReference.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param args any[]
---@return string
function ModCustomStringReference.Get(args) end
```

## ModMusicWithInfo

- Source type: `ModMusicWithInfo`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ModMusicWithInfo.cs`
- Dump fallback: `dump/GameAssembly/ModMusicWithInfo.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ModMusicWithInfo
```

### `__new`
- Source: `docs.txt:4314`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModMusicWithInfo.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param sourceModFile ModFileBase
---@param songName string
---@param author string
---@return ModMusicWithInfo
function ModMusicWithInfo.__new(sourceModFile, songName, author) end
```

### `GetAudioClip`
- Source: `docs.txt:4315`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModMusicWithInfo.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return UniTask
function ModMusicWithInfo.GetAudioClip() end
```

### `HasText`
- Source: `docs.txt:4316`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModMusicWithInfo.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param s string
---@return boolean
function ModMusicWithInfo.HasText(s) end
```

## ModUtilities

- Source type: `ModUtilities`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Dump fallback: `dump/GameAssembly/ModUtilities.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Helper exposto a scripts Lua de mods para criar e registrar itens, carregar assets, adicionar itens a lojas, preparar personality modules, acessar controllers e controlar coroutines do runtime.
---@class ModUtilities
```

### `__new`
- Source: `docs.txt:7997`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ModUtilities
function ModUtilities.__new() end
```

### `AddGenericItemToShop`
- Source: `docs.txt:8006`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Adiciona um item registrado a uma loja como item generico/recompravel.
---@param shopId string
---@param gameId GameId
---@param availabilityFunc fun(): boolean
---@param occurenceRate number
function ModUtilities.AddGenericItemToShop(shopId, gameId, availabilityFunc, occurenceRate) end
```

### `AddSingleBuyItemToShop`
- Source: `docs.txt:8007`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Adiciona um item registrado a uma loja como compra unica.
---@param shopId string
---@param gameId GameId
---@param availabilityFunc fun(): boolean
---@param occurenceRate number
function ModUtilities.AddSingleBuyItemToShop(shopId, gameId, availabilityFunc, occurenceRate) end
```

### `AddSong`
- Source: `docs.txt:8015`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param cookingSong CookingSong
function ModUtilities.AddSong(cookingSong) end
```

### `CreateItemPrefab`
- Source: `docs.txt:8001`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Cria um ItemPrefab configuravel por scripts Lua antes do registro do item.
---@return ItemPrefab
function ModUtilities.CreateItemPrefab() end
```

### `CreateItemPrefab`
- Source: `docs.txt:8002`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Cria um ItemPrefab configuravel por scripts Lua antes do registro do item.
---@param name string
---@param description string
---@param price integer
---@return ItemPrefab
function ModUtilities.CreateItemPrefab(name, description, price) end
```

### `CreateLocalizableString`
- Source: `docs.txt:7998`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param modGuid Guid
---@param key string
---@param text string
---@param smartString boolean
---@return ModCustomStringReference
function ModUtilities.CreateLocalizableString(modGuid, key, text, smartString) end
```

### `CreateNewItem`
- Source: `docs.txt:8004`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Registra um ItemPrefab para um mod e retorna o GameId do item registrado.
---@param modGuid Guid
---@param itemPrefab ItemPrefab
---@return GameId
function ModUtilities.CreateNewItem(modGuid, itemPrefab) end
```

### `CreateNewItem`
- Source: `docs.txt:8005`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Registra um ItemPrefab para um mod e retorna o GameId do item registrado.
---@param id integer
---@param modGuid Guid
---@param itemPrefab ItemPrefab
---@return GameId
function ModUtilities.CreateNewItem(id, modGuid, itemPrefab) end
```

### `CreateNewItemAutoAssignId`
- Source: `docs.txt:8003`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Registra um ItemPrefab para um mod e retorna um GameId gerado automaticamente.
---@param modGuid Guid
---@param itemPrefab ItemPrefab
---@return GameId
function ModUtilities.CreateNewItemAutoAssignId(modGuid, itemPrefab) end
```

### `GetAsAudioClipReference`
- Source: `docs.txt:8014`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param modGuid Guid
---@param path string
---@return IReference
function ModUtilities.GetAsAudioClipReference(modGuid, path) end
```

### `GetAsMusicWithInfo`
- Source: `docs.txt:8013`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param modGuid Guid
---@param path string
---@param songName string
---@param songAuthor string
---@return IReference
function ModUtilities.GetAsMusicWithInfo(modGuid, path, songName, songAuthor) end
```

### `GetAsSprite`
- Source: `docs.txt:8018`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Cria uma referencia de Sprite convertida a partir de uma textura do pacote do mod.
---@param modGuid Guid
---@param path string
---@param ppu number
---@return IReference
function ModUtilities.GetAsSprite(modGuid, path, ppu) end
```

### `GetController`
- Source: `docs.txt:8028`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Retorna o ControllerEnum associado a um identificador textual de controller/cena.
---@param id string
---@return ControllerEnum
function ModUtilities.GetController(id) end
```

### `GetDoggyController`
- Source: `docs.txt:8026`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Retorna doggy controller.
---@return ControllerEnum
function ModUtilities.GetDoggyController() end
```

### `GetGameVariables`
- Source: `docs.txt:8024`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return GameVariables
function ModUtilities.GetGameVariables() end
```

### `GetInteractController`
- Source: `docs.txt:8027`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Retorna interact controller.
---@return ControllerEnum
function ModUtilities.GetInteractController() end
```

### `GetLocalizableString`
- Source: `docs.txt:7999`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param modGuid Guid
---@param key string
---@return ModCustomStringReference
function ModUtilities.GetLocalizableString(modGuid, key) end
```

### `GetLocalizableStringRaw`
- Source: `docs.txt:8000`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param modGuid Guid
---@param key string
---@return string
function ModUtilities.GetLocalizableStringRaw(modGuid, key) end
```

### `GetMidiReference`
- Source: `docs.txt:8012`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param modGuid Guid
---@param path string
---@return IReference
function ModUtilities.GetMidiReference(modGuid, path) end
```

### `GetMissionaryController`
- Source: `docs.txt:8025`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Retorna missionary controller.
---@return ControllerEnum
function ModUtilities.GetMissionaryController() end
```

### `GetModFile`
- Source: `docs.txt:8008`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Retorna um arquivo do pacote do mod pelo Guid do mod e caminho interno.
---@param modGuid Guid
---@param path string
---@return ModFileBase
function ModUtilities.GetModFile(modGuid, path) end
```

### `GetNewGuid`
- Source: `docs.txt:8019`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return Guid
function ModUtilities.GetNewGuid() end
```

### `GetPackedTexture`
- Source: `docs.txt:8009`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Carrega um container de textura empacotada do pacote do mod.
---@param modGuid Guid
---@param formatPath string
---@return PackedTexturesContainer
function ModUtilities.GetPackedTexture(modGuid, formatPath) end
```

### `GetSprite`
- Source: `docs.txt:8016`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Carrega uma Sprite a partir de um asset do pacote do mod.
---@param modGuid Guid
---@param path string
---@param ppu number
---@return Sprite
function ModUtilities.GetSprite(modGuid, path, ppu) end
```

### `GetSpriteReference`
- Source: `docs.txt:8017`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Cria uma referencia automatica para uma Sprite do pacote do mod.
---@param modGuid Guid
---@param path string
---@param ppu number
---@return IReference
function ModUtilities.GetSpriteReference(modGuid, path, ppu) end
```

### `GetTexture`
- Source: `docs.txt:8010`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Carrega uma Texture2D do pacote do mod.
---@param modGuid Guid
---@param path string
---@return Texture2D
function ModUtilities.GetTexture(modGuid, path) end
```

### `GetTextureReference`
- Source: `docs.txt:8011`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Cria uma referencia automatica para uma Texture2D do pacote do mod.
---@param modGuid Guid
---@param path string
---@return Texture2DModFileAutomaticReference
function ModUtilities.GetTextureReference(modGuid, path) end
```

### `PrepareNewPersonalityDefinition`
- Source: `docs.txt:8020`, `rawdump/Il2CppGameAssembly/Il2Cpp/ModUtilities.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Cria uma definicao de personality module para receber containers e ramos de dialogo.
---@return LuaPersonalityModuleDefinition
function ModUtilities.PrepareNewPersonalityDefinition() end
```

## MusicArtist

- Source type: `MusicArtist`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/MusicArtist.cs`
- Dump fallback: `dump/GameAssembly/MusicArtist.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class MusicArtist
```

### `__new`
- Source: `docs.txt:4835`, `rawdump/Il2CppGameAssembly/Il2Cpp/MusicArtist.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return MusicArtist
function MusicArtist.__new() end
```

### `GetSpotifyUri`
- Source: `docs.txt:4836`, `rawdump/Il2CppGameAssembly/Il2Cpp/MusicArtist.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function MusicArtist.GetSpotifyUri() end
```

## MusicContainer

- Source type: `MusicDataGenerated+MusicContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class MusicContainer
```

### `__new`
- Source: `docs.txt:4543`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return MusicContainer
function MusicContainer.__new() end
```

## MusicDataGenerated

- Source type: `MusicDataGenerated`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/MusicDataGenerated.cs`
- Dump fallback: `dump/GameAssembly/MusicDataGenerated.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class MusicDataGenerated
```

### `__new`
- Source: `docs.txt:4768`, `rawdump/Il2CppGameAssembly/Il2Cpp/MusicDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return MusicDataGenerated
function MusicDataGenerated.__new() end
```

### `OnAfterDeserialize`
- Source: `docs.txt:4770`, `rawdump/Il2CppGameAssembly/Il2Cpp/MusicDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function MusicDataGenerated.OnAfterDeserialize() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:4769`, `rawdump/Il2CppGameAssembly/Il2Cpp/MusicDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function MusicDataGenerated.OnBeforeSerialize() end
```

### `RegisterLua`
- Source: `docs.txt:4771`, `rawdump/Il2CppGameAssembly/Il2Cpp/MusicDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function MusicDataGenerated.RegisterLua() end
```

## MusicGroup

- Source type: `MusicGroup`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/MusicGroup.cs`
- Dump fallback: `dump/GameAssembly/MusicGroup.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class MusicGroup
```

### `__new`
- Source: `docs.txt:4785`, `rawdump/Il2CppGameAssembly/Il2Cpp/MusicGroup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return MusicGroup
function MusicGroup.__new() end
```

## MusicGroupsContainer

- Source type: `MusicDataGenerated+MusicGroupsContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class MusicGroupsContainer
```

### `__new`
- Source: `docs.txt:4532`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return MusicGroupsContainer
function MusicGroupsContainer.__new() end
```

## MusicOption

- Source type: `SoundSingleton+MusicOption`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class MusicOption
```

### `__new`
- Source: `docs.txt:7929`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param id string
---@param layer MusicOptionLayer
---@param musicWithInfo MusicWithInfo
---@return MusicOption
function MusicOption.__new(id, layer, musicWithInfo) end
```

### `__new`
- Source: `docs.txt:7930`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param id string
---@param layer MusicOptionLayer
---@param condition fun(): boolean
---@param musicWithInfo MusicWithInfo
---@return MusicOption
function MusicOption.__new(id, layer, condition, musicWithInfo) end
```

## MusicPlayer

- Source type: `SoundSingleton+MusicPlayer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class MusicPlayer
```

### `__new`
- Source: `docs.txt:7910`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param option MusicOption
---@return MusicPlayer
function MusicPlayer.__new(option) end
```

### `ContinueAs`
- Source: `docs.txt:7915`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param musicOption MusicOption
function MusicPlayer.ContinueAs(musicOption) end
```

### `FadeOut`
- Source: `docs.txt:7913`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function MusicPlayer.FadeOut() end
```

### `Play`
- Source: `docs.txt:7912`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function MusicPlayer.Play() end
```

### `SetPitch`
- Source: `docs.txt:7914`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param pitch number
function MusicPlayer.SetPitch(pitch) end
```

### `UpdateMusicVolume`
- Source: `docs.txt:7911`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function MusicPlayer.UpdateMusicVolume() end
```

## MusicWithInfo

- Source type: `MusicWithInfo`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/MusicWithInfo.cs`
- Dump fallback: `dump/GameAssembly/MusicWithInfo.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class MusicWithInfo
```

### `__new`
- Source: `docs.txt:4809`, `rawdump/Il2CppGameAssembly/Il2Cpp/MusicWithInfo.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return MusicWithInfo
function MusicWithInfo.__new() end
```

### `GetAudioClip`
- Source: `docs.txt:4811`, `rawdump/Il2CppGameAssembly/Il2Cpp/MusicWithInfo.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return UniTask
function MusicWithInfo.GetAudioClip() end
```

### `GetClipReference`
- Source: `docs.txt:4810`, `rawdump/Il2CppGameAssembly/Il2Cpp/MusicWithInfo.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return AssetReferenceT
function MusicWithInfo.GetClipReference() end
```

### `HasText`
- Source: `docs.txt:4812`, `rawdump/Il2CppGameAssembly/Il2Cpp/MusicWithInfo.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param s string
---@return boolean
function MusicWithInfo.HasText(s) end
```

## NewsData

- Source type: `NewsDataManager+NewsData`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class NewsData
```

### `__new`
- Source: `docs.txt:2567`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return NewsData
function NewsData.__new() end
```

### `__new`
- Source: `docs.txt:2568`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param newsId GameId
---@param newsSeed integer
---@return NewsData
function NewsData.__new(newsId, newsSeed) end
```

### `OnAfterDeserialize`
- Source: `docs.txt:2570`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function NewsData.OnAfterDeserialize() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:2569`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function NewsData.OnBeforeSerialize() end
```

## NewsDataManager

- Source type: `NewsDataManager`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/NewsDataManager.cs`
- Dump fallback: `dump/GameAssembly/NewsDataManager.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class NewsDataManager
```

### `CreateInstance`
- Source: `docs.txt:2586`, `rawdump/Il2CppGameAssembly/Il2Cpp/NewsDataManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return NewsDataManager
function NewsDataManager.CreateInstance() end
```

### `Force`
- Source: `docs.txt:2590`, `rawdump/Il2CppGameAssembly/Il2Cpp/NewsDataManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param type NewsId
---@param newsGameId GameId
---@param seed integer
function NewsDataManager.Force(type, newsGameId, seed) end
```

### `HourPassed`
- Source: `docs.txt:2589`, `rawdump/Il2CppGameAssembly/Il2Cpp/NewsDataManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param hourInDay integer
function NewsDataManager.HourPassed(hourInDay) end
```

### `InitializeNewGame`
- Source: `docs.txt:2587`, `rawdump/Il2CppGameAssembly/Il2Cpp/NewsDataManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function NewsDataManager.InitializeNewGame() end
```

### `Randomize`
- Source: `docs.txt:2588`, `rawdump/Il2CppGameAssembly/Il2Cpp/NewsDataManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param type NewsId
function NewsDataManager.Randomize(type) end
```

## NewsImagesContainer

- Source type: `SpriteTextureDataGenerated+NewsImagesContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class NewsImagesContainer
```

### `__new`
- Source: `docs.txt:5852`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return NewsImagesContainer
function NewsImagesContainer.__new() end
```

## NormalEvent

- Source type: `EventManager+NormalEvent`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class NormalEvent
```

### `__new`
- Source: `docs.txt:2423`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return NormalEvent
function NormalEvent.__new() end
```

## NunRepairPopup

- Source type: `NunRepairPopup`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/NunRepairPopup.cs`
- Dump fallback: `dump/GameAssembly/NunRepairPopup.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class NunRepairPopup
```

### `__new`
- Source: `docs.txt:7791`, `rawdump/Il2CppGameAssembly/Il2Cpp/NunRepairPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return NunRepairPopup
function NunRepairPopup.__new() end
```

### `CloseInner`
- Source: `docs.txt:7793`, `rawdump/Il2CppGameAssembly/Il2Cpp/NunRepairPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function NunRepairPopup.CloseInner() end
```

### `Open`
- Source: `docs.txt:7792`, `rawdump/Il2CppGameAssembly/Il2Cpp/NunRepairPopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function NunRepairPopup.Open() end
```

## NutritionProfilePool

- Source type: `EdibleItemNutritionProfile+NutritionProfilePool`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class NutritionProfilePool
```

### `__new`
- Source: `docs.txt:1582`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return NutritionProfilePool
function NutritionProfilePool.__new() end
```

## OrCondition

- Source type: `StoryConditions.OrCondition`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/OrCondition.cs`
- Dump fallback: `dump/GameAssembly/StoryConditions/OrCondition.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class OrCondition
```

### `__new`
- Source: `docs.txt:7122`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/OrCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param operands StoryCondition[]
---@param negate boolean
---@return OrCondition
function OrCondition.__new(operands, negate) end
```

### `Equals`
- Source: `docs.txt:7125`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/OrCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param other OrCondition
---@return boolean
function OrCondition.Equals(other) end
```

### `Equals`
- Source: `docs.txt:7126`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/OrCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function OrCondition.Equals(obj) end
```

### `Explain`
- Source: `docs.txt:7123`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/OrCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function OrCondition.Explain() end
```

### `GenerateCode`
- Source: `docs.txt:7124`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/OrCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function OrCondition.GenerateCode() end
```

### `GetHashCode`
- Source: `docs.txt:7127`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/OrCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function OrCondition.GetHashCode() end
```

## OtherDataGenerated

- Source type: `OtherDataGenerated`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/OtherDataGenerated.cs`
- Dump fallback: `dump/GameAssembly/OtherDataGenerated.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class OtherDataGenerated
```

### `__new`
- Source: `docs.txt:4888`, `rawdump/Il2CppGameAssembly/Il2Cpp/OtherDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return OtherDataGenerated
function OtherDataGenerated.__new() end
```

### `OnAfterDeserialize`
- Source: `docs.txt:4890`, `rawdump/Il2CppGameAssembly/Il2Cpp/OtherDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function OtherDataGenerated.OnAfterDeserialize() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:4889`, `rawdump/Il2CppGameAssembly/Il2Cpp/OtherDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function OtherDataGenerated.OnBeforeSerialize() end
```

### `RegisterLua`
- Source: `docs.txt:4891`, `rawdump/Il2CppGameAssembly/Il2Cpp/OtherDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function OtherDataGenerated.RegisterLua() end
```

## OtherLogosContainer

- Source type: `SpriteTextureDataGenerated+OtherLogosContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class OtherLogosContainer
```

### `__new`
- Source: `docs.txt:5576`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return OtherLogosContainer
function OtherLogosContainer.__new() end
```

## OtherTextContainer

- Source type: `TextDataGenerated+OtherTextContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class OtherTextContainer
```

### `__new`
- Source: `docs.txt:6014`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return OtherTextContainer
function OtherTextContainer.__new() end
```

## PackablePackedColorIndex

- Source type: `PackedTexturesContainer+PackablePackedColorIndex`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PackablePackedColorIndex
```

### `__new`
- Source: `docs.txt:953`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param texture PackedTexture
---@param drawable PackedDrawable
---@return PackablePackedColorIndex
function PackablePackedColorIndex.__new(texture, drawable) end
```

### `Draw`
- Source: `docs.txt:954`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param targetRectInTexture Rect
function PackablePackedColorIndex.Draw(targetRectInTexture) end
```

## PackedDrawable

- Source type: `PackedTexturesContainer+PackedDrawable`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PackedDrawable
```

### `__new`
- Source: `docs.txt:888`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return PackedDrawable
function PackedDrawable.__new() end
```

### `__new`
- Source: `docs.txt:889`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@param rectInt RectInt
---@param colorIndex integer
---@param drawableType DrawableTypeEnum
---@param bypassColorScaler boolean
---@return PackedDrawable
function PackedDrawable.__new(name, rectInt, colorIndex, drawableType, bypassColorScaler) end
```

### `Clone`
- Source: `docs.txt:890`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param offset integer
---@return PackedDrawable
function PackedDrawable.Clone(offset) end
```

### `ToPackable`
- Source: `docs.txt:891`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param texture PackedTexture
---@return PackablePackedColorIndex
function PackedDrawable.ToPackable(texture) end
```

## PackedTexture

- Source type: `PackedTexturesContainer+PackedTexture`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PackedTexture
```

### `__new`
- Source: `docs.txt:915`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return PackedTexture
function PackedTexture.__new() end
```

### `AddTarget`
- Source: `docs.txt:918`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param target string
function PackedTexture.AddTarget(target) end
```

### `Clone`
- Source: `docs.txt:924`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param offset integer
---@return PackedTexture
function PackedTexture.Clone(offset) end
```

### `GetTexture`
- Source: `docs.txt:921`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Texture2D
function PackedTexture.GetTexture() end
```

### `HasTarget`
- Source: `docs.txt:917`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param target string
---@return boolean
function PackedTexture.HasTarget(target) end
```

### `OnAfterDeserialize`
- Source: `docs.txt:920`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function PackedTexture.OnAfterDeserialize() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:919`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function PackedTexture.OnBeforeSerialize() end
```

### `SetRuntimeTexture`
- Source: `docs.txt:922`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param texture2D Texture2D
function PackedTexture.SetRuntimeTexture(texture2D) end
```

### `SortTargets`
- Source: `docs.txt:916`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function PackedTexture.SortTargets() end
```

### `TryDrawBounds`
- Source: `docs.txt:923`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param boundsTexture Texture2D
---@param live2DControllers ModCreationLive2DControllersContainer
---@return boolean
function PackedTexture.TryDrawBounds(boundsTexture, live2DControllers) end
```

## PackedTextureJson

- Source type: `PackedTexturesContainer+PackedTextureJson`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PackedTextureJson
```

### `__new`
- Source: `docs.txt:905`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return PackedTextureJson
function PackedTextureJson.__new() end
```

## PackedTexturePartLayer

- Source type: `Live2DController+Part+PackedTexturePartLayer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PackedTexturePartLayer
```

### `__new`
- Source: `docs.txt:2618`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param layer integer
---@param color Color
---@param drawable PackedDrawable
---@param texture PackedTexture
---@param relatedItem Item
---@return PackedTexturePartLayer
function PackedTexturePartLayer.__new(layer, color, drawable, texture, relatedItem) end
```

### `Draw`
- Source: `docs.txt:2619`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param part Part
---@param mainTexture Texture
---@param targetRect Rect
function PackedTexturePartLayer.Draw(part, mainTexture, targetRect) end
```

## PackedTexturesContainer

- Source type: `PackedTexturesContainer`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Dump fallback: `dump/GameAssembly/PackedTexturesContainer.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class PackedTexturesContainer
```

### `AddAllTexturesTarget`
- Source: `docs.txt:996`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param target string
function PackedTexturesContainer.AddAllTexturesTarget(target) end
```

### `AreVanillaLayersIncluded`
- Source: `docs.txt:981`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param controller string
---@return boolean
function PackedTexturesContainer.AreVanillaLayersIncluded(controller) end
```

### `CheckValidity`
- Source: `docs.txt:998`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return Result
function PackedTexturesContainer.CheckValidity() end
```

### `Clone`
- Source: `docs.txt:990`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return PackedTexturesContainer
function PackedTexturesContainer.Clone() end
```

### `CreateEmpty`
- Source: `docs.txt:988`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return PackedTexturesContainer
function PackedTexturesContainer.CreateEmpty() end
```

### `CreatePackedTexturesFromRenderers`
- Source: `docs.txt:989`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param parts Part[]
---@param targets string[]
---@param layer integer
function PackedTexturesContainer.CreatePackedTexturesFromRenderers(parts, targets, layer) end
```

### `DuplicateLayer`
- Source: `docs.txt:993`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param layer integer
---@param offset integer
function PackedTexturesContainer.DuplicateLayer(layer, offset) end
```

### `DuplicateTexture`
- Source: `docs.txt:992`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param packedTexture PackedTexture
---@param offset integer
function PackedTexturesContainer.DuplicateTexture(packedTexture, offset) end
```

### `GetAffectedControllers`
- Source: `docs.txt:978`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return any[]
function PackedTexturesContainer.GetAffectedControllers() end
```

### `GetLuaNameUsingAffectedControllersId`
- Source: `docs.txt:980`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function PackedTexturesContainer.GetLuaNameUsingAffectedControllersId() end
```

### `GetNameUsingAffectedControllersId`
- Source: `docs.txt:979`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function PackedTexturesContainer.GetNameUsingAffectedControllersId() end
```

### `GetPackedDrawablesByTarget`
- Source: `docs.txt:973`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param target ControllerEnum
---@return any[]
function PackedTexturesContainer.GetPackedDrawablesByTarget(target) end
```

### `GetPackedDrawablesByTarget`
- Source: `docs.txt:974`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param id string
---@return any[]
function PackedTexturesContainer.GetPackedDrawablesByTarget(id) end
```

### `GetRelated`
- Source: `docs.txt:975`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param target string
---@param rendererName string
---@return any[]
function PackedTexturesContainer.GetRelated(target, rendererName) end
```

### `HasDrawable`
- Source: `docs.txt:976`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param target string
---@param name string
---@return boolean
function PackedTexturesContainer.HasDrawable(target, name) end
```

### `JoinLayer`
- Source: `docs.txt:994`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param layer integer
---@param packedTextureTargets string[]
function PackedTexturesContainer.JoinLayer(layer, packedTextureTargets) end
```

### `LoadFromModFiles`
- Source: `docs.txt:986`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param formatPath string
---@param modfiles ReadOnlyCollection
---@return PackedTexturesContainer
function PackedTexturesContainer.LoadFromModFiles(formatPath, modfiles) end
```

### `LoadFromPath`
- Source: `docs.txt:987`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param path string
---@return PackedTexturesContainer
function PackedTexturesContainer.LoadFromPath(path) end
```

### `Optimize`
- Source: `docs.txt:997`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param packedTexturesContainers PackedTexturesContainer[]
---@return Result
function PackedTexturesContainer.Optimize(packedTexturesContainers) end
```

### `ReloadTexturesFromFiles`
- Source: `docs.txt:999`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param log StringBuilder
function PackedTexturesContainer.ReloadTexturesFromFiles(log) end
```

### `SaveTexturesToModfiles`
- Source: `docs.txt:983`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param folder string
---@param name string
---@return any[]
function PackedTexturesContainer.SaveTexturesToModfiles(folder, name) end
```

### `SaveToModfiles`
- Source: `docs.txt:984`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param path string
---@return any[]
function PackedTexturesContainer.SaveToModfiles(path) end
```

### `SaveToPath`
- Source: `docs.txt:985`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param path string
function PackedTexturesContainer.SaveToPath(path) end
```

### `Sort`
- Source: `docs.txt:991`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function PackedTexturesContainer.Sort() end
```

### `SplitTexture`
- Source: `docs.txt:995`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param packedDrawables PackedDrawable[]
---@param packedTexture PackedTexture
function PackedTexturesContainer.SplitTexture(packedDrawables, packedTexture) end
```

### `TextureNameGenerator`
- Source: `docs.txt:982`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@param index integer
---@param layer integer
---@return string
function PackedTexturesContainer.TextureNameGenerator(name, index, layer) end
```

### `ToJson`
- Source: `docs.txt:977`, `rawdump/Il2CppGameAssembly/Il2Cpp/PackedTexturesContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function PackedTexturesContainer.ToJson() end
```

## PackedTexturesContainerJson

- Source type: `PackedTexturesContainer+PackedTexturesContainerJson`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PackedTexturesContainerJson
```

### `__new`
- Source: `docs.txt:900`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return PackedTexturesContainerJson
function PackedTexturesContainerJson.__new() end
```

## ParameterLive2DControllerItemModifier

- Source type: `Live2DController+ParameterLive2DControllerItemModifier`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ParameterLive2DControllerItemModifier
```

### `__new`
- Source: `docs.txt:2965`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param parameters Data[]
---@return ParameterLive2DControllerItemModifier
function ParameterLive2DControllerItemModifier.__new(parameters) end
```

### `Activate`
- Source: `docs.txt:2968`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param live2DController Live2DController
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function ParameterLive2DControllerItemModifier.Activate(live2DController, type) end
```

### `Deactivate`
- Source: `docs.txt:2969`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param live2DController Live2DController
function ParameterLive2DControllerItemModifier.Deactivate(live2DController) end
```

### `FixedUpdate`
- Source: `docs.txt:2966`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param live2DController Live2DController
function ParameterLive2DControllerItemModifier.FixedUpdate(live2DController) end
```

### `OnReactivate`
- Source: `docs.txt:2967`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param live2DController Live2DController
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function ParameterLive2DControllerItemModifier.OnReactivate(live2DController, type) end
```

## Part

- Source type: `Live2DController+Part`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class Part
```

### `__new`
- Source: `docs.txt:2646`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param cubismRenderer CubismRenderer
---@param owner Live2DController
---@return Part
function Part.__new(cubismRenderer, owner) end
```

### `__new`
- Source: `docs.txt:2647`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param cubismDrawable CubismDrawable
---@param owner Live2DController
---@return Part
function Part.__new(cubismDrawable, owner) end
```

### `AddLayers`
- Source: `docs.txt:2656`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param itemWithCurrentData ItemWithCurrentData
---@param packedTexture PackedTexture
---@param packedDrawable PackedDrawable
function Part.AddLayers(itemWithCurrentData, packedTexture, packedDrawable) end
```

### `AddVanilla`
- Source: `docs.txt:2655`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param itemData ItemWithCurrentData
---@param color Color
function Part.AddVanilla(itemData, color) end
```

### `CalculateApproximateWorldRect`
- Source: `docs.txt:2664`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return Rect
function Part.CalculateApproximateWorldRect() end
```

### `CalculateWorldBoundsCenter`
- Source: `docs.txt:2665`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return Vector2
function Part.CalculateWorldBoundsCenter() end
```

### `Clear`
- Source: `docs.txt:2650`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Part.Clear() end
```

### `Draw`
- Source: `docs.txt:2661`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param targetRectInTexture Rect
function Part.Draw(targetRectInTexture) end
```

### `DrawRuntime`
- Source: `docs.txt:2659`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param targetRect Rect
---@param texture Texture
function Part.DrawRuntime(targetRect, texture) end
```

### `DrawRuntimeWithClear`
- Source: `docs.txt:2658`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param targetRect Rect
---@param texture Texture
function Part.DrawRuntimeWithClear(targetRect, texture) end
```

### `GetRandomTriangleUniformlyByArea`
- Source: `docs.txt:2648`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return integer
function Part.GetRandomTriangleUniformlyByArea() end
```

### `InitRelatedElementColoringGroup`
- Source: `docs.txt:2653`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param relatedElementColoringGroup ElementColoringGroup
function Part.InitRelatedElementColoringGroup(relatedElementColoringGroup) end
```

### `MarkAsSkinnedClone`
- Source: `docs.txt:2662`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Part.MarkAsSkinnedClone() end
```

### `NeedsRedrawing`
- Source: `docs.txt:2652`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function Part.NeedsRedrawing() end
```

### `NeedsToBeDrawn`
- Source: `docs.txt:2651`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function Part.NeedsToBeDrawn() end
```

### `PrepareForDrawing`
- Source: `docs.txt:2649`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
function Part.PrepareForDrawing() end
```

### `SetActive`
- Source: `docs.txt:2660`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param active boolean
function Part.SetActive(active) end
```

### `SetColoringGroup`
- Source: `docs.txt:2663`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param coloringGroup ColoringGroup
function Part.SetColoringGroup(coloringGroup) end
```

### `SetShader`
- Source: `docs.txt:2657`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param shader Shader
---@param customShaderMaterial fun(arg1: Material, arg2: any[])
---@param objectsReferencedByShaders any[]
function Part.SetShader(shader, customShaderMaterial, objectsReferencedByShaders) end
```

### `TryGetVanillaLayer`
- Source: `docs.txt:2654`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param layer PartLayer
---@return boolean
function Part.TryGetVanillaLayer(layer) end
```

## Particle

- Source type: `UnityEngine.ParticleSystem+Particle`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class Particle
```

### `__new`
- Source: `docs.txt:4955`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Particle
function Particle.__new() end
```

### `GetCurrentColor`
- Source: `docs.txt:4957`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param system ParticleSystem
---@return Color32
function Particle.GetCurrentColor(system) end
```

### `GetCurrentSize`
- Source: `docs.txt:4956`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param system ParticleSystem
---@return number
function Particle.GetCurrentSize(system) end
```

## ParticleSystem

- Source type: `UnityEngine.ParticleSystem`
- Rawdump: `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Dump fallback: `dump/UnityEngine.ParticleSystemModule/UnityEngine/ParticleSystem.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ParticleSystem
```

### `__new`
- Source: `docs.txt:5024`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ParticleSystem
function ParticleSystem.__new() end
```

### `Clear`
- Source: `docs.txt:5041`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param withChildren boolean
function ParticleSystem.Clear(withChildren) end
```

### `Clear`
- Source: `docs.txt:5042`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ParticleSystem.Clear() end
```

### `Emit`
- Source: `docs.txt:5025`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param count integer
function ParticleSystem.Emit(count) end
```

### `Emit`
- Source: `docs.txt:5026`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param emitParams EmitParams
---@param count integer
function ParticleSystem.Emit(emitParams, count) end
```

### `GetParticles`
- Source: `docs.txt:5029`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param particles Particle[]
---@param size integer
---@param offset integer
---@return integer
function ParticleSystem.GetParticles(particles, size, offset) end
```

### `GetParticles`
- Source: `docs.txt:5030`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param particles Particle[]
---@param size integer
---@return integer
function ParticleSystem.GetParticles(particles, size) end
```

### `GetParticles`
- Source: `docs.txt:5031`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param particles Particle[]
---@return integer
function ParticleSystem.GetParticles(particles) end
```

### `IsAlive`
- Source: `docs.txt:5043`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param withChildren boolean
---@return boolean
function ParticleSystem.IsAlive(withChildren) end
```

### `IsAlive`
- Source: `docs.txt:5044`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return boolean
function ParticleSystem.IsAlive() end
```

### `Pause`
- Source: `docs.txt:5036`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param withChildren boolean
function ParticleSystem.Pause(withChildren) end
```

### `Pause`
- Source: `docs.txt:5037`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ParticleSystem.Pause() end
```

### `Play`
- Source: `docs.txt:5034`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param withChildren boolean
function ParticleSystem.Play(withChildren) end
```

### `Play`
- Source: `docs.txt:5035`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ParticleSystem.Play() end
```

### `SetParticles`
- Source: `docs.txt:5027`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param particles Particle[]
---@param size integer
---@param offset integer
function ParticleSystem.SetParticles(particles, size, offset) end
```

### `SetParticles`
- Source: `docs.txt:5028`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param particles Particle[]
---@param size integer
function ParticleSystem.SetParticles(particles, size) end
```

### `Simulate`
- Source: `docs.txt:5032`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param t number
---@param withChildren boolean
---@param restart boolean
---@param fixedTimeStep boolean
function ParticleSystem.Simulate(t, withChildren, restart, fixedTimeStep) end
```

### `Simulate`
- Source: `docs.txt:5033`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param t number
---@param withChildren boolean
---@param restart boolean
function ParticleSystem.Simulate(t, withChildren, restart) end
```

### `Stop`
- Source: `docs.txt:5038`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param withChildren boolean
---@param stopBehavior ParticleSystemStopBehavior
function ParticleSystem.Stop(withChildren, stopBehavior) end
```

### `Stop`
- Source: `docs.txt:5039`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param withChildren boolean
function ParticleSystem.Stop(withChildren) end
```

### `Stop`
- Source: `docs.txt:5040`, `rawdump/UnityEngine.ParticleSystemModule/ParticleSystem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ParticleSystem.Stop() end
```

## ParticleSystemGroup

- Source type: `ParticleSystemGroup`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ParticleSystemGroup.cs`
- Dump fallback: `dump/GameAssembly/ParticleSystemGroup.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ParticleSystemGroup
```

### `__new`
- Source: `docs.txt:5084`, `rawdump/Il2CppGameAssembly/Il2Cpp/ParticleSystemGroup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ParticleSystemGroup
function ParticleSystemGroup.__new() end
```

### `ApplyToAll`
- Source: `docs.txt:5085`, `rawdump/Il2CppGameAssembly/Il2Cpp/ParticleSystemGroup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param action fun(arg1: ParticleSystem)
function ParticleSystemGroup.ApplyToAll(action) end
```

### `DisableEmission`
- Source: `docs.txt:5086`, `rawdump/Il2CppGameAssembly/Il2Cpp/ParticleSystemGroup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ParticleSystemGroup.DisableEmission() end
```

### `EmitAll`
- Source: `docs.txt:5089`, `rawdump/Il2CppGameAssembly/Il2Cpp/ParticleSystemGroup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param count integer
function ParticleSystemGroup.EmitAll(count) end
```

### `EmitFirstN`
- Source: `docs.txt:5092`, `rawdump/Il2CppGameAssembly/Il2Cpp/ParticleSystemGroup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param counts integer[]
function ParticleSystemGroup.EmitFirstN(counts) end
```

### `EmitFirstThree`
- Source: `docs.txt:5091`, `rawdump/Il2CppGameAssembly/Il2Cpp/ParticleSystemGroup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param count1 integer
---@param count2 integer
---@param count3 integer
function ParticleSystemGroup.EmitFirstThree(count1, count2, count3) end
```

### `EmitFirstTwo`
- Source: `docs.txt:5090`, `rawdump/Il2CppGameAssembly/Il2Cpp/ParticleSystemGroup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param count1 integer
---@param count2 integer
function ParticleSystemGroup.EmitFirstTwo(count1, count2) end
```

### `EmitIndex`
- Source: `docs.txt:5088`, `rawdump/Il2CppGameAssembly/Il2Cpp/ParticleSystemGroup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param index integer
---@param count integer
function ParticleSystemGroup.EmitIndex(index, count) end
```

### `EmitIndexWithDirection`
- Source: `docs.txt:5087`, `rawdump/Il2CppGameAssembly/Il2Cpp/ParticleSystemGroup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param index integer
---@param count integer
---@param directionNormalized Vector3
---@param angleRandomOffset number
function ParticleSystemGroup.EmitIndexWithDirection(index, count, directionNormalized, angleRandomOffset) end
```

### `GetParticleSystem`
- Source: `docs.txt:5093`, `rawdump/Il2CppGameAssembly/Il2Cpp/ParticleSystemGroup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param i integer
---@return ParticleSystem
function ParticleSystemGroup.GetParticleSystem(i) end
```

## PartLayer

- Source type: `Live2DController+Part+PartLayer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PartLayer
```

### `Draw`
- Source: `docs.txt:2601`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param part Part
---@param mainTexture Texture
---@param targetRect Rect
function PartLayer.Draw(part, mainTexture, targetRect) end
```

## PartnerLogosContainer

- Source type: `SpriteTextureDataGenerated+PartnerLogosContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PartnerLogosContainer
```

### `__new`
- Source: `docs.txt:5556`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return PartnerLogosContainer
function PartnerLogosContainer.__new() end
```

## PcIconsContainer

- Source type: `SpriteTextureDataGenerated+PcIconsContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PcIconsContainer
```

### `__new`
- Source: `docs.txt:5838`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return PcIconsContainer
function PcIconsContainer.__new() end
```

## PCMReaderCallback

- Source type: `UnityEngine.AudioClip+PCMReaderCallback`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PCMReaderCallback
```

### `Invoke`
- Source: `docs.txt:5487`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param data number[]
function PCMReaderCallback.Invoke(data) end
```

## PCMSetPositionCallback

- Source type: `UnityEngine.AudioClip+PCMSetPositionCallback`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PCMSetPositionCallback
```

### `Invoke`
- Source: `docs.txt:5493`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param position integer
function PCMSetPositionCallback.Invoke(position) end
```

## PersonalityIndexAttribute

- Source type: `StorySingleton+PersonalityIndexAttribute`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PersonalityIndexAttribute
```

### `__new`
- Source: `docs.txt:6116`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param index integer
---@return PersonalityIndexAttribute
function PersonalityIndexAttribute.__new(index) end
```

## PersonalityModuleDefinition

- Source type: `StorySingleton+PersonalityModuleDefinition`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PersonalityModuleDefinition
```

### `AddItem`
- Source: `docs.txt:6673`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param gameId GameId
function PersonalityModuleDefinition.AddItem(gameId) end
```

### `GetAllPersonalityModifiableTags`
- Source: `docs.txt:6672`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param storySingleton StorySingleton
---@return any[]
function PersonalityModuleDefinition.GetAllPersonalityModifiableTags(storySingleton) end
```

## PersonalitySourceIgnoreAttribute

- Source type: `StorySingleton+PersonalitySourceIgnoreAttribute`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PersonalitySourceIgnoreAttribute
```

### `__new`
- Source: `docs.txt:6111`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return PersonalitySourceIgnoreAttribute
function PersonalitySourceIgnoreAttribute.__new() end
```

## PlanningData

- Source type: `EventManager+PlanningData`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class PlanningData
```

### `__new`
- Source: `docs.txt:2406`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return PlanningData
function PlanningData.__new() end
```

### `GetPlannedTime`
- Source: `docs.txt:2409`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param currentTime integer
---@return integer
function PlanningData.GetPlannedTime(currentTime) end
```

### `PlanningInfo`
- Source: `docs.txt:2407`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function PlanningData.PlanningInfo() end
```

### `PlanningInfoShort`
- Source: `docs.txt:2408`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function PlanningData.PlanningInfoShort() end
```

## QualityDescriptor

- Source type: `Item+QualityDescriptor`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class QualityDescriptor
```

### `__new`
- Source: `docs.txt:406`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param minQuality number
---@param simpleLocalizedString SimpleLocalizedString
---@return QualityDescriptor
function QualityDescriptor.__new(minQuality, simpleLocalizedString) end
```

## R

- Source type: `R`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/R.cs`
- Dump fallback: `dump/GameAssembly/R.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class R
```

### `__new`
- Source: `docs.txt:4323`, `rawdump/Il2CppGameAssembly/Il2Cpp/R.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return R
function R.__new() end
```

### `RegisterLua`
- Source: `docs.txt:4324`, `rawdump/Il2CppGameAssembly/Il2Cpp/R.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param globalsTable Table
function R.RegisterLua(globalsTable) end
```

## Recipe

- Source type: `Recipe`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/Recipe.cs`
- Dump fallback: `dump/GameAssembly/Recipe.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class Recipe
```

### `__new`
- Source: `docs.txt:4250`, `rawdump/Il2CppGameAssembly/Il2Cpp/Recipe.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param expectedResult GameId
---@param createDishItemFunc fun(arg1: CookingResults, arg2: Item[]): Item
---@return Recipe
function Recipe.__new(expectedResult, createDishItemFunc) end
```

### `AddIngredient`
- Source: `docs.txt:4253`, `rawdump/Il2CppGameAssembly/Il2Cpp/Recipe.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param recipeIngredient RecipeIngredient
function Recipe.AddIngredient(recipeIngredient) end
```

### `AddIngredientExact`
- Source: `docs.txt:4254`, `rawdump/Il2CppGameAssembly/Il2Cpp/Recipe.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param itemEnum ItemEnum
---@param count integer
---@param isOptional boolean
function Recipe.AddIngredientExact(itemEnum, count, isOptional) end
```

### `AddIngredientExact`
- Source: `docs.txt:4255`, `rawdump/Il2CppGameAssembly/Il2Cpp/Recipe.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param gameId GameId
---@param count integer
---@param isOptional boolean
function Recipe.AddIngredientExact(gameId, count, isOptional) end
```

### `AddIngredientFishMinWeight`
- Source: `docs.txt:4257`, `rawdump/Il2CppGameAssembly/Il2Cpp/Recipe.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param minWeight number
---@param count integer
---@param isOptional boolean
function Recipe.AddIngredientFishMinWeight(minWeight, count, isOptional) end
```

### `AddIngredientGenericType`
- Source: `docs.txt:4256`, `rawdump/Il2CppGameAssembly/Il2Cpp/Recipe.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param type EdibleTypeEnum
---@param count integer
---@param isOptional boolean
function Recipe.AddIngredientGenericType(type, count, isOptional) end
```

### `CreateDish`
- Source: `docs.txt:4252`, `rawdump/Il2CppGameAssembly/Il2Cpp/Recipe.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param results CookingResults
---@param usedItems Item[]
---@return Item
function Recipe.CreateDish(results, usedItems) end
```

### `CreateInstance`
- Source: `docs.txt:4251`, `rawdump/Il2CppGameAssembly/Il2Cpp/Recipe.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param expectedResult GameId
---@return Recipe
function Recipe.CreateInstance(expectedResult) end
```

## Result

- Source type: `Result`
- Rawdump: `rawdump/Il2CppIC.Utility.Runtime/Result.cs`
- Dump fallback: `dump/IC.Utility.Runtime/Result.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class Result
```

### `__toResult`
- Source: `docs.txt:6091`, `rawdump/Il2CppIC.Utility.Runtime/Result.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value boolean
---@return Result
function Result.__toResult(value) end
```

### `All`
- Source: `docs.txt:6096`, `rawdump/Il2CppIC.Utility.Runtime/Result.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param results Result[]
---@param prefix string
---@return CompoundResult
function Result.All(results, prefix) end
```

### `CreateFromBool`
- Source: `docs.txt:6092`, `rawdump/Il2CppIC.Utility.Runtime/Result.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param value boolean
---@return SimpleResult
function Result.CreateFromBool(value) end
```

### `CreateFromBool`
- Source: `docs.txt:6093`, `rawdump/Il2CppIC.Utility.Runtime/Result.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param value boolean
---@param description string
---@return SimpleResult
function Result.CreateFromBool(value, description) end
```

### `CreateNewWithPrefix`
- Source: `docs.txt:6101`, `rawdump/Il2CppIC.Utility.Runtime/Result.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param prefix string
---@return SimpleResult
function Result.CreateNewWithPrefix(prefix) end
```

### `DebugLogError`
- Source: `docs.txt:6098`, `rawdump/Il2CppIC.Utility.Runtime/Result.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Result.DebugLogError() end
```

### `DebugLogIfFail`
- Source: `docs.txt:6097`, `rawdump/Il2CppIC.Utility.Runtime/Result.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Result.DebugLogIfFail() end
```

### `FailWithDescription`
- Source: `docs.txt:6095`, `rawdump/Il2CppIC.Utility.Runtime/Result.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param description string
---@return SimpleResult
function Result.FailWithDescription(description) end
```

### `FromException`
- Source: `docs.txt:6102`, `rawdump/Il2CppIC.Utility.Runtime/Result.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param specialParsingException Exception
---@return ExceptionResult
function Result.FromException(specialParsingException) end
```

### `GetDescription`
- Source: `docs.txt:6099`, `rawdump/Il2CppIC.Utility.Runtime/Result.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function Result.GetDescription() end
```

### `SuccessWithDescription`
- Source: `docs.txt:6094`, `rawdump/Il2CppIC.Utility.Runtime/Result.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param description string
---@return SimpleResult
function Result.SuccessWithDescription(description) end
```

### `ToString`
- Source: `docs.txt:6100`, `rawdump/Il2CppIC.Utility.Runtime/Result.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return string
function Result.ToString() end
```

## RobotPersonalityDefinition

- Source type: `StorySingleton+RobotPersonalityDefinition`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class RobotPersonalityDefinition
```

### `__new`
- Source: `docs.txt:6694`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param storySingleton StorySingleton
---@return RobotPersonalityDefinition
function RobotPersonalityDefinition.__new(storySingleton) end
```

## RobotPersonalityModuleConversations

- Source type: `StorySingleton+RobotPersonalityModuleConversations`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class RobotPersonalityModuleConversations
```

### `__new`
- Source: `docs.txt:6294`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return RobotPersonalityModuleConversations
function RobotPersonalityModuleConversations.__new() end
```

## Route

- Source type: `StoryBlockTarget+Route`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class Route
```

### `__new`
- Source: `docs.txt:7265`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Route
function Route.__new() end
```

### `AddStep`
- Source: `docs.txt:7266`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param step Step
function Route.AddStep(step) end
```

### `Describe`
- Source: `docs.txt:7268`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param sb StringBuilder
function Route.Describe(sb) end
```

### `MakeCopy`
- Source: `docs.txt:7267`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Route
function Route.MakeCopy() end
```

## SaveContainer

- Source type: `SaveContainer`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Dump fallback: `dump/GameAssembly/SaveContainer.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class SaveContainer
```

### `__new`
- Source: `docs.txt:7430`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return SaveContainer
function SaveContainer.__new() end
```

### `AddGlobalFlag`
- Source: `docs.txt:7439`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Adiciona global flag.
---@param flagName string
function SaveContainer.AddGlobalFlag(flagName) end
```

### `BeginSaveToJson`
- Source: `docs.txt:7456`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveContainer.BeginSaveToJson() end
```

### `CheckIfUnseenStoryTextIdReport`
- Source: `docs.txt:7443`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param id integer
---@return boolean
function SaveContainer.CheckIfUnseenStoryTextIdReport(id) end
```

### `ClearDirty`
- Source: `docs.txt:7432`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveContainer.ClearDirty() end
```

### `DeleteSlot`
- Source: `docs.txt:7451`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param shownSaveData SaveSlotData
function SaveContainer.DeleteSlot(shownSaveData) end
```

### `DeleteSlot`
- Source: `docs.txt:7452`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot integer
---@param saveType SaveType
function SaveContainer.DeleteSlot(slot, saveType) end
```

### `DoAutosave`
- Source: `docs.txt:7447`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return integer
function SaveContainer.DoAutosave() end
```

### `EndSaveToJson`
- Source: `docs.txt:7457`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveContainer.EndSaveToJson() end
```

### `GetLatestSlot`
- Source: `docs.txt:7449`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param saveType SaveType
---@return SaveSlotData
function SaveContainer.GetLatestSlot(saveType) end
```

### `GetPercentageOfSeenStoryText`
- Source: `docs.txt:7442`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return number
function SaveContainer.GetPercentageOfSeenStoryText() end
```

### `GetSaveSlotReadonly`
- Source: `docs.txt:7448`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param saveType SaveType
---@return any[]
function SaveContainer.GetSaveSlotReadonly(saveType) end
```

### `HasAchievement`
- Source: `docs.txt:7438`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@return boolean
function SaveContainer.HasAchievement(name) end
```

### `HasGlobalFlag`
- Source: `docs.txt:7441`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Retorna se possui global flag.
---@param flagName string
---@return boolean
function SaveContainer.HasGlobalFlag(flagName) end
```

### `IsDirty`
- Source: `docs.txt:7433`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return boolean
function SaveContainer.IsDirty() end
```

### `MarkDirty`
- Source: `docs.txt:7431`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveContainer.MarkDirty() end
```

### `OnAfterDeserialize`
- Source: `docs.txt:7459`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveContainer.OnAfterDeserialize() end
```

### `OnAfterDeserialize_StoryTextIds`
- Source: `docs.txt:7445`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveContainer.OnAfterDeserialize_StoryTextIds() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:7458`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveContainer.OnBeforeSerialize() end
```

### `OnBeforeSerialize_StoryTextIds`
- Source: `docs.txt:7444`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveContainer.OnBeforeSerialize_StoryTextIds() end
```

### `OverrideSlot`
- Source: `docs.txt:7454`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param saveSlotData SaveSlotData
function SaveContainer.OverrideSlot(saveSlotData) end
```

### `PushSlotChangesToFiles`
- Source: `docs.txt:7455`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveContainer.PushSlotChangesToFiles() end
```

### `RemoveAchievement`
- Source: `docs.txt:7437`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
function SaveContainer.RemoveAchievement(name) end
```

### `ReportWebsiteSeen`
- Source: `docs.txt:7434`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param address string
function SaveContainer.ReportWebsiteSeen(address) end
```

### `SlotExists`
- Source: `docs.txt:7453`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot integer
---@param saveType SaveType
---@return boolean
function SaveContainer.SlotExists(slot, saveType) end
```

### `TryGetGlobalFlag`
- Source: `docs.txt:7440`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param flagName string
---@param globalFlag GlobalFlag
---@return boolean
function SaveContainer.TryGetGlobalFlag(flagName, globalFlag) end
```

### `TryGetSlot`
- Source: `docs.txt:7450`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot integer
---@param saveType SaveType
---@param saveSlotData SaveSlotData
---@return boolean
function SaveContainer.TryGetSlot(slot, saveType, saveSlotData) end
```

### `TrySaveFromCurrentGameState`
- Source: `docs.txt:7446`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot integer
---@param newSave SaveSlotData
---@return boolean
function SaveContainer.TrySaveFromCurrentGameState(slot, newSave) end
```

### `UnlockAchievement`
- Source: `docs.txt:7436`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
function SaveContainer.UnlockAchievement(name) end
```

### `ValidateAfterLoadingFromString`
- Source: `docs.txt:7460`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function SaveContainer.ValidateAfterLoadingFromString() end
```

### `ValidateVisitedWebsites`
- Source: `docs.txt:7435`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveContainer.ValidateVisitedWebsites() end
```

## SaveSingleton

- Source type: `SaveSingleton`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/SaveSingleton.cs`
- Dump fallback: `dump/GameAssembly/SaveSingleton.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class SaveSingleton
```

### `__new`
- Source: `docs.txt:7371`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return SaveSingleton
function SaveSingleton.__new() end
```

### `GetDependenciesArray`
- Source: `docs.txt:7372`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return Type[]
function SaveSingleton.GetDependenciesArray() end
```

### `GetSaveContainerAsString`
- Source: `docs.txt:7374`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function SaveSingleton.GetSaveContainerAsString() end
```

### `ReplaceSaveContainer`
- Source: `docs.txt:7377`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param save SaveContainer
function SaveSingleton.ReplaceSaveContainer(save) end
```

### `ResetAllData`
- Source: `docs.txt:7376`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveSingleton.ResetAllData() end
```

### `SaveAllChanges`
- Source: `docs.txt:7375`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
function SaveSingleton.SaveAllChanges() end
```

### `TryLoadSaveContainerFromString`
- Source: `docs.txt:7373`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param saveString string
---@param save SaveContainer
---@return SaveContainerLoadResult
function SaveSingleton.TryLoadSaveContainerFromString(saveString, save) end
```

### `TryMakeAutoSave`
- Source: `docs.txt:7378`, `rawdump/Il2CppGameAssembly/Il2Cpp/SaveSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveSingleton.TryMakeAutoSave() end
```

## SaveSlotData

- Source type: `SaveContainer+SaveSlotData`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class SaveSlotData
```

### `BeginSaveToJson`
- Source: `docs.txt:7413`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveSlotData.BeginSaveToJson() end
```

### `EndSaveToJson`
- Source: `docs.txt:7414`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveSlotData.EndSaveToJson() end
```

### `EnsureSaveType`
- Source: `docs.txt:7412`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param saveType SaveType
function SaveSlotData.EnsureSaveType(saveType) end
```

### `FromGameVariablesNow`
- Source: `docs.txt:7409`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slotZeroIndexed integer
---@param gameVariables GameVariables
---@return SaveSlotData
function SaveSlotData.FromGameVariablesNow(slotZeroIndexed, gameVariables) end
```

### `GetDescription`
- Source: `docs.txt:7411`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function SaveSlotData.GetDescription() end
```

### `PushToFileIfNeeded`
- Source: `docs.txt:7415`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SaveSlotData.PushToFileIfNeeded() end
```

### `SetNotes`
- Source: `docs.txt:7410`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param newNotes string
function SaveSlotData.SetNotes(newNotes) end
```

### `TryGetAsGameVariables`
- Source: `docs.txt:7417`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param gameVariables GameVariables
---@return Result
function SaveSlotData.TryGetAsGameVariables(gameVariables) end
```

### `TryGetSaveDataString`
- Source: `docs.txt:7416`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param saveDataString string
---@return Result
function SaveSlotData.TryGetSaveDataString(saveDataString) end
```

### `TryLoad`
- Source: `docs.txt:7418`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param lpd LoadProcedureData
---@return Result
function SaveSlotData.TryLoad(lpd) end
```

## ScratchPartData

- Source type: `Live2DController+Part+ScratchPartLayer+ScratchPartData`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ScratchPartData
```

### `__new`
- Source: `docs.txt:2629`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@return ScratchPartData
function ScratchPartData.__new(item) end
```

## ScratchPartLayer

- Source type: `Live2DController+Part+ScratchPartLayer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ScratchPartLayer
```

### `__new`
- Source: `docs.txt:2635`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param layer integer
---@param data ScratchPartData
---@param relatedItem Item
---@return ScratchPartLayer
function ScratchPartLayer.__new(layer, data, relatedItem) end
```

### `Draw`
- Source: `docs.txt:2636`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param part Part
---@param mainTexture Texture
---@param targetRect Rect
function ScratchPartLayer.Draw(part, mainTexture, targetRect) end
```

## SerializableDeliveryData

- Source type: `DeliveryManager+SerializableDeliveryData`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class SerializableDeliveryData
```

### `__new`
- Source: `docs.txt:2507`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param timeTillDelivery integer
---@param sender SimpleLocalizedString
---@param items Item[]
---@return SerializableDeliveryData
function SerializableDeliveryData.__new(timeTillDelivery, sender, items) end
```

## SerializableDictStringDialogueChainMemory

- Source type: `GameVariables+SerializableDictStringDialogueChainMemory`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class SerializableDictStringDialogueChainMemory
```

### `__new`
- Source: `docs.txt:2044`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return SerializableDictStringDialogueChainMemory
function SerializableDictStringDialogueChainMemory.__new() end
```

## Shader

- Source type: `UnityEngine.Shader`
- Rawdump: `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Dump fallback: `dump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class Shader
```

### `DisableKeyword`
- Source: `docs.txt:5140`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param keyword string
function Shader.DisableKeyword(keyword) end
```

### `DisableKeyword`
- Source: `docs.txt:5141`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param keyword GlobalKeyword
function Shader.DisableKeyword(keyword) end
```

### `EnableKeyword`
- Source: `docs.txt:5138`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param keyword string
function Shader.EnableKeyword(keyword) end
```

### `EnableKeyword`
- Source: `docs.txt:5139`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param keyword GlobalKeyword
function Shader.EnableKeyword(keyword) end
```

### `Find`
- Source: `docs.txt:5137`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@return Shader
function Shader.Find(name) end
```

### `FindPassTagValue`
- Source: `docs.txt:5149`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param passIndex integer
---@param tagName ShaderTagId
---@return ShaderTagId
function Shader.FindPassTagValue(passIndex, tagName) end
```

### `FindPassTagValue`
- Source: `docs.txt:5150`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param subshaderIndex integer
---@param passIndex integer
---@param tagName ShaderTagId
---@return ShaderTagId
function Shader.FindPassTagValue(subshaderIndex, passIndex, tagName) end
```

### `FindPropertyIndex`
- Source: `docs.txt:5217`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param propertyName string
---@return integer
function Shader.FindPropertyIndex(propertyName) end
```

### `FindSubshaderTagValue`
- Source: `docs.txt:5151`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param subshaderIndex integer
---@param tagName ShaderTagId
---@return ShaderTagId
function Shader.FindSubshaderTagValue(subshaderIndex, tagName) end
```

### `FindTextureStack`
- Source: `docs.txt:5230`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param propertyIndex integer
---@param stackName string
---@param layerIndex integer
---@return boolean
function Shader.FindTextureStack(propertyIndex, stackName, layerIndex) end
```

### `GetDependency`
- Source: `docs.txt:5147`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@return Shader
function Shader.GetDependency(name) end
```

### `GetGlobalColor`
- Source: `docs.txt:5198`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@return Color
function Shader.GetGlobalColor(name) end
```

### `GetGlobalColor`
- Source: `docs.txt:5199`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@return Color
function Shader.GetGlobalColor(nameID) end
```

### `GetGlobalFloat`
- Source: `docs.txt:5192`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@return number
function Shader.GetGlobalFloat(name) end
```

### `GetGlobalFloat`
- Source: `docs.txt:5193`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@return number
function Shader.GetGlobalFloat(nameID) end
```

### `GetGlobalFloatArray`
- Source: `docs.txt:5204`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@return number[]
function Shader.GetGlobalFloatArray(name) end
```

### `GetGlobalFloatArray`
- Source: `docs.txt:5205`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@return number[]
function Shader.GetGlobalFloatArray(nameID) end
```

### `GetGlobalFloatArray`
- Source: `docs.txt:5206`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param values number[]
function Shader.GetGlobalFloatArray(name, values) end
```

### `GetGlobalFloatArray`
- Source: `docs.txt:5207`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param values number[]
function Shader.GetGlobalFloatArray(nameID, values) end
```

### `GetGlobalInt`
- Source: `docs.txt:5190`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@return integer
function Shader.GetGlobalInt(name) end
```

### `GetGlobalInt`
- Source: `docs.txt:5191`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@return integer
function Shader.GetGlobalInt(nameID) end
```

### `GetGlobalInteger`
- Source: `docs.txt:5194`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@return integer
function Shader.GetGlobalInteger(name) end
```

### `GetGlobalInteger`
- Source: `docs.txt:5195`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@return integer
function Shader.GetGlobalInteger(nameID) end
```

### `GetGlobalMatrix`
- Source: `docs.txt:5200`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@return Matrix4x4
function Shader.GetGlobalMatrix(name) end
```

### `GetGlobalMatrix`
- Source: `docs.txt:5201`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@return Matrix4x4
function Shader.GetGlobalMatrix(nameID) end
```

### `GetGlobalMatrixArray`
- Source: `docs.txt:5212`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@return Matrix4x4[]
function Shader.GetGlobalMatrixArray(name) end
```

### `GetGlobalMatrixArray`
- Source: `docs.txt:5213`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@return Matrix4x4[]
function Shader.GetGlobalMatrixArray(nameID) end
```

### `GetGlobalMatrixArray`
- Source: `docs.txt:5214`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param values Matrix4x4[]
function Shader.GetGlobalMatrixArray(name, values) end
```

### `GetGlobalMatrixArray`
- Source: `docs.txt:5215`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param values Matrix4x4[]
function Shader.GetGlobalMatrixArray(nameID, values) end
```

### `GetGlobalTexture`
- Source: `docs.txt:5202`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@return Texture
function Shader.GetGlobalTexture(name) end
```

### `GetGlobalTexture`
- Source: `docs.txt:5203`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@return Texture
function Shader.GetGlobalTexture(nameID) end
```

### `GetGlobalVector`
- Source: `docs.txt:5196`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@return Vector4
function Shader.GetGlobalVector(name) end
```

### `GetGlobalVector`
- Source: `docs.txt:5197`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@return Vector4
function Shader.GetGlobalVector(nameID) end
```

### `GetGlobalVectorArray`
- Source: `docs.txt:5208`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@return Vector4[]
function Shader.GetGlobalVectorArray(name) end
```

### `GetGlobalVectorArray`
- Source: `docs.txt:5209`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@return Vector4[]
function Shader.GetGlobalVectorArray(nameID) end
```

### `GetGlobalVectorArray`
- Source: `docs.txt:5210`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param values Vector4[]
function Shader.GetGlobalVectorArray(name, values) end
```

### `GetGlobalVectorArray`
- Source: `docs.txt:5211`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param values Vector4[]
function Shader.GetGlobalVectorArray(nameID, values) end
```

### `GetPassCountInSubshader`
- Source: `docs.txt:5148`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param subshaderIndex integer
---@return integer
function Shader.GetPassCountInSubshader(subshaderIndex) end
```

### `GetPropertyAttributes`
- Source: `docs.txt:5223`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param propertyIndex integer
---@return string[]
function Shader.GetPropertyAttributes(propertyIndex) end
```

### `GetPropertyCount`
- Source: `docs.txt:5216`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return integer
function Shader.GetPropertyCount() end
```

### `GetPropertyDefaultFloatValue`
- Source: `docs.txt:5224`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param propertyIndex integer
---@return number
function Shader.GetPropertyDefaultFloatValue(propertyIndex) end
```

### `GetPropertyDefaultIntValue`
- Source: `docs.txt:5227`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param propertyIndex integer
---@return integer
function Shader.GetPropertyDefaultIntValue(propertyIndex) end
```

### `GetPropertyDefaultVectorValue`
- Source: `docs.txt:5225`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param propertyIndex integer
---@return Vector4
function Shader.GetPropertyDefaultVectorValue(propertyIndex) end
```

### `GetPropertyDescription`
- Source: `docs.txt:5221`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param propertyIndex integer
---@return string
function Shader.GetPropertyDescription(propertyIndex) end
```

### `GetPropertyFlags`
- Source: `docs.txt:5222`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param propertyIndex integer
---@return ShaderPropertyFlags
function Shader.GetPropertyFlags(propertyIndex) end
```

### `GetPropertyName`
- Source: `docs.txt:5218`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param propertyIndex integer
---@return string
function Shader.GetPropertyName(propertyIndex) end
```

### `GetPropertyNameId`
- Source: `docs.txt:5219`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param propertyIndex integer
---@return integer
function Shader.GetPropertyNameId(propertyIndex) end
```

### `GetPropertyRangeLimits`
- Source: `docs.txt:5226`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param propertyIndex integer
---@return Vector2
function Shader.GetPropertyRangeLimits(propertyIndex) end
```

### `GetPropertyTextureDefaultName`
- Source: `docs.txt:5229`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param propertyIndex integer
---@return string
function Shader.GetPropertyTextureDefaultName(propertyIndex) end
```

### `GetPropertyTextureDimension`
- Source: `docs.txt:5228`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param propertyIndex integer
---@return TextureDimension
function Shader.GetPropertyTextureDimension(propertyIndex) end
```

### `GetPropertyType`
- Source: `docs.txt:5220`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param propertyIndex integer
---@return ShaderPropertyType
function Shader.GetPropertyType(propertyIndex) end
```

### `IsKeywordEnabled`
- Source: `docs.txt:5142`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param keyword string
---@return boolean
function Shader.IsKeywordEnabled(keyword) end
```

### `IsKeywordEnabled`
- Source: `docs.txt:5143`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param keyword GlobalKeyword
---@return boolean
function Shader.IsKeywordEnabled(keyword) end
```

### `PropertyToID`
- Source: `docs.txt:5146`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@return integer
function Shader.PropertyToID(name) end
```

### `SetGlobalBuffer`
- Source: `docs.txt:5168`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param value ComputeBuffer
function Shader.SetGlobalBuffer(name, value) end
```

### `SetGlobalBuffer`
- Source: `docs.txt:5169`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param value ComputeBuffer
function Shader.SetGlobalBuffer(nameID, value) end
```

### `SetGlobalBuffer`
- Source: `docs.txt:5170`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param value GraphicsBuffer
function Shader.SetGlobalBuffer(name, value) end
```

### `SetGlobalBuffer`
- Source: `docs.txt:5171`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param value GraphicsBuffer
function Shader.SetGlobalBuffer(nameID, value) end
```

### `SetGlobalColor`
- Source: `docs.txt:5160`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param value Color
function Shader.SetGlobalColor(name, value) end
```

### `SetGlobalColor`
- Source: `docs.txt:5161`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param value Color
function Shader.SetGlobalColor(nameID, value) end
```

### `SetGlobalConstantBuffer`
- Source: `docs.txt:5172`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param value ComputeBuffer
---@param offset integer
---@param size integer
function Shader.SetGlobalConstantBuffer(name, value, offset, size) end
```

### `SetGlobalConstantBuffer`
- Source: `docs.txt:5173`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param value ComputeBuffer
---@param offset integer
---@param size integer
function Shader.SetGlobalConstantBuffer(nameID, value, offset, size) end
```

### `SetGlobalConstantBuffer`
- Source: `docs.txt:5174`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param value GraphicsBuffer
---@param offset integer
---@param size integer
function Shader.SetGlobalConstantBuffer(name, value, offset, size) end
```

### `SetGlobalConstantBuffer`
- Source: `docs.txt:5175`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param value GraphicsBuffer
---@param offset integer
---@param size integer
function Shader.SetGlobalConstantBuffer(nameID, value, offset, size) end
```

### `SetGlobalFloat`
- Source: `docs.txt:5154`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param value number
function Shader.SetGlobalFloat(name, value) end
```

### `SetGlobalFloat`
- Source: `docs.txt:5155`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param value number
function Shader.SetGlobalFloat(nameID, value) end
```

### `SetGlobalFloatArray`
- Source: `docs.txt:5178`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param values number[]
function Shader.SetGlobalFloatArray(name, values) end
```

### `SetGlobalFloatArray`
- Source: `docs.txt:5179`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param values number[]
function Shader.SetGlobalFloatArray(nameID, values) end
```

### `SetGlobalFloatArray`
- Source: `docs.txt:5180`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param values number[]
function Shader.SetGlobalFloatArray(name, values) end
```

### `SetGlobalFloatArray`
- Source: `docs.txt:5181`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param values number[]
function Shader.SetGlobalFloatArray(nameID, values) end
```

### `SetGlobalInt`
- Source: `docs.txt:5152`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param value integer
function Shader.SetGlobalInt(name, value) end
```

### `SetGlobalInt`
- Source: `docs.txt:5153`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param value integer
function Shader.SetGlobalInt(nameID, value) end
```

### `SetGlobalInteger`
- Source: `docs.txt:5156`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param value integer
function Shader.SetGlobalInteger(name, value) end
```

### `SetGlobalInteger`
- Source: `docs.txt:5157`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param value integer
function Shader.SetGlobalInteger(nameID, value) end
```

### `SetGlobalMatrix`
- Source: `docs.txt:5162`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param value Matrix4x4
function Shader.SetGlobalMatrix(name, value) end
```

### `SetGlobalMatrix`
- Source: `docs.txt:5163`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param value Matrix4x4
function Shader.SetGlobalMatrix(nameID, value) end
```

### `SetGlobalMatrixArray`
- Source: `docs.txt:5186`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param values Matrix4x4[]
function Shader.SetGlobalMatrixArray(name, values) end
```

### `SetGlobalMatrixArray`
- Source: `docs.txt:5187`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param values Matrix4x4[]
function Shader.SetGlobalMatrixArray(nameID, values) end
```

### `SetGlobalMatrixArray`
- Source: `docs.txt:5188`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param values Matrix4x4[]
function Shader.SetGlobalMatrixArray(name, values) end
```

### `SetGlobalMatrixArray`
- Source: `docs.txt:5189`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param values Matrix4x4[]
function Shader.SetGlobalMatrixArray(nameID, values) end
```

### `SetGlobalRayTracingAccelerationStructure`
- Source: `docs.txt:5176`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param value RayTracingAccelerationStructure
function Shader.SetGlobalRayTracingAccelerationStructure(name, value) end
```

### `SetGlobalRayTracingAccelerationStructure`
- Source: `docs.txt:5177`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param value RayTracingAccelerationStructure
function Shader.SetGlobalRayTracingAccelerationStructure(nameID, value) end
```

### `SetGlobalTexture`
- Source: `docs.txt:5164`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param value Texture
function Shader.SetGlobalTexture(name, value) end
```

### `SetGlobalTexture`
- Source: `docs.txt:5165`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param value Texture
function Shader.SetGlobalTexture(nameID, value) end
```

### `SetGlobalTexture`
- Source: `docs.txt:5166`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param value RenderTexture
---@param element RenderTextureSubElement
function Shader.SetGlobalTexture(name, value, element) end
```

### `SetGlobalTexture`
- Source: `docs.txt:5167`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param value RenderTexture
---@param element RenderTextureSubElement
function Shader.SetGlobalTexture(nameID, value, element) end
```

### `SetGlobalVector`
- Source: `docs.txt:5158`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param value Vector4
function Shader.SetGlobalVector(name, value) end
```

### `SetGlobalVector`
- Source: `docs.txt:5159`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param value Vector4
function Shader.SetGlobalVector(nameID, value) end
```

### `SetGlobalVectorArray`
- Source: `docs.txt:5182`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param values Vector4[]
function Shader.SetGlobalVectorArray(name, values) end
```

### `SetGlobalVectorArray`
- Source: `docs.txt:5183`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param values Vector4[]
function Shader.SetGlobalVectorArray(nameID, values) end
```

### `SetGlobalVectorArray`
- Source: `docs.txt:5184`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@param values Vector4[]
function Shader.SetGlobalVectorArray(name, values) end
```

### `SetGlobalVectorArray`
- Source: `docs.txt:5185`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param nameID integer
---@param values Vector4[]
function Shader.SetGlobalVectorArray(nameID, values) end
```

### `SetKeyword`
- Source: `docs.txt:5144`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param keyword GlobalKeyword
---@param value boolean
function Shader.SetKeyword(keyword, value) end
```

### `WarmupAllShaders`
- Source: `docs.txt:5145`, `rawdump/UnityEngine.CoreModule/UnityEngine/Shader.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Shader.WarmupAllShaders() end
```

## ShaderDataGenerated

- Source type: `ShaderDataGenerated`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ShaderDataGenerated.cs`
- Dump fallback: `dump/GameAssembly/ShaderDataGenerated.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ShaderDataGenerated
```

### `__new`
- Source: `docs.txt:5126`, `rawdump/Il2CppGameAssembly/Il2Cpp/ShaderDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ShaderDataGenerated
function ShaderDataGenerated.__new() end
```

### `OnAfterDeserialize`
- Source: `docs.txt:5128`, `rawdump/Il2CppGameAssembly/Il2Cpp/ShaderDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ShaderDataGenerated.OnAfterDeserialize() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:5127`, `rawdump/Il2CppGameAssembly/Il2Cpp/ShaderDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ShaderDataGenerated.OnBeforeSerialize() end
```

### `RegisterLua`
- Source: `docs.txt:5129`, `rawdump/Il2CppGameAssembly/Il2Cpp/ShaderDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ShaderDataGenerated.RegisterLua() end
```

## ShapeModule

- Source type: `UnityEngine.ParticleSystem+ShapeModule`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ShapeModule
```

### `__new`
- Source: `docs.txt:4931`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ShapeModule
function ShapeModule.__new() end
```

## Shop

- Source type: `Shop`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/Shop.cs`
- Dump fallback: `dump/GameAssembly/Shop.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class Shop
```

### `__new`
- Source: `docs.txt:1750`, `rawdump/Il2CppGameAssembly/Il2Cpp/Shop.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return Shop
function Shop.__new() end
```

### `__new`
- Source: `docs.txt:1751`, `rawdump/Il2CppGameAssembly/Il2Cpp/Shop.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param id string
---@param prefab ShopPrefab
---@return Shop
function Shop.__new(id, prefab) end
```

### `AddItem`
- Source: `docs.txt:1754`, `rawdump/Il2CppGameAssembly/Il2Cpp/Shop.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item ShopItem
function Shop.AddItem(item) end
```

### `BuyItem`
- Source: `docs.txt:1759`, `rawdump/Il2CppGameAssembly/Il2Cpp/Shop.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param shopItem ShopItem
---@param count integer
---@param pricePaid integer
---@return Item
function Shop.BuyItem(shopItem, count, pricePaid) end
```

### `Clear`
- Source: `docs.txt:1752`, `rawdump/Il2CppGameAssembly/Il2Cpp/Shop.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Shop.Clear() end
```

### `GetCompensationData`
- Source: `docs.txt:1756`, `rawdump/Il2CppGameAssembly/Il2Cpp/Shop.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param gameId GameId
---@return integer
function Shop.GetCompensationData(gameId) end
```

### `GetPrice`
- Source: `docs.txt:1753`, `rawdump/Il2CppGameAssembly/Il2Cpp/Shop.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param item ShopItem
---@param count integer
---@return integer
function Shop.GetPrice(item, count) end
```

### `ShowBuyPopup`
- Source: `docs.txt:1758`, `rawdump/Il2CppGameAssembly/Il2Cpp/Shop.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param shopItem ShopItem
---@param count integer
---@param OnPaid fun(arg1: integer)
---@param OnNotBuy fun()
---@param OnNoMoney fun()
function Shop.ShowBuyPopup(shopItem, count, OnPaid, OnNotBuy, OnNoMoney) end
```

### `ShuffleShop`
- Source: `docs.txt:1757`, `rawdump/Il2CppGameAssembly/Il2Cpp/Shop.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function Shop.ShuffleShop() end
```

### `TryGetItemByGuid`
- Source: `docs.txt:1755`, `rawdump/Il2CppGameAssembly/Il2Cpp/Shop.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param originalId Guid
---@param shopItemOut ShopItem
---@return boolean
function Shop.TryGetItemByGuid(originalId, shopItemOut) end
```

## ShopDictionary

- Source type: `ShopManager+ShopDictionary`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ShopDictionary
```

### `__new`
- Source: `docs.txt:1770`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ShopDictionary
function ShopDictionary.__new() end
```

## ShopItem

- Source type: `ShopItem`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ShopItem.cs`
- Dump fallback: `dump/GameAssembly/ShopItem.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ShopItem
```

### `__new`
- Source: `docs.txt:1795`, `rawdump/Il2CppGameAssembly/Il2Cpp/ShopItem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param itemType ShopItemType
---@return ShopItem
function ShopItem.__new(item, itemType) end
```

### `CloneTargetItem`
- Source: `docs.txt:1796`, `rawdump/Il2CppGameAssembly/Il2Cpp/ShopItem.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param count integer
---@return Item
function ShopItem.CloneTargetItem(count) end
```

## ShopManager

- Source type: `ShopManager`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ShopManager.cs`
- Dump fallback: `dump/GameAssembly/ShopManager.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ShopManager
```

### `CreateInstance`
- Source: `docs.txt:1777`, `rawdump/Il2CppGameAssembly/Il2Cpp/ShopManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return ShopManager
function ShopManager.CreateInstance() end
```

### `FillPrefabData`
- Source: `docs.txt:1784`, `rawdump/Il2CppGameAssembly/Il2Cpp/ShopManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ShopManager.FillPrefabData() end
```

### `GetItems`
- Source: `docs.txt:1780`, `rawdump/Il2CppGameAssembly/Il2Cpp/ShopManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param name string
---@return any[]
function ShopManager.GetItems(name) end
```

### `GetShop`
- Source: `docs.txt:1779`, `rawdump/Il2CppGameAssembly/Il2Cpp/ShopManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Retorna shop.
---@param name string
---@return Shop
function ShopManager.GetShop(name) end
```

### `OnAfterDeserialize`
- Source: `docs.txt:1783`, `rawdump/Il2CppGameAssembly/Il2Cpp/ShopManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ShopManager.OnAfterDeserialize() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:1782`, `rawdump/Il2CppGameAssembly/Il2Cpp/ShopManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ShopManager.OnBeforeSerialize() end
```

### `ShuffleShops`
- Source: `docs.txt:1781`, `rawdump/Il2CppGameAssembly/Il2Cpp/ShopManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ShopManager.ShuffleShops() end
```

### `TryGetShop`
- Source: `docs.txt:1778`, `rawdump/Il2CppGameAssembly/Il2Cpp/ShopManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@param shop Shop
---@return boolean
function ShopManager.TryGetShop(name, shop) end
```

## ShowerParticleSystemsContainer

- Source type: `OtherDataGenerated+ShowerParticleSystemsContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ShowerParticleSystemsContainer
```

### `__new`
- Source: `docs.txt:4872`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ShowerParticleSystemsContainer
function ShowerParticleSystemsContainer.__new() end
```

## ShowerParticleSystemsGroupsContainer

- Source type: `OtherDataGenerated+ShowerParticleSystemsGroupsContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class ShowerParticleSystemsGroupsContainer
```

### `__new`
- Source: `docs.txt:4880`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ShowerParticleSystemsGroupsContainer
function ShowerParticleSystemsGroupsContainer.__new() end
```

## SillyCatPersonalityDefinition

- Source type: `StorySingleton+SillyCatPersonalityDefinition`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class SillyCatPersonalityDefinition
```

### `__new`
- Source: `docs.txt:6714`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param storySingleton StorySingleton
---@return SillyCatPersonalityDefinition
function SillyCatPersonalityDefinition.__new(storySingleton) end
```

## SillyCatPersonalityModuleConversations

- Source type: `StorySingleton+SillyCatPersonalityModuleConversations`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class SillyCatPersonalityModuleConversations
```

### `__new`
- Source: `docs.txt:6564`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return SillyCatPersonalityModuleConversations
function SillyCatPersonalityModuleConversations.__new() end
```

## SimpleLocalizedString

- Source type: `SimpleLocalizedString`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/SimpleLocalizedString.cs`
- Dump fallback: `dump/GameAssembly/SimpleLocalizedString.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class SimpleLocalizedString
```

### `__toSimpleLocalizedString`
- Source: `docs.txt:7354`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimpleLocalizedString.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param b TupleReference
---@return SimpleLocalizedString
function SimpleLocalizedString.__toSimpleLocalizedString(b) end
```

### `CreateInstance`
- Source: `docs.txt:7351`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimpleLocalizedString.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param id TupleReference
---@return SimpleLocalizedString
function SimpleLocalizedString.CreateInstance(id) end
```

### `CreateInstance`
- Source: `docs.txt:7352`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimpleLocalizedString.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param tableReference string
---@param tableEntryReference string
---@return SimpleLocalizedString
function SimpleLocalizedString.CreateInstance(tableReference, tableEntryReference) end
```

### `CreateInstanceReplacement`
- Source: `docs.txt:7353`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimpleLocalizedString.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Cria instance replacement e retorna SimpleLocalizedString.
---@param replacement string
---@return SimpleLocalizedString
function SimpleLocalizedString.CreateInstanceReplacement(replacement) end
```

### `GetValue`
- Source: `docs.txt:7348`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimpleLocalizedString.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param arguments any[]
---@return string
function SimpleLocalizedString.GetValue(arguments) end
```

### `GetValueProjectLocale`
- Source: `docs.txt:7349`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimpleLocalizedString.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param arguments any[]
---@return string
function SimpleLocalizedString.GetValueProjectLocale(arguments) end
```

### `ToBakedArgument`
- Source: `docs.txt:7350`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimpleLocalizedString.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function SimpleLocalizedString.ToBakedArgument() end
```

### `ToLuaString`
- Source: `docs.txt:7356`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimpleLocalizedString.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function SimpleLocalizedString.ToLuaString() end
```

### `ToString`
- Source: `docs.txt:7355`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimpleLocalizedString.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return string
function SimpleLocalizedString.ToString() end
```

## SimplePopup

- Source type: `SimplePopup`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/SimplePopup.cs`
- Dump fallback: `dump/GameAssembly/SimplePopup.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class SimplePopup
```

### `__new`
- Source: `docs.txt:7763`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimplePopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return SimplePopup
function SimplePopup.__new() end
```

### `AddLinkHandler`
- Source: `docs.txt:7765`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimplePopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param OnLinkClicked fun(arg1: string)
function SimplePopup.AddLinkHandler(OnLinkClicked) end
```

### `AddLinkHandler`
- Source: `docs.txt:7766`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimplePopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param linkIdToAction table<string, fun()>
function SimplePopup.AddLinkHandler(linkIdToAction) end
```

### `GetButtonList`
- Source: `docs.txt:7764`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimplePopup.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return ButtonList
function SimplePopup.GetButtonList() end
```

### `OnDestroy`
- Source: `docs.txt:7768`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimplePopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SimplePopup.OnDestroy() end
```

### `Open`
- Source: `docs.txt:7767`, `rawdump/Il2CppGameAssembly/Il2Cpp/SimplePopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param title string
---@param text string
---@param choices PopupChoice[]
function SimplePopup.Open(title, text, choices) end
```

## SlotEquipData

- Source type: `SlotEquipData`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Dump fallback: `dump/GameAssembly/SlotEquipData.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Dados modernos de equipamento/slot para ItemPrefab, incluindo slots possiveis, obrigatorios e proibidos.
---@class SlotEquipData
```

### `__new`
- Source: `docs.txt:1449`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return SlotEquipData
function SlotEquipData.__new() end
```

### `AddForbiddenSlotsString`
- Source: `docs.txt:1460`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param forbiddenSlots string[]
function SlotEquipData.AddForbiddenSlotsString(forbiddenSlots) end
```

### `AddForbiddenSlotString`
- Source: `docs.txt:1459`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param forbiddenSlot string
function SlotEquipData.AddForbiddenSlotString(forbiddenSlot) end
```

### `AddRequiredSlotsString`
- Source: `docs.txt:1457`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param requiredSlots string[]
function SlotEquipData.AddRequiredSlotsString(requiredSlots) end
```

### `AddRequiredSlotString`
- Source: `docs.txt:1456`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param requiredSlot string
function SlotEquipData.AddRequiredSlotString(requiredSlot) end
```

### `CanGoInto`
- Source: `docs.txt:1452`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot1 ItemSlot
---@return boolean
function SlotEquipData.CanGoInto(slot1) end
```

### `CanGoInto`
- Source: `docs.txt:1453`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot1 ItemSlot
---@param slot2 ItemSlot
---@return boolean
function SlotEquipData.CanGoInto(slot1, slot2) end
```

### `CanGoInto`
- Source: `docs.txt:1454`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot1 ItemSlot
---@param slot2 ItemSlot
---@param slot3 ItemSlot
---@return boolean
function SlotEquipData.CanGoInto(slot1, slot2, slot3) end
```

### `CanGoInto`
- Source: `docs.txt:1455`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param bodySizeModuleSlots ItemSlot[]
---@return boolean
function SlotEquipData.CanGoInto(bodySizeModuleSlots) end
```

### `Clone`
- Source: `docs.txt:1465`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return SlotEquipData
function SlotEquipData.Clone() end
```

### `CreateInstance`
- Source: `docs.txt:1450`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param slotString string
---@return SlotEquipData
function SlotEquipData.CreateInstance(slotString) end
```

### `FillActiveElementsDefault`
- Source: `docs.txt:1463`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param output string[]
function SlotEquipData.FillActiveElementsDefault(output) end
```

### `FillActiveElementsDefaultPooled`
- Source: `docs.txt:1462`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param elements string[]
---@return any[]
function SlotEquipData.FillActiveElementsDefaultPooled(elements) end
```

### `FillCurrent`
- Source: `docs.txt:1451`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param itemWithCurrentData ItemWithCurrentData
---@param controllerEnumId string
function SlotEquipData.FillCurrent(itemWithCurrentData, controllerEnumId) end
```

### `SetForbiddenSlotsString`
- Source: `docs.txt:1461`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Configura forbidden slots string.
---@param forbiddenSlots string[]
function SlotEquipData.SetForbiddenSlotsString(forbiddenSlots) end
```

### `SetRequiredSlotsString`
- Source: `docs.txt:1458`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Configura required slots string.
---@param requiredSlots string[]
function SlotEquipData.SetRequiredSlotsString(requiredSlots) end
```

### `ToLuaString`
- Source: `docs.txt:1464`, `rawdump/Il2CppGameAssembly/Il2Cpp/SlotEquipData.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function SlotEquipData.ToLuaString() end
```

## SlotManager

- Source type: `ItemSlot+SlotManager`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class SlotManager
```

### `__new`
- Source: `docs.txt:1953`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return SlotManager
function SlotManager.__new() end
```

### `AddSlot`
- Source: `docs.txt:1958`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot ItemSlot
function SlotManager.AddSlot(slot) end
```

### `GetSlot`
- Source: `docs.txt:1956`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param slotId string
---@return ItemSlot
function SlotManager.GetSlot(slotId) end
```

### `GetSlotPossibleNull`
- Source: `docs.txt:1957`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param slotId string
---@return ItemSlot
function SlotManager.GetSlotPossibleNull(slotId) end
```

### `GetSlotType`
- Source: `docs.txt:1954`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param slotId string
---@return SlotType
function SlotManager.GetSlotType(slotId) end
```

### `TryGetSlot`
- Source: `docs.txt:1955`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slotId string
---@param itemSlot ItemSlot
---@return boolean
function SlotManager.TryGetSlot(slotId, itemSlot) end
```

## SlutPersonalityDefinition

- Source type: `StorySingleton+SlutPersonalityDefinition`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class SlutPersonalityDefinition
```

### `__new`
- Source: `docs.txt:6702`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param storySingleton StorySingleton
---@return SlutPersonalityDefinition
function SlutPersonalityDefinition.__new(storySingleton) end
```

## SlutPersonalityModuleConversations

- Source type: `StorySingleton+SlutPersonalityModuleConversations`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class SlutPersonalityModuleConversations
```

### `__new`
- Source: `docs.txt:6402`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return SlutPersonalityModuleConversations
function SlutPersonalityModuleConversations.__new() end
```

## SoundCategory

- Source type: `SoundSingleton+SoundCategory`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class SoundCategory
```

### `__new`
- Source: `docs.txt:7942`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return SoundCategory
function SoundCategory.__new() end
```

### `__new`
- Source: `docs.txt:7943`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@param audioClips AudioClip[]
---@return SoundCategory
function SoundCategory.__new(name, audioClips) end
```

### `GetRandom`
- Source: `docs.txt:7944`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return AudioClip
function SoundCategory.GetRandom() end
```

## SoundContainer

- Source type: `SoundDataGenerated+SoundContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class SoundContainer
```

### `__new`
- Source: `docs.txt:5254`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return SoundContainer
function SoundContainer.__new() end
```

## SoundDataGenerated

- Source type: `SoundDataGenerated`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/SoundDataGenerated.cs`
- Dump fallback: `dump/GameAssembly/SoundDataGenerated.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class SoundDataGenerated
```

### `__new`
- Source: `docs.txt:5476`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return SoundDataGenerated
function SoundDataGenerated.__new() end
```

### `OnAfterDeserialize`
- Source: `docs.txt:5478`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SoundDataGenerated.OnAfterDeserialize() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:5477`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SoundDataGenerated.OnBeforeSerialize() end
```

### `RegisterLua`
- Source: `docs.txt:5479`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SoundDataGenerated.RegisterLua() end
```

## SoundSingleton

- Source type: `SoundSingleton`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Dump fallback: `dump/GameAssembly/SoundSingleton.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class SoundSingleton
```

### `__new`
- Source: `docs.txt:7950`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return SoundSingleton
function SoundSingleton.__new() end
```

### `add_OnMusicChanged`
- Source: `docs.txt:7954`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value fun(arg1: MusicWithInfo)
function SoundSingleton.add_OnMusicChanged(value) end
```

### `CreateSpecialLoop`
- Source: `docs.txt:7973`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param startClip AudioClip
---@param loopClip AudioClip
---@param endClip AudioClip
---@param volume number
---@return SpecialAudioLoop
function SoundSingleton.CreateSpecialLoop(startClip, loopClip, endClip, volume) end
```

### `CurrentMusicOptionsSummary`
- Source: `docs.txt:7953`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function SoundSingleton.CurrentMusicOptionsSummary() end
```

### `GetFreeAudioSource`
- Source: `docs.txt:7970`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return AudioSource
function SoundSingleton.GetFreeAudioSource() end
```

### `GetFreeAudioSource`
- Source: `docs.txt:7971`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param audioSource AudioSource
---@return AudioSourceUsage
function SoundSingleton.GetFreeAudioSource(audioSource) end
```

### `IsPlaying`
- Source: `docs.txt:7961`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param option MusicOption
---@return boolean
function SoundSingleton.IsPlaying(option) end
```

### `Play`
- Source: `docs.txt:7967`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param clip AudioClip
---@param volume number
---@param OnComplete fun()
function SoundSingleton.Play(clip, volume, OnComplete) end
```

### `PlayNextSong`
- Source: `docs.txt:7956`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param continueIfPossible boolean
function SoundSingleton.PlayNextSong(continueIfPossible) end
```

### `PlayRandom`
- Source: `docs.txt:7969`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param volume number
function SoundSingleton.PlayRandom(volume) end
```

### `PlaySlightlyRandomVolume`
- Source: `docs.txt:7966`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param clip AudioClip
function SoundSingleton.PlaySlightlyRandomVolume(clip) end
```

### `PlayWithPitch`
- Source: `docs.txt:7968`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param clip AudioClip
---@param volume number
---@param pitch number
---@param OnComplete fun()
---@return AudioSource
function SoundSingleton.PlayWithPitch(clip, volume, pitch, OnComplete) end
```

### `RegisterMusicOptions`
- Source: `docs.txt:7957`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param options MusicOption[]
function SoundSingleton.RegisterMusicOptions(options) end
```

### `RegisterMusicOptions`
- Source: `docs.txt:7958`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param enumerable MusicOption[]
function SoundSingleton.RegisterMusicOptions(enumerable) end
```

### `RegisterMusicOptions`
- Source: `docs.txt:7959`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param id string
---@param list MusicWithInfo[]
---@param layer MusicOptionLayer
---@param condition fun(): boolean
function SoundSingleton.RegisterMusicOptions(id, list, layer, condition) end
```

### `RegisterMusicOptions`
- Source: `docs.txt:7960`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param id string
---@param list IReference[]
---@param layer MusicOptionLayer
---@param condition fun(): boolean
function SoundSingleton.RegisterMusicOptions(id, list, layer, condition) end
```

### `remove_OnMusicChanged`
- Source: `docs.txt:7955`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value fun(arg1: MusicWithInfo)
function SoundSingleton.remove_OnMusicChanged(value) end
```

### `ReturnToPool`
- Source: `docs.txt:7972`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param source AudioSource
function SoundSingleton.ReturnToPool(source) end
```

### `SetMusicPitch`
- Source: `docs.txt:7952`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param pitch number
function SoundSingleton.SetMusicPitch(pitch) end
```

### `UnregisterAllMusic`
- Source: `docs.txt:7965`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param stopIfPlaying boolean
function SoundSingleton.UnregisterAllMusic(stopIfPlaying) end
```

### `UnregisterMusicOption`
- Source: `docs.txt:7964`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param musicOption MusicOption
---@param stopIfPlaying boolean
function SoundSingleton.UnregisterMusicOption(musicOption, stopIfPlaying) end
```

### `UnregisterMusicOptionsById`
- Source: `docs.txt:7962`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param id IMusicSource
---@param stopIfPlaying boolean
function SoundSingleton.UnregisterMusicOptionsById(id, stopIfPlaying) end
```

### `UnregisterMusicOptionsById`
- Source: `docs.txt:7963`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param id string
---@param stopIfPlaying boolean
function SoundSingleton.UnregisterMusicOptionsById(id, stopIfPlaying) end
```

### `UpdateMusicVolume`
- Source: `docs.txt:7951`, `rawdump/Il2CppGameAssembly/Il2Cpp/SoundSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SoundSingleton.UpdateMusicVolume() end
```

## SpecialVariablesHolder

- Source type: `SpecialVariablesHolder`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Dump fallback: `dump/GameAssembly/SpecialVariablesHolder.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class SpecialVariablesHolder
```

### `__new`
- Source: `docs.txt:870`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return SpecialVariablesHolder
function SpecialVariablesHolder.__new() end
```

### `GetFloatSpecialVariableOrDefault`
- Source: `docs.txt:879`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@param defaultValue number
---@return number
function SpecialVariablesHolder.GetFloatSpecialVariableOrDefault(key, defaultValue) end
```

### `GetIntSpecialVariableOrDefault`
- Source: `docs.txt:873`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@param defaultValue integer
---@return integer
function SpecialVariablesHolder.GetIntSpecialVariableOrDefault(key, defaultValue) end
```

### `GetIntSpecialVariableOrDefaultCastBool`
- Source: `docs.txt:876`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@param defaultValue boolean
---@return boolean
function SpecialVariablesHolder.GetIntSpecialVariableOrDefaultCastBool(key, defaultValue) end
```

### `GetStringSpecialVariableOrDefault`
- Source: `docs.txt:882`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@param defaultValue string
---@return string
function SpecialVariablesHolder.GetStringSpecialVariableOrDefault(key, defaultValue) end
```

### `OnAfterDeserializeSpecialVariableHolder`
- Source: `docs.txt:884`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SpecialVariablesHolder.OnAfterDeserializeSpecialVariableHolder() end
```

### `SetFloatSpecialVariable`
- Source: `docs.txt:877`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@param value number
function SpecialVariablesHolder.SetFloatSpecialVariable(key, value) end
```

### `SetIntSpecialVariable`
- Source: `docs.txt:871`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@param value integer
function SpecialVariablesHolder.SetIntSpecialVariable(key, value) end
```

### `SetIntSpecialVariableCastBool`
- Source: `docs.txt:874`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@param value boolean
function SpecialVariablesHolder.SetIntSpecialVariableCastBool(key, value) end
```

### `SetStringSpecialVariable`
- Source: `docs.txt:880`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param key string
---@param value string
function SpecialVariablesHolder.SetStringSpecialVariable(key, value) end
```

### `TryGetAnySpecialVariable`
- Source: `docs.txt:883`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param key string
---@param value any
---@return boolean
function SpecialVariablesHolder.TryGetAnySpecialVariable(key, value) end
```

### `TryGetFloatSpecialVariable`
- Source: `docs.txt:878`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param key string
---@param value number
---@return boolean
function SpecialVariablesHolder.TryGetFloatSpecialVariable(key, value) end
```

### `TryGetIntSpecialVariable`
- Source: `docs.txt:872`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param key string
---@param value integer
---@return boolean
function SpecialVariablesHolder.TryGetIntSpecialVariable(key, value) end
```

### `TryGetIntSpecialVariableCastBool`
- Source: `docs.txt:875`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param key string
---@param value boolean
---@return boolean
function SpecialVariablesHolder.TryGetIntSpecialVariableCastBool(key, value) end
```

### `TryGetStringSpecialVariable`
- Source: `docs.txt:881`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpecialVariablesHolder.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param key string
---@param value string
---@return boolean
function SpecialVariablesHolder.TryGetStringSpecialVariable(key, value) end
```

## Sprite

- Source type: `UnityEngine.Sprite`
- Rawdump: `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Dump fallback: `dump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class Sprite
```

### `AddScriptableObject`
- Source: `docs.txt:5960`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param obj ScriptableObject
---@return boolean
function Sprite.AddScriptableObject(obj) end
```

### `Create`
- Source: `docs.txt:5968`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param texture Texture2D
---@param rect Rect
---@param pivot Vector2
---@param pixelsPerUnit number
---@param extrude integer
---@param meshType SpriteMeshType
---@param border Vector4
---@param generateFallbackPhysicsShape boolean
---@return Sprite
function Sprite.Create(texture, rect, pivot, pixelsPerUnit, extrude, meshType, border, generateFallbackPhysicsShape) end
```

### `Create`
- Source: `docs.txt:5969`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param texture Texture2D
---@param rect Rect
---@param pivot Vector2
---@param pixelsPerUnit number
---@param extrude integer
---@param meshType SpriteMeshType
---@param border Vector4
---@param generateFallbackPhysicsShape boolean
---@param secondaryTextures SecondarySpriteTexture[]
---@return Sprite
function Sprite.Create(texture, rect, pivot, pixelsPerUnit, extrude, meshType, border, generateFallbackPhysicsShape, secondaryTextures) end
```

### `Create`
- Source: `docs.txt:5970`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param texture Texture2D
---@param rect Rect
---@param pivot Vector2
---@param pixelsPerUnit number
---@param extrude integer
---@param meshType SpriteMeshType
---@param border Vector4
---@return Sprite
function Sprite.Create(texture, rect, pivot, pixelsPerUnit, extrude, meshType, border) end
```

### `Create`
- Source: `docs.txt:5971`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param texture Texture2D
---@param rect Rect
---@param pivot Vector2
---@param pixelsPerUnit number
---@param extrude integer
---@param meshType SpriteMeshType
---@return Sprite
function Sprite.Create(texture, rect, pivot, pixelsPerUnit, extrude, meshType) end
```

### `Create`
- Source: `docs.txt:5972`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param texture Texture2D
---@param rect Rect
---@param pivot Vector2
---@param pixelsPerUnit number
---@param extrude integer
---@return Sprite
function Sprite.Create(texture, rect, pivot, pixelsPerUnit, extrude) end
```

### `Create`
- Source: `docs.txt:5973`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param texture Texture2D
---@param rect Rect
---@param pivot Vector2
---@param pixelsPerUnit number
---@return Sprite
function Sprite.Create(texture, rect, pivot, pixelsPerUnit) end
```

### `Create`
- Source: `docs.txt:5974`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param texture Texture2D
---@param rect Rect
---@param pivot Vector2
---@return Sprite
function Sprite.Create(texture, rect, pivot) end
```

### `GetPhysicsShape`
- Source: `docs.txt:5964`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param shapeIdx integer
---@param physicsShape Vector2[]
---@return integer
function Sprite.GetPhysicsShape(shapeIdx, physicsShape) end
```

### `GetPhysicsShape`
- Source: `docs.txt:5965`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param shapeIdx integer
---@return ReadOnlySpan
function Sprite.GetPhysicsShape(shapeIdx) end
```

### `GetPhysicsShapeCount`
- Source: `docs.txt:5957`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return integer
function Sprite.GetPhysicsShapeCount() end
```

### `GetPhysicsShapePointCount`
- Source: `docs.txt:5963`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param shapeIdx integer
---@return integer
function Sprite.GetPhysicsShapePointCount(shapeIdx) end
```

### `GetScriptableObjects`
- Source: `docs.txt:5959`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param scriptableObjects ScriptableObject[]
---@return integer
function Sprite.GetScriptableObjects(scriptableObjects) end
```

### `GetScriptableObjectsCount`
- Source: `docs.txt:5958`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return integer
function Sprite.GetScriptableObjectsCount() end
```

### `GetSecondaryTextureCount`
- Source: `docs.txt:5955`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return integer
function Sprite.GetSecondaryTextureCount() end
```

### `GetSecondaryTextures`
- Source: `docs.txt:5956`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param secondaryTexture SecondarySpriteTexture[]
---@return integer
function Sprite.GetSecondaryTextures(secondaryTexture) end
```

### `OverrideGeometry`
- Source: `docs.txt:5967`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param vertices Vector2[]
---@param triangles integer[]
function Sprite.OverrideGeometry(vertices, triangles) end
```

### `OverridePhysicsShape`
- Source: `docs.txt:5966`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param physicsShapes Vector2[][]
function Sprite.OverridePhysicsShape(physicsShapes) end
```

### `RemoveScriptableObjectAt`
- Source: `docs.txt:5961`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param i integer
---@return boolean
function Sprite.RemoveScriptableObjectAt(i) end
```

### `SetScriptableObjectAt`
- Source: `docs.txt:5962`, `rawdump/UnityEngine.CoreModule/UnityEngine/Sprite.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param obj ScriptableObject
---@param i integer
---@return boolean
function Sprite.SetScriptableObjectAt(obj, i) end
```

## SpriteTextureDataGenerated

- Source type: `SpriteTextureDataGenerated`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/SpriteTextureDataGenerated.cs`
- Dump fallback: `dump/GameAssembly/SpriteTextureDataGenerated.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class SpriteTextureDataGenerated
```

### `__new`
- Source: `docs.txt:5926`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpriteTextureDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return SpriteTextureDataGenerated
function SpriteTextureDataGenerated.__new() end
```

### `OnAfterDeserialize`
- Source: `docs.txt:5928`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpriteTextureDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SpriteTextureDataGenerated.OnAfterDeserialize() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:5927`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpriteTextureDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SpriteTextureDataGenerated.OnBeforeSerialize() end
```

### `RegisterLua`
- Source: `docs.txt:5929`, `rawdump/Il2CppGameAssembly/Il2Cpp/SpriteTextureDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function SpriteTextureDataGenerated.RegisterLua() end
```

## Stages

- Source type: `StorySingleton+Stages`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class Stages
```

### `__new`
- Source: `docs.txt:6736`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param stage1 StoryBotDialogueStage
---@param stage2 StoryBotDialogueStage
---@param stage3 StoryBotDialogueStage
---@return Stages
function Stages.__new(stage1, stage2, stage3) end
```

## Step

- Source type: `StoryBlockTarget+Step`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class Step
```

### `__new`
- Source: `docs.txt:7259`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param callingCommand Command
---@param targetBlock Block
---@return Step
function Step.__new(callingCommand, targetBlock) end
```

## StoryAutoBranch

- Source type: `StoryAutoBranch`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/StoryAutoBranch.cs`
- Dump fallback: `dump/GameAssembly/StoryAutoBranch.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class StoryAutoBranch
```

### `__new`
- Source: `docs.txt:7217`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryAutoBranch.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param branchTarget StoryBranchTarget
---@param waitTillFinished boolean
---@param relatedFlag string
---@param randomOdds number
---@param additionalConditions StoryCondition[]
---@return StoryAutoBranch
function StoryAutoBranch.__new(branchTarget, waitTillFinished, relatedFlag, randomOdds, additionalConditions) end
```

### `__new`
- Source: `docs.txt:7218`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryAutoBranch.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param branchTarget StoryBranchTarget
---@param waitTillFinished boolean
---@param relatedFlag string
---@param additionalConditions StoryCondition[]
---@return StoryAutoBranch
function StoryAutoBranch.__new(branchTarget, waitTillFinished, relatedFlag, additionalConditions) end
```

### `__new`
- Source: `docs.txt:7219`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryAutoBranch.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param branchTarget StoryBranchTarget
---@param relatedFlag string
---@param additionalConditions StoryCondition[]
---@return StoryAutoBranch
function StoryAutoBranch.__new(branchTarget, relatedFlag, additionalConditions) end
```

## StoryBlockTarget

- Source type: `StoryBlockTarget`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBlockTarget.cs`
- Dump fallback: `dump/GameAssembly/StoryBlockTarget.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class StoryBlockTarget
```

### `__new`
- Source: `docs.txt:7275`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBlockTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param targetBlockName string
---@param targetLabel string
---@return StoryBlockTarget
function StoryBlockTarget.__new(targetBlockName, targetLabel) end
```

### `__new`
- Source: `docs.txt:7276`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBlockTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param targetBlock FungusBlockReference
---@return StoryBlockTarget
function StoryBlockTarget.__new(targetBlock) end
```

### `Activate`
- Source: `docs.txt:7277`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBlockTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param onFinished fun()
function StoryBlockTarget.Activate(onFinished) end
```

### `AnalyseRoutes`
- Source: `docs.txt:7281`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBlockTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param sourceBlock Block
---@param targetBlock Block
---@param endBlocks HashSet
---@param maxSteps integer
---@return any[]
function StoryBlockTarget.AnalyseRoutes(sourceBlock, targetBlock, endBlocks, maxSteps) end
```

### `CheckValidity`
- Source: `docs.txt:7278`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBlockTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param blocks table<string, Block>
---@return Result
function StoryBlockTarget.CheckValidity(blocks) end
```

### `GetTargetBlock`
- Source: `docs.txt:7280`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBlockTarget.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param flowchart Flowchart
---@return Block
function StoryBlockTarget.GetTargetBlock(flowchart) end
```

### `ToString`
- Source: `docs.txt:7279`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBlockTarget.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return string
function StoryBlockTarget.ToString() end
```

## StoryBotDialogueBranch

- Source type: `StoryBotDialogueBranch`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranch.cs`
- Dump fallback: `dump/GameAssembly/StoryBotDialogueBranch.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Ramo de dialogo do bot usado por personality modules e containers de fala.
---@class StoryBotDialogueBranch
```

### `__new`
- Source: `docs.txt:7185`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranch.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param id GameId
---@param branchTarget StoryBranchTarget
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.__new(id, branchTarget) end
```

### `__new`
- Source: `docs.txt:7186`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranch.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param text string
---@param guid Guid
---@param index integer
---@param waitForInput boolean
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.__new(text, guid, index, waitForInput) end
```

### `ActivateGetTarget`
- Source: `docs.txt:7197`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranch.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return StoryBranchTarget
function StoryBotDialogueBranch.ActivateGetTarget() end
```

### `AddConditions`
- Source: `docs.txt:7194`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranch.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param addedAdditionalConditions StoryCondition[]
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.AddConditions(addedAdditionalConditions) end
```

### `AddConditionsAtFront`
- Source: `docs.txt:7193`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranch.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param addedAdditionalConditions StoryCondition[]
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.AddConditionsAtFront(addedAdditionalConditions) end
```

### `CheckAdditionalConditionsOffset`
- Source: `docs.txt:7196`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranch.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param offset integer
---@return boolean
function StoryBotDialogueBranch.CheckAdditionalConditionsOffset(offset) end
```

### `InitSource`
- Source: `docs.txt:7187`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranch.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param sourceContainer StoryBotDialogueBranchContainer
function StoryBotDialogueBranch.InitSource(sourceContainer) end
```

### `MarkOneTime`
- Source: `docs.txt:7191`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranch.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.MarkOneTime() end
```

### `SetAllowedScenes`
- Source: `docs.txt:7195`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranch.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param allowedScenes SceneEnumFlag
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.SetAllowedScenes(allowedScenes) end
```

### `SetMaxOdds`
- Source: `docs.txt:7190`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranch.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.SetMaxOdds() end
```

### `SetOdds`
- Source: `docs.txt:7189`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranch.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param odds number
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.SetOdds(odds) end
```

### `SetOnActivateAction`
- Source: `docs.txt:7188`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranch.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param action fun()
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.SetOnActivateAction(action) end
```

### `SetPriority`
- Source: `docs.txt:7192`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranch.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param i integer
---@return StoryBotDialogueBranch
function StoryBotDialogueBranch.SetPriority(i) end
```

## StoryBotDialogueBranchContainer

- Source type: `StoryBotDialogueBranchContainer`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Dump fallback: `dump/GameAssembly/StoryBotDialogueBranchContainer.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Container de ramos de dialogo associados a um identificador de fala/evento.
---@class StoryBotDialogueBranchContainer
```

### `__new`
- Source: `docs.txt:6874`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param sourceTag StoryBotDialogueTag
---@param storyBotContainerType StoryBotContainerTypeEnum
---@return StoryBotDialogueBranchContainer
function StoryBotDialogueBranchContainer.__new(sourceTag, storyBotContainerType) end
```

### `AddBranch`
- Source: `docs.txt:6880`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Adiciona um ramo de dialogo ao container.
---@param branch StoryBotDialogueBranch
---@return StoryBotDialogueBranchContainer
function StoryBotDialogueBranchContainer.AddBranch(branch) end
```

### `AddBranches`
- Source: `docs.txt:6877`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param branches StoryBotDialogueBranch[]
function StoryBotDialogueBranchContainer.AddBranches(branches) end
```

### `AddBranches`
- Source: `docs.txt:6878`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param branches StoryBotDialogueBranch[]
function StoryBotDialogueBranchContainer.AddBranches(branches) end
```

### `AddMultipleBranchesWithoutConditions`
- Source: `docs.txt:6881`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param branches StoryBotDialogueBranch[]
function StoryBotDialogueBranchContainer.AddMultipleBranchesWithoutConditions(branches) end
```

### `AddMultipleBranchesWithoutConditions`
- Source: `docs.txt:6882`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param branches StoryBotDialogueBranch[]
function StoryBotDialogueBranchContainer.AddMultipleBranchesWithoutConditions(branches) end
```

### `AddMultipleBranchesWithSameCondition`
- Source: `docs.txt:6883`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param condition StoryCondition
---@param branches StoryBotDialogueBranch[]
function StoryBotDialogueBranchContainer.AddMultipleBranchesWithSameCondition(condition, branches) end
```

### `AddMultipleBranchesWithSameCondition`
- Source: `docs.txt:6884`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param condition StoryCondition
---@param branches StoryBotDialogueBranch[]
function StoryBotDialogueBranchContainer.AddMultipleBranchesWithSameCondition(condition, branches) end
```

### `ConditionsMet`
- Source: `docs.txt:6876`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function StoryBotDialogueBranchContainer.ConditionsMet() end
```

### `GetAllBranchesCheckConditionsAndIgnored`
- Source: `docs.txt:6889`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param sceneEnumFlag SceneEnumFlag
---@param allowedTypes StoryBotDialogueBranchType
---@return any[]
function StoryBotDialogueBranchContainer.GetAllBranchesCheckConditionsAndIgnored(sceneEnumFlag, allowedTypes) end
```

### `GetMemory`
- Source: `docs.txt:6887`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return DialogueChainMemory
function StoryBotDialogueBranchContainer.GetMemory() end
```

### `InitVanilla`
- Source: `docs.txt:6879`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param keyPrefix string
function StoryBotDialogueBranchContainer.InitVanilla(keyPrefix) end
```

### `IsLastFinished`
- Source: `docs.txt:6885`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return boolean
function StoryBotDialogueBranchContainer.IsLastFinished() end
```

### `SetConditions`
- Source: `docs.txt:6875`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param newConditions StoryCondition[]
function StoryBotDialogueBranchContainer.SetConditions(newConditions) end
```

### `TryGetBranchById`
- Source: `docs.txt:6886`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param id GameId
---@param branch StoryBotDialogueBranch
---@return boolean
function StoryBotDialogueBranchContainer.TryGetBranchById(id, branch) end
```

### `TryGetFirst`
- Source: `docs.txt:6888`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBotDialogueBranchContainer.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param branch StoryBotDialogueBranch
---@param sceneEnumFlag SceneEnumFlag
---@param allowedTypes StoryBotDialogueBranchType
---@return boolean
function StoryBotDialogueBranchContainer.TryGetFirst(branch, sceneEnumFlag, allowedTypes) end
```

## StoryBranchTarget

- Source type: `StoryBranchTarget`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBranchTarget.cs`
- Dump fallback: `dump/GameAssembly/StoryBranchTarget.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class StoryBranchTarget
```

### `__toStoryBranchTarget`
- Source: `docs.txt:7252`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBranchTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param b FungusBlockReference
---@return StoryBranchTarget
function StoryBranchTarget.__toStoryBranchTarget(b) end
```

### `__toStoryBranchTarget`
- Source: `docs.txt:7253`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBranchTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param b TupleReference
---@return StoryBranchTarget
function StoryBranchTarget.__toStoryBranchTarget(b) end
```

### `__toStoryBranchTarget`
- Source: `docs.txt:7254`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBranchTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param b SerializedLocalizedConversation
---@return StoryBranchTarget
function StoryBranchTarget.__toStoryBranchTarget(b) end
```

### `__toStoryBranchTarget`
- Source: `docs.txt:7255`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBranchTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param b fun(): IEnumerator
---@return StoryBranchTarget
function StoryBranchTarget.__toStoryBranchTarget(b) end
```

### `Activate`
- Source: `docs.txt:7250`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBranchTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param onFinished fun()
function StoryBranchTarget.Activate(onFinished) end
```

### `CheckValidity`
- Source: `docs.txt:7251`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryBranchTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param blocks table<string, Block>
---@return Result
function StoryBranchTarget.CheckValidity(blocks) end
```

## StoryCondition

- Source type: `StoryConditions.StoryCondition`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Dump fallback: `dump/GameAssembly/StoryConditions/StoryCondition.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Base de condicoes usadas pelo sistema de historia/eventos para verificar requisitos, combinar condicoes e gerar representacoes textuais ou de codigo.
---@class StoryCondition
```

### `And`
- Source: `docs.txt:7010`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Combina condicoes e exige que todas sejam verdadeiras.
---@param conditions StoryCondition[]
---@return AndCondition
function StoryCondition.And(conditions) end
```

### `CaughtFishAtLeastPercentile`
- Source: `docs.txt:7006`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param fish ItemEnum
---@param p1 number
---@param negate boolean
---@return FishSizeCondition
function StoryCondition.CaughtFishAtLeastPercentile(fish, p1, negate) end
```

### `CaughtFishBig`
- Source: `docs.txt:7007`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param fish ItemEnum
---@return StoryCondition
function StoryCondition.CaughtFishBig(fish) end
```

### `ConditionMet`
- Source: `docs.txt:6978`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return boolean
function StoryCondition.ConditionMet() end
```

### `CreateInteractionMemoryActiveForCondition`
- Source: `docs.txt:7002`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param memory InteractionMemoryEnum
---@param time number
---@param negate boolean
---@return InteractionMemoryCondition
function StoryCondition.CreateInteractionMemoryActiveForCondition(memory, time, negate) end
```

### `CreateInteractionMemoryRecentCondition`
- Source: `docs.txt:7003`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param memory InteractionMemoryEnum
---@param time number
---@param negate boolean
---@return InteractionMemoryCondition
function StoryCondition.CreateInteractionMemoryRecentCondition(memory, time, negate) end
```

### `DayAbove`
- Source: `docs.txt:6995`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param t1 integer
---@return DataCondition
function StoryCondition.DayAbove(t1) end
```

### `DayBelow`
- Source: `docs.txt:6996`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param t1 integer
---@return DataCondition
function StoryCondition.DayBelow(t1) end
```

### `DayRandom`
- Source: `docs.txt:7013`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param seed integer
---@param odds number
---@return StoryCondition
function StoryCondition.DayRandom(seed, odds) end
```

### `Delegate`
- Source: `docs.txt:6988`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Cria uma condicao de historia avaliada por callback booleano.
---@param condition fun(): boolean
---@param negate boolean
---@return DelegateCondition
function StoryCondition.Delegate(condition, negate) end
```

### `Equals`
- Source: `docs.txt:7014`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function StoryCondition.Equals(obj) end
```

### `Explain`
- Source: `docs.txt:6979`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function StoryCondition.Explain() end
```

### `FishesCaught`
- Source: `docs.txt:7004`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param fish ItemEnum
---@param count integer
---@param negate boolean
---@return FishCaughtCondition
function StoryCondition.FishesCaught(fish, count, negate) end
```

### `FishesCaught`
- Source: `docs.txt:7005`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param count integer
---@param negate boolean
---@return TotalFishesCaughtCondition
function StoryCondition.FishesCaught(count, negate) end
```

### `FlagNotSet`
- Source: `docs.txt:6982`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param flag string
---@return FlagConditionBasic
function StoryCondition.FlagNotSet(flag) end
```

### `FlagSet`
- Source: `docs.txt:6981`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param flag string
---@param negate boolean
---@return FlagConditionBasic
function StoryCondition.FlagSet(flag, negate) end
```

### `FlagSetAfterRelative`
- Source: `docs.txt:6984`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param flag string
---@param time integer
---@param negate boolean
---@return FlagConditionWithTime
function StoryCondition.FlagSetAfterRelative(flag, time, negate) end
```

### `FlagSetBeforeRelative`
- Source: `docs.txt:6983`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param flag string
---@param time integer
---@param negate boolean
---@return FlagConditionWithTime
function StoryCondition.FlagSetBeforeRelative(flag, time, negate) end
```

### `FlagSetSpecialWithTime`
- Source: `docs.txt:6986`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param flag string
---@param checkType CheckType
---@param timePeriod integer
---@param timeCheck TimeCheckType
---@param negate boolean
---@return FlagConditionSpecialWithTime
function StoryCondition.FlagSetSpecialWithTime(flag, checkType, timePeriod, timeCheck, negate) end
```

### `FlagSetWithTime`
- Source: `docs.txt:6985`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param flag string
---@param timePeriod integer
---@param timeCheck TimeCheckType
---@param negate boolean
---@return FlagConditionWithTime
function StoryCondition.FlagSetWithTime(flag, timePeriod, timeCheck, negate) end
```

### `GenerateCode`
- Source: `docs.txt:6980`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function StoryCondition.GenerateCode() end
```

### `GetHashCode`
- Source: `docs.txt:7015`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function StoryCondition.GetHashCode() end
```

### `HasItem`
- Source: `docs.txt:6997`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param itemId GameId
---@param negate boolean
---@return ItemCondition
function StoryCondition.HasItem(itemId, negate) end
```

### `HasItemEquipped`
- Source: `docs.txt:6998`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param itemId GameId
---@param negate boolean
---@return ItemCondition
function StoryCondition.HasItemEquipped(itemId, negate) end
```

### `HourBetweenEqual`
- Source: `docs.txt:6993`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param t1 integer
---@param t2 integer
---@return DataCondition
function StoryCondition.HourBetweenEqual(t1, t2) end
```

### `HourRandom`
- Source: `docs.txt:7012`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param seed integer
---@param odds number
---@return StoryCondition
function StoryCondition.HourRandom(seed, odds) end
```

### `ItemInSlotCondition`
- Source: `docs.txt:6999`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot string
---@param negate boolean
---@return ItemInSlotCondition
function StoryCondition.ItemInSlotCondition(slot, negate) end
```

### `MoneyAbove`
- Source: `docs.txt:6991`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value integer
---@return DataCondition
function StoryCondition.MoneyAbove(value) end
```

### `MoneyBelow`
- Source: `docs.txt:6992`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value integer
---@return DataCondition
function StoryCondition.MoneyBelow(value) end
```

### `NotAnd`
- Source: `docs.txt:7011`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Combina condicoes com negacao do resultado de And.
---@param conditions StoryCondition[]
---@return AndCondition
function StoryCondition.NotAnd(conditions) end
```

### `NotOr`
- Source: `docs.txt:7009`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Combina condicoes com negacao do resultado de Or.
---@param conditions StoryCondition[]
---@return OrCondition
function StoryCondition.NotOr(conditions) end
```

### `Or`
- Source: `docs.txt:7008`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Combina condicoes e exige que pelo menos uma seja verdadeira.
---@param conditions StoryCondition[]
---@return OrCondition
function StoryCondition.Or(conditions) end
```

### `StoryMenuEntryPointAnyExistCondition`
- Source: `docs.txt:7000`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@param negate boolean
---@return StoryMenuEntryPointOptionsExistCondition
function StoryCondition.StoryMenuEntryPointAnyExistCondition(name, negate) end
```

### `StoryMenuEntryPointConditionalExistCondition`
- Source: `docs.txt:7001`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@param negate boolean
---@return StoryMenuEntryPointOptionsExistCondition
function StoryCondition.StoryMenuEntryPointConditionalExistCondition(name, negate) end
```

### `TimeAfter`
- Source: `docs.txt:6994`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param time integer
---@return DataCondition
function StoryCondition.TimeAfter(time) end
```

### `VariableConditionBoolFalse`
- Source: `docs.txt:6990`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@return DataCondition
function StoryCondition.VariableConditionBoolFalse(name) end
```

### `VariableConditionBoolTrue`
- Source: `docs.txt:6989`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param name string
---@return DataCondition
function StoryCondition.VariableConditionBoolTrue(name) end
```

## StoryEmoteExpressionSlot

- Source type: `Live2DController+StoryEmoteExpressionSlot`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class StoryEmoteExpressionSlot
```

### `__new`
- Source: `docs.txt:2994`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param controller Live2DController
---@return StoryEmoteExpressionSlot
function StoryEmoteExpressionSlot.__new(controller) end
```

### `GetItemId`
- Source: `docs.txt:2998`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return any[]
function StoryEmoteExpressionSlot.GetItemId() end
```

### `GetValidNames`
- Source: `docs.txt:2996`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return any[]
function StoryEmoteExpressionSlot.GetValidNames() end
```

### `IsTargetSlot`
- Source: `docs.txt:2997`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param slotName string
---@return boolean
function StoryEmoteExpressionSlot.IsTargetSlot(slotName) end
```

### `IsValidEmote`
- Source: `docs.txt:2995`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param emoteData EmoteData
---@return Result
function StoryEmoteExpressionSlot.IsValidEmote(emoteData) end
```

### `SetDefault`
- Source: `docs.txt:2999`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
function StoryEmoteExpressionSlot.SetDefault() end
```

### `SetItem`
- Source: `docs.txt:3000`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param emote EmoteData
function StoryEmoteExpressionSlot.SetItem(emote) end
```

## StoryEmoteManager

- Source type: `Live2DController+StoryEmoteManager`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class StoryEmoteManager
```

### `__new`
- Source: `docs.txt:2984`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return StoryEmoteManager
function StoryEmoteManager.__new() end
```

### `AddSlot`
- Source: `docs.txt:2985`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param slot IStoryEmoteSlot
function StoryEmoteManager.AddSlot(slot) end
```

### `GenerateSummary`
- Source: `docs.txt:2989`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param characterName string
---@return string
function StoryEmoteManager.GenerateSummary(characterName) end
```

### `IsValidEmote`
- Source: `docs.txt:2988`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param emoteData EmoteData
---@return Result
function StoryEmoteManager.IsValidEmote(emoteData) end
```

### `SetDefaultEmote`
- Source: `docs.txt:2986`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
function StoryEmoteManager.SetDefaultEmote() end
```

### `SetEmote`
- Source: `docs.txt:2987`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param emoteData EmoteData
function StoryEmoteManager.SetEmote(emoteData) end
```

## StoryEnumeratorTarget

- Source type: `StoryEnumeratorTarget`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/StoryEnumeratorTarget.cs`
- Dump fallback: `dump/GameAssembly/StoryEnumeratorTarget.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class StoryEnumeratorTarget
```

### `__new`
- Source: `docs.txt:7290`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryEnumeratorTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param enumeratorGenerator fun(): IEnumerator
---@return StoryEnumeratorTarget
function StoryEnumeratorTarget.__new(enumeratorGenerator) end
```

### `Activate`
- Source: `docs.txt:7291`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryEnumeratorTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param onFinished fun()
function StoryEnumeratorTarget.Activate(onFinished) end
```

### `CheckValidity`
- Source: `docs.txt:7293`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryEnumeratorTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param blocks table<string, Block>
---@return Result
function StoryEnumeratorTarget.CheckValidity(blocks) end
```

### `ToString`
- Source: `docs.txt:7292`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryEnumeratorTarget.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return string
function StoryEnumeratorTarget.ToString() end
```

## StoryInteractionArmsSlot

- Source type: `Live2DInteractionController+StoryInteractionArmsSlot`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class StoryInteractionArmsSlot
```

### `__new`
- Source: `docs.txt:3774`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param controller Live2DInteractionController
---@return StoryInteractionArmsSlot
function StoryInteractionArmsSlot.__new(controller) end
```

### `GetItemId`
- Source: `docs.txt:3776`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return any[]
function StoryInteractionArmsSlot.GetItemId() end
```

### `GetValidNames`
- Source: `docs.txt:3777`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return any[]
function StoryInteractionArmsSlot.GetValidNames() end
```

### `IsTargetSlot`
- Source: `docs.txt:3775`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param slotName string
---@return boolean
function StoryInteractionArmsSlot.IsTargetSlot(slotName) end
```

### `IsValidEmote`
- Source: `docs.txt:3778`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param emoteData EmoteData
---@return Result
function StoryInteractionArmsSlot.IsValidEmote(emoteData) end
```

### `SetDefault`
- Source: `docs.txt:3779`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
function StoryInteractionArmsSlot.SetDefault() end
```

### `SetItem`
- Source: `docs.txt:3780`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param emote EmoteData
function StoryInteractionArmsSlot.SetItem(emote) end
```

## StoryLocalizedConversationBranchTarget

- Source type: `StoryLocalizedConversationBranchTarget`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/StoryLocalizedConversationBranchTarget.cs`
- Dump fallback: `dump/GameAssembly/StoryLocalizedConversationBranchTarget.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class StoryLocalizedConversationBranchTarget
```

### `__new`
- Source: `docs.txt:7297`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryLocalizedConversationBranchTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param text string
---@param modGuid Guid
---@param id integer
---@param waitForInput boolean
---@return StoryLocalizedConversationBranchTarget
function StoryLocalizedConversationBranchTarget.__new(text, modGuid, id, waitForInput) end
```

### `__new`
- Source: `docs.txt:7298`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryLocalizedConversationBranchTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param conversation LocalizedConversation
---@param waitForInput boolean
---@return StoryLocalizedConversationBranchTarget
function StoryLocalizedConversationBranchTarget.__new(conversation, waitForInput) end
```

### `Activate`
- Source: `docs.txt:7299`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryLocalizedConversationBranchTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param onFinished fun()
function StoryLocalizedConversationBranchTarget.Activate(onFinished) end
```

### `Activate`
- Source: `docs.txt:7300`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryLocalizedConversationBranchTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param modelBrainState ModelBrainState
---@param noWrapper boolean
function StoryLocalizedConversationBranchTarget.Activate(modelBrainState, noWrapper) end
```

### `CheckValidity`
- Source: `docs.txt:7301`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryLocalizedConversationBranchTarget.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param blocks table<string, Block>
---@return Result
function StoryLocalizedConversationBranchTarget.CheckValidity(blocks) end
```

### `GetBranchType`
- Source: `docs.txt:7302`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryLocalizedConversationBranchTarget.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return StoryBotDialogueBranchType
function StoryLocalizedConversationBranchTarget.GetBranchType() end
```

### `ToString`
- Source: `docs.txt:7303`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryLocalizedConversationBranchTarget.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return string
function StoryLocalizedConversationBranchTarget.ToString() end
```

## StoryMenuBranch

- Source type: `StoryMenuBranch`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/StoryMenuBranch.cs`
- Dump fallback: `dump/GameAssembly/StoryMenuBranch.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class StoryMenuBranch
```

### `__new`
- Source: `docs.txt:7234`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryMenuBranch.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param menuText LocalizedStringReference
---@param branchTarget StoryBranchTarget
---@param relatedFlag string
---@param additionalConditions StoryCondition[]
---@return StoryMenuBranch
function StoryMenuBranch.__new(menuText, branchTarget, relatedFlag, additionalConditions) end
```

### `EditorSummary`
- Source: `docs.txt:7235`, `rawdump/Il2CppGameAssembly/Il2Cpp/StoryMenuBranch.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param sb StringBuilder
---@param blocks table<string, Block>
---@param richText boolean
---@param runTime boolean
---@return StringBuilder
function StoryMenuBranch.EditorSummary(sb, blocks, richText, runTime) end
```

## StoryMenuBranchesStrings

- Source type: `StorySingleton+StoryMenuBranchesStrings`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class StoryMenuBranchesStrings
```

### `__new`
- Source: `docs.txt:6743`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return StoryMenuBranchesStrings
function StoryMenuBranchesStrings.__new() end
```

## StoryMenuEntryPointOptionsExistCondition

- Source type: `StoryConditions.StoryMenuEntryPointOptionsExistCondition`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryMenuEntryPointOptionsExistCondition.cs`
- Dump fallback: `dump/GameAssembly/StoryConditions/StoryMenuEntryPointOptionsExistCondition.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class StoryMenuEntryPointOptionsExistCondition
```

### `__new`
- Source: `docs.txt:7111`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryMenuEntryPointOptionsExistCondition.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param entryPointName string
---@param conditional boolean
---@param negate boolean
---@return StoryMenuEntryPointOptionsExistCondition
function StoryMenuEntryPointOptionsExistCondition.__new(entryPointName, conditional, negate) end
```

### `Equals`
- Source: `docs.txt:7114`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryMenuEntryPointOptionsExistCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param other StoryMenuEntryPointOptionsExistCondition
---@return boolean
function StoryMenuEntryPointOptionsExistCondition.Equals(other) end
```

### `Equals`
- Source: `docs.txt:7115`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryMenuEntryPointOptionsExistCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param obj any
---@return boolean
function StoryMenuEntryPointOptionsExistCondition.Equals(obj) end
```

### `Explain`
- Source: `docs.txt:7112`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryMenuEntryPointOptionsExistCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function StoryMenuEntryPointOptionsExistCondition.Explain() end
```

### `GenerateCode`
- Source: `docs.txt:7113`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryMenuEntryPointOptionsExistCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return string
function StoryMenuEntryPointOptionsExistCondition.GenerateCode() end
```

### `GetHashCode`
- Source: `docs.txt:7116`, `rawdump/Il2CppGameAssembly/Il2CppStoryConditions/StoryMenuEntryPointOptionsExistCondition.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return integer
function StoryMenuEntryPointOptionsExistCondition.GetHashCode() end
```

## StorySingleton

- Source type: `StorySingleton`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Dump fallback: `dump/GameAssembly/StorySingleton.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class StorySingleton
```

### `__new`
- Source: `docs.txt:6811`, `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return StorySingleton
function StorySingleton.__new() end
```

### `CreatEmptyFungusBlock`
- Source: `docs.txt:6820`, `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return Block
function StorySingleton.CreatEmptyFungusBlock() end
```

### `DestroyBlock`
- Source: `docs.txt:6821`, `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param block Block
function StorySingleton.DestroyBlock(block) end
```

### `GenerateCommonPersonalityModuleConversations`
- Source: `docs.txt:6813`, `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function StorySingleton.GenerateCommonPersonalityModuleConversations() end
```

### `GenerateSummary`
- Source: `docs.txt:6823`, `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param richText boolean
---@return string
function StorySingleton.GenerateSummary(richText) end
```

### `GetAllDefinedPersonalities`
- Source: `docs.txt:6812`, `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return AllDefinedPersonalities
function StorySingleton.GetAllDefinedPersonalities() end
```

### `GetFlowchart`
- Source: `docs.txt:6819`, `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return Flowchart
function StorySingleton.GetFlowchart() end
```

### `GetStage`
- Source: `docs.txt:6814`, `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param stageNr integer
---@return StoryBotDialogueStage
function StorySingleton.GetStage(stageNr) end
```

### `GetStoryAutoEntryPoint`
- Source: `docs.txt:6817`, `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param id string
---@return StoryAutoEntryPoint
function StorySingleton.GetStoryAutoEntryPoint(id) end
```

### `GetStoryMenuEntryPoint`
- Source: `docs.txt:6818`, `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param id string
---@return StoryMenuEntryPoint
function StorySingleton.GetStoryMenuEntryPoint(id) end
```

### `MakeSureInitialized`
- Source: `docs.txt:6822`, `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
function StorySingleton.MakeSureInitialized() end
```

### `ParseOldSystem`
- Source: `docs.txt:6824`, `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param startingCommand LuaCondition
function StorySingleton.ParseOldSystem(startingCommand) end
```

### `TryGetTag`
- Source: `docs.txt:6815`, `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param stageNr integer
---@param queryTag string
---@param storyTag StoryBotDialogueTag
---@return boolean
function StorySingleton.TryGetTag(stageNr, queryTag, storyTag) end
```

### `TryGetTag`
- Source: `docs.txt:6816`, `rawdump/Il2CppGameAssembly/Il2Cpp/StorySingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param queryTag string
---@param storyTag StoryBotDialogueTag
---@return boolean
function StorySingleton.TryGetTag(queryTag, storyTag) end
```

## StreamInfo

- Source type: `CockTwitchManager+StreamInfo`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class StreamInfo
```

### `__new`
- Source: `docs.txt:2445`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return StreamInfo
function StreamInfo.__new() end
```

## StringBuilderConsoleLine

- Source type: `BotStatusAppPopup+StringBuilderConsoleLine`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class StringBuilderConsoleLine
```

### `__new`
- Source: `docs.txt:7667`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return StringBuilderConsoleLine
function StringBuilderConsoleLine.__new() end
```

### `__toStringBuilderConsoleLine`
- Source: `docs.txt:7673`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param sb StringBuilder
---@return StringBuilderConsoleLine
function StringBuilderConsoleLine.__toStringBuilderConsoleLine(sb) end
```

### `Clear`
- Source: `docs.txt:7670`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function StringBuilderConsoleLine.Clear() end
```

### `GetApproximateLineCount`
- Source: `docs.txt:7671`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param popup BotStatusAppPopup
---@return integer
function StringBuilderConsoleLine.GetApproximateLineCount(popup) end
```

### `Init`
- Source: `docs.txt:7668`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function StringBuilderConsoleLine.Init() end
```

### `Init`
- Source: `docs.txt:7669`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param stringBuilder StringBuilder
function StringBuilderConsoleLine.Init(stringBuilder) end
```

### `PrintTo`
- Source: `docs.txt:7672`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param consoleStringBuilder StringBuilder
---@param _popup BotStatusAppPopup
function StringBuilderConsoleLine.PrintTo(consoleStringBuilder, _popup) end
```

## StringConsoleLine

- Source type: `BotStatusAppPopup+StringConsoleLine`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class StringConsoleLine
```

### `__new`
- Source: `docs.txt:7653`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return StringConsoleLine
function StringConsoleLine.__new() end
```

### `__toStringConsoleLine`
- Source: `docs.txt:7658`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param s string
---@return StringConsoleLine
function StringConsoleLine.__toStringConsoleLine(s) end
```

### `Clear`
- Source: `docs.txt:7655`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function StringConsoleLine.Clear() end
```

### `GetApproximateLineCount`
- Source: `docs.txt:7656`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param popup BotStatusAppPopup
---@return integer
function StringConsoleLine.GetApproximateLineCount(popup) end
```

### `Init`
- Source: `docs.txt:7654`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value string
function StringConsoleLine.Init(value) end
```

### `PrintTo`
- Source: `docs.txt:7657`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param consoleStringBuilder StringBuilder
---@param _popup BotStatusAppPopup
function StringConsoleLine.PrintTo(consoleStringBuilder, _popup) end
```

## StringProcessingDelegate

- Source type: `UiOverlay+StringProcessingDelegate`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class StringProcessingDelegate
```

### `BeginInvoke`
- Source: `docs.txt:8053`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param input string
---@param callback AsyncCallback
---@param object any
---@return IAsyncResult
function StringProcessingDelegate.BeginInvoke(input, callback, object) end
```

### `EndInvoke`
- Source: `docs.txt:8054`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param result IAsyncResult
---@return string
function StringProcessingDelegate.EndInvoke(result) end
```

### `Invoke`
- Source: `docs.txt:8052`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param input string
---@return string
function StringProcessingDelegate.Invoke(input) end
```

## StringValidationDelegate

- Source type: `UiOverlay+StringValidationDelegate`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class StringValidationDelegate
```

### `BeginInvoke`
- Source: `docs.txt:8045`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param input string
---@param callback AsyncCallback
---@param object any
---@return IAsyncResult
function StringValidationDelegate.BeginInvoke(input, callback, object) end
```

### `EndInvoke`
- Source: `docs.txt:8046`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param result IAsyncResult
---@return Result
function StringValidationDelegate.EndInvoke(result) end
```

### `Invoke`
- Source: `docs.txt:8044`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param input string
---@return Result
function StringValidationDelegate.Invoke(input) end
```

## SusModifier

- Source type: `SusModifier`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/SusModifier.cs`
- Dump fallback: `dump/GameAssembly/SusModifier.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Modificador de cobertura/suspeita associado a areas visuais de um item.
---@class SusModifier
```

### `Clone`
- Source: `docs.txt:1417`, `rawdump/Il2CppGameAssembly/Il2Cpp/SusModifier.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return SusModifier
function SusModifier.Clone() end
```

### `CreateInstance`
- Source: `docs.txt:1416`, `rawdump/Il2CppGameAssembly/Il2Cpp/SusModifier.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@param area SusArea
---@param coverPercentage number
---@return SusModifier
function SusModifier.CreateInstance(area, coverPercentage) end
```

### `ToLuaString`
- Source: `docs.txt:1418`, `rawdump/Il2CppGameAssembly/Il2Cpp/SusModifier.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function SusModifier.ToLuaString() end
```

## TailLive2DControllerItemModifier

- Source type: `Live2DController+TailLive2DControllerItemModifier`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class TailLive2DControllerItemModifier
```

### `__new`
- Source: `docs.txt:2949`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param speedMulti number
---@return TailLive2DControllerItemModifier
function TailLive2DControllerItemModifier.__new(speedMulti) end
```

### `Activate`
- Source: `docs.txt:2951`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param live2DController Live2DController
---@param type UpdateTexturesFromCurrentlyEquippedTypeEnum
function TailLive2DControllerItemModifier.Activate(live2DController, type) end
```

### `Deactivate`
- Source: `docs.txt:2952`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param live2DController Live2DController
function TailLive2DControllerItemModifier.Deactivate(live2DController) end
```

### `FixedUpdate`
- Source: `docs.txt:2950`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param live2DController Live2DController
function TailLive2DControllerItemModifier.FixedUpdate(live2DController) end
```

## TargetComparer

- Source type: `PackedTexturesContainer+TargetComparer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class TargetComparer
```

### `__new`
- Source: `docs.txt:967`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return TargetComparer
function TargetComparer.__new() end
```

### `Equals`
- Source: `docs.txt:968`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param a string[]
---@param b string[]
---@return boolean
function TargetComparer.Equals(a, b) end
```

### `GetHashCode`
- Source: `docs.txt:969`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param t string[]
---@return integer
function TargetComparer.GetHashCode(t) end
```

## TextAsset

- Source type: `UnityEngine.TextAsset`
- Rawdump: `rawdump/UnityEngine.CoreModule/UnityEngine/TextAsset.cs`
- Dump fallback: `dump/UnityEngine.CoreModule/UnityEngine/TextAsset.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class TextAsset
```

### `__new`
- Source: `docs.txt:6043`, `rawdump/UnityEngine.CoreModule/UnityEngine/TextAsset.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return TextAsset
function TextAsset.__new() end
```

### `ToString`
- Source: `docs.txt:6044`, `rawdump/UnityEngine.CoreModule/UnityEngine/TextAsset.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `generic`
```lua
---@return string
function TextAsset.ToString() end
```

## TextDataGenerated

- Source type: `TextDataGenerated`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/TextDataGenerated.cs`
- Dump fallback: `dump/GameAssembly/TextDataGenerated.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class TextDataGenerated
```

### `__new`
- Source: `docs.txt:6030`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return TextDataGenerated
function TextDataGenerated.__new() end
```

### `OnAfterDeserialize`
- Source: `docs.txt:6032`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextDataGenerated.OnAfterDeserialize() end
```

### `OnBeforeSerialize`
- Source: `docs.txt:6031`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextDataGenerated.OnBeforeSerialize() end
```

### `RegisterLua`
- Source: `docs.txt:6033`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextDataGenerated.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextDataGenerated.RegisterLua() end
```

## TextMeshProUGUI

- Source type: `TMPro.TextMeshProUGUI`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class TextMeshProUGUI
```

### `__new`
- Source: `docs.txt:4385`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return TextMeshProUGUI
function TextMeshProUGUI.__new() end
```

### `add_OnPreRenderText`
- Source: `docs.txt:4400`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value fun(arg1: TMP_TextInfo)
function TextMeshProUGUI.add_OnPreRenderText(value) end
```

### `CalculateLayoutInputHorizontal`
- Source: `docs.txt:4386`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextMeshProUGUI.CalculateLayoutInputHorizontal() end
```

### `CalculateLayoutInputVertical`
- Source: `docs.txt:4387`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextMeshProUGUI.CalculateLayoutInputVertical() end
```

### `ClearMesh`
- Source: `docs.txt:4399`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextMeshProUGUI.ClearMesh() end
```

### `ComputeMarginSize`
- Source: `docs.txt:4406`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextMeshProUGUI.ComputeMarginSize() end
```

### `Cull`
- Source: `docs.txt:4395`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param clipRect Rect
---@param validRect boolean
function TextMeshProUGUI.Cull(clipRect, validRect) end
```

### `ForceMeshUpdate`
- Source: `docs.txt:4397`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param ignoreActiveState boolean
---@param forceTextReparsing boolean
function TextMeshProUGUI.ForceMeshUpdate(ignoreActiveState, forceTextReparsing) end
```

### `GetModifiedMaterial`
- Source: `docs.txt:4393`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param baseMaterial Material
---@return Material
function TextMeshProUGUI.GetModifiedMaterial(baseMaterial) end
```

### `GetTextInfo`
- Source: `docs.txt:4398`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param text string
---@return TMP_TextInfo
function TextMeshProUGUI.GetTextInfo(text) end
```

### `Rebuild`
- Source: `docs.txt:4392`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param update CanvasUpdate
function TextMeshProUGUI.Rebuild(update) end
```

### `RecalculateClipping`
- Source: `docs.txt:4394`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextMeshProUGUI.RecalculateClipping() end
```

### `remove_OnPreRenderText`
- Source: `docs.txt:4401`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value fun(arg1: TMP_TextInfo)
function TextMeshProUGUI.remove_OnPreRenderText(value) end
```

### `SetAllDirty`
- Source: `docs.txt:4391`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
function TextMeshProUGUI.SetAllDirty() end
```

### `SetLayoutDirty`
- Source: `docs.txt:4389`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
function TextMeshProUGUI.SetLayoutDirty() end
```

### `SetMaterialDirty`
- Source: `docs.txt:4390`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
function TextMeshProUGUI.SetMaterialDirty() end
```

### `SetVerticesDirty`
- Source: `docs.txt:4388`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
function TextMeshProUGUI.SetVerticesDirty() end
```

### `UpdateFontAsset`
- Source: `docs.txt:4405`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextMeshProUGUI.UpdateFontAsset() end
```

### `UpdateGeometry`
- Source: `docs.txt:4402`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param mesh Mesh
---@param index integer
function TextMeshProUGUI.UpdateGeometry(mesh, index) end
```

### `UpdateMeshPadding`
- Source: `docs.txt:4396`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextMeshProUGUI.UpdateMeshPadding() end
```

### `UpdateVertexData`
- Source: `docs.txt:4403`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param flags TMP_VertexDataUpdateFlags
function TextMeshProUGUI.UpdateVertexData(flags) end
```

### `UpdateVertexData`
- Source: `docs.txt:4404`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextMeshProUGUI.UpdateVertexData() end
```

## TextPrefabsContainer

- Source type: `FontDataGenerated+TextPrefabsContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class TextPrefabsContainer
```

### `__new`
- Source: `docs.txt:4349`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return TextPrefabsContainer
function TextPrefabsContainer.__new() end
```

## TextureContainer

- Source type: `Live2DController+TextureContainer`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback, name-pattern`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class TextureContainer
```

### `__new`
- Source: `docs.txt:2695`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param allParts Part[]
---@param originalTexture Texture
---@return TextureContainer
function TextureContainer.__new(allParts, originalTexture) end
```

### `CheckIfRenderTextureIsValid`
- Source: `docs.txt:2702`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function TextureContainer.CheckIfRenderTextureIsValid() end
```

### `ClearAndDrawAllParts`
- Source: `docs.txt:2704`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextureContainer.ClearAndDrawAllParts() end
```

### `IsSizeValid`
- Source: `docs.txt:2696`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param width integer
---@param height integer
---@return boolean
function TextureContainer.IsSizeValid(width, height) end
```

### `NeedsAnyDrawing`
- Source: `docs.txt:2701`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function TextureContainer.NeedsAnyDrawing() end
```

### `NeedsRedrawing`
- Source: `docs.txt:2700`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return boolean
function TextureContainer.NeedsRedrawing() end
```

### `PrepareForDrawing`
- Source: `docs.txt:2698`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
function TextureContainer.PrepareForDrawing() end
```

### `RestoreOriginalTexture`
- Source: `docs.txt:2703`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextureContainer.RestoreOriginalTexture() end
```

### `SetTexture`
- Source: `docs.txt:2697`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param texture Texture
function TextureContainer.SetTexture(texture) end
```

### `TryGetRenderTexture`
- Source: `docs.txt:2699`, `not found`
- Confidence: `low`
- Evidence: `fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param renderTexture RenderTexture
---@return boolean
function TextureContainer.TryGetRenderTexture(renderTexture) end
```

## TextureOverriderManager

- Source type: `TextureOverriderManager`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/TextureOverriderManager.cs`
- Dump fallback: `dump/GameAssembly/TextureOverriderManager.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Gerenciador de override/restauracao de sprites/texturas por alvo visual, usado por efeitos de item e room overrides.
---@class TextureOverriderManager
```

### `__new`
- Source: `docs.txt:6059`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextureOverriderManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return TextureOverriderManager
function TextureOverriderManager.__new() end
```

### `Awake`
- Source: `docs.txt:6068`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextureOverriderManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextureOverriderManager.Awake() end
```

### `GenerateSummary`
- Source: `docs.txt:6069`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextureOverriderManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return string
function TextureOverriderManager.GenerateSummary() end
```

### `GetSpecialEffectsAction`
- Source: `docs.txt:6062`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextureOverriderManager.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Cria um callback compativel com SpecialEffectAction para aplicar/restaurar sprite de alvo visual.
---@param targetId string
---@param sprite IReference
---@return function
function TextureOverriderManager.GetSpecialEffectsAction(targetId, sprite) end
```

### `GetTextureOverriderManager`
- Source: `docs.txt:6060`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextureOverriderManager.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param id string
---@return TextureOverriderManager
function TextureOverriderManager.GetTextureOverriderManager(id) end
```

### `RestoreAll`
- Source: `docs.txt:6067`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextureOverriderManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function TextureOverriderManager.RestoreAll() end
```

### `RestoreSprite`
- Source: `docs.txt:6065`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextureOverriderManager.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Restaura o sprite original de um alvo visual previamente alterado.
---@param targetId string
---@param sprite IReference
function TextureOverriderManager.RestoreSprite(targetId, sprite) end
```

### `RestoreSprite`
- Source: `docs.txt:6066`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextureOverriderManager.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Restaura o sprite original de um alvo visual previamente alterado.
---@param uniqueGuid Guid
---@param targetId string
---@param sprite IReference
function TextureOverriderManager.RestoreSprite(uniqueGuid, targetId, sprite) end
```

### `SetSprite`
- Source: `docs.txt:6063`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextureOverriderManager.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Aplica override de sprite em um alvo visual, opcionalmente escopado por Guid unico.
---@param targetId string
---@param sprite IReference
function TextureOverriderManager.SetSprite(targetId, sprite) end
```

### `SetSprite`
- Source: `docs.txt:6064`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextureOverriderManager.cs`
- Confidence: `high`
- Evidence: `manual, rawdump`
```lua
---Aplica override de sprite em um alvo visual, opcionalmente escopado por Guid unico.
---@param uniqueGuid Guid
---@param targetId string
---@param sprite IReference
function TextureOverriderManager.SetSprite(uniqueGuid, targetId, sprite) end
```

### `SpecialEffectsActionLogic`
- Source: `docs.txt:6061`, `rawdump/Il2CppGameAssembly/Il2Cpp/TextureOverriderManager.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value boolean
---@param item Item
---@param targetId string
---@param sprite IReference
function TextureOverriderManager.SpecialEffectsActionLogic(value, item, targetId, sprite) end
```

## TextureSheetAnimationModule

- Source type: `UnityEngine.ParticleSystem+TextureSheetAnimationModule`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class TextureSheetAnimationModule
```

### `__new`
- Source: `docs.txt:4938`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return TextureSheetAnimationModule
function TextureSheetAnimationModule.__new() end
```

### `GetSprite`
- Source: `docs.txt:4940`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param index integer
---@return Sprite
function TextureSheetAnimationModule.GetSprite(index) end
```

### `SetSprite`
- Source: `docs.txt:4939`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param index integer
---@param sprite Sprite
function TextureSheetAnimationModule.SetSprite(index, sprite) end
```

## TimeoutSimplePopup

- Source type: `TimeoutSimplePopup`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/TimeoutSimplePopup.cs`
- Dump fallback: `dump/GameAssembly/TimeoutSimplePopup.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class TimeoutSimplePopup
```

### `__new`
- Source: `docs.txt:7887`, `rawdump/Il2CppGameAssembly/Il2Cpp/TimeoutSimplePopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return TimeoutSimplePopup
function TimeoutSimplePopup.__new() end
```

### `Open`
- Source: `docs.txt:7888`, `rawdump/Il2CppGameAssembly/Il2Cpp/TimeoutSimplePopup.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param title string
---@param textGenerator fun(arg1: TimeSpan): string
---@param choices PopupChoice[]
---@param defaultChoiceIndex integer
---@param timeoutDuration TimeSpan|nil
function TimeoutSimplePopup.Open(title, textGenerator, choices, defaultChoiceIndex, timeoutDuration) end
```

## TrailModule

- Source type: `UnityEngine.ParticleSystem+TrailModule`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class TrailModule
```

### `__new`
- Source: `docs.txt:5012`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return TrailModule
function TrailModule.__new() end
```

## TsunTsunPersonalityDefinition

- Source type: `StorySingleton+TsunTsunPersonalityDefinition`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class TsunTsunPersonalityDefinition
```

### `__new`
- Source: `docs.txt:6682`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param storySingleton StorySingleton
---@return TsunTsunPersonalityDefinition
function TsunTsunPersonalityDefinition.__new(storySingleton) end
```

## TsunTsunPersonalityModuleConversations

- Source type: `StorySingleton+TsunTsunPersonalityModuleConversations`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class TsunTsunPersonalityModuleConversations
```

### `__new`
- Source: `docs.txt:6179`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return TsunTsunPersonalityModuleConversations
function TsunTsunPersonalityModuleConversations.__new() end
```

## UiOverlay

- Source type: `UiOverlay`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Dump fallback: `dump/GameAssembly/UiOverlay.cs`
- Class confidence: `high`
- Class evidence: `manual, usage, rawdump`
- Class motivation:
```lua
---Utilitarios de overlay e popups de UI expostos ao Lua.
---@class UiOverlay
```

### `__new`
- Source: `docs.txt:8067`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return UiOverlay
function UiOverlay.__new() end
```

### `Awake`
- Source: `docs.txt:8068`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function UiOverlay.Awake() end
```

### `BuyPopup`
- Source: `docs.txt:8075`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param title string
---@param price integer
---@param boughtaction fun()
---@param text string
---@param noaction fun()
---@param nomoneyaction fun()
function UiOverlay.BuyPopup(title, price, boughtaction, text, noaction, nomoneyaction) end
```

### `ColorInputPopup`
- Source: `docs.txt:8106`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param title string
---@param text string
---@param yesaction fun(arg1: Color)
---@param noaction fun(arg1: Color)
---@param startColor Color32
function UiOverlay.ColorInputPopup(title, text, yesaction, noaction, startColor) end
```

### `EquipItem`
- Source: `docs.txt:8115`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param finished fun()
function UiOverlay.EquipItem(item, finished) end
```

### `FileLoadPopup`
- Source: `docs.txt:8079`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param description string
---@param finishFunc fun(arg1: UploadResult)
---@param filters FileType[]
---@param multifile boolean
---@param allowAllFiles boolean
function UiOverlay.FileLoadPopup(description, finishFunc, filters, multifile, allowAllFiles) end
```

### `FileSavePopup`
- Source: `docs.txt:8080`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param filename string
---@param data integer[]
---@param after fun(arg1: DownloadResult)
function UiOverlay.FileSavePopup(filename, data, after) end
```

### `FileSavePopup`
- Source: `docs.txt:8081`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param filename string
---@param data string
---@param after fun(arg1: DownloadResult)
function UiOverlay.FileSavePopup(filename, data, after) end
```

### `GetButtonColorPalette`
- Source: `docs.txt:8069`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param buttonColorType CommonButtonColorType
---@return ButtonColorPalette
function UiOverlay.GetButtonColorPalette(buttonColorType) end
```

### `GetCurrentlyOpenedBotStatusApp`
- Source: `docs.txt:8110`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Retorna currently opened bot status app.
---@return BotStatusAppPopup
function UiOverlay.GetCurrentlyOpenedBotStatusApp() end
```

### `GetCurrentlyOpenedBrowser`
- Source: `docs.txt:8111`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, name-pattern`
```lua
---Retorna currently opened browser.
---@return BrowserPopup
function UiOverlay.GetCurrentlyOpenedBrowser() end
```

### `InputPopup`
- Source: `docs.txt:8086`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param title string
---@param text string
---@param okaction fun(arg1: string)
---@param defaultInput string
---@param type ContentType
---@return InputPopup
function UiOverlay.InputPopup(title, text, okaction, defaultInput, type) end
```

### `InputPopupWithValidation`
- Source: `docs.txt:8087`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param title string
---@param text string
---@param areYouSureText fun(arg1: string): string
---@param OnPicked fun(arg1: string)
---@param defaultInput string
---@param type ContentType
---@param validate StringValidationDelegate
---@param process StringProcessingDelegate
function UiOverlay.InputPopupWithValidation(title, text, areYouSureText, OnPicked, defaultInput, type, validate, process) end
```

### `OkPopup`
- Source: `docs.txt:8082`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `high`
- Evidence: `manual, rawdump, usage`
```lua
---Mostra um popup simples com titulo, texto e acao opcional de OK.
---@param title string
---@param text string
---@param okaction fun()
---@return SimplePopup
function UiOverlay.OkPopup(title, text, okaction) end
```

### `OkPopupError`
- Source: `docs.txt:8083`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param text string
---@param okaction fun()
---@return SimplePopup
function UiOverlay.OkPopupError(text, okaction) end
```

### `OkPopupSuccess`
- Source: `docs.txt:8084`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param text string
---@param okaction fun()
---@return SimplePopup
function UiOverlay.OkPopupSuccess(text, okaction) end
```

### `OkPopupWarning`
- Source: `docs.txt:8085`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param text string
---@param okaction fun()
---@return SimplePopup
function UiOverlay.OkPopupWarning(text, okaction) end
```

### `OpenAchievements`
- Source: `docs.txt:8097`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function UiOverlay.OpenAchievements() end
```

### `OpenAnnalieShop`
- Source: `docs.txt:8089`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param onFinished fun()
---@param isWithBot boolean
---@return AnnalieShopPopup
function UiOverlay.OpenAnnalieShop(onFinished, isWithBot) end
```

### `OpenBotStatusApp`
- Source: `docs.txt:8103`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return BotStatusAppPopup
function UiOverlay.OpenBotStatusApp() end
```

### `OpenBotStatusAppPrologue`
- Source: `docs.txt:8104`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return BotStatusAppPopup
function UiOverlay.OpenBotStatusAppPrologue() end
```

### `OpenBrowser`
- Source: `docs.txt:8109`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, usage, fallback`
- LuaDoc omitted: `generic`
```lua
---@param website string
---@return BrowserPopup
function UiOverlay.OpenBrowser(website) end
```

### `OpenClothierOrdersShop`
- Source: `docs.txt:8090`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param onFinished fun()
---@return ClothierOrdersPopup
function UiOverlay.OpenClothierOrdersShop(onFinished) end
```

### `OpenContextMenuPopup`
- Source: `docs.txt:8107`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param choices PopupChoice[]
---@param addCancel boolean
function UiOverlay.OpenContextMenuPopup(choices, addCancel) end
```

### `OpenFisherSellFish`
- Source: `docs.txt:8091`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param onFinished fun()
---@return FisherSellFishPopup
function UiOverlay.OpenFisherSellFish(onFinished) end
```

### `OpenFishingJournal`
- Source: `docs.txt:8102`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function UiOverlay.OpenFishingJournal() end
```

### `OpenItemsMenu`
- Source: `docs.txt:8096`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function UiOverlay.OpenItemsMenu() end
```

### `OpenLoadMenu`
- Source: `docs.txt:8095`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function UiOverlay.OpenLoadMenu() end
```

### `OpenModCreatorPopup`
- Source: `docs.txt:8100`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param items ItemPrefab[]
function UiOverlay.OpenModCreatorPopup(items) end
```

### `OpenModsPopup`
- Source: `docs.txt:8101`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function UiOverlay.OpenModsPopup() end
```

### `OpenNarrativeLog`
- Source: `docs.txt:8088`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function UiOverlay.OpenNarrativeLog() end
```

### `OpenNativeFolderPath`
- Source: `docs.txt:8112`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param instanceModPath string
function UiOverlay.OpenNativeFolderPath(instanceModPath) end
```

### `OpenNunRepairShop`
- Source: `docs.txt:8092`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return NunRepairPopup
function UiOverlay.OpenNunRepairShop() end
```

### `OpenOptions`
- Source: `docs.txt:8098`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function UiOverlay.OpenOptions() end
```

### `OpenSaveMenu`
- Source: `docs.txt:8094`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function UiOverlay.OpenSaveMenu() end
```

### `OpenSheepPopup`
- Source: `docs.txt:8105`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@return SheepPopup
function UiOverlay.OpenSheepPopup() end
```

### `OpenShop`
- Source: `docs.txt:8093`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param id string
---@param onFinished fun()
function UiOverlay.OpenShop(id, onFinished) end
```

### `OpenSlotEquipItemPopup`
- Source: `docs.txt:8108`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param targetSlot ItemSlot
---@param onFinished fun(arg1: PopupFinishTypesEnum)
function UiOverlay.OpenSlotEquipItemPopup(targetSlot, onFinished) end
```

### `OpenToyPopup`
- Source: `docs.txt:8099`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function UiOverlay.OpenToyPopup() end
```

### `Popup`
- Source: `docs.txt:8078`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param title string
---@param text string
---@param choices PopupChoice[]
---@return SimplePopup
function UiOverlay.Popup(title, text, choices) end
```

### `ProgressPopup`
- Source: `docs.txt:8074`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param title string
---@param text string
---@param loadingCreationFunc fun(arg1: IProgressManager): UniTask
---@param OnFinished fun()
function UiOverlay.ProgressPopup(title, text, loadingCreationFunc, OnFinished) end
```

### `ShowFloatingText`
- Source: `docs.txt:8113`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param position Vector2
---@param text string
function UiOverlay.ShowFloatingText(position, text) end
```

### `ShowFloatingText`
- Source: `docs.txt:8114`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param position Vector2
---@param text StringBuilder
function UiOverlay.ShowFloatingText(position, text) end
```

### `SimplePopup`
- Source: `docs.txt:8077`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param title string
---@param text string
---@param yesaction fun()
---@param noaction fun()
---@return SimplePopup
function UiOverlay.SimplePopup(title, text, yesaction, noaction) end
```

### `SimplePopupWithTimeout`
- Source: `docs.txt:8076`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param title string
---@param textGenerator fun(arg1: TimeSpan): string
---@param choices PopupChoice[]
---@param defaultChoiceIndex integer
---@param timeout TimeSpan
---@return TimeoutSimplePopup
function UiOverlay.SimplePopupWithTimeout(title, textGenerator, choices, defaultChoiceIndex, timeout) end
```

### `UnequipItemOrAsk`
- Source: `docs.txt:8116`, `rawdump/Il2CppGameAssembly/Il2Cpp/UiOverlay.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param item Item
---@param finished fun()
function UiOverlay.UnequipItemOrAsk(item, finished) end
```

## ViewSingleton

- Source type: `ViewSingleton`
- Rawdump: `rawdump/Il2CppGameAssembly/Il2Cpp/ViewSingleton.cs`
- Dump fallback: `dump/GameAssembly/ViewSingleton.cs`
- Class confidence: `medium`
- Class evidence: `rawdump, name-pattern`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class ViewSingleton
```

### `__new`
- Source: `docs.txt:8194`, `rawdump/Il2CppGameAssembly/Il2Cpp/ViewSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return ViewSingleton
function ViewSingleton.__new() end
```

### `add_OnViewChanged`
- Source: `docs.txt:8199`, `rawdump/Il2CppGameAssembly/Il2Cpp/ViewSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value fun(arg1: View)
function ViewSingleton.add_OnViewChanged(value) end
```

### `Awake`
- Source: `docs.txt:8198`, `rawdump/Il2CppGameAssembly/Il2Cpp/ViewSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ViewSingleton.Awake() end
```

### `GetNotCurrentView`
- Source: `docs.txt:8196`, `rawdump/Il2CppGameAssembly/Il2Cpp/ViewSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@return View
function ViewSingleton.GetNotCurrentView() end
```

### `GetNotCurrentViewSetSprite`
- Source: `docs.txt:8197`, `rawdump/Il2CppGameAssembly/Il2Cpp/ViewSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param sprite Sprite
---@param color Color
---@param subView SubViews
---@return View
function ViewSingleton.GetNotCurrentViewSetSprite(sprite, color, subView) end
```

### `remove_OnViewChanged`
- Source: `docs.txt:8200`, `rawdump/Il2CppGameAssembly/Il2Cpp/ViewSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
---@param value fun(arg1: View)
function ViewSingleton.remove_OnViewChanged(value) end
```

### `SetNextView`
- Source: `docs.txt:8195`, `rawdump/Il2CppGameAssembly/Il2Cpp/ViewSingleton.cs`
- Confidence: `medium`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `name-pattern`
```lua
---@param view View
function ViewSingleton.SetNextView(view) end
```

### `UpdateViewReferences`
- Source: `docs.txt:8201`, `rawdump/Il2CppGameAssembly/Il2Cpp/ViewSingleton.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, fallback`
- LuaDoc omitted: `low-confidence`
```lua
function ViewSingleton.UpdateViewReferences() end
```

## WaitForSeconds

- Source type: `UnityEngine.WaitForSeconds`
- Rawdump: `rawdump/UnityEngine.CoreModule/UnityEngine/WaitForSeconds.cs`
- Dump fallback: `dump/UnityEngine.CoreModule/UnityEngine/WaitForSeconds.cs`
- Class confidence: `medium`
- Class evidence: `rawdump`
- Class motivation:
- LuaDoc omitted: `generic`
```lua
---@class WaitForSeconds
```

### `__new`
- Source: `docs.txt:7482`, `rawdump/UnityEngine.CoreModule/UnityEngine/WaitForSeconds.cs`
- Confidence: `low`
- Evidence: `rawdump, dump, name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param seconds number
---@return WaitForSeconds
function WaitForSeconds.__new(seconds) end
```

## YanderePersonalityDefinition

- Source type: `StorySingleton+YanderePersonalityDefinition`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class YanderePersonalityDefinition
```

### `__new`
- Source: `docs.txt:6698`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@param storySingleton StorySingleton
---@return YanderePersonalityDefinition
function YanderePersonalityDefinition.__new(storySingleton) end
```

## YanderePersonalityModuleConversations

- Source type: `StorySingleton+YanderePersonalityModuleConversations`
- Rawdump: `not found`
- Dump fallback: `not found`
- Class confidence: `low`
- Class evidence: `fallback`
- Class motivation:
- LuaDoc omitted: `low-confidence`
```lua
---@class YanderePersonalityModuleConversations
```

### `__new`
- Source: `docs.txt:6348`, `not found`
- Confidence: `low`
- Evidence: `name-pattern`
- LuaDoc omitted: `low-confidence`
```lua
---@return YanderePersonalityModuleConversations
function YanderePersonalityModuleConversations.__new() end
```

## Generation summary

- Classes read: 270
- Functions read: 1884
- Classes with LuaDoc description: 23
- Functions with LuaDoc description: 70
- Functions with omitted LuaDoc description: 1814
- Classes without rawdump match: 151
- Function confidence high: 46
- Function confidence medium: 623
- Function confidence low: 1215
- Class confidence high: 23
- Class confidence medium: 98
- Class confidence low: 149
- Omitted function docs by low-confidence: 1215
- Omitted function docs by fallback: 0
- Omitted function docs by generic: 117
- Omitted function docs by name-pattern: 482
- Omitted class docs by generic/name-pattern: 98

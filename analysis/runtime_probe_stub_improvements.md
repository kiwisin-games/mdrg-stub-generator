# Runtime probe stub improvements

Generated from MDRG runtime probe report. This report is evidence only; docs.txt remains authoritative.

## Source

- Report: `probe/report-20260506-194845.txt`
- Timestamp: `20260506-194845`
- SHA256: `34f135113521e01aa87630793fd3235cae79bab25c17dcc110b22db5ec258faa`

## Runtime

- Lua version: `MoonSharp 2.0.0.0`
- MoonSharp version: `2.0.0.0`
- MoonSharp platform: `limited.unity.dll.mono.clr4.aot`
- Unity: `True`
- Safe IO / `io` present: `True` (table)
- `io.open` present: `True`
- `io.popen` present: `False`
- Safe IO likely injected: `unknown`

## Environment

- Detected context: `luaexec-with-safe-io-scene-context`
- Confidence: `low`
- Effective GameVariables source: `gv`
- Transport: `file`

## Runtime aliases

- `gv` -> `GameVariables` (userdata, Machine Readable Summary)
- `flowchart` -> `Flowchart` (userdata, Machine Readable Summary)

## Present symbols not already listed as normal runtime stubs

Known in docs.txt:
- `pack` (function)
- `unpack` (function)

Not in docs.txt:
- None

## Enum-like userdata

- `CheckType`: known enum from stubs
- `ColorSlot`: enum-like userdata
- `CommonAllowedModifiersEnum`: enum-like userdata
- `ControllerEnum`: known enum from stubs
- `EdibleTypeEnum`: enum-like userdata
- `FinishedType`: enum-like userdata
- `FishingBaitType`: known enum from stubs
- `FishingCatchBehaviourType`: enum-like userdata
- `GlobalFlag`: enum-like userdata
- `ItemCategory`: known enum from stubs
- `ItemEnum`: known enum from stubs
- `ItemSlot`: enum-like userdata
- `ItemSubCategory`: enum-like userdata
- `NoteButtonTypeEnum`: enum-like userdata
- `ScratchTextureType`: known enum from stubs
- `SlotType`: known enum from stubs
- `StoryBotContainerTypeEnum`: enum-like userdata
- `TimeCheckType`: enum-like userdata

## Callable safety summary

- `Context-dependent`: 6
- `Dangerous/Destructive`: 1
- `Read-only`: 72
- `State-changing`: 11
- `Unknown`: 16

## Probe field/value checks

- Known field probes: `113`
- Enum value probes: `34`
- Unconfirmed enum candidates: `0`
- Callback context rows: `0`
- Callback args: `0`
- Callback fields: `0`
- Callback access errors: `0`
- Callback item contexts: `0`

## Rejected automatic changes

- No methods, fields or classes are created automatically from the probe.
- Missing `GameVariables` global is treated as console/plugin context, not API absence.
- Enum userdata presence confirms runtime exposure, but values still come from docs/dumps.

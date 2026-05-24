# Callback probe alignment

`examples/mdrg_callback_context_probe.lua` and the debug mod copy now share the
same reduced runtime-context patterns used by `examples/mdrg_env_probe.lua`.

## Ported patterns

- `runtime_signals`, `detect_execution_context` and effective GameVariables
  source detection.
- safe `rawget`/index access with source labels: `raw`, `index`, `missing`
  and `error`.
- safe IO presence detection, including `io.open`, `io.read`, `io.write`,
  `io.popen` and `io.tmpfile`, without calling process/shell APIs.
- pipe-delimited machine blocks with escaping for callback context, args,
  fields and access errors.
- nested field probes for known callback arguments such as
  `nutritionProfile.Satiation.Value`.

## Not ported

- broad global dumps;
- callable inventory;
- enum discovery;
- top-level table snapshots;
- metatable expansion beyond presence checks.

The callback helper stays focused on real callback invocations. Reports remain
manual evidence and should not create stubs without checking `docs.txt` and the
curated indexes.

# MDRG Callback Debug Mod (Opt-in)

This example mod is a read-only-by-default harness for probing callback
lifetime/context with real MDRG mod assets.

It is inert unless these flags in `script.lua` are changed manually:

- `ENABLE_DEBUG_ITEMS = false`
- `ENABLE_CALLBACK_PROBE = false`
- `DEBUG_ADD_TO_SHOP = false`

For a minimum manual test in a disposable save, enable:

```lua
ENABLE_DEBUG_ITEMS = true
ENABLE_CALLBACK_PROBE = true
DEBUG_ADD_TO_SHOP = true
```

The default shop id is `clothier` (`DEBUG_SHOP_ID`). With
`DEBUG_ADD_TO_SHOP = true`, generated debug items are added there through the
normal modding API. Without that flag, items are registered but not shop-added
by this script.

The callback helper is not a copy of `examples/mdrg_env_probe.lua`. The env
probe remains the broad read-only runtime scanner. This mod uses
`mdrg_callback_context_probe.lua`, a smaller helper that runs only when a real
callback/closure is invoked by the game.

The helper reuses the safe patterns that matter inside callbacks:

- reduced runtime/injection context detection;
- safe IO presence detection without calling process or shell APIs;
- effective GameVariables source detection (`GameVariables`, `gv` or none);
- nested field probes for known callback arguments;
- access error logging;
- machine-readable blocks for later parsing.

Callback reports are written under `probe/runtime_test_NNN_debug_mod_real/`
when the safe `io.open` bridge can create files. The helper creates a
`notes.txt` next to the reports with runtime context, enabled flags and the
generated report list. Report names include timestamp, sequence, callback id
and phase, for example:

```text
callback-report-YYYYMMDD-HHMMSS-001-use_ONUSE-before.txt
```

If file writing or parent folder creation is unavailable, the helper falls
back to chunked console output with `MDRG_CALLBACK_PROBE_CHUNK` markers.

Each callback report includes:

- `Callback Runtime / Injection Context`;
- `Callback Lifecycle Matrix`;
- argument summaries;
- known field probes such as `nutritionProfile.Satiation.Value`;
- `BEGIN_MDRG_CALLBACK_CONTEXT`, `ARGS`, `FIELDS`, `ITEM_CONTEXT`,
  `RUNTIME_TEST_CONTEXT` and `ERRORS` blocks.

After a manual run, summarize all runtime test folders with:

```powershell
python tools\summarize_runtime_tests.py --root probe
```

The summary tool writes `runtime_test_summary.json` inside each test folder
and updates `analysis/runtime_tests_summary.md`.

## Debug items

When enabled, the script creates one item for each practical category:

- `Clothing`
- `Food`
- `FoodCookedDish`
- `Usable`
- `Package`
- `Room`
- `Modules`
- `Fish`
- `CookingIngredient`
- `FishingTrash`
- `Meds`
- `Soap`
- `AnonEquip`
- `Other`

The common callbacks expected from normal gameplay triggers are:

- item use: `ItemPrefab.OnUse`;
- package unpack: `ItemPrefab.OnUnpack`;
- special effects: `ItemPrefab.SpecialEffectAction`;
- random item setup: `ItemPrefab.SetRandomItemPostProcessing`;
- food nutrition fillers: `EdibleItemPrefabData.CreateInstance` and
  `CreateInstanceDish`;
- shop availability: availability callbacks passed to shop registration;
- item scope condition: `ItemScopeConditionCustom.CreateInstance`;
- texture special effect callback, only when texture cases are enabled.

Manual trigger examples:

- buy or obtain a debug item from `clothier`;
- use any debug item to observe item callback context;
- eat food/fish/ingredient debug items to observe nutrition callback context;
- unpack the package debug item;
- equip clothing/module/anon equip cases if available in the save context.

Useful manual comparison flow:

1. Run `examples/mdrg_env_probe.lua` during mod startup or through LuaExec.
2. Enable this debug mod and trigger one callback manually in game.
3. Parse reports with `tools/probe_runtime_index.py`.
4. Use `tools/probe_runtime_index.py --compare REPORT_A REPORT_B` to compare
   startup/LuaExec/callback contexts.

Contextual or experimental cases stay behind separate flags:

- `DEBUG_ENABLE_UI_CALLBACK_CASES`: UI metadata only; the script does not open
  UI automatically.
- `DEBUG_ENABLE_STORY_CONDITION_CASES`: creates story condition cases, but does
  not evaluate conditions manually.
- `DEBUG_ENABLE_COROUTINE_CASES`: lets the runtime start the coroutine closure
  only when explicitly enabled.
- `DEBUG_ENABLE_TEXTURE_CALLBACK_CASES`: requires the copied texture/sprite
  asset and a compatible runtime context.
- manager event cases remain documented/justified; this mod does not subscribe
  to long-lived manager events.

The copied asset is intentionally minimal:

- `assets/Piercing de anel no septo/tex 2 - doggy.json`
- `assets/Piercing de anel no septo/tex 2 - doggy_texture0_layer100.png`

The mod uses its own GUID and does not edit or depend on `mod/realmod` at
runtime. `mod/realmod` is reference corpus only and must stay read-only.
Validate this debug mod with:

```powershell
python tools\validate_debug_mod_real.py --root examples\callback_debug_mod_real
```

Do not use this as a production mod. It exists to produce callback reports for
manual stub/documentation review.

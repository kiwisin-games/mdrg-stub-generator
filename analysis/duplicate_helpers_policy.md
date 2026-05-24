# Duplicate helpers policy

## Callback context probe

Source of truth:

```text
examples/mdrg_callback_context_probe.lua
```

Packaged debug-mod copy:

```text
examples/callback_debug_mod_real/mdrg_callback_context_probe.lua
```

Edit the standalone helper first, then sync the debug-mod copy:

```powershell
python tools\sync_example_helpers.py --write
python tools\sync_example_helpers.py --check
```

`tools/dev.py check` runs the sync check so drift is caught before delivery.

## Safe IO stubs

Source of truth:

```text
extern/mdrg_safe_io.d.lua
```

Generated/copied addon output:

```text
library/mdrg_safe_io.d.lua
```

Do not edit the `library/` copy manually. Regenerate the addon to copy external
stubs into `library/`.

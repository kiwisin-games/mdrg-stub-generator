# MDRG addon audit summary

This package contains focused Codex prompts for improving the current MDRG LuaLS addon repository.

## Important findings from `mdrg.zip`

### Large/research inputs inside the addon tree

Largest files/directories observed:

```txt
json/mdrg_jsondump_tools/all_mods_dump/texture_json_dump.txt  ~11.6 MB
examples/mods_mixed.lua                                      ~5.7 MB
json/mdrg_jsondump_tools/all_mods_dump/png_asset_list.txt     ~1.1 MB
data/csharp_index.json                                        ~2.0 MB
documented_functions.md                                       ~659 KB
docs.txt                                                      ~419 KB
undocumented_functions.md                                     ~336 KB
```

The addon now mixes:

```txt
- distributable LuaLS addon files;
- source-of-truth docs/indexes;
- raw/research inputs;
- generated reports;
- old prompts/archive prompts;
- runtime probe outputs;
- debug mod harness.
```

This works locally, but it makes maintenance and packaging harder.

### Concrete validation issue

Running:

```powershell
python tools\validate_debug_mod_real.py --root examples\callback_debug_mod_real
```

on the supplied ZIP failed because:

1. `examples/callback_debug_mod_real/script.lua` has all opt-in flags set to `true`.
2. `validate_debug_mod_real.py` parses `DEBUG_CALLBACK_COVERAGE` and `DEBUG_ITEM_CATEGORIES` with a line-based regex, but the table is formatted across multiple lines, so it detects `coverage_entries=0` and `category_cases=0`.

This is a real bug: the validator is too brittle and the debug mod in the repository should not keep runtime-test flags enabled by default.

### Exact duplicate files

Exact duplicate content found:

```txt
examples/mdrg_callback_context_probe.lua
examples/callback_debug_mod_real/mdrg_callback_context_probe.lua
```

This may be intentional for distributable mod packaging, but it needs a sync rule/tool to avoid drift.

Also intentional generated copy:

```txt
extern/mdrg_safe_io.d.lua
library/mdrg_safe_io.d.lua
```

This should remain generated/copied, not manually edited.

### Documentation/prompt sprawl

There are many prompt files in:

```txt
archive/
old/
root prompt_codex_runtime_test_auto_folders.md
```

Keep prompts, but make archive rules clearer so active project files are not mixed with historical prompt artifacts.

### Recommended next work

Use the prompts in this ZIP roughly in this order:

```txt
01_debug_mod_safety_validator_fix.md
02_runtime_test_auto_folders.md
03_prune_raw_research_inputs.md
04_project_layout_and_gitignore_policy.md
05_unify_jsondump_asset_schema_tools.md
06_split_generate_luals_addon.md
07_generated_reports_and_analysis_policy.md
08_sync_duplicate_helpers.md
09_distribution_packaging.md
10_final_health_check.md
```

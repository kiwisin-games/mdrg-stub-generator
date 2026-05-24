-- MDRG/MoonSharp runtime environment probe.
--
-- Usage:
--   Run this file inside the MDRG Lua/MoonSharp mod environment.
--   It is read-only by design: it inspects globals, tables, functions,
--   metatables and safe runtime values, then writes report-YYYYMMDD-HHMMSS.txt
--   when io.open is available. If file writing is unavailable, it prints
--   the report in chunks.
--
-- Notes:
--   Some symbols only exist after a save, scene or UI context is loaded.
--   Reports are evidence for manual review; do not turn them into stubs
--   automatically without checking docs.txt, dumps and curated data.

-- config

local SCRIPT_VERSION = "2026-05-06"

local IO_AVAILABLE = type(io) == "table" and type(io.open) == "function"
local PROBE_MODE = IO_AVAILABLE and "file" or "safe"
local PROBE_CONTEXT_LABEL = "auto" -- examples: mod-start, mod-safeio-start, luaexec-scene, luaexec-safeio-scene, callback
local SAFE_IO_EXPECTED = false
local TABLE_ENUM_MODE = "raw" -- "raw" | "pairs"
local ENABLE_SAFE_CONTEXT_CALLS = false
local ENABLE_FULL_CONSOLE_REPORT = false
local ENABLE_DEEP_GLOBAL_DUMP = IO_AVAILABLE
local ENABLE_PACKAGE_LOADED_DUMP = false

local MAX_DEPTH = 4
local MAX_KEYS_PER_TABLE = 200
local MAX_STRING_LEN = 500
local MAX_TOTAL_LINES_FILE = 50000
local MAX_TOTAL_LINES_CONSOLE = 8000
local MAX_TOTAL_LINES = (IO_AVAILABLE or ENABLE_FULL_CONSOLE_REPORT) and MAX_TOTAL_LINES_FILE or MAX_TOTAL_LINES_CONSOLE

local MAX_TOP_LEVEL_TABLES = 120
local MAX_SNAPSHOT_KEYS = 80
local MAX_CALLABLES = (IO_AVAILABLE or ENABLE_FULL_CONSOLE_REPORT) and 1000 or 350
local CALLABLE_MAX_DEPTH = 2
local MAX_ENUM_TABLES = (IO_AVAILABLE or ENABLE_FULL_CONSOLE_REPORT) and 120 or 60
local MAX_METATABLES = (IO_AVAILABLE or ENABLE_FULL_CONSOLE_REPORT) and 120 or 60
local MAX_METATABLE_FIELDS = 40
local MAX_ERRORS = 500
local PRINT_CHUNK_SIZE = 1800
local PRINT_LINES_PER_CHUNK = 35
local MAX_PRINT_LINE_LEN = 900

local READ_ONLY_NAME_HINTS = {
  "TryGet",
  "ToLuaString",
  "ToString",
  "Get",
  "Has",
  "Is",
  "Can",
  "Check",
  "Find",
  "Calculate",
  "Determine",
  "Format",
  "GenerateCode",
  "Explain",
  "Status",
  "Summary",
}

local CONTEXT_DEPENDENT_NAME_HINTS = {
  "Generate",
  "Wait",
  "Coroutine",
  "Scene",
  "View",
  "Runtime",
  "Flowchart",
  "Lua",
}

local STATE_CHANGING_NAME_HINTS = {
  "Set",
  "Add",
  "Remove",
  "Delete",
  "Clear",
  "Reset",
  "Force",
  "Take",
  "Give",
  "Unlock",
  "Report",
  "Apply",
  "Fill",
  "Replace",
  "Sync",
  "Update",
  "Initialize",
  "NewGame",
  "Transition",
  "Repair",
  "Eat",
  "Swallow",
  "Clean",
  "Manifest",
  "End",
  "Begin",
  "Start",
  "Stop",
  "Activate",
  "Deactivate",
  "Open",
  "Close",
  "Change",
  "Move",
  "Fade",
  "Save",
  "Load",
  "Push",
  "Override",
  "Create",
  "Duplicate",
  "Join",
  "Split",
  "Sort",
  "Optimize",
  "Reload",
  "Equip",
  "Consume",
}

local SAVE_CHANGING_NAME_HINTS = {
  "Save",
  "Slot",
  "Autosave",
  "Achievement",
  "GlobalFlag",
  "Flag",
  "Money",
  "Inventory",
  "Email",
  "Delivery",
  "Contract",
  "Rent",
  "Stats",
  "GameVariables",
  "SaveContainer",
  "SaveSingleton",
}

local UI_CHANGING_NAME_HINTS = {
  "Popup",
  "Browser",
  "Ui",
  "View",
  "Scene",
  "Overlay",
  "Open",
  "Close",
  "ChangeWebsite",
  "FadeToView",
  "MoveToView",
  "Refresh",
  "SelectEmail",
  "PrintLine",
  "ClearScreen",
  "StartPlayerInput",
}

local DANGEROUS_DESTRUCTIVE_NAME_HINTS = {
  "Delete",
  "Remove",
  "Reset",
  "Force",
  "Clear",
  "Destroy",
  "Wipe",
  "Erase",
  "Consume",
  "Take",
}

local DANGEROUS_CALL_SUBSTRINGS = {
  "Add",
  "Set",
  "Remove",
  "Delete",
  "Save",
  "Load",
  "Open",
  "Change",
  "Equip",
  "Consume",
  "Create",
  "Force",
  "Unlock",
  "Report",
  "Reset",
  "Replace",
  "Start",
  "Stop",
  "Activate",
}

local READ_ONLY_EXACT_CALLABLES = {
  assert = true,
  getmetatable = true,
  ipairs = true,
  next = true,
  pairs = true,
  pcall = true,
  rawequal = true,
  rawget = true,
  rawlen = true,
  select = true,
  tonumber = true,
  tostring = true,
  type = true,
  xpcall = true,
  ["json.parse"] = true,
  ["json.serialize"] = true,
  ["json.isnull"] = true,
  ["table.concat"] = true,
  ["table.maxn"] = true,
  ["table.unpack"] = true,
  ["os.clock"] = true,
  ["os.date"] = true,
  ["os.difftime"] = true,
  ["os.time"] = true,
}

local READ_ONLY_CALLABLE_PREFIXES = {
  "string.",
  "math.",
}

local CONTEXT_DEPENDENT_CALLABLE_PREFIXES = {
  "coroutine.",
}

local LOCAL_STATE_CHANGING_CALLABLES = {
  rawset = true,
  setmetatable = true,
  ["debug.sethook"] = true,
  ["debug.setupvalue"] = true,
  ["debug.upvaluejoin"] = true,
  ["math.randomseed"] = true,
  ["table.insert"] = true,
  ["table.remove"] = true,
  ["table.sort"] = true,
}

local RUNTIME_STUB_SYMBOLS = {
  "_G",
  "_VERSION",
  "_MOONSHARP",
  "assert",
  "collectgarbage",
  "coroutine",
  "debug",
  "error",
  "getmetatable",
  "ipairs",
  "json",
  "io",
  "math",
  "next",
  "os",
  "package",
  "pairs",
  "pcall",
  "print",
  "rawequal",
  "rawget",
  "rawlen",
  "rawset",
  "select",
  "setmetatable",
  "string",
  "table",
  "tonumber",
  "tostring",
  "type",
  "xpcall",
  "CurrentModGuid",
  "ModUtilities",
  "GameUtilities",
  "GameVariables",
  "Item",
  "ItemPrefab",
  "ItemPrefabManager",
  "ItemManager",
  "GameId",
  "Guid",
  "Color",
  "Vector2",
  "Vector3",
  "Quaternion",
  "ColorPalette",
  "ColorPaletteEntry",
  "ItemEnum",
  "ControllerEnum",
  "SceneEnumFlag",
  "ColoringGroupEnum",
  "FishingBaitType",
  "ItemCategory",
  "ScratchTextureType",
  "CustomShaderTypeEnum",
  "ItemLocationEnum",
  "ItemSlot",
  "ItemSlotEnum",
  "ShopItemType",
  "SlotType",
  "UpdateTexturesFromCurrentlyEquippedTypeEnum",
  "CheckType",
  "DeliveryStatus",
  "EquipResults",
  "EyeSelection",
  "ArmState",
  "UiOverlay",
  "BrowserPopup",
  "BotStatusAppPopup",
  "Flowchart",
  "Save",
  "SaveContainer",
  "SaveSingleton",
  "StoryCondition",
  "StoryBotDialogueBranch",
  "StoryBotDialogueBranchContainer",
  "LuaPersonalityModuleDefinition",
  "PersonalityModuleDefinition",
  "TextureOverriderManager",
  "PackedTexturesContainer",
  "ColorSlot",
  "ColorPaletteManager",
  "SlotEquipData",
  "EdibleData",
  "EdibleItemPrefabData",
  "SimpleLocalizedString",
  "AllowedModifiers",
  "AtLeastOneBoolVariableTrueRequirement",
  "CommonAllowedModifiersEnum",
  "CookingSong",
  "CookingSongRuntimeData",
  "EdibleItemNutritionProfile",
  "EdibleTypeEnum",
  "FinishedType",
  "FishingBaitItemPrefabData",
  "FishingCatchBehaviourType",
  "FishingRodItemPrefabData",
  "FishItemPrefabData",
  "FishPreferences",
  "flowchart",
  "GlobalFlag",
  "gv",
  "ItemModifiableVariableFactory",
  "ItemModifiableVariablesRequirement",
  "ItemScopeCondition",
  "ItemScopeConditionAlwaysTrueCondition",
  "ItemScopeConditionCustom",
  "ItemScopeConditionSpecialVariable",
  "ItemSubCategory",
  "Live2DControllerSingleton",
  "NewsId",
  "NoteButtonTypeEnum",
  "R",
  "Recipe",
  "Result",
  "Shop",
  "ShopItem",
  "ShopManager",
  "SingleArgumentComparators",
  "SlotManager",
  "SoundSingleton",
  "StoryAutoBranch",
  "StoryBlockTarget",
  "StoryBotContainerTypeEnum",
  "StoryBranchTarget",
  "StoryEnumeratorTarget",
  "StoryLocalizedConversationBranchTarget",
  "StoryMenuBranch",
  "StorySingleton",
  "SusArea",
  "SusModifier",
  "TimeCheckType",
  "TwoArgumentComparators",
  "ViewSingleton",
}

local STUB_ONLY_ALIASES = {
  "MdrgKnownWebsiteId",
  "MdrgKnownStoryFlagId",
  "MdrgKnownPaletteName",
  "MdrgKnownShopId",
  "MdrgKnownControllerId",
  "MdrgKnownColorSlotName",
  "MdrgKnownEquipmentSlotId",
  "MdrgKnownDialogueContainerId",
}

local ENUM_PRIORITY_NAMES = {
  "ItemEnum",
  "ControllerEnum",
  "SceneEnumFlag",
  "ColoringGroupEnum",
  "FishingBaitType",
  "ItemCategory",
  "ScratchTextureType",
  "CustomShaderTypeEnum",
  "ItemLocationEnum",
  "ItemSlotEnum",
  "ShopItemType",
  "SlotType",
  "UpdateTexturesFromCurrentlyEquippedTypeEnum",
  "CheckType",
  "DeliveryStatus",
  "EquipResults",
  "EyeSelection",
  "ArmState",
}

local GLOBAL_DUMP_ROOTS = {
  "_MOONSHARP",
  "json",
  "io",
  "string",
  "table",
  "math",
  "coroutine",
  "os",
  "debug",
  "ModUtilities",
  "GameUtilities",
  "GameVariables",
  "ItemPrefab",
  "ItemPrefabManager",
  "GameId",
  "UiOverlay",
}

local METATABLE_PRIORITY_SYMBOLS = {
  "ModUtilities",
  "GameUtilities",
  "Item",
  "ItemPrefab",
  "ItemPrefabManager",
  "GameId",
  "Guid",
  "Color",
  "ColorPalette",
  "ColorPaletteEntry",
  "ItemEnum",
  "ControllerEnum",
  "SceneEnumFlag",
  "ColoringGroupEnum",
  "FishingBaitType",
  "CheckType",
  "DeliveryStatus",
  "EquipResults",
  "EyeSelection",
  "ArmState",
  "UiOverlay",
  "BrowserPopup",
  "BotStatusAppPopup",
}

local GAMEVARIABLES_CURRENT_FIELDS = {
  "time",
  "money",
  "playerName",
  "botName",
  "stage",
}

local SKIPPED_VALIDATIONS = {
  "ModUtilities.CreateItemPrefab",
  "ModUtilities.CreateNewItem",
  "ModUtilities.CreateNewItemAutoAssignId",
  "GameUtilities.AddItemToInventory",
  "GameUtilities.RemoveItemFromInventory",
  "SaveContainer.AddGlobalFlag",
  "SaveContainer.Save",
  "UiOverlay.OpenBrowser",
  "BrowserPopup.ChangeWebsite",
  "Item.Consume",
  "Item.Equip",
}

local KNOWN_RUNTIME_ALIASES = {
  {
    name = "gv",
    target = "GameVariables",
    note = "Legacy/internal alias observed for GameVariables.",
  },
  {
    name = "flowchart",
    target = "Flowchart",
    note = "Fungus flowchart object injected in internal scripts.",
  },
}

local USERDATA_KNOWN_FIELD_PROBES = {
  ModUtilities = {
    "GetGameVariables",
    "GetNewGuid",
    "CreateItemPrefab",
    "CreateNewItem",
    "CreateNewItemAutoAssignId",
    "GetController",
    "StartCoroutine",
    "StopCoroutine",
    "WaitForSeconds",
  },
  GameUtilities = {
    "WaitForSecondsYield",
    "AddItemToInventory",
    "FadeToView",
    "MoveToView",
    "FadeOrMoveToView",
    "GetCurrentYearToInteger",
  },
  UiOverlay = {
    "OpenBrowser",
    "OpenShop",
    "OpenSimplePopup",
    "CloseAll",
  },
  SoundSingleton = {
    "LuaInstance",
    "PlaySound",
    "PlayMusic",
    "StopMusic",
  },
  ViewSingleton = {
    "LuaInstance",
    "SetNextView",
    "GetNotCurrentView",
    "UpdateViewReferences",
  },
  Item = {
    "__new",
    "CreateRandomItem",
    "CreateDefaultItemForLive2DController",
    "GetName",
    "GetDescription",
    "GetCount",
    "GetPrice",
    "GetItemPrefab",
    "IsEquipped",
    "CanBeUsed",
    "CanBeUnpacked",
    "GetQualityString",
    "ColorSlotId",
  },
  ItemPrefab = {
    "__new",
    "CreateInstance",
    "ColorSlotId",
    "ToLuaString",
    "Clone",
  },
  ItemPrefabManager = {
    "GetItemPrefab",
    "TryGetItemPrefab",
    "GetItemById",
  },
  GameId = {
    "__new",
    "CreateVanilla",
    "CreateModded",
    "CreateGeneric",
    "FromShortString",
    "ToString",
    "ToLuaString",
    "ToShortString",
  },
  Guid = {
    "__new",
    "ToString",
    "Parse",
  },
  SaveContainer = {
    "HasGlobalFlag",
    "AddGlobalFlag",
    "TryGetGlobalFlag",
    "HasAchievement",
    "UnlockAchievement",
    "RemoveAchievement",
    "GetPercentageOfSeenStoryText",
  },
  SaveSingleton = {
    "GetSaveContainerAsString",
    "SaveAllChanges",
    "ResetAllData",
    "TryMakeAutoSave",
  },
  StoryCondition = {
    "And",
    "Or",
    "Not",
    "Lua",
    "Delegate",
  },
  StoryBotDialogueBranch = {
    "__new",
  },
  StorySingleton = {
    "GetFlowchart",
    "GetStage",
    "TryGetTag",
    "GenerateSummary",
  },
  flowchart = {
    "GetName",
    "IsActive",
    "HasBlock",
    "ExecuteBlock",
    "StopBlock",
    "GetIntegerVariable",
    "GetStringVariable",
    "GetBooleanVariable",
    "SetIntegerVariable",
    "SetStringVariable",
    "SetBooleanVariable",
  },
  gv = {
    "Hour",
    "Minute",
    "DayOfTheWeek",
    "Money",
    "MentalHealth",
    "Satiation",
    "Health",
    "CheckFlag",
    "CheckFlagAfterRelative",
    "ForceTakeMoney",
    "ReportSleepEnd",
  },
  io = {
    "open",
    "close",
    "flush",
    "input",
    "output",
    "read",
    "write",
    "lines",
    "type",
    "tmpfile",
    "popen",
  },
}

local ENUM_VALUE_PROBES = {
  ControllerEnum = {
    "NoScene",
    "Missionary",
    "Interaction",
  },
  ItemCategory = {
    "Room",
    "Clothing",
    "Food",
  },
  ScratchTextureType = {
    "Universal",
  },
  CommonAllowedModifiersEnum = {
    "None",
    "FishingRod",
  },
  EdibleTypeEnum = {
    "Other",
    "Meat",
    "Fish",
    "Dish",
  },
  FishingCatchBehaviourType = {
    "Normal",
    "Floater",
    "Fighter",
    "Rock",
    "Sinker",
  },
}

local ENUM_VALUE_CANDIDATES_UNCONFIRMED = {
  ItemCategory = { "Misc" },
  FishingBaitType = { "None", "Worm" },
  SlotType = { "Normal" },
  CheckType = { "Equal", "NotEqual", "Greater", "Less" },
  EquipResults = { "Success", "FailedBlocked", "FailedMissingRequired", "FailedNonEquipable" },
  EyeSelection = { "LeftEye", "RightEye", "BothEyes" },
  ArmState = { "Default" },
}

local ROOT_G = _G
if type(ROOT_G) ~= "table" then
  ROOT_G = {}
end

-- report writer

local Report = {
  lines = {},
  dropped = 0,
}

function Report:line(text)
  if #self.lines >= MAX_TOTAL_LINES then
    self.dropped = self.dropped + 1
    return
  end

  if text == nil then
    text = ""
  else
    text = tostring(text)
  end

  local start_pos = 1
  while true do
    local nl = string.find(text, "\n", start_pos, true)
    if not nl then
      if #self.lines < MAX_TOTAL_LINES then
        self.lines[#self.lines + 1] = string.sub(text, start_pos)
      else
        self.dropped = self.dropped + 1
      end
      break
    end
    if #self.lines < MAX_TOTAL_LINES then
      self.lines[#self.lines + 1] = string.sub(text, start_pos, nl - 1)
    else
      self.dropped = self.dropped + 1
      break
    end
    start_pos = nl + 1
  end
end

function Report:section(title)
  self:line("")
  self:line("## " .. title)
  self:line(string.rep("-", string.len(title) + 3))
end

function Report:text()
  local copy = {}
  for i = 1, #self.lines do
    copy[i] = self.lines[i]
  end
  if self.dropped > 0 then
    copy[#copy + 1] = ""
    copy[#copy + 1] = "Report line limit reached; dropped lines: " .. tostring(self.dropped)
  end
  return table.concat(copy, "\n")
end

-- safe helpers

local ACCESS_ERRORS = {}

local function remember_error(context, err)
  if #ACCESS_ERRORS >= MAX_ERRORS then
    return
  end
  ACCESS_ERRORS[#ACCESS_ERRORS + 1] = tostring(context) .. ": " .. tostring(err)
end

local function safe_type(value)
  local ok, result = pcall(type, value)
  if ok then
    return result
  end
  remember_error("type", result)
  return "<type-error>"
end

local function safe_tostring(value)
  local ok, result = pcall(tostring, value)
  if ok then
    return result
  end
  remember_error("tostring", result)
  return "<tostring-error>"
end

local function safe_raw_get(value, key)
  if safe_type(rawget) ~= "function" or safe_type(value) ~= "table" then
    return false, nil, "missing"
  end

  local ok, result = pcall(rawget, value, key)
  if ok then
    return true, result, result == nil and "missing" or "raw"
  end
  remember_error("rawget " .. safe_tostring(key), result)
  return false, nil, "error", result
end

local function safe_index_get(value, key)
  if safe_type(rawget) == "function" and safe_type(value) == "table" then
    local ok_raw, raw_value = pcall(rawget, value, key)
    if ok_raw then
      if raw_value ~= nil then
        return true, raw_value, "raw"
      end
    else
      remember_error("rawget " .. safe_tostring(key), raw_value)
    end
  end

  local ok, result = pcall(function()
    return value[key]
  end)
  if ok then
    return true, result, result == nil and "missing" or "index"
  end
  remember_error("get " .. safe_tostring(key), result)
  return false, nil, "error", result
end

local function safe_get(value, key)
  local ok, result, source, err = safe_index_get(value, key)
  return ok, result, err or source
end

local function safe_metatable(value)
  if safe_type(getmetatable) ~= "function" then
    return false, nil, "getmetatable unavailable"
  end
  local ok, result = pcall(getmetatable, value)
  if ok then
    return true, result
  end
  remember_error("getmetatable", result)
  return false, nil, result
end

local function safe_call(name, fn, ...)
  if safe_type(fn) ~= "function" then
    return false, nil, "not a function"
  end
  local ok, result = pcall(fn, ...)
  if ok then
    return true, result
  end
  remember_error(name, result)
  return false, nil, result
end

local function raw_table_entries(tbl, limit, context)
  local entries = {}
  local truncated = false

  if safe_type(next) ~= "function" then
    return entries, false, "next unavailable"
  end

  local control = nil
  while true do
    local ok_next, key, value = pcall(next, tbl, control)
    if not ok_next then
      remember_error(context or "next", key)
      return entries, truncated, key
    end
    if key == nil then
      break
    end
    control = key

    if #entries >= limit then
      truncated = true
      break
    end

    entries[#entries + 1] = {
      key = key,
      key_text = safe_tostring(key),
      value = value,
      value_type = safe_type(value),
    }
  end

  table.sort(entries, function(a, b)
    return a.key_text < b.key_text
  end)

  return entries, truncated, nil
end

local function pairs_table_entries(tbl, limit, context)
  local entries = {}
  local truncated = false

  if safe_type(pairs) ~= "function" then
    return entries, false, "pairs unavailable"
  end

  local ok_pairs, iter, state, control = pcall(pairs, tbl)
  if not ok_pairs then
    remember_error(context or "pairs", iter)
    return entries, false, iter
  end

  while true do
    local ok_next, key, value = pcall(iter, state, control)
    if not ok_next then
      remember_error(context or "next", key)
      return entries, truncated, key
    end
    if key == nil then
      break
    end
    control = key

    if #entries >= limit then
      truncated = true
      break
    end

    entries[#entries + 1] = {
      key = key,
      key_text = safe_tostring(key),
      value = value,
      value_type = safe_type(value),
    }
  end

  table.sort(entries, function(a, b)
    return a.key_text < b.key_text
  end)

  return entries, truncated, nil
end

local function table_entries(tbl, limit, context)
  if TABLE_ENUM_MODE == "pairs" then
    return pairs_table_entries(tbl, limit, context)
  end
  return raw_table_entries(tbl, limit, context)
end

-- value formatting

local function truncate_string(value, max_len)
  max_len = max_len or MAX_STRING_LEN
  if value == nil then
    return ""
  end
  value = tostring(value)
  value = string.gsub(value, "\r", "\\r")
  value = string.gsub(value, "\n", "\\n")
  value = string.gsub(value, "\t", "\\t")
  if string.len(value) > max_len then
    return string.sub(value, 1, max_len) .. "...<truncated>"
  end
  return value
end

local function format_value(value)
  local typ = safe_type(value)
  if typ == "string" then
    return '"' .. truncate_string(value) .. '"'
  end
  if typ == "number" or typ == "boolean" or typ == "nil" then
    return safe_tostring(value)
  end
  return "<" .. typ .. ": " .. truncate_string(safe_tostring(value), 160) .. ">"
end

local function machine_text(value)
  local text = truncate_string(safe_tostring(value), 260)
  text = string.gsub(text, "|", "/")
  text = string.gsub(text, "\r", "\\r")
  text = string.gsub(text, "\n", "\\n")
  return text
end

local function path_segment(key)
  local typ = safe_type(key)
  if typ == "string" and string.match(key, "^[A-Za-z_][A-Za-z0-9_]*$") then
    return "." .. key
  end
  return "[" .. format_value(key) .. "]"
end

local function starts_with_alpha(text)
  return string.match(text, "^[A-Za-z_]") ~= nil
end

local function string_starts_with(text, prefix)
  text = tostring(text or "")
  prefix = tostring(prefix or "")
  return string.sub(text, 1, string.len(prefix)) == prefix
end

local function path_has_prefix(path, prefixes)
  for _, prefix in ipairs(prefixes) do
    if string_starts_with(path, prefix) then
      return true
    end
  end
  return false
end

local function canonical_callable_path(path)
  path = tostring(path or "")

  if string_starts_with(path, "_G.") then
    path = string.sub(path, 4)
  end

  local package_loaded_prefix = "package.loaded."
  if string_starts_with(path, package_loaded_prefix) then
    path = string.sub(path, string.len(package_loaded_prefix) + 1)
    if string_starts_with(path, "_G.") then
      path = string.sub(path, 4)
    end
  end

  return path
end

local function callable_leaf_name(path)
  path = canonical_callable_path(path)
  local leaf = string.match(path, "%.([A-Za-z_][A-Za-z0-9_]*)$")
  if leaf then
    return leaf
  end
  leaf = string.match(path, "^([A-Za-z_][A-Za-z0-9_]*)$")
  if leaf then
    return leaf
  end
  leaf = string.match(path, "([A-Za-z_][A-Za-z0-9_]*)$")
  return leaf or path
end

local function callable_root_name(path)
  path = canonical_callable_path(path)
  local root = string.match(path, "^([A-Za-z_][A-Za-z0-9_]*)")
  return root or path
end

local function contains_hint_case_insensitive(text, hints)
  local lowered = string.lower(tostring(text or ""))
  for _, hint in ipairs(hints) do
    if string.find(lowered, string.lower(hint), 1, true) then
      return true
    end
  end
  return false
end

local function safety_rank(category)
  if category == "Dangerous/Destructive" then
    return 7
  end
  if category == "Save-changing" then
    return 6
  end
  if category == "UI-changing" then
    return 5
  end
  if category == "State-changing" then
    return 4
  end
  if category == "Context-dependent" then
    return 3
  end
  if category == "Read-only" then
    return 2
  end
  return 1
end

local function max_safety_category(current, candidate)
  if safety_rank(candidate) > safety_rank(current) then
    return candidate
  end
  return current
end

local function classify_api_safety(path)
  path = canonical_callable_path(path)
  local leaf = callable_leaf_name(path)
  local root = callable_root_name(path)
  local category = "Unknown"

  if root == "io" then
    if leaf == "popen" then
      return "Dangerous/Destructive"
    end
    if leaf == "open" or leaf == "write" or leaf == "tmpfile" or leaf == "output" then
      return "State-changing"
    end
    if leaf == "read" or leaf == "lines" or leaf == "type" then
      return "Read-only"
    end
    return "Context-dependent"
  end

  if LOCAL_STATE_CHANGING_CALLABLES[path] or LOCAL_STATE_CHANGING_CALLABLES[leaf] then
    category = max_safety_category(category, "State-changing")
  end

  if READ_ONLY_EXACT_CALLABLES[path] or READ_ONLY_EXACT_CALLABLES[leaf] then
    return "Read-only"
  end

  if path_has_prefix(path, READ_ONLY_CALLABLE_PREFIXES) then
    if category == "State-changing" then
      return category
    end
    return "Read-only"
  end

  if path_has_prefix(path, CONTEXT_DEPENDENT_CALLABLE_PREFIXES) then
    return "Context-dependent"
  end

  local leaf_is_read_only = contains_hint_case_insensitive(leaf, READ_ONLY_NAME_HINTS)
  if leaf_is_read_only then
    category = max_safety_category(category, "Read-only")
  end
  if contains_hint_case_insensitive(leaf, CONTEXT_DEPENDENT_NAME_HINTS) then
    category = max_safety_category(category, "Context-dependent")
  end
  if contains_hint_case_insensitive(leaf, STATE_CHANGING_NAME_HINTS) then
    category = max_safety_category(category, "State-changing")
  end
  if
    (root == "UiOverlay" or root == "BrowserPopup" or root == "BotStatusAppPopup")
    and not leaf_is_read_only
    and (contains_hint_case_insensitive(leaf, UI_CHANGING_NAME_HINTS) or safety_rank(category) >= safety_rank("State-changing"))
  then
    category = max_safety_category(category, "UI-changing")
  end

  if
    (root == "Save" or root == "SaveContainer" or root == "SaveSingleton" or root == "GameVariables")
    and not leaf_is_read_only
    and (contains_hint_case_insensitive(leaf, SAVE_CHANGING_NAME_HINTS) or safety_rank(category) >= safety_rank("State-changing"))
  then
    category = max_safety_category(category, "Save-changing")
  end
  if contains_hint_case_insensitive(leaf, DANGEROUS_DESTRUCTIVE_NAME_HINTS) then
    category = max_safety_category(category, "Dangerous/Destructive")
  end

  return category
end

local function is_dangerous_callable_name(name)
  local path = canonical_callable_path(name)
  local leaf = callable_leaf_name(path)
  return contains_hint_case_insensitive(leaf, DANGEROUS_CALL_SUBSTRINGS)
end

local function symbol_exists(name)
  local ok, value = safe_index_get(ROOT_G, name)
  if not ok then
    return false, nil, "access-error"
  end
  if value == nil then
    return false, nil, nil
  end
  return true, value, nil
end

local function get_effective_game_variables()
  local exists, value = symbol_exists("GameVariables")
  if exists then
    return value, "GameVariables"
  end

  exists, value = symbol_exists("gv")
  if exists then
    return value, "gv"
  end

  if ENABLE_SAFE_CONTEXT_CALLS then
    local has_mod_utilities, mod_utilities = symbol_exists("ModUtilities")
    if has_mod_utilities then
      local ok_method, method = safe_index_get(mod_utilities, "GetGameVariables")
      if ok_method and safe_type(method) == "function" and not is_dangerous_callable_name("ModUtilities.GetGameVariables") then
        local ok_call, result = safe_call("ModUtilities.GetGameVariables", method)
        if ok_call and result ~= nil then
          return result, "ModUtilities.GetGameVariables"
        end
      end
    end
  end

  return nil, "none"
end

local function runtime_signals()
  local signals = {}

  signals.current_mod_guid_present = symbol_exists("CurrentModGuid")
  signals.gamevariables_present = symbol_exists("GameVariables")
  signals.gv_present = symbol_exists("gv")
  signals.flowchart_present = symbol_exists("flowchart")
  signals.modutilities_present = symbol_exists("ModUtilities")
  signals.gameutilities_present = symbol_exists("GameUtilities")
  signals.io_present = symbol_exists("io")

  local io_exists, io_value = symbol_exists("io")
  if io_exists then
    local ok_open, open_value = safe_index_get(io_value, "open")
    local ok_read, read_value = safe_index_get(io_value, "read")
    local ok_write, write_value = safe_index_get(io_value, "write")
    local ok_popen, popen_value = safe_index_get(io_value, "popen")
    local ok_tmpfile, tmpfile_value = safe_index_get(io_value, "tmpfile")
    signals.io_open_present = ok_open and safe_type(open_value) == "function"
    signals.io_read_present = ok_read and safe_type(read_value) == "function"
    signals.io_write_present = ok_write and safe_type(write_value) == "function"
    signals.io_popen_present = ok_popen and safe_type(popen_value) == "function"
    signals.io_tmpfile_present = ok_tmpfile and safe_type(tmpfile_value) == "function"
  else
    signals.io_open_present = false
    signals.io_read_present = false
    signals.io_write_present = false
    signals.io_popen_present = false
    signals.io_tmpfile_present = false
  end

  local effective_gv, effective_source = get_effective_game_variables()
  signals.effective_gamevariables_present = effective_gv ~= nil
  signals.effective_gamevariables_source = effective_source
  signals.transport = IO_AVAILABLE and "file" or "console-fallback"
  signals.safe_io_expected = SAFE_IO_EXPECTED
  signals.safe_io_likely_injected = signals.io_present and (SAFE_IO_EXPECTED or signals.io_open_present)

  return signals
end

local function add_reason(reasons, condition, text)
  if condition then
    reasons[#reasons + 1] = text
  end
end

local function detect_execution_context()
  local signals = runtime_signals()
  local detected = "unknown"
  local confidence = "low"
  local interpretation = "Insufficient signals to classify this runtime precisely."

  if PROBE_CONTEXT_LABEL ~= "auto" then
    detected = PROBE_CONTEXT_LABEL
    confidence = "manual"
    interpretation = "Manual probe context label was configured by the script user."
  elseif signals.gamevariables_present then
    detected = "save-aware-context"
    confidence = "medium"
    interpretation = "A save/runtime GameVariables object is globally available."
  elseif signals.current_mod_guid_present and signals.io_open_present and not signals.gv_present and not signals.flowchart_present then
    detected = "mod-with-safe-io-start"
    confidence = "medium"
    interpretation = "This looks like a real mod startup script with LuaPatch safe IO available."
  elseif signals.current_mod_guid_present and not signals.gv_present and not signals.flowchart_present then
    detected = "mod-start"
    confidence = "medium"
    interpretation = "This looks like a real mod startup/registration-time script before save/Fungus context."
  elseif not signals.current_mod_guid_present and signals.gv_present and signals.flowchart_present and signals.io_open_present then
    detected = "luaexec-with-safe-io-scene-context"
    confidence = "medium"
    interpretation = "This looks like manual LuaExec/plugin execution in a scene/Fungus context with safe IO."
  elseif not signals.current_mod_guid_present and signals.gv_present and signals.flowchart_present then
    detected = "luaexec-scene-context"
    confidence = "medium"
    interpretation = "This looks like manual LuaExec/plugin execution in a scene/Fungus context."
  elseif signals.modutilities_present or signals.gameutilities_present then
    detected = "unknown-plugin-context"
    confidence = "low"
    interpretation = "Core utilities are present, but lifetime-specific signals are incomplete."
  end

  local reasons = {}
  add_reason(reasons, signals.current_mod_guid_present, "CurrentModGuid present")
  add_reason(reasons, not signals.current_mod_guid_present, "CurrentModGuid missing")
  add_reason(reasons, signals.gamevariables_present, "GameVariables present")
  add_reason(reasons, not signals.gamevariables_present, "GameVariables missing")
  add_reason(reasons, signals.gv_present, "gv present")
  add_reason(reasons, not signals.gv_present, "gv missing")
  add_reason(reasons, signals.flowchart_present, "flowchart present")
  add_reason(reasons, not signals.flowchart_present, "flowchart missing")
  add_reason(reasons, signals.io_open_present, "io.open present")
  add_reason(reasons, signals.modutilities_present, "ModUtilities present")
  add_reason(reasons, signals.gameutilities_present, "GameUtilities present")

  return {
    detected_context = detected,
    confidence = confidence,
    interpretation = interpretation,
    reasons = reasons,
    signals = signals,
  }
end

-- table dumping

local enum_like_kind

local function dump_value(name, value, depth, visited)
  depth = depth or 0
  visited = visited or {}

  local typ = safe_type(value)
  local indent = string.rep("  ", depth)

  if typ ~= "table" then
    Report:line(indent .. name .. " = " .. format_value(value))
    return
  end

  if visited[value] then
    Report:line(indent .. name .. " = <cycle: already visited at " .. visited[value] .. ">")
    return
  end
  visited[value] = name

  Report:line(indent .. name .. " = <table>")
  if depth >= MAX_DEPTH then
    Report:line(indent .. "  <max depth reached>")
    return
  end

  local entries, truncated = table_entries(value, MAX_KEYS_PER_TABLE, name)
  for _, entry in ipairs(entries) do
    dump_value(name .. path_segment(entry.key), entry.value, depth + 1, visited)
  end
  if truncated then
    Report:line(indent .. "  <table truncated at " .. tostring(MAX_KEYS_PER_TABLE) .. " keys>")
  end
end

local function table_profile(tbl, limit, context)
  local entries, truncated = table_entries(tbl, limit, context)
  local counts = {}
  local samples = {}

  for _, entry in ipairs(entries) do
    counts[entry.value_type] = (counts[entry.value_type] or 0) + 1
    if #samples < MAX_SNAPSHOT_KEYS then
      samples[#samples + 1] = entry.key_text .. ":" .. entry.value_type
    end
  end

  return entries, truncated, counts, samples
end

local function counts_to_text(counts)
  local parts = {}
  for typ, count in pairs(counts) do
    parts[#parts + 1] = typ .. "=" .. tostring(count)
  end
  table.sort(parts)
  return table.concat(parts, ", ")
end

local function table_shape_summary(name, value)
  local entries, truncated, counts, samples = table_profile(value, MAX_KEYS_PER_TABLE, name)
  local ok_mt, mt = safe_metatable(value)
  local scalars = (counts.string or 0) + (counts.number or 0) + (counts.boolean or 0)
  local mt_text = "none"
  if ok_mt and mt ~= nil then
    mt_text = safe_type(mt)
  elseif not ok_mt then
    mt_text = "access-error"
  end

  local kind = "no"
  if enum_like_kind ~= nil then
    local accepted, detected_kind = enum_like_kind(name, value)
    if accepted then
      kind = detected_kind
    end
  end

  return {
    entries = entries,
    truncated = truncated,
    counts = counts,
    samples = samples,
    functions = counts["function"] or 0,
    tables = counts["table"] or 0,
    userdata = counts.userdata or 0,
    scalars = scalars,
    metatable = mt_text,
    enum_like = kind,
  }
end

local function dump_top_level_table_snapshot(name, value)
  local shape = table_shape_summary(name, value)

  Report:line("- " .. name)
  Report:line("  accessible keys sampled: " .. tostring(#shape.entries) .. (shape.truncated and " (truncated)" or ""))
  Report:line(
    "  functions ~= "
      .. tostring(shape.functions)
      .. ", tables ~= "
      .. tostring(shape.tables)
      .. ", userdata ~= "
      .. tostring(shape.userdata)
      .. ", scalars ~= "
      .. tostring(shape.scalars)
  )
  Report:line("  value types: " .. counts_to_text(shape.counts))
  Report:line("  metatable: " .. shape.metatable)
  Report:line("  enum-like/constant-like: " .. shape.enum_like)
  if #shape.samples > 0 then
    Report:line("  key sample: " .. truncate_string(table.concat(shape.samples, ", "), 1000))
  end
end

-- callable inventory

local function add_callable(output, path, origin)
  if #output >= MAX_CALLABLES then
    return
  end
  local canonical_path = canonical_callable_path(path)
  output.seen = output.seen or {}
  if output.seen[canonical_path] then
    return
  end
  output.seen[canonical_path] = true

  local safety = classify_api_safety(canonical_path)
  local canonical_origin = origin
  if canonical_path ~= path then
    canonical_origin = tostring(origin or "table-field") .. ", canonical"
  end
  output[#output + 1] = {
    path = canonical_path,
    typ = "function",
    origin = canonical_origin,
    safety = safety,
    dangerous = safety ~= "Read-only"
      and (is_dangerous_callable_name(path) or safety_rank(safety) >= safety_rank("State-changing")),
  }
end

local function collect_callable_inventory(root_name, value, depth, visited, output, origin)
  origin = origin or "table-field"
  if #output >= MAX_CALLABLES then
    return
  end
  if depth > CALLABLE_MAX_DEPTH then
    return
  end
  if safe_type(value) ~= "table" then
    return
  end
  if visited[value] then
    return
  end
  visited[value] = root_name

  local entries = table_entries(value, MAX_KEYS_PER_TABLE, root_name)
  for _, entry in ipairs(entries) do
    if #output >= MAX_CALLABLES then
      return
    end
    local child_path = root_name .. path_segment(entry.key)
    if entry.value_type == "function" then
      local child_origin = origin
      if root_name == "_G" and depth == 0 then
        child_origin = "global"
      end
      add_callable(output, child_path, child_origin)
    elseif entry.value_type == "table" then
      collect_callable_inventory(child_path, entry.value, depth + 1, visited, output, "table-field")
    elseif entry.value_type == "userdata" then
      -- Userdata is not expanded aggressively. Metatable functions are collected elsewhere.
    end
  end
end

local function collect_metatable_callables(name, value, output, origin)
  if #output >= MAX_CALLABLES then
    return
  end

  local ok, mt = safe_metatable(value)
  if not ok or safe_type(mt) ~= "table" then
    return
  end

  local entries = table_entries(mt, MAX_KEYS_PER_TABLE, name .. "<metatable>")
  for _, entry in ipairs(entries) do
    if #output >= MAX_CALLABLES then
      return
    end
    local mt_path = name .. "<metatable>" .. path_segment(entry.key)
    if entry.value_type == "function" then
      add_callable(output, mt_path, origin or "metatable")
    elseif entry.key == "__index" and entry.value_type == "table" then
      collect_callable_inventory(mt_path, entry.value, 0, {}, output, origin or "metatable")
    end
  end
end

local function collect_all_callables(entries)
  local output = {}
  local visited = {}

  for _, entry in ipairs(entries) do
    if #output >= MAX_CALLABLES then
      break
    end
    if entry.value_type == "function" then
      add_callable(output, entry.key_text, "global")
    end
  end

  for _, name in ipairs(RUNTIME_STUB_SYMBOLS) do
    if #output >= MAX_CALLABLES then
      break
    end
    local exists, value = symbol_exists(name)
    if exists then
      local typ = safe_type(value)
      if typ == "function" then
        add_callable(output, name, "known-stub-symbol")
      elseif typ == "table" then
        if name ~= "_G" then
          collect_callable_inventory(name, value, 0, visited, output, "known-stub-symbol")
        end
        collect_metatable_callables(name, value, output, "metatable")
      elseif typ == "userdata" then
        collect_metatable_callables(name, value, output, "userdata-known-field")
      end
    end
  end

  for _, entry in ipairs(entries) do
    if #output >= MAX_CALLABLES then
      break
    end
    if entry.value_type == "table" then
      collect_callable_inventory(entry.key_text, entry.value, 0, visited, output, "table-field")
      collect_metatable_callables(entry.key_text, entry.value, output, "metatable")
    elseif entry.value_type == "userdata" then
      collect_metatable_callables(entry.key_text, entry.value, output, "metatable")
    end
  end

  table.sort(output, function(a, b)
    return a.path < b.path
  end)

  return output
end

-- enum/constants scan

local function is_priority_enum_name(name)
  for _, expected in ipairs(ENUM_PRIORITY_NAMES) do
    if name == expected then
      return true
    end
  end
  return false
end

local function is_enum_like_name(name)
  if is_priority_enum_name(name) then
    return true
  end
  local endings = { "Enum", "Flag", "Type", "Category", "Slot", "State", "Mode" }
  for _, ending in ipairs(endings) do
    if string.match(name, ending .. "$") then
      return true
    end
  end
  return false
end

local function is_enum_like_userdata_name(name)
  if is_priority_enum_name(name) or ENUM_VALUE_PROBES[name] ~= nil then
    return true
  end
  local endings = { "Enum", "Type", "Status", "Selection" }
  for _, ending in ipairs(endings) do
    if string.match(name, ending .. "$") then
      return true
    end
  end
  return false
end

local function enum_like_score(name, value)
  if safe_type(value) ~= "table" then
    return false, "not-table", nil
  end

  local entries, truncated = table_entries(value, MAX_KEYS_PER_TABLE, name)
  local scalar_count = 0
  local total_count = 0
  local function_count = 0
  local table_count = 0
  local userdata_count = 0

  for _, entry in ipairs(entries) do
    total_count = total_count + 1
    if entry.value_type == "string" or entry.value_type == "number" or entry.value_type == "boolean" then
      scalar_count = scalar_count + 1
    elseif entry.value_type == "function" then
      function_count = function_count + 1
    elseif entry.value_type == "table" then
      table_count = table_count + 1
    elseif entry.value_type == "userdata" then
      userdata_count = userdata_count + 1
    end
  end

  local name_match = is_enum_like_name(name)
  local scalar_ratio = 0
  if total_count > 0 then
    scalar_ratio = scalar_count / total_count
  end
  local low_function_count = function_count <= 2
  if total_count > 0 and function_count / total_count <= 0.25 then
    low_function_count = true
  end

  local accepted = false
  local reason = "not-enum-like"
  if name_match and scalar_count > 0 then
    accepted = true
    reason = "name-hint"
  elseif total_count >= 2 and scalar_ratio >= 0.70 and low_function_count then
    accepted = true
    reason = "scalar-majority"
  end

  return accepted, reason, {
    entries = entries,
    truncated = truncated,
    total = total_count,
    scalars = scalar_count,
    functions = function_count,
    tables = table_count,
    userdata = userdata_count,
  }
end

enum_like_kind = function(name, value)
  local accepted, reason, data = enum_like_score(name, value)
  if not accepted then
    return false, "not-enum-like", data
  end
  if is_priority_enum_name(name) then
    return true, "known enum from stubs", data
  end
  if reason == "name-hint" then
    return true, "enum-like", data
  end
  return true, "constant-like", data
end

local function dump_enum_like_table(name, value)
  local accepted, kind, data = enum_like_kind(name, value)
  if not accepted then
    return false
  end

  Report:line("- " .. name .. " (" .. kind .. ")")
  Report:line("  keys sampled: " .. tostring(data.total) .. (data.truncated and " (truncated)" or ""))
  Report:line(
    "  composition: scalar="
      .. tostring(data.scalars)
      .. ", function="
      .. tostring(data.functions)
      .. ", table="
      .. tostring(data.tables)
      .. ", userdata="
      .. tostring(data.userdata)
  )

  local emitted = 0
  for _, entry in ipairs(data.entries) do
    if entry.value_type == "string" or entry.value_type == "number" or entry.value_type == "boolean" then
      Report:line("  " .. entry.key_text .. " = " .. format_value(entry.value))
      emitted = emitted + 1
      if emitted >= MAX_KEYS_PER_TABLE then
        break
      end
    else
      Report:line("  " .. entry.key_text .. " = <" .. entry.value_type .. ", not expanded>")
    end
  end

  return true
end

local function dump_enum_like_userdata(name, value)
  if safe_type(value) ~= "userdata" or not is_enum_like_userdata_name(name) then
    return false
  end

  local kind = "enum-like userdata"
  if is_priority_enum_name(name) then
    kind = "known enum from stubs"
  end

  Report:line("- " .. name .. " (Enum-like Userdata: " .. kind .. ")")
  Report:line("  type: userdata")
  Report:line("  value: " .. format_value(value))
  Report:line("  field enumeration: not attempted for userdata; only safe metatable sampling is reported")

  local ok_mt, mt = safe_metatable(value)
  if not ok_mt then
    Report:line("  metatable: access-error")
    return true
  end
  if mt == nil then
    Report:line("  metatable: none")
    return true
  end

  Report:line("  metatable: " .. safe_type(mt) .. " " .. format_value(mt))
  if safe_type(mt) == "table" then
    local entries, truncated = table_entries(mt, MAX_METATABLE_FIELDS, name .. "<enum-metatable>")
    local samples = {}
    for _, entry in ipairs(entries) do
      samples[#samples + 1] = entry.key_text .. ":" .. entry.value_type
    end
    if #samples > 0 then
      Report:line("  metatable key sample: " .. truncate_string(table.concat(samples, ", "), 1000))
    end
    if truncated then
      Report:line("  <enum metatable sample truncated>")
    end
  end

  return true
end

-- metatable dumping

local function dump_metatable(name, value, detailed)
  local ok, mt, err = safe_metatable(value)
  if not ok then
    Report:line("- " .. name .. ": access failed: " .. safe_tostring(err))
    return
  end
  if mt == nil then
    Report:line("- " .. name .. ": none")
    return
  end

  local mt_type = safe_type(mt)
  Report:line("- " .. name .. ": " .. mt_type .. " " .. format_value(mt))
  if mt_type == "table" then
    local entries, truncated = table_entries(mt, MAX_METATABLE_FIELDS, name .. "<metatable>")
    local samples = {}
    for _, entry in ipairs(entries) do
      samples[#samples + 1] = entry.key_text .. ":" .. entry.value_type
    end
    Report:line("  accessible keys sampled: " .. tostring(#entries) .. (truncated and " (truncated)" or ""))
    if #samples > 0 then
      Report:line("  key sample: " .. truncate_string(table.concat(samples, ", "), 1000))
    end
    if detailed then
      for _, entry in ipairs(entries) do
        Report:line("  " .. entry.key_text .. " = " .. format_value(entry.value))
      end
    end
    if truncated then
      Report:line("  <metatable truncated>")
    end
  end
end

-- global scanning

local function get_timestamp()
  local ok_os, os_table = safe_get(ROOT_G, "os")
  if ok_os and safe_type(os_table) == "table" then
    local ok_date, date_fn = safe_get(os_table, "date")
    if ok_date and safe_type(date_fn) == "function" then
      local ok, result = safe_call("os.date", date_fn, "%Y%m%d-%H%M%S")
      if ok and result ~= nil then
        return tostring(result)
      end
    end
  end
  return "unknown-time"
end

local function global_entries()
  local entries = table_entries(ROOT_G, MAX_KEYS_PER_TABLE * 5, "_G")
  return entries
end

local function emit_globals_summary(entries)
  local counts = {}
  for _, entry in ipairs(entries) do
    counts[entry.value_type] = (counts[entry.value_type] or 0) + 1
  end

  Report:section("Globals Summary")
  Report:line("Accessible globals sampled: " .. tostring(#entries))
  Report:line("Types: " .. counts_to_text(counts))
end

local function emit_possibly_undocumented_globals(entries)
  local known = {}
  for _, name in ipairs(RUNTIME_STUB_SYMBOLS) do
    known[name] = true
  end
  for _, name in ipairs(STUB_ONLY_ALIASES) do
    known[name] = true
  end

  Report:section("Possibly Undocumented Globals")
  local emitted = 0
  for _, entry in ipairs(entries) do
    if safe_type(entry.key) == "string" and not known[entry.key] and starts_with_alpha(entry.key) then
      Report:line("- " .. entry.key .. " (" .. entry.value_type .. ")")
      emitted = emitted + 1
    end
  end
  if emitted == 0 then
    Report:line("No unexpected string-named globals found in sampled globals.")
  end
end

-- known symbol comparison

local function emit_known_stub_symbols()
  Report:section("Known Stub Symbols Present/Missing")
  Report:line("Runtime symbol expected - present:")
  local present = 0
  local missing = {}
  local errors = {}

  for _, name in ipairs(RUNTIME_STUB_SYMBOLS) do
    local exists, value, err = symbol_exists(name)
    if exists then
      present = present + 1
      Report:line("- " .. name .. ": " .. safe_type(value) .. " " .. format_value(value))
    elseif err then
      errors[#errors + 1] = name .. ": " .. err
    else
      missing[#missing + 1] = name
    end
  end

  if present == 0 then
    Report:line("- none")
  end

  Report:line("")
  Report:line("Runtime symbol expected - missing in this context:")
  if #missing == 0 then
    Report:line("- none")
  else
    for _, name in ipairs(missing) do
      Report:line("- " .. name)
    end
  end

  if #errors > 0 then
    Report:line("")
    Report:line("Access errors:")
    for _, item in ipairs(errors) do
      Report:line("- " .. item)
    end
  end

  Report:line("")
  Report:line("Stub-only alias expected - not a runtime error if missing:")
  for _, name in ipairs(STUB_ONLY_ALIASES) do
    local exists, value = symbol_exists(name)
    if exists then
      Report:line("- " .. name .. ": unexpectedly present at runtime as " .. safe_type(value) .. " " .. format_value(value))
    else
      Report:line("- " .. name .. ": stub-only alias, runtime symbol not expected")
    end
  end
end

local function emit_known_runtime_aliases()
  Report:section("Known Runtime Aliases")
  for _, alias in ipairs(KNOWN_RUNTIME_ALIASES) do
    local alias_exists, alias_value = symbol_exists(alias.name)
    local target_exists, target_value = symbol_exists(alias.target)

    Report:line("- " .. alias.name .. " -> " .. alias.target)
    Report:line("  note: " .. alias.note)
    if alias_exists then
      Report:line("  alias: present as " .. safe_type(alias_value) .. " " .. format_value(alias_value))
    else
      Report:line("  alias: missing in this context")
    end
    if target_exists then
      Report:line("  target: present as " .. safe_type(target_value) .. " " .. format_value(target_value))
    else
      Report:line("  target: missing in this context")
    end
  end
end

local function collect_known_field_probe()
  local results = {}
  for owner, fields in pairs(USERDATA_KNOWN_FIELD_PROBES) do
    local owner_exists, owner_value = symbol_exists(owner)
    for _, field_name in ipairs(fields) do
      local entry = {
        owner = owner,
        field = field_name,
        status = "owner-missing",
        typ = "nil",
        source = "missing",
        value = "",
      }
      if owner_exists then
        local ok, value, source = safe_index_get(owner_value, field_name)
        entry.source = source or "unknown"
        if ok and value ~= nil then
          entry.status = "present"
          entry.typ = safe_type(value)
          entry.value = format_value(value)
        elseif ok then
          entry.status = "missing"
        else
          entry.status = "error"
        end
      end
      results[#results + 1] = entry
    end
  end
  table.sort(results, function(a, b)
    if a.owner == b.owner then
      return a.field < b.field
    end
    return a.owner < b.owner
  end)
  return results
end

local function emit_known_field_probe(results)
  Report:section("Known Field Probe")
  Report:line("Read-only field/method lookup by known names. Returned functions are not called.")
  local current_owner = nil
  for _, entry in ipairs(results) do
    if entry.owner ~= current_owner then
      current_owner = entry.owner
      Report:line("- " .. current_owner)
    end
    local detail = "  " .. entry.owner .. "." .. entry.field .. " = " .. entry.typ .. " [" .. entry.status .. ", source=" .. entry.source .. "]"
    if entry.value ~= "" then
      detail = detail .. " " .. entry.value
    end
    Report:line(detail)
  end
  if #results == 0 then
    Report:line("No known fields configured.")
  end
end

local function collect_enum_value_probe()
  local results = {}
  for enum_name, values in pairs(ENUM_VALUE_PROBES) do
    local enum_exists, enum_value = symbol_exists(enum_name)
    for _, value_name in ipairs(values) do
      local entry = {
        enum = enum_name,
        value = value_name,
        status = "owner-missing",
        typ = "nil",
        source = "missing",
        result = "",
      }
      if enum_exists then
        local ok, value, source = safe_index_get(enum_value, value_name)
        entry.source = source or "unknown"
        if ok and value ~= nil then
          entry.status = "present"
          entry.typ = safe_type(value)
          entry.result = format_value(value)
        elseif ok then
          entry.status = "missing"
        else
          entry.status = "error"
        end
      end
      results[#results + 1] = entry
    end
  end
  table.sort(results, function(a, b)
    if a.enum == b.enum then
      return a.value < b.value
    end
    return a.enum < b.enum
  end)
  return results
end

local function collect_unconfirmed_enum_value_probe()
  local results = {}
  for enum_name, values in pairs(ENUM_VALUE_CANDIDATES_UNCONFIRMED) do
    local enum_exists, enum_value = symbol_exists(enum_name)
    for _, value_name in ipairs(values) do
      local entry = {
        enum = enum_name,
        value = value_name,
        status = "owner-missing",
        typ = "nil",
        source = "missing",
        result = "",
      }
      if enum_exists then
        local ok, value, source = safe_index_get(enum_value, value_name)
        entry.source = source or "unknown"
        if ok and value ~= nil then
          entry.status = "present"
          entry.typ = safe_type(value)
          entry.result = format_value(value)
        elseif ok then
          entry.status = "missing"
        else
          entry.status = "error"
        end
      end
      results[#results + 1] = entry
    end
  end
  table.sort(results, function(a, b)
    if a.enum == b.enum then
      return a.value < b.value
    end
    return a.enum < b.enum
  end)
  return results
end

local function emit_enum_value_probe(results)
  Report:section("Enum Value Probe")
  Report:line("Read-only enum value lookup by known names. No functions are called.")
  local current_enum = nil
  for _, entry in ipairs(results) do
    if entry.enum ~= current_enum then
      current_enum = entry.enum
      Report:line("- " .. current_enum)
    end
    local detail = "  " .. entry.enum .. "." .. entry.value .. " = " .. entry.typ .. " [" .. entry.status .. ", source=" .. entry.source .. "]"
    if entry.result ~= "" then
      detail = detail .. " " .. entry.result
    end
    Report:line(detail)
  end
  if #results == 0 then
    Report:line("No enum values configured.")
  end
end

local function emit_unconfirmed_enum_value_probe(results)
  Report:section("Unconfirmed Enum Value Candidates")
  Report:line("Read-only candidate lookups. These are not treated as confirmed enum values.")
  for _, entry in ipairs(results) do
    local detail = "- "
      .. entry.enum
      .. "."
      .. entry.value
      .. " = "
      .. entry.typ
      .. " ["
      .. entry.status
      .. ", source="
      .. entry.source
      .. "]"
    if entry.result ~= "" then
      detail = detail .. " " .. entry.result
    end
    Report:line(detail)
  end
  if #results == 0 then
    Report:line("- none")
  end
end

local function emit_legacy_internal_runtime_context(field_results)
  Report:section("Legacy/Internal Runtime Context")

  local gv_exists, gv_value = symbol_exists("gv")
  local flowchart_exists, flowchart_value = symbol_exists("flowchart")
  local game_variables_exists, game_variables_value = symbol_exists("GameVariables")
  local effective_gv, effective_source = get_effective_game_variables()

  Report:line("GameVariables global: " .. (game_variables_exists and ("present " .. format_value(game_variables_value)) or "missing"))
  Report:line("gv legacy alias: " .. (gv_exists and ("present " .. format_value(gv_value)) or "missing"))
  Report:line("flowchart: " .. (flowchart_exists and ("present " .. format_value(flowchart_value)) or "missing"))
  Report:line("Effective GameVariables source: " .. effective_source .. (effective_gv ~= nil and (" " .. format_value(effective_gv)) or ""))
  Report:line("ENABLE_SAFE_CONTEXT_CALLS: " .. tostring(ENABLE_SAFE_CONTEXT_CALLS))

  Report:line("")
  Report:line("Alias field probe sample:")
  local emitted = 0
  for _, entry in ipairs(field_results) do
    if entry.owner == "gv" or entry.owner == "flowchart" then
      Report:line("- " .. entry.owner .. "." .. entry.field .. ": " .. entry.status .. " (" .. entry.typ .. ", source=" .. entry.source .. ")")
      emitted = emitted + 1
      if emitted >= 25 then
        Report:line("- <alias field sample truncated>")
        break
      end
    end
  end
  if emitted == 0 then
    Report:line("- none")
  end
end

local function emit_machine_readable_summary(callables, field_results, enum_results, enum_candidate_results, execution_context)
  Report:section("Machine Readable Summary")
  Report:line("Pipe-delimited blocks for tools/probe_runtime_index.py. Values are escaped for single-line parsing.")

  local signals = execution_context.signals
  Report:line("BEGIN_MDRG_PROBE_ENVIRONMENT")
  Report:line("context_label|" .. machine_text(PROBE_CONTEXT_LABEL))
  Report:line("detected_context|" .. machine_text(execution_context.detected_context))
  Report:line("context_confidence|" .. machine_text(execution_context.confidence))
  Report:line("safe_io_expected|" .. tostring(SAFE_IO_EXPECTED))
  Report:line("io_present|" .. tostring(signals.io_present))
  Report:line("io_open_present|" .. tostring(signals.io_open_present))
  Report:line("io_read_present|" .. tostring(signals.io_read_present))
  Report:line("io_write_present|" .. tostring(signals.io_write_present))
  Report:line("io_popen_present|" .. tostring(signals.io_popen_present))
  Report:line("io_tmpfile_present|" .. tostring(signals.io_tmpfile_present))
  Report:line("current_mod_guid_present|" .. tostring(signals.current_mod_guid_present))
  Report:line("gamevariables_present|" .. tostring(signals.gamevariables_present))
  Report:line("gv_present|" .. tostring(signals.gv_present))
  Report:line("flowchart_present|" .. tostring(signals.flowchart_present))
  Report:line("effective_gamevariables_source|" .. machine_text(signals.effective_gamevariables_source))
  Report:line("transport|" .. machine_text(signals.transport))
  Report:line("END_MDRG_PROBE_ENVIRONMENT")

  Report:line("BEGIN_MDRG_PROBE_SYMBOLS")
  for _, name in ipairs(RUNTIME_STUB_SYMBOLS) do
    local exists, value, err = symbol_exists(name)
    if exists then
      Report:line("symbol|" .. machine_text(name) .. "|" .. safe_type(value) .. "|present|" .. machine_text(format_value(value)))
    elseif err then
      Report:line("symbol|" .. machine_text(name) .. "|nil|error|" .. machine_text(err))
    else
      Report:line("symbol|" .. machine_text(name) .. "|nil|missing|")
    end
  end
  Report:line("END_MDRG_PROBE_SYMBOLS")

  Report:line("BEGIN_MDRG_PROBE_ALIASES")
  for _, alias in ipairs(KNOWN_RUNTIME_ALIASES) do
    local alias_exists, alias_value = symbol_exists(alias.name)
    Report:line(
      "alias|"
        .. machine_text(alias.name)
        .. "|"
        .. machine_text(alias.target)
        .. "|"
        .. (alias_exists and "present" or "missing")
        .. "|"
        .. (alias_exists and safe_type(alias_value) or "nil")
        .. "|"
        .. (alias_exists and machine_text(format_value(alias_value)) or "")
    )
  end
  Report:line("END_MDRG_PROBE_ALIASES")

  Report:line("BEGIN_MDRG_PROBE_CALLABLES")
  for _, item in ipairs(callables) do
    Report:line(
      "callable|"
        .. machine_text(item.path)
        .. "|"
        .. machine_text(item.typ)
        .. "|"
        .. machine_text(item.safety)
        .. "|"
        .. machine_text(item.origin)
        .. "|"
        .. tostring(item.dangerous)
    )
  end
  Report:line("END_MDRG_PROBE_CALLABLES")

  Report:line("BEGIN_MDRG_PROBE_FIELDS")
  for _, entry in ipairs(field_results) do
    Report:line(
      "field|"
        .. machine_text(entry.owner)
        .. "|"
        .. machine_text(entry.field)
        .. "|"
        .. machine_text(entry.typ)
        .. "|"
        .. machine_text(entry.status)
        .. "|"
        .. machine_text(entry.source)
        .. "|"
        .. machine_text(entry.value)
    )
  end
  Report:line("END_MDRG_PROBE_FIELDS")

  Report:line("BEGIN_MDRG_PROBE_ENUM_VALUES")
  for _, entry in ipairs(enum_results) do
    Report:line(
      "enum|"
        .. machine_text(entry.enum)
        .. "|"
        .. machine_text(entry.value)
        .. "|"
        .. machine_text(entry.typ)
        .. "|"
        .. machine_text(entry.status)
        .. "|"
        .. machine_text(entry.source)
        .. "|"
        .. machine_text(entry.result)
    )
  end
  Report:line("END_MDRG_PROBE_ENUM_VALUES")

  Report:line("BEGIN_MDRG_PROBE_ENUM_CANDIDATES")
  for _, entry in ipairs(enum_candidate_results) do
    Report:line(
      "enum_candidate|"
        .. machine_text(entry.enum)
        .. "|"
        .. machine_text(entry.value)
        .. "|"
        .. machine_text(entry.typ)
        .. "|"
        .. machine_text(entry.status)
        .. "|"
        .. machine_text(entry.source)
        .. "|"
        .. machine_text(entry.result)
    )
  end
  Report:line("END_MDRG_PROBE_ENUM_CANDIDATES")
end

-- MoonSharp info

local function emit_runtime_header(timestamp)
  Report:line("# MDRG Lua Environment Report")
  Report:line("Generated at: " .. timestamp)
  Report:line("Script version: " .. SCRIPT_VERSION)
end

local function emit_runtime_info()
  Report:section("Runtime")
  local fields = {
    "_VERSION",
    "CurrentModGuid",
  }

  for _, name in ipairs(fields) do
    local exists, value = symbol_exists(name)
    if exists then
      Report:line(name .. ": " .. format_value(value))
    else
      Report:line(name .. ": <missing>")
    end
  end

  local exists, moon = symbol_exists("_MOONSHARP")
  if exists then
    Report:line("_MOONSHARP: " .. format_value(moon))
    if safe_type(moon) == "table" then
      local entries = table_entries(moon, MAX_KEYS_PER_TABLE, "_MOONSHARP")
      for _, entry in ipairs(entries) do
        Report:line("_MOONSHARP." .. entry.key_text .. ": " .. format_value(entry.value))
      end
    end
  else
    Report:line("_MOONSHARP: <missing>")
  end
end

local function emit_execution_transport_context(filename)
  Report:section("Execution / Transport Context")
  Report:line("Target report filename: " .. filename)
  Report:line("Write strategy: try io.open first; if unavailable, print console-safe chunks.")
  Report:line("PROBE_MODE: " .. PROBE_MODE)
  Report:line("TABLE_ENUM_MODE: " .. TABLE_ENUM_MODE)
  Report:line("IO_AVAILABLE at startup: " .. tostring(IO_AVAILABLE))
  Report:line("ENABLE_DEEP_GLOBAL_DUMP: " .. tostring(ENABLE_DEEP_GLOBAL_DUMP))
  Report:line("ENABLE_PACKAGE_LOADED_DUMP: " .. tostring(ENABLE_PACKAGE_LOADED_DUMP))
  Report:line(
    "Console prefixes like [LuaPatch] [Lua:exec.lua] are external transport/log prefixes, not Lua globals."
  )
  Report:line("Console fallback chunk marker: MDRG_ENV_PROBE_CHUNK n")

  local has_current_mod_guid = symbol_exists("CurrentModGuid")
  local has_game_variables = symbol_exists("GameVariables")
  local has_mod_utilities = symbol_exists("ModUtilities")
  local has_game_utilities = symbol_exists("GameUtilities")

  if not has_current_mod_guid and not has_game_variables and (has_mod_utilities or has_game_utilities) then
    Report:line(
      "Context hint: console/plugin execution is likely; mod-scoped globals or save-scoped globals may be absent."
    )
  elseif not has_game_variables then
    Report:line("Context hint: GameVariables missing; save or scene context may not be loaded.")
  else
    Report:line("Context hint: game/save globals are at least partially available.")
  end
end

local function emit_execution_context_classification(execution_context)
  Report:section("Execution Context Classification")
  Report:line("Detected context: " .. execution_context.detected_context)
  Report:line("Confidence: " .. execution_context.confidence)
  Report:line("Reason:")
  for _, reason in ipairs(execution_context.reasons) do
    Report:line("- " .. reason)
  end
  Report:line("Interpretation:")
  Report:line("- " .. execution_context.interpretation)
end

local function yes_no(value)
  return value and "yes" or "no"
end

local function emit_probe_contamination_context(execution_context)
  Report:section("Probe Contamination / Injection Context")
  local signals = execution_context.signals
  Report:line("io present: " .. yes_no(signals.io_present))
  Report:line("io.open present: " .. yes_no(signals.io_open_present))
  Report:line("io.read present: " .. yes_no(signals.io_read_present))
  Report:line("io.write present: " .. yes_no(signals.io_write_present))
  Report:line("io.popen present: " .. yes_no(signals.io_popen_present))
  Report:line("io.tmpfile present: " .. yes_no(signals.io_tmpfile_present))
  Report:line("safe_io_expected: " .. yes_no(SAFE_IO_EXPECTED))
  Report:line("safe_io_likely_injected: " .. (signals.safe_io_likely_injected and "yes" or "unknown/no"))
  Report:line("native_mdrg_io: unknown")
  Report:line("CurrentModGuid present: " .. yes_no(signals.current_mod_guid_present))
  Report:line("GameVariables present: " .. yes_no(signals.gamevariables_present))
  Report:line("gv present: " .. yes_no(signals.gv_present))
  Report:line("flowchart present: " .. yes_no(signals.flowchart_present))
  Report:line("ModUtilities present: " .. yes_no(signals.modutilities_present))
  Report:line("GameUtilities present: " .. yes_no(signals.gameutilities_present))
  Report:line("transport: " .. signals.transport)
  if signals.io_present then
    Report:line("io is present in this runtime. If running through LuaPatch/safe IO plugin, treat this as injected bridge API, not native MDRG API.")
  end
end

local function emit_lifecycle_availability_matrix(execution_context)
  Report:section("Lifecycle Availability Matrix")
  local signals = execution_context.signals
  Report:line("Current context:")
  Report:line("- CurrentModGuid: " .. (signals.current_mod_guid_present and "present" or "missing"))
  Report:line("- GameVariables: " .. (signals.gamevariables_present and "present" or "missing"))
  Report:line("- gv: " .. (signals.gv_present and "present" or "missing"))
  Report:line("- flowchart: " .. (signals.flowchart_present and "present" or "missing"))
  Report:line("- io.open: " .. (signals.io_open_present and "present" or "missing"))
  Report:line("- ModUtilities: " .. (signals.modutilities_present and "present" or "missing"))
  Report:line("- GameUtilities: " .. (signals.gameutilities_present and "present" or "missing"))
  Report:line("")
  Report:line("Likely phase:")
  if execution_context.detected_context == "mod-start" or execution_context.detected_context == "mod-with-safe-io-start" then
    Report:line("- Mod startup / OnGameStart-like phase.")
    Report:line("- Save/Fungus context is probably not available yet.")
  elseif execution_context.detected_context == "luaexec-scene-context" or execution_context.detected_context == "luaexec-with-safe-io-scene-context" then
    Report:line("- Manual LuaExec / scene/Fungus phase.")
    Report:line("- Save/Fungus objects may be available through gv/flowchart.")
    Report:line("- Mod-scoped CurrentModGuid may be absent.")
  elseif execution_context.detected_context == "save-aware-context" then
    Report:line("- Save/runtime-aware phase.")
  else
    Report:line("- Unknown or mixed plugin phase.")
  end
end

local function emit_lifecycle_event_clues()
  Report:section("Lifecycle / Event Clues")
  Report:line("- CurrentModGuid present usually indicates real mod script context.")
  Report:line("- CurrentModGuid missing with gv/flowchart present usually indicates LuaExec/Fungus/scene context.")
  Report:line("- ModUtilities.StartCoroutine can be used for deferred opt-in probing in a separate script.")
  Report:line("- ModUtilities.WaitForSeconds can be used for coroutine yielding when available.")
  Report:line("- ModUtilities.GetGameVariables is context-dependent and is not called by default.")
  Report:line("- StorySingleton.GetFlowchart is context-dependent and is not called by default.")
  Report:line("- No Lua-level OnSaveLoad hook is assumed by this probe.")
end

local function emit_moonsharp_details()
  Report:section("MoonSharp Details")
  local exists, moon = symbol_exists("_MOONSHARP")
  if not exists then
    Report:line("_MOONSHARP not available.")
    return
  end
  dump_value("_MOONSHARP", moon, 0, {})
end

-- Unity/game info

local function emit_game_unity_context()
  Report:section("Game/Unity Context")

  local exists, game_variables = symbol_exists("GameVariables")
  if not exists then
    Report:line("GameVariables: <missing>")
  else
    Report:line("GameVariables: " .. safe_type(game_variables) .. " " .. format_value(game_variables))
    local ok_current, current = safe_get(game_variables, "Current")
    if ok_current and current ~= nil then
      Report:line("GameVariables.Current: " .. safe_type(current) .. " " .. format_value(current))
      for _, field in ipairs(GAMEVARIABLES_CURRENT_FIELDS) do
        local ok_field, field_value = safe_get(current, field)
        if ok_field then
          Report:line("GameVariables.Current." .. field .. ": " .. format_value(field_value))
        else
          Report:line("GameVariables.Current." .. field .. ": <access failed>")
        end
      end
    else
      Report:line("GameVariables.Current: <missing or context unavailable>")
    end
  end

  local exists_utils, game_utils = symbol_exists("GameUtilities")
  Report:line("GameUtilities: " .. (exists_utils and (safe_type(game_utils) .. " " .. format_value(game_utils)) or "<missing>"))

  local exists_mod, mod_utils = symbol_exists("ModUtilities")
  Report:line("ModUtilities: " .. (exists_mod and (safe_type(mod_utils) .. " " .. format_value(mod_utils)) or "<missing>"))
end

-- snapshots

local function emit_top_level_tables_snapshot(entries)
  Report:section("Top-level Tables Snapshot")
  local emitted = 0
  for _, entry in ipairs(entries) do
    if entry.value_type == "table" then
      dump_top_level_table_snapshot(entry.key_text, entry.value)
      emitted = emitted + 1
      if emitted >= MAX_TOP_LEVEL_TABLES then
        Report:line("<top-level table snapshot limit reached>")
        break
      end
    end
  end
  if emitted == 0 then
    Report:line("No top-level tables found in sampled globals.")
  end
end

local function emit_callable_inventory(callables)
  Report:section("Callable Inventory")

  for _, item in ipairs(callables) do
    Report:line(
      "- "
        .. item.path
        .. " : "
        .. item.typ
        .. " [origin="
        .. item.origin
        .. ", safety="
        .. item.safety
        .. "]"
        .. (item.dangerous and " [dangerous-name]" or "")
    )
  end

  if #callables == 0 then
    Report:line("No functions found in sampled tables.")
  elseif #callables >= MAX_CALLABLES then
    Report:line("<callable inventory limit reached>")
  end
end

local function emit_api_safety_map(callables)
  Report:section("API Safety Map")

  local categories = {
    "Read-only",
    "Context-dependent",
    "State-changing",
    "UI-changing",
    "Save-changing",
    "Dangerous/Destructive",
    "Unknown",
  }
  local buckets = {}
  for _, category in ipairs(categories) do
    buckets[category] = {}
  end

  for _, item in ipairs(callables) do
    local category = item.safety or "Unknown"
    if not buckets[category] then
      category = "Unknown"
    end
    buckets[category][#buckets[category] + 1] = item
  end

  for _, category in ipairs(categories) do
    Report:line(category .. ":")
    local items = buckets[category]
    if #items == 0 then
      Report:line("- none")
    else
      for _, item in ipairs(items) do
        Report:line("- " .. item.path .. " [origin=" .. item.origin .. "]")
      end
    end
    Report:line("")
  end

  Report:line("Classification is name/path based only. No callable listed here was executed.")
end

local function emit_enum_like_tables(entries)
  Report:section("Enum-like Tables / Constants")

  local emitted = 0
  local done = {}

  for _, name in ipairs(ENUM_PRIORITY_NAMES) do
    local exists, value = symbol_exists(name)
    if exists then
      local typ = safe_type(value)
      if typ == "table" and dump_enum_like_table(name, value) then
        emitted = emitted + 1
        done[name] = true
      elseif typ == "userdata" and dump_enum_like_userdata(name, value) then
        emitted = emitted + 1
        done[name] = true
      end
    end
  end

  for _, entry in ipairs(entries) do
    if emitted >= MAX_ENUM_TABLES then
      Report:line("<enum-like table limit reached>")
      break
    end
    if safe_type(entry.key) == "string" and not done[entry.key] then
      if entry.value_type == "table" and dump_enum_like_table(entry.key, entry.value) then
        emitted = emitted + 1
        done[entry.key] = true
      elseif entry.value_type == "userdata" and dump_enum_like_userdata(entry.key, entry.value) then
        emitted = emitted + 1
        done[entry.key] = true
      end
    end
  end

  if emitted == 0 then
    Report:line("No enum-like or constant-like top-level tables found in sampled globals.")
  end
end

local function emit_global_dump()
  Report:section("Global Dump")
  if not ENABLE_DEEP_GLOBAL_DUMP then
    Report:line("Deep global dump skipped in safe console mode.")
    Report:line("Run with safe_io/io.open available, or set ENABLE_FULL_CONSOLE_REPORT for a larger console report.")
    return
  end

  local emitted = 0
  for _, name in ipairs(GLOBAL_DUMP_ROOTS) do
    if name == "package" and not ENABLE_PACKAGE_LOADED_DUMP then
      Report:line("package = <skipped; ENABLE_PACKAGE_LOADED_DUMP=false>")
    else
      local exists, value = symbol_exists(name)
      if exists then
        dump_value(name, value, 0, {})
        emitted = emitted + 1
      else
        Report:line(name .. " = <missing>")
      end
    end
  end
  if emitted == 0 then
    Report:line("No configured global dump roots were present.")
  end
end

local function emit_metatables(entries)
  Report:section("Metatables")
  local emitted = 0
  local done = {}

  for _, name in ipairs(METATABLE_PRIORITY_SYMBOLS) do
    if emitted >= MAX_METATABLES then
      Report:line("<metatable limit reached>")
      return
    end
    local exists, value = symbol_exists(name)
    if exists then
      dump_metatable(name, value, is_priority_enum_name(name))
      emitted = emitted + 1
      done[name] = true
    end
  end

  for _, entry in ipairs(entries) do
    if emitted >= MAX_METATABLES then
      Report:line("<metatable limit reached>")
      return
    end
    if entry.value_type == "userdata" and not done[entry.key_text] then
      dump_metatable(entry.key_text, entry.value, false)
      emitted = emitted + 1
      done[entry.key_text] = true
    end
  end
end

local function emit_userdata_globals(entries)
  Report:section("Userdata Globals")
  local emitted = 0
  for _, entry in ipairs(entries) do
    if entry.value_type == "userdata" then
      Report:line("- " .. entry.key_text .. ": " .. format_value(entry.value))
      dump_metatable("  " .. entry.key_text, entry.value, false)
      emitted = emitted + 1
    end
  end
  if emitted == 0 then
    Report:line("No top-level userdata globals found in sampled globals.")
  end
end

-- safe validations

local function check_path(path, expected_type)
  local current = ROOT_G
  local current_path = "_G"

  for _, part in ipairs(path) do
    local ok, value = safe_get(current, part)
    current_path = current_path .. "." .. tostring(part)
    if not ok then
      return false, current_path .. " access failed"
    end
    if value == nil then
      return false, current_path .. " missing"
    end
    current = value
  end

  local typ = safe_type(current)
  if expected_type and typ ~= expected_type then
    return false, current_path .. " type is " .. typ .. ", expected " .. expected_type
  end
  return true, current_path .. " present (" .. typ .. ")"
end

local function emit_safe_validations()
  Report:section("Safe Validations")

  Report:line("Safe read validation:")
  local validations = {
    { { "_VERSION" }, "string" },
    { { "_MOONSHARP" }, "table" },
    { { "_MOONSHARP", "version" }, nil },
    { { "_MOONSHARP", "platform" }, nil },
    { { "CurrentModGuid" }, nil },
    { { "json", "parse" }, "function" },
    { { "json", "serialize" }, "function" },
    { { "json", "isnull" }, "function" },
    { { "string", "startsWith" }, "function" },
    { { "string", "endsWith" }, "function" },
    { { "string", "contains" }, "function" },
    { { "GameUtilities", "WaitForSecondsYield" }, "function" },
  }

  for _, validation in ipairs(validations) do
    local ok, message = check_path(validation[1], validation[2])
    Report:line("- " .. (ok and "OK " or "MISS ") .. message)
  end

  Report:line("")
  Report:line("GameVariables availability:")
  local game_variables_exists = symbol_exists("GameVariables")
  local gv_exists = symbol_exists("gv")
  local effective_gv, effective_source = get_effective_game_variables()
  Report:line("- GameVariables global: " .. (game_variables_exists and "present" or "missing"))
  Report:line("- gv alias: " .. (gv_exists and "present" or "missing"))
  Report:line("- Effective GameVariables source: " .. effective_source)
  if effective_source == "none" then
    Report:line("- Reason: startup/mod context likely before save is available, or this context does not inject GameVariables.")
  end

  Report:line("")
  Report:line("Context-dependent validation:")
  if effective_gv ~= nil then
    local ok_current, current = safe_get(effective_gv, "Current")
    if ok_current and current ~= nil then
      for _, field in ipairs(GAMEVARIABLES_CURRENT_FIELDS) do
        local ok_field, field_value = safe_get(current, field)
        if ok_field then
          Report:line("- " .. effective_source .. ".Current." .. field .. " = " .. format_value(field_value))
        else
          Report:line("- " .. effective_source .. ".Current." .. field .. " access failed")
        end
      end
    else
      Report:line("- " .. effective_source .. ".Current unavailable in this context.")
    end
  else
    Report:line("- GameVariables/gv unavailable in this context.")
  end

  Report:line("")
  Report:line("Skipped dangerous/context-dependent validation:")
  for _, name in ipairs(SKIPPED_VALIDATIONS) do
    Report:line("- " .. name .. " [not called]")
  end
end

local function emit_errors()
  Report:section("Errors / Access Failures")
  if #ACCESS_ERRORS == 0 then
    Report:line("No access failures recorded.")
    return
  end
  for _, err in ipairs(ACCESS_ERRORS) do
    Report:line("- " .. err)
  end
end

local function emit_notes()
  Report:section("Notes")
  Report:line("- This probe does not call discovered functions.")
  Report:line("- Callable Inventory marks dangerous names by substring and never executes them.")
  Report:line("- API Safety Map is conservative and based only on name/path heuristics.")
  Report:line("- Enum-like tables are heuristic unless the name is already known from stubs.")
  Report:line("- Enum-like userdata is reported by presence/metatable only; fields are not brute-forced.")
  Report:line("- Known Field Probe and Enum Value Probe read named fields only; returned functions are never called.")
  Report:line("- Machine-readable blocks are included for offline parsing and should still be reviewed manually.")
  Report:line("- Console prefixes are added by the host/plugin log transport and are not part of this script.")
  Report:line("- Missing symbols can be normal when a save, scene or UI context is not loaded.")
  Report:line("- CurrentModGuid present usually indicates real mod script context.")
  Report:line("- CurrentModGuid missing with gv/flowchart present usually indicates LuaExec/Fungus/scene context.")
  Report:line("- GameVariables missing during mod startup does not mean the API is absent.")
  Report:line("- Safe IO is plugin-provided bridge API and should not be treated as native MDRG.")
  Report:line("- Many APIs are only meaningful later, during runtime or inside callbacks.")
  Report:line("- Reports should be reviewed before any stub or documentation update.")
end

-- save/fallback output

local function print_report_console_safe(content)
  if safe_type(print) ~= "function" then
    return
  end

  print("=== MDRG ENV PROBE REPORT BEGIN ===")

  local chunk_index = 1
  local line_index = 0
  local start_pos = 1
  while true do
    local nl = string.find(content, "\n", start_pos, true)
    local line
    if nl then
      line = string.sub(content, start_pos, nl - 1)
      start_pos = nl + 1
    else
      line = string.sub(content, start_pos)
    end

    if line_index % PRINT_LINES_PER_CHUNK == 0 then
      print("MDRG_ENV_PROBE_CHUNK " .. tostring(chunk_index))
      chunk_index = chunk_index + 1
    end
    line_index = line_index + 1

    if string.len(line) == 0 then
      print("")
    else
      local pos = 1
      while pos <= string.len(line) do
        print(string.sub(line, pos, pos + MAX_PRINT_LINE_LEN - 1))
        pos = pos + MAX_PRINT_LINE_LEN
      end
    end

    if not nl then
      break
    end
  end

  print("=== MDRG ENV PROBE REPORT END ===")
end

local function save_or_print(filename)
  Report:section("Output")
  Report:line("Target filename: " .. filename)
  Report:line("Writer: io.open if available, print fallback otherwise.")

  local output_reason = "io table unavailable"
  local ok_io, io_table = safe_get(ROOT_G, "io")
  if ok_io and safe_type(io_table) == "table" then
    local ok_open, open_fn = safe_get(io_table, "open")
    if ok_open and safe_type(open_fn) == "function" then
      local initial_content = Report:text()
      local ok_file, file = safe_call("io.open", open_fn, filename, "w")
      if ok_file and file ~= nil then
        local ok_write, write_err = pcall(function()
          file:write(initial_content)
          file:close()
        end)
        if ok_write then
          Report:line("Result: saved with io.open.")
          local final_content = Report:text()
          local ok_final_file, final_file = safe_call("io.open", open_fn, filename, "w")
          if ok_final_file and final_file ~= nil then
            pcall(function()
              final_file:write(final_content)
              final_file:close()
            end)
          end
          if safe_type(print) == "function" then
            print("MDRG env probe report saved: " .. filename)
          end
          return true
        end
        output_reason = "file write failed: " .. safe_tostring(write_err)
        remember_error("file write", write_err)
      else
        output_reason = "io.open failed"
      end
    else
      output_reason = "io.open unavailable"
    end
  end

  Report:line("Result: printed to console fallback.")
  Report:line("Fallback reason: " .. output_reason)
  Report:line("Console chunk target: " .. tostring(PRINT_CHUNK_SIZE) .. " chars or shorter line-safe prints.")

  local content = Report:text()
  print_report_console_safe(content)
  return false
end

-- main()

local function main()
  local timestamp = get_timestamp()
  local filename = "report-" .. timestamp .. ".txt"
  local entries = global_entries()
  local callables = collect_all_callables(entries)
  local field_results = collect_known_field_probe()
  local enum_results = collect_enum_value_probe()
  local enum_candidate_results = collect_unconfirmed_enum_value_probe()
  local execution_context = detect_execution_context()

  emit_runtime_header(timestamp)
  emit_runtime_info()
  emit_execution_transport_context(filename)
  emit_execution_context_classification(execution_context)
  emit_probe_contamination_context(execution_context)
  emit_lifecycle_availability_matrix(execution_context)
  emit_lifecycle_event_clues()
  emit_globals_summary(entries)
  emit_known_stub_symbols()
  emit_known_runtime_aliases()
  emit_legacy_internal_runtime_context(field_results)
  emit_known_field_probe(field_results)
  emit_enum_value_probe(enum_results)
  emit_unconfirmed_enum_value_probe(enum_candidate_results)
  emit_possibly_undocumented_globals(entries)
  emit_top_level_tables_snapshot(entries)
  emit_callable_inventory(callables)
  emit_api_safety_map(callables)
  emit_enum_like_tables(entries)
  emit_global_dump()
  emit_metatables(entries)
  emit_userdata_globals(entries)
  emit_moonsharp_details()
  emit_game_unity_context()
  emit_safe_validations()
  emit_errors()
  emit_machine_readable_summary(callables, field_results, enum_results, enum_candidate_results, execution_context)
  emit_notes()

  save_or_print(filename)
end

main()

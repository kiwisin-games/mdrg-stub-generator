-- MDRG callback/closure context probe helper.
--
-- This file is intentionally smaller than mdrg_env_probe.lua. It is meant to
-- run inside real callbacks registered by a debug mod and report the callback
-- invocation context, arguments and safe field reads. It does not discover or
-- call callbacks by itself.

local ENABLE_CALLBACK_PROBE = false
local CALLBACK_PROBE_ONCE_PER_CONTEXT = true
local CALLBACK_PROBE_MAX_CALLS = 10
local CALLBACK_PROBE_COMPARE_BEFORE_AFTER = false
local CALLBACK_PROBE_CONTEXT_LABEL = "auto"
local CALLBACK_PROBE_VERSION = "2026-05-07"

local CALLBACK_PROBE_PRINT_CHUNK_SIZE = 3000
local CALLBACK_PROBE_MAX_LINES_PER_REPORT = 2000
local CALLBACK_PROBE_MAX_FIELDS_PER_ARG = 80
local CALLBACK_PROBE_MAX_ERRORS = 100
local CALLBACK_PROBE_MAX_STRING_LEN = 500

local ROOT_G = _G
if type(ROOT_G) ~= "table" then
  ROOT_G = {}
end

local unpack_values = table.unpack or unpack
local CALLBACK_CALL_COUNTS = {}
local CALLBACK_SEEN = {}
local CALLBACK_ERRORS = {}
local CALLBACK_REPORT_SEQUENCE = 0

local RUNTIME_TEST_CONFIG = {
  enabled = false,
  root = "probe",
  id = "auto",
  label = "",
  objective = "",
  actions = {},
  flags = {},
  folder = nil,
  test_id = nil,
  created_at = nil,
  notes_path = nil,
  reports = {},
}

local function remember_access_error(kind, path, err)
  if #CALLBACK_ERRORS >= CALLBACK_PROBE_MAX_ERRORS then
    return
  end
  CALLBACK_ERRORS[#CALLBACK_ERRORS + 1] = {
    kind = tostring(kind or "access"),
    path = tostring(path or ""),
    err = tostring(err or ""),
  }
end

local function safe_type(value)
  local ok, result = pcall(type, value)
  if ok then
    return result
  end
  remember_access_error("type", "<value>", result)
  return "<type-error>"
end

local function safe_tostring(value)
  local ok, result = pcall(tostring, value)
  if ok then
    return result
  end
  remember_access_error("tostring", "<value>", result)
  return "<tostring-error>"
end

local function truncate_string(value, max_len)
  max_len = max_len or CALLBACK_PROBE_MAX_STRING_LEN
  value = tostring(value or "")
  value = value:gsub("\r", "\\r")
  value = value:gsub("\n", "\\n")
  value = value:gsub("\t", "\\t")
  if string.len(value) > max_len then
    return string.sub(value, 1, max_len) .. "...<truncated>"
  end
  return value
end

local function machine_text(value)
  local text = truncate_string(safe_tostring(value), CALLBACK_PROBE_MAX_STRING_LEN)
  text = text:gsub("\\", "\\\\")
  text = text:gsub("|", "\\|")
  return text
end

local function format_value(value)
  local typ = safe_type(value)
  if typ == "string" then
    return '"' .. truncate_string(value) .. '"'
  end
  if typ == "number" or typ == "boolean" or typ == "nil" then
    return safe_tostring(value)
  end
  return "<" .. typ .. ": " .. truncate_string(safe_tostring(value), 180) .. ">"
end

local function safe_raw_get(value, key, path)
  if safe_type(value) ~= "table" then
    return false, nil, "missing", nil
  end
  local ok, result = pcall(rawget, value, key)
  if not ok then
    remember_access_error("raw_get", path or safe_tostring(key), result)
    return false, nil, "error", result
  end
  if result == nil then
    return false, nil, "missing", nil
  end
  return true, result, "raw", nil
end

local function safe_index_get(value, key, path)
  local raw_ok, raw_value, raw_source, raw_err = safe_raw_get(value, key, path)
  if raw_ok then
    return true, raw_value, raw_source, nil
  end
  if raw_source == "error" then
    return false, nil, "error", raw_err
  end

  local ok, result = pcall(function()
    return value[key]
  end)
  if not ok then
    remember_access_error("index_get", path or safe_tostring(key), result)
    return false, nil, "error", result
  end
  if result == nil then
    return false, nil, "missing", nil
  end
  return true, result, "index", nil
end

local function safe_global(name)
  return safe_index_get(ROOT_G, name, name)
end

local function safe_metatable_presence(value)
  if safe_type(getmetatable) ~= "function" then
    return "unavailable"
  end
  local ok, result = pcall(getmetatable, value)
  if not ok then
    remember_access_error("metatable", "<value>", result)
    return "error"
  end
  if result == nil then
    return "missing"
  end
  return "present"
end

local function pack_values(...)
  return { n = select("#", ...), ... }
end

local function bool_text(value)
  return value and "true" or "false"
end

local function runtime_signals()
  local signals = {}

  local function global_signal(name)
    local ok, value, source = safe_global(name)
    signals[name .. "_present"] = ok
    signals[name .. "_type"] = ok and safe_type(value) or "nil"
    signals[name .. "_source"] = source or "missing"
    signals[name .. "_value"] = value
    return ok, value
  end

  global_signal("CurrentModGuid")
  global_signal("GameVariables")
  global_signal("gv")
  global_signal("flowchart")
  global_signal("ModUtilities")
  global_signal("GameUtilities")

  local io_ok, io_value = global_signal("io")
  local io_fields = { "open", "read", "write", "popen", "tmpfile" }
  for _, field in ipairs(io_fields) do
    local key = "io_" .. field .. "_present"
    local typ_key = "io_" .. field .. "_type"
    if io_ok then
      local ok, value = safe_index_get(io_value, field, "io." .. field)
      signals[key] = ok
      signals[typ_key] = ok and safe_type(value) or "nil"
    else
      signals[key] = false
      signals[typ_key] = "nil"
    end
  end

  return signals
end

local function get_effective_gamevariables_source(signals)
  if signals.GameVariables_present then
    return "GameVariables"
  end
  if signals.gv_present then
    return "gv"
  end
  return "none"
end

local function detect_execution_context(signals)
  local context = {
    detected_context = "callback-invocation",
    surrounding_context = "unknown",
    confidence = "likely",
    effective_gamevariables_source = get_effective_gamevariables_source(signals),
    safe_io_likely_injected = "unknown",
  }

  if signals.io_open_present or signals.io_read_present or signals.io_write_present then
    context.detected_context = "callback-invocation-with-safe-io"
    context.safe_io_likely_injected = "yes"
  else
    context.safe_io_likely_injected = "unknown"
  end

  if signals.GameVariables_present then
    context.surrounding_context = "save-aware-context"
  elseif signals.CurrentModGuid_present and signals.io_open_present and not signals.gv_present and not signals.flowchart_present then
    context.surrounding_context = "mod-with-safe-io-start"
  elseif signals.CurrentModGuid_present and not signals.gv_present and not signals.flowchart_present then
    context.surrounding_context = "mod-start"
  elseif (not signals.CurrentModGuid_present) and signals.gv_present and signals.flowchart_present and signals.io_open_present then
    context.surrounding_context = "luaexec-with-safe-io-scene-context"
  elseif (not signals.CurrentModGuid_present) and signals.gv_present and signals.flowchart_present then
    context.surrounding_context = "luaexec-scene-context"
  elseif signals.io_open_present then
    context.surrounding_context = "unknown-plugin-context"
  else
    context.surrounding_context = "unknown"
    context.confidence = "low"
  end

  return context
end

local function get_timestamp()
  local ok_os, os_value = safe_global("os")
  if ok_os then
    local ok_date, date_fn = safe_index_get(os_value, "date", "os.date")
    if ok_date and safe_type(date_fn) == "function" then
      local ok, result = pcall(date_fn, "%Y%m%d-%H%M%S")
      if ok and result ~= nil then
        return tostring(result)
      end
    end
  end
  return "unknown-time"
end

local function new_report()
  return {
    lines = {},
    dropped = 0,
    line = function(self, text)
      if #self.lines >= CALLBACK_PROBE_MAX_LINES_PER_REPORT then
        self.dropped = self.dropped + 1
        return
      end
      self.lines[#self.lines + 1] = tostring(text or "")
    end,
    section = function(self, title)
      self:line("")
      self:line("## " .. title)
      self:line(string.rep("-", string.len(title) + 3))
    end,
    text = function(self)
      local copy = {}
      for index = 1, #self.lines do
        copy[index] = self.lines[index]
      end
      if self.dropped > 0 then
        copy[#copy + 1] = ""
        copy[#copy + 1] = "Report line limit reached; truncated lines: " .. tostring(self.dropped)
      end
      return table.concat(copy, "\n")
    end,
  }
end

local function open_report_file(filename)
  local ok_io, io_value = safe_global("io")
  if not ok_io then
    return nil, "io table unavailable"
  end
  local ok_open, open_fn = safe_index_get(io_value, "open", "io.open")
  if not ok_open or safe_type(open_fn) ~= "function" then
    return nil, "io.open unavailable"
  end
  local ok_file, file_or_err = pcall(open_fn, filename, "w")
  if ok_file and file_or_err ~= nil then
    return file_or_err, nil
  end
  return nil, safe_tostring(file_or_err)
end

local function sanitize_path_part(value, fallback)
  local text = string.lower(tostring(value or ""))
  text = text:gsub("%s+", "_")
  text = text:gsub("[^a-z0-9_.-]+", "_")
  text = text:gsub("_+", "_")
  text = text:gsub("^_+", "")
  text = text:gsub("_+$", "")
  if text == "" then
    text = fallback or "item"
  end
  if string.len(text) > 64 then
    text = string.sub(text, 1, 64)
    text = text:gsub("_+$", "")
  end
  return text
end

local function path_join(left, right)
  left = tostring(left or "")
  right = tostring(right or "")
  if left == "" then
    return right
  end
  if string.sub(left, -1) == "/" then
    return left .. right
  end
  return left .. "/" .. right
end

local function open_file(path, mode)
  local ok_io, io_value = safe_global("io")
  if not ok_io then
    return nil, "io table unavailable"
  end
  local ok_open, open_fn = safe_index_get(io_value, "open", "io.open")
  if not ok_open or safe_type(open_fn) ~= "function" then
    return nil, "io.open unavailable"
  end
  local ok_file, file_or_err = pcall(open_fn, path, mode)
  if ok_file and file_or_err ~= nil then
    return file_or_err, nil
  end
  return nil, safe_tostring(file_or_err)
end

local function file_exists(path)
  local file = open_file(path, "r")
  if file ~= nil then
    pcall(function()
      file:close()
    end)
    return true
  end
  return false
end

local function write_text_file(path, content, mode)
  local file, err = open_file(path, mode or "w")
  if file == nil then
    return false, err
  end
  local ok_write, write_err = pcall(function()
    file:write(content)
    file:close()
  end)
  if ok_write then
    return true, nil
  end
  return false, safe_tostring(write_err)
end

local function runtime_test_base_name(index, label)
  local base = "runtime_test_" .. string.format("%03d", index)
  local sanitized_label = sanitize_path_part(label or "", "")
  if sanitized_label ~= "" then
    return base .. "_" .. sanitized_label
  end
  return base
end

local function choose_runtime_test_folder()
  local root = sanitize_path_part(RUNTIME_TEST_CONFIG.root or "probe", "probe")
  local label = RUNTIME_TEST_CONFIG.label or ""
  local requested = tostring(RUNTIME_TEST_CONFIG.id or "auto")

  if requested ~= "auto" and requested ~= "" then
    local test_id = sanitize_path_part(requested, "runtime_test_manual")
    if not string.match(test_id, "^runtime_test_") then
      test_id = "runtime_test_" .. test_id
    end
    return path_join(root, test_id), test_id
  end

  for index = 1, 999 do
    local test_id = runtime_test_base_name(index, label)
    local folder = path_join(root, test_id)
    local notes_path = path_join(folder, "notes.txt")
    if not file_exists(notes_path) then
      return folder, test_id
    end
  end

  local test_id = runtime_test_base_name(999, label)
  return path_join(root, test_id), test_id
end

local function notes_header(signals, context, transport)
  local lines = {}
  lines[#lines + 1] = "# MDRG Runtime Test"
  lines[#lines + 1] = ""
  lines[#lines + 1] = "test_id: " .. tostring(RUNTIME_TEST_CONFIG.test_id or "")
  lines[#lines + 1] = "created_at: " .. tostring(RUNTIME_TEST_CONFIG.created_at or "")
  lines[#lines + 1] = "runtime_test_label: " .. tostring(RUNTIME_TEST_CONFIG.label or "")
  lines[#lines + 1] = "objective: " .. tostring(RUNTIME_TEST_CONFIG.objective or "")
  lines[#lines + 1] = ""
  lines[#lines + 1] = "## Configuration"
  lines[#lines + 1] = ""
  local flags = RUNTIME_TEST_CONFIG.flags or {}
  for key, value in pairs(flags) do
    lines[#lines + 1] = tostring(key) .. ": " .. tostring(value)
  end
  lines[#lines + 1] = "callback_probe_enabled: " .. tostring(ENABLE_CALLBACK_PROBE)
  lines[#lines + 1] = "callback_probe_once_per_context: " .. tostring(CALLBACK_PROBE_ONCE_PER_CONTEXT)
  lines[#lines + 1] = "callback_probe_max_calls: " .. tostring(CALLBACK_PROBE_MAX_CALLS)
  lines[#lines + 1] = "context_label: " .. tostring(CALLBACK_PROBE_CONTEXT_LABEL)
  lines[#lines + 1] = ""
  lines[#lines + 1] = "## Runtime Signals At First Callback"
  lines[#lines + 1] = ""
  lines[#lines + 1] = "CurrentModGuid: " .. (signals.CurrentModGuid_present and "present" or "missing")
  lines[#lines + 1] = "GameVariables: " .. (signals.GameVariables_present and "present" or "missing")
  lines[#lines + 1] = "gv: " .. (signals.gv_present and "present" or "missing")
  lines[#lines + 1] = "flowchart: " .. (signals.flowchart_present and "present" or "missing")
  lines[#lines + 1] = "io.open: " .. (signals.io_open_present and "present" or "missing")
  lines[#lines + 1] = "effective_gamevariables_source: " .. tostring(context.effective_gamevariables_source)
  lines[#lines + 1] = "detected_context: " .. tostring(context.detected_context)
  lines[#lines + 1] = "transport: " .. tostring(transport)
  lines[#lines + 1] = ""
  lines[#lines + 1] = "## Manual Actions"
  lines[#lines + 1] = ""
  local actions = RUNTIME_TEST_CONFIG.actions or {}
  for _, action in ipairs(actions) do
    lines[#lines + 1] = "- " .. tostring(action)
  end
  lines[#lines + 1] = "- User may edit this section after the test."
  lines[#lines + 1] = ""
  lines[#lines + 1] = "## Reports"
  lines[#lines + 1] = ""
  lines[#lines + 1] = "Generated reports:"
  return table.concat(lines, "\n") .. "\n"
end

local function ensure_runtime_test(signals, context, transport)
  if not RUNTIME_TEST_CONFIG.enabled then
    return nil, nil
  end
  if RUNTIME_TEST_CONFIG.folder ~= nil then
    return RUNTIME_TEST_CONFIG.folder, RUNTIME_TEST_CONFIG.test_id
  end

  local folder, test_id = choose_runtime_test_folder()
  RUNTIME_TEST_CONFIG.folder = folder
  RUNTIME_TEST_CONFIG.test_id = test_id
  RUNTIME_TEST_CONFIG.created_at = get_timestamp()
  RUNTIME_TEST_CONFIG.notes_path = path_join(folder, "notes.txt")

  if not file_exists(RUNTIME_TEST_CONFIG.notes_path) then
    local ok, err = write_text_file(RUNTIME_TEST_CONFIG.notes_path, notes_header(signals, context, transport), "w")
    if not ok then
      remember_access_error("runtime_test_notes", RUNTIME_TEST_CONFIG.notes_path, err)
      RUNTIME_TEST_CONFIG.folder = nil
      RUNTIME_TEST_CONFIG.test_id = nil
      RUNTIME_TEST_CONFIG.notes_path = nil
      return nil, nil
    end
  end

  return folder, test_id
end

local function append_runtime_test_report(filename)
  if not RUNTIME_TEST_CONFIG.enabled or RUNTIME_TEST_CONFIG.notes_path == nil then
    return
  end
  RUNTIME_TEST_CONFIG.reports[#RUNTIME_TEST_CONFIG.reports + 1] = filename
  local ok, err = write_text_file(RUNTIME_TEST_CONFIG.notes_path, "- " .. filename .. "\n", "a")
  if not ok then
    remember_access_error("runtime_test_notes_append", RUNTIME_TEST_CONFIG.notes_path, err)
  end
end

local function build_report_path(info, phase, timestamp)
  CALLBACK_REPORT_SEQUENCE = CALLBACK_REPORT_SEQUENCE + 1
  local callback_id = sanitize_path_part(info.callback_id or info.callback_name or "callback", "callback")
  local phase_part = sanitize_path_part(phase or "phase", "phase")
  local filename = "callback-report-"
    .. timestamp
    .. "-"
    .. string.format("%03d", CALLBACK_REPORT_SEQUENCE)
    .. "-"
    .. callback_id
    .. "-"
    .. phase_part
    .. ".txt"

  local folder = RUNTIME_TEST_CONFIG.folder
  local path = folder and path_join(folder, filename) or filename
  if not file_exists(path) then
    return path, filename
  end

  for dup = 1, 99 do
    local duplicate_name = string.gsub(filename, "%.txt$", "-dup" .. string.format("%02d", dup) .. ".txt")
    local duplicate_path = folder and path_join(folder, duplicate_name) or duplicate_name
    if not file_exists(duplicate_path) then
      return duplicate_path, duplicate_name
    end
  end

  return path, filename
end

local function print_report(content)
  if safe_type(print) ~= "function" then
    return
  end
  print("=== MDRG CALLBACK CONTEXT REPORT BEGIN ===")
  local pos = 1
  local chunk = 1
  while pos <= string.len(content) do
    print("MDRG_CALLBACK_PROBE_CHUNK " .. tostring(chunk))
    print(string.sub(content, pos, pos + CALLBACK_PROBE_PRINT_CHUNK_SIZE - 1))
    pos = pos + CALLBACK_PROBE_PRINT_CHUNK_SIZE
    chunk = chunk + 1
  end
  print("=== MDRG CALLBACK CONTEXT REPORT END ===")
end

local function save_or_print(filename, content, file)
  if file ~= nil then
    local ok_write, err = pcall(function()
      file:write(content)
      file:close()
    end)
    if ok_write then
      if safe_type(print) == "function" then
        print("MDRG callback context report saved: " .. filename)
      end
      return true
    end
    remember_access_error("file_write", filename, err)
  end
  print_report(content)
  return false
end

local function normalize_callback_info(info)
  if safe_type(info) == "table" then
    return {
      callback_id = info.callback_id or info.name or info.debug_case_id or "callback",
      callback_name = info.name or info.callback_id or info.debug_case_id or "callback",
      callback_kind = info.callback_kind or "",
      expected_signature = info.expected_signature or "",
      source_stub = info.source_stub or "",
      debug_case_id = info.debug_case_id or "",
      trigger_hint = info.trigger_hint or "",
    }
  end
  local name = tostring(info or "callback")
  return {
    callback_id = name,
    callback_name = name,
    callback_kind = "",
    expected_signature = "",
    source_stub = "",
    debug_case_id = "",
    trigger_hint = "",
  }
end

local KNOWN_FIELD_PROBES = {
  item = {
    "GetName",
    "GetDescription",
    "GetCount",
    "GetPrice",
    "GetItemPrefab",
    "IsEquipped",
    "CanBeUsed",
    "CanBeUnpacked",
  },
  shopItem = {
    "ItemPrefab",
    "Item",
    "GameId",
    "Price",
    "Type",
  },
  popupFinishType = {
    "Ok",
    "Cancel",
    "Yes",
    "No",
  },
  storyCondition = {
    "ConditionMet",
    "And",
    "Or",
    "Not",
  },
  itemScopeCondition = {
    "ConditionMet",
    "AppliesTo",
  },
  material = {
    "shader",
    "name",
    "mainTexture",
    "color",
  },
  renderTexture = {
    "width",
    "height",
    "format",
    "name",
  },
  enumerator = {
    "MoveNext",
    "Current",
    "Reset",
  },
  gameStat = {
    "Value",
    "MinValue",
    "MaxValue",
  },
}

local function add_field_result(fields, owner, field, value, status, source, err)
  if #fields >= CALLBACK_PROBE_MAX_FIELDS_PER_ARG then
    return false
  end
  fields[#fields + 1] = {
    owner = owner,
    field = field,
    typ = status == "present" and safe_type(value) or "nil",
    status = status,
    source = source or status,
    value = status == "present" and format_value(value) or safe_tostring(err or ""),
  }
  return true
end

local function probe_index_field(fields, owner, value, field)
  local path = owner .. "." .. field
  local ok, result, source, err = safe_index_get(value, field, path)
  if ok then
    add_field_result(fields, owner, field, result, "present", source, nil)
    return true, result
  end
  add_field_result(fields, owner, field, nil, source == "error" and "error" or "missing", source, err)
  if source == "error" then
    remember_access_error("field_access", path, err)
  end
  return false, nil
end

local function probe_nutrition_profile(fields, arg_name, value)
  local stat_names = { "Satiation", "Health", "MentalHealth", "Stamina" }
  local stat_fields = { "Value", "MinValue", "MaxValue" }
  for _, stat_name in ipairs(stat_names) do
    local ok, stat_value = probe_index_field(fields, arg_name, value, stat_name)
    if ok then
      for _, field_name in ipairs(stat_fields) do
        probe_index_field(fields, arg_name .. "." .. stat_name, stat_value, field_name)
      end
    end
  end
end

local function probe_known_arg_fields(fields, arg_name, value)
  if arg_name == "nutritionProfile" then
    probe_nutrition_profile(fields, arg_name, value)
    return
  end

  local list = KNOWN_FIELD_PROBES[arg_name]
  if not list then
    return
  end
  for _, field_name in ipairs(list) do
    probe_index_field(fields, arg_name, value, field_name)
  end
end

local function argument_record(index, name, value)
  return {
    index = index,
    name = name or ("arg" .. tostring(index)),
    typ = safe_type(value),
    value = format_value(value),
    metatable = safe_metatable_presence(value),
  }
end

local function collect_arguments(args, arg_names)
  local records = {}
  for index = 1, args.n do
    local name = arg_names and arg_names[index] or ("arg" .. tostring(index))
    records[#records + 1] = argument_record(index, name, args[index])
  end
  return records
end

local function collect_fields(args, arg_names)
  local fields = {}
  for index = 1, args.n do
    local name = arg_names and arg_names[index] or ("arg" .. tostring(index))
    probe_known_arg_fields(fields, name, args[index])
  end
  return fields
end

local function infer_item_label(value)
  local text = safe_tostring(value)
  local userdata_label = string.match(text, "^<userdata:%s*(.-)>$")
  if userdata_label and userdata_label ~= "" then
    return userdata_label
  end
  return text
end

local function collect_item_context(args_pack, arg_names, info, phase)
  for index = 1, args_pack.n do
    local arg_name = arg_names and arg_names[index] or ("arg" .. tostring(index))
    if arg_name == "item" then
      local value = args_pack[index]
      return {
        present = true,
        callback_id = info.callback_id,
        phase = phase,
        arg_name = arg_name,
        typ = safe_type(value),
        value = format_value(value),
        metatable = safe_metatable_presence(value),
        debug_case_id = info.debug_case_id,
        callback_kind = info.callback_kind,
        source_stub = info.source_stub,
        expected_signature = info.expected_signature,
        inferred_item_label = infer_item_label(value),
      }
    end
  end
  return {
    present = false,
    callback_id = info.callback_id,
    phase = phase,
    arg_name = "",
    typ = "nil",
    value = "",
    metatable = "missing",
    debug_case_id = info.debug_case_id,
    callback_kind = info.callback_kind,
    source_stub = info.source_stub,
    expected_signature = info.expected_signature,
    inferred_item_label = "",
  }
end

local function emit_context_machine(report, info, phase, call_count, signals, context, transport)
  report:line("BEGIN_MDRG_CALLBACK_CONTEXT")
  local rows = {
    { "callback_id", info.callback_id },
    { "callback_name", info.callback_name },
    { "phase", phase },
    { "call_count", call_count },
    { "callback_kind", info.callback_kind },
    { "expected_signature", info.expected_signature },
    { "source_stub", info.source_stub },
    { "debug_case_id", info.debug_case_id },
    { "trigger_hint", info.trigger_hint },
    { "detected_context", context.detected_context },
    { "surrounding_context", context.surrounding_context },
    { "context_confidence", context.confidence },
    { "current_mod_guid_present", bool_text(signals.CurrentModGuid_present) },
    { "gamevariables_present", bool_text(signals.GameVariables_present) },
    { "gv_present", bool_text(signals.gv_present) },
    { "flowchart_present", bool_text(signals.flowchart_present) },
    { "io_present", bool_text(signals.io_present) },
    { "io_open_present", bool_text(signals.io_open_present) },
    { "io_read_present", bool_text(signals.io_read_present) },
    { "io_write_present", bool_text(signals.io_write_present) },
    { "io_popen_present", bool_text(signals.io_popen_present) },
    { "io_tmpfile_present", bool_text(signals.io_tmpfile_present) },
    { "modutilities_present", bool_text(signals.ModUtilities_present) },
    { "gameutilities_present", bool_text(signals.GameUtilities_present) },
    { "effective_gamevariables_source", context.effective_gamevariables_source },
    { "transport", transport },
    { "safe_io_likely_injected", context.safe_io_likely_injected },
  }
  for _, row in ipairs(rows) do
    report:line("callback|" .. machine_text(row[1]) .. "|" .. machine_text(row[2]))
  end
  report:line("END_MDRG_CALLBACK_CONTEXT")
end

local function emit_runtime_test_machine(report)
  if not RUNTIME_TEST_CONFIG.enabled or RUNTIME_TEST_CONFIG.test_id == nil then
    return
  end
  report:line("BEGIN_MDRG_RUNTIME_TEST_CONTEXT")
  report:line("runtime_test|id|" .. machine_text(RUNTIME_TEST_CONFIG.test_id))
  report:line("runtime_test|label|" .. machine_text(RUNTIME_TEST_CONFIG.label or ""))
  report:line("runtime_test|folder|" .. machine_text(RUNTIME_TEST_CONFIG.folder or ""))
  report:line("runtime_test|notes_path|" .. machine_text(RUNTIME_TEST_CONFIG.notes_path or ""))
  report:line("END_MDRG_RUNTIME_TEST_CONTEXT")
end

local function emit_args_machine(report, args)
  report:line("BEGIN_MDRG_CALLBACK_ARGS")
  for _, arg in ipairs(args) do
    report:line(
      "arg|"
        .. machine_text(arg.index)
        .. "|"
        .. machine_text(arg.name)
        .. "|"
        .. machine_text(arg.typ)
        .. "|"
        .. machine_text(arg.value)
        .. "|metatable:"
        .. machine_text(arg.metatable)
    )
  end
  report:line("END_MDRG_CALLBACK_ARGS")
end

local function emit_fields_machine(report, fields)
  report:line("BEGIN_MDRG_CALLBACK_FIELDS")
  for _, field in ipairs(fields) do
    report:line(
      "field|"
        .. machine_text(field.owner)
        .. "|"
        .. machine_text(field.field)
        .. "|"
        .. machine_text(field.typ)
        .. "|"
        .. machine_text(field.status)
        .. "|"
        .. machine_text(field.source)
        .. "|"
        .. machine_text(field.value)
    )
  end
  report:line("END_MDRG_CALLBACK_FIELDS")
end

local function emit_item_context_machine(report, item_context)
  report:line("BEGIN_MDRG_CALLBACK_ITEM_CONTEXT")
  report:line("item|callback_id|" .. machine_text(item_context.callback_id))
  report:line("item|phase|" .. machine_text(item_context.phase))
  report:line("item|arg_name|" .. machine_text(item_context.arg_name))
  report:line("item|type|" .. machine_text(item_context.typ))
  report:line("item|value|" .. machine_text(item_context.value))
  report:line("item|metatable|" .. machine_text(item_context.metatable))
  report:line("item|debug_case_id|" .. machine_text(item_context.debug_case_id))
  report:line("item|callback_kind|" .. machine_text(item_context.callback_kind))
  report:line("item|source_stub|" .. machine_text(item_context.source_stub))
  report:line("item|expected_signature|" .. machine_text(item_context.expected_signature))
  report:line("item|inferred_item_label|" .. machine_text(item_context.inferred_item_label))
  report:line("item|present|" .. machine_text(bool_text(item_context.present)))
  report:line("END_MDRG_CALLBACK_ITEM_CONTEXT")
end

local function emit_errors_machine(report, error_start_index)
  report:line("BEGIN_MDRG_CALLBACK_ERRORS")
  for index = error_start_index, #CALLBACK_ERRORS do
    local err = CALLBACK_ERRORS[index]
    report:line("error|" .. machine_text(err.kind) .. "|" .. machine_text(err.path) .. "|" .. machine_text(err.err))
  end
  report:line("END_MDRG_CALLBACK_ERRORS")
end

local function emit_human_report(report, filename, info, phase, call_count, signals, context, args, fields, item_context, error_start_index, transport, fallback_reason)
  report:line("# MDRG Callback Context Report")
  report:line("Generated at: " .. get_timestamp())
  report:line("Callback probe version: " .. CALLBACK_PROBE_VERSION)
  report:line("Report file: " .. filename)

  report:section("Callback Invocation")
  report:line("callback id: " .. tostring(info.callback_id))
  report:line("callback name: " .. tostring(info.callback_name))
  report:line("callback kind: " .. tostring(info.callback_kind))
  report:line("debug case id: " .. tostring(info.debug_case_id))
  report:line("source stub: " .. tostring(info.source_stub))
  report:line("expected signature: " .. tostring(info.expected_signature))
  report:line("trigger hint: " .. tostring(info.trigger_hint))
  report:line("phase: " .. tostring(phase))
  report:line("call count: " .. tostring(call_count))

  report:section("Callback Runtime / Injection Context")
  report:line("This is a callback/closure invocation context. Surrounding runtime signals are likely, not guaranteed.")
  report:line("CurrentModGuid: " .. bool_text(signals.CurrentModGuid_present) .. " (" .. tostring(signals.CurrentModGuid_type) .. ")")
  report:line("GameVariables: " .. bool_text(signals.GameVariables_present) .. " (" .. tostring(signals.GameVariables_type) .. ")")
  report:line("gv: " .. bool_text(signals.gv_present) .. " (" .. tostring(signals.gv_type) .. ")")
  report:line("flowchart: " .. bool_text(signals.flowchart_present) .. " (" .. tostring(signals.flowchart_type) .. ")")
  report:line("io: " .. bool_text(signals.io_present) .. " (" .. tostring(signals.io_type) .. ")")
  report:line("io.open: " .. bool_text(signals.io_open_present) .. " (" .. tostring(signals.io_open_type) .. ")")
  report:line("io.read: " .. bool_text(signals.io_read_present) .. " (" .. tostring(signals.io_read_type) .. ")")
  report:line("io.write: " .. bool_text(signals.io_write_present) .. " (" .. tostring(signals.io_write_type) .. ")")
  report:line("io.popen: " .. bool_text(signals.io_popen_present) .. " (" .. tostring(signals.io_popen_type) .. ")")
  report:line("io.tmpfile: " .. bool_text(signals.io_tmpfile_present) .. " (" .. tostring(signals.io_tmpfile_type) .. ")")
  report:line("ModUtilities: " .. bool_text(signals.ModUtilities_present) .. " (" .. tostring(signals.ModUtilities_type) .. ")")
  report:line("GameUtilities: " .. bool_text(signals.GameUtilities_present) .. " (" .. tostring(signals.GameUtilities_type) .. ")")
  report:line("effective GameVariables source: " .. context.effective_gamevariables_source)
  report:line("detected context: " .. context.detected_context)
  report:line("surrounding context: " .. context.surrounding_context)
  report:line("transport: " .. transport)
  report:line("safe IO likely injected: " .. context.safe_io_likely_injected)
  if fallback_reason and fallback_reason ~= "" then
    report:line("fallback reason: " .. fallback_reason)
  end
  if signals.io_open_present then
    report:line("io is present. If this came from LuaPatch/safe IO, treat it as an injected bridge API, not native MDRG.")
  end
  if signals.io_popen_present then
    report:line("io.popen field is present but was not called. Presence does not prove process execution capability.")
  end

  report:section("Callback Lifecycle Matrix")
  report:line("Callback:")
  report:line("- name: " .. tostring(info.callback_name))
  report:line("- phase: " .. tostring(phase))
  report:line("")
  report:line("Current runtime signals:")
  report:line("- CurrentModGuid: " .. bool_text(signals.CurrentModGuid_present))
  report:line("- GameVariables: " .. bool_text(signals.GameVariables_present))
  report:line("- gv: " .. bool_text(signals.gv_present))
  report:line("- flowchart: " .. bool_text(signals.flowchart_present))
  report:line("- io.open: " .. bool_text(signals.io_open_present))
  report:line("")
  report:line("Likely phase:")
  report:line("- callback invocation during gameplay or system evaluation")
  report:line("- registered earlier by mod startup / OnGameStart-like script")
  report:line("- exact caller is not guaranteed unless callback name identifies it")

  report:section("Arguments")
  if #args == 0 then
    report:line("No arguments.")
  end
  for _, arg in ipairs(args) do
    report:line("- #" .. tostring(arg.index) .. " " .. arg.name .. ": " .. arg.typ .. " " .. arg.value .. " (metatable " .. arg.metatable .. ")")
  end

  report:section("Item Context")
  report:line("item present: " .. (item_context.present and "yes" or "no"))
  report:line("item tostring: " .. tostring(item_context.value))
  report:line("item type: " .. tostring(item_context.typ))
  report:line("item metatable: " .. tostring(item_context.metatable))
  report:line("debug inferred name: " .. tostring(item_context.inferred_item_label))
  report:line("debug case id: " .. tostring(item_context.debug_case_id))
  report:line("callback kind: " .. tostring(item_context.callback_kind))
  report:line("source stub: " .. tostring(item_context.source_stub))

  report:section("Field Probe")
  if #fields == 0 then
    report:line("No known field probes for these argument names.")
  end
  for _, field in ipairs(fields) do
    report:line(
      "- "
        .. field.owner
        .. "."
        .. field.field
        .. ": "
        .. field.status
        .. " "
        .. field.typ
        .. " ["
        .. field.source
        .. "] "
        .. field.value
    )
  end

  report:section("Access Errors")
  local count = #CALLBACK_ERRORS - error_start_index + 1
  if count < 0 then
    count = 0
  end
  report:line("Total access errors: " .. tostring(count))
  for index = error_start_index, #CALLBACK_ERRORS do
    local err = CALLBACK_ERRORS[index]
    report:line("- " .. err.kind .. " " .. err.path .. ": " .. err.err)
  end

  report:section("Machine Readable Summary")
  emit_runtime_test_machine(report)
  emit_context_machine(report, info, phase, call_count, signals, context, transport)
  emit_args_machine(report, args)
  emit_item_context_machine(report, item_context)
  emit_fields_machine(report, fields)
  emit_errors_machine(report, error_start_index)
end

local function emit_callback_report(info, phase, call_count, args_pack, arg_names, extra_error)
  local error_start_index = #CALLBACK_ERRORS + 1
  if extra_error ~= nil then
    remember_access_error("callback_error", info.callback_name, extra_error)
  end

  local signals = runtime_signals()
  local context = detect_execution_context(signals)
  local timestamp = get_timestamp()
  local expected_transport = signals.io_open_present and "file" or "console-fallback"
  ensure_runtime_test(signals, context, expected_transport)
  local report_path, filename = build_report_path(info, phase, timestamp)
  local file, open_error = open_file(report_path, "w")
  local transport = file and "file" or "console-fallback"
  local args = collect_arguments(args_pack, arg_names)
  local fields = collect_fields(args_pack, arg_names)
  local item_context = collect_item_context(args_pack, arg_names, info, phase)
  local report = new_report()

  emit_human_report(report, report_path, info, phase, call_count, signals, context, args, fields, item_context, error_start_index, transport, open_error)

  if save_or_print(report_path, report:text(), file) then
    append_runtime_test_report(filename)
  end
end

local function should_record(info)
  CALLBACK_CALL_COUNTS[info.callback_id] = (CALLBACK_CALL_COUNTS[info.callback_id] or 0) + 1
  local count = CALLBACK_CALL_COUNTS[info.callback_id]
  if count > CALLBACK_PROBE_MAX_CALLS then
    return false, count
  end
  if CALLBACK_PROBE_ONCE_PER_CONTEXT and CALLBACK_SEEN[info.callback_id] then
    return false, count
  end
  CALLBACK_SEEN[info.callback_id] = true
  return true, count
end

local function probe_wrap(callback_info, fn, arg_names)
  if safe_type(fn) ~= "function" then
    return fn
  end
  local info = normalize_callback_info(callback_info)
  if not ENABLE_CALLBACK_PROBE then
    return fn
  end

  return function(...)
    local args_pack = pack_values(...)
    local record, count = should_record(info)
    if record then
      emit_callback_report(info, "before", count, args_pack, arg_names)
    end

    local result_pack
    local ok, err = pcall(function()
      result_pack = pack_values(fn(unpack_values(args_pack, 1, args_pack.n)))
    end)
    if not ok then
      emit_callback_report(info, "error", count, args_pack, arg_names, err)
      error(err)
    end

    if record and CALLBACK_PROBE_COMPARE_BEFORE_AFTER then
      emit_callback_report(info, "after", count, args_pack, arg_names)
    end

    return unpack_values(result_pack, 1, result_pack.n)
  end
end

local function configure(options)
  if safe_type(options) ~= "table" then
    return
  end
  if options.enabled ~= nil then
    ENABLE_CALLBACK_PROBE = options.enabled == true
  end
  if options.once_per_context ~= nil then
    CALLBACK_PROBE_ONCE_PER_CONTEXT = options.once_per_context == true
  end
  if options.max_calls ~= nil and tonumber(options.max_calls) ~= nil then
    CALLBACK_PROBE_MAX_CALLS = tonumber(options.max_calls)
  end
  if options.compare_before_after ~= nil then
    CALLBACK_PROBE_COMPARE_BEFORE_AFTER = options.compare_before_after == true
  end
  if options.context_label ~= nil then
    CALLBACK_PROBE_CONTEXT_LABEL = tostring(options.context_label)
  end
end

local function configure_runtime_test(options)
  if safe_type(options) ~= "table" then
    return
  end
  if options.enabled ~= nil then
    RUNTIME_TEST_CONFIG.enabled = options.enabled == true
  end
  if options.root ~= nil then
    RUNTIME_TEST_CONFIG.root = tostring(options.root)
  end
  if options.id ~= nil then
    RUNTIME_TEST_CONFIG.id = tostring(options.id)
  end
  if options.label ~= nil then
    RUNTIME_TEST_CONFIG.label = sanitize_path_part(options.label, "")
  end
  if options.objective ~= nil then
    RUNTIME_TEST_CONFIG.objective = tostring(options.objective)
  end
  if safe_type(options.actions) == "table" then
    RUNTIME_TEST_CONFIG.actions = options.actions
  end
  if safe_type(options.flags) == "table" then
    RUNTIME_TEST_CONFIG.flags = options.flags
  end
end

MDRG_CALLBACK_PROBE = {
  configure = configure,
  configure_runtime_test = configure_runtime_test,
  wrap = probe_wrap,
  status = function()
    local signals = runtime_signals()
    local context = detect_execution_context(signals)
    return {
      enabled = ENABLE_CALLBACK_PROBE,
      max_calls = CALLBACK_PROBE_MAX_CALLS,
      once_per_context = CALLBACK_PROBE_ONCE_PER_CONTEXT,
      compare_before_after = CALLBACK_PROBE_COMPARE_BEFORE_AFTER,
      context_label = CALLBACK_PROBE_CONTEXT_LABEL,
      detected_context = context.detected_context,
      surrounding_context = context.surrounding_context,
      effective_gamevariables_source = context.effective_gamevariables_source,
      io_open_present = signals.io_open_present,
      runtime_test_enabled = RUNTIME_TEST_CONFIG.enabled,
      runtime_test_id = RUNTIME_TEST_CONFIG.test_id,
      runtime_test_folder = RUNTIME_TEST_CONFIG.folder,
      calls = CALLBACK_CALL_COUNTS,
    }
  end,
}

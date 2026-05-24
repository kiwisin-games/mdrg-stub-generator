---@meta

-- MDRG MoonSharp Lua API definitions for LuaLS.
-- Generated from docs.txt and curated data/*.json.
-- These files describe exposed types and signatures only; comments avoid undocumented runtime behavior.

---@class json
---MoonSharp JSON null sentinel.
---@field null any
json = {}

---Parses a JSON string using MoonSharp's JSON support.
---@param value string
---@return any
function json.parse(value) end

---Serializes a Lua value using MoonSharp's JSON support.
---@param value any
---@return string
function json.serialize(value) end

---Returns true when value is MoonSharp's JSON null sentinel.
---@param value any
---@return boolean
function json.isnull(value) end

---Returns true when s starts with prefix.
---@param s string
---@param prefix string
---@return boolean
function string.startsWith(s, prefix) end

---Returns true when s ends with suffix.
---@param s string
---@param suffix string
---@return boolean
function string.endsWith(s, suffix) end

---Returns true when s contains value.
---@param s string
---@param value string
---@return boolean
function string.contains(s, value) end

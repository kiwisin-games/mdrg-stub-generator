---@meta

-- MDRG MoonSharp Lua API definitions for LuaLS.
-- Generated from docs.txt and curated data/*.json.
-- These files describe exposed types and signatures only; comments avoid undocumented runtime behavior.

---@class MoonSharpInfo
---@field version string
---@field luacompat string
---@field platform string
---@field is_aot boolean
---@field is_unity boolean
---@field is_mono boolean
---@field is_clr4 boolean
---@field is_pcl boolean
---@field banner string

---@type table
_G = _G

---@type string
_VERSION = _VERSION

---@type MoonSharpInfo
_MOONSHARP = _MOONSHARP

---Guid of the mod whose Lua script window is currently executing. Set by ModsSingleton.ModScriptWindow before running mod Lua closures.
---@type Guid
CurrentModGuid = CurrentModGuid

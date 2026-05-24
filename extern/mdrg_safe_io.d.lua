---@meta

-- MDRG LuaPatch Safe IO Bridge stubs for LuaLS.
-- Describes the sandboxed `io` table injected by LuaPatch.
-- Runtime root is UserData/LuaExec. Absolute paths and paths escaping this root are blocked.

---@alias MdrgIoOpenMode
---| '"r"'   # read text
---| '"w"'   # write text, truncate/create
---| '"a"'   # append text, create if missing
---| '"r+"'  # read/write text, file must exist
---| '"w+"'  # read/write text, truncate/create
---| '"a+"'  # read/append text, create if missing
---| '"rb"'  # read binary
---| '"wb"'  # write binary, truncate/create
---| '"ab"'  # append binary, create if missing
---| '"r+b"' # read/write binary, file must exist
---| '"w+b"' # read/write binary, truncate/create
---| '"a+b"' # read/append binary, create if missing
---| '"rb+"'
---| '"wb+"'
---| '"ab+"'

---@alias MdrgIoReadFormat
---| '"*a"' # read the whole remaining file
---| '"*l"' # read next line without newline
---| '"*L"' # read next line with newline when available
---| '"*n"' # read a number
---| '"a"'
---| '"l"'
---| '"L"'
---| '"n"'

---@alias MdrgIoSeekWhence
---| '"set"' # seek from beginning
---| '"cur"' # seek from current position
---| '"end"' # seek from end

---@alias MdrgIoBufferMode
---| '"no"'
---| '"full"'
---| '"line"'

---@alias MdrgIoFileType
---| '"file"'
---| '"closed file"'

---Sandboxed file handle returned by LuaPatch's safe `io.open`.
---The handle mimics Lua/MoonSharp-style file methods, but all paths are resolved inside UserData/LuaExec.
---@class MdrgIoFile
local MdrgIoFile = {}

---Closes the file handle.
---@return true|nil ok
---@return string? err
function MdrgIoFile:close() end

---Flushes buffered data to disk.
---@return true|nil ok
---@return string? err
function MdrgIoFile:flush() end

---Writes one or more values to the file.
---Values are converted to strings by the bridge.
---@param ... string|number|boolean
---@return MdrgIoFile|nil file
---@return string? err
function MdrgIoFile:write(...) end

---Reads from the file.
---
---Supported formats:
---- no args: same as "*l"
---- "*l" or "l": next line without newline
---- "*L" or "L": next line preserving newline when available
---- "*a" or "a": all remaining contents
---- "*n" or "n": next number
---- integer: up to N characters/bytes depending on text/binary mode
---@param ... MdrgIoReadFormat|integer
---@return any ...
function MdrgIoFile:read(...) end

---Returns an iterator over lines from this file.
---The file is closed automatically when iteration reaches EOF.
---@param ... MdrgIoReadFormat|integer
---@return fun(): any ...
function MdrgIoFile:lines(...) end

---Seeks to a position in the file and returns the new position.
---@param whence? MdrgIoSeekWhence defaults to "cur"
---@param offset? integer defaults to 0
---@return integer|nil pos
---@return string? err
function MdrgIoFile:seek(whence, offset) end

---Sets buffering mode.
---Implemented for compatibility; exact buffering may differ from native MoonSharp.
---@param mode MdrgIoBufferMode
---@param size? integer
---@return true|nil ok
---@return string? err
function MdrgIoFile:setvbuf(mode, size) end

---Sandboxed replacement for MoonSharp/Lua `io`.
---All file paths are relative to UserData/LuaExec.
---@class mdrg_io
---@field stdin MdrgIoFile? Compatibility field; may be nil in the bridge.
---@field stdout MdrgIoFile? Compatibility field; may be nil in the bridge.
---@field stderr MdrgIoFile? Compatibility field; may be nil in the bridge.
io = {}

---Opens a file inside UserData/LuaExec.
---
---Returns `file` on success, or `nil, err` on failure.
---Absolute paths and `..` escaping UserData/LuaExec are rejected.
---@param filename string
---@param mode? MdrgIoOpenMode defaults to "r"
---@return MdrgIoFile|nil file
---@return string? err
function io.open(filename, mode) end

---Closes a file. If omitted, closes the current default output file.
---@param file? MdrgIoFile
---@return true|nil ok
---@return string? err
function io.close(file) end

---Flushes the current default output file.
---@return true|nil ok
---@return string? err
function io.flush() end

---Gets or sets the default input file.
---
---With no args, returns the current input handle.
---With a string, opens that file for reading and sets it as default input.
---With a file handle, sets it as default input.
---@overload fun(): MdrgIoFile|nil
---@overload fun(file: MdrgIoFile): MdrgIoFile|nil, string?
---@param filename string
---@return MdrgIoFile|nil file
---@return string? err
function io.input(filename) end

---Gets or sets the default output file.
---
---With no args, returns the current output handle.
---With a string, opens that file for writing and sets it as default output.
---With a file handle, sets it as default output.
---@overload fun(): MdrgIoFile|nil
---@overload fun(file: MdrgIoFile): MdrgIoFile|nil, string?
---@param filename string
---@return MdrgIoFile|nil file
---@return string? err
function io.output(filename) end

---Reads from the current default input file.
---@param ... MdrgIoReadFormat|integer
---@return any ...
function io.read(...) end

---Writes to the current default output file.
---@param ... string|number|boolean
---@return MdrgIoFile|nil file
---@return string? err
function io.write(...) end

---Iterates over lines from a file.
---If `filename` is omitted, iterates over the current default input.
---@param filename? string
---@param ... MdrgIoReadFormat|integer
---@return fun(): any ...
function io.lines(filename, ...) end

---Returns "file", "closed file", or nil.
---@param file any
---@return MdrgIoFileType|nil
function io.type(file) end

---Lua's native io.tmpfile is intentionally unavailable in the sandbox.
---@return nil file
---@return string err
function io.tmpfile() end

---Lua's native io.popen is intentionally unavailable in the sandbox.
---@param prog string
---@param mode? string
---@return nil file
---@return string err
function io.popen(prog, mode) end

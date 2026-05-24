-- Autocomplete smoke test for the mdrg LuaLS addon.

local guid = CurrentModGuid
local generic_id = GameId.CreateGeneric(guid, 1001)

local prefab = ModUtilities.CreateItemPrefab("Example Item", "Created from Lua", 25)
local registered_id = ModUtilities.CreateNewItem(guid, prefab)

local item = Item.CreateRandomItem(registered_id, true)
local name = item:ToString()
local description = item:GetDescription()

local prefab_from_manager = ItemPrefabManager.GetItemById(registered_id)
local can_go_into = prefab_from_manager:CanGoInto("body")

GameUtilities.AddItemToInventory(item)

local encoded = json.serialize({
  id = registered_id:ToLuaString(),
  genericId = generic_id:ToLuaString(),
  name = name,
  description = description,
  canGoInto = can_go_into,
})
local decoded = json.parse(encoded)

if string.startsWith(name, "Example") then
  print(decoded)
end

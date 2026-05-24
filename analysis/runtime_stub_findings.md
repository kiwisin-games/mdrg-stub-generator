# Runtime stub findings

These findings are review material only. They do not edit stubs automatically.

## Callback signatures

### EdibleItemPrefabData.CreateInstance

Stub signature:
```lua
---@param getNutritionProfile fun(arg1: Item, arg2: EdibleItemNutritionProfile)
function EdibleItemPrefabData.CreateInstance(...) end
```

Runtime result:
- Status: `runtime-confirmed`.
- Observed reports: 28.
- Observed args: item: userdata, nutritionProfile: userdata.

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

### EdibleItemPrefabData.CreateInstanceDish

Stub signature: not found in callback catalog.

Runtime result:
- Status: `runtime-confirmed`.
- Observed reports: 52.
- Observed args: item: userdata, nutritionProfile: userdata.
- Access errors:
  - `index_get` `nutritionProfile.Satiation.MinValue`: C:\Users\user\Desktop\Factorial\Factorial\UserData\LuaDumps\0d4e8be8-4f8f-4f76-a5ec-67a120215d5a.zip_OnGameStart_mdrg_callback_context_probe_d5d72605.lua_closure1.lua:(131,4-21): cannot access field MinValue of userdata<GameStatFixedValue>
  - `field_access` `nutritionProfile.Satiation.MinValue`: C:\Users\user\Desktop\Factorial\Factorial\UserData\LuaDumps\0d4e8be8-4f8f-4f76-a5ec-67a120215d5a.zip_OnGameStart_mdrg_callback_context_probe_d5d72605.lua_closure1.lua:(131,4-21): cannot access field MinValue of userdata<GameStatFixedValue>
  - `index_get` `nutritionProfile.Satiation.MaxValue`: C:\Users\user\Desktop\Factorial\Factorial\UserData\LuaDumps\0d4e8be8-4f8f-4f76-a5ec-67a120215d5a.zip_OnGameStart_mdrg_callback_context_probe_d5d72605.lua_closure1.lua:(131,4-21): cannot access field MaxValue of userdata<GameStatFixedValue>
  - `field_access` `nutritionProfile.Satiation.MaxValue`: C:\Users\user\Desktop\Factorial\Factorial\UserData\LuaDumps\0d4e8be8-4f8f-4f76-a5ec-67a120215d5a.zip_OnGameStart_mdrg_callback_context_probe_d5d72605.lua_closure1.lua:(131,4-21): cannot access field MaxValue of userdata<GameStatFixedValue>
  - `index_get` `nutritionProfile.Health`: C:\Users\user\Desktop\Factorial\Factorial\UserData\LuaDumps\0d4e8be8-4f8f-4f76-a5ec-67a120215d5a.zip_OnGameStart_mdrg_callback_context_probe_d5d72605.lua_closure1.lua:(131,4-21): cannot access field Health of userdata<EdibleItemNutritionProfile>
  - `field_access` `nutritionProfile.Health`: C:\Users\user\Desktop\Factorial\Factorial\UserData\LuaDumps\0d4e8be8-4f8f-4f76-a5ec-67a120215d5a.zip_OnGameStart_mdrg_callback_context_probe_d5d72605.lua_closure1.lua:(131,4-21): cannot access field Health of userdata<EdibleItemNutritionProfile>
  - `index_get` `nutritionProfile.MentalHealth`: C:\Users\user\Desktop\Factorial\Factorial\UserData\LuaDumps\0d4e8be8-4f8f-4f76-a5ec-67a120215d5a.zip_OnGameStart_mdrg_callback_context_probe_d5d72605.lua_closure1.lua:(131,4-21): cannot access field MentalHealth of userdata<EdibleItemNutritionProfile>
  - `field_access` `nutritionProfile.MentalHealth`: C:\Users\user\Desktop\Factorial\Factorial\UserData\LuaDumps\0d4e8be8-4f8f-4f76-a5ec-67a120215d5a.zip_OnGameStart_mdrg_callback_context_probe_d5d72605.lua_closure1.lua:(131,4-21): cannot access field MentalHealth of userdata<EdibleItemNutritionProfile>

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

### ItemPrefab.OnUse

Stub signature:
```lua
---@field OnUse fun(arg1: Item): boolean
```

Runtime result:
- Status: `runtime-confirmed`.
- Observed reports: 14.
- Observed args: item: userdata.

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

### ItemPrefab.SetRandomItemPostProcessing

Stub signature:
```lua
---@overload fun(self: ItemPrefab, randomItemPostprocessing: fun(arg1: Item))
function ItemPrefab.SetRandomItemPostProcessing(...) end
```

Runtime result:
- Status: `runtime-confirmed`.
- Observed reports: 108.
- Observed args: item: userdata.

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

### ItemPrefab.SpecialEffectAction

Stub signature:
```lua
---@field SpecialEffectAction fun(arg1: boolean, arg2: Item)
```

Runtime result:
- Status: `runtime-confirmed`.
- Observed reports: 9.
- Observed args: item: userdata, value: boolean.

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

### ItemScopeConditionCustom.CreateInstance

Stub signature:
```lua
---@param conditionFunc fun(arg1: Item): boolean
function ItemScopeConditionCustom.CreateInstance(...) end
```

Runtime result:
- Status: `runtime-confirmed`.
- Observed reports: 29.
- Observed args: item: userdata.

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

### ModUtilities.AddSingleBuyItemToShop.availabilityFunc

Stub signature: not found in callback catalog.

Runtime result:
- Status: `runtime-confirmed`.
- Observed reports: 75.
- Observed args: arg1: nil.

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

### ModUtilities.StartCoroutine

Stub signature:
```lua
---@overload fun(self: ModUtilities, closure: function, onFinished: fun())
function ModUtilities.StartCoroutine(...) end
```

Runtime result:
- Status: `runtime-confirmed`.
- Observed reports: 2.
- Observed args: arg1: nil.

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

### TextureOverriderManager.GetSpecialEffectsAction

Stub signature: not found in callback catalog.

Runtime result:
- Status: `runtime-confirmed`.
- Observed reports: 8.
- Observed args: item: userdata, value: boolean.

Suggested stub note:
- Require a live runtime instance before documenting usage.

### ItemPrefab.OnUnpack

Stub signature:
```lua
---@field OnUnpack fun(arg1: Item): Item[]
```

Runtime result:
- Status: `not-assignable-from-plain-lua`.
- Observed reports: 0.
- Observed args: -.

Suggested stub note:
- Document as requiring a C# bridge or native helper before plain Lua assignment is recommended.

### ItemPrefab.TurnIntoPersonalityModule

Stub signature: not found in callback catalog.

Runtime result:
- Status: `registered-but-not-triggered`.
- Observed reports: 0.
- Observed args: -.

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

### LuaPersonalityModuleDefinition.PrepareContainer

Stub signature: not found in callback catalog.

Runtime result:
- Status: `registered-but-not-triggered`.
- Observed reports: 0.
- Observed args: -.

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

### ModUtilities.AddGenericItemToShop.availabilityFunc

Stub signature: not found in callback catalog.

Runtime result:
- Status: `registered-but-not-triggered`.
- Observed reports: 0.
- Observed args: -.

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

### ModUtilities.PrepareNewPersonalityDefinition

Stub signature: not found in callback catalog.

Runtime result:
- Status: `registered-but-not-triggered`.
- Observed reports: 0.
- Observed args: -.

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

### StoryBotDialogueBranch.__new

Stub signature: not found in callback catalog.

Runtime result:
- Status: `registered-but-not-triggered`.
- Observed reports: 0.
- Observed args: -.

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

### StoryCondition.Delegate

Stub signature:
```lua
---@param condition fun(): boolean
function StoryCondition.Delegate(...) end
```

Runtime result:
- Status: `registered-but-not-triggered`.
- Observed reports: 0.
- Observed args: -.

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

### StoryCondition.Lua

Stub signature: not found in callback catalog.

Runtime result:
- Status: `registered-but-not-triggered`.
- Observed reports: 0.
- Observed args: -.

Suggested stub note:
- Wait for runtime callback report before applying stub notes.

## Runtime-confirmed fields

### EdibleItemNutritionProfile

Confirmed:
- `Satiation`: userdata

Inaccessible/not confirmed:
- `Health` (error)
- `MentalHealth` (error)
- `Stamina` (error)

Suggested action:
- Do not add inaccessible fields as public fields without additional evidence.

### Item

Confirmed:
- `CanBeUnpacked`: function
- `CanBeUsed`: function
- `GetCount`: function
- `GetDescription`: function
- `GetItemPrefab`: function
- `GetName`: function
- `GetPrice`: function
- `IsEquipped`: function

Inaccessible/not confirmed:
- None

Suggested action:
- Do not add inaccessible fields as public fields without additional evidence.

### nutritionProfile.Satiation

Confirmed:
- `Value`: number

Inaccessible/not confirmed:
- `MaxValue` (error)
- `MinValue` (error)

Suggested action:
- Do not add inaccessible fields as public fields without additional evidence.


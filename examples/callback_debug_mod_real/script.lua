-- MDRG callback/lifetime debug harness.
--
-- Inert by default. Enable flags manually when running this mod in a test save.
-- The goal is to register real callback cases and let the game trigger them.

-- Runtime testing:
-- Change these flags manually only in a disposable test copy/save.
-- Do not commit them enabled by default.
local ENABLE_DEBUG_ITEMS = false
local ENABLE_CALLBACK_PROBE = false
local DEBUG_ADD_TO_SHOP = false
local DEBUG_ENABLE_UI_CALLBACK_CASES = false
local DEBUG_ENABLE_STORY_CONDITION_CASES = false
local DEBUG_ENABLE_COROUTINE_CASES = false
local DEBUG_ENABLE_TEXTURE_CALLBACK_CASES = false

local DEBUG_SHOP_ID = "clothier"
local DEBUG_ITEM_PREFIX = "callback probe"
local DEBUG_TEXTURE_PATH =
  "/assets/Piercing de anel no septo/tex 2 - doggy.json"
local DEBUG_SPRITE_PATH =
  "/assets/Piercing de anel no septo/tex 2 - doggy_texture0_layer100.png"
local DEBUG_TEXTURE_OVERRIDE_TARGET = "Head_CatEars"

local callback_probe = MDRG_CALLBACK_PROBE
if callback_probe and callback_probe.configure then
  callback_probe.configure({
    enabled = ENABLE_CALLBACK_PROBE,
    once_per_context = false,
    max_calls = 120,
    context_label = "debug-mod-real",
  })
end

if callback_probe and callback_probe.configure_runtime_test then
  callback_probe.configure_runtime_test({
    enabled = ENABLE_CALLBACK_PROBE,
    root = "probe",
    id = "auto",
    label = "debug_mod_real",
    objective = "Manual runtime callback test for MDRG debug mod",
    actions = {
      "Use/equip/eat debug items",
      "Open clothier if DEBUG_ADD_TO_SHOP is true",
      "Check callback reports",
    },
    flags = {
      ENABLE_DEBUG_ITEMS = ENABLE_DEBUG_ITEMS,
      ENABLE_CALLBACK_PROBE = ENABLE_CALLBACK_PROBE,
      DEBUG_ADD_TO_SHOP = DEBUG_ADD_TO_SHOP,
      DEBUG_ENABLE_UI_CALLBACK_CASES = DEBUG_ENABLE_UI_CALLBACK_CASES,
      DEBUG_ENABLE_STORY_CONDITION_CASES = DEBUG_ENABLE_STORY_CONDITION_CASES,
      DEBUG_ENABLE_COROUTINE_CASES = DEBUG_ENABLE_COROUTINE_CASES,
      DEBUG_ENABLE_TEXTURE_CALLBACK_CASES = DEBUG_ENABLE_TEXTURE_CALLBACK_CASES,
    },
  })
end

local DEBUG_CALLBACK_COVERAGE = {
  {
    callback_key = "ItemPrefab.OnUse",
    case_id = "category-matrix",
    status = "covered",
    trigger_hint = "Use any debug item",
    risk = "runtime-callback",
  },
  {
    callback_key = "ItemPrefab.OnUnpack",
    case_id = "category-package",
    status = "justified",
    trigger_hint = "Not assigned by Lua debug mod",
    risk = "clr-delegate-array-return",
    reason = "Runtime field is System.Func<Item, Item[]>; MoonSharp cannot convert a plain Lua function/table return into CLR Item[] without a C# bridge.",
  },
  {
    callback_key = "ItemPrefab.SpecialEffectAction",
    case_id = "category-matrix",
    status = "covered",
    trigger_hint = "Equip/use items that trigger special effects",
    risk = "runtime-callback",
  },
  {
    callback_key = "ItemPrefab.SetRandomItemPostProcessing",
    case_id = "category-matrix",
    status = "covered",
    trigger_hint = "Runtime item creation/randomization path",
    risk = "runtime-callback",
  },
  {
    callback_key = "EdibleItemPrefabData.CreateInstance",
    case_id = "category-food",
    status = "covered",
    trigger_hint = "Eat Food/Fish/CookingIngredient debug item",
    risk = "runtime-callback",
  },
  {
    callback_key = "EdibleItemPrefabData.CreateInstanceDish",
    case_id = "category-food-cooked-dish",
    status = "covered",
    trigger_hint = "Eat cooked dish debug item",
    risk = "runtime-callback",
  },
  {
    callback_key = "ModUtilities.AddSingleBuyItemToShop.availabilityFunc",
    case_id = "shop-single-buy",
    status = "covered",
    trigger_hint = "Open target shop after DEBUG_ADD_TO_SHOP",
    risk = "shop-context",
  },
  {
    callback_key = "ModUtilities.AddGenericItemToShop.availabilityFunc",
    case_id = "shop-generic",
    status = "covered",
    trigger_hint = "Open target shop after DEBUG_ADD_TO_SHOP",
    risk = "shop-context",
  },
  {
    callback_key = "ItemScopeConditionCustom.CreateInstance",
    case_id = "item-scope-condition",
    status = "covered",
    trigger_hint = "Equip/render slot debug item",
    risk = "runtime-callback",
  },
  {
    callback_key = "TextureOverriderManager.GetSpecialEffectsAction",
    case_id = "texture-special-effect",
    status = "justified",
    trigger_hint = "Registered conditionally only when a live TextureOverriderManager instance is available",
    risk = "requires-runtime-manager-instance",
    reason = "GetSpecialEffectsAction is an instance method; calling it on static TextureOverriderManager userdata fails.",
  },
  {
    callback_key = "StoryCondition.Delegate",
    case_id = "story-delegate-condition",
    status = "covered",
    trigger_hint = "Story system evaluates condition; this script does not call ConditionMet",
    risk = "story-context",
  },
  {
    callback_key = "StoryCondition.Lua",
    case_id = "story-lua-condition",
    status = "covered",
    trigger_hint = "Story system evaluates LuaStoryCondition; this script does not call ConditionMet",
    risk = "story-context",
  },
  {
    callback_key = "ModUtilities.StartCoroutine",
    case_id = "coroutine-start",
    status = "covered",
    trigger_hint = "Enable coroutine cases; coroutine closure runs by runtime",
    risk = "coroutine-context",
  },
  {
    callback_key = "ModUtilities.PrepareNewPersonalityDefinition",
    case_id = "category-modules-personality",
    status = "covered",
    trigger_hint = "Create/equip the debug personality module",
    risk = "personality-module-context",
  },
  {
    callback_key = "ItemPrefab.TurnIntoPersonalityModule",
    case_id = "category-modules-personality",
    status = "covered",
    trigger_hint = "Create/equip the debug personality module",
    risk = "personality-module-context",
  },
  {
    callback_key = "LuaPersonalityModuleDefinition.PrepareContainer",
    case_id = "category-modules-personality",
    status = "covered",
    trigger_hint = "Personality module registration prepares dialogue containers",
    risk = "personality-module-context",
  },
  {
    callback_key = "StoryBotDialogueBranch.__new",
    case_id = "category-modules-personality",
    status = "covered",
    trigger_hint = "Personality module registration creates dialogue branches",
    risk = "personality-module-context",
  },
  {
    callback_key = "ItemPrefab.SetCustomShader",
    case_id = "texture-custom-shader",
    status = "justified",
    trigger_hint = "Not registered",
    risk = "texture-context",
    reason = "No shader asset is copied into this debug mod.",
  },
  {
    callback_key = "UiOverlay.*",
    case_id = "ui-callback-context",
    status = "justified",
    trigger_hint = "Not opened by startup script",
    risk = "ui-context",
    reason = "UI callbacks need explicit scene/UI interaction and should not be opened automatically.",
  },
  {
    callback_key = "ItemManager.*events",
    case_id = "manager-event-context",
    status = "justified",
    trigger_hint = "Not subscribed by startup script",
    risk = "manager-context",
    reason = "Manager events require lifecycle ownership and unsubscribe policy before runtime use.",
  },
}

local DEBUG_ITEM_CATEGORIES = {
  {
    id = "category-clothing",
    category_name = "Clothing",
    category = ItemCategory.Clothing,
    slot = "Head",
    use_texture = true,
  },
  {
    id = "category-food",
    category_name = "Food",
    category = ItemCategory.Food,
    edible_type = EdibleTypeEnum.Other,
  },
  {
    id = "category-food-cooked-dish",
    category_name = "FoodCookedDish",
    category = ItemCategory.FoodCookedDish,
    edible_dish = true,
  },
  {
    id = "category-usable",
    category_name = "Usable",
    category = ItemCategory.Usable,
  },
  {
    id = "category-package",
    category_name = "Package",
    category = ItemCategory.Package,
    package = true,
  },
  {
    id = "category-room",
    category_name = "Room",
    category = ItemCategory.Room,
  },
  {
    id = "category-modules",
    category_name = "Modules",
    category = ItemCategory.Modules,
    slot = "Head",
    use_texture = true,
  },
  {
    id = "category-modules-personality",
    category_name = "ModulesPersonality",
    category = ItemCategory.Modules,
    slot = "PersonalityModule",
    personality_module = true,
  },
  {
    id = "category-fish",
    category_name = "Fish",
    category = ItemCategory.Fish,
    edible_type = EdibleTypeEnum.Fish,
  },
  {
    id = "category-cooking-ingredient",
    category_name = "CookingIngredient",
    category = ItemCategory.CookingIngredient,
    edible_type = EdibleTypeEnum.MainVegetable,
  },
  {
    id = "category-fishing-trash",
    category_name = "FishingTrash",
    category = ItemCategory.FishingTrash,
  },
  {
    id = "category-meds",
    category_name = "Meds",
    category = ItemCategory.Meds,
  },
  {
    id = "category-soap",
    category_name = "Soap",
    category = ItemCategory.Soap,
  },
  {
    id = "category-anon-equip",
    category_name = "AnonEquip",
    category = ItemCategory.AnonEquip,
    slot = "Head",
    use_texture = true,
  },
  {
    id = "category-other",
    category_name = "Other",
    category = ItemCategory.Other,
  },
}

local DEBUG_CASE_REGISTRY = {}
local DEBUG_RUNTIME_OBJECTS = {}

local function register_debug_case(case)
  DEBUG_CASE_REGISTRY[#DEBUG_CASE_REGISTRY + 1] = case
  return case
end

for _, coverage in ipairs(DEBUG_CALLBACK_COVERAGE) do
  register_debug_case(coverage)
end

local function wrap_callback(
  case_id,
  callback_kind,
  source_stub,
  expected_signature,
  trigger_hint,
  fn,
  arg_names
)
  if callback_probe and callback_probe.wrap then
    return callback_probe.wrap({
      name = case_id .. "." .. callback_kind,
      callback_kind = callback_kind,
      expected_signature = expected_signature,
      source_stub = source_stub,
      debug_case_id = case_id,
      trigger_hint = trigger_hint,
    }, fn, arg_names)
  end
  return fn
end

local function make_on_use(case)
  return wrap_callback(
    case.id,
    "on-use",
    "ItemPrefab.OnUse",
    "fun(item: Item): boolean",
    "Use this debug item",
    function(item)
      return false
    end,
    { "item" }
  )
end

-- ItemPrefab.OnUnpack is exposed in stubs as `fun(item: Item): Item[]`,
-- but the runtime field is a CLR `System.Func<Item, Item[]>`.
-- MoonSharp cannot assign a plain Lua function/table return to this delegate.
-- Keep this case documented as requiring a C# bridge.

local function make_special_effect(case)
  return wrap_callback(
    case.id,
    "special-effect",
    "ItemPrefab.SpecialEffectAction",
    "fun(value: boolean, item: Item)",
    "Equip/use item when special effects are evaluated",
    function(value, item) end,
    { "value", "item" }
  )
end

local function make_nutrition_filler(case, source_stub)
  return wrap_callback(
    case.id,
    "nutrition-filler",
    source_stub or "EdibleItemPrefabData.CreateInstance",
    "fun(item: Item, nutritionProfile: EdibleItemNutritionProfile)",
    "Eat this debug item",
    function(item, nutritionProfile) end,
    { "item", "nutritionProfile" }
  )
end

local function make_random_post_processing(case)
  return wrap_callback(
    case.id,
    "random-item-post-processing",
    "ItemPrefab.SetRandomItemPostProcessing",
    "fun(item: Item)",
    "Runtime random item creation or item post-processing",
    function(item) end,
    { "item" }
  )
end

local function make_scope_condition(case)
  local condition_func = wrap_callback(
    "item-scope-condition",
    "item-scope-condition",
    "ItemScopeConditionCustom.CreateInstance",
    "fun(item: Item): boolean",
    "Runtime evaluates item scope condition",
    function(item)
      return true
    end,
    { "item" }
  )
  return ItemScopeConditionCustom.CreateInstance(condition_func)
end

local function make_shop_availability(case, callback_key)
  return wrap_callback(
    case.id,
    "shop-availability",
    callback_key,
    "fun(): boolean",
    "Open target shop after enabling DEBUG_ADD_TO_SHOP",
    function()
      return true
    end,
    {}
  )
end

local function apply_edible_data(itemprefab, case)
  if case.edible_dish then
    itemprefab.EdibleData = EdibleItemPrefabData.CreateInstanceDish(
      make_nutrition_filler(case, "EdibleItemPrefabData.CreateInstanceDish")
    )
  elseif case.edible_type ~= nil then
    itemprefab.EdibleData = EdibleItemPrefabData.CreateInstance(
      case.edible_type,
      make_nutrition_filler(case, "EdibleItemPrefabData.CreateInstance")
    )
  end
end

local function apply_slot_data(itemprefab, case)
  if case.slot == nil then
    return
  end
  local slot_data = SlotEquipData.CreateInstance(case.slot)
  local condition = make_scope_condition(case)
  slot_data.ElementActiveConditions = { condition }
  slot_data.TextureActiveConditions = { condition }
  itemprefab.SlotData = slot_data
end

local function debug_log(message)
  print("[MDRG Callback Debug] " .. tostring(message))
end

local function try_get_static_member(owner, key)
  local ok, value = pcall(function()
    return owner[key]
  end)
  if ok then
    return value
  end
  return nil
end

local function try_get_texture_overrider_manager()
  if TextureOverriderManager == nil then
    return nil, "TextureOverriderManager missing"
  end

  local manager =
    try_get_static_member(TextureOverriderManager, "ClothierManager")
  if manager ~= nil then
    return manager, "TextureOverriderManager.ClothierManager"
  end

  manager = try_get_static_member(TextureOverriderManager, "RoomManager")
  if manager ~= nil then
    return manager, "TextureOverriderManager.RoomManager"
  end

  local candidate_ids = {}
  local clothier_id =
    try_get_static_member(TextureOverriderManager, "ClothierID")
  local room_id = try_get_static_member(TextureOverriderManager, "RoomID")
  if clothier_id ~= nil then
    candidate_ids[#candidate_ids + 1] = clothier_id
  end
  if room_id ~= nil then
    candidate_ids[#candidate_ids + 1] = room_id
  end
  candidate_ids[#candidate_ids + 1] = "clothier"
  candidate_ids[#candidate_ids + 1] = "room"

  for _, manager_id in ipairs(candidate_ids) do
    local ok, result = pcall(function()
      return TextureOverriderManager.GetTextureOverriderManager(manager_id)
    end)
    if ok and result ~= nil then
      return result,
        "TextureOverriderManager.GetTextureOverriderManager(" .. tostring(
          manager_id
        ) .. ")"
    end
  end

  return nil, "no live TextureOverriderManager instance found"
end

local function try_get_texture_special_effect_action()
  local ok_sprite, sprite_ref = pcall(function()
    return ModUtilities.GetSpriteReference(
      CurrentModGuid,
      DEBUG_SPRITE_PATH,
      100
    )
  end)
  if not ok_sprite or sprite_ref == nil then
    return nil, "GetSpriteReference failed: " .. tostring(sprite_ref)
  end

  local manager, manager_source = try_get_texture_overrider_manager()
  if manager == nil then
    return nil, manager_source
  end

  local ok_colon, action_or_err = pcall(function()
    return manager:GetSpecialEffectsAction(
      DEBUG_TEXTURE_OVERRIDE_TARGET,
      sprite_ref
    )
  end)
  if ok_colon and action_or_err ~= nil then
    return action_or_err,
      "GetSpecialEffectsAction via " .. tostring(manager_source)
  end

  local ok_dot, action_or_err_dot = pcall(function()
    return manager.GetSpecialEffectsAction(
      manager,
      DEBUG_TEXTURE_OVERRIDE_TARGET,
      sprite_ref
    )
  end)
  if ok_dot and action_or_err_dot ~= nil then
    return action_or_err_dot,
      "GetSpecialEffectsAction dot-call via " .. tostring(manager_source)
  end

  -- Fallback: use the instance SpecialEffectsActionLogic inside a Lua SpecialEffectAction wrapper.
  -- This avoids calling the instance method on the static userdata during OnGameStart.
  local fallback = function(value, item)
    local ok_logic, logic_err = pcall(function()
      return manager:SpecialEffectsActionLogic(
        value,
        item,
        DEBUG_TEXTURE_OVERRIDE_TARGET,
        sprite_ref
      )
    end)
    if not ok_logic then
      debug_log(
        "Texture SpecialEffectsActionLogic failed: " .. tostring(logic_err)
      )
    end
  end

  return fallback,
    "SpecialEffectsActionLogic fallback via " .. tostring(manager_source)
end

local function apply_texture_cases(itemprefab, case)
  if case.use_texture then
    local ok_packed, packed_texture = pcall(function()
      return ModUtilities.GetPackedTexture(CurrentModGuid, DEBUG_TEXTURE_PATH)
    end)
    if ok_packed and packed_texture ~= nil then
      itemprefab.AddTexture(packed_texture)
    else
      debug_log(
        "GetPackedTexture failed for "
          .. tostring(case.id)
          .. ": "
          .. tostring(packed_texture)
      )
    end
  end

  if DEBUG_ENABLE_TEXTURE_CALLBACK_CASES and case.use_texture then
    local texture_action, source_or_err =
      try_get_texture_special_effect_action()
    if texture_action == nil then
      debug_log(
        "Texture special effect disabled for "
          .. tostring(case.id)
          .. ": "
          .. tostring(source_or_err)
      )
      return
    end

    debug_log(
      "Texture special effect action registered for "
        .. tostring(case.id)
        .. " via "
        .. tostring(source_or_err)
    )
    itemprefab.SpecialEffectAction = wrap_callback(
      "texture-special-effect",
      "texture-special-effect",
      "TextureOverriderManager.GetSpecialEffectsAction",
      "fun(value: boolean, item: Item)",
      "Trigger item SpecialEffectAction while texture cases are enabled",
      function(value, item)
        return texture_action(value, item)
      end,
      { "value", "item" }
    )
  end
end

local DEBUG_PERSONALITY_BRANCHES = {
  -- Full container coverage based on the extracted personality module pattern.
  -- Text is intentionally neutral: this debug mod only validates registration/lifetime behavior.
  {
    tag = "Frick_CumInside",
    text = [=[#pickrandom
Bot: Debug personality branch 0: Frick_CumInside.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 0,
  },
  {
    tag = "Frick_CumInsideAnal",
    text = [=[#pickrandom
Bot: Debug personality branch 1: Frick_CumInsideAnal.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 1,
  },
  {
    tag = "Frick_CumOutside",
    text = [=[#pickrandom
Bot: Debug personality branch 2: Frick_CumOutside.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 2,
  },
  {
    tag = "Frick_CumTogether",
    text = [=[#pickrandom
Bot: Debug personality branch 3: Frick_CumTogether.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 3,
  },
  {
    tag = "Frick_BotCumming",
    text = [=[#pickrandom
Bot: Debug personality branch 4: Frick_BotCumming.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 4,
  },
  {
    tag = "Frick_EdgingOn",
    text = [=[#pickrandom
Bot: Debug personality branch 5: Frick_EdgingOn.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 5,
  },
  {
    tag = "Frick_EdgingOff",
    text = [=[#pickrandom
Bot: Debug personality branch 6: Frick_EdgingOff.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 6,
  },
  {
    tag = "Frick_Moan",
    text = [=[#pickrandom
Bot: Debug personality branch 7: Frick_Moan.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 7,
  },
  {
    tag = "Frick_RapeBegStopSuccess",
    text = [=[#pickrandom
Bot: Debug personality branch 8: Frick_RapeBegStopSuccess.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 8,
  },
  {
    tag = "Frick_RapeBegStopRefuse",
    text = [=[#pickrandom
Bot: Debug personality branch 9: Frick_RapeBegStopRefuse.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 9,
  },
  {
    tag = "Frick_RapeFlacidReaction",
    text = [=[#pickrandom
Bot: Debug personality branch 10: Frick_RapeFlacidReaction.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 10,
  },
  {
    tag = "Frick_StartFrick",
    text = [=[#pickrandom
Bot: Debug personality branch 11: Frick_StartFrick.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 11,
  },
  {
    tag = "Frick_GenericFuckBrainStateRandomDialogueCockOutside",
    text = [=[#pickrandom
Bot: Debug personality branch 12: Frick_GenericFuckBrainStateRandomDialogueCockOutside.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 12,
  },
  {
    tag = "Frick_GenericFuckBrainStateRandomDialogueCockInside",
    text = [=[#pickrandom
Bot: Debug personality branch 13: Frick_GenericFuckBrainStateRandomDialogueCockInside.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 13,
  },
  {
    tag = "Frick_GenericFuckBrainStateRandomDialogueCockInsideAnal",
    text = [=[#pickrandom
Bot: Debug personality branch 14: Frick_GenericFuckBrainStateRandomDialogueCockInsideAnal.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 14,
  },
  {
    tag = "Frick_Headpat",
    text = [=[#pickrandom
Bot: Debug personality branch 15: Frick_Headpat.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 15,
  },
  {
    tag = "Frick_FingeringDuring",
    text = [=[#pickrandom
Bot: Debug personality branch 16: Frick_FingeringDuring.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 16,
  },
  {
    tag = "Frick_FingeringBotCumming",
    text = [=[#pickrandom
Bot: Debug personality branch 17: Frick_FingeringBotCumming.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 17,
  },
  {
    tag = "Frick_BoobFondle",
    text = [=[#pickrandom
Bot: Debug personality branch 18: Frick_BoobFondle.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 18,
  },
  {
    tag = "Frick_NipplePull",
    text = [=[#pickrandom
Bot: Debug personality branch 19: Frick_NipplePull.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 19,
  },
  {
    tag = "Frick_PussySpread",
    text = [=[#pickrandom
Bot: Debug personality branch 20: Frick_PussySpread.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 20,
  },
  {
    tag = "Frick_ClitRub",
    text = [=[#pickrandom
Bot: Debug personality branch 21: Frick_ClitRub.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 21,
  },
  {
    tag = "Frick_Handholding",
    text = [=[#pickrandom
Bot: Debug personality branch 22: Frick_Handholding.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 22,
  },
  {
    tag = "Frick_UpsetOnlySheMoves",
    text = [=[#pickrandom
Bot: Debug personality branch 23: Frick_UpsetOnlySheMoves.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 23,
  },
  {
    tag = "Frick_CumThighjob",
    text = [=[#pickrandom
Bot: Debug personality branch 24: Frick_CumThighjob.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 24,
  },
  {
    tag = "Frick_FlacidBoredReaction",
    text = [=[#pickrandom
Bot: Debug personality branch 25: Frick_FlacidBoredReaction.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 25,
  },
  {
    tag = "Blowjob_EdgingAlmostCame",
    text = [=[#pickrandom
Bot: Debug personality branch 26: Blowjob_EdgingAlmostCame.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 26,
  },
  {
    tag = "Blowjob_EdgingHadToSlowdown",
    text = [=[#pickrandom
Bot: Debug personality branch 27: Blowjob_EdgingHadToSlowdown.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 27,
  },
  {
    tag = "Blowjob_EdgingForceStop",
    text = [=[#pickrandom
Bot: Debug personality branch 28: Blowjob_EdgingForceStop.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 28,
  },
  {
    tag = "Blowjob_SwallowWithMl",
    text = [=[#pickrandom
Bot: Debug personality branch 29: Blowjob_SwallowWithMl.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 29,
  },
  {
    tag = "Blowjob_SwallowFull",
    text = [=[#pickrandom
Bot: Debug personality branch 30: Blowjob_SwallowFull.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 30,
  },
  {
    tag = "Blowjob_SwallowHalf",
    text = [=[#pickrandom
Bot: Debug personality branch 31: Blowjob_SwallowHalf.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 31,
  },
  {
    tag = "Blowjob_SwallowLittle",
    text = [=[#pickrandom
Bot: Debug personality branch 32: Blowjob_SwallowLittle.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 32,
  },
  {
    tag = "Blowjob_SwallowAlmostEmpty",
    text = [=[#pickrandom
Bot: Debug personality branch 33: Blowjob_SwallowAlmostEmpty.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 33,
  },
  {
    tag = "Blowjob_SwitchToCowgirlBotLead",
    text = [=[#pickrandom
Bot: Debug personality branch 34: Blowjob_SwitchToCowgirlBotLead.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 34,
  },
  {
    tag = "Blowjob_SwitchToCowgirlBotRape",
    text = [=[#pickrandom
Bot: Debug personality branch 35: Blowjob_SwitchToCowgirlBotRape.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 35,
  },
  {
    tag = "Cowgirl_RemovePants",
    text = [=[#pickrandom
Bot: Debug personality branch 36: Cowgirl_RemovePants.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 36,
  },
  {
    tag = "Cowgirl_BeforeFirstInsertBotLead",
    text = [=[#pickrandom
Bot: Debug personality branch 37: Cowgirl_BeforeFirstInsertBotLead.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 37,
  },
  {
    tag = "Cowgirl_BeforeFirstInsert",
    text = [=[#pickrandom
Bot: Debug personality branch 38: Cowgirl_BeforeFirstInsert.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 38,
  },
  {
    tag = "Cowgirl_EdgingForceStopped",
    text = [=[#pickrandom
Bot: Debug personality branch 39: Cowgirl_EdgingForceStopped.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 39,
  },
  {
    tag = "Cowgirl_EdgingBreak",
    text = [=[#pickrandom
Bot: Debug personality branch 40: Cowgirl_EdgingBreak.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 40,
  },
  {
    tag = "Cowgirl_FlacidReaction",
    text = [=[#pickrandom
Bot: Debug personality branch 41: Cowgirl_FlacidReaction.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 41,
  },
  {
    tag = "Cowgirl_WhereToCumQuestion",
    text = [=[#pickrandom
Bot: Debug personality branch 42: Cowgirl_WhereToCumQuestion.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 42,
  },
  {
    tag = "Cowgirl_WhereToCumQuestionDidntAnswer",
    text = [=[#pickrandom
Bot: Debug personality branch 43: Cowgirl_WhereToCumQuestionDidntAnswer.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 43,
  },
  {
    tag = "Cowgirl_BeforeFirstInsertRape",
    text = [=[#pickrandom
Bot: Debug personality branch 44: Cowgirl_BeforeFirstInsertRape.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 44,
  },
  {
    tag = "Cowgirl_MadeMcCumInsideWhileCummingHerself",
    text = [=[#pickrandom
Bot: Debug personality branch 45: Cowgirl_MadeMcCumInsideWhileCummingHerself.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 45,
  },
  {
    tag = "Cowgirl_BeforeSwitchToBlowjobBotLead",
    text = [=[#pickrandom
Bot: Debug personality branch 46: Cowgirl_BeforeSwitchToBlowjobBotLead.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 46,
  },
  {
    tag = "Cowgirl_BeforeSwitchToBlowjobRape",
    text = [=[#pickrandom
Bot: Debug personality branch 47: Cowgirl_BeforeSwitchToBlowjobRape.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 47,
  },
  {
    tag = "Cowgirl_AfterFirstInsertBotRape",
    text = [=[#pickrandom
Bot: Debug personality branch 48: Cowgirl_AfterFirstInsertBotRape.
Bot: This is a neutral callback/lifetime probe line.]=],
    stage = 48,
  },
}

local function add_debug_personality_branch(personality, branch)
  local ok, err = pcall(function()
    local container = personality.PrepareContainer(branch.tag)
    container.AddBranch(
      StoryBotDialogueBranch.__new(branch.text, CurrentModGuid, branch.stage)
    )
  end)
  if not ok then
    debug_log(
      "Personality branch registration failed for "
        .. tostring(branch.tag)
        .. ": "
        .. tostring(err)
    )
    return false
  end
  return true
end

local function create_debug_personality_definition(case)
  local ok, personality_or_err = pcall(function()
    return ModUtilities.PrepareNewPersonalityDefinition()
  end)
  if not ok or personality_or_err == nil then
    debug_log(
      "PrepareNewPersonalityDefinition failed for "
        .. tostring(case.id)
        .. ": "
        .. tostring(personality_or_err)
    )
    return nil
  end

  local personality = personality_or_err
  for _, branch in ipairs(DEBUG_PERSONALITY_BRANCHES) do
    add_debug_personality_branch(personality, branch)
  end
  DEBUG_RUNTIME_OBJECTS[#DEBUG_RUNTIME_OBJECTS + 1] = personality
  return personality
end

local function apply_personality_module(itemprefab, item_game_id, case)
  if not case.personality_module then
    return
  end

  local personality = create_debug_personality_definition(case)
  if personality == nil then
    return
  end

  local ok, err = pcall(function()
    -- Real mod examples use dot-call syntax here.
    itemprefab.TurnIntoPersonalityModule(item_game_id, personality)
  end)
  if not ok then
    debug_log(
      "TurnIntoPersonalityModule failed for "
        .. tostring(case.id)
        .. ": "
        .. tostring(err)
    )
    return
  end

  debug_log("Personality module registered for " .. tostring(case.id))
end

local function create_debug_item(case)
  local itemprefab = ModUtilities.CreateItemPrefab()
  itemprefab.Name = DEBUG_ITEM_PREFIX .. " " .. case.category_name
  itemprefab.Description = "Debug-only callback probe item for "
    .. case.category_name
    .. ". Disabled by default."
  itemprefab.Price = 1
  itemprefab.IsIllegal = false
  itemprefab.HasQuality = false
  itemprefab.IsStackable = false
  itemprefab.CanChangeColor = false
  itemprefab.ColorSlots = {}
  itemprefab.SusModifiers = {}
  itemprefab.Category = case.category
  itemprefab.ScratchType = ScratchTextureType.Universal
  if case.personality_module then
    itemprefab.IsPersonalityModule = true
  end
  itemprefab.OnUse = make_on_use(case)

  -- Require C# Bridge
  -- itemprefab.OnUnpack = make_on_unpack(case)
  -- itemprefab.OnUnpackGameIdHint = {}

  itemprefab.SpecialEffectAction = make_special_effect(case)
  itemprefab.SetRandomItemPostProcessing(make_random_post_processing(case))

  apply_slot_data(itemprefab, case)
  apply_edible_data(itemprefab, case)
  apply_texture_cases(itemprefab, case)

  local item_game_id =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab)
  apply_personality_module(itemprefab, item_game_id, case)
  if DEBUG_ADD_TO_SHOP then
    ModUtilities.AddSingleBuyItemToShop(
      DEBUG_SHOP_ID,
      item_game_id,
      make_shop_availability(
        case,
        "ModUtilities.AddSingleBuyItemToShop.availabilityFunc"
      )
    )
    if case.id == "category-other" then
      ModUtilities.AddGenericItemToShop(
        DEBUG_SHOP_ID,
        item_game_id,
        make_shop_availability(
          case,
          "ModUtilities.AddGenericItemToShop.availabilityFunc"
        )
      )
    end
  end
  return item_game_id
end

local function create_story_condition_cases()
  local delegate_condition = wrap_callback(
    "story-delegate-condition",
    "story-condition-delegate",
    "StoryCondition.Delegate",
    "fun(): boolean",
    "Story system evaluates this condition; startup does not call ConditionMet",
    function()
      return true
    end,
    {}
  )
  DEBUG_RUNTIME_OBJECTS[#DEBUG_RUNTIME_OBJECTS + 1] =
    StoryCondition.Delegate(delegate_condition, false)

  _G.MDRG_DEBUG_STORY_LUA_CONDITION = wrap_callback(
    "story-lua-condition",
    "story-condition-lua",
    "StoryCondition.Lua",
    "Lua condition code returning boolean",
    "Story system evaluates LuaStoryCondition; startup does not call ConditionMet",
    function()
      return true
    end,
    {}
  )
  DEBUG_RUNTIME_OBJECTS[#DEBUG_RUNTIME_OBJECTS + 1] =
    StoryCondition.Lua("return MDRG_DEBUG_STORY_LUA_CONDITION()", false)
end

local function create_coroutine_case()
  local closure = wrap_callback(
    "coroutine-start",
    "coroutine-closure",
    "ModUtilities.StartCoroutine",
    "function",
    "Runtime starts coroutine only when DEBUG_ENABLE_COROUTINE_CASES is enabled",
    function() end,
    {}
  )
  local on_finished = wrap_callback(
    "coroutine-start",
    "coroutine-on-finished",
    "ModUtilities.StartCoroutine",
    "fun()",
    "Runtime calls completion callback if coroutine completes",
    function() end,
    {}
  )
  DEBUG_RUNTIME_OBJECTS[#DEBUG_RUNTIME_OBJECTS + 1] =
    ModUtilities.StartCoroutine(closure, on_finished)
end

local function create_ui_context_metadata()
  register_debug_case({
    callback_key = "UiOverlay.*",
    case_id = "ui-callback-context",
    status = "justified",
    trigger_hint = "Manual UI opening only; not opened by debug startup script.",
    risk = "ui-context",
  })
end

local function create_callback_debug_matrix()
  if DEBUG_ENABLE_UI_CALLBACK_CASES then
    create_ui_context_metadata()
  end
  for _, case in ipairs(DEBUG_ITEM_CATEGORIES) do
    create_debug_item(case)
  end
  if DEBUG_ENABLE_STORY_CONDITION_CASES then
    create_story_condition_cases()
  end
  if DEBUG_ENABLE_COROUTINE_CASES then
    create_coroutine_case()
  end
end

if ENABLE_DEBUG_ITEMS then
  create_callback_debug_matrix()
end

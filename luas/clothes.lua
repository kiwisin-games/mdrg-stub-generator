--This script was generated automatically!
--Good luck with making the mod!
--May Sheep be with you!
do
  local itemprefab0 = ModUtilities.CreateItemPrefab()
  itemprefab0.Name = "Camiseta"
  itemprefab0.Description = "Camiseta simples"
  itemprefab0.Price = 400
  itemprefab0.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "UpperBody"
    sd.ControllerElementOverride = { "UpperBody_Shirt" }
    return sd
  end)()
  itemprefab0.IsIllegal = false
  itemprefab0.HasQuality = false
  itemprefab0.ThrowingOutForbidden = false
  itemprefab0.IsStackable = false
  itemprefab0.Category = ItemCategory.Clothing
  itemprefab0.CanChangeColor = false
  itemprefab0.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab0.Partners = {}
  itemprefab0.ScratchType = ScratchTextureType.Universal
  itemprefab0.SusModifiers =
    { SusModifier.CreateInstance(SusArea.UpperBody, 0.8) }

  local itemprefab0_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta/tex 1 - doggy.json"
  )

  itemprefab0.AddTexture(itemprefab0_doggy_texture0)

  local itemprefab0_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta/tex 2 - missionary.json"
  )

  itemprefab0.AddTexture(itemprefab0_missionary_texture1)

  local itemprefab0_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta/tex 3 - interaction.json"
  )

  itemprefab0.AddTexture(itemprefab0_interaction_texture2)

  local itemprefab0_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta/tex 4 - blowjob.json"
  )

  itemprefab0.AddTexture(itemprefab0_blowjob_texture3)

  local itemprefab0_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta/tex 5 - cowgirl.json"
  )

  itemprefab0.AddTexture(itemprefab0_cowgirl_texture4)

  local itemgameid0 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab0)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid0)

  local itemprefab1 = ModUtilities.CreateItemPrefab()
  itemprefab1.Name = "Calcinha"
  itemprefab1.Description = "Calcinha simples. "
  itemprefab1.Price = 300
  itemprefab1.SlotData = SlotEquipData.CreateInstance("Panties")
  itemprefab1.IsIllegal = false
  itemprefab1.HasQuality = false
  itemprefab1.ThrowingOutForbidden = false
  itemprefab1.IsStackable = false
  itemprefab1.Category = ItemCategory.Clothing
  itemprefab1.CanChangeColor = false
  itemprefab1.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab1.Partners = {}
  itemprefab1.ScratchType = ScratchTextureType.Universal
  itemprefab1.SusModifiers = { SusModifier.CreateInstance(SusArea.Pussy, 1) }

  local itemprefab1_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha/tex 1 - doggy.json"
  )

  itemprefab1.AddTexture(itemprefab1_doggy_texture0)

  local itemprefab1_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha/tex 2 - missionary.json"
  )

  itemprefab1.AddTexture(itemprefab1_missionary_texture1)

  local itemprefab1_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha/tex 3 - interaction.json"
  )

  itemprefab1.AddTexture(itemprefab1_interaction_texture2)

  local itemprefab1_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha/tex 4 - cowgirl.json"
  )

  itemprefab1.AddTexture(itemprefab1_cowgirl_texture3)

  local itemgameid1 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab1)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid1)

  local itemprefab2 = ModUtilities.CreateItemPrefab()
  itemprefab2.Name = "Sutiã plano"
  itemprefab2.Description = "Sutiã simples."
  itemprefab2.Price = 400
  itemprefab2.SlotData = SlotEquipData.CreateInstance("Bra")
  itemprefab2.IsIllegal = false
  itemprefab2.HasQuality = false
  itemprefab2.ThrowingOutForbidden = false
  itemprefab2.IsStackable = false
  itemprefab2.Category = ItemCategory.Clothing
  itemprefab2.CanChangeColor = false
  itemprefab2.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab2.Partners = {}
  itemprefab2.ScratchType = ScratchTextureType.Universal
  itemprefab2.SusModifiers = { SusModifier.CreateInstance(SusArea.Boobs, 1) }

  local itemprefab2_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã plano/tex 1 - doggy.json"
  )

  itemprefab2.AddTexture(itemprefab2_doggy_texture0)

  local itemprefab2_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã plano/tex 2 - missionary.json"
  )

  itemprefab2.AddTexture(itemprefab2_missionary_texture1)

  local itemprefab2_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã plano/tex 3 - interaction.json"
  )

  itemprefab2.AddTexture(itemprefab2_interaction_texture2)

  local itemprefab2_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã plano/tex 4 - blowjob.json"
  )

  itemprefab2.AddTexture(itemprefab2_blowjob_texture3)

  local itemprefab2_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã plano/tex 5 - cowgirl.json"
  )

  itemprefab2.AddTexture(itemprefab2_cowgirl_texture4)

  local itemgameid2 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab2)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid2)

  local itemprefab3 = ModUtilities.CreateItemPrefab()
  itemprefab3.Name = "Meia esquerda plana"
  itemprefab3.Description = "Meia esquerda simples!"
  itemprefab3.Price = 270
  itemprefab3.SlotData = SlotEquipData.CreateInstance("StockingL")
  itemprefab3.IsIllegal = false
  itemprefab3.HasQuality = false
  itemprefab3.ThrowingOutForbidden = false
  itemprefab3.IsStackable = false
  itemprefab3.Category = ItemCategory.Clothing
  itemprefab3.CanChangeColor = false
  itemprefab3.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab3.Partners = {}
  itemprefab3.ScratchType = ScratchTextureType.Universal
  itemprefab3.SusModifiers = { SusModifier.CreateInstance(SusArea.LegL, 0.5) }

  local itemprefab3_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia esquerda plana/tex 1 - doggy.json"
  )

  itemprefab3.AddTexture(itemprefab3_doggy_texture0)

  local itemprefab3_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia esquerda plana/tex 2 - missionary.json"
  )

  itemprefab3.AddTexture(itemprefab3_missionary_texture1)

  local itemprefab3_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia esquerda plana/tex 3 - interaction.json"
  )

  itemprefab3.AddTexture(itemprefab3_interaction_texture2)

  local itemprefab3_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia esquerda plana/tex 4 - cowgirl.json"
  )

  itemprefab3.AddTexture(itemprefab3_cowgirl_texture3)

  local itemgameid3 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab3)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid3)

  local itemprefab4 = ModUtilities.CreateItemPrefab()
  itemprefab4.Name = "Meia direita plana"
  itemprefab4.Description = "Meia direita simples!"
  itemprefab4.Price = 270
  itemprefab4.SlotData = SlotEquipData.CreateInstance("StockingR")
  itemprefab4.IsIllegal = false
  itemprefab4.HasQuality = false
  itemprefab4.ThrowingOutForbidden = false
  itemprefab4.IsStackable = false
  itemprefab4.Category = ItemCategory.Clothing
  itemprefab4.CanChangeColor = false
  itemprefab4.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab4.Partners = {}
  itemprefab4.ScratchType = ScratchTextureType.Universal
  itemprefab4.SusModifiers = { SusModifier.CreateInstance(SusArea.LegL, 0.5) }

  local itemprefab4_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia direita plana/tex 1 - doggy.json"
  )

  itemprefab4.AddTexture(itemprefab4_doggy_texture0)

  local itemprefab4_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia direita plana/tex 2 - missionary.json"
  )

  itemprefab4.AddTexture(itemprefab4_missionary_texture1)

  local itemprefab4_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia direita plana/tex 3 - interaction.json"
  )

  itemprefab4.AddTexture(itemprefab4_interaction_texture2)

  local itemprefab4_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia direita plana/tex 4 - cowgirl.json"
  )

  itemprefab4.AddTexture(itemprefab4_cowgirl_texture3)

  local itemgameid4 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab4)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid4)

  local itemprefab5 = ModUtilities.CreateItemPrefab()
  itemprefab5.Name = "Meia lingerie esquerda"
  itemprefab5.Description = "Meia esquerda sexy!"
  itemprefab5.Price = 400
  itemprefab5.SlotData = SlotEquipData.CreateInstance("StockingL")
  itemprefab5.IsIllegal = false
  itemprefab5.HasQuality = false
  itemprefab5.ThrowingOutForbidden = false
  itemprefab5.IsStackable = false
  itemprefab5.Category = ItemCategory.Clothing
  itemprefab5.CanChangeColor = false
  itemprefab5.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab5.Partners = {}
  itemprefab5.ScratchType = ScratchTextureType.Universal
  itemprefab5.SusModifiers = { SusModifier.CreateInstance(SusArea.LegL, 0.5) }

  local itemprefab5_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia lingerie esquerda/tex 1 - missionary.json"
  )

  itemprefab5.AddTexture(itemprefab5_missionary_texture0)

  local itemprefab5_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia lingerie esquerda/tex 2 - doggy.json"
  )

  itemprefab5.AddTexture(itemprefab5_doggy_texture1)

  local itemprefab5_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia lingerie esquerda/tex 3 - interaction.json"
  )

  itemprefab5.AddTexture(itemprefab5_interaction_texture2)

  local itemprefab5_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia lingerie esquerda/tex 4 - cowgirl.json"
  )

  itemprefab5.AddTexture(itemprefab5_cowgirl_texture3)

  local itemgameid5 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab5)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid5)

  local itemprefab6 = ModUtilities.CreateItemPrefab()
  itemprefab6.Name = "Meia lingerie direita"
  itemprefab6.Description = "Meia direita sexy!"
  itemprefab6.Price = 400
  itemprefab6.SlotData = SlotEquipData.CreateInstance("StockingR")
  itemprefab6.IsIllegal = false
  itemprefab6.HasQuality = false
  itemprefab6.ThrowingOutForbidden = false
  itemprefab6.IsStackable = false
  itemprefab6.Category = ItemCategory.Clothing
  itemprefab6.CanChangeColor = false
  itemprefab6.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab6.Partners = {}
  itemprefab6.ScratchType = ScratchTextureType.Universal
  itemprefab6.SusModifiers = { SusModifier.CreateInstance(SusArea.LegR, 0.5) }

  local itemprefab6_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia lingerie direita/tex 1 - missionary.json"
  )

  itemprefab6.AddTexture(itemprefab6_missionary_texture0)

  local itemprefab6_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia lingerie direita/tex 2 - doggy.json"
  )

  itemprefab6.AddTexture(itemprefab6_doggy_texture1)

  local itemprefab6_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia lingerie direita/tex 3 - interaction.json"
  )

  itemprefab6.AddTexture(itemprefab6_interaction_texture2)

  local itemprefab6_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia lingerie direita/tex 4 - cowgirl.json"
  )

  itemprefab6.AddTexture(itemprefab6_cowgirl_texture3)

  local itemgameid6 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab6)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid6)

  local itemprefab7 = ModUtilities.CreateItemPrefab()
  itemprefab7.Name = "Meia longa esquerda"
  itemprefab7.Description =
    "Meias muito longas. Boa para cobrir as pernas descombinadas do robô."
  itemprefab7.Price = 600
  itemprefab7.SlotData = SlotEquipData.CreateInstance("StockingL")
  itemprefab7.IsIllegal = false
  itemprefab7.HasQuality = false
  itemprefab7.ThrowingOutForbidden = false
  itemprefab7.IsStackable = false
  itemprefab7.Category = ItemCategory.Clothing
  itemprefab7.CanChangeColor = false
  itemprefab7.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab7.Partners = {}
  itemprefab7.ScratchType = ScratchTextureType.Universal
  itemprefab7.SusModifiers = { SusModifier.CreateInstance(SusArea.LegL, 1) }

  local itemprefab7_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia longa esquerda/tex 1 - missionary.json"
  )

  itemprefab7.AddTexture(itemprefab7_missionary_texture0)

  local itemprefab7_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia longa esquerda/tex 2 - doggy.json"
  )

  itemprefab7.AddTexture(itemprefab7_doggy_texture1)

  local itemprefab7_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia longa esquerda/tex 3 - interaction.json"
  )

  itemprefab7.AddTexture(itemprefab7_interaction_texture2)

  local itemprefab7_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia longa esquerda/tex 4 - cowgirl.json"
  )

  itemprefab7.AddTexture(itemprefab7_cowgirl_texture3)

  local itemgameid7 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab7)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid7)

  local itemprefab8 = ModUtilities.CreateItemPrefab()
  itemprefab8.Name = "Meia longa direita"
  itemprefab8.Description =
    "Meias muito longas. Boa para cobrir as pernas descombinadas do robô."
  itemprefab8.Price = 600
  itemprefab8.SlotData = SlotEquipData.CreateInstance("StockingR")
  itemprefab8.IsIllegal = false
  itemprefab8.HasQuality = false
  itemprefab8.ThrowingOutForbidden = false
  itemprefab8.IsStackable = false
  itemprefab8.Category = ItemCategory.Clothing
  itemprefab8.CanChangeColor = false
  itemprefab8.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab8.Partners = {}
  itemprefab8.ScratchType = ScratchTextureType.Universal
  itemprefab8.SusModifiers = { SusModifier.CreateInstance(SusArea.LegR, 1) }

  local itemprefab8_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia longa direita/tex 1 - missionary.json"
  )

  itemprefab8.AddTexture(itemprefab8_missionary_texture0)

  local itemprefab8_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia longa direita/tex 2 - doggy.json"
  )

  itemprefab8.AddTexture(itemprefab8_doggy_texture1)

  local itemprefab8_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia longa direita/tex 3 - interaction.json"
  )

  itemprefab8.AddTexture(itemprefab8_interaction_texture2)

  local itemprefab8_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia longa direita/tex 4 - cowgirl.json"
  )

  itemprefab8.AddTexture(itemprefab8_cowgirl_texture3)

  local itemgameid8 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab8)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid8)

  local itemprefab9 = ModUtilities.CreateItemPrefab()
  itemprefab9.Name = "Calcinha listrada"
  itemprefab9.Description =
    "Calcinha listrada inspirada na fogaloid Kitsune Piku. Agora em cores únicas!"
  itemprefab9.Price = 1000
  itemprefab9.SlotData = SlotEquipData.CreateInstance("Panties")
  itemprefab9.IsIllegal = false
  itemprefab9.HasQuality = false
  itemprefab9.ThrowingOutForbidden = false
  itemprefab9.IsStackable = false
  itemprefab9.Category = ItemCategory.Clothing
  itemprefab9.CanChangeColor = false
  itemprefab9.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Cores das listras",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab9.Partners = {}
  itemprefab9.ScratchType = ScratchTextureType.Universal
  itemprefab9.SusModifiers = { SusModifier.CreateInstance(SusArea.Pussy, 1) }

  local itemprefab9_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha listrada/tex 1 - missionary.json"
  )

  itemprefab9.AddTexture(itemprefab9_missionary_texture0)

  local itemprefab9_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha listrada/tex 2 - doggy.json"
  )

  itemprefab9.AddTexture(itemprefab9_doggy_texture1)

  local itemprefab9_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha listrada/tex 3 - interaction.json"
  )

  itemprefab9.AddTexture(itemprefab9_interaction_texture2)

  local itemprefab9_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha listrada/tex 4 - cowgirl.json"
  )

  itemprefab9.AddTexture(itemprefab9_cowgirl_texture3)

  local itemprefab9_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha listrada/tex 5 - cowgirl.json"
  )

  itemprefab9.AddTexture(itemprefab9_cowgirl_texture4)

  local itemgameid9 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab9)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid9)

  local itemprefab10 = ModUtilities.CreateItemPrefab()
  itemprefab10.Name = "Sutiã lingerie"
  itemprefab10.Description = "Sutiã sexy!"
  itemprefab10.Price = 600
  itemprefab10.SlotData = SlotEquipData.CreateInstance("Bra")
  itemprefab10.IsIllegal = false
  itemprefab10.HasQuality = false
  itemprefab10.ThrowingOutForbidden = false
  itemprefab10.IsStackable = false
  itemprefab10.Category = ItemCategory.Clothing
  itemprefab10.CanChangeColor = false
  itemprefab10.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab10.Partners = {}
  itemprefab10.ScratchType = ScratchTextureType.Universal
  itemprefab10.SusModifiers = { SusModifier.CreateInstance(SusArea.Boobs, 1) }

  local itemprefab10_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã lingerie/tex 1 - missionary.json"
  )

  itemprefab10.AddTexture(itemprefab10_missionary_texture0)

  local itemprefab10_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã lingerie/tex 2 - doggy.json"
  )

  itemprefab10.AddTexture(itemprefab10_doggy_texture1)

  local itemprefab10_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã lingerie/tex 3 - interaction.json"
  )

  itemprefab10.AddTexture(itemprefab10_interaction_texture2)

  local itemprefab10_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã lingerie/tex 4 - blowjob.json"
  )

  itemprefab10.AddTexture(itemprefab10_blowjob_texture3)

  local itemprefab10_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã lingerie/tex 5 - cowgirl.json"
  )

  itemprefab10.AddTexture(itemprefab10_cowgirl_texture4)

  local itemgameid10 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab10)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid10)

  local itemprefab11 = ModUtilities.CreateItemPrefab()
  itemprefab11.Name = "Saia plissada"
  itemprefab11.Description = "Não são apenas para estudantes!"
  itemprefab11.Price = 700
  itemprefab11.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "LowerBody"
    sd.ControllerElementOverride = { "LowerBody_Skirt" }
    return sd
  end)()
  itemprefab11.IsIllegal = false
  itemprefab11.HasQuality = false
  itemprefab11.ThrowingOutForbidden = false
  itemprefab11.IsStackable = false
  itemprefab11.Category = ItemCategory.Clothing
  itemprefab11.CanChangeColor = false
  itemprefab11.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab11.Partners = {}
  itemprefab11.ScratchType = ScratchTextureType.Universal
  itemprefab11.SusModifiers =
    { SusModifier.CreateInstance(SusArea.LowerBody, 0.7) }

  local itemprefab11_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Saia plissada/tex 1 - doggy.json"
  )

  itemprefab11.AddTexture(itemprefab11_doggy_texture0)

  local itemprefab11_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Saia plissada/tex 2 - missionary.json"
  )

  itemprefab11.AddTexture(itemprefab11_missionary_texture1)

  local itemprefab11_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Saia plissada/tex 3 - interaction.json"
  )

  itemprefab11.AddTexture(itemprefab11_interaction_texture2)

  local itemprefab11_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Saia plissada/tex 4 - cowgirl.json"
  )

  itemprefab11.AddTexture(itemprefab11_cowgirl_texture3)

  local itemgameid11 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab11)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid11)

  local itemprefab12 = ModUtilities.CreateItemPrefab()
  itemprefab12.Name = "Minissaia"
  itemprefab12.Description = "Versão reduzida da saia normal."
  itemprefab12.Price = 5000
  itemprefab12.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "LowerBody"
    sd.ControllerElementOverride = { "LowerBody_Skirt" }
    return sd
  end)()
  itemprefab12.IsIllegal = false
  itemprefab12.HasQuality = false
  itemprefab12.ThrowingOutForbidden = false
  itemprefab12.IsStackable = false
  itemprefab12.Category = ItemCategory.Clothing
  itemprefab12.CanChangeColor = false
  itemprefab12.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab12.Partners = {}
  itemprefab12.ScratchType = ScratchTextureType.Universal
  itemprefab12.SusModifiers =
    { SusModifier.CreateInstance(SusArea.LowerBody, 0.5) }

  local itemprefab12_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Minissaia/tex 1 - missionary.json"
  )

  itemprefab12.AddTexture(itemprefab12_missionary_texture0)

  local itemprefab12_cowgirl_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Minissaia/tex 2 - cowgirl.json"
  )

  itemprefab12.AddTexture(itemprefab12_cowgirl_texture1)

  local itemprefab12_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Minissaia/tex 3 - interaction.json"
  )

  itemprefab12.AddTexture(itemprefab12_interaction_texture2)

  local itemprefab12_doggy_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Minissaia/tex 4 - doggy.json"
  )

  itemprefab12.AddTexture(itemprefab12_doggy_texture3)

  local itemprefab12_doggy_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Minissaia/tex 5 - doggy.json"
  )

  itemprefab12.AddTexture(itemprefab12_doggy_texture4)

  local itemgameid12 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab12)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid12)

  local itemprefab13 = ModUtilities.CreateItemPrefab()
  itemprefab13.Name = "Laço fofo"
  itemprefab13.Description = "Um laço fofo!"
  itemprefab13.Price = 50
  itemprefab13.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "HairAccessoryL"
    sd.ControllerElementOverride = { "HairAccessoryL_CuteBow" }
    return sd
  end)()
  itemprefab13.IsIllegal = false
  itemprefab13.HasQuality = false
  itemprefab13.ThrowingOutForbidden = false
  itemprefab13.IsStackable = false
  itemprefab13.Category = ItemCategory.Clothing
  itemprefab13.CanChangeColor = false
  itemprefab13.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab13.Partners = {}
  itemprefab13.ScratchType = ScratchTextureType.Universal
  itemprefab13.SusModifiers = {}

  local itemprefab13_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Laço fofo/tex 1 - missionary.json"
  )

  itemprefab13.AddTexture(itemprefab13_missionary_texture0)

  local itemprefab13_interaction_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Laço fofo/tex 2 - interaction.json"
  )

  itemprefab13.AddTexture(itemprefab13_interaction_texture1)

  local itemprefab13_blowjob_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Laço fofo/tex 3 - blowjob.json"
  )

  itemprefab13.AddTexture(itemprefab13_blowjob_texture2)

  local itemprefab13_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Laço fofo/tex 4 - cowgirl.json"
  )

  itemprefab13.AddTexture(itemprefab13_cowgirl_texture3)

  local itemgameid13 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab13)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid13)

  local itemprefab14 = ModUtilities.CreateItemPrefab()
  itemprefab14.Name = "Faixa de cabeça"
  itemprefab14.Description = "Faixa de cabeça simples. Parece muito fofo!"
  itemprefab14.Price = 600
  itemprefab14.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "HairAccessoryL"
    sd.ControllerElementOverride = { "HairAccessoryL_Headband" }
    return sd
  end)()
  itemprefab14.IsIllegal = false
  itemprefab14.HasQuality = false
  itemprefab14.ThrowingOutForbidden = false
  itemprefab14.IsStackable = false
  itemprefab14.Category = ItemCategory.Clothing
  itemprefab14.CanChangeColor = false
  itemprefab14.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab14.Partners = {}
  itemprefab14.ScratchType = ScratchTextureType.Universal
  itemprefab14.SusModifiers = {}

  local itemprefab14_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Faixa de cabeça/tex 1 - doggy.json"
  )

  itemprefab14.AddTexture(itemprefab14_doggy_texture0)

  local itemprefab14_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Faixa de cabeça/tex 2 - missionary.json"
  )

  itemprefab14.AddTexture(itemprefab14_missionary_texture1)

  local itemprefab14_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Faixa de cabeça/tex 3 - interaction.json"
  )

  itemprefab14.AddTexture(itemprefab14_interaction_texture2)

  local itemprefab14_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Faixa de cabeça/tex 4 - blowjob.json"
  )

  itemprefab14.AddTexture(itemprefab14_blowjob_texture3)

  local itemprefab14_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Faixa de cabeça/tex 5 - cowgirl.json"
  )

  itemprefab14.AddTexture(itemprefab14_cowgirl_texture4)

  local itemgameid14 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab14)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid14)

  local itemprefab15 = ModUtilities.CreateItemPrefab()
  itemprefab15.Name = "Gargantilha de coração"
  itemprefab15.Description =
    "Gargantilha com o formato de um coração no meio."
  itemprefab15.Price = 300
  itemprefab15.SlotData = SlotEquipData.CreateInstance("NeckAccessory")
  itemprefab15.IsIllegal = false
  itemprefab15.HasQuality = false
  itemprefab15.ThrowingOutForbidden = false
  itemprefab15.IsStackable = false
  itemprefab15.Category = ItemCategory.Clothing
  itemprefab15.CanChangeColor = false
  itemprefab15.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab15.Partners = {}
  itemprefab15.ScratchType = ScratchTextureType.Universal
  itemprefab15.SusModifiers = {}

  local itemprefab15_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Gargantilha de coração/tex 1 - missionary.json"
  )

  itemprefab15.AddTexture(itemprefab15_missionary_texture0)

  local itemprefab15_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Gargantilha de coração/tex 2 - doggy.json"
  )

  itemprefab15.AddTexture(itemprefab15_doggy_texture1)

  local itemprefab15_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Gargantilha de coração/tex 3 - interaction.json"
  )

  itemprefab15.AddTexture(itemprefab15_interaction_texture2)

  local itemprefab15_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Gargantilha de coração/tex 4 - blowjob.json"
  )

  itemprefab15.AddTexture(itemprefab15_blowjob_texture3)

  local itemprefab15_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Gargantilha de coração/tex 5 - cowgirl.json"
  )

  itemprefab15.AddTexture(itemprefab15_cowgirl_texture4)

  local itemgameid15 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab15)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid15)

  local itemprefab16 = ModUtilities.CreateItemPrefab()
  itemprefab16.Name = "Óculos de coração"
  itemprefab16.Description =
    "Óculos falsos com dois corações na armação. Não é útil, mas é estiloso!"
  itemprefab16.Price = 200
  itemprefab16.SlotData = SlotEquipData.CreateInstance("Glasses")
  itemprefab16.IsIllegal = false
  itemprefab16.HasQuality = false
  itemprefab16.ThrowingOutForbidden = false
  itemprefab16.IsStackable = false
  itemprefab16.Category = ItemCategory.Clothing
  itemprefab16.CanChangeColor = false
  itemprefab16.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab16.Partners = {}
  itemprefab16.ScratchType = ScratchTextureType.Universal
  itemprefab16.SusModifiers = {}

  local itemprefab16_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Óculos de coração/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab16.AddTexture(
    itemprefab16_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemprefab16_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Óculos de coração/tex 2 - doggy.json"
  )

  itemprefab16.AddTexture(itemprefab16_doggy_texture1)

  local itemgameid16 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab16)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid16)

  local itemprefab17 = ModUtilities.CreateItemPrefab()
  itemprefab17.Name = "Piercing na língua"
  itemprefab17.Description =
    "Um piercing circular. Graças ao uso de ímãs, não há necessidade de furar a língua do bot."
  itemprefab17.Price = 690
  itemprefab17.SlotData = SlotEquipData.CreateInstance("TongueAccessory")
  itemprefab17.IsIllegal = false
  itemprefab17.HasQuality = false
  itemprefab17.ThrowingOutForbidden = false
  itemprefab17.IsStackable = false
  itemprefab17.Category = ItemCategory.Clothing
  itemprefab17.SubCategory = ItemSubCategory.Clothing_Piercing
  itemprefab17.CanChangeColor = false
  itemprefab17.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab17.Partners = {}
  itemprefab17.ScratchType = ScratchTextureType.Universal
  itemprefab17.SusModifiers = {}

  local itemprefab17_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Piercing na língua/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab17.AddTexture(
    itemprefab17_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemprefab17_shower_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Piercing na língua/tex 2 - shower.json"
  )

  itemprefab17.AddTexture(itemprefab17_shower_texture1)

  local itemprefab17_doggy_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Piercing na língua/tex 3 - doggy.json"
  )

  itemprefab17.AddTexture(itemprefab17_doggy_texture2)

  local itemgameid17 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab17)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid17)

  local itemprefab18 = ModUtilities.CreateItemPrefab()
  itemprefab18.Name = "Grampos de cabelo brilhantes"
  itemprefab18.Description = "Um par de grampos de cabelo simples."
  itemprefab18.Price = 666
  itemprefab18.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "HairAccessoryL"
    sd.ControllerElementOverride = { "HairAccessoryL_CuteBow" }
    return sd
  end)()
  itemprefab18.IsIllegal = false
  itemprefab18.HasQuality = false
  itemprefab18.ThrowingOutForbidden = false
  itemprefab18.IsStackable = false
  itemprefab18.Category = ItemCategory.Clothing
  itemprefab18.CanChangeColor = false
  itemprefab18.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab18.Partners = {}
  itemprefab18.ScratchType = ScratchTextureType.Universal
  itemprefab18.SusModifiers = {}

  local itemprefab18_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Grampos de cabelo brilhantes/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab18.AddTexture(
    itemprefab18_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemgameid18 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab18)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid18)

  local itemprefab19 = ModUtilities.CreateItemPrefab()
  itemprefab19.Name = "Conjunto de manicure"
  itemprefab19.Description =
    "Conjunto completo de unhas e esmaltes. Você pode colorir as mãos direita e esquerda separadamente."
  itemprefab19.Price = 15000
  itemprefab19.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "Manicure"
    sd.SetRequiredSlotsString({ "ArmL", "ArmR" })
    return sd
  end)()
  itemprefab19.IsIllegal = false
  itemprefab19.HasQuality = false
  itemprefab19.ThrowingOutForbidden = false
  itemprefab19.IsStackable = false
  itemprefab19.Category = ItemCategory.Clothing
  itemprefab19.SubCategory = ItemSubCategory.Clothing_MakeUp
  itemprefab19.CanChangeColor = true
  itemprefab19.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor das unhas da mão direita",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Cor das unhas da mão esquerda",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab19.Partners = {}
  itemprefab19.ScratchType = ScratchTextureType.Universal
  itemprefab19.SusModifiers = {}

  local itemprefab19_interaction_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Conjunto de manicure/tex 1 - interaction.json"
  )

  itemprefab19.AddTexture(itemprefab19_interaction_texture0)

  local itemprefab19_interaction_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Conjunto de manicure/tex 2 - interaction.json"
  )

  itemprefab19.AddTexture(itemprefab19_interaction_texture1)

  local itemprefab19_doggy_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Conjunto de manicure/tex 3 - doggy.json"
  )

  itemprefab19.AddTexture(itemprefab19_doggy_texture2)

  local itemprefab19_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Conjunto de manicure/tex 4 - blowjob.json"
  )

  itemprefab19.AddTexture(itemprefab19_blowjob_texture3)

  local itemprefab19_blowjob_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Conjunto de manicure/tex 5 - blowjob.json"
  )

  itemprefab19.AddTexture(itemprefab19_blowjob_texture4)

  local itemprefab19_missionary_texture5 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Conjunto de manicure/tex 6 - missionary.json"
  )

  itemprefab19.AddTexture(itemprefab19_missionary_texture5)

  local itemprefab19_missionary_texture6 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Conjunto de manicure/tex 7 - missionary.json"
  )

  itemprefab19.AddTexture(itemprefab19_missionary_texture6)

  local itemprefab19_shower_texture7 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Conjunto de manicure/tex 8 - shower.json"
  )

  itemprefab19.AddTexture(itemprefab19_shower_texture7)

  local itemgameid19 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab19)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid19)

  local itemprefab20 = ModUtilities.CreateItemPrefab()
  itemprefab20.Name = "Colar com fivela de couro"
  itemprefab20.Description =
    "Um colar que lembra um cinto. Geralmente para animais, mas alguns humanos também gostam de usá-lo."
  itemprefab20.Price = 3000
  itemprefab20.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "NeckAccessory"
    sd.ControllerElementOverride = { "NeckAccessory_BellChoker" }
    return sd
  end)()
  itemprefab20.IsIllegal = false
  itemprefab20.HasQuality = false
  itemprefab20.ThrowingOutForbidden = false
  itemprefab20.IsStackable = false
  itemprefab20.Category = ItemCategory.Clothing
  itemprefab20.CanChangeColor = false
  itemprefab20.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor do cinto",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Cor da fivela",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab20.Partners = {}
  itemprefab20.ScratchType = ScratchTextureType.Universal
  itemprefab20.SusModifiers = {}

  local itemprefab20_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Colar com fivela de couro/tex 1 - doggy.json"
  )

  itemprefab20.AddTexture(itemprefab20_doggy_texture0)

  local itemprefab20_blowjob_cowgirl_interaction_missionary_texture1 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Colar com fivela de couro/tex 2 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab20.AddTexture(
    itemprefab20_blowjob_cowgirl_interaction_missionary_texture1
  )

  local itemprefab20_missionary_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Colar com fivela de couro/tex 3 - missionary.json"
  )

  itemprefab20.AddTexture(itemprefab20_missionary_texture2)

  local itemprefab20_interaction_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Colar com fivela de couro/tex 4 - interaction.json"
  )

  itemprefab20.AddTexture(itemprefab20_interaction_texture3)

  local itemprefab20_blowjob_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Colar com fivela de couro/tex 5 - blowjob.json"
  )

  itemprefab20.AddTexture(itemprefab20_blowjob_texture4)

  local itemprefab20_cowgirl_texture5 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Colar com fivela de couro/tex 6 - cowgirl.json"
  )

  itemprefab20.AddTexture(itemprefab20_cowgirl_texture5)

  local itemgameid20 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab20)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid20)

  local itemprefab21 = ModUtilities.CreateItemPrefab()
  itemprefab21.Name = "Sombra"
  itemprefab21.Description =
    "Um cosmético colorido aplicado nas pálpebras ou na pele ao redor dos olhos para acentuá-los."
  itemprefab21.Price = 1200
  itemprefab21.SlotData = SlotEquipData.CreateInstance("EyeMakeup")
  itemprefab21.IsIllegal = false
  itemprefab21.HasQuality = false
  itemprefab21.ThrowingOutForbidden = false
  itemprefab21.IsStackable = false
  itemprefab21.Category = ItemCategory.Clothing
  itemprefab21.SubCategory = ItemSubCategory.Clothing_MakeUp
  itemprefab21.CanChangeColor = true
  itemprefab21.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab21.Partners = {}
  itemprefab21.ScratchType = ScratchTextureType.Universal
  itemprefab21.SusModifiers = {}

  local itemprefab21_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Sombra/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab21.AddTexture(
    itemprefab21_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemprefab21_doggy_texture1 =
    ModUtilities.GetPackedTexture(CurrentModGuid, "/Sombra/tex 2 - doggy.json")

  itemprefab21.AddTexture(itemprefab21_doggy_texture1)

  local itemgameid21 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab21)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid21)

  local itemprefab22 = ModUtilities.CreateItemPrefab()
  itemprefab22.Name = "Perfuração no mamilo esquerdo"
  itemprefab22.Description =
    "Um piercing circular. Graças ao uso de ímãs fortes, não há necessidade de furar a pele do bot."
  itemprefab22.Price = 7500
  itemprefab22.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "NippleRight"
    sd.ControllerElementOverride = { "NippleRight_Piercing" }
    return sd
  end)()
  itemprefab22.IsIllegal = false
  itemprefab22.HasQuality = false
  itemprefab22.ThrowingOutForbidden = false
  itemprefab22.IsStackable = false
  itemprefab22.Category = ItemCategory.Clothing
  itemprefab22.SubCategory = ItemSubCategory.Clothing_Piercing
  itemprefab22.CanChangeColor = false
  itemprefab22.ColorSlots = {}
  itemprefab22.Partners = {}
  itemprefab22.ScratchType = ScratchTextureType.Universal
  itemprefab22.SusModifiers = {}

  local itemprefab22_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo esquerdo/tex 1 - doggy.json"
  )

  itemprefab22.AddTexture(itemprefab22_doggy_texture0)

  local itemprefab22_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo esquerdo/tex 2 - missionary.json"
  )

  itemprefab22.AddTexture(itemprefab22_missionary_texture1)

  local itemprefab22_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo esquerdo/tex 3 - interaction.json"
  )

  itemprefab22.AddTexture(itemprefab22_interaction_texture2)

  local itemprefab22_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo esquerdo/tex 4 - cowgirl.json"
  )

  itemprefab22.AddTexture(itemprefab22_cowgirl_texture3)

  local itemgameid22 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab22)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid22)

  local itemprefab23 = ModUtilities.CreateItemPrefab()
  itemprefab23.Name = "Perfuração no mamilo direito"
  itemprefab23.Description =
    "Um piercing circular. Graças ao uso de ímãs fortes, não há necessidade de perfurar a pele do bot."
  itemprefab23.Price = 7500
  itemprefab23.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "NippleLeft"
    sd.ControllerElementOverride = { "NippleLeft_Piercing" }
    return sd
  end)()
  itemprefab23.IsIllegal = false
  itemprefab23.HasQuality = false
  itemprefab23.ThrowingOutForbidden = false
  itemprefab23.IsStackable = false
  itemprefab23.Category = ItemCategory.Clothing
  itemprefab23.SubCategory = ItemSubCategory.Clothing_Piercing
  itemprefab23.CanChangeColor = false
  itemprefab23.ColorSlots = {}
  itemprefab23.Partners = {}
  itemprefab23.ScratchType = ScratchTextureType.Universal
  itemprefab23.SusModifiers = {}

  local itemprefab23_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo direito/tex 1 - missionary.json"
  )

  itemprefab23.AddTexture(itemprefab23_missionary_texture0)

  local itemprefab23_interaction_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo direito/tex 2 - interaction.json"
  )

  itemprefab23.AddTexture(itemprefab23_interaction_texture1)

  local itemprefab23_cowgirl_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo direito/tex 3 - cowgirl.json"
  )

  itemprefab23.AddTexture(itemprefab23_cowgirl_texture2)

  local itemprefab23_shower_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo direito/tex 4 - shower.json"
  )

  itemprefab23.AddTexture(itemprefab23_shower_texture3)

  local itemgameid23 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab23)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid23)

  local itemprefab24 = ModUtilities.CreateItemPrefab()
  itemprefab24.Name = "Piercing no umbigo"
  itemprefab24.Description =
    "Um piercing circular. Graças ao uso de ímãs, não há necessidade de furar a pele do bot."
  itemprefab24.Price = 7000
  itemprefab24.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "Navel"
    sd.ControllerElementOverride = { "Navel_Piercing" }
    return sd
  end)()
  itemprefab24.IsIllegal = false
  itemprefab24.HasQuality = false
  itemprefab24.ThrowingOutForbidden = false
  itemprefab24.IsStackable = false
  itemprefab24.Category = ItemCategory.Clothing
  itemprefab24.SubCategory = ItemSubCategory.Clothing_Piercing
  itemprefab24.CanChangeColor = false
  itemprefab24.ColorSlots = {}
  itemprefab24.Partners = {}
  itemprefab24.ScratchType = ScratchTextureType.Universal
  itemprefab24.SusModifiers = {}

  local itemprefab24_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Piercing no umbigo/tex 1 - missionary.json"
  )

  itemprefab24.AddTexture(itemprefab24_missionary_texture0)

  local itemprefab24_interaction_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Piercing no umbigo/tex 2 - interaction.json"
  )

  itemprefab24.AddTexture(itemprefab24_interaction_texture1)

  local itemprefab24_cowgirl_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Piercing no umbigo/tex 3 - cowgirl.json"
  )

  itemprefab24.AddTexture(itemprefab24_cowgirl_texture2)

  local itemgameid24 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab24)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid24)

  local itemprefab25 = ModUtilities.CreateItemPrefab()
  itemprefab25.Name = "Maquiagem gótica para olhos"
  itemprefab25.Description =
    "Maquiagem de tema gótico para os olhos. Tem em várias cores. "
  itemprefab25.Price = 1200
  itemprefab25.SlotData = SlotEquipData.CreateInstance("EyeMakeup")
  itemprefab25.IsIllegal = false
  itemprefab25.HasQuality = false
  itemprefab25.ThrowingOutForbidden = false
  itemprefab25.IsStackable = false
  itemprefab25.Category = ItemCategory.Clothing
  itemprefab25.SubCategory = ItemSubCategory.Clothing_MakeUp
  itemprefab25.CanChangeColor = true
  itemprefab25.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab25.Partners = {}
  itemprefab25.ScratchType = ScratchTextureType.Universal
  itemprefab25.SusModifiers = {}

  local itemprefab25_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Maquiagem gótica para olhos/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab25.AddTexture(
    itemprefab25_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemprefab25_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Maquiagem gótica para olhos/tex 2 - doggy.json"
  )

  itemprefab25.AddTexture(itemprefab25_doggy_texture1)

  local itemgameid25 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab25)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid25)

  local itemprefab26 = ModUtilities.CreateItemPrefab()
  itemprefab26.Name = "Delineador"
  itemprefab26.Description =
    "Delineador, uma linha abaixo do olho.  Vem com uma variedade de cores."
  itemprefab26.Price = 1400
  itemprefab26.SlotData = SlotEquipData.CreateInstance("EyeMakeup")
  itemprefab26.IsIllegal = false
  itemprefab26.HasQuality = false
  itemprefab26.ThrowingOutForbidden = false
  itemprefab26.IsStackable = false
  itemprefab26.Category = ItemCategory.Clothing
  itemprefab26.SubCategory = ItemSubCategory.Clothing_MakeUp
  itemprefab26.CanChangeColor = true
  itemprefab26.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab26.Partners = {}
  itemprefab26.ScratchType = ScratchTextureType.Universal
  itemprefab26.SusModifiers = {}

  local itemprefab26_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Delineador/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab26.AddTexture(
    itemprefab26_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemprefab26_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Delineador/tex 2 - doggy.json"
  )

  itemprefab26.AddTexture(itemprefab26_doggy_texture1)

  local itemgameid26 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab26)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid26)

  local itemprefab27 = ModUtilities.CreateItemPrefab()
  itemprefab27.Name = "Adesivo de coração"
  itemprefab27.Description =
    "Adesivo de coração que você pode colocar sob o olho direito. Vem com uma variedade de cores."
  itemprefab27.Price = 700
  itemprefab27.SlotData = SlotEquipData.CreateInstance("EyeMakeup")
  itemprefab27.IsIllegal = false
  itemprefab27.HasQuality = false
  itemprefab27.ThrowingOutForbidden = false
  itemprefab27.IsStackable = false
  itemprefab27.Category = ItemCategory.Clothing
  itemprefab27.SubCategory = ItemSubCategory.Clothing_MakeUp
  itemprefab27.CanChangeColor = true
  itemprefab27.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab27.Partners = {}
  itemprefab27.ScratchType = ScratchTextureType.Universal
  itemprefab27.SusModifiers = {}

  local itemprefab27_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Adesivo de coração/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab27.AddTexture(
    itemprefab27_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemprefab27_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Adesivo de coração/tex 2 - doggy.json"
  )

  itemprefab27.AddTexture(itemprefab27_doggy_texture1)

  local itemgameid27 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab27)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid27)

  local itemprefab28 = ModUtilities.CreateItemPrefab()
  itemprefab28.Name = "Cílios naturais"
  itemprefab28.Description =
    "Cílios na parte inferior do olho. Vem com uma variedade de cores."
  itemprefab28.Price = 1400
  itemprefab28.SlotData = SlotEquipData.CreateInstance("EyeMakeup")
  itemprefab28.IsIllegal = false
  itemprefab28.HasQuality = false
  itemprefab28.ThrowingOutForbidden = false
  itemprefab28.IsStackable = false
  itemprefab28.Category = ItemCategory.Clothing
  itemprefab28.SubCategory = ItemSubCategory.Clothing_MakeUp
  itemprefab28.CanChangeColor = true
  itemprefab28.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab28.Partners = {}
  itemprefab28.ScratchType = ScratchTextureType.Universal
  itemprefab28.SusModifiers = {}

  local itemprefab28_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Cílios naturais/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab28.AddTexture(
    itemprefab28_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemprefab28_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cílios naturais/tex 2 - doggy.json"
  )

  itemprefab28.AddTexture(itemprefab28_doggy_texture1)

  local itemgameid28 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab28)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid28)

  local itemprefab29 = ModUtilities.CreateItemPrefab()
  itemprefab29.Name = "Pequeno chapéu de feiticeiro"
  itemprefab29.Description = "Um pequeno chapéu para uma maga!"
  itemprefab29.Price = 1000
  itemprefab29.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "Head"
    sd.ControllerElementOverride = { "Head_WizardHat" }
    return sd
  end)()
  itemprefab29.IsIllegal = false
  itemprefab29.HasQuality = false
  itemprefab29.ThrowingOutForbidden = false
  itemprefab29.IsStackable = false
  itemprefab29.Category = ItemCategory.Clothing
  itemprefab29.CanChangeColor = false
  itemprefab29.ColorSlots = {}
  itemprefab29.Partners = {}
  itemprefab29.ScratchType = ScratchTextureType.Universal
  itemprefab29.SusModifiers = {}

  local itemprefab29_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pequeno chapéu de feiticeiro/tex 1 - doggy.json"
  )

  itemprefab29.AddTexture(itemprefab29_doggy_texture0)

  local itemprefab29_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pequeno chapéu de feiticeiro/tex 2 - missionary.json"
  )

  itemprefab29.AddTexture(itemprefab29_missionary_texture1)

  local itemprefab29_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pequeno chapéu de feiticeiro/tex 3 - interaction.json"
  )

  itemprefab29.AddTexture(itemprefab29_interaction_texture2)

  local itemprefab29_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pequeno chapéu de feiticeiro/tex 4 - blowjob.json"
  )

  itemprefab29.AddTexture(itemprefab29_blowjob_texture3)

  local itemprefab29_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pequeno chapéu de feiticeiro/tex 5 - cowgirl.json"
  )

  itemprefab29.AddTexture(itemprefab29_cowgirl_texture4)

  local itemgameid29 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab29)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid29)

  local itemprefab30 = ModUtilities.CreateItemPrefab()
  itemprefab30.Name = "Grampo de abóbora"
  itemprefab30.Description =
    "Grampo de cabelo com tema de Halloween em forma de abóbora."
  itemprefab30.Price = 600
  itemprefab30.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "HairAccessoryL"
    sd.ControllerElementOverride = { "HairAccessoryL_CuteBow" }
    return sd
  end)()
  itemprefab30.IsIllegal = false
  itemprefab30.HasQuality = false
  itemprefab30.ThrowingOutForbidden = false
  itemprefab30.IsStackable = false
  itemprefab30.Category = ItemCategory.Clothing
  itemprefab30.CanChangeColor = false
  itemprefab30.ColorSlots = {}
  itemprefab30.Partners = {}
  itemprefab30.ScratchType = ScratchTextureType.Universal
  itemprefab30.SusModifiers = {}

  local itemprefab30_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Grampo de abóbora/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab30.AddTexture(
    itemprefab30_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemgameid30 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab30)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid30)

  local itemprefab31 = ModUtilities.CreateItemPrefab()
  itemprefab31.Name = "Piercing de anel no septo"
  itemprefab31.Description =
    "Em formato de anel. Piercing que passa pela parte inferior do nariz entre as narinas. Graças aos ímãs, não é preciso qualquer furo!"
  itemprefab31.Price = 250
  itemprefab31.SlotData = SlotEquipData.CreateInstance("Septum")
  itemprefab31.IsIllegal = false
  itemprefab31.HasQuality = false
  itemprefab31.ThrowingOutForbidden = false
  itemprefab31.IsStackable = false
  itemprefab31.Category = ItemCategory.Clothing
  itemprefab31.SubCategory = ItemSubCategory.Clothing_Piercing
  itemprefab31.CanChangeColor = false
  itemprefab31.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab31.Partners = {}
  itemprefab31.ScratchType = ScratchTextureType.Universal
  itemprefab31.SusModifiers = {}

  local itemprefab31_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Piercing de anel no septo/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab31.AddTexture(
    itemprefab31_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemprefab31_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Piercing de anel no septo/tex 2 - doggy.json"
  )

  itemprefab31.AddTexture(itemprefab31_doggy_texture1)

  local itemgameid31 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab31)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid31)

  local itemprefab32 = ModUtilities.CreateItemPrefab()
  itemprefab32.Name = "Tênis esquerdo plano"
  itemprefab32.Description = "Tênis esquerdo simples."
  itemprefab32.Price = 500
  itemprefab32.SlotData = SlotEquipData.CreateInstance("ShoeL")
  itemprefab32.IsIllegal = false
  itemprefab32.HasQuality = false
  itemprefab32.ThrowingOutForbidden = false
  itemprefab32.IsStackable = false
  itemprefab32.Category = ItemCategory.Clothing
  itemprefab32.CanChangeColor = false
  itemprefab32.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab32.Partners = {}
  itemprefab32.ScratchType = ScratchTextureType.Universal
  itemprefab32.SusModifiers = {}

  local itemprefab32_interaction_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Tênis esquerdo plano/tex 1 - interaction.json"
  )

  itemprefab32.AddTexture(itemprefab32_interaction_texture0)

  local itemgameid32 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab32)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid32)

  local itemprefab33 = ModUtilities.CreateItemPrefab()
  itemprefab33.Name = "Tênis direito plano"
  itemprefab33.Description = "Tênis direito simples."
  itemprefab33.Price = 500
  itemprefab33.SlotData = SlotEquipData.CreateInstance("ShoeR")
  itemprefab33.IsIllegal = false
  itemprefab33.HasQuality = false
  itemprefab33.ThrowingOutForbidden = false
  itemprefab33.IsStackable = false
  itemprefab33.Category = ItemCategory.Clothing
  itemprefab33.CanChangeColor = false
  itemprefab33.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab33.Partners = {}
  itemprefab33.ScratchType = ScratchTextureType.Universal
  itemprefab33.SusModifiers = {}

  local itemprefab33_interaction_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Tênis direito plano/tex 1 - interaction.json"
  )

  itemprefab33.AddTexture(itemprefab33_interaction_texture0)

  local itemgameid33 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab33)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid33)

  local itemprefab34 = ModUtilities.CreateItemPrefab()
  itemprefab34.Name = "Calças largas"
  itemprefab34.Description = "INCLUI CHARME E ELEGÂNCIA"
  itemprefab34.Price = 4000
  itemprefab34.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "LowerBody"
    sd.ControllerElementOverride = { "LowerBody_Pants" }
    sd.SetRequiredSlotsString({ "LegL", "LegR" })
    return sd
  end)()
  itemprefab34.IsIllegal = false
  itemprefab34.HasQuality = false
  itemprefab34.ThrowingOutForbidden = false
  itemprefab34.IsStackable = false
  itemprefab34.Category = ItemCategory.Clothing
  itemprefab34.CanChangeColor = false
  itemprefab34.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Cor do cinto",
      ColorPaletteManager.GetColorPaletteByName("grayscalepalette")
    ),
  }
  itemprefab34.Partners = {}
  itemprefab34.ScratchType = ScratchTextureType.Universal
  itemprefab34.SusModifiers =
    { SusModifier.CreateInstance(SusArea.LowerBody, 0.9) }

  local itemprefab34_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calças largas/tex 1 - doggy.json"
  )

  itemprefab34.AddTexture(itemprefab34_doggy_texture0)

  local itemprefab34_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calças largas/tex 2 - missionary.json"
  )

  itemprefab34.AddTexture(itemprefab34_missionary_texture1)

  local itemprefab34_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calças largas/tex 3 - interaction.json"
  )

  itemprefab34.AddTexture(itemprefab34_interaction_texture2)

  local itemprefab34_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calças largas/tex 4 - cowgirl.json"
  )

  itemprefab34.AddTexture(itemprefab34_cowgirl_texture3)

  local itemgameid34 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab34)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid34)

  local itemprefab35 = ModUtilities.CreateItemPrefab()
  itemprefab35.Name = "Moletom folgado"
  itemprefab35.Description = "INCLUI CHARME E ELEGÂNCIA"
  itemprefab35.Price = 5000
  itemprefab35.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "UpperBodyOuter"
    sd.ControllerElementOverride = { "UpperBodyOuter_Hoodie" }
    sd.SetRequiredSlotsString({ "ArmL", "ArmR" })
    return sd
  end)()
  itemprefab35.IsIllegal = false
  itemprefab35.HasQuality = false
  itemprefab35.ThrowingOutForbidden = false
  itemprefab35.IsStackable = false
  itemprefab35.Category = ItemCategory.Clothing
  itemprefab35.CanChangeColor = false
  itemprefab35.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Cor do barbante",
      ColorPaletteManager.GetColorPaletteByName("grayscalepalette")
    ),
  }
  itemprefab35.Partners = {}
  itemprefab35.ScratchType = ScratchTextureType.Universal
  itemprefab35.SusModifiers = {
    SusModifier.CreateInstance(SusArea.UpperBody, 0.8),
    SusModifier.CreateInstance(SusArea.ArmL, 0.8),
    SusModifier.CreateInstance(SusArea.ArmR, 0.8),
  }

  local itemprefab35_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Moletom folgado/tex 1 - doggy.json"
  )

  itemprefab35.AddTexture(itemprefab35_doggy_texture0)

  local itemprefab35_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Moletom folgado/tex 2 - missionary.json"
  )

  itemprefab35.AddTexture(itemprefab35_missionary_texture1)

  local itemprefab35_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Moletom folgado/tex 3 - interaction.json"
  )

  itemprefab35.AddTexture(itemprefab35_interaction_texture2)

  local itemprefab35_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Moletom folgado/tex 4 - blowjob.json"
  )

  itemprefab35.AddTexture(itemprefab35_blowjob_texture3)

  local itemprefab35_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Moletom folgado/tex 5 - cowgirl.json"
  )

  itemprefab35.AddTexture(itemprefab35_cowgirl_texture4)

  local itemgameid35 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab35)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid35)

  local itemprefab36 = ModUtilities.CreateItemPrefab()
  itemprefab36.Name = "Vestido Vintage"
  itemprefab36.Description =
    "Vestido longo com mangas cobrindo a maior parte do corpo."
  itemprefab36.Price = 20000
  itemprefab36.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "UpperBody"
    sd.ControllerElementOverride = { "UpperBody_Dress2" }
    sd.SetRequiredSlotsString({ "ArmL", "ArmR" })
    sd.SetForbiddenSlotsString({ "LowerBody", "UpperBodyOuter" })
    return sd
  end)()
  itemprefab36.IsIllegal = false
  itemprefab36.HasQuality = false
  itemprefab36.ThrowingOutForbidden = false
  itemprefab36.IsStackable = false
  itemprefab36.Category = ItemCategory.Clothing
  itemprefab36.CanChangeColor = false
  itemprefab36.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("grayscalepalette")
    ),
    ColorSlot.CreateInstance(
      "Cor secundária",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab36.Partners = {}
  itemprefab36.ScratchType = ScratchTextureType.Universal
  itemprefab36.SusModifiers = {
    SusModifier.CreateInstance(SusArea.UpperBody, 0.8),
    SusModifier.CreateInstance(SusArea.LowerBody, 0.8),
    SusModifier.CreateInstance(SusArea.LegL, 0.8),
    SusModifier.CreateInstance(SusArea.LegR, 0.8),
  }

  local itemprefab36_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Vestido Vintage/tex 1 - doggy.json"
  )

  itemprefab36.AddTexture(itemprefab36_doggy_texture0)

  local itemprefab36_interaction_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Vestido Vintage/tex 2 - interaction.json"
  )

  itemprefab36.AddTexture(itemprefab36_interaction_texture1)

  local itemprefab36_doggy_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Vestido Vintage/tex 3 - doggy.json"
  )

  itemprefab36.AddTexture(itemprefab36_doggy_texture2)

  local itemprefab36_missionary_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Vestido Vintage/tex 4 - missionary.json"
  )

  itemprefab36.AddTexture(itemprefab36_missionary_texture3)

  local itemprefab36_interaction_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Vestido Vintage/tex 5 - interaction.json"
  )

  itemprefab36.AddTexture(itemprefab36_interaction_texture4)

  local itemprefab36_blowjob_texture5 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Vestido Vintage/tex 6 - blowjob.json"
  )

  itemprefab36.AddTexture(itemprefab36_blowjob_texture5)

  local itemprefab36_cowgirl_texture6 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Vestido Vintage/tex 7 - cowgirl.json"
  )

  itemprefab36.AddTexture(itemprefab36_cowgirl_texture6)

  local itemgameid36 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab36)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid36)

  local itemprefab37 = ModUtilities.CreateItemPrefab()
  itemprefab37.Name = "Vestido slip"
  itemprefab37.Description =
    "Vestido slip com fenda alta expondo a perna direita. Muito elegante"
  itemprefab37.Price = 40000
  itemprefab37.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "UpperBody"
    sd.ControllerElementOverride = { "UpperBody_Dress1" }
    sd.SetForbiddenSlotsString({ "LowerBody", "UpperBodyOuter" })
    return sd
  end)()
  itemprefab37.IsIllegal = false
  itemprefab37.HasQuality = false
  itemprefab37.ThrowingOutForbidden = false
  itemprefab37.IsStackable = false
  itemprefab37.Category = ItemCategory.Clothing
  itemprefab37.CanChangeColor = false
  itemprefab37.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor básica",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab37.Partners = {}
  itemprefab37.ScratchType = ScratchTextureType.Universal
  itemprefab37.SusModifiers = {
    SusModifier.CreateInstance(SusArea.UpperBody, 0.5),
    SusModifier.CreateInstance(SusArea.LowerBody, 0.8),
    SusModifier.CreateInstance(SusArea.LegL, 0.8),
    SusModifier.CreateInstance(SusArea.LegR, 0.1),
  }

  local itemprefab37_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Vestido slip/tex 1 - doggy.json"
  )

  itemprefab37.AddTexture(itemprefab37_doggy_texture0)

  local itemprefab37_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Vestido slip/tex 2 - missionary.json"
  )

  itemprefab37.AddTexture(itemprefab37_missionary_texture1)

  local itemprefab37_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Vestido slip/tex 3 - interaction.json"
  )

  itemprefab37.AddTexture(itemprefab37_interaction_texture2)

  local itemprefab37_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Vestido slip/tex 4 - blowjob.json"
  )

  itemprefab37.AddTexture(itemprefab37_blowjob_texture3)

  local itemprefab37_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Vestido slip/tex 5 - cowgirl.json"
  )

  itemprefab37.AddTexture(itemprefab37_cowgirl_texture4)

  local itemgameid37 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab37)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid37)

  local itemprefab38 = ModUtilities.CreateItemPrefab()
  itemprefab38.Name = "Camiseta de pesca"
  itemprefab38.Description =
    'Camiseta legal dizendo "As mulheres me querem" e "As piranhas me temem". Popular entre os jovens.'
  itemprefab38.Price = 800
  itemprefab38.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "UpperBody"
    sd.ControllerElementOverride = { "UpperBody_Shirt" }
    return sd
  end)()
  itemprefab38.IsIllegal = false
  itemprefab38.HasQuality = false
  itemprefab38.ThrowingOutForbidden = false
  itemprefab38.IsStackable = false
  itemprefab38.Category = ItemCategory.Clothing
  itemprefab38.CanChangeColor = false
  itemprefab38.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab38.Partners = {}
  itemprefab38.ScratchType = ScratchTextureType.Universal
  itemprefab38.SusModifiers =
    { SusModifier.CreateInstance(SusArea.UpperBody, 0.8) }

  local itemprefab38_missionary_doggy_blowjob_cowgirl_interaction_shower_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Camiseta de pesca/tex 1 - missionary, doggy, blowjob, cowgirl, interaction, shower.json"
    )

  itemprefab38.AddTexture(
    itemprefab38_missionary_doggy_blowjob_cowgirl_interaction_shower_texture0
  )

  local itemprefab38_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta de pesca/tex 2 - doggy.json"
  )

  itemprefab38.AddTexture(itemprefab38_doggy_texture1)

  local itemprefab38_missionary_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta de pesca/tex 3 - missionary.json"
  )

  itemprefab38.AddTexture(itemprefab38_missionary_texture2)

  local itemprefab38_interaction_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta de pesca/tex 4 - interaction.json"
  )

  itemprefab38.AddTexture(itemprefab38_interaction_texture3)

  local itemprefab38_blowjob_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta de pesca/tex 5 - blowjob.json"
  )

  itemprefab38.AddTexture(itemprefab38_blowjob_texture4)

  local itemprefab38_cowgirl_texture5 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta de pesca/tex 6 - cowgirl.json"
  )

  itemprefab38.AddTexture(itemprefab38_cowgirl_texture5)

  local itemgameid38 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab38)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid38)

  local itemprefab39 = ModUtilities.CreateItemPrefab()
  itemprefab39.Name = 'Calcinha "Yaranaika"'
  itemprefab39.Description =
    'Calcinha com uma redenção pirata de um meme famoso. Você quase pode ouvir o "やらないか?".'
  itemprefab39.Price = 600
  itemprefab39.SlotData = SlotEquipData.CreateInstance("Panties")
  itemprefab39.IsIllegal = false
  itemprefab39.HasQuality = false
  itemprefab39.ThrowingOutForbidden = false
  itemprefab39.IsStackable = false
  itemprefab39.Category = ItemCategory.Clothing
  itemprefab39.CanChangeColor = false
  itemprefab39.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab39.Partners = {}
  itemprefab39.ScratchType = ScratchTextureType.Universal
  itemprefab39.SusModifiers = { SusModifier.CreateInstance(SusArea.Pussy, 1) }

  local itemprefab39_missionary_doggy_blowjob_cowgirl_interaction_shower_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Calcinha _Yaranaika_/tex 1 - missionary, doggy, blowjob, cowgirl, interaction, shower.json"
    )

  itemprefab39.AddTexture(
    itemprefab39_missionary_doggy_blowjob_cowgirl_interaction_shower_texture0
  )

  local itemprefab39_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha _Yaranaika_/tex 2 - doggy.json"
  )

  itemprefab39.AddTexture(itemprefab39_doggy_texture1)

  local itemprefab39_missionary_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha _Yaranaika_/tex 3 - missionary.json"
  )

  itemprefab39.AddTexture(itemprefab39_missionary_texture2)

  local itemprefab39_interaction_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha _Yaranaika_/tex 4 - interaction.json"
  )

  itemprefab39.AddTexture(itemprefab39_interaction_texture3)

  local itemprefab39_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha _Yaranaika_/tex 5 - cowgirl.json"
  )

  itemprefab39.AddTexture(itemprefab39_cowgirl_texture4)

  local itemgameid39 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab39)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid39)
end

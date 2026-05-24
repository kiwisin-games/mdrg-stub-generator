--This script was generated automatically!
--Good luck with making the mod!
--May Sheep be with you!
do
  local itemprefab0 = ModUtilities.CreateItemPrefab()
  itemprefab0.Name = "Orelhas de gato"
  itemprefab0.Description =
    "Um item que unifica e otakus. Edição furry limitada."
  itemprefab0.Price = 10000
  itemprefab0.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "Head"
    sd.ControllerElementOverride = { "Head_CatEars" }
    return sd
  end)()
  itemprefab0.IsIllegal = true
  itemprefab0.HasQuality = true
  itemprefab0.ThrowingOutForbidden = false
  itemprefab0.IsStackable = false
  itemprefab0.Category = ItemCategory.Modules
  itemprefab0.SubCategory = ItemSubCategory.Modules_CatEars
  itemprefab0.CanChangeColor = false
  itemprefab0.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Cor dos pelos",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab0.Partners = {}
  itemprefab0.ScratchType = ScratchTextureType.Universal
  itemprefab0.SusModifiers = {}

  local itemprefab0_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Orelhas de gato/tex 1 - doggy.json"
  )

  itemprefab0.AddTexture(itemprefab0_doggy_texture0)

  local itemprefab0_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Orelhas de gato/tex 2 - missionary.json"
  )

  itemprefab0.AddTexture(itemprefab0_missionary_texture1)

  local itemprefab0_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Orelhas de gato/tex 3 - interaction.json"
  )

  itemprefab0.AddTexture(itemprefab0_interaction_texture2)

  local itemprefab0_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Orelhas de gato/tex 4 - blowjob.json"
  )

  itemprefab0.AddTexture(itemprefab0_blowjob_texture3)

  local itemprefab0_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Orelhas de gato/tex 5 - cowgirl.json"
  )

  itemprefab0.AddTexture(itemprefab0_cowgirl_texture4)

  local itemgameid0 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab0)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid0)
end

do
  local itemprefab1 = ModUtilities.CreateItemPrefab()
  itemprefab1.Name = "Braço Esquerdo"
  itemprefab1.Description = "Braço esquerdo compatível com seu sexbot!"
  itemprefab1.Price = 12500
  itemprefab1.SlotData = SlotEquipData.CreateInstance("ArmL")
  itemprefab1.IsIllegal = true
  itemprefab1.HasQuality = true
  itemprefab1.ThrowingOutForbidden = false
  itemprefab1.IsStackable = false
  itemprefab1.Category = ItemCategory.Modules
  itemprefab1.CanChangeColor = false
  itemprefab1.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab1.Partners = {}
  itemprefab1.ScratchType = ScratchTextureType.Hard
  itemprefab1.SusModifiers = {}

  local itemprefab1_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Braço Esquerdo/tex 1 - doggy.json"
  )

  itemprefab1.AddTexture(itemprefab1_doggy_texture0)

  local itemprefab1_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Braço Esquerdo/tex 2 - missionary.json"
  )

  itemprefab1.AddTexture(itemprefab1_missionary_texture1)

  local itemprefab1_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Braço Esquerdo/tex 3 - interaction.json"
  )

  itemprefab1.AddTexture(itemprefab1_interaction_texture2)

  local itemprefab1_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Braço Esquerdo/tex 4 - blowjob.json"
  )

  itemprefab1.AddTexture(itemprefab1_blowjob_texture3)

  local itemprefab1_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Braço Esquerdo/tex 5 - cowgirl.json"
  )

  itemprefab1.AddTexture(itemprefab1_cowgirl_texture4)

  local itemprefab1_shower_texture5 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Braço Esquerdo/tex 6 - shower.json"
  )

  itemprefab1.AddTexture(itemprefab1_shower_texture5)

  local itemgameid1 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab1)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid1)
end

do
  local itemprefab2 = ModUtilities.CreateItemPrefab()
  itemprefab2.Name = "Braço Direito"
  itemprefab2.Description = "Braço direito compatível com seu sexbot!"
  itemprefab2.Price = 12500
  itemprefab2.SlotData = SlotEquipData.CreateInstance("ArmR")
  itemprefab2.IsIllegal = true
  itemprefab2.HasQuality = true
  itemprefab2.ThrowingOutForbidden = false
  itemprefab2.IsStackable = false
  itemprefab2.Category = ItemCategory.Modules
  itemprefab2.CanChangeColor = false
  itemprefab2.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab2.Partners = {}
  itemprefab2.ScratchType = ScratchTextureType.Hard
  itemprefab2.SusModifiers = {}

  local itemprefab2_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Braço Direito/tex 1 - doggy.json"
  )

  itemprefab2.AddTexture(itemprefab2_doggy_texture0)

  local itemprefab2_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Braço Direito/tex 2 - missionary.json"
  )

  itemprefab2.AddTexture(itemprefab2_missionary_texture1)

  local itemprefab2_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Braço Direito/tex 3 - interaction.json"
  )

  itemprefab2.AddTexture(itemprefab2_interaction_texture2)

  local itemprefab2_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Braço Direito/tex 4 - blowjob.json"
  )

  itemprefab2.AddTexture(itemprefab2_blowjob_texture3)

  local itemprefab2_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Braço Direito/tex 5 - cowgirl.json"
  )

  itemprefab2.AddTexture(itemprefab2_cowgirl_texture4)

  local itemprefab2_shower_texture5 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Braço Direito/tex 6 - shower.json"
  )

  itemprefab2.AddTexture(itemprefab2_shower_texture5)

  local itemgameid2 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab2)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid2)
end

do
  local itemprefab3 = ModUtilities.CreateItemPrefab()
  itemprefab3.Name = "Perna Esquerda"
  itemprefab3.Description =
    "Até uma única perna esquerda pode proporcionar muito prazer."
  itemprefab3.Price = 13500
  itemprefab3.SlotData = SlotEquipData.CreateInstance("LegL")
  itemprefab3.IsIllegal = true
  itemprefab3.HasQuality = true
  itemprefab3.ThrowingOutForbidden = false
  itemprefab3.IsStackable = false
  itemprefab3.Category = ItemCategory.Modules
  itemprefab3.CanChangeColor = false
  itemprefab3.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab3.Partners = {}
  itemprefab3.ScratchType = ScratchTextureType.Hard
  itemprefab3.SusModifiers = {}

  local itemprefab3_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perna Esquerda/tex 1 - doggy.json"
  )

  itemprefab3.AddTexture(itemprefab3_doggy_texture0)

  local itemprefab3_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perna Esquerda/tex 2 - missionary.json"
  )

  itemprefab3.AddTexture(itemprefab3_missionary_texture1)

  local itemprefab3_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perna Esquerda/tex 3 - interaction.json"
  )

  itemprefab3.AddTexture(itemprefab3_interaction_texture2)

  local itemprefab3_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perna Esquerda/tex 4 - cowgirl.json"
  )

  itemprefab3.AddTexture(itemprefab3_cowgirl_texture3)

  local itemprefab3_shower_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perna Esquerda/tex 5 - shower.json"
  )

  itemprefab3.AddTexture(itemprefab3_shower_texture4)

  local itemgameid3 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab3)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid3)
end

do
  local itemprefab4 = ModUtilities.CreateItemPrefab()
  itemprefab4.Name = "Perna Direita"
  itemprefab4.Description =
    "Até uma única perna direita pode proporcionar muito prazer."
  itemprefab4.Price = 13500
  itemprefab4.SlotData = SlotEquipData.CreateInstance("LegR")
  itemprefab4.IsIllegal = true
  itemprefab4.HasQuality = true
  itemprefab4.ThrowingOutForbidden = false
  itemprefab4.IsStackable = false
  itemprefab4.Category = ItemCategory.Modules
  itemprefab4.CanChangeColor = false
  itemprefab4.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab4.Partners = {}
  itemprefab4.ScratchType = ScratchTextureType.Hard
  itemprefab4.SusModifiers = {}

  local itemprefab4_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perna Direita/tex 1 - doggy.json"
  )

  itemprefab4.AddTexture(itemprefab4_doggy_texture0)

  local itemprefab4_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perna Direita/tex 2 - missionary.json"
  )

  itemprefab4.AddTexture(itemprefab4_missionary_texture1)

  local itemprefab4_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perna Direita/tex 3 - interaction.json"
  )

  itemprefab4.AddTexture(itemprefab4_interaction_texture2)

  local itemprefab4_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perna Direita/tex 4 - cowgirl.json"
  )

  itemprefab4.AddTexture(itemprefab4_cowgirl_texture3)

  local itemprefab4_shower_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perna Direita/tex 5 - shower.json"
  )

  itemprefab4.AddTexture(itemprefab4_shower_texture4)

  local itemgameid4 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab4)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid4)
end

do
  local itemprefab5 = ModUtilities.CreateItemPrefab()
  itemprefab5.Name = "Dentes Afiados"
  itemprefab5.Description = "Dê dentes mais afiados ao seu robô! ...Por que?"
  itemprefab5.Price = 12500
  itemprefab5.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "Teeth"
    sd.ControllerElementOverride = { "Teeth_SharpTeeth" }
    return sd
  end)()
  itemprefab5.IsIllegal = true
  itemprefab5.HasQuality = true
  itemprefab5.ThrowingOutForbidden = false
  itemprefab5.IsStackable = false
  itemprefab5.Category = ItemCategory.Modules
  itemprefab5.CanChangeColor = false
  itemprefab5.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab5.Partners = {}
  itemprefab5.ScratchType = ScratchTextureType.Hard
  itemprefab5.SusModifiers = {}

  local itemprefab5_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Dentes Afiados/tex 1 - missionary.json"
  )

  itemprefab5.AddTexture(itemprefab5_missionary_texture0)

  local itemprefab5_interaction_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Dentes Afiados/tex 2 - interaction.json"
  )

  itemprefab5.AddTexture(itemprefab5_interaction_texture1)

  local itemprefab5_blowjob_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Dentes Afiados/tex 3 - blowjob.json"
  )

  itemprefab5.AddTexture(itemprefab5_blowjob_texture2)

  local itemprefab5_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Dentes Afiados/tex 4 - cowgirl.json"
  )

  itemprefab5.AddTexture(itemprefab5_cowgirl_texture3)

  local itemprefab5_shower_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Dentes Afiados/tex 5 - shower.json"
  )

  itemprefab5.AddTexture(itemprefab5_shower_texture4)

  local itemgameid5 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab5)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid5)
end

do
  local itemprefab6 = ModUtilities.CreateItemPrefab()
  itemprefab6.Name = "Pele com Hiper Camuflagem"
  itemprefab6.Description =
    "De algum modo, funciona imediatamente.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>"
  itemprefab6.Price = 19000
  itemprefab6.SlotData = SlotEquipData.CreateInstance("Skin")
  itemprefab6.IsIllegal = true
  itemprefab6.HasQuality = false
  itemprefab6.ThrowingOutForbidden = false
  itemprefab6.IsStackable = false
  itemprefab6.Category = ItemCategory.Modules
  itemprefab6.CanChangeColor = true
  itemprefab6.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab6.Partners = {}
  itemprefab6.ScratchType = ScratchTextureType.Universal
  itemprefab6.SusModifiers = { SusModifier.CreateInstance(SusArea.Skin, 0.5) }

  local itemprefab6_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pele com Hiper Camuflagem/tex 1 - doggy.json"
  )

  itemprefab6.AddTexture(itemprefab6_doggy_texture0)

  local itemprefab6_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pele com Hiper Camuflagem/tex 2 - missionary.json"
  )

  itemprefab6.AddTexture(itemprefab6_missionary_texture1)

  local itemprefab6_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pele com Hiper Camuflagem/tex 3 - interaction.json"
  )

  itemprefab6.AddTexture(itemprefab6_interaction_texture2)

  local itemprefab6_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pele com Hiper Camuflagem/tex 4 - blowjob.json"
  )

  itemprefab6.AddTexture(itemprefab6_blowjob_texture3)

  local itemprefab6_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pele com Hiper Camuflagem/tex 5 - cowgirl.json"
  )

  itemprefab6.AddTexture(itemprefab6_cowgirl_texture4)

  local itemprefab6_shower_texture5 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pele com Hiper Camuflagem/tex 6 - shower.json"
  )

  itemprefab6.AddTexture(itemprefab6_shower_texture5)

  local itemgameid6 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab6)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid6)
end

do
  local itemprefab7 = ModUtilities.CreateItemPrefab()
  itemprefab7.Name = "Olhos com Hiper camuflagem"
  itemprefab7.Description =
    "Customize os olhos como achar melhor!<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>"
  itemprefab7.Price = 18000
  itemprefab7.SlotData = SlotEquipData.CreateInstance("Eyes")
  itemprefab7.IsIllegal = true
  itemprefab7.HasQuality = true
  itemprefab7.ThrowingOutForbidden = false
  itemprefab7.IsStackable = false
  itemprefab7.Category = ItemCategory.Modules
  itemprefab7.CanChangeColor = true
  itemprefab7.ColorSlots = {
    ColorSlot.CreateInstance(
      "Pupila Esquerda",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Pupila Direita",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Íris Esquerda",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Íris Direita",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Esclera",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab7.Partners = {}
  itemprefab7.ScratchType = ScratchTextureType.Hard
  itemprefab7.SusModifiers = {}

  local itemprefab7_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Olhos com Hiper camuflagem/tex 1 - doggy.json"
  )

  itemprefab7.AddTexture(itemprefab7_doggy_texture0)

  local itemprefab7_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Olhos com Hiper camuflagem/tex 2 - missionary.json"
  )

  itemprefab7.AddTexture(itemprefab7_missionary_texture1)

  local itemprefab7_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Olhos com Hiper camuflagem/tex 3 - interaction.json"
  )

  itemprefab7.AddTexture(itemprefab7_interaction_texture2)

  local itemprefab7_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Olhos com Hiper camuflagem/tex 4 - blowjob.json"
  )

  itemprefab7.AddTexture(itemprefab7_blowjob_texture3)

  local itemprefab7_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Olhos com Hiper camuflagem/tex 5 - cowgirl.json"
  )

  itemprefab7.AddTexture(itemprefab7_cowgirl_texture4)

  local itemprefab7_shower_texture5 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Olhos com Hiper camuflagem/tex 6 - shower.json"
  )

  itemprefab7.AddTexture(itemprefab7_shower_texture5)

  local itemgameid7 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab7)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid7)
end

do
  local itemprefab8 = ModUtilities.CreateItemPrefab()
  itemprefab8.Name = "Pele com Hiper camuflagem"
  itemprefab8.Description =
    "Troque a cor de lábios, vagina e mamilos como quiser com a mais nova invenção de hiper camuflagem.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>"
  itemprefab8.Price = 18000
  itemprefab8.SlotData = SlotEquipData.CreateInstance("Flesh")
  itemprefab8.IsIllegal = true
  itemprefab8.HasQuality = true
  itemprefab8.ThrowingOutForbidden = false
  itemprefab8.IsStackable = false
  itemprefab8.Category = ItemCategory.Modules
  itemprefab8.CanChangeColor = true
  itemprefab8.ColorSlots = {
    ColorSlot.CreateInstance(
      "Boca",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Mamilos",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Vagina",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab8.Partners = {}
  itemprefab8.ScratchType = ScratchTextureType.Universal
  itemprefab8.SusModifiers = {}

  local itemprefab8_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pele com Hiper camuflagem/tex 1 - doggy.json"
  )

  itemprefab8.AddTexture(itemprefab8_doggy_texture0)

  local itemprefab8_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pele com Hiper camuflagem/tex 2 - missionary.json"
  )

  itemprefab8.AddTexture(itemprefab8_missionary_texture1)

  local itemprefab8_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pele com Hiper camuflagem/tex 3 - interaction.json"
  )

  itemprefab8.AddTexture(itemprefab8_interaction_texture2)

  local itemprefab8_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pele com Hiper camuflagem/tex 4 - blowjob.json"
  )

  itemprefab8.AddTexture(itemprefab8_blowjob_texture3)

  local itemprefab8_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pele com Hiper camuflagem/tex 5 - cowgirl.json"
  )

  itemprefab8.AddTexture(itemprefab8_cowgirl_texture4)

  local itemprefab8_shower_texture5 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Pele com Hiper camuflagem/tex 6 - shower.json"
  )

  itemprefab8.AddTexture(itemprefab8_shower_texture5)

  local itemgameid8 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab8)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid8)
end

do
  local itemprefab9 = ModUtilities.CreateItemPrefab()
  itemprefab9.Name = "Orelhas Pontudas com Hiper camuflagem"
  itemprefab9.Description =
    "Orelhas pontudas iguais as de um elfo.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>"
  itemprefab9.Price = 4500
  itemprefab9.SlotData = SlotEquipData.CreateInstance("Ears")
  itemprefab9.IsIllegal = false
  itemprefab9.HasQuality = false
  itemprefab9.ThrowingOutForbidden = false
  itemprefab9.IsStackable = false
  itemprefab9.Category = ItemCategory.Modules
  itemprefab9.CanChangeColor = true
  itemprefab9.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal ",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab9.Partners = {}
  itemprefab9.ScratchType = ScratchTextureType.Universal
  itemprefab9.SusModifiers = {}

  local itemprefab9_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Orelhas Pontudas com Hiper camuflagem/tex 1 - doggy.json"
  )

  itemprefab9.AddTexture(itemprefab9_doggy_texture0)

  local itemprefab9_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Orelhas Pontudas com Hiper camuflagem/tex 2 - missionary.json"
  )

  itemprefab9.AddTexture(itemprefab9_missionary_texture1)

  local itemprefab9_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Orelhas Pontudas com Hiper camuflagem/tex 3 - interaction.json"
  )

  itemprefab9.AddTexture(itemprefab9_interaction_texture2)

  local itemprefab9_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Orelhas Pontudas com Hiper camuflagem/tex 4 - blowjob.json"
  )

  itemprefab9.AddTexture(itemprefab9_blowjob_texture3)

  local itemprefab9_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Orelhas Pontudas com Hiper camuflagem/tex 5 - cowgirl.json"
  )

  itemprefab9.AddTexture(itemprefab9_cowgirl_texture4)

  local itemgameid9 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab9)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid9)
end

do
  local itemprefab10 = ModUtilities.CreateItemPrefab()
  itemprefab10.Name = "Desativar holograma"
  itemprefab10.Description =
    "Módulo simples que permite desativar o holograma acima do cabelo do seu bot."
  itemprefab10.Price = 2500
  itemprefab10.SlotData = SlotEquipData.CreateInstance("Hologram")
  itemprefab10.IsIllegal = true
  itemprefab10.HasQuality = false
  itemprefab10.ThrowingOutForbidden = false
  itemprefab10.IsStackable = false
  itemprefab10.Category = ItemCategory.Modules
  itemprefab10.CanChangeColor = false
  itemprefab10.ColorSlots = {}
  itemprefab10.Partners = {}
  itemprefab10.ScratchType = ScratchTextureType.Universal
  itemprefab10.SusModifiers = {}

  local itemgameid10 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab10)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid10)
end

do
  local itemprefab11 = ModUtilities.CreateItemPrefab()
  itemprefab11.Name = "Mistura Cerebral Especial do Dr. Blau"
  itemprefab11.Description =
    "Deve te ajudar com a sua saúde mental. Agora sem prescrição. Mas será que vai realmente ajudar? Dita ser muito viciante."
  itemprefab11.Price = 50
  itemprefab11.IsIllegal = false
  itemprefab11.HasQuality = false
  itemprefab11.ThrowingOutForbidden = false
  itemprefab11.IsStackable = true
  itemprefab11.Category = ItemCategory.Meds
  itemprefab11.CanChangeColor = false
  itemprefab11.ColorSlots = {}
  itemprefab11.Partners = {}
  itemprefab11.ScratchType = ScratchTextureType.Universal
  itemprefab11.SusModifiers = {}

  local itemgameid11 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab11)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid11)
end

do
  local itemprefab12 = ModUtilities.CreateItemPrefab()
  itemprefab12.Name = "SempillX"
  itemprefab12.Description =
    "Regenera toda sua porra, mas te deixa cansado. Aparentemente não afeta sua saúde."
  itemprefab12.Price = 5000
  itemprefab12.IsIllegal = false
  itemprefab12.HasQuality = false
  itemprefab12.ThrowingOutForbidden = false
  itemprefab12.IsStackable = true
  itemprefab12.Category = ItemCategory.Meds
  itemprefab12.CanChangeColor = false
  itemprefab12.ColorSlots = {}
  itemprefab12.Partners = {}
  itemprefab12.ScratchType = ScratchTextureType.Universal
  itemprefab12.SusModifiers = {}

  local itemgameid12 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab12)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid12)
end

do
  local itemprefab13 = ModUtilities.CreateItemPrefab()
  itemprefab13.Name = "Vinegara"
  itemprefab13.Description =
    "Permite que você mantenha uma ereção por 2 horas em troca da sua alma. Cheira a vinagre. Tomar mais de 1 não parece fazer qualquer diferença."
  itemprefab13.Price = 3000
  itemprefab13.IsIllegal = false
  itemprefab13.HasQuality = false
  itemprefab13.ThrowingOutForbidden = false
  itemprefab13.IsStackable = true
  itemprefab13.Category = ItemCategory.Meds
  itemprefab13.CanChangeColor = false
  itemprefab13.ColorSlots = {}
  itemprefab13.Partners = {}
  itemprefab13.ScratchType = ScratchTextureType.Universal
  itemprefab13.SusModifiers = {}

  local itemgameid13 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab13)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid13)
end

do
  local itemprefab14 = ModUtilities.CreateItemPrefab()
  itemprefab14.Name = "Dura+"
  itemprefab14.Description =
    "Um mistura mágica de 40 temperos. Ele aumenta sua produção de semên e te permite gozar como nunca. A dose segura para um adulto é de 1 por semana. Tente mais do que isso e seu corpo não irá dura muito."
  itemprefab14.Price = 10000
  itemprefab14.IsIllegal = false
  itemprefab14.HasQuality = false
  itemprefab14.ThrowingOutForbidden = false
  itemprefab14.IsStackable = true
  itemprefab14.Category = ItemCategory.Meds
  itemprefab14.CanChangeColor = false
  itemprefab14.ColorSlots = {}
  itemprefab14.Partners = {}
  itemprefab14.ScratchType = ScratchTextureType.Universal
  itemprefab14.SusModifiers = {}

  local itemgameid14 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab14)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid14)
end

do
  local itemprefab15 = ModUtilities.CreateItemPrefab()
  itemprefab15.Name = "Vinegara PREMIUM"
  itemprefab15.Description =
    "Versão premium do vinegara. Permite que você mantenha uma ereção por até 24 horas em troca da sua alma. Cheira muito forte a vinagre. Tomar mais de 1 não parece fazer diferença."
  itemprefab15.Price = 50000
  itemprefab15.IsIllegal = false
  itemprefab15.HasQuality = false
  itemprefab15.ThrowingOutForbidden = false
  itemprefab15.IsStackable = true
  itemprefab15.Category = ItemCategory.Meds
  itemprefab15.CanChangeColor = false
  itemprefab15.ColorSlots = {}
  itemprefab15.Partners = {}
  itemprefab15.ScratchType = ScratchTextureType.Universal
  itemprefab15.SusModifiers = {}

  local itemgameid15 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab15)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid15)
end
do
  local itemprefab16 = ModUtilities.CreateItemPrefab()
  itemprefab16.Name = "Punho de Ferro"
  itemprefab16.Description =
    "Droga com o nome de uma condição médica que se refere a homens que se masturbam com um aperto muito forte em seus pênis. Dessensibiliza o pênis, tornando mais difícil gozar. Funciona por cerca de 4 horas."
  itemprefab16.Price = 1000
  itemprefab16.IsIllegal = false
  itemprefab16.HasQuality = false
  itemprefab16.ThrowingOutForbidden = false
  itemprefab16.IsStackable = true
  itemprefab16.Category = ItemCategory.Meds
  itemprefab16.CanChangeColor = false
  itemprefab16.ColorSlots = {}
  itemprefab16.Partners = {}
  itemprefab16.ScratchType = ScratchTextureType.Universal
  itemprefab16.SusModifiers = {}

  local itemgameid16 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab16)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid16)

  local itemprefab17 = ModUtilities.CreateItemPrefab()
  itemprefab17.Name = "Óculos de pixel"
  itemprefab17.Description =
    "Cansado de como o mundo se parece? Use esses óculos e transforme tudo em pixels!\n<color=#FF0000>TAMBÉM AFETA A INTERFACE!</color>"
  itemprefab17.Price = 1000
  itemprefab17.SlotData = SlotEquipData.CreateInstance("Anon_Glasses")
  itemprefab17.IsIllegal = false
  itemprefab17.HasQuality = false
  itemprefab17.ThrowingOutForbidden = false
  itemprefab17.IsStackable = false
  itemprefab17.Category = ItemCategory.Other
  itemprefab17.CanChangeColor = false
  itemprefab17.ColorSlots = {}
  itemprefab17.Partners = {}
  itemprefab17.ScratchType = ScratchTextureType.Universal
  itemprefab17.SusModifiers = {}

  local itemgameid17 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab17)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid17)

  local itemprefab18 = ModUtilities.CreateItemPrefab()
  itemprefab18.Name = "Tapete de abóbora"
  itemprefab18.Description =
    "Anime seu quarto com esse tapete em formato de abóbora!"
  itemprefab18.Price = 1000
  itemprefab18.SlotData = SlotEquipData.CreateInstance("Room_Mat")
  itemprefab18.IsIllegal = false
  itemprefab18.HasQuality = false
  itemprefab18.ThrowingOutForbidden = false
  itemprefab18.IsStackable = false
  itemprefab18.Category = ItemCategory.Room
  itemprefab18.CanChangeColor = false
  itemprefab18.ColorSlots = {}
  itemprefab18.Partners = {}
  itemprefab18.ScratchType = ScratchTextureType.Universal
  itemprefab18.SusModifiers = {}

  local itemgameid18 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab18)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid18)

  local itemprefab19 = ModUtilities.CreateItemPrefab()
  itemprefab19.Name = "Pelúcia de aranha"
  itemprefab19.Description = "Anime seu quarto com esta pelúcia de aranha!"
  itemprefab19.Price = 1000
  itemprefab19.SlotData = SlotEquipData.CreateInstance("Room_Plush")
  itemprefab19.IsIllegal = false
  itemprefab19.HasQuality = false
  itemprefab19.ThrowingOutForbidden = false
  itemprefab19.IsStackable = false
  itemprefab19.Category = ItemCategory.Room
  itemprefab19.CanChangeColor = false
  itemprefab19.ColorSlots = {}
  itemprefab19.Partners = {}
  itemprefab19.ScratchType = ScratchTextureType.Universal
  itemprefab19.SusModifiers = {}

  local itemgameid19 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab19)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid19)

  local itemprefab20 = ModUtilities.CreateItemPrefab()
  itemprefab20.Name = "Banner de morcego"
  itemprefab20.Description = "Anime seu quarto com esse banner de morcego."
  itemprefab20.Price = 1000
  itemprefab20.SlotData = SlotEquipData.CreateInstance("Room_Banner")
  itemprefab20.IsIllegal = false
  itemprefab20.HasQuality = false
  itemprefab20.ThrowingOutForbidden = false
  itemprefab20.IsStackable = false
  itemprefab20.Category = ItemCategory.Room
  itemprefab20.CanChangeColor = false
  itemprefab20.ColorSlots = {}
  itemprefab20.Partners = {}
  itemprefab20.ScratchType = ScratchTextureType.Universal
  itemprefab20.SusModifiers = {}

  local itemgameid20 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab20)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid20)

  local itemprefab21 = ModUtilities.CreateItemPrefab()
  itemprefab21.Name = "Decoração fantasma"
  itemprefab21.Description =
    "Anime seu quarto com esta decoração de parede de fantasma."
  itemprefab21.Price = 1000
  itemprefab21.SlotData = SlotEquipData.CreateInstance("Room_WallDecoration")
  itemprefab21.IsIllegal = false
  itemprefab21.HasQuality = false
  itemprefab21.ThrowingOutForbidden = false
  itemprefab21.IsStackable = false
  itemprefab21.Category = ItemCategory.Room
  itemprefab21.CanChangeColor = false
  itemprefab21.ColorSlots = {}
  itemprefab21.Partners = {}
  itemprefab21.ScratchType = ScratchTextureType.Universal
  itemprefab21.SusModifiers = {}

  local itemgameid21 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab21)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid21)

  local itemprefab22 = ModUtilities.CreateItemPrefab()
  itemprefab22.Name = 'Pacote de revistas "Bing Chilling"'
  itemprefab22.Description =
    "Um estranho pacote de revistas que você ganhou como recompensa da Cazino."
  itemprefab22.Price = 100
  itemprefab22.IsIllegal = false
  itemprefab22.HasQuality = false
  itemprefab22.ThrowingOutForbidden = true
  itemprefab22.IsStackable = false
  itemprefab22.Category = ItemCategory.Other
  itemprefab22.CanChangeColor = false
  itemprefab22.ColorSlots = {}
  itemprefab22.Partners = {}
  itemprefab22.ScratchType = ScratchTextureType.Universal
  itemprefab22.SusModifiers = {}

  local itemgameid22 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab22)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid22)

  local itemprefab23 = ModUtilities.CreateItemPrefab()
  itemprefab23.Name = "Catálogo de lingerie"
  itemprefab23.Description =
    "Catálogo de lingerie. Por algum motivo, ele veio junto com uma de suas compras da ladyparts."
  itemprefab23.Price = 100
  itemprefab23.IsIllegal = false
  itemprefab23.HasQuality = false
  itemprefab23.ThrowingOutForbidden = true
  itemprefab23.IsStackable = false
  itemprefab23.Category = ItemCategory.Other
  itemprefab23.CanChangeColor = false
  itemprefab23.ColorSlots = {}
  itemprefab23.Partners = {}
  itemprefab23.ScratchType = ScratchTextureType.Universal
  itemprefab23.SusModifiers = {}

  local itemgameid23 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab23)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid23)

  local itemprefab24 = ModUtilities.CreateItemPrefab()
  itemprefab24.Name = "Fogão Antigo do Sindíco"
  itemprefab24.Description = "Um fogão que você ganhou do Sindíco."
  itemprefab24.Price = 199
  itemprefab24.IsIllegal = false
  itemprefab24.HasQuality = false
  itemprefab24.ThrowingOutForbidden = true
  itemprefab24.IsStackable = false
  itemprefab24.Category = ItemCategory.Other
  itemprefab24.CanChangeColor = false
  itemprefab24.ColorSlots = {}
  itemprefab24.Partners = {}
  itemprefab24.ScratchType = ScratchTextureType.Universal
  itemprefab24.SusModifiers = {}

  local itemgameid24 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab24)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid24)
end

do
  local itemprefab25 = ModUtilities.CreateItemPrefab()
  itemprefab25.Name = "Fogão Antigo Reparado do Sindíco"
  itemprefab25.Description =
    "Um fogão que você ganhou do sindíco. Foi reparado e melhorado! A eficiência aumentou 15% e conta com mecanismos de segurança modernos!"
  itemprefab25.Price = 220
  itemprefab25.IsIllegal = false
  itemprefab25.HasQuality = false
  itemprefab25.ThrowingOutForbidden = true
  itemprefab25.IsStackable = false
  itemprefab25.Category = ItemCategory.Other
  itemprefab25.CanChangeColor = false
  itemprefab25.ColorSlots = {}
  itemprefab25.Partners = {}
  itemprefab25.ScratchType = ScratchTextureType.Universal
  itemprefab25.SusModifiers = {}

  local itemgameid25 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab25)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid25)

  local itemprefab26 = ModUtilities.CreateItemPrefab()
  itemprefab26.Name = "Camiseta"
  itemprefab26.Description = "Camiseta simples"
  itemprefab26.Price = 400
  itemprefab26.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "UpperBody"
    sd.ControllerElementOverride = { "UpperBody_Shirt" }
    return sd
  end)()
  itemprefab26.IsIllegal = false
  itemprefab26.HasQuality = false
  itemprefab26.ThrowingOutForbidden = false
  itemprefab26.IsStackable = false
  itemprefab26.Category = ItemCategory.Clothing
  itemprefab26.CanChangeColor = false
  itemprefab26.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab26.Partners = {}
  itemprefab26.ScratchType = ScratchTextureType.Universal
  itemprefab26.SusModifiers =
    { SusModifier.CreateInstance(SusArea.UpperBody, 0.8) }

  local itemprefab26_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta/tex 1 - doggy.json"
  )

  itemprefab26.AddTexture(itemprefab26_doggy_texture0)

  local itemprefab26_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta/tex 2 - missionary.json"
  )

  itemprefab26.AddTexture(itemprefab26_missionary_texture1)

  local itemprefab26_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta/tex 3 - interaction.json"
  )

  itemprefab26.AddTexture(itemprefab26_interaction_texture2)

  local itemprefab26_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta/tex 4 - blowjob.json"
  )

  itemprefab26.AddTexture(itemprefab26_blowjob_texture3)

  local itemprefab26_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Camiseta/tex 5 - cowgirl.json"
  )

  itemprefab26.AddTexture(itemprefab26_cowgirl_texture4)

  local itemgameid26 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab26)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid26)

  local itemprefab27 = ModUtilities.CreateItemPrefab()
  itemprefab27.Name = "Calcinha"
  itemprefab27.Description = "Calcinha simples. "
  itemprefab27.Price = 300
  itemprefab27.SlotData = SlotEquipData.CreateInstance("Panties")
  itemprefab27.IsIllegal = false
  itemprefab27.HasQuality = false
  itemprefab27.ThrowingOutForbidden = false
  itemprefab27.IsStackable = false
  itemprefab27.Category = ItemCategory.Clothing
  itemprefab27.CanChangeColor = false
  itemprefab27.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab27.Partners = {}
  itemprefab27.ScratchType = ScratchTextureType.Universal
  itemprefab27.SusModifiers = { SusModifier.CreateInstance(SusArea.Pussy, 1) }

  local itemprefab27_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha/tex 1 - doggy.json"
  )

  itemprefab27.AddTexture(itemprefab27_doggy_texture0)

  local itemprefab27_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha/tex 2 - missionary.json"
  )

  itemprefab27.AddTexture(itemprefab27_missionary_texture1)

  local itemprefab27_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha/tex 3 - interaction.json"
  )

  itemprefab27.AddTexture(itemprefab27_interaction_texture2)

  local itemprefab27_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Calcinha/tex 4 - cowgirl.json"
  )

  itemprefab27.AddTexture(itemprefab27_cowgirl_texture3)

  local itemgameid27 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab27)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid27)

  local itemprefab28 = ModUtilities.CreateItemPrefab()
  itemprefab28.Name = "Sutiã plano"
  itemprefab28.Description = "Sutiã simples."
  itemprefab28.Price = 400
  itemprefab28.SlotData = SlotEquipData.CreateInstance("Bra")
  itemprefab28.IsIllegal = false
  itemprefab28.HasQuality = false
  itemprefab28.ThrowingOutForbidden = false
  itemprefab28.IsStackable = false
  itemprefab28.Category = ItemCategory.Clothing
  itemprefab28.CanChangeColor = false
  itemprefab28.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab28.Partners = {}
  itemprefab28.ScratchType = ScratchTextureType.Universal
  itemprefab28.SusModifiers = { SusModifier.CreateInstance(SusArea.Boobs, 1) }

  local itemprefab28_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã plano/tex 1 - doggy.json"
  )

  itemprefab28.AddTexture(itemprefab28_doggy_texture0)

  local itemprefab28_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã plano/tex 2 - missionary.json"
  )

  itemprefab28.AddTexture(itemprefab28_missionary_texture1)

  local itemprefab28_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã plano/tex 3 - interaction.json"
  )

  itemprefab28.AddTexture(itemprefab28_interaction_texture2)

  local itemprefab28_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã plano/tex 4 - blowjob.json"
  )

  itemprefab28.AddTexture(itemprefab28_blowjob_texture3)

  local itemprefab28_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Sutiã plano/tex 5 - cowgirl.json"
  )

  itemprefab28.AddTexture(itemprefab28_cowgirl_texture4)

  local itemgameid28 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab28)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid28)

  local itemprefab29 = ModUtilities.CreateItemPrefab()
  itemprefab29.Name = "Meia esquerda plana"
  itemprefab29.Description = "Meia esquerda simples!"
  itemprefab29.Price = 270
  itemprefab29.SlotData = SlotEquipData.CreateInstance("StockingL")
  itemprefab29.IsIllegal = false
  itemprefab29.HasQuality = false
  itemprefab29.ThrowingOutForbidden = false
  itemprefab29.IsStackable = false
  itemprefab29.Category = ItemCategory.Clothing
  itemprefab29.CanChangeColor = false
  itemprefab29.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab29.Partners = {}
  itemprefab29.ScratchType = ScratchTextureType.Universal
  itemprefab29.SusModifiers = { SusModifier.CreateInstance(SusArea.LegL, 0.5) }

  local itemprefab29_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia esquerda plana/tex 1 - doggy.json"
  )

  itemprefab29.AddTexture(itemprefab29_doggy_texture0)

  local itemprefab29_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia esquerda plana/tex 2 - missionary.json"
  )

  itemprefab29.AddTexture(itemprefab29_missionary_texture1)

  local itemprefab29_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia esquerda plana/tex 3 - interaction.json"
  )

  itemprefab29.AddTexture(itemprefab29_interaction_texture2)

  local itemprefab29_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia esquerda plana/tex 4 - cowgirl.json"
  )

  itemprefab29.AddTexture(itemprefab29_cowgirl_texture3)

  local itemgameid29 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab29)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid29)

  local itemprefab30 = ModUtilities.CreateItemPrefab()
  itemprefab30.Name = "Meia direita plana"
  itemprefab30.Description = "Meia direita simples!"
  itemprefab30.Price = 270
  itemprefab30.SlotData = SlotEquipData.CreateInstance("StockingR")
  itemprefab30.IsIllegal = false
  itemprefab30.HasQuality = false
  itemprefab30.ThrowingOutForbidden = false
  itemprefab30.IsStackable = false
  itemprefab30.Category = ItemCategory.Clothing
  itemprefab30.CanChangeColor = false
  itemprefab30.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab30.Partners = {}
  itemprefab30.ScratchType = ScratchTextureType.Universal
  itemprefab30.SusModifiers = { SusModifier.CreateInstance(SusArea.LegL, 0.5) }

  local itemprefab30_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia direita plana/tex 1 - doggy.json"
  )

  itemprefab30.AddTexture(itemprefab30_doggy_texture0)

  local itemprefab30_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia direita plana/tex 2 - missionary.json"
  )

  itemprefab30.AddTexture(itemprefab30_missionary_texture1)

  local itemprefab30_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia direita plana/tex 3 - interaction.json"
  )

  itemprefab30.AddTexture(itemprefab30_interaction_texture2)

  local itemprefab30_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Meia direita plana/tex 4 - cowgirl.json"
  )

  itemprefab30.AddTexture(itemprefab30_cowgirl_texture3)

  local itemgameid30 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab30)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid30)

  local itemprefab31 = ModUtilities.CreateItemPrefab()
  itemprefab31.Name = "Par de meias"
  itemprefab31.Description =
    "Inclui a meia esquerda e a direita.<color=#00FF00>\nEste item ainda está em seu pacote. Você precisa abri-lo primeiro!</color>"
  itemprefab31.Price = 540
  itemprefab31.IsIllegal = false
  itemprefab31.HasQuality = false
  itemprefab31.ThrowingOutForbidden = false
  itemprefab31.IsStackable = false
  itemprefab31.Category = ItemCategory.Package
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

  local itemgameid31 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab31)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid31)

  local itemprefab32 = ModUtilities.CreateItemPrefab()
  itemprefab32.Name = "Minissaia"
  itemprefab32.Description = "Versão reduzida da saia normal."
  itemprefab32.Price = 5000
  itemprefab32.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "LowerBody"
    sd.ControllerElementOverride = { "LowerBody_Skirt" }
    return sd
  end)()
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
  itemprefab32.SusModifiers =
    { SusModifier.CreateInstance(SusArea.LowerBody, 0.5) }

  local itemprefab32_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Minissaia/tex 1 - missionary.json"
  )

  itemprefab32.AddTexture(itemprefab32_missionary_texture0)

  local itemprefab32_cowgirl_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Minissaia/tex 2 - cowgirl.json"
  )

  itemprefab32.AddTexture(itemprefab32_cowgirl_texture1)

  local itemprefab32_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Minissaia/tex 3 - interaction.json"
  )

  itemprefab32.AddTexture(itemprefab32_interaction_texture2)

  local itemprefab32_doggy_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Minissaia/tex 4 - doggy.json"
  )

  itemprefab32.AddTexture(itemprefab32_doggy_texture3)

  local itemprefab32_doggy_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Minissaia/tex 5 - doggy.json"
  )

  itemprefab32.AddTexture(itemprefab32_doggy_texture4)

  local itemgameid32 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab32)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid32)

  local itemprefab33 = ModUtilities.CreateItemPrefab()
  itemprefab33.Name = "Laço fofo"
  itemprefab33.Description = "Um laço fofo!"
  itemprefab33.Price = 50
  itemprefab33.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "HairAccessoryL"
    sd.ControllerElementOverride = { "HairAccessoryL_CuteBow" }
    return sd
  end)()
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

  local itemprefab33_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Laço fofo/tex 1 - missionary.json"
  )

  itemprefab33.AddTexture(itemprefab33_missionary_texture0)

  local itemprefab33_interaction_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Laço fofo/tex 2 - interaction.json"
  )

  itemprefab33.AddTexture(itemprefab33_interaction_texture1)

  local itemprefab33_blowjob_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Laço fofo/tex 3 - blowjob.json"
  )

  itemprefab33.AddTexture(itemprefab33_blowjob_texture2)

  local itemprefab33_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Laço fofo/tex 4 - cowgirl.json"
  )

  itemprefab33.AddTexture(itemprefab33_cowgirl_texture3)

  local itemgameid33 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab33)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid33)

  local itemprefab34 = ModUtilities.CreateItemPrefab()
  itemprefab34.Name = "Gargantilha de coração"
  itemprefab34.Description =
    "Gargantilha com o formato de um coração no meio."
  itemprefab34.Price = 300
  itemprefab34.SlotData = SlotEquipData.CreateInstance("NeckAccessory")
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
  }
  itemprefab34.Partners = {}
  itemprefab34.ScratchType = ScratchTextureType.Universal
  itemprefab34.SusModifiers = {}

  local itemprefab34_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Gargantilha de coração/tex 1 - missionary.json"
  )

  itemprefab34.AddTexture(itemprefab34_missionary_texture0)

  local itemprefab34_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Gargantilha de coração/tex 2 - doggy.json"
  )

  itemprefab34.AddTexture(itemprefab34_doggy_texture1)

  local itemprefab34_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Gargantilha de coração/tex 3 - interaction.json"
  )

  itemprefab34.AddTexture(itemprefab34_interaction_texture2)

  local itemprefab34_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Gargantilha de coração/tex 4 - blowjob.json"
  )

  itemprefab34.AddTexture(itemprefab34_blowjob_texture3)

  local itemprefab34_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Gargantilha de coração/tex 5 - cowgirl.json"
  )

  itemprefab34.AddTexture(itemprefab34_cowgirl_texture4)

  local itemgameid34 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab34)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid34)

  local itemprefab35 = ModUtilities.CreateItemPrefab()
  itemprefab35.Name = "Óculos de coração"
  itemprefab35.Description =
    "Óculos falsos com dois corações na armação. Não é útil, mas é estiloso!"
  itemprefab35.Price = 200
  itemprefab35.SlotData = SlotEquipData.CreateInstance("Glasses")
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
  }
  itemprefab35.Partners = {}
  itemprefab35.ScratchType = ScratchTextureType.Universal
  itemprefab35.SusModifiers = {}

  local itemprefab35_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Óculos de coração/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab35.AddTexture(
    itemprefab35_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemprefab35_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Óculos de coração/tex 2 - doggy.json"
  )

  itemprefab35.AddTexture(itemprefab35_doggy_texture1)

  local itemgameid35 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab35)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid35)

  local itemprefab36 = ModUtilities.CreateItemPrefab()
  itemprefab36.Name = "Piercing na língua"
  itemprefab36.Description =
    "Um piercing circular. Graças ao uso de ímãs, não há necessidade de furar a língua do bot."
  itemprefab36.Price = 690
  itemprefab36.SlotData = SlotEquipData.CreateInstance("TongueAccessory")
  itemprefab36.IsIllegal = false
  itemprefab36.HasQuality = false
  itemprefab36.ThrowingOutForbidden = false
  itemprefab36.IsStackable = false
  itemprefab36.Category = ItemCategory.Clothing
  itemprefab36.SubCategory = ItemSubCategory.Clothing_Piercing
  itemprefab36.CanChangeColor = false
  itemprefab36.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab36.Partners = {}
  itemprefab36.ScratchType = ScratchTextureType.Universal
  itemprefab36.SusModifiers = {}

  local itemprefab36_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Piercing na língua/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab36.AddTexture(
    itemprefab36_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemprefab36_shower_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Piercing na língua/tex 2 - shower.json"
  )

  itemprefab36.AddTexture(itemprefab36_shower_texture1)

  local itemprefab36_doggy_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Piercing na língua/tex 3 - doggy.json"
  )

  itemprefab36.AddTexture(itemprefab36_doggy_texture2)

  local itemgameid36 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab36)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid36)

  local itemprefab37 = ModUtilities.CreateItemPrefab()
  itemprefab37.Name = "Conjunto de pedicure"
  itemprefab37.Description =
    "Conjunto completo de unhas e esmaltes. Você pode colorir o pé direito e esquerdo separadamente."
  itemprefab37.Price = 16000
  itemprefab37.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "Pedicure"
    sd.SetRequiredSlotsString({ "LegL", "LegR" })
    return sd
  end)()
  itemprefab37.IsIllegal = false
  itemprefab37.HasQuality = false
  itemprefab37.ThrowingOutForbidden = false
  itemprefab37.IsStackable = false
  itemprefab37.Category = ItemCategory.Clothing
  itemprefab37.SubCategory = ItemSubCategory.Clothing_MakeUp
  itemprefab37.CanChangeColor = true
  itemprefab37.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor das unhas do pé direito",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Cor das unhas do pé esquerdo",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab37.Partners = {}
  itemprefab37.ScratchType = ScratchTextureType.Universal
  itemprefab37.SusModifiers = {}

  local itemprefab37_interaction_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Conjunto de pedicure/tex 1 - interaction.json"
  )

  itemprefab37.AddTexture(itemprefab37_interaction_texture0)

  local itemprefab37_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Conjunto de pedicure/tex 2 - missionary.json"
  )

  itemprefab37.AddTexture(itemprefab37_missionary_texture1)

  local itemgameid37 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab37)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid37)

  local itemprefab38 = ModUtilities.CreateItemPrefab()
  itemprefab38.Name = "Piercing no umbigo"
  itemprefab38.Description =
    "Um piercing circular. Graças ao uso de ímãs, não há necessidade de furar a pele do bot."
  itemprefab38.Price = 7000
  itemprefab38.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "Navel"
    sd.ControllerElementOverride = { "Navel_Piercing" }
    return sd
  end)()
  itemprefab38.IsIllegal = false
  itemprefab38.HasQuality = false
  itemprefab38.ThrowingOutForbidden = false
  itemprefab38.IsStackable = false
  itemprefab38.Category = ItemCategory.Clothing
  itemprefab38.SubCategory = ItemSubCategory.Clothing_Piercing
  itemprefab38.CanChangeColor = false
  itemprefab38.ColorSlots = {}
  itemprefab38.Partners = {}
  itemprefab38.ScratchType = ScratchTextureType.Universal
  itemprefab38.SusModifiers = {}

  local itemprefab38_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Piercing no umbigo/tex 1 - missionary.json"
  )

  itemprefab38.AddTexture(itemprefab38_missionary_texture0)

  local itemprefab38_interaction_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Piercing no umbigo/tex 2 - interaction.json"
  )

  itemprefab38.AddTexture(itemprefab38_interaction_texture1)

  local itemprefab38_cowgirl_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Piercing no umbigo/tex 3 - cowgirl.json"
  )

  itemprefab38.AddTexture(itemprefab38_cowgirl_texture2)

  local itemgameid38 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab38)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid38)

  local itemprefab39 = ModUtilities.CreateItemPrefab()
  itemprefab39.Name = "Perfuração no mamilo direito"
  itemprefab39.Description =
    "Um piercing circular. Graças ao uso de ímãs fortes, não há necessidade de perfurar a pele do bot."
  itemprefab39.Price = 7500
  itemprefab39.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "NippleLeft"
    sd.ControllerElementOverride = { "NippleLeft_Piercing" }
    return sd
  end)()
  itemprefab39.IsIllegal = false
  itemprefab39.HasQuality = false
  itemprefab39.ThrowingOutForbidden = false
  itemprefab39.IsStackable = false
  itemprefab39.Category = ItemCategory.Clothing
  itemprefab39.SubCategory = ItemSubCategory.Clothing_Piercing
  itemprefab39.CanChangeColor = false
  itemprefab39.ColorSlots = {}
  itemprefab39.Partners = {}
  itemprefab39.ScratchType = ScratchTextureType.Universal
  itemprefab39.SusModifiers = {}

  local itemprefab39_missionary_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo direito/tex 1 - missionary.json"
  )

  itemprefab39.AddTexture(itemprefab39_missionary_texture0)

  local itemprefab39_interaction_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo direito/tex 2 - interaction.json"
  )

  itemprefab39.AddTexture(itemprefab39_interaction_texture1)

  local itemprefab39_cowgirl_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo direito/tex 3 - cowgirl.json"
  )

  itemprefab39.AddTexture(itemprefab39_cowgirl_texture2)

  local itemprefab39_shower_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo direito/tex 4 - shower.json"
  )

  itemprefab39.AddTexture(itemprefab39_shower_texture3)

  local itemgameid39 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab39)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid39)

  local itemprefab40 = ModUtilities.CreateItemPrefab()
  itemprefab40.Name = "Perfuração no mamilo esquerdo"
  itemprefab40.Description =
    "Um piercing circular. Graças ao uso de ímãs fortes, não há necessidade de furar a pele do bot."
  itemprefab40.Price = 7500
  itemprefab40.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "NippleRight"
    sd.ControllerElementOverride = { "NippleRight_Piercing" }
    return sd
  end)()
  itemprefab40.IsIllegal = false
  itemprefab40.HasQuality = false
  itemprefab40.ThrowingOutForbidden = false
  itemprefab40.IsStackable = false
  itemprefab40.Category = ItemCategory.Clothing
  itemprefab40.SubCategory = ItemSubCategory.Clothing_Piercing
  itemprefab40.CanChangeColor = false
  itemprefab40.ColorSlots = {}
  itemprefab40.Partners = {}
  itemprefab40.ScratchType = ScratchTextureType.Universal
  itemprefab40.SusModifiers = {}

  local itemprefab40_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo esquerdo/tex 1 - doggy.json"
  )

  itemprefab40.AddTexture(itemprefab40_doggy_texture0)

  local itemprefab40_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo esquerdo/tex 2 - missionary.json"
  )

  itemprefab40.AddTexture(itemprefab40_missionary_texture1)

  local itemprefab40_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo esquerdo/tex 3 - interaction.json"
  )

  itemprefab40.AddTexture(itemprefab40_interaction_texture2)

  local itemprefab40_cowgirl_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Perfuração no mamilo esquerdo/tex 4 - cowgirl.json"
  )

  itemprefab40.AddTexture(itemprefab40_cowgirl_texture3)

  local itemgameid40 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab40)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid40)

  local itemprefab41 = ModUtilities.CreateItemPrefab()
  itemprefab41.Name = "Par de piercings nos mamilos"
  itemprefab41.Description =
    "Par de piercings circulares. Graças ao uso de ímãs fortes, não há necessidade de perfurar a pele do bot.<color=#00FF00>\nEste item ainda está em sua embalagem. Você tem que desempacotar primeiro!</color>"
  itemprefab41.Price = 15000
  itemprefab41.IsIllegal = false
  itemprefab41.HasQuality = false
  itemprefab41.ThrowingOutForbidden = false
  itemprefab41.IsStackable = false
  itemprefab41.Category = ItemCategory.Package
  itemprefab41.CanChangeColor = false
  itemprefab41.ColorSlots = {}
  itemprefab41.Partners = {}
  itemprefab41.ScratchType = ScratchTextureType.Universal
  itemprefab41.SusModifiers = {}

  local itemgameid41 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab41)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid41)

  local itemprefab42 = ModUtilities.CreateItemPrefab()
  itemprefab42.Name = "Sombra"
  itemprefab42.Description =
    "Um cosmético colorido aplicado nas pálpebras ou na pele ao redor dos olhos para acentuá-los."
  itemprefab42.Price = 1200
  itemprefab42.SlotData = SlotEquipData.CreateInstance("EyeMakeup")
  itemprefab42.IsIllegal = false
  itemprefab42.HasQuality = false
  itemprefab42.ThrowingOutForbidden = false
  itemprefab42.IsStackable = false
  itemprefab42.Category = ItemCategory.Clothing
  itemprefab42.SubCategory = ItemSubCategory.Clothing_MakeUp
  itemprefab42.CanChangeColor = true
  itemprefab42.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab42.Partners = {}
  itemprefab42.ScratchType = ScratchTextureType.Universal
  itemprefab42.SusModifiers = {}

  local itemprefab42_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Sombra/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab42.AddTexture(
    itemprefab42_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemprefab42_doggy_texture1 =
    ModUtilities.GetPackedTexture(CurrentModGuid, "/Sombra/tex 2 - doggy.json")

  itemprefab42.AddTexture(itemprefab42_doggy_texture1)

  local itemgameid42 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab42)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid42)

  local itemprefab43 = ModUtilities.CreateItemPrefab()
  itemprefab43.Name = "Piercing de anel no septo"
  itemprefab43.Description =
    "Em formato de anel. Piercing que passa pela parte inferior do nariz entre as narinas. Graças aos ímãs, não é preciso qualquer furo!"
  itemprefab43.Price = 250
  itemprefab43.SlotData = SlotEquipData.CreateInstance("Septum")
  itemprefab43.IsIllegal = false
  itemprefab43.HasQuality = false
  itemprefab43.ThrowingOutForbidden = false
  itemprefab43.IsStackable = false
  itemprefab43.Category = ItemCategory.Clothing
  itemprefab43.SubCategory = ItemSubCategory.Clothing_Piercing
  itemprefab43.CanChangeColor = false
  itemprefab43.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab43.Partners = {}
  itemprefab43.ScratchType = ScratchTextureType.Universal
  itemprefab43.SusModifiers = {}

  local itemprefab43_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Piercing de anel no septo/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab43.AddTexture(
    itemprefab43_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemprefab43_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Piercing de anel no septo/tex 2 - doggy.json"
  )

  itemprefab43.AddTexture(itemprefab43_doggy_texture1)

  local itemgameid43 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab43)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid43)

  local itemprefab44 = ModUtilities.CreateItemPrefab()
  itemprefab44.Name = "Batom"
  itemprefab44.Description = "Destaca os lábios. Cor única."
  itemprefab44.Price = 400
  itemprefab44.SlotData = SlotEquipData.CreateInstance("Lips")
  itemprefab44.IsIllegal = false
  itemprefab44.HasQuality = false
  itemprefab44.ThrowingOutForbidden = false
  itemprefab44.IsStackable = false
  itemprefab44.Category = ItemCategory.Clothing
  itemprefab44.SubCategory = ItemSubCategory.Clothing_MakeUp
  itemprefab44.CanChangeColor = false
  itemprefab44.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor Principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab44.Partners = {}
  itemprefab44.ScratchType = ScratchTextureType.Universal
  itemprefab44.SusModifiers = {}

  local itemprefab44_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Batom/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab44.AddTexture(
    itemprefab44_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemprefab44_doggy_texture1 =
    ModUtilities.GetPackedTexture(CurrentModGuid, "/Batom/tex 2 - doggy.json")

  itemprefab44.AddTexture(itemprefab44_doggy_texture1)

  local itemgameid44 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab44)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid44)

  local itemprefab45 = ModUtilities.CreateItemPrefab()
  itemprefab45.Name = "Tênis esquerdo plano"
  itemprefab45.Description = "Tênis esquerdo simples."
  itemprefab45.Price = 500
  itemprefab45.SlotData = SlotEquipData.CreateInstance("ShoeL")
  itemprefab45.IsIllegal = false
  itemprefab45.HasQuality = false
  itemprefab45.ThrowingOutForbidden = false
  itemprefab45.IsStackable = false
  itemprefab45.Category = ItemCategory.Clothing
  itemprefab45.CanChangeColor = false
  itemprefab45.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab45.Partners = {}
  itemprefab45.ScratchType = ScratchTextureType.Universal
  itemprefab45.SusModifiers = {}

  local itemprefab45_interaction_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Tênis esquerdo plano/tex 1 - interaction.json"
  )

  itemprefab45.AddTexture(itemprefab45_interaction_texture0)

  local itemgameid45 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab45)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid45)

  local itemprefab46 = ModUtilities.CreateItemPrefab()
  itemprefab46.Name = "Tênis direito plano"
  itemprefab46.Description = "Tênis direito simples."
  itemprefab46.Price = 500
  itemprefab46.SlotData = SlotEquipData.CreateInstance("ShoeR")
  itemprefab46.IsIllegal = false
  itemprefab46.HasQuality = false
  itemprefab46.ThrowingOutForbidden = false
  itemprefab46.IsStackable = false
  itemprefab46.Category = ItemCategory.Clothing
  itemprefab46.CanChangeColor = false
  itemprefab46.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab46.Partners = {}
  itemprefab46.ScratchType = ScratchTextureType.Universal
  itemprefab46.SusModifiers = {}

  local itemprefab46_interaction_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Tênis direito plano/tex 1 - interaction.json"
  )

  itemprefab46.AddTexture(itemprefab46_interaction_texture0)

  local itemgameid46 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab46)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid46)

  local itemprefab47 = ModUtilities.CreateItemPrefab()
  itemprefab47.Name = "Par de tênis planos"
  itemprefab47.Description =
    "Um par de tênis simples<color=#00FF00>\nEste item ainda está em seu pacote. Você precisa abri-lo primeiro!</color>"
  itemprefab47.Price = 1000
  itemprefab47.IsIllegal = false
  itemprefab47.HasQuality = false
  itemprefab47.ThrowingOutForbidden = false
  itemprefab47.IsStackable = false
  itemprefab47.Category = ItemCategory.Package
  itemprefab47.CanChangeColor = false
  itemprefab47.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab47.Partners = {}
  itemprefab47.ScratchType = ScratchTextureType.Universal
  itemprefab47.SusModifiers = {}

  local itemgameid47 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab47)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid47)

  local itemprefab48 = ModUtilities.CreateItemPrefab()
  itemprefab48.Name = "Cabelo com Hiper camuflagem"
  itemprefab48.Description =
    "Provavelmente melhor que uma peruca.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>"
  itemprefab48.Price = 19250
  itemprefab48.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "HairMain"
    sd.ControllerElementOverride = {
      "Hair0_Top",
      "Hair0_Front",
      "Hair0_Side",
      "Hair0_Back",
      "Hair0_Braid",
      "Eyebrows_BasicEyebrows",
    }
    sd.ElementActiveConditions = {
      ItemScopeConditionSpecialVariable.CreateInstance("Ahoge"),
      ItemScopeConditionSpecialVariable.CreateInstance("Front"),
      ItemScopeConditionSpecialVariable.CreateInstance("Side"),
      ItemScopeConditionSpecialVariable.CreateInstance("Back"),
      ItemScopeConditionSpecialVariable.CreateInstance("Braid"),
    }
    sd.TextureActiveConditions = {}
    return sd
  end)()
  itemprefab48.ItemModifiableVariables = {
    ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
      "Ahoge",
      SimpleLocalizedString.CreateInstanceReplacement("Cabelo pra cima"),
      true
    ),
    ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
      "Front",
      SimpleLocalizedString.CreateInstanceReplacement("Frente"),
      true
    ),
    ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
      "Side",
      SimpleLocalizedString.CreateInstanceReplacement("Lado"),
      true
    ),
    ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
      "Back",
      SimpleLocalizedString.CreateInstanceReplacement("Parte de trás"),
      true
    ),
    ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable(
      "Braid",
      SimpleLocalizedString.CreateInstanceReplacement("Trança"),
      true
    ),
  }
  itemprefab48.ItemModifiableVariablesRequirements =
    { AtLeastOneBoolVariableTrueRequirement.CreateInstance({ 0, 1, 2, 3, 4 }) }
  itemprefab48.IsIllegal = true
  itemprefab48.HasQuality = true
  itemprefab48.ThrowingOutForbidden = false
  itemprefab48.IsStackable = false
  itemprefab48.Category = ItemCategory.Modules
  itemprefab48.CanChangeColor = true
  itemprefab48.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Cor secundária",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Cor do laço de cabelo",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab48.Partners = {}
  itemprefab48.ScratchType = ScratchTextureType.Universal
  itemprefab48.SusModifiers = {}

  local itemprefab48_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 1 - doggy.json"
  )

  itemprefab48.AddTexture(itemprefab48_doggy_texture0)

  local itemprefab48_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 2 - doggy.json"
  )

  itemprefab48.AddTexture(itemprefab48_doggy_texture1)

  local itemprefab48_doggy_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 3 - doggy.json"
  )

  itemprefab48.AddTexture(itemprefab48_doggy_texture2)

  local itemprefab48_doggy_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 4 - doggy.json"
  )

  itemprefab48.AddTexture(itemprefab48_doggy_texture3)

  local itemprefab48_doggy_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 5 - doggy.json"
  )

  itemprefab48.AddTexture(itemprefab48_doggy_texture4)

  local itemprefab48_doggy_texture5 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 6 - doggy.json"
  )

  itemprefab48.AddTexture(itemprefab48_doggy_texture5)

  local itemprefab48_missionary_texture6 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 7 - missionary.json"
  )

  itemprefab48.AddTexture(itemprefab48_missionary_texture6)

  local itemprefab48_missionary_texture7 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 8 - missionary.json"
  )

  itemprefab48.AddTexture(itemprefab48_missionary_texture7)

  local itemprefab48_missionary_texture8 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 9 - missionary.json"
  )

  itemprefab48.AddTexture(itemprefab48_missionary_texture8)

  local itemprefab48_missionary_texture9 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 10 - missionary.json"
  )

  itemprefab48.AddTexture(itemprefab48_missionary_texture9)

  local itemprefab48_missionary_texture10 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 11 - missionary.json"
  )

  itemprefab48.AddTexture(itemprefab48_missionary_texture10)

  local itemprefab48_missionary_texture11 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 12 - missionary.json"
  )

  itemprefab48.AddTexture(itemprefab48_missionary_texture11)

  local itemprefab48_interaction_texture12 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 13 - interaction.json"
  )

  itemprefab48.AddTexture(itemprefab48_interaction_texture12)

  local itemprefab48_interaction_texture13 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 14 - interaction.json"
  )

  itemprefab48.AddTexture(itemprefab48_interaction_texture13)

  local itemprefab48_interaction_texture14 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 15 - interaction.json"
  )

  itemprefab48.AddTexture(itemprefab48_interaction_texture14)

  local itemprefab48_interaction_texture15 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 16 - interaction.json"
  )

  itemprefab48.AddTexture(itemprefab48_interaction_texture15)

  local itemprefab48_interaction_texture16 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 17 - interaction.json"
  )

  itemprefab48.AddTexture(itemprefab48_interaction_texture16)

  local itemprefab48_interaction_texture17 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 18 - interaction.json"
  )

  itemprefab48.AddTexture(itemprefab48_interaction_texture17)

  local itemprefab48_blowjob_texture18 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 19 - blowjob.json"
  )

  itemprefab48.AddTexture(itemprefab48_blowjob_texture18)

  local itemprefab48_blowjob_texture19 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 20 - blowjob.json"
  )

  itemprefab48.AddTexture(itemprefab48_blowjob_texture19)

  local itemprefab48_blowjob_texture20 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 21 - blowjob.json"
  )

  itemprefab48.AddTexture(itemprefab48_blowjob_texture20)

  local itemprefab48_blowjob_texture21 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 22 - blowjob.json"
  )

  itemprefab48.AddTexture(itemprefab48_blowjob_texture21)

  local itemprefab48_blowjob_texture22 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 23 - blowjob.json"
  )

  itemprefab48.AddTexture(itemprefab48_blowjob_texture22)

  local itemprefab48_blowjob_texture23 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 24 - blowjob.json"
  )

  itemprefab48.AddTexture(itemprefab48_blowjob_texture23)

  local itemprefab48_cowgirl_texture24 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 25 - cowgirl.json"
  )

  itemprefab48.AddTexture(itemprefab48_cowgirl_texture24)

  local itemprefab48_cowgirl_texture25 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 26 - cowgirl.json"
  )

  itemprefab48.AddTexture(itemprefab48_cowgirl_texture25)

  local itemprefab48_cowgirl_texture26 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 27 - cowgirl.json"
  )

  itemprefab48.AddTexture(itemprefab48_cowgirl_texture26)

  local itemprefab48_cowgirl_texture27 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 28 - cowgirl.json"
  )

  itemprefab48.AddTexture(itemprefab48_cowgirl_texture27)

  local itemprefab48_cowgirl_texture28 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 29 - cowgirl.json"
  )

  itemprefab48.AddTexture(itemprefab48_cowgirl_texture28)

  local itemprefab48_cowgirl_texture29 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 30 - cowgirl.json"
  )

  itemprefab48.AddTexture(itemprefab48_cowgirl_texture29)

  local itemprefab48_shower_texture30 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 31 - shower.json"
  )

  itemprefab48.AddTexture(itemprefab48_shower_texture30)

  local itemprefab48_shower_texture31 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 32 - shower.json"
  )

  itemprefab48.AddTexture(itemprefab48_shower_texture31)

  local itemprefab48_shower_texture32 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 33 - shower.json"
  )

  itemprefab48.AddTexture(itemprefab48_shower_texture32)

  local itemprefab48_shower_texture33 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cabelo com Hiper camuflagem/tex 34 - shower.json"
  )

  itemprefab48.AddTexture(itemprefab48_shower_texture33)

  local itemgameid48 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab48)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid48)

  local itemprefab49 = ModUtilities.CreateItemPrefab()
  itemprefab49.Name = "Franja de cobertura ocular com Hiper Camuflagemm"
  itemprefab49.Description =
    "Franja que cobre os olhos do bot.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>"
  itemprefab49.Price = 19250
  itemprefab49.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "HairAdditional"
    sd.ControllerElementOverride = { "Hair2_Front" }
    return sd
  end)()
  itemprefab49.IsIllegal = true
  itemprefab49.HasQuality = true
  itemprefab49.ThrowingOutForbidden = false
  itemprefab49.IsStackable = false
  itemprefab49.Category = ItemCategory.Modules
  itemprefab49.CanChangeColor = true
  itemprefab49.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor Principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Cor Secundária",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab49.Partners = {}
  itemprefab49.ScratchType = ScratchTextureType.Universal
  itemprefab49.SusModifiers = {}

  local itemprefab49_blowjob_cowgirl_interaction_missionary_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Franja de cobertura ocular com Hiper Camuflagemm/tex 1 - blowjob, cowgirl, interaction, missionary.json"
    )

  itemprefab49.AddTexture(
    itemprefab49_blowjob_cowgirl_interaction_missionary_texture0
  )

  local itemprefab49_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Franja de cobertura ocular com Hiper Camuflagemm/tex 2 - doggy.json"
  )

  itemprefab49.AddTexture(itemprefab49_doggy_texture1)

  local itemprefab49_missionary_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Franja de cobertura ocular com Hiper Camuflagemm/tex 3 - missionary.json"
  )

  itemprefab49.AddTexture(itemprefab49_missionary_texture2)

  local itemprefab49_interaction_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Franja de cobertura ocular com Hiper Camuflagemm/tex 4 - interaction.json"
  )

  itemprefab49.AddTexture(itemprefab49_interaction_texture3)

  local itemprefab49_blowjob_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Franja de cobertura ocular com Hiper Camuflagemm/tex 5 - blowjob.json"
  )

  itemprefab49.AddTexture(itemprefab49_blowjob_texture4)

  local itemprefab49_cowgirl_texture5 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Franja de cobertura ocular com Hiper Camuflagemm/tex 6 - cowgirl.json"
  )

  itemprefab49.AddTexture(itemprefab49_cowgirl_texture5)

  local itemgameid49 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab49)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid49)

  local itemprefab50 = ModUtilities.CreateItemPrefab()
  itemprefab50.Name = "Cabelo Arco-ìris"
  itemprefab50.Description =
    "Um tipo muito raro de módulo de cabelo que muda de cor ao longo do tempo."
  itemprefab50.Price = 180000
  itemprefab50.SlotData = SlotEquipData.CreateInstance("HairAugmentation")
  itemprefab50.IsIllegal = true
  itemprefab50.HasQuality = false
  itemprefab50.ThrowingOutForbidden = false
  itemprefab50.IsStackable = false
  itemprefab50.Category = ItemCategory.Modules
  itemprefab50.CanChangeColor = false
  itemprefab50.ColorSlots = {}
  itemprefab50.Partners = {}
  itemprefab50.ScratchType = ScratchTextureType.Universal
  itemprefab50.SusModifiers = {}

  local itemgameid50 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab50)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid50)

  local itemprefab51 = ModUtilities.CreateItemPrefab()
  itemprefab51.Name = "Sabonete colorido"
  itemprefab51.Description =
    "Sabonete de melhor qualidade. Não tem muita diferença do básico, mas tem uma vantagem: a cor torna-o mais divertido! Pode ser usado no banho."
  itemprefab51.Price = 4200
  itemprefab51.IsIllegal = false
  itemprefab51.HasQuality = false
  itemprefab51.ThrowingOutForbidden = false
  itemprefab51.IsStackable = false
  itemprefab51.Category = ItemCategory.Soap
  itemprefab51.CanChangeColor = false
  itemprefab51.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor 0",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab51.Partners = {}
  itemprefab51.ScratchType = ScratchTextureType.Universal
  itemprefab51.SusModifiers = {}

  local itemgameid51 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab51)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid51)

  local itemprefab52 = ModUtilities.CreateItemPrefab()
  itemprefab52.Name = "Vara de Pesca"
  itemprefab52.Description =
    "Vara de pesca básica. O suficiente para pegar peixes pequenos. "
  itemprefab52.Price = 1000
  itemprefab52.AllowedModifiersData =
    AllowedModifiers.GetCommon(CommonAllowedModifiersEnum.FishingRod)
  itemprefab52.SlotData = SlotEquipData.CreateInstance("Anon_FishingRod")
  itemprefab52.IsIllegal = false
  itemprefab52.HasQuality = false
  itemprefab52.ThrowingOutForbidden = false
  itemprefab52.IsStackable = false
  itemprefab52.Category = ItemCategory.AnonEquip
  itemprefab52.CanChangeColor = false
  itemprefab52.ColorSlots = {}
  itemprefab52.Partners = {}
  itemprefab52.ScratchType = ScratchTextureType.Universal
  itemprefab52.SusModifiers = {}
  itemprefab52.FishingRodItemPrefabData =
    FishingRodItemPrefabData.CreateInstance(0.2, 0.2, 0.2, 2.5)

  local itemgameid52 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab52)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid52)

  local itemprefab53 = ModUtilities.CreateItemPrefab()
  itemprefab53.Name = "Bluegill"
  itemprefab53.Description =
    "Esse peixe tem o corpo achatado dos lados e uma cor azul distinta na mandíbula.\n"
  itemprefab53.Price = 132
  itemprefab53.IsIllegal = false
  itemprefab53.HasQuality = false
  itemprefab53.ThrowingOutForbidden = false
  itemprefab53.IsStackable = false
  itemprefab53.Category = ItemCategory.Fish
  itemprefab53.CanChangeColor = false
  itemprefab53.ColorSlots = {}
  itemprefab53.Partners = {}
  itemprefab53.ScratchType = ScratchTextureType.Universal
  itemprefab53.SusModifiers = {}
  itemprefab53.FishData = (function()
    local fd = FishItemPrefabData.CreateInstance()
    fd.SizeDistribution01 = 0.5
    fd.MaxWeightKg = 2.2
    fd.StrengthMultiplier = 1
    fd.BehaviourType = FishingCatchBehaviourType.Fighter
    fd.FishPreferences = (function()
      local fpd = FishPreferences.CreateInstance()
      fpd.FishingBaitTypesPreference = {
        [FishingBaitType.WormBait] = 0.7,
        [FishingBaitType.InsectBait] = 0.7,
        [FishingBaitType.MeatBait] = 0.3,
        [FishingBaitType.FishBait] = 0.3,
        [FishingBaitType.LiveFishBait] = 0.1,
        [FishingBaitType.PlantBait] = 0.5,
        [FishingBaitType.CrustaceanBait] = 0.5,
        [FishingBaitType.MolluskBait] = 0.5,
      }
      fpd.SpecificFishingBaitItemPreference = {}
      fpd.MostActiveTimeHour = 0 -- 0-23 Hour the fish is most active at.
      fpd.MostActiveHourRange = 0 -- 0-12 How many hours of difference does the most active hour allow
      fpd.MostActiveHourStrength01 = 0 -- 0-1 float value meaning how strong the preference of the "most active time" is.
      return fpd
    end)()
    return fd
  end)()
  itemprefab53.EdibleData = (function()
    local ntf = function(item, nutritionProfile)
      -- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
      -- For example:
      nutritionProfile.Satiation.Value = 0.1
    end
    local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Fish, ntf)
    return ed
  end)()

  local itemgameid53 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab53)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid53)

  local itemprefab54 = ModUtilities.CreateItemPrefab()
  itemprefab54.Name = "Isca de Minhoca"
  itemprefab54.Description =
    "Minhoca. Isca que pode ser usada para pegar peixes que gostam de minhocas."
  itemprefab54.Price = 100
  itemprefab54.SlotData = SlotEquipData.CreateInstance("Anon_FishingBait")
  itemprefab54.IsIllegal = false
  itemprefab54.HasQuality = false
  itemprefab54.ThrowingOutForbidden = false
  itemprefab54.IsStackable = true
  itemprefab54.Category = ItemCategory.AnonEquip
  itemprefab54.CanChangeColor = false
  itemprefab54.ColorSlots = {}
  itemprefab54.Partners = {}
  itemprefab54.ScratchType = ScratchTextureType.Universal
  itemprefab54.SusModifiers = {}
  itemprefab54.FishingBaitItemPrefabData =
    FishingBaitItemPrefabData.CreateInstance({ [FishingBaitType.WormBait] = 1 })

  local itemgameid54 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab54)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid54)

  local itemprefab55 = ModUtilities.CreateItemPrefab()
  itemprefab55.Name = "Energético"
  itemprefab55.Description =
    "Te fornece forças para foder (ou jogar) a noite toda."
  itemprefab55.Price = 20
  itemprefab55.IsIllegal = false
  itemprefab55.HasQuality = false
  itemprefab55.ThrowingOutForbidden = false
  itemprefab55.IsStackable = true
  itemprefab55.Category = ItemCategory.Food
  itemprefab55.CanChangeColor = false
  itemprefab55.ColorSlots = {}
  itemprefab55.Partners = {}
  itemprefab55.ScratchType = ScratchTextureType.Universal
  itemprefab55.SusModifiers = {}
  itemprefab55.EdibleData = (function()
    local ntf = function(item, nutritionProfile)
      -- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
      -- For example:
      nutritionProfile.Satiation.Value = 0.1
    end
    local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Beverage, ntf)
    return ed
  end)()

  local itemgameid55 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab55)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid55)

  local itemprefab56 = ModUtilities.CreateItemPrefab()
  itemprefab56.Name = "Salgadinhos"
  itemprefab56.Description = "*nom nom*"
  itemprefab56.Price = 5
  itemprefab56.IsIllegal = false
  itemprefab56.HasQuality = false
  itemprefab56.ThrowingOutForbidden = false
  itemprefab56.IsStackable = true
  itemprefab56.Category = ItemCategory.Food
  itemprefab56.CanChangeColor = false
  itemprefab56.ColorSlots = {}
  itemprefab56.Partners = {}
  itemprefab56.ScratchType = ScratchTextureType.Universal
  itemprefab56.SusModifiers = {}
  itemprefab56.EdibleData = (function()
    local ntf = function(item, nutritionProfile)
      -- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
      -- For example:
      nutritionProfile.Satiation.Value = 0.1
    end
    local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
    return ed
  end)()

  local itemgameid56 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab56)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid56)

  local itemprefab57 = ModUtilities.CreateItemPrefab()
  itemprefab57.Name = "Batatas"
  itemprefab57.Description = "Ingrediente básico utilizado na culinária."
  itemprefab57.Price = 1800
  itemprefab57.IsIllegal = false
  itemprefab57.HasQuality = false
  itemprefab57.ThrowingOutForbidden = false
  itemprefab57.IsStackable = true
  itemprefab57.Category = ItemCategory.CookingIngredient
  itemprefab57.CanChangeColor = false
  itemprefab57.ColorSlots = {}
  itemprefab57.Partners = {}
  itemprefab57.ScratchType = ScratchTextureType.Universal
  itemprefab57.SusModifiers = {}
  itemprefab57.EdibleData = (function()
    local ntf = function(item, nutritionProfile)
      -- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
      -- For example:
      nutritionProfile.Satiation.Value = 0.1
    end
    local ed =
      EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.MainVegetable, ntf)
    return ed
  end)()

  local itemgameid57 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab57)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid57)

  local itemprefab58 = ModUtilities.CreateItemPrefab()
  itemprefab58.Name = "Cauda de Gato"
  itemprefab58.Description =
    "Cauda de gato. Não é proporcional a um gato de verdade. O tamanho é ajustado para caber em sexbots humanos."
  itemprefab58.Price = 14000
  itemprefab58.SlotData = SlotEquipData.CreateInstance("Tail")
  itemprefab58.IsIllegal = true
  itemprefab58.HasQuality = false
  itemprefab58.ThrowingOutForbidden = false
  itemprefab58.IsStackable = false
  itemprefab58.Category = ItemCategory.Modules
  itemprefab58.CanChangeColor = false
  itemprefab58.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
  }
  itemprefab58.Partners = {}
  itemprefab58.ScratchType = ScratchTextureType.Universal
  itemprefab58.SusModifiers = {}

  local itemprefab58_doggy_texture0 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cauda de Gato/tex 1 - doggy.json"
  )

  itemprefab58.AddTexture(itemprefab58_doggy_texture0)

  local itemprefab58_missionary_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cauda de Gato/tex 2 - missionary.json"
  )

  itemprefab58.AddTexture(itemprefab58_missionary_texture1)

  local itemprefab58_interaction_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cauda de Gato/tex 3 - interaction.json"
  )

  itemprefab58.AddTexture(itemprefab58_interaction_texture2)

  local itemprefab58_blowjob_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cauda de Gato/tex 4 - blowjob.json"
  )

  itemprefab58.AddTexture(itemprefab58_blowjob_texture3)

  local itemprefab58_cowgirl_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Cauda de Gato/tex 5 - cowgirl.json"
  )

  itemprefab58.AddTexture(itemprefab58_cowgirl_texture4)

  local itemgameid58 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab58)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid58)

  local itemprefab59 = ModUtilities.CreateItemPrefab()
  itemprefab59.Name = "Módulo de tamanho da coxa"
  itemprefab59.Description =
    "Permite modificar o tamanho das coxas até certo ponto."
  itemprefab59.Price = 200000
  itemprefab59.SlotData = SlotEquipData.CreateInstance("ThighBodyModules")
  itemprefab59.ItemModifiableVariables = {
    ItemModifiableVariableFactory.CreateInstanceFloatVariable(
      "thighSize",
      SimpleLocalizedString.CreateInstanceReplacement("Tamanho da coxa"),
      0.5
    ),
  }
  itemprefab59.IsIllegal = true
  itemprefab59.HasQuality = false
  itemprefab59.ThrowingOutForbidden = false
  itemprefab59.IsStackable = false
  itemprefab59.Category = ItemCategory.Modules
  itemprefab59.CanChangeColor = false
  itemprefab59.ColorSlots = {}
  itemprefab59.Partners = {}
  itemprefab59.ScratchType = ScratchTextureType.Universal
  itemprefab59.SusModifiers = {}

  local itemgameid59 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab59)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid59)

  local itemprefab60 = ModUtilities.CreateItemPrefab()
  itemprefab60.Name = "Módulo de tamanho da panturrilha"
  itemprefab60.Description =
    "Permite modificar o tamanho das panturrilhas até certo ponto."
  itemprefab60.Price = 100000
  itemprefab60.SlotData = SlotEquipData.CreateInstance("CalfBodyModules")
  itemprefab60.ItemModifiableVariables = {
    ItemModifiableVariableFactory.CreateInstanceFloatVariable(
      "calfSize",
      SimpleLocalizedString.CreateInstanceReplacement("Tamanho da panturrilha"),
      0.5
    ),
  }
  itemprefab60.IsIllegal = true
  itemprefab60.HasQuality = false
  itemprefab60.ThrowingOutForbidden = false
  itemprefab60.IsStackable = false
  itemprefab60.Category = ItemCategory.Modules
  itemprefab60.CanChangeColor = false
  itemprefab60.ColorSlots = {}
  itemprefab60.Partners = {}
  itemprefab60.ScratchType = ScratchTextureType.Universal
  itemprefab60.SusModifiers = {}

  local itemgameid60 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab60)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid60)

  local itemprefab61 = ModUtilities.CreateItemPrefab()
  itemprefab61.Name = "Módulo de tamanho dos pés"
  itemprefab61.Description =
    "Permite modificar o tamanho dos pés até certo ponto."
  itemprefab61.Price = 690420
  itemprefab61.SlotData = SlotEquipData.CreateInstance("FeetBodyModules")
  itemprefab61.ItemModifiableVariables = {
    ItemModifiableVariableFactory.CreateInstanceFloatVariable(
      "feetLength",
      SimpleLocalizedString.CreateInstanceReplacement("Comprimento do pé"),
      0.5
    ),
    ItemModifiableVariableFactory.CreateInstanceFloatVariable(
      "feetWidth",
      SimpleLocalizedString.CreateInstanceReplacement("Largura do pé"),
      0.5
    ),
  }
  itemprefab61.IsIllegal = true
  itemprefab61.HasQuality = false
  itemprefab61.ThrowingOutForbidden = false
  itemprefab61.IsStackable = false
  itemprefab61.Category = ItemCategory.Modules
  itemprefab61.CanChangeColor = false
  itemprefab61.ColorSlots = {}
  itemprefab61.Partners = {}
  itemprefab61.ScratchType = ScratchTextureType.Universal
  itemprefab61.SusModifiers = {}

  local itemgameid61 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab61)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid61)

  local itemprefab62 = ModUtilities.CreateItemPrefab()
  itemprefab62.Name = "Módulo de tamanho de peito"
  itemprefab62.Description =
    "Permite que você modifique o tamanho de seus seios até certo ponto."
  itemprefab62.Price = 12000000
  itemprefab62.SlotData = SlotEquipData.CreateInstance("BoobsBodyModules")
  itemprefab62.ItemModifiableVariables = {
    ItemModifiableVariableFactory.CreateInstanceFloatVariable(
      "boobSize",
      SimpleLocalizedString.CreateInstanceReplacement("Tamanho do peito"),
      0.5
    ),
  }
  itemprefab62.IsIllegal = true
  itemprefab62.HasQuality = false
  itemprefab62.ThrowingOutForbidden = false
  itemprefab62.IsStackable = false
  itemprefab62.Category = ItemCategory.Modules
  itemprefab62.CanChangeColor = false
  itemprefab62.ColorSlots = {}
  itemprefab62.Partners = {}
  itemprefab62.ScratchType = ScratchTextureType.Universal
  itemprefab62.SusModifiers = {}

  local itemgameid62 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab62)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid62)

  local itemprefab63 = ModUtilities.CreateItemPrefab()
  itemprefab63.Name = "Módulo de tamanho de bunda"
  itemprefab63.Description =
    "Permite que você modifique o tamanho de sua bunda até certo ponto."
  itemprefab63.Price = 4000000
  itemprefab63.SlotData = SlotEquipData.CreateInstance("AssBodyModules")
  itemprefab63.ItemModifiableVariables = {
    ItemModifiableVariableFactory.CreateInstanceFloatVariable(
      "assSize",
      SimpleLocalizedString.CreateInstanceReplacement("Tamanho da bunda"),
      0.5
    ),
  }
  itemprefab63.IsIllegal = true
  itemprefab63.HasQuality = false
  itemprefab63.ThrowingOutForbidden = false
  itemprefab63.IsStackable = false
  itemprefab63.Category = ItemCategory.Modules
  itemprefab63.CanChangeColor = false
  itemprefab63.ColorSlots = {}
  itemprefab63.Partners = {}
  itemprefab63.ScratchType = ScratchTextureType.Universal
  itemprefab63.SusModifiers = {}

  local itemgameid63 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab63)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid63)

  local itemprefab64 = ModUtilities.CreateItemPrefab()
  itemprefab64.Name = "Moletom Dogecoin"
  itemprefab64.Description =
    "Um moletom folgado com o design de um DogeCoin. Aparentemente, essa criptomoeda é usada até hoje."
  itemprefab64.Price = 15000
  itemprefab64.SlotData = (function()
    local sd = SlotEquipData.CreateInstance()
    sd.TargetSlotString = "UpperBodyOuter"
    sd.ControllerElementOverride = { "UpperBodyOuter_Hoodie" }
    sd.SetRequiredSlotsString({ "ArmL", "ArmR" })
    return sd
  end)()
  itemprefab64.IsIllegal = false
  itemprefab64.HasQuality = false
  itemprefab64.ThrowingOutForbidden = false
  itemprefab64.IsStackable = false
  itemprefab64.Category = ItemCategory.Clothing
  itemprefab64.CanChangeColor = false
  itemprefab64.ColorSlots = {
    ColorSlot.CreateInstance(
      "Cor principal",
      ColorPaletteManager.GetColorPaletteByName("partpalette")
    ),
    ColorSlot.CreateInstance(
      "Cor do barbante",
      ColorPaletteManager.GetColorPaletteByName("grayscalepalette")
    ),
  }
  itemprefab64.Partners = {}
  itemprefab64.ScratchType = ScratchTextureType.Universal
  itemprefab64.SusModifiers = {
    SusModifier.CreateInstance(SusArea.UpperBody, 0.8),
    SusModifier.CreateInstance(SusArea.ArmL, 0.8),
    SusModifier.CreateInstance(SusArea.ArmR, 0.8),
  }

  local itemprefab64_missionary_doggy_blowjob_cowgirl_interaction_shower_texture0 =
    ModUtilities.GetPackedTexture(
      CurrentModGuid,
      "/Moletom Dogecoin/tex 1 - missionary, doggy, blowjob, cowgirl, interaction, shower.json"
    )

  itemprefab64.AddTexture(
    itemprefab64_missionary_doggy_blowjob_cowgirl_interaction_shower_texture0
  )

  local itemprefab64_doggy_texture1 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Moletom Dogecoin/tex 2 - doggy.json"
  )

  itemprefab64.AddTexture(itemprefab64_doggy_texture1)

  local itemprefab64_missionary_texture2 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Moletom Dogecoin/tex 3 - missionary.json"
  )

  itemprefab64.AddTexture(itemprefab64_missionary_texture2)

  local itemprefab64_interaction_texture3 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Moletom Dogecoin/tex 4 - interaction.json"
  )

  itemprefab64.AddTexture(itemprefab64_interaction_texture3)

  local itemprefab64_blowjob_texture4 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Moletom Dogecoin/tex 5 - blowjob.json"
  )

  itemprefab64.AddTexture(itemprefab64_blowjob_texture4)

  local itemprefab64_cowgirl_texture5 = ModUtilities.GetPackedTexture(
    CurrentModGuid,
    "/Moletom Dogecoin/tex 6 - cowgirl.json"
  )

  itemprefab64.AddTexture(itemprefab64_cowgirl_texture5)

  local itemgameid64 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab64)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid64)

  local itemprefab65 = ModUtilities.CreateItemPrefab()
  itemprefab65.Name = "Módulo de Personalidade Robô"
  itemprefab65.Description =
    "Deixa os diálogos mais “robóticos”. Beep boops e tal."
  itemprefab65.Price = 10000
  itemprefab65.SlotData = SlotEquipData.CreateInstance("PersonalityModule")
  itemprefab65.IsIllegal = true
  itemprefab65.HasQuality = false
  itemprefab65.ThrowingOutForbidden = false
  itemprefab65.IsPersonalityModule = true
  itemprefab65.IsStackable = false
  itemprefab65.Category = ItemCategory.Modules
  itemprefab65.CanChangeColor = false
  itemprefab65.ColorSlots = {}
  itemprefab65.Partners = {}
  itemprefab65.ScratchType = ScratchTextureType.Universal
  itemprefab65.SusModifiers = {}

  local itemgameid65 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab65)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid65)

  local itemprefab66 = ModUtilities.CreateItemPrefab()
  itemprefab66.Name = "Amplificador de Libido Cibernético ⚤"
  itemprefab66.Description =
    "Este item estranho aumenta a luxúria do seu sexbot. Devido ao DRM interno, ele só pode ser usado uma vez. USE COM CUIDADO!!!"
  itemprefab66.Price = 1500000
  itemprefab66.IsIllegal = false
  itemprefab66.HasQuality = false
  itemprefab66.ThrowingOutForbidden = true
  itemprefab66.IsStackable = false
  itemprefab66.Category = ItemCategory.Other
  itemprefab66.CanChangeColor = false
  itemprefab66.ColorSlots = {}
  itemprefab66.Partners = {}
  itemprefab66.ScratchType = ScratchTextureType.Universal
  itemprefab66.SusModifiers = {}

  local itemgameid66 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab66)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid66)
end

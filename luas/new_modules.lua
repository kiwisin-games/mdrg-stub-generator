--This script was generated automatically!
--Good luck with making the mod!
--May Sheep be with you!
do
  local itemprefab0 = ModUtilities.CreateItemPrefab()
  itemprefab0.Name = "Módulo de tamanho da coxa"
  itemprefab0.Description =
    "Permite modificar o tamanho das coxas até certo ponto."
  itemprefab0.Price = 200000
  itemprefab0.SlotData = SlotEquipData.CreateInstance("ThighBodyModules")
  itemprefab0.ItemModifiableVariables = {
    ItemModifiableVariableFactory.CreateInstanceFloatVariable(
      "thighSize",
      SimpleLocalizedString.CreateInstanceReplacement("Tamanho da coxa"),
      0.5
    ),
  }
  itemprefab0.IsIllegal = true
  itemprefab0.HasQuality = false
  itemprefab0.ThrowingOutForbidden = false
  itemprefab0.IsStackable = false
  itemprefab0.Category = ItemCategory.Modules
  itemprefab0.CanChangeColor = false
  itemprefab0.ColorSlots = {}
  itemprefab0.Partners = {}
  itemprefab0.ScratchType = ScratchTextureType.Universal
  itemprefab0.SusModifiers = {}

  local itemgameid0 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab0)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid0)

  local itemprefab1 = ModUtilities.CreateItemPrefab()
  itemprefab1.Name = "Módulo de tamanho da panturrilha"
  itemprefab1.Description =
    "Permite modificar o tamanho das panturrilhas até certo ponto."
  itemprefab1.Price = 100000
  itemprefab1.SlotData = SlotEquipData.CreateInstance("CalfBodyModules")
  itemprefab1.ItemModifiableVariables = {
    ItemModifiableVariableFactory.CreateInstanceFloatVariable(
      "calfSize",
      SimpleLocalizedString.CreateInstanceReplacement("Tamanho da panturrilha"),
      0.5
    ),
  }
  itemprefab1.IsIllegal = true
  itemprefab1.HasQuality = false
  itemprefab1.ThrowingOutForbidden = false
  itemprefab1.IsStackable = false
  itemprefab1.Category = ItemCategory.Modules
  itemprefab1.CanChangeColor = false
  itemprefab1.ColorSlots = {}
  itemprefab1.Partners = {}
  itemprefab1.ScratchType = ScratchTextureType.Universal
  itemprefab1.SusModifiers = {}

  local itemgameid1 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab1)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid1)

  local itemprefab2 = ModUtilities.CreateItemPrefab()
  itemprefab2.Name = "Módulo de tamanho dos pés"
  itemprefab2.Description =
    "Permite modificar o tamanho dos pés até certo ponto."
  itemprefab2.Price = 690420
  itemprefab2.SlotData = SlotEquipData.CreateInstance("FeetBodyModules")
  itemprefab2.ItemModifiableVariables = {
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
  itemprefab2.IsIllegal = true
  itemprefab2.HasQuality = false
  itemprefab2.ThrowingOutForbidden = false
  itemprefab2.IsStackable = false
  itemprefab2.Category = ItemCategory.Modules
  itemprefab2.CanChangeColor = false
  itemprefab2.ColorSlots = {}
  itemprefab2.Partners = {}
  itemprefab2.ScratchType = ScratchTextureType.Universal
  itemprefab2.SusModifiers = {}

  local itemgameid2 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab2)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid2)

  local itemprefab3 = ModUtilities.CreateItemPrefab()
  itemprefab3.Name = "Módulo de tamanho de peito"
  itemprefab3.Description =
    "Permite que você modifique o tamanho de seus seios até certo ponto."
  itemprefab3.Price = 12000000
  itemprefab3.SlotData = SlotEquipData.CreateInstance("BoobsBodyModules")
  itemprefab3.ItemModifiableVariables = {
    ItemModifiableVariableFactory.CreateInstanceFloatVariable(
      "boobSize",
      SimpleLocalizedString.CreateInstanceReplacement("Tamanho do peito"),
      0.5
    ),
  }
  itemprefab3.IsIllegal = true
  itemprefab3.HasQuality = false
  itemprefab3.ThrowingOutForbidden = false
  itemprefab3.IsStackable = false
  itemprefab3.Category = ItemCategory.Modules
  itemprefab3.CanChangeColor = false
  itemprefab3.ColorSlots = {}
  itemprefab3.Partners = {}
  itemprefab3.ScratchType = ScratchTextureType.Universal
  itemprefab3.SusModifiers = {}

  local itemgameid3 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab3)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid3)

  local itemprefab4 = ModUtilities.CreateItemPrefab()
  itemprefab4.Name = "Módulo de tamanho de bunda"
  itemprefab4.Description =
    "Permite que você modifique o tamanho de sua bunda até certo ponto."
  itemprefab4.Price = 4000000
  itemprefab4.SlotData = SlotEquipData.CreateInstance("AssBodyModules")
  itemprefab4.ItemModifiableVariables = {
    ItemModifiableVariableFactory.CreateInstanceFloatVariable(
      "assSize",
      SimpleLocalizedString.CreateInstanceReplacement("Tamanho da bunda"),
      0.5
    ),
  }
  itemprefab4.IsIllegal = true
  itemprefab4.HasQuality = false
  itemprefab4.ThrowingOutForbidden = false
  itemprefab4.IsStackable = false
  itemprefab4.Category = ItemCategory.Modules
  itemprefab4.CanChangeColor = false
  itemprefab4.ColorSlots = {}
  itemprefab4.Partners = {}
  itemprefab4.ScratchType = ScratchTextureType.Universal
  itemprefab4.SusModifiers = {}

  local itemgameid4 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab4)
  ModUtilities.AddSingleBuyItemToShop("ladyparts.ic", itemgameid4)

  local itemprefab5 = ModUtilities.CreateItemPrefab()
  itemprefab5.Name = "Destruidor Cibernético da Libido ⚲"
  itemprefab5.Description =
    "Este item estranho diminui significativamente a luxúria do seu sexbot. Por causa do DRM interno, ele só pode ser usado uma vez."
  itemprefab5.Price = 500000
  itemprefab5.IsIllegal = false
  itemprefab5.HasQuality = false
  itemprefab5.ThrowingOutForbidden = true
  itemprefab5.IsStackable = false
  itemprefab5.Category = ItemCategory.Other
  itemprefab5.CanChangeColor = false
  itemprefab5.ColorSlots = {}
  itemprefab5.Partners = {}
  itemprefab5.ScratchType = ScratchTextureType.Universal
  itemprefab5.SusModifiers = {}

  local itemgameid5 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab5)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid5)

  local itemprefab6 = ModUtilities.CreateItemPrefab()
  itemprefab6.Name = "Amplificador de Libido Cibernético ⚤"
  itemprefab6.Description =
    "Este item estranho aumenta a luxúria do seu sexbot. Devido ao DRM interno, ele só pode ser usado uma vez. USE COM CUIDADO!!!"
  itemprefab6.Price = 1500000
  itemprefab6.IsIllegal = false
  itemprefab6.HasQuality = false
  itemprefab6.ThrowingOutForbidden = true
  itemprefab6.IsStackable = false
  itemprefab6.Category = ItemCategory.Other
  itemprefab6.CanChangeColor = false
  itemprefab6.ColorSlots = {}
  itemprefab6.Partners = {}
  itemprefab6.ScratchType = ScratchTextureType.Universal
  itemprefab6.SusModifiers = {}

  local itemgameid6 =
    ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab6)
  ModUtilities.AddSingleBuyItemToShop("clothier", itemgameid6)
end

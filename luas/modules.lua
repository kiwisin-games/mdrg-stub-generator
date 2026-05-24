--This script was generated automatically!
--Good luck with making the mod!
--May Sheep be with you!
do

local itemprefab0 = ModUtilities.CreateItemPrefab()
itemprefab0.Name = 'Orelhas de gato'
itemprefab0.Description = 'Um item que unifica zoófilos e otakus. Edição furry limitada.'
itemprefab0.Price = 10000
itemprefab0.SlotData = (function()
	local sd = SlotEquipData.CreateInstance()
	sd.TargetSlotString = 'Head'
	sd.ControllerElementOverride = {'Head_CatEars'}
	return sd end)()
itemprefab0.IsIllegal = true
itemprefab0.HasQuality = true
itemprefab0.ThrowingOutForbidden = false
itemprefab0.IsStackable = false
itemprefab0.Category = ItemCategory.Modules
itemprefab0.SubCategory = ItemSubCategory.Modules_CatEars
itemprefab0.CanChangeColor = false
itemprefab0.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Cor dos pelos', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab0.Partners = {}
itemprefab0.ScratchType = ScratchTextureType.Universal
itemprefab0.SusModifiers = {}


local itemprefab0_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas de gato/tex 1 - doggy.json')

itemprefab0.AddTexture(itemprefab0_doggy_texture0)

local itemprefab0_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas de gato/tex 2 - missionary.json')

itemprefab0.AddTexture(itemprefab0_missionary_texture1)

local itemprefab0_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas de gato/tex 3 - interaction.json')

itemprefab0.AddTexture(itemprefab0_interaction_texture2)

local itemprefab0_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas de gato/tex 4 - blowjob.json')

itemprefab0.AddTexture(itemprefab0_blowjob_texture3)

local itemprefab0_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas de gato/tex 5 - cowgirl.json')

itemprefab0.AddTexture(itemprefab0_cowgirl_texture4)

local itemgameid0 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab0)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid0)


local itemprefab1 = ModUtilities.CreateItemPrefab()
itemprefab1.Name = 'Braço Esquerdo'
itemprefab1.Description = 'Braço esquerdo compatível com seu sexbot!'
itemprefab1.Price = 12500
itemprefab1.SlotData = SlotEquipData.CreateInstance('ArmL')
itemprefab1.IsIllegal = true
itemprefab1.HasQuality = true
itemprefab1.ThrowingOutForbidden = false
itemprefab1.IsStackable = false
itemprefab1.Category = ItemCategory.Modules
itemprefab1.CanChangeColor = false
itemprefab1.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab1.Partners = {}
itemprefab1.ScratchType = ScratchTextureType.Hard
itemprefab1.SusModifiers = {}


local itemprefab1_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo/tex 1 - doggy.json')

itemprefab1.AddTexture(itemprefab1_doggy_texture0)

local itemprefab1_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo/tex 2 - missionary.json')

itemprefab1.AddTexture(itemprefab1_missionary_texture1)

local itemprefab1_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo/tex 3 - interaction.json')

itemprefab1.AddTexture(itemprefab1_interaction_texture2)

local itemprefab1_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo/tex 4 - blowjob.json')

itemprefab1.AddTexture(itemprefab1_blowjob_texture3)

local itemprefab1_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo/tex 5 - cowgirl.json')

itemprefab1.AddTexture(itemprefab1_cowgirl_texture4)

local itemprefab1_shower_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo/tex 6 - shower.json')

itemprefab1.AddTexture(itemprefab1_shower_texture5)

local itemgameid1 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab1)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid1)


local itemprefab2 = ModUtilities.CreateItemPrefab()
itemprefab2.Name = 'Braço Direito'
itemprefab2.Description = 'Braço direito compatível com seu sexbot!'
itemprefab2.Price = 12500
itemprefab2.SlotData = SlotEquipData.CreateInstance('ArmR')
itemprefab2.IsIllegal = true
itemprefab2.HasQuality = true
itemprefab2.ThrowingOutForbidden = false
itemprefab2.IsStackable = false
itemprefab2.Category = ItemCategory.Modules
itemprefab2.CanChangeColor = false
itemprefab2.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab2.Partners = {}
itemprefab2.ScratchType = ScratchTextureType.Hard
itemprefab2.SusModifiers = {}


local itemprefab2_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito/tex 1 - doggy.json')

itemprefab2.AddTexture(itemprefab2_doggy_texture0)

local itemprefab2_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito/tex 2 - missionary.json')

itemprefab2.AddTexture(itemprefab2_missionary_texture1)

local itemprefab2_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito/tex 3 - interaction.json')

itemprefab2.AddTexture(itemprefab2_interaction_texture2)

local itemprefab2_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito/tex 4 - blowjob.json')

itemprefab2.AddTexture(itemprefab2_blowjob_texture3)

local itemprefab2_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito/tex 5 - cowgirl.json')

itemprefab2.AddTexture(itemprefab2_cowgirl_texture4)

local itemprefab2_shower_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito/tex 6 - shower.json')

itemprefab2.AddTexture(itemprefab2_shower_texture5)

local itemgameid2 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab2)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid2)


local itemprefab3 = ModUtilities.CreateItemPrefab()
itemprefab3.Name = 'Perna Esquerda'
itemprefab3.Description = 'Até uma única perna esquerda pode proporcionar muito prazer.'
itemprefab3.Price = 13500
itemprefab3.SlotData = SlotEquipData.CreateInstance('LegL')
itemprefab3.IsIllegal = true
itemprefab3.HasQuality = true
itemprefab3.ThrowingOutForbidden = false
itemprefab3.IsStackable = false
itemprefab3.Category = ItemCategory.Modules
itemprefab3.CanChangeColor = false
itemprefab3.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab3.Partners = {}
itemprefab3.ScratchType = ScratchTextureType.Hard
itemprefab3.SusModifiers = {}


local itemprefab3_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda/tex 1 - doggy.json')

itemprefab3.AddTexture(itemprefab3_doggy_texture0)

local itemprefab3_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda/tex 2 - missionary.json')

itemprefab3.AddTexture(itemprefab3_missionary_texture1)

local itemprefab3_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda/tex 3 - interaction.json')

itemprefab3.AddTexture(itemprefab3_interaction_texture2)

local itemprefab3_cowgirl_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda/tex 4 - cowgirl.json')

itemprefab3.AddTexture(itemprefab3_cowgirl_texture3)

local itemprefab3_shower_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda/tex 5 - shower.json')

itemprefab3.AddTexture(itemprefab3_shower_texture4)

local itemgameid3 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab3)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid3)


local itemprefab4 = ModUtilities.CreateItemPrefab()
itemprefab4.Name = 'Perna Direita'
itemprefab4.Description = 'Até uma única perna direita pode proporcionar muito prazer.'
itemprefab4.Price = 13500
itemprefab4.SlotData = SlotEquipData.CreateInstance('LegR')
itemprefab4.IsIllegal = true
itemprefab4.HasQuality = true
itemprefab4.ThrowingOutForbidden = false
itemprefab4.IsStackable = false
itemprefab4.Category = ItemCategory.Modules
itemprefab4.CanChangeColor = false
itemprefab4.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab4.Partners = {}
itemprefab4.ScratchType = ScratchTextureType.Hard
itemprefab4.SusModifiers = {}


local itemprefab4_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita/tex 1 - doggy.json')

itemprefab4.AddTexture(itemprefab4_doggy_texture0)

local itemprefab4_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita/tex 2 - missionary.json')

itemprefab4.AddTexture(itemprefab4_missionary_texture1)

local itemprefab4_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita/tex 3 - interaction.json')

itemprefab4.AddTexture(itemprefab4_interaction_texture2)

local itemprefab4_cowgirl_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita/tex 4 - cowgirl.json')

itemprefab4.AddTexture(itemprefab4_cowgirl_texture3)

local itemprefab4_shower_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita/tex 5 - shower.json')

itemprefab4.AddTexture(itemprefab4_shower_texture4)

local itemgameid4 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab4)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid4)


local itemprefab5 = ModUtilities.CreateItemPrefab()
itemprefab5.Name = 'Dentes Afiados'
itemprefab5.Description = 'Dê dentes mais afiados ao seu robô! ...Por que?'
itemprefab5.Price = 12500
itemprefab5.SlotData = (function()
	local sd = SlotEquipData.CreateInstance()
	sd.TargetSlotString = 'Teeth'
	sd.ControllerElementOverride = {'Teeth_SharpTeeth'}
	return sd end)()
itemprefab5.IsIllegal = true
itemprefab5.HasQuality = true
itemprefab5.ThrowingOutForbidden = false
itemprefab5.IsStackable = false
itemprefab5.Category = ItemCategory.Modules
itemprefab5.CanChangeColor = false
itemprefab5.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab5.Partners = {}
itemprefab5.ScratchType = ScratchTextureType.Hard
itemprefab5.SusModifiers = {}


local itemprefab5_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Dentes Afiados/tex 1 - missionary.json')

itemprefab5.AddTexture(itemprefab5_missionary_texture0)

local itemprefab5_interaction_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Dentes Afiados/tex 2 - interaction.json')

itemprefab5.AddTexture(itemprefab5_interaction_texture1)

local itemprefab5_blowjob_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Dentes Afiados/tex 3 - blowjob.json')

itemprefab5.AddTexture(itemprefab5_blowjob_texture2)

local itemprefab5_cowgirl_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Dentes Afiados/tex 4 - cowgirl.json')

itemprefab5.AddTexture(itemprefab5_cowgirl_texture3)

local itemprefab5_shower_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Dentes Afiados/tex 5 - shower.json')

itemprefab5.AddTexture(itemprefab5_shower_texture4)

local itemgameid5 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab5)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid5)


local itemprefab6 = ModUtilities.CreateItemPrefab()
itemprefab6.Name = 'Braço Esquerdo com Hiper Camuflagem'
itemprefab6.Description = 'Braço esquerdo compatível com seu sexbot!<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab6.Price = 18000
itemprefab6.SlotData = SlotEquipData.CreateInstance('ArmL')
itemprefab6.IsIllegal = true
itemprefab6.HasQuality = true
itemprefab6.ThrowingOutForbidden = false
itemprefab6.IsStackable = false
itemprefab6.Category = ItemCategory.Modules
itemprefab6.CanChangeColor = true
itemprefab6.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab6.Partners = {}
itemprefab6.ScratchType = ScratchTextureType.Hard
itemprefab6.SusModifiers = {}


local itemprefab6_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo com Hiper Camuflagem/tex 1 - doggy.json')

itemprefab6.AddTexture(itemprefab6_doggy_texture0)

local itemprefab6_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo com Hiper Camuflagem/tex 2 - missionary.json')

itemprefab6.AddTexture(itemprefab6_missionary_texture1)

local itemprefab6_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo com Hiper Camuflagem/tex 3 - interaction.json')

itemprefab6.AddTexture(itemprefab6_interaction_texture2)

local itemprefab6_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo com Hiper Camuflagem/tex 4 - blowjob.json')

itemprefab6.AddTexture(itemprefab6_blowjob_texture3)

local itemprefab6_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo com Hiper Camuflagem/tex 5 - cowgirl.json')

itemprefab6.AddTexture(itemprefab6_cowgirl_texture4)

local itemprefab6_shower_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo com Hiper Camuflagem/tex 6 - shower.json')

itemprefab6.AddTexture(itemprefab6_shower_texture5)

local itemgameid6 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab6)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid6)


local itemprefab7 = ModUtilities.CreateItemPrefab()
itemprefab7.Name = 'Braço Direito com Hiper Camuflagem'
itemprefab7.Description = 'Braço direito compatível com seu sexbot!<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab7.Price = 18000
itemprefab7.SlotData = SlotEquipData.CreateInstance('ArmR')
itemprefab7.IsIllegal = true
itemprefab7.HasQuality = true
itemprefab7.ThrowingOutForbidden = false
itemprefab7.IsStackable = false
itemprefab7.Category = ItemCategory.Modules
itemprefab7.CanChangeColor = true
itemprefab7.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab7.Partners = {}
itemprefab7.ScratchType = ScratchTextureType.Hard
itemprefab7.SusModifiers = {}


local itemprefab7_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito com Hiper Camuflagem/tex 1 - doggy.json')

itemprefab7.AddTexture(itemprefab7_doggy_texture0)

local itemprefab7_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito com Hiper Camuflagem/tex 2 - missionary.json')

itemprefab7.AddTexture(itemprefab7_missionary_texture1)

local itemprefab7_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito com Hiper Camuflagem/tex 3 - interaction.json')

itemprefab7.AddTexture(itemprefab7_interaction_texture2)

local itemprefab7_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito com Hiper Camuflagem/tex 4 - blowjob.json')

itemprefab7.AddTexture(itemprefab7_blowjob_texture3)

local itemprefab7_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito com Hiper Camuflagem/tex 5 - cowgirl.json')

itemprefab7.AddTexture(itemprefab7_cowgirl_texture4)

local itemprefab7_shower_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito com Hiper Camuflagem/tex 6 - shower.json')

itemprefab7.AddTexture(itemprefab7_shower_texture5)

local itemgameid7 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab7)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid7)


local itemprefab8 = ModUtilities.CreateItemPrefab()
itemprefab8.Name = 'Perna Esquerda com Hiper Camuflagem'
itemprefab8.Description = 'Até uma única perna esquerda pode proporcionar muito prazer.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab8.Price = 19000
itemprefab8.SlotData = SlotEquipData.CreateInstance('LegL')
itemprefab8.IsIllegal = true
itemprefab8.HasQuality = true
itemprefab8.ThrowingOutForbidden = false
itemprefab8.IsStackable = false
itemprefab8.Category = ItemCategory.Modules
itemprefab8.CanChangeColor = true
itemprefab8.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab8.Partners = {}
itemprefab8.ScratchType = ScratchTextureType.Hard
itemprefab8.SusModifiers = {}


local itemprefab8_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda com Hiper Camuflagem/tex 1 - doggy.json')

itemprefab8.AddTexture(itemprefab8_doggy_texture0)

local itemprefab8_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda com Hiper Camuflagem/tex 2 - missionary.json')

itemprefab8.AddTexture(itemprefab8_missionary_texture1)

local itemprefab8_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda com Hiper Camuflagem/tex 3 - interaction.json')

itemprefab8.AddTexture(itemprefab8_interaction_texture2)

local itemprefab8_cowgirl_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda com Hiper Camuflagem/tex 4 - cowgirl.json')

itemprefab8.AddTexture(itemprefab8_cowgirl_texture3)

local itemprefab8_shower_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda com Hiper Camuflagem/tex 5 - shower.json')

itemprefab8.AddTexture(itemprefab8_shower_texture4)

local itemgameid8 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab8)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid8)


local itemprefab9 = ModUtilities.CreateItemPrefab()
itemprefab9.Name = 'Perna Direita com Hiper Camuflagem'
itemprefab9.Description = 'Até uma única perna direita pode proporcionar muito prazer.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab9.Price = 19000
itemprefab9.SlotData = SlotEquipData.CreateInstance('LegR')
itemprefab9.IsIllegal = true
itemprefab9.HasQuality = true
itemprefab9.ThrowingOutForbidden = false
itemprefab9.IsStackable = false
itemprefab9.Category = ItemCategory.Modules
itemprefab9.CanChangeColor = true
itemprefab9.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab9.Partners = {}
itemprefab9.ScratchType = ScratchTextureType.Hard
itemprefab9.SusModifiers = {}


local itemprefab9_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita com Hiper Camuflagem/tex 1 - doggy.json')

itemprefab9.AddTexture(itemprefab9_doggy_texture0)

local itemprefab9_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita com Hiper Camuflagem/tex 2 - missionary.json')

itemprefab9.AddTexture(itemprefab9_missionary_texture1)

local itemprefab9_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita com Hiper Camuflagem/tex 3 - interaction.json')

itemprefab9.AddTexture(itemprefab9_interaction_texture2)

local itemprefab9_cowgirl_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita com Hiper Camuflagem/tex 4 - cowgirl.json')

itemprefab9.AddTexture(itemprefab9_cowgirl_texture3)

local itemprefab9_shower_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita com Hiper Camuflagem/tex 5 - shower.json')

itemprefab9.AddTexture(itemprefab9_shower_texture4)

local itemgameid9 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab9)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid9)


local itemprefab10 = ModUtilities.CreateItemPrefab()
itemprefab10.Name = 'Pele com Hiper Camuflagem'
itemprefab10.Description = 'De algum modo, funciona imediatamente.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab10.Price = 19000
itemprefab10.SlotData = SlotEquipData.CreateInstance('Skin')
itemprefab10.IsIllegal = true
itemprefab10.HasQuality = false
itemprefab10.ThrowingOutForbidden = false
itemprefab10.IsStackable = false
itemprefab10.Category = ItemCategory.Modules
itemprefab10.CanChangeColor = true
itemprefab10.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab10.Partners = {}
itemprefab10.ScratchType = ScratchTextureType.Universal
itemprefab10.SusModifiers = {SusModifier.CreateInstance(SusArea.Skin, 0.5)}


local itemprefab10_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper Camuflagem/tex 1 - doggy.json')

itemprefab10.AddTexture(itemprefab10_doggy_texture0)

local itemprefab10_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper Camuflagem/tex 2 - missionary.json')

itemprefab10.AddTexture(itemprefab10_missionary_texture1)

local itemprefab10_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper Camuflagem/tex 3 - interaction.json')

itemprefab10.AddTexture(itemprefab10_interaction_texture2)

local itemprefab10_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper Camuflagem/tex 4 - blowjob.json')

itemprefab10.AddTexture(itemprefab10_blowjob_texture3)

local itemprefab10_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper Camuflagem/tex 5 - cowgirl.json')

itemprefab10.AddTexture(itemprefab10_cowgirl_texture4)

local itemprefab10_shower_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper Camuflagem/tex 6 - shower.json')

itemprefab10.AddTexture(itemprefab10_shower_texture5)

local itemgameid10 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab10)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid10)


local itemprefab11 = ModUtilities.CreateItemPrefab()
itemprefab11.Name = 'Olhos com Hiper camuflagem'
itemprefab11.Description = 'Customize os olhos como achar melhor!<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab11.Price = 18000
itemprefab11.SlotData = SlotEquipData.CreateInstance('Eyes')
itemprefab11.IsIllegal = true
itemprefab11.HasQuality = true
itemprefab11.ThrowingOutForbidden = false
itemprefab11.IsStackable = false
itemprefab11.Category = ItemCategory.Modules
itemprefab11.CanChangeColor = true
itemprefab11.ColorSlots = {ColorSlot.CreateInstance('Pupila Esquerda', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Pupila Direita', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Íris Esquerda', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Íris Direita', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Esclera', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab11.Partners = {}
itemprefab11.ScratchType = ScratchTextureType.Hard
itemprefab11.SusModifiers = {}


local itemprefab11_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Olhos com Hiper camuflagem/tex 1 - doggy.json')

itemprefab11.AddTexture(itemprefab11_doggy_texture0)

local itemprefab11_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Olhos com Hiper camuflagem/tex 2 - missionary.json')

itemprefab11.AddTexture(itemprefab11_missionary_texture1)

local itemprefab11_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Olhos com Hiper camuflagem/tex 3 - interaction.json')

itemprefab11.AddTexture(itemprefab11_interaction_texture2)

local itemprefab11_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Olhos com Hiper camuflagem/tex 4 - blowjob.json')

itemprefab11.AddTexture(itemprefab11_blowjob_texture3)

local itemprefab11_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Olhos com Hiper camuflagem/tex 5 - cowgirl.json')

itemprefab11.AddTexture(itemprefab11_cowgirl_texture4)

local itemprefab11_shower_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Olhos com Hiper camuflagem/tex 6 - shower.json')

itemprefab11.AddTexture(itemprefab11_shower_texture5)

local itemgameid11 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab11)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid11)


local itemprefab12 = ModUtilities.CreateItemPrefab()
itemprefab12.Name = 'Pele com Hiper camuflagem'
itemprefab12.Description = 'Troque a cor de lábios, vagina e mamilos como quiser com a mais nova invenção de hiper camuflagem.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab12.Price = 18000
itemprefab12.SlotData = SlotEquipData.CreateInstance('Flesh')
itemprefab12.IsIllegal = true
itemprefab12.HasQuality = true
itemprefab12.ThrowingOutForbidden = false
itemprefab12.IsStackable = false
itemprefab12.Category = ItemCategory.Modules
itemprefab12.CanChangeColor = true
itemprefab12.ColorSlots = {ColorSlot.CreateInstance('Boca', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Mamilos', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Vagina', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab12.Partners = {}
itemprefab12.ScratchType = ScratchTextureType.Universal
itemprefab12.SusModifiers = {}


local itemprefab12_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem/tex 1 - doggy.json')

itemprefab12.AddTexture(itemprefab12_doggy_texture0)

local itemprefab12_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem/tex 2 - missionary.json')

itemprefab12.AddTexture(itemprefab12_missionary_texture1)

local itemprefab12_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem/tex 3 - interaction.json')

itemprefab12.AddTexture(itemprefab12_interaction_texture2)

local itemprefab12_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem/tex 4 - blowjob.json')

itemprefab12.AddTexture(itemprefab12_blowjob_texture3)

local itemprefab12_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem/tex 5 - cowgirl.json')

itemprefab12.AddTexture(itemprefab12_cowgirl_texture4)

local itemprefab12_shower_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem/tex 6 - shower.json')

itemprefab12.AddTexture(itemprefab12_shower_texture5)

local itemgameid12 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab12)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid12)


local itemprefab13 = ModUtilities.CreateItemPrefab()
itemprefab13.Name = 'Orelhas de gato com Hiper camuflagem'
itemprefab13.Description = 'Um item que unifica zoófilos e otakus. Edição furry limitada.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab13.Price = 18000
itemprefab13.SlotData = (function()
	local sd = SlotEquipData.CreateInstance()
	sd.TargetSlotString = 'Head'
	sd.ControllerElementOverride = {'Head_CatEars'}
	return sd end)()
itemprefab13.IsIllegal = true
itemprefab13.HasQuality = true
itemprefab13.ThrowingOutForbidden = false
itemprefab13.IsStackable = false
itemprefab13.Category = ItemCategory.Modules
itemprefab13.SubCategory = ItemSubCategory.Modules_CatEars
itemprefab13.CanChangeColor = true
itemprefab13.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Cor dos pelos', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab13.Partners = {}
itemprefab13.ScratchType = ScratchTextureType.Universal
itemprefab13.SusModifiers = {}


local itemprefab13_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas de gato com Hiper camuflagem/tex 1 - doggy.json')

itemprefab13.AddTexture(itemprefab13_doggy_texture0)

local itemprefab13_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas de gato com Hiper camuflagem/tex 2 - missionary.json')

itemprefab13.AddTexture(itemprefab13_missionary_texture1)

local itemprefab13_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas de gato com Hiper camuflagem/tex 3 - interaction.json')

itemprefab13.AddTexture(itemprefab13_interaction_texture2)

local itemprefab13_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas de gato com Hiper camuflagem/tex 4 - blowjob.json')

itemprefab13.AddTexture(itemprefab13_blowjob_texture3)

local itemprefab13_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas de gato com Hiper camuflagem/tex 5 - cowgirl.json')

itemprefab13.AddTexture(itemprefab13_cowgirl_texture4)

local itemgameid13 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab13)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid13)


local itemprefab14 = ModUtilities.CreateItemPrefab()
itemprefab14.Name = 'Orelhas Pontudas com Hiper camuflagem'
itemprefab14.Description = 'Orelhas pontudas iguais as de um elfo.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab14.Price = 4500
itemprefab14.SlotData = SlotEquipData.CreateInstance('Ears')
itemprefab14.IsIllegal = false
itemprefab14.HasQuality = false
itemprefab14.ThrowingOutForbidden = false
itemprefab14.IsStackable = false
itemprefab14.Category = ItemCategory.Modules
itemprefab14.CanChangeColor = true
itemprefab14.ColorSlots = {ColorSlot.CreateInstance('Cor principal ', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab14.Partners = {}
itemprefab14.ScratchType = ScratchTextureType.Universal
itemprefab14.SusModifiers = {}


local itemprefab14_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas Pontudas com Hiper camuflagem/tex 1 - doggy.json')

itemprefab14.AddTexture(itemprefab14_doggy_texture0)

local itemprefab14_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas Pontudas com Hiper camuflagem/tex 2 - missionary.json')

itemprefab14.AddTexture(itemprefab14_missionary_texture1)

local itemprefab14_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas Pontudas com Hiper camuflagem/tex 3 - interaction.json')

itemprefab14.AddTexture(itemprefab14_interaction_texture2)

local itemprefab14_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas Pontudas com Hiper camuflagem/tex 4 - blowjob.json')

itemprefab14.AddTexture(itemprefab14_blowjob_texture3)

local itemprefab14_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas Pontudas com Hiper camuflagem/tex 5 - cowgirl.json')

itemprefab14.AddTexture(itemprefab14_cowgirl_texture4)

local itemgameid14 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab14)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid14)


local itemprefab15 = ModUtilities.CreateItemPrefab()
itemprefab15.Name = 'Pele com Hiper camuflagem de Alta Tecnologia'
itemprefab15.Description = 'Pele com hiper camuflagem de alta tecnologia. Por algum motivo é extremamente durável e não estraga. Faz seu robô parecer mais humano! De alguma forma funciona imediatamente.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab15.Price = 54000
itemprefab15.SlotData = SlotEquipData.CreateInstance('Skin')
itemprefab15.IsIllegal = true
itemprefab15.HasQuality = false
itemprefab15.ThrowingOutForbidden = false
itemprefab15.IsStackable = false
itemprefab15.Category = ItemCategory.Modules
itemprefab15.CanChangeColor = true
itemprefab15.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab15.Partners = {}
itemprefab15.ScratchType = ScratchTextureType.Universal
itemprefab15.SusModifiers = {SusModifier.CreateInstance(SusArea.Skin, 0.9)}


local itemprefab15_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem de Alta Tecnologia/tex 1 - missionary.json')

itemprefab15.AddTexture(itemprefab15_missionary_texture0)

local itemprefab15_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem de Alta Tecnologia/tex 2 - doggy.json')

itemprefab15.AddTexture(itemprefab15_doggy_texture1)

local itemprefab15_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem de Alta Tecnologia/tex 3 - interaction.json')

itemprefab15.AddTexture(itemprefab15_interaction_texture2)

local itemprefab15_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem de Alta Tecnologia/tex 4 - blowjob.json')

itemprefab15.AddTexture(itemprefab15_blowjob_texture3)

local itemprefab15_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem de Alta Tecnologia/tex 5 - cowgirl.json')

itemprefab15.AddTexture(itemprefab15_cowgirl_texture4)

local itemprefab15_doggy_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem de Alta Tecnologia/tex 6 - doggy.json')

itemprefab15.AddTexture(itemprefab15_doggy_texture5)

local itemprefab15_missionary_texture6 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem de Alta Tecnologia/tex 7 - missionary.json')

itemprefab15.AddTexture(itemprefab15_missionary_texture6)

local itemprefab15_interaction_texture7 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem de Alta Tecnologia/tex 8 - interaction.json')

itemprefab15.AddTexture(itemprefab15_interaction_texture7)

local itemprefab15_blowjob_texture8 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem de Alta Tecnologia/tex 9 - blowjob.json')

itemprefab15.AddTexture(itemprefab15_blowjob_texture8)

local itemprefab15_cowgirl_texture9 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem de Alta Tecnologia/tex 10 - cowgirl.json')

itemprefab15.AddTexture(itemprefab15_cowgirl_texture9)

local itemprefab15_shower_texture10 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele com Hiper camuflagem de Alta Tecnologia/tex 11 - shower.json')

itemprefab15.AddTexture(itemprefab15_shower_texture10)

local itemgameid15 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab15)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid15)


local itemprefab16 = ModUtilities.CreateItemPrefab()
itemprefab16.Name = 'Pele Arco-íris'
itemprefab16.Description = 'De alguma forma funciona imediatamente. MUITO raro.'
itemprefab16.Price = 190000
itemprefab16.SlotData = SlotEquipData.CreateInstance('Skin')
itemprefab16.IsIllegal = true
itemprefab16.HasQuality = false
itemprefab16.ThrowingOutForbidden = false
itemprefab16.IsStackable = false
itemprefab16.Category = ItemCategory.Modules
itemprefab16.CanChangeColor = false
itemprefab16.ColorSlots = {}
itemprefab16.Partners = {}
itemprefab16.ScratchType = ScratchTextureType.Universal
itemprefab16.SusModifiers = {SusModifier.CreateInstance(SusArea.Skin, 0.5)}


local itemprefab16_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele Arco-íris/tex 1 - doggy.json')

itemprefab16.AddTexture(itemprefab16_doggy_texture0)

local itemprefab16_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele Arco-íris/tex 2 - missionary.json')

itemprefab16.AddTexture(itemprefab16_missionary_texture1)

local itemprefab16_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele Arco-íris/tex 3 - interaction.json')

itemprefab16.AddTexture(itemprefab16_interaction_texture2)

local itemprefab16_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele Arco-íris/tex 4 - blowjob.json')

itemprefab16.AddTexture(itemprefab16_blowjob_texture3)

local itemprefab16_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele Arco-íris/tex 5 - cowgirl.json')

itemprefab16.AddTexture(itemprefab16_cowgirl_texture4)

local itemprefab16_shower_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Pele Arco-íris/tex 6 - shower.json')

itemprefab16.AddTexture(itemprefab16_shower_texture5)

local itemgameid16 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab16)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid16)


local itemprefab17 = ModUtilities.CreateItemPrefab()
itemprefab17.Name = 'Desativar holograma'
itemprefab17.Description = 'Módulo simples que permite desativar o holograma acima do cabelo do seu bot.'
itemprefab17.Price = 2500
itemprefab17.SlotData = SlotEquipData.CreateInstance('Hologram')
itemprefab17.IsIllegal = true
itemprefab17.HasQuality = false
itemprefab17.ThrowingOutForbidden = false
itemprefab17.IsStackable = false
itemprefab17.Category = ItemCategory.Modules
itemprefab17.CanChangeColor = false
itemprefab17.ColorSlots = {}
itemprefab17.Partners = {}
itemprefab17.ScratchType = ScratchTextureType.Universal
itemprefab17.SusModifiers = {}


local itemgameid17 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab17)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid17)


local itemprefab18 = ModUtilities.CreateItemPrefab()
itemprefab18.Name = 'Orelhas pontudas'
itemprefab18.Description = 'Orelhas pontudas iguais as de um elfo.'
itemprefab18.Price = 200
itemprefab18.SlotData = SlotEquipData.CreateInstance('Ears')
itemprefab18.IsIllegal = false
itemprefab18.HasQuality = false
itemprefab18.ThrowingOutForbidden = false
itemprefab18.IsStackable = false
itemprefab18.Category = ItemCategory.Modules
itemprefab18.CanChangeColor = false
itemprefab18.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('skinTonePalette'))}
itemprefab18.Partners = {}
itemprefab18.ScratchType = ScratchTextureType.Universal
itemprefab18.SusModifiers = {}


local itemprefab18_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas pontudas/tex 1 - doggy.json')

itemprefab18.AddTexture(itemprefab18_doggy_texture0)

local itemprefab18_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas pontudas/tex 2 - missionary.json')

itemprefab18.AddTexture(itemprefab18_missionary_texture1)

local itemprefab18_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas pontudas/tex 3 - interaction.json')

itemprefab18.AddTexture(itemprefab18_interaction_texture2)

local itemprefab18_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas pontudas/tex 4 - blowjob.json')

itemprefab18.AddTexture(itemprefab18_blowjob_texture3)

local itemprefab18_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Orelhas pontudas/tex 5 - cowgirl.json')

itemprefab18.AddTexture(itemprefab18_cowgirl_texture4)

local itemgameid18 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab18)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid18)


local itemprefab19 = ModUtilities.CreateItemPrefab()
itemprefab19.Name = 'Cabelo com Hiper camuflagem'
itemprefab19.Description = 'Provavelmente melhor que uma peruca.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab19.Price = 19250
itemprefab19.SlotData = (function()
	local sd = SlotEquipData.CreateInstance()
	sd.TargetSlotString = 'HairMain'
	sd.ControllerElementOverride = {'Hair0_Top', 'Hair0_Front', 'Hair0_Side', 'Hair0_Back', 'Hair0_Braid', 'Eyebrows_BasicEyebrows'}
	sd.ElementActiveConditions = {ItemScopeConditionSpecialVariable.CreateInstance('Ahoge'), ItemScopeConditionSpecialVariable.CreateInstance('Front'), ItemScopeConditionSpecialVariable.CreateInstance('Side'), ItemScopeConditionSpecialVariable.CreateInstance('Back'), ItemScopeConditionSpecialVariable.CreateInstance('Braid')}
	sd.TextureActiveConditions = {}
	return sd end)()
itemprefab19.ItemModifiableVariables = {ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable('Ahoge', SimpleLocalizedString.CreateInstanceReplacement('Cabelo pra cima'), true), ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable('Front', SimpleLocalizedString.CreateInstanceReplacement('Frente'), true), ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable('Side', SimpleLocalizedString.CreateInstanceReplacement('Lado'), true), ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable('Back', SimpleLocalizedString.CreateInstanceReplacement('Parte de trás'), true), ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable('Braid', SimpleLocalizedString.CreateInstanceReplacement('Trança'), true)}
itemprefab19.ItemModifiableVariablesRequirements = {AtLeastOneBoolVariableTrueRequirement.CreateInstance({0, 1, 2, 3, 4})}
itemprefab19.IsIllegal = true
itemprefab19.HasQuality = true
itemprefab19.ThrowingOutForbidden = false
itemprefab19.IsStackable = false
itemprefab19.Category = ItemCategory.Modules
itemprefab19.CanChangeColor = true
itemprefab19.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Cor secundária', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Cor do laço de cabelo', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab19.Partners = {}
itemprefab19.ScratchType = ScratchTextureType.Universal
itemprefab19.SusModifiers = {}


local itemprefab19_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 1 - doggy.json')

itemprefab19.AddTexture(itemprefab19_doggy_texture0)

local itemprefab19_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 2 - doggy.json')

itemprefab19.AddTexture(itemprefab19_doggy_texture1)

local itemprefab19_doggy_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 3 - doggy.json')

itemprefab19.AddTexture(itemprefab19_doggy_texture2)

local itemprefab19_doggy_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 4 - doggy.json')

itemprefab19.AddTexture(itemprefab19_doggy_texture3)

local itemprefab19_doggy_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 5 - doggy.json')

itemprefab19.AddTexture(itemprefab19_doggy_texture4)

local itemprefab19_doggy_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 6 - doggy.json')

itemprefab19.AddTexture(itemprefab19_doggy_texture5)

local itemprefab19_missionary_texture6 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 7 - missionary.json')

itemprefab19.AddTexture(itemprefab19_missionary_texture6)

local itemprefab19_missionary_texture7 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 8 - missionary.json')

itemprefab19.AddTexture(itemprefab19_missionary_texture7)

local itemprefab19_missionary_texture8 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 9 - missionary.json')

itemprefab19.AddTexture(itemprefab19_missionary_texture8)

local itemprefab19_missionary_texture9 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 10 - missionary.json')

itemprefab19.AddTexture(itemprefab19_missionary_texture9)

local itemprefab19_missionary_texture10 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 11 - missionary.json')

itemprefab19.AddTexture(itemprefab19_missionary_texture10)

local itemprefab19_missionary_texture11 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 12 - missionary.json')

itemprefab19.AddTexture(itemprefab19_missionary_texture11)

local itemprefab19_interaction_texture12 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 13 - interaction.json')

itemprefab19.AddTexture(itemprefab19_interaction_texture12)

local itemprefab19_interaction_texture13 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 14 - interaction.json')

itemprefab19.AddTexture(itemprefab19_interaction_texture13)

local itemprefab19_interaction_texture14 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 15 - interaction.json')

itemprefab19.AddTexture(itemprefab19_interaction_texture14)

local itemprefab19_interaction_texture15 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 16 - interaction.json')

itemprefab19.AddTexture(itemprefab19_interaction_texture15)

local itemprefab19_interaction_texture16 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 17 - interaction.json')

itemprefab19.AddTexture(itemprefab19_interaction_texture16)

local itemprefab19_interaction_texture17 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 18 - interaction.json')

itemprefab19.AddTexture(itemprefab19_interaction_texture17)

local itemprefab19_blowjob_texture18 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 19 - blowjob.json')

itemprefab19.AddTexture(itemprefab19_blowjob_texture18)

local itemprefab19_blowjob_texture19 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 20 - blowjob.json')

itemprefab19.AddTexture(itemprefab19_blowjob_texture19)

local itemprefab19_blowjob_texture20 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 21 - blowjob.json')

itemprefab19.AddTexture(itemprefab19_blowjob_texture20)

local itemprefab19_blowjob_texture21 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 22 - blowjob.json')

itemprefab19.AddTexture(itemprefab19_blowjob_texture21)

local itemprefab19_blowjob_texture22 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 23 - blowjob.json')

itemprefab19.AddTexture(itemprefab19_blowjob_texture22)

local itemprefab19_blowjob_texture23 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 24 - blowjob.json')

itemprefab19.AddTexture(itemprefab19_blowjob_texture23)

local itemprefab19_cowgirl_texture24 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 25 - cowgirl.json')

itemprefab19.AddTexture(itemprefab19_cowgirl_texture24)

local itemprefab19_cowgirl_texture25 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 26 - cowgirl.json')

itemprefab19.AddTexture(itemprefab19_cowgirl_texture25)

local itemprefab19_cowgirl_texture26 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 27 - cowgirl.json')

itemprefab19.AddTexture(itemprefab19_cowgirl_texture26)

local itemprefab19_cowgirl_texture27 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 28 - cowgirl.json')

itemprefab19.AddTexture(itemprefab19_cowgirl_texture27)

local itemprefab19_cowgirl_texture28 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 29 - cowgirl.json')

itemprefab19.AddTexture(itemprefab19_cowgirl_texture28)

local itemprefab19_cowgirl_texture29 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 30 - cowgirl.json')

itemprefab19.AddTexture(itemprefab19_cowgirl_texture29)

local itemprefab19_shower_texture30 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 31 - shower.json')

itemprefab19.AddTexture(itemprefab19_shower_texture30)

local itemprefab19_shower_texture31 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 32 - shower.json')

itemprefab19.AddTexture(itemprefab19_shower_texture31)

local itemprefab19_shower_texture32 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 33 - shower.json')

itemprefab19.AddTexture(itemprefab19_shower_texture32)

local itemprefab19_shower_texture33 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com Hiper camuflagem/tex 34 - shower.json')

itemprefab19.AddTexture(itemprefab19_shower_texture33)

local itemgameid19 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab19)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid19)


local itemprefab20 = ModUtilities.CreateItemPrefab()
itemprefab20.Name = 'Cabelo de pano com Hiper Camuflagem'
itemprefab20.Description = 'Penteado familiar... <color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab20.Price = 23000
itemprefab20.SlotData = (function()
	local sd = SlotEquipData.CreateInstance()
	sd.TargetSlotString = 'HairMain'
	sd.ControllerElementOverride = {'Hair1_Top', 'Hair1_Front', 'Hair1_Side', 'Hair1_Back', 'Eyebrows_BasicEyebrows'}
	sd.ElementActiveConditions = {ItemScopeConditionSpecialVariable.CreateInstance('Ahoge'), ItemScopeConditionSpecialVariable.CreateInstance('Front'), ItemScopeConditionSpecialVariable.CreateInstance('Side'), ItemScopeConditionSpecialVariable.CreateInstance('Back')}
	sd.TextureActiveConditions = {}
	return sd end)()
itemprefab20.ItemModifiableVariables = {ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable('Ahoge', SimpleLocalizedString.CreateInstanceReplacement('Cabelo pra cima'), true), ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable('Front', SimpleLocalizedString.CreateInstanceReplacement('Frente'), true), ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable('Side', SimpleLocalizedString.CreateInstanceReplacement('Lado'), true), ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable('Back', SimpleLocalizedString.CreateInstanceReplacement('Parte de trás'), true)}
itemprefab20.ItemModifiableVariablesRequirements = {AtLeastOneBoolVariableTrueRequirement.CreateInstance({0, 1, 2, 3})}
itemprefab20.IsIllegal = true
itemprefab20.HasQuality = true
itemprefab20.ThrowingOutForbidden = false
itemprefab20.IsStackable = false
itemprefab20.Category = ItemCategory.Modules
itemprefab20.CanChangeColor = true
itemprefab20.ColorSlots = {ColorSlot.CreateInstance('Cor Principal', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Cor Secundária', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab20.Partners = {}
itemprefab20.ScratchType = ScratchTextureType.Universal
itemprefab20.SusModifiers = {}


local itemprefab20_blowjob_cowgirl_interaction_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 1 - blowjob, cowgirl, interaction, missionary.json')

itemprefab20.AddTexture(itemprefab20_blowjob_cowgirl_interaction_missionary_texture0)

local itemprefab20_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 2 - doggy.json')

itemprefab20.AddTexture(itemprefab20_doggy_texture1)

local itemprefab20_doggy_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 3 - doggy.json')

itemprefab20.AddTexture(itemprefab20_doggy_texture2)

local itemprefab20_doggy_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 4 - doggy.json')

itemprefab20.AddTexture(itemprefab20_doggy_texture3)

local itemprefab20_doggy_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 5 - doggy.json')

itemprefab20.AddTexture(itemprefab20_doggy_texture4)

local itemprefab20_doggy_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 6 - doggy.json')

itemprefab20.AddTexture(itemprefab20_doggy_texture5)

local itemprefab20_missionary_texture6 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 7 - missionary.json')

itemprefab20.AddTexture(itemprefab20_missionary_texture6)

local itemprefab20_missionary_texture7 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 8 - missionary.json')

itemprefab20.AddTexture(itemprefab20_missionary_texture7)

local itemprefab20_missionary_texture8 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 9 - missionary.json')

itemprefab20.AddTexture(itemprefab20_missionary_texture8)

local itemprefab20_missionary_texture9 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 10 - missionary.json')

itemprefab20.AddTexture(itemprefab20_missionary_texture9)

local itemprefab20_missionary_texture10 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 11 - missionary.json')

itemprefab20.AddTexture(itemprefab20_missionary_texture10)

local itemprefab20_interaction_texture11 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 12 - interaction.json')

itemprefab20.AddTexture(itemprefab20_interaction_texture11)

local itemprefab20_interaction_texture12 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 13 - interaction.json')

itemprefab20.AddTexture(itemprefab20_interaction_texture12)

local itemprefab20_interaction_texture13 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 14 - interaction.json')

itemprefab20.AddTexture(itemprefab20_interaction_texture13)

local itemprefab20_interaction_texture14 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 15 - interaction.json')

itemprefab20.AddTexture(itemprefab20_interaction_texture14)

local itemprefab20_interaction_texture15 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 16 - interaction.json')

itemprefab20.AddTexture(itemprefab20_interaction_texture15)

local itemprefab20_blowjob_texture16 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 17 - blowjob.json')

itemprefab20.AddTexture(itemprefab20_blowjob_texture16)

local itemprefab20_blowjob_texture17 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 18 - blowjob.json')

itemprefab20.AddTexture(itemprefab20_blowjob_texture17)

local itemprefab20_blowjob_texture18 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 19 - blowjob.json')

itemprefab20.AddTexture(itemprefab20_blowjob_texture18)

local itemprefab20_blowjob_texture19 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 20 - blowjob.json')

itemprefab20.AddTexture(itemprefab20_blowjob_texture19)

local itemprefab20_blowjob_texture20 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 21 - blowjob.json')

itemprefab20.AddTexture(itemprefab20_blowjob_texture20)

local itemprefab20_cowgirl_texture21 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 22 - cowgirl.json')

itemprefab20.AddTexture(itemprefab20_cowgirl_texture21)

local itemprefab20_cowgirl_texture22 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 23 - cowgirl.json')

itemprefab20.AddTexture(itemprefab20_cowgirl_texture22)

local itemprefab20_cowgirl_texture23 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 24 - cowgirl.json')

itemprefab20.AddTexture(itemprefab20_cowgirl_texture23)

local itemprefab20_cowgirl_texture24 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 25 - cowgirl.json')

itemprefab20.AddTexture(itemprefab20_cowgirl_texture24)

local itemprefab20_cowgirl_texture25 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 26 - cowgirl.json')

itemprefab20.AddTexture(itemprefab20_cowgirl_texture25)

local itemprefab20_shower_texture26 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo de pano com Hiper Camuflagem/tex 27 - shower.json')

itemprefab20.AddTexture(itemprefab20_shower_texture26)

local itemgameid20 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab20)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid20)


local itemprefab21 = ModUtilities.CreateItemPrefab()
itemprefab21.Name = 'Cabelo com corte Hiper Camuflagem'
itemprefab21.Description = 'Cabelo comprido cortado em penteado "corte Hime". <color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab21.Price = 23000
itemprefab21.SlotData = (function()
	local sd = SlotEquipData.CreateInstance()
	sd.TargetSlotString = 'HairMain'
	sd.ControllerElementOverride = {'Hair3_Front', 'Hair3_Side', 'Hair3_Back', 'Eyebrows_BasicEyebrows'}
	sd.ElementActiveConditions = {ItemScopeConditionSpecialVariable.CreateInstance('Front'), ItemScopeConditionSpecialVariable.CreateInstance('Side'), ItemScopeConditionSpecialVariable.CreateInstance('Back')}
	sd.TextureActiveConditions = {}
	return sd end)()
itemprefab21.ItemModifiableVariables = {ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable('Front', SimpleLocalizedString.CreateInstanceReplacement('Frente'), true), ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable('Side', SimpleLocalizedString.CreateInstanceReplacement('Lado'), true), ItemModifiableVariableFactory.CreateInstanceBoolBackedVariable('Back', SimpleLocalizedString.CreateInstanceReplacement('Parte de trás'), true)}
itemprefab21.ItemModifiableVariablesRequirements = {AtLeastOneBoolVariableTrueRequirement.CreateInstance({0, 1, 2})}
itemprefab21.IsIllegal = true
itemprefab21.HasQuality = true
itemprefab21.ThrowingOutForbidden = false
itemprefab21.IsStackable = false
itemprefab21.Category = ItemCategory.Modules
itemprefab21.CanChangeColor = true
itemprefab21.ColorSlots = {ColorSlot.CreateInstance('Cor Principal', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Cor Secundária', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab21.Partners = {}
itemprefab21.ScratchType = ScratchTextureType.Universal
itemprefab21.SusModifiers = {}


local itemprefab21_blowjob_cowgirl_interaction_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 1 - blowjob, cowgirl, interaction, missionary.json')

itemprefab21.AddTexture(itemprefab21_blowjob_cowgirl_interaction_missionary_texture0)

local itemprefab21_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 2 - doggy.json')

itemprefab21.AddTexture(itemprefab21_doggy_texture1)

local itemprefab21_doggy_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 3 - doggy.json')

itemprefab21.AddTexture(itemprefab21_doggy_texture2)

local itemprefab21_doggy_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 4 - doggy.json')

itemprefab21.AddTexture(itemprefab21_doggy_texture3)

local itemprefab21_doggy_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 5 - doggy.json')

itemprefab21.AddTexture(itemprefab21_doggy_texture4)

local itemprefab21_missionary_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 6 - missionary.json')

itemprefab21.AddTexture(itemprefab21_missionary_texture5)

local itemprefab21_missionary_texture6 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 7 - missionary.json')

itemprefab21.AddTexture(itemprefab21_missionary_texture6)

local itemprefab21_missionary_texture7 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 8 - missionary.json')

itemprefab21.AddTexture(itemprefab21_missionary_texture7)

local itemprefab21_missionary_texture8 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 9 - missionary.json')

itemprefab21.AddTexture(itemprefab21_missionary_texture8)

local itemprefab21_interaction_texture9 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 10 - interaction.json')

itemprefab21.AddTexture(itemprefab21_interaction_texture9)

local itemprefab21_interaction_texture10 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 11 - interaction.json')

itemprefab21.AddTexture(itemprefab21_interaction_texture10)

local itemprefab21_interaction_texture11 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 12 - interaction.json')

itemprefab21.AddTexture(itemprefab21_interaction_texture11)

local itemprefab21_interaction_texture12 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 13 - interaction.json')

itemprefab21.AddTexture(itemprefab21_interaction_texture12)

local itemprefab21_blowjob_texture13 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 14 - blowjob.json')

itemprefab21.AddTexture(itemprefab21_blowjob_texture13)

local itemprefab21_blowjob_texture14 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 15 - blowjob.json')

itemprefab21.AddTexture(itemprefab21_blowjob_texture14)

local itemprefab21_blowjob_texture15 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 16 - blowjob.json')

itemprefab21.AddTexture(itemprefab21_blowjob_texture15)

local itemprefab21_blowjob_texture16 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 17 - blowjob.json')

itemprefab21.AddTexture(itemprefab21_blowjob_texture16)

local itemprefab21_cowgirl_texture17 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 18 - cowgirl.json')

itemprefab21.AddTexture(itemprefab21_cowgirl_texture17)

local itemprefab21_cowgirl_texture18 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 19 - cowgirl.json')

itemprefab21.AddTexture(itemprefab21_cowgirl_texture18)

local itemprefab21_cowgirl_texture19 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 20 - cowgirl.json')

itemprefab21.AddTexture(itemprefab21_cowgirl_texture19)

local itemprefab21_cowgirl_texture20 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 21 - cowgirl.json')

itemprefab21.AddTexture(itemprefab21_cowgirl_texture20)

local itemprefab21_shower_texture21 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com corte Hiper Camuflagem/tex 22 - shower.json')

itemprefab21.AddTexture(itemprefab21_shower_texture21)

local itemgameid21 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab21)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid21)


local itemprefab22 = ModUtilities.CreateItemPrefab()
itemprefab22.Name = 'Cabelo com rabo de cavalo com Hiper Camuflagem'
itemprefab22.Description = 'Rabo de cavalo longo que prende na parte de trás do cabelo! <color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab22.Price = 23000
itemprefab22.SlotData = (function()
	local sd = SlotEquipData.CreateInstance()
	sd.TargetSlotString = 'HairAdditional'
	sd.ControllerElementOverride = {'Hair4_Ponytail', 'Hair4_Knot'}
	return sd end)()
itemprefab22.IsIllegal = true
itemprefab22.HasQuality = true
itemprefab22.ThrowingOutForbidden = false
itemprefab22.IsStackable = false
itemprefab22.Category = ItemCategory.Modules
itemprefab22.CanChangeColor = true
itemprefab22.ColorSlots = {ColorSlot.CreateInstance('Cor Principal', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Cor do elástico', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab22.Partners = {}
itemprefab22.ScratchType = ScratchTextureType.Universal
itemprefab22.SusModifiers = {}


local itemprefab22_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com rabo de cavalo com Hiper Camuflagem/tex 1 - doggy.json')

itemprefab22.AddTexture(itemprefab22_doggy_texture0)

local itemprefab22_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com rabo de cavalo com Hiper Camuflagem/tex 2 - doggy.json')

itemprefab22.AddTexture(itemprefab22_doggy_texture1)

local itemprefab22_missionary_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com rabo de cavalo com Hiper Camuflagem/tex 3 - missionary.json')

itemprefab22.AddTexture(itemprefab22_missionary_texture2)

local itemprefab22_missionary_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com rabo de cavalo com Hiper Camuflagem/tex 4 - missionary.json')

itemprefab22.AddTexture(itemprefab22_missionary_texture3)

local itemprefab22_interaction_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com rabo de cavalo com Hiper Camuflagem/tex 5 - interaction.json')

itemprefab22.AddTexture(itemprefab22_interaction_texture4)

local itemprefab22_interaction_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com rabo de cavalo com Hiper Camuflagem/tex 6 - interaction.json')

itemprefab22.AddTexture(itemprefab22_interaction_texture5)

local itemprefab22_blowjob_texture6 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com rabo de cavalo com Hiper Camuflagem/tex 7 - blowjob.json')

itemprefab22.AddTexture(itemprefab22_blowjob_texture6)

local itemprefab22_blowjob_texture7 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com rabo de cavalo com Hiper Camuflagem/tex 8 - blowjob.json')

itemprefab22.AddTexture(itemprefab22_blowjob_texture7)

local itemprefab22_cowgirl_texture8 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com rabo de cavalo com Hiper Camuflagem/tex 9 - cowgirl.json')

itemprefab22.AddTexture(itemprefab22_cowgirl_texture8)

local itemprefab22_cowgirl_texture9 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cabelo com rabo de cavalo com Hiper Camuflagem/tex 10 - cowgirl.json')

itemprefab22.AddTexture(itemprefab22_cowgirl_texture9)

local itemgameid22 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab22)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid22)


local itemprefab23 = ModUtilities.CreateItemPrefab()
itemprefab23.Name = 'Franja de cobertura ocular com Hiper Camuflagemm'
itemprefab23.Description = 'Franja que cobre os olhos do bot.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab23.Price = 19250
itemprefab23.SlotData = (function()
	local sd = SlotEquipData.CreateInstance()
	sd.TargetSlotString = 'HairAdditional'
	sd.ControllerElementOverride = {'Hair2_Front'}
	return sd end)()
itemprefab23.IsIllegal = true
itemprefab23.HasQuality = true
itemprefab23.ThrowingOutForbidden = false
itemprefab23.IsStackable = false
itemprefab23.Category = ItemCategory.Modules
itemprefab23.CanChangeColor = true
itemprefab23.ColorSlots = {ColorSlot.CreateInstance('Cor Principal', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Cor Secundária', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab23.Partners = {}
itemprefab23.ScratchType = ScratchTextureType.Universal
itemprefab23.SusModifiers = {}


local itemprefab23_blowjob_cowgirl_interaction_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Franja de cobertura ocular com Hiper Camuflagemm/tex 1 - blowjob, cowgirl, interaction, missionary.json')

itemprefab23.AddTexture(itemprefab23_blowjob_cowgirl_interaction_missionary_texture0)

local itemprefab23_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Franja de cobertura ocular com Hiper Camuflagemm/tex 2 - doggy.json')

itemprefab23.AddTexture(itemprefab23_doggy_texture1)

local itemprefab23_missionary_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Franja de cobertura ocular com Hiper Camuflagemm/tex 3 - missionary.json')

itemprefab23.AddTexture(itemprefab23_missionary_texture2)

local itemprefab23_interaction_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Franja de cobertura ocular com Hiper Camuflagemm/tex 4 - interaction.json')

itemprefab23.AddTexture(itemprefab23_interaction_texture3)

local itemprefab23_blowjob_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Franja de cobertura ocular com Hiper Camuflagemm/tex 5 - blowjob.json')

itemprefab23.AddTexture(itemprefab23_blowjob_texture4)

local itemprefab23_cowgirl_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Franja de cobertura ocular com Hiper Camuflagemm/tex 6 - cowgirl.json')

itemprefab23.AddTexture(itemprefab23_cowgirl_texture5)

local itemgameid23 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab23)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid23)


local itemprefab24 = ModUtilities.CreateItemPrefab()
itemprefab24.Name = 'Cabelo Arco-ìris'
itemprefab24.Description = 'Um tipo muito raro de módulo de cabelo que muda de cor ao longo do tempo.'
itemprefab24.Price = 180000
itemprefab24.SlotData = SlotEquipData.CreateInstance('HairAugmentation')
itemprefab24.IsIllegal = true
itemprefab24.HasQuality = false
itemprefab24.ThrowingOutForbidden = false
itemprefab24.IsStackable = false
itemprefab24.Category = ItemCategory.Modules
itemprefab24.CanChangeColor = false
itemprefab24.ColorSlots = {}
itemprefab24.Partners = {}
itemprefab24.ScratchType = ScratchTextureType.Universal
itemprefab24.SusModifiers = {}


local itemgameid24 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab24)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid24)


local itemprefab25 = ModUtilities.CreateItemPrefab()
itemprefab25.Name = 'Cabelo Galáctico'
itemprefab25.Description = 'Tipo de cabelo muito raro. Parece que você está olhando pro espaço!'
itemprefab25.Price = 216000
itemprefab25.SlotData = SlotEquipData.CreateInstance('HairAugmentation')
itemprefab25.IsIllegal = true
itemprefab25.HasQuality = false
itemprefab25.ThrowingOutForbidden = false
itemprefab25.IsStackable = false
itemprefab25.Category = ItemCategory.Modules
itemprefab25.CanChangeColor = false
itemprefab25.ColorSlots = {}
itemprefab25.Partners = {}
itemprefab25.ScratchType = ScratchTextureType.Universal
itemprefab25.SusModifiers = {}


local itemgameid25 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab25)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid25)


local itemprefab26 = ModUtilities.CreateItemPrefab()
itemprefab26.Name = 'Cabelo da Quarta Dimensão'
itemprefab26.Description = 'Um tipo de cabelo extremamente raro. Parece de outro mundo.'
itemprefab26.Price = 360000
itemprefab26.SlotData = SlotEquipData.CreateInstance('HairAugmentation')
itemprefab26.IsIllegal = true
itemprefab26.HasQuality = false
itemprefab26.ThrowingOutForbidden = false
itemprefab26.IsStackable = false
itemprefab26.Category = ItemCategory.Modules
itemprefab26.CanChangeColor = false
itemprefab26.ColorSlots = {}
itemprefab26.Partners = {}
itemprefab26.ScratchType = ScratchTextureType.Universal
itemprefab26.SusModifiers = {}


local itemgameid26 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab26)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid26)


local itemprefab27 = ModUtilities.CreateItemPrefab()
itemprefab27.Name = 'Cauda de Gato'
itemprefab27.Description = 'Cauda de gato. Não é proporcional a um gato de verdade. O tamanho é ajustado para caber em sexbots humanos.'
itemprefab27.Price = 14000
itemprefab27.SlotData = SlotEquipData.CreateInstance('Tail')
itemprefab27.IsIllegal = true
itemprefab27.HasQuality = false
itemprefab27.ThrowingOutForbidden = false
itemprefab27.IsStackable = false
itemprefab27.Category = ItemCategory.Modules
itemprefab27.CanChangeColor = false
itemprefab27.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab27.Partners = {}
itemprefab27.ScratchType = ScratchTextureType.Universal
itemprefab27.SusModifiers = {}


local itemprefab27_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato/tex 1 - doggy.json')

itemprefab27.AddTexture(itemprefab27_doggy_texture0)

local itemprefab27_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato/tex 2 - missionary.json')

itemprefab27.AddTexture(itemprefab27_missionary_texture1)

local itemprefab27_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato/tex 3 - interaction.json')

itemprefab27.AddTexture(itemprefab27_interaction_texture2)

local itemprefab27_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato/tex 4 - blowjob.json')

itemprefab27.AddTexture(itemprefab27_blowjob_texture3)

local itemprefab27_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato/tex 5 - cowgirl.json')

itemprefab27.AddTexture(itemprefab27_cowgirl_texture4)

local itemgameid27 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab27)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid27)


local itemprefab28 = ModUtilities.CreateItemPrefab()
itemprefab28.Name = 'Cauda de Gato com Hiper Camuflagem'
itemprefab28.Description = 'Cauda de gato. Não é proporcional a um gato de verdade. O tamanho é ajustado para caber em sexbots humanos.<color=#00FF00> Permite que você altere a cor desta parte livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab28.Price = 48000
itemprefab28.SlotData = SlotEquipData.CreateInstance('Tail')
itemprefab28.IsIllegal = true
itemprefab28.HasQuality = false
itemprefab28.ThrowingOutForbidden = false
itemprefab28.IsStackable = false
itemprefab28.Category = ItemCategory.Modules
itemprefab28.CanChangeColor = true
itemprefab28.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab28.Partners = {}
itemprefab28.ScratchType = ScratchTextureType.Universal
itemprefab28.SusModifiers = {}


local itemprefab28_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato com Hiper Camuflagem/tex 1 - doggy.json')

itemprefab28.AddTexture(itemprefab28_doggy_texture0)

local itemprefab28_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato com Hiper Camuflagem/tex 2 - missionary.json')

itemprefab28.AddTexture(itemprefab28_missionary_texture1)

local itemprefab28_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato com Hiper Camuflagem/tex 3 - interaction.json')

itemprefab28.AddTexture(itemprefab28_interaction_texture2)

local itemprefab28_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato com Hiper Camuflagem/tex 4 - blowjob.json')

itemprefab28.AddTexture(itemprefab28_blowjob_texture3)

local itemprefab28_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato com Hiper Camuflagem/tex 5 - cowgirl.json')

itemprefab28.AddTexture(itemprefab28_cowgirl_texture4)

local itemgameid28 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab28)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid28)


local itemprefab29 = ModUtilities.CreateItemPrefab()
itemprefab29.Name = 'Cauda de Gato (Ponta Diferente) '
itemprefab29.Description = 'Cauda de gato com gradiente para uma segunda cor perto da ponta. O tamanho é ajustado para caber em sexbots humanos.'
itemprefab29.Price = 17000
itemprefab29.SlotData = SlotEquipData.CreateInstance('Tail')
itemprefab29.IsIllegal = true
itemprefab29.HasQuality = false
itemprefab29.ThrowingOutForbidden = false
itemprefab29.IsStackable = false
itemprefab29.Category = ItemCategory.Modules
itemprefab29.CanChangeColor = false
itemprefab29.ColorSlots = {ColorSlot.CreateInstance('Cor Principal', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Cor da ponta da cauda', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab29.Partners = {}
itemprefab29.ScratchType = ScratchTextureType.Universal
itemprefab29.SusModifiers = {}


local itemprefab29_blowjob_cowgirl_interaction_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato (Ponta Diferente) /tex 1 - blowjob, cowgirl, interaction, missionary.json')

itemprefab29.AddTexture(itemprefab29_blowjob_cowgirl_interaction_missionary_texture0)

local itemprefab29_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato (Ponta Diferente) /tex 2 - doggy.json')

itemprefab29.AddTexture(itemprefab29_doggy_texture1)

local itemprefab29_doggy_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato (Ponta Diferente) /tex 3 - doggy.json')

itemprefab29.AddTexture(itemprefab29_doggy_texture2)

local itemprefab29_missionary_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato (Ponta Diferente) /tex 4 - missionary.json')

itemprefab29.AddTexture(itemprefab29_missionary_texture3)

local itemprefab29_interaction_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato (Ponta Diferente) /tex 5 - interaction.json')

itemprefab29.AddTexture(itemprefab29_interaction_texture4)

local itemprefab29_blowjob_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato (Ponta Diferente) /tex 6 - blowjob.json')

itemprefab29.AddTexture(itemprefab29_blowjob_texture5)

local itemprefab29_cowgirl_texture6 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato (Ponta Diferente) /tex 7 - cowgirl.json')

itemprefab29.AddTexture(itemprefab29_cowgirl_texture6)

local itemgameid29 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab29)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid29)


local itemprefab30 = ModUtilities.CreateItemPrefab()
itemprefab30.Name = 'Cauda de Gato (Ponta Diferente) com Hiper Camuflagem'
itemprefab30.Description = 'Cauda de gato com gradiente para uma segunda cor perto da ponta. Não é proporcional a um gato de verdade. O tamanho é ajustado para caber em sexbots humanos.<color=#00FF00> Permite que você altere a cor desta peça livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab30.Price = 52500
itemprefab30.SlotData = SlotEquipData.CreateInstance('Tail')
itemprefab30.IsIllegal = true
itemprefab30.HasQuality = false
itemprefab30.ThrowingOutForbidden = false
itemprefab30.IsStackable = false
itemprefab30.Category = ItemCategory.Modules
itemprefab30.CanChangeColor = true
itemprefab30.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Cor da ponta da cauda', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab30.Partners = {}
itemprefab30.ScratchType = ScratchTextureType.Universal
itemprefab30.SusModifiers = {}


local itemprefab30_blowjob_cowgirl_interaction_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato (Ponta Diferente) com Hiper Camuflagem/tex 1 - blowjob, cowgirl, interaction, missionary.json')

itemprefab30.AddTexture(itemprefab30_blowjob_cowgirl_interaction_missionary_texture0)

local itemprefab30_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato (Ponta Diferente) com Hiper Camuflagem/tex 2 - doggy.json')

itemprefab30.AddTexture(itemprefab30_doggy_texture1)

local itemprefab30_doggy_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato (Ponta Diferente) com Hiper Camuflagem/tex 3 - doggy.json')

itemprefab30.AddTexture(itemprefab30_doggy_texture2)

local itemprefab30_missionary_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato (Ponta Diferente) com Hiper Camuflagem/tex 4 - missionary.json')

itemprefab30.AddTexture(itemprefab30_missionary_texture3)

local itemprefab30_interaction_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato (Ponta Diferente) com Hiper Camuflagem/tex 5 - interaction.json')

itemprefab30.AddTexture(itemprefab30_interaction_texture4)

local itemprefab30_blowjob_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato (Ponta Diferente) com Hiper Camuflagem/tex 6 - blowjob.json')

itemprefab30.AddTexture(itemprefab30_blowjob_texture5)

local itemprefab30_cowgirl_texture6 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda de Gato (Ponta Diferente) com Hiper Camuflagem/tex 7 - cowgirl.json')

itemprefab30.AddTexture(itemprefab30_cowgirl_texture6)

local itemgameid30 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab30)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid30)


local itemprefab31 = ModUtilities.CreateItemPrefab()
itemprefab31.Name = 'Cauda Felpuda'
itemprefab31.Description = 'Cauda felpuda. Mais fofa comparada à cauda de gato.'
itemprefab31.Price = 25000
itemprefab31.SlotData = SlotEquipData.CreateInstance('Tail')
itemprefab31.IsIllegal = true
itemprefab31.HasQuality = false
itemprefab31.ThrowingOutForbidden = false
itemprefab31.IsStackable = false
itemprefab31.Category = ItemCategory.Modules
itemprefab31.CanChangeColor = false
itemprefab31.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab31.Partners = {}
itemprefab31.ScratchType = ScratchTextureType.Universal
itemprefab31.SusModifiers = {}


local itemprefab31_blowjob_cowgirl_interaction_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda/tex 1 - blowjob, cowgirl, interaction, missionary.json')

itemprefab31.AddTexture(itemprefab31_blowjob_cowgirl_interaction_missionary_texture0)

local itemprefab31_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda/tex 2 - doggy.json')

itemprefab31.AddTexture(itemprefab31_doggy_texture1)

local itemprefab31_doggy_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda/tex 3 - doggy.json')

itemprefab31.AddTexture(itemprefab31_doggy_texture2)

local itemgameid31 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab31)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid31)


local itemprefab32 = ModUtilities.CreateItemPrefab()
itemprefab32.Name = 'Cauda Felpuda com Hiper Camuflagem'
itemprefab32.Description = 'Cauda felpuda. Mais fofa comparada à cauda de gato.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab32.Price = 64500
itemprefab32.SlotData = SlotEquipData.CreateInstance('Tail')
itemprefab32.IsIllegal = true
itemprefab32.HasQuality = false
itemprefab32.ThrowingOutForbidden = false
itemprefab32.IsStackable = false
itemprefab32.Category = ItemCategory.Modules
itemprefab32.CanChangeColor = true
itemprefab32.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab32.Partners = {}
itemprefab32.ScratchType = ScratchTextureType.Universal
itemprefab32.SusModifiers = {}


local itemprefab32_blowjob_cowgirl_interaction_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda com Hiper Camuflagem/tex 1 - blowjob, cowgirl, interaction, missionary.json')

itemprefab32.AddTexture(itemprefab32_blowjob_cowgirl_interaction_missionary_texture0)

local itemprefab32_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda com Hiper Camuflagem/tex 2 - doggy.json')

itemprefab32.AddTexture(itemprefab32_doggy_texture1)

local itemprefab32_doggy_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda com Hiper Camuflagem/tex 3 - doggy.json')

itemprefab32.AddTexture(itemprefab32_doggy_texture2)

local itemgameid32 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab32)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid32)


local itemprefab33 = ModUtilities.CreateItemPrefab()
itemprefab33.Name = 'Cauda Felpuda Listrada'
itemprefab33.Description = 'Cauda felpuda listrada. Inspirado em guaxinins! Mais fofa comparada à cauda de gato.'
itemprefab33.Price = 50000
itemprefab33.SlotData = SlotEquipData.CreateInstance('Tail')
itemprefab33.IsIllegal = true
itemprefab33.HasQuality = false
itemprefab33.ThrowingOutForbidden = false
itemprefab33.IsStackable = false
itemprefab33.Category = ItemCategory.Modules
itemprefab33.CanChangeColor = false
itemprefab33.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Cor da listra', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab33.Partners = {}
itemprefab33.ScratchType = ScratchTextureType.Universal
itemprefab33.SusModifiers = {}


local itemprefab33_blowjob_cowgirl_interaction_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda Listrada/tex 1 - blowjob, cowgirl, interaction, missionary.json')

itemprefab33.AddTexture(itemprefab33_blowjob_cowgirl_interaction_missionary_texture0)

local itemprefab33_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda Listrada/tex 2 - doggy.json')

itemprefab33.AddTexture(itemprefab33_doggy_texture1)

local itemprefab33_blowjob_cowgirl_interaction_missionary_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda Listrada/tex 3 - blowjob, cowgirl, interaction, missionary.json')

itemprefab33.AddTexture(itemprefab33_blowjob_cowgirl_interaction_missionary_texture2)

local itemprefab33_doggy_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda Listrada/tex 4 - doggy.json')

itemprefab33.AddTexture(itemprefab33_doggy_texture3)

local itemprefab33_doggy_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda Listrada/tex 5 - doggy.json')

itemprefab33.AddTexture(itemprefab33_doggy_texture4)

local itemgameid33 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab33)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid33)


local itemprefab34 = ModUtilities.CreateItemPrefab()
itemprefab34.Name = 'Cauda Felpuda Listrada com Hiper Camuflagem'
itemprefab34.Description = 'Cauda felpuda listrada. Inspirado em guaxinins! Mais fofa comparada à cauda de gato.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab34.Price = 102000
itemprefab34.SlotData = SlotEquipData.CreateInstance('Tail')
itemprefab34.IsIllegal = true
itemprefab34.HasQuality = false
itemprefab34.ThrowingOutForbidden = false
itemprefab34.IsStackable = false
itemprefab34.Category = ItemCategory.Modules
itemprefab34.CanChangeColor = true
itemprefab34.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette')), ColorSlot.CreateInstance('Cor da listra', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab34.Partners = {}
itemprefab34.ScratchType = ScratchTextureType.Universal
itemprefab34.SusModifiers = {}


local itemprefab34_blowjob_cowgirl_interaction_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda Listrada com Hiper Camuflagem/tex 1 - blowjob, cowgirl, interaction, missionary.json')

itemprefab34.AddTexture(itemprefab34_blowjob_cowgirl_interaction_missionary_texture0)

local itemprefab34_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda Listrada com Hiper Camuflagem/tex 2 - doggy.json')

itemprefab34.AddTexture(itemprefab34_doggy_texture1)

local itemprefab34_blowjob_cowgirl_interaction_missionary_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda Listrada com Hiper Camuflagem/tex 3 - blowjob, cowgirl, interaction, missionary.json')

itemprefab34.AddTexture(itemprefab34_blowjob_cowgirl_interaction_missionary_texture2)

local itemprefab34_doggy_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda Listrada com Hiper Camuflagem/tex 4 - doggy.json')

itemprefab34.AddTexture(itemprefab34_doggy_texture3)

local itemprefab34_doggy_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Cauda Felpuda Listrada com Hiper Camuflagem/tex 5 - doggy.json')

itemprefab34.AddTexture(itemprefab34_doggy_texture4)

local itemgameid34 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab34)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid34)


local itemprefab35 = ModUtilities.CreateItemPrefab()
itemprefab35.Name = 'Módulo de tamanho da coxa'
itemprefab35.Description = 'Permite modificar o tamanho das coxas até certo ponto.'
itemprefab35.Price = 200000
itemprefab35.SlotData = SlotEquipData.CreateInstance('ThighBodyModules')
itemprefab35.ItemModifiableVariables = {ItemModifiableVariableFactory.CreateInstanceFloatVariable('thighSize', SimpleLocalizedString.CreateInstanceReplacement('Tamanho da coxa'), 0.5)}
itemprefab35.IsIllegal = true
itemprefab35.HasQuality = false
itemprefab35.ThrowingOutForbidden = false
itemprefab35.IsStackable = false
itemprefab35.Category = ItemCategory.Modules
itemprefab35.CanChangeColor = false
itemprefab35.ColorSlots = {}
itemprefab35.Partners = {}
itemprefab35.ScratchType = ScratchTextureType.Universal
itemprefab35.SusModifiers = {}


local itemgameid35 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab35)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid35)


local itemprefab36 = ModUtilities.CreateItemPrefab()
itemprefab36.Name = 'Módulo de tamanho da panturrilha'
itemprefab36.Description = 'Permite modificar o tamanho das panturrilhas até certo ponto.'
itemprefab36.Price = 100000
itemprefab36.SlotData = SlotEquipData.CreateInstance('CalfBodyModules')
itemprefab36.ItemModifiableVariables = {ItemModifiableVariableFactory.CreateInstanceFloatVariable('calfSize', SimpleLocalizedString.CreateInstanceReplacement('Tamanho da panturrilha'), 0.5)}
itemprefab36.IsIllegal = true
itemprefab36.HasQuality = false
itemprefab36.ThrowingOutForbidden = false
itemprefab36.IsStackable = false
itemprefab36.Category = ItemCategory.Modules
itemprefab36.CanChangeColor = false
itemprefab36.ColorSlots = {}
itemprefab36.Partners = {}
itemprefab36.ScratchType = ScratchTextureType.Universal
itemprefab36.SusModifiers = {}


local itemgameid36 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab36)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid36)


local itemprefab37 = ModUtilities.CreateItemPrefab()
itemprefab37.Name = 'Módulo de tamanho dos pés'
itemprefab37.Description = 'Permite modificar o tamanho dos pés até certo ponto.'
itemprefab37.Price = 690420
itemprefab37.SlotData = SlotEquipData.CreateInstance('FeetBodyModules')
itemprefab37.ItemModifiableVariables = {ItemModifiableVariableFactory.CreateInstanceFloatVariable('feetLength', SimpleLocalizedString.CreateInstanceReplacement('Comprimento do pé'), 0.5), ItemModifiableVariableFactory.CreateInstanceFloatVariable('feetWidth', SimpleLocalizedString.CreateInstanceReplacement('Largura do pé'), 0.5)}
itemprefab37.IsIllegal = true
itemprefab37.HasQuality = false
itemprefab37.ThrowingOutForbidden = false
itemprefab37.IsStackable = false
itemprefab37.Category = ItemCategory.Modules
itemprefab37.CanChangeColor = false
itemprefab37.ColorSlots = {}
itemprefab37.Partners = {}
itemprefab37.ScratchType = ScratchTextureType.Universal
itemprefab37.SusModifiers = {}


local itemgameid37 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab37)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid37)


local itemprefab38 = ModUtilities.CreateItemPrefab()
itemprefab38.Name = 'Módulo de tamanho de peito'
itemprefab38.Description = 'Permite que você modifique o tamanho de seus seios até certo ponto.'
itemprefab38.Price = 12000000
itemprefab38.SlotData = SlotEquipData.CreateInstance('BoobsBodyModules')
itemprefab38.ItemModifiableVariables = {ItemModifiableVariableFactory.CreateInstanceFloatVariable('boobSize', SimpleLocalizedString.CreateInstanceReplacement('Tamanho do peito'), 0.5)}
itemprefab38.IsIllegal = true
itemprefab38.HasQuality = false
itemprefab38.ThrowingOutForbidden = false
itemprefab38.IsStackable = false
itemprefab38.Category = ItemCategory.Modules
itemprefab38.CanChangeColor = false
itemprefab38.ColorSlots = {}
itemprefab38.Partners = {}
itemprefab38.ScratchType = ScratchTextureType.Universal
itemprefab38.SusModifiers = {}


local itemgameid38 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab38)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid38)


local itemprefab39 = ModUtilities.CreateItemPrefab()
itemprefab39.Name = 'Módulo de tamanho de bunda'
itemprefab39.Description = 'Permite que você modifique o tamanho de sua bunda até certo ponto.'
itemprefab39.Price = 4000000
itemprefab39.SlotData = SlotEquipData.CreateInstance('AssBodyModules')
itemprefab39.ItemModifiableVariables = {ItemModifiableVariableFactory.CreateInstanceFloatVariable('assSize', SimpleLocalizedString.CreateInstanceReplacement('Tamanho da bunda'), 0.5)}
itemprefab39.IsIllegal = true
itemprefab39.HasQuality = false
itemprefab39.ThrowingOutForbidden = false
itemprefab39.IsStackable = false
itemprefab39.Category = ItemCategory.Modules
itemprefab39.CanChangeColor = false
itemprefab39.ColorSlots = {}
itemprefab39.Partners = {}
itemprefab39.ScratchType = ScratchTextureType.Universal
itemprefab39.SusModifiers = {}


local itemgameid39 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab39)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid39)


local itemprefab40 = ModUtilities.CreateItemPrefab()
itemprefab40.Name = 'Braço Esquerdo da VolksAuto'
itemprefab40.Description = 'Braço esquerdo prostético produzido pela VolksAuto-Rehab Tech GmbH. Por algum motivo ele cabe perfeitamente em seu robô. Talvez ele seja feito sob medida.'
itemprefab40.Price = 30000
itemprefab40.SlotData = SlotEquipData.CreateInstance('ArmL')
itemprefab40.IsIllegal = true
itemprefab40.HasQuality = true
itemprefab40.ThrowingOutForbidden = false
itemprefab40.IsStackable = false
itemprefab40.Category = ItemCategory.Modules
itemprefab40.CanChangeColor = false
itemprefab40.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab40.Partners = {'VolksAuto'}
itemprefab40.ScratchType = ScratchTextureType.Hard
itemprefab40.SusModifiers = {}


local itemprefab40_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo da VolksAuto/tex 1 - doggy.json')

itemprefab40.AddTexture(itemprefab40_doggy_texture0)

local itemprefab40_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo da VolksAuto/tex 2 - missionary.json')

itemprefab40.AddTexture(itemprefab40_missionary_texture1)

local itemprefab40_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo da VolksAuto/tex 3 - interaction.json')

itemprefab40.AddTexture(itemprefab40_interaction_texture2)

local itemprefab40_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo da VolksAuto/tex 4 - blowjob.json')

itemprefab40.AddTexture(itemprefab40_blowjob_texture3)

local itemprefab40_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo da VolksAuto/tex 5 - cowgirl.json')

itemprefab40.AddTexture(itemprefab40_cowgirl_texture4)

local itemprefab40_shower_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo da VolksAuto/tex 6 - shower.json')

itemprefab40.AddTexture(itemprefab40_shower_texture5)

local itemgameid40 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab40)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid40)


local itemprefab41 = ModUtilities.CreateItemPrefab()
itemprefab41.Name = 'Braço Direito da VolksAuto'
itemprefab41.Description = 'Braço direito prostético produzido pela VolksAuto-Rehab Tech GmbH. Por algum motivo ele cabe perfeitamente em seu robô. Talvez ele seja feito sob medida.'
itemprefab41.Price = 30000
itemprefab41.SlotData = SlotEquipData.CreateInstance('ArmR')
itemprefab41.IsIllegal = true
itemprefab41.HasQuality = true
itemprefab41.ThrowingOutForbidden = false
itemprefab41.IsStackable = false
itemprefab41.Category = ItemCategory.Modules
itemprefab41.CanChangeColor = false
itemprefab41.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab41.Partners = {'VolksAuto'}
itemprefab41.ScratchType = ScratchTextureType.Hard
itemprefab41.SusModifiers = {}


local itemprefab41_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito da VolksAuto/tex 1 - doggy.json')

itemprefab41.AddTexture(itemprefab41_doggy_texture0)

local itemprefab41_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito da VolksAuto/tex 2 - missionary.json')

itemprefab41.AddTexture(itemprefab41_missionary_texture1)

local itemprefab41_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito da VolksAuto/tex 3 - interaction.json')

itemprefab41.AddTexture(itemprefab41_interaction_texture2)

local itemprefab41_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito da VolksAuto/tex 4 - blowjob.json')

itemprefab41.AddTexture(itemprefab41_blowjob_texture3)

local itemprefab41_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito da VolksAuto/tex 5 - cowgirl.json')

itemprefab41.AddTexture(itemprefab41_cowgirl_texture4)

local itemprefab41_shower_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito da VolksAuto/tex 6 - shower.json')

itemprefab41.AddTexture(itemprefab41_shower_texture5)

local itemgameid41 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab41)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid41)


local itemprefab42 = ModUtilities.CreateItemPrefab()
itemprefab42.Name = 'Perna Esquerda da VolksAuto'
itemprefab42.Description = 'Perna esquerda prostética produzida pela VolksAuto-Rehab Tech GmbH. Por alguma motivo ela cabe perfeitamente em seu robô. Talvez ela seja feita sob medida.'
itemprefab42.Price = 30000
itemprefab42.SlotData = SlotEquipData.CreateInstance('LegL')
itemprefab42.IsIllegal = true
itemprefab42.HasQuality = true
itemprefab42.ThrowingOutForbidden = false
itemprefab42.IsStackable = false
itemprefab42.Category = ItemCategory.Modules
itemprefab42.CanChangeColor = false
itemprefab42.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab42.Partners = {'VolksAuto'}
itemprefab42.ScratchType = ScratchTextureType.Hard
itemprefab42.SusModifiers = {}


local itemprefab42_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda da VolksAuto/tex 1 - doggy.json')

itemprefab42.AddTexture(itemprefab42_doggy_texture0)

local itemprefab42_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda da VolksAuto/tex 2 - missionary.json')

itemprefab42.AddTexture(itemprefab42_missionary_texture1)

local itemprefab42_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda da VolksAuto/tex 3 - interaction.json')

itemprefab42.AddTexture(itemprefab42_interaction_texture2)

local itemprefab42_cowgirl_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda da VolksAuto/tex 4 - cowgirl.json')

itemprefab42.AddTexture(itemprefab42_cowgirl_texture3)

local itemprefab42_shower_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda da VolksAuto/tex 5 - shower.json')

itemprefab42.AddTexture(itemprefab42_shower_texture4)

local itemgameid42 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab42)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid42)


local itemprefab43 = ModUtilities.CreateItemPrefab()
itemprefab43.Name = 'Perna Direita da VolksAuto '
itemprefab43.Description = 'Perna direita prostética produzida pela VolksAuto-Rehab Tech GmbH. Por alguma motivo ela cabe perfeitamente em seu robô. Talvez ela seja feita sob medida.'
itemprefab43.Price = 30000
itemprefab43.SlotData = SlotEquipData.CreateInstance('LegR')
itemprefab43.IsIllegal = true
itemprefab43.HasQuality = true
itemprefab43.ThrowingOutForbidden = false
itemprefab43.IsStackable = false
itemprefab43.Category = ItemCategory.Modules
itemprefab43.CanChangeColor = false
itemprefab43.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab43.Partners = {'VolksAuto'}
itemprefab43.ScratchType = ScratchTextureType.Hard
itemprefab43.SusModifiers = {}


local itemprefab43_doggy_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita da VolksAuto /tex 1 - doggy.json')

itemprefab43.AddTexture(itemprefab43_doggy_texture0)

local itemprefab43_missionary_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita da VolksAuto /tex 2 - missionary.json')

itemprefab43.AddTexture(itemprefab43_missionary_texture1)

local itemprefab43_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita da VolksAuto /tex 3 - interaction.json')

itemprefab43.AddTexture(itemprefab43_interaction_texture2)

local itemprefab43_cowgirl_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita da VolksAuto /tex 4 - cowgirl.json')

itemprefab43.AddTexture(itemprefab43_cowgirl_texture3)

local itemprefab43_shower_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita da VolksAuto /tex 5 - shower.json')

itemprefab43.AddTexture(itemprefab43_shower_texture4)

local itemgameid43 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab43)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid43)


local itemprefab44 = ModUtilities.CreateItemPrefab()
itemprefab44.Name = 'Braço Esquerdo Experimental'
itemprefab44.Description = 'Braço esquerdo incomum. Tem encaixes menos visíveis, mas a qualidade não é das melhores. Parece ser um pouco emborrachado.'
itemprefab44.Price = 15000
itemprefab44.SlotData = SlotEquipData.CreateInstance('ArmL')
itemprefab44.IsIllegal = true
itemprefab44.HasQuality = true
itemprefab44.ThrowingOutForbidden = false
itemprefab44.IsStackable = false
itemprefab44.Category = ItemCategory.Modules
itemprefab44.CanChangeColor = false
itemprefab44.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab44.Partners = {}
itemprefab44.ScratchType = ScratchTextureType.Hard
itemprefab44.SusModifiers = {}


local itemprefab44_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo Experimental/tex 1 - missionary.json')

itemprefab44.AddTexture(itemprefab44_missionary_texture0)

local itemprefab44_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo Experimental/tex 2 - doggy.json')

itemprefab44.AddTexture(itemprefab44_doggy_texture1)

local itemprefab44_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo Experimental/tex 3 - interaction.json')

itemprefab44.AddTexture(itemprefab44_interaction_texture2)

local itemprefab44_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo Experimental/tex 4 - blowjob.json')

itemprefab44.AddTexture(itemprefab44_blowjob_texture3)

local itemprefab44_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo Experimental/tex 5 - cowgirl.json')

itemprefab44.AddTexture(itemprefab44_cowgirl_texture4)

local itemprefab44_missionary_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo Experimental/tex 6 - missionary.json')

itemprefab44.AddTexture(itemprefab44_missionary_texture5)

local itemprefab44_shower_texture6 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo Experimental/tex 7 - shower.json')

itemprefab44.AddTexture(itemprefab44_shower_texture6)

local itemgameid44 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab44)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid44)


local itemprefab45 = ModUtilities.CreateItemPrefab()
itemprefab45.Name = 'Braço Direito Experimental'
itemprefab45.Description = 'Braço direito incomum. Tem encaixes menos visíveis, mas a qualidade não é das melhores. Parece ser um pouco emborrachado.'
itemprefab45.Price = 15000
itemprefab45.SlotData = SlotEquipData.CreateInstance('ArmR')
itemprefab45.IsIllegal = true
itemprefab45.HasQuality = true
itemprefab45.ThrowingOutForbidden = false
itemprefab45.IsStackable = false
itemprefab45.Category = ItemCategory.Modules
itemprefab45.CanChangeColor = false
itemprefab45.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab45.Partners = {}
itemprefab45.ScratchType = ScratchTextureType.Hard
itemprefab45.SusModifiers = {}


local itemprefab45_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito Experimental/tex 1 - missionary.json')

itemprefab45.AddTexture(itemprefab45_missionary_texture0)

local itemprefab45_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito Experimental/tex 2 - doggy.json')

itemprefab45.AddTexture(itemprefab45_doggy_texture1)

local itemprefab45_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito Experimental/tex 3 - interaction.json')

itemprefab45.AddTexture(itemprefab45_interaction_texture2)

local itemprefab45_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito Experimental/tex 4 - blowjob.json')

itemprefab45.AddTexture(itemprefab45_blowjob_texture3)

local itemprefab45_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito Experimental/tex 5 - cowgirl.json')

itemprefab45.AddTexture(itemprefab45_cowgirl_texture4)

local itemprefab45_missionary_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito Experimental/tex 6 - missionary.json')

itemprefab45.AddTexture(itemprefab45_missionary_texture5)

local itemprefab45_shower_texture6 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito Experimental/tex 7 - shower.json')

itemprefab45.AddTexture(itemprefab45_shower_texture6)

local itemgameid45 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab45)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid45)


local itemprefab46 = ModUtilities.CreateItemPrefab()
itemprefab46.Name = 'Perna Esquerda Experimental'
itemprefab46.Description = 'Perna esquerda incomum. Tem encaixes menos visíveis, mas a qualidade não é das melhores. Parece ser um pouco emborrachado.'
itemprefab46.Price = 15000
itemprefab46.SlotData = SlotEquipData.CreateInstance('LegL')
itemprefab46.IsIllegal = true
itemprefab46.HasQuality = true
itemprefab46.ThrowingOutForbidden = false
itemprefab46.IsStackable = false
itemprefab46.Category = ItemCategory.Modules
itemprefab46.CanChangeColor = false
itemprefab46.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab46.Partners = {}
itemprefab46.ScratchType = ScratchTextureType.Hard
itemprefab46.SusModifiers = {}


local itemprefab46_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda Experimental/tex 1 - missionary.json')

itemprefab46.AddTexture(itemprefab46_missionary_texture0)

local itemprefab46_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda Experimental/tex 2 - doggy.json')

itemprefab46.AddTexture(itemprefab46_doggy_texture1)

local itemprefab46_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda Experimental/tex 3 - interaction.json')

itemprefab46.AddTexture(itemprefab46_interaction_texture2)

local itemprefab46_cowgirl_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda Experimental/tex 4 - cowgirl.json')

itemprefab46.AddTexture(itemprefab46_cowgirl_texture3)

local itemprefab46_shower_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda Experimental/tex 5 - shower.json')

itemprefab46.AddTexture(itemprefab46_shower_texture4)

local itemgameid46 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab46)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid46)


local itemprefab47 = ModUtilities.CreateItemPrefab()
itemprefab47.Name = 'Perna Direita Experimental'
itemprefab47.Description = 'Perna direita incomum. Tem encaixes menos visíveis, mas a qualidade não é das melhores. Parece ser um pouco emborrachado.'
itemprefab47.Price = 15000
itemprefab47.SlotData = SlotEquipData.CreateInstance('LegR')
itemprefab47.IsIllegal = true
itemprefab47.HasQuality = true
itemprefab47.ThrowingOutForbidden = false
itemprefab47.IsStackable = false
itemprefab47.Category = ItemCategory.Modules
itemprefab47.CanChangeColor = false
itemprefab47.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab47.Partners = {}
itemprefab47.ScratchType = ScratchTextureType.Hard
itemprefab47.SusModifiers = {}


local itemprefab47_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita Experimental/tex 1 - missionary.json')

itemprefab47.AddTexture(itemprefab47_missionary_texture0)

local itemprefab47_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita Experimental/tex 2 - doggy.json')

itemprefab47.AddTexture(itemprefab47_doggy_texture1)

local itemprefab47_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita Experimental/tex 3 - interaction.json')

itemprefab47.AddTexture(itemprefab47_interaction_texture2)

local itemprefab47_cowgirl_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita Experimental/tex 4 - cowgirl.json')

itemprefab47.AddTexture(itemprefab47_cowgirl_texture3)

local itemprefab47_shower_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita Experimental/tex 5 - shower.json')

itemprefab47.AddTexture(itemprefab47_shower_texture4)

local itemgameid47 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab47)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid47)


local itemprefab48 = ModUtilities.CreateItemPrefab()
itemprefab48.Name = 'Braço Esquerdo Experimental com Hiper Camuflagem'
itemprefab48.Description = 'Braço esquerdo incomum. Tem encaixes menos visíveis, mas a qualidade não é das melhores. Parece ser um pouco emborrachado.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab48.Price = 49500
itemprefab48.SlotData = SlotEquipData.CreateInstance('ArmL')
itemprefab48.IsIllegal = true
itemprefab48.HasQuality = true
itemprefab48.ThrowingOutForbidden = false
itemprefab48.IsStackable = false
itemprefab48.Category = ItemCategory.Modules
itemprefab48.CanChangeColor = true
itemprefab48.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab48.Partners = {}
itemprefab48.ScratchType = ScratchTextureType.Hard
itemprefab48.SusModifiers = {}


local itemprefab48_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo Experimental com Hiper Camuflagem/tex 1 - missionary.json')

itemprefab48.AddTexture(itemprefab48_missionary_texture0)

local itemprefab48_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo Experimental com Hiper Camuflagem/tex 2 - doggy.json')

itemprefab48.AddTexture(itemprefab48_doggy_texture1)

local itemprefab48_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo Experimental com Hiper Camuflagem/tex 3 - interaction.json')

itemprefab48.AddTexture(itemprefab48_interaction_texture2)

local itemprefab48_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo Experimental com Hiper Camuflagem/tex 4 - blowjob.json')

itemprefab48.AddTexture(itemprefab48_blowjob_texture3)

local itemprefab48_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo Experimental com Hiper Camuflagem/tex 5 - cowgirl.json')

itemprefab48.AddTexture(itemprefab48_cowgirl_texture4)

local itemprefab48_missionary_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo Experimental com Hiper Camuflagem/tex 6 - missionary.json')

itemprefab48.AddTexture(itemprefab48_missionary_texture5)

local itemprefab48_shower_texture6 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Esquerdo Experimental com Hiper Camuflagem/tex 7 - shower.json')

itemprefab48.AddTexture(itemprefab48_shower_texture6)

local itemgameid48 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab48)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid48)


local itemprefab49 = ModUtilities.CreateItemPrefab()
itemprefab49.Name = 'Braço Direito Experimental com Hiper Camuflagem'
itemprefab49.Description = 'Braço direito incomum. Tem encaixes menos visíveis, mas a qualidade não é das melhores. Parece ser um pouco emborrachado.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab49.Price = 49500
itemprefab49.SlotData = SlotEquipData.CreateInstance('ArmR')
itemprefab49.IsIllegal = true
itemprefab49.HasQuality = true
itemprefab49.ThrowingOutForbidden = false
itemprefab49.IsStackable = false
itemprefab49.Category = ItemCategory.Modules
itemprefab49.CanChangeColor = true
itemprefab49.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab49.Partners = {}
itemprefab49.ScratchType = ScratchTextureType.Hard
itemprefab49.SusModifiers = {}


local itemprefab49_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito Experimental com Hiper Camuflagem/tex 1 - missionary.json')

itemprefab49.AddTexture(itemprefab49_missionary_texture0)

local itemprefab49_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito Experimental com Hiper Camuflagem/tex 2 - doggy.json')

itemprefab49.AddTexture(itemprefab49_doggy_texture1)

local itemprefab49_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito Experimental com Hiper Camuflagem/tex 3 - interaction.json')

itemprefab49.AddTexture(itemprefab49_interaction_texture2)

local itemprefab49_blowjob_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito Experimental com Hiper Camuflagem/tex 4 - blowjob.json')

itemprefab49.AddTexture(itemprefab49_blowjob_texture3)

local itemprefab49_cowgirl_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito Experimental com Hiper Camuflagem/tex 5 - cowgirl.json')

itemprefab49.AddTexture(itemprefab49_cowgirl_texture4)

local itemprefab49_missionary_texture5 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito Experimental com Hiper Camuflagem/tex 6 - missionary.json')

itemprefab49.AddTexture(itemprefab49_missionary_texture5)

local itemprefab49_shower_texture6 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Braço Direito Experimental com Hiper Camuflagem/tex 7 - shower.json')

itemprefab49.AddTexture(itemprefab49_shower_texture6)

local itemgameid49 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab49)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid49)


local itemprefab50 = ModUtilities.CreateItemPrefab()
itemprefab50.Name = 'Perna Esquerda Experimental com Hiper Camuflagem'
itemprefab50.Description = 'Perna esquerda incomum. Tem encaixes menos visíveis, mas a qualidade não é das melhores. Parece ser um pouco emborrachado.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab50.Price = 49500
itemprefab50.SlotData = SlotEquipData.CreateInstance('LegL')
itemprefab50.IsIllegal = true
itemprefab50.HasQuality = true
itemprefab50.ThrowingOutForbidden = false
itemprefab50.IsStackable = false
itemprefab50.Category = ItemCategory.Modules
itemprefab50.CanChangeColor = true
itemprefab50.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab50.Partners = {}
itemprefab50.ScratchType = ScratchTextureType.Hard
itemprefab50.SusModifiers = {}


local itemprefab50_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda Experimental com Hiper Camuflagem/tex 1 - missionary.json')

itemprefab50.AddTexture(itemprefab50_missionary_texture0)

local itemprefab50_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda Experimental com Hiper Camuflagem/tex 2 - doggy.json')

itemprefab50.AddTexture(itemprefab50_doggy_texture1)

local itemprefab50_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda Experimental com Hiper Camuflagem/tex 3 - interaction.json')

itemprefab50.AddTexture(itemprefab50_interaction_texture2)

local itemprefab50_cowgirl_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda Experimental com Hiper Camuflagem/tex 4 - cowgirl.json')

itemprefab50.AddTexture(itemprefab50_cowgirl_texture3)

local itemprefab50_shower_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Esquerda Experimental com Hiper Camuflagem/tex 5 - shower.json')

itemprefab50.AddTexture(itemprefab50_shower_texture4)

local itemgameid50 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab50)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid50)


local itemprefab51 = ModUtilities.CreateItemPrefab()
itemprefab51.Name = 'Perna Direita Experimental com Hiper Camuflagem'
itemprefab51.Description = 'Perna direita incomum. Tem encaixes menos visíveis, mas a qualidade não é das melhores. Parece um pouco emborrachado.<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab51.Price = 49500
itemprefab51.SlotData = SlotEquipData.CreateInstance('LegR')
itemprefab51.IsIllegal = true
itemprefab51.HasQuality = true
itemprefab51.ThrowingOutForbidden = false
itemprefab51.IsStackable = false
itemprefab51.Category = ItemCategory.Modules
itemprefab51.CanChangeColor = true
itemprefab51.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab51.Partners = {}
itemprefab51.ScratchType = ScratchTextureType.Hard
itemprefab51.SusModifiers = {}


local itemprefab51_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita Experimental com Hiper Camuflagem/tex 1 - missionary.json')

itemprefab51.AddTexture(itemprefab51_missionary_texture0)

local itemprefab51_doggy_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita Experimental com Hiper Camuflagem/tex 2 - doggy.json')

itemprefab51.AddTexture(itemprefab51_doggy_texture1)

local itemprefab51_interaction_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita Experimental com Hiper Camuflagem/tex 3 - interaction.json')

itemprefab51.AddTexture(itemprefab51_interaction_texture2)

local itemprefab51_cowgirl_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita Experimental com Hiper Camuflagem/tex 4 - cowgirl.json')

itemprefab51.AddTexture(itemprefab51_cowgirl_texture3)

local itemprefab51_shower_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Perna Direita Experimental com Hiper Camuflagem/tex 5 - shower.json')

itemprefab51.AddTexture(itemprefab51_shower_texture4)

local itemgameid51 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab51)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid51)


local itemprefab52 = ModUtilities.CreateItemPrefab()
itemprefab52.Name = 'Dentes Afiados com Hiper Camuflagem'
itemprefab52.Description = 'Dê dentes mais afiados ao seu robô! ...Por que?<color=#00FF00> Permite que você altere sua cor livremente graças ao uso de materiais eletrocrômicos de alta tecnologia.</color>'
itemprefab52.Price = 45750
itemprefab52.SlotData = (function()
	local sd = SlotEquipData.CreateInstance()
	sd.TargetSlotString = 'Teeth'
	sd.ControllerElementOverride = {'Teeth_SharpTeeth'}
	return sd end)()
itemprefab52.IsIllegal = true
itemprefab52.HasQuality = true
itemprefab52.ThrowingOutForbidden = false
itemprefab52.IsStackable = false
itemprefab52.Category = ItemCategory.Modules
itemprefab52.CanChangeColor = true
itemprefab52.ColorSlots = {ColorSlot.CreateInstance('Cor principal', ColorPaletteManager.GetColorPaletteByName('partpalette'))}
itemprefab52.Partners = {}
itemprefab52.ScratchType = ScratchTextureType.Hard
itemprefab52.SusModifiers = {}


local itemprefab52_missionary_texture0 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Dentes Afiados com Hiper Camuflagem/tex 1 - missionary.json')

itemprefab52.AddTexture(itemprefab52_missionary_texture0)

local itemprefab52_interaction_texture1 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Dentes Afiados com Hiper Camuflagem/tex 2 - interaction.json')

itemprefab52.AddTexture(itemprefab52_interaction_texture1)

local itemprefab52_blowjob_texture2 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Dentes Afiados com Hiper Camuflagem/tex 3 - blowjob.json')

itemprefab52.AddTexture(itemprefab52_blowjob_texture2)

local itemprefab52_cowgirl_texture3 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Dentes Afiados com Hiper Camuflagem/tex 4 - cowgirl.json')

itemprefab52.AddTexture(itemprefab52_cowgirl_texture3)

local itemprefab52_shower_texture4 = ModUtilities.GetPackedTexture(CurrentModGuid, '/Dentes Afiados com Hiper Camuflagem/tex 5 - shower.json')

itemprefab52.AddTexture(itemprefab52_shower_texture4)

local itemgameid52 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab52)
ModUtilities.AddSingleBuyItemToShop('ladyparts.ic', itemgameid52)



end

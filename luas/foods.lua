--This script was generated automatically!
--Good luck with making the mod!
--May Sheep be with you!
do

local itemprefab0 = ModUtilities.CreateItemPrefab()
itemprefab0.Name = 'Energético'
itemprefab0.Description = 'Te fornece forças para foder (ou jogar) a noite toda.'
itemprefab0.Price = 20
itemprefab0.IsIllegal = false
itemprefab0.HasQuality = false
itemprefab0.ThrowingOutForbidden = false
itemprefab0.IsStackable = true
itemprefab0.Category = ItemCategory.Food
itemprefab0.CanChangeColor = false
itemprefab0.ColorSlots = {}
itemprefab0.Partners = {}
itemprefab0.ScratchType = ScratchTextureType.Universal
itemprefab0.SusModifiers = {}
itemprefab0.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Beverage, ntf)
	return ed end)()


local itemgameid0 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab0)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid0)


local itemprefab1 = ModUtilities.CreateItemPrefab()
itemprefab1.Name = 'Barra de cereais'
itemprefab1.Description = 'Lanche gostoso. Bem pequeno'
itemprefab1.Price = 5
itemprefab1.IsIllegal = false
itemprefab1.HasQuality = false
itemprefab1.ThrowingOutForbidden = false
itemprefab1.IsStackable = true
itemprefab1.Category = ItemCategory.Food
itemprefab1.CanChangeColor = false
itemprefab1.ColorSlots = {}
itemprefab1.Partners = {}
itemprefab1.ScratchType = ScratchTextureType.Universal
itemprefab1.SusModifiers = {}
itemprefab1.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid1 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab1)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid1)


local itemprefab2 = ModUtilities.CreateItemPrefab()
itemprefab2.Name = 'Salgadinhos'
itemprefab2.Description = '*nom nom*'
itemprefab2.Price = 5
itemprefab2.IsIllegal = false
itemprefab2.HasQuality = false
itemprefab2.ThrowingOutForbidden = false
itemprefab2.IsStackable = true
itemprefab2.Category = ItemCategory.Food
itemprefab2.CanChangeColor = false
itemprefab2.ColorSlots = {}
itemprefab2.Partners = {}
itemprefab2.ScratchType = ScratchTextureType.Universal
itemprefab2.SusModifiers = {}
itemprefab2.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid2 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab2)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid2)


local itemprefab3 = ModUtilities.CreateItemPrefab()
itemprefab3.Name = 'Refrigerante'
itemprefab3.Description = 'Bebida doce. Tem gosto de liberdade.'
itemprefab3.Price = 5
itemprefab3.IsIllegal = false
itemprefab3.HasQuality = false
itemprefab3.ThrowingOutForbidden = false
itemprefab3.IsStackable = true
itemprefab3.Category = ItemCategory.Food
itemprefab3.CanChangeColor = false
itemprefab3.ColorSlots = {}
itemprefab3.Partners = {}
itemprefab3.ScratchType = ScratchTextureType.Universal
itemprefab3.SusModifiers = {}
itemprefab3.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Beverage, ntf)
	return ed end)()


local itemgameid3 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab3)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid3)


local itemprefab4 = ModUtilities.CreateItemPrefab()
itemprefab4.Name = 'Doces'
itemprefab4.Description = 'Doçura abundante. Faz seus dentes doerem.'
itemprefab4.Price = 2
itemprefab4.IsIllegal = false
itemprefab4.HasQuality = false
itemprefab4.ThrowingOutForbidden = false
itemprefab4.IsStackable = true
itemprefab4.Category = ItemCategory.Food
itemprefab4.CanChangeColor = false
itemprefab4.ColorSlots = {}
itemprefab4.Partners = {}
itemprefab4.ScratchType = ScratchTextureType.Universal
itemprefab4.SusModifiers = {}
itemprefab4.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid4 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab4)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid4)


local itemprefab5 = ModUtilities.CreateItemPrefab()
itemprefab5.Name = 'Soyrent'
itemprefab5.Description = 'Contrai as bolas, pra dentro do corpo. Uma alternativa vegana para uma dieta nutritiva.'
itemprefab5.Price = 50
itemprefab5.IsIllegal = false
itemprefab5.HasQuality = false
itemprefab5.ThrowingOutForbidden = false
itemprefab5.IsStackable = true
itemprefab5.Category = ItemCategory.Food
itemprefab5.CanChangeColor = false
itemprefab5.ColorSlots = {}
itemprefab5.Partners = {}
itemprefab5.ScratchType = ScratchTextureType.Universal
itemprefab5.SusModifiers = {}
itemprefab5.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Beverage, ntf)
	return ed end)()


local itemgameid5 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab5)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid5)


local itemprefab6 = ModUtilities.CreateItemPrefab()
itemprefab6.Name = 'Nuggets de Frango'
itemprefab6.Description = 'Em formato de dinossauro. Saboroso, mas provavelmente não contém frango. Projetado para ser consumido cru, sem aquecer. Quando aquecidos, tem um cheiro de plástico.'
itemprefab6.Price = 45
itemprefab6.IsIllegal = false
itemprefab6.HasQuality = false
itemprefab6.ThrowingOutForbidden = false
itemprefab6.IsStackable = true
itemprefab6.Category = ItemCategory.Food
itemprefab6.CanChangeColor = false
itemprefab6.ColorSlots = {}
itemprefab6.Partners = {}
itemprefab6.ScratchType = ScratchTextureType.Universal
itemprefab6.SusModifiers = {}
itemprefab6.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid6 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab6)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid6)


local itemprefab7 = ModUtilities.CreateItemPrefab()
itemprefab7.Name = 'Pão do dispensador'
itemprefab7.Description = 'Um substituto do pão que você conseguiu no dispensador lá fora. Gosto horrível, mas te manterá vivo.'
itemprefab7.Price = 1
itemprefab7.IsIllegal = false
itemprefab7.HasQuality = false
itemprefab7.ThrowingOutForbidden = false
itemprefab7.IsStackable = true
itemprefab7.Category = ItemCategory.Food
itemprefab7.CanChangeColor = false
itemprefab7.ColorSlots = {}
itemprefab7.Partners = {}
itemprefab7.ScratchType = ScratchTextureType.Universal
itemprefab7.SusModifiers = {}
itemprefab7.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Bread, ntf)
	return ed end)()


local itemgameid7 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab7)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid7)


local itemprefab8 = ModUtilities.CreateItemPrefab()
itemprefab8.Name = 'Lata de feijão cozido'
itemprefab8.Description = 'Melhor comida enlatada que você pode conseguir. Deus abençoe a Rainha!'
itemprefab8.Price = 40
itemprefab8.IsIllegal = false
itemprefab8.HasQuality = false
itemprefab8.ThrowingOutForbidden = false
itemprefab8.IsStackable = true
itemprefab8.Category = ItemCategory.Food
itemprefab8.CanChangeColor = false
itemprefab8.ColorSlots = {}
itemprefab8.Partners = {}
itemprefab8.ScratchType = ScratchTextureType.Universal
itemprefab8.SusModifiers = {}
itemprefab8.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Bean, ntf)
	return ed end)()


local itemgameid8 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab8)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid8)


local itemprefab9 = ModUtilities.CreateItemPrefab()
itemprefab9.Name = 'Cebolas em conserva'
itemprefab9.Description = 'O oposto de soja. Conservado.'
itemprefab9.Price = 100
itemprefab9.IsIllegal = false
itemprefab9.HasQuality = false
itemprefab9.ThrowingOutForbidden = false
itemprefab9.IsStackable = true
itemprefab9.Category = ItemCategory.Food
itemprefab9.CanChangeColor = false
itemprefab9.ColorSlots = {}
itemprefab9.Partners = {}
itemprefab9.ScratchType = ScratchTextureType.Universal
itemprefab9.SusModifiers = {}
itemprefab9.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.MainVegetable, ntf)
	return ed end)()


local itemgameid9 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab9)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid9)


local itemprefab10 = ModUtilities.CreateItemPrefab()
itemprefab10.Name = 'Vegetais Genéticamente Modificados'
itemprefab10.Description = 'Graças aos avanços da tecnologia, eles nunca estragam, mas também tem gosto de lixo.'
itemprefab10.Price = 7
itemprefab10.IsIllegal = false
itemprefab10.HasQuality = false
itemprefab10.ThrowingOutForbidden = false
itemprefab10.IsStackable = true
itemprefab10.Category = ItemCategory.Food
itemprefab10.CanChangeColor = false
itemprefab10.ColorSlots = {}
itemprefab10.Partners = {}
itemprefab10.ScratchType = ScratchTextureType.Universal
itemprefab10.SusModifiers = {}
itemprefab10.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.MainVegetable, ntf)
	return ed end)()


local itemgameid10 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab10)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid10)


local itemprefab11 = ModUtilities.CreateItemPrefab()
itemprefab11.Name = 'Linguiça'
itemprefab11.Description = 'Importada da Polônia. Caro, e talvez com vermes. '
itemprefab11.Price = 50
itemprefab11.IsIllegal = false
itemprefab11.HasQuality = false
itemprefab11.ThrowingOutForbidden = false
itemprefab11.IsStackable = true
itemprefab11.Category = ItemCategory.Food
itemprefab11.CanChangeColor = false
itemprefab11.ColorSlots = {}
itemprefab11.Partners = {}
itemprefab11.ScratchType = ScratchTextureType.Universal
itemprefab11.SusModifiers = {}
itemprefab11.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Meat, ntf)
	return ed end)()


local itemgameid11 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab11)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid11)


local itemprefab12 = ModUtilities.CreateItemPrefab()
itemprefab12.Name = 'Macarrão instantâneo'
itemprefab12.Description = 'Cheio de aditivos. Bem gostoso, mas não é saudável.'
itemprefab12.Price = 4
itemprefab12.IsIllegal = false
itemprefab12.HasQuality = false
itemprefab12.ThrowingOutForbidden = false
itemprefab12.IsStackable = true
itemprefab12.Category = ItemCategory.Food
itemprefab12.CanChangeColor = false
itemprefab12.ColorSlots = {}
itemprefab12.Partners = {}
itemprefab12.ScratchType = ScratchTextureType.Universal
itemprefab12.SusModifiers = {}
itemprefab12.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Pasta, ntf)
	return ed end)()


local itemgameid12 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab12)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid12)


local itemprefab13 = ModUtilities.CreateItemPrefab()
itemprefab13.Name = 'Massa de Taco'
itemprefab13.Description = 'Necessário pra fazer tacos!  Pode ser consumido cru se você estiver faminto.'
itemprefab13.Price = 150
itemprefab13.IsIllegal = false
itemprefab13.HasQuality = false
itemprefab13.ThrowingOutForbidden = false
itemprefab13.IsStackable = true
itemprefab13.Category = ItemCategory.CookingIngredient
itemprefab13.CanChangeColor = false
itemprefab13.ColorSlots = {}
itemprefab13.Partners = {}
itemprefab13.ScratchType = ScratchTextureType.Universal
itemprefab13.SusModifiers = {}
itemprefab13.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid13 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab13)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid13)


local itemprefab14 = ModUtilities.CreateItemPrefab()
itemprefab14.Name = 'Arroz'
itemprefab14.Description = 'Ingrediente básico. Ainda bastante disponível, porém muito mais caro do que costumava ser.'
itemprefab14.Price = 1500
itemprefab14.IsIllegal = false
itemprefab14.HasQuality = false
itemprefab14.ThrowingOutForbidden = false
itemprefab14.IsStackable = true
itemprefab14.Category = ItemCategory.CookingIngredient
itemprefab14.CanChangeColor = false
itemprefab14.ColorSlots = {}
itemprefab14.Partners = {}
itemprefab14.ScratchType = ScratchTextureType.Universal
itemprefab14.SusModifiers = {}
itemprefab14.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid14 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab14)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid14)


local itemprefab15 = ModUtilities.CreateItemPrefab()
itemprefab15.Name = 'Batatas'
itemprefab15.Description = 'Ingrediente básico utilizado na culinária.'
itemprefab15.Price = 1800
itemprefab15.IsIllegal = false
itemprefab15.HasQuality = false
itemprefab15.ThrowingOutForbidden = false
itemprefab15.IsStackable = true
itemprefab15.Category = ItemCategory.CookingIngredient
itemprefab15.CanChangeColor = false
itemprefab15.ColorSlots = {}
itemprefab15.Partners = {}
itemprefab15.ScratchType = ScratchTextureType.Universal
itemprefab15.SusModifiers = {}
itemprefab15.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.MainVegetable, ntf)
	return ed end)()


local itemgameid15 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab15)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid15)


local itemprefab16 = ModUtilities.CreateItemPrefab()
itemprefab16.Name = 'Farinha'
itemprefab16.Description = 'Ingrediente básico utilizado na culinária.'
itemprefab16.Price = 1400
itemprefab16.IsIllegal = false
itemprefab16.HasQuality = false
itemprefab16.ThrowingOutForbidden = false
itemprefab16.IsStackable = true
itemprefab16.Category = ItemCategory.CookingIngredient
itemprefab16.CanChangeColor = false
itemprefab16.ColorSlots = {}
itemprefab16.Partners = {}
itemprefab16.ScratchType = ScratchTextureType.Universal
itemprefab16.SusModifiers = {}
itemprefab16.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid16 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab16)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid16)


local itemprefab17 = ModUtilities.CreateItemPrefab()
itemprefab17.Name = 'Tomate'
itemprefab17.Description = 'Tomates frescos estão mais dificeis de achar hoje em dia. Muito importante em pratos italianos.'
itemprefab17.Price = 2500
itemprefab17.IsIllegal = false
itemprefab17.HasQuality = false
itemprefab17.ThrowingOutForbidden = false
itemprefab17.IsStackable = true
itemprefab17.Category = ItemCategory.CookingIngredient
itemprefab17.CanChangeColor = false
itemprefab17.ColorSlots = {}
itemprefab17.Partners = {}
itemprefab17.ScratchType = ScratchTextureType.Universal
itemprefab17.SusModifiers = {}
itemprefab17.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.MainVegetable, ntf)
	return ed end)()


local itemgameid17 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab17)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid17)


local itemprefab18 = ModUtilities.CreateItemPrefab()
itemprefab18.Name = 'Cenoura'
itemprefab18.Description = 'Uma vegetal raiz doce e crocante. Aparentemente melhora fertilidade.'
itemprefab18.Price = 2000
itemprefab18.IsIllegal = false
itemprefab18.HasQuality = false
itemprefab18.ThrowingOutForbidden = false
itemprefab18.IsStackable = true
itemprefab18.Category = ItemCategory.CookingIngredient
itemprefab18.CanChangeColor = false
itemprefab18.ColorSlots = {}
itemprefab18.Partners = {}
itemprefab18.ScratchType = ScratchTextureType.Universal
itemprefab18.SusModifiers = {}
itemprefab18.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.MainVegetable, ntf)
	return ed end)()


local itemgameid18 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab18)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid18)


local itemprefab19 = ModUtilities.CreateItemPrefab()
itemprefab19.Name = 'Bife Cru'
itemprefab19.Description = 'Bife de verdade. Tão caro que várias pessoas nunca terão a oportunidade de saborear sua riqueza'
itemprefab19.Price = 22000
itemprefab19.IsIllegal = false
itemprefab19.HasQuality = false
itemprefab19.ThrowingOutForbidden = false
itemprefab19.IsStackable = true
itemprefab19.Category = ItemCategory.CookingIngredient
itemprefab19.CanChangeColor = false
itemprefab19.ColorSlots = {}
itemprefab19.Partners = {}
itemprefab19.ScratchType = ScratchTextureType.Universal
itemprefab19.SusModifiers = {}
itemprefab19.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Meat, ntf)
	return ed end)()


local itemgameid19 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab19)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid19)


local itemprefab20 = ModUtilities.CreateItemPrefab()
itemprefab20.Name = 'Carne de Frango Crua'
itemprefab20.Description = 'Caro demais pro quê ela é.'
itemprefab20.Price = 4000
itemprefab20.IsIllegal = false
itemprefab20.HasQuality = false
itemprefab20.ThrowingOutForbidden = false
itemprefab20.IsStackable = true
itemprefab20.Category = ItemCategory.CookingIngredient
itemprefab20.CanChangeColor = false
itemprefab20.ColorSlots = {}
itemprefab20.Partners = {}
itemprefab20.ScratchType = ScratchTextureType.Universal
itemprefab20.SusModifiers = {}
itemprefab20.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Meat, ntf)
	return ed end)()


local itemgameid20 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab20)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid20)


local itemprefab21 = ModUtilities.CreateItemPrefab()
itemprefab21.Name = 'Cebola'
itemprefab21.Description = 'Vegetal fedido que é essencial na culinária. Aparentemente melhora fertilidade.'
itemprefab21.Price = 2200
itemprefab21.IsIllegal = false
itemprefab21.HasQuality = false
itemprefab21.ThrowingOutForbidden = false
itemprefab21.IsStackable = true
itemprefab21.Category = ItemCategory.CookingIngredient
itemprefab21.CanChangeColor = false
itemprefab21.ColorSlots = {}
itemprefab21.Partners = {}
itemprefab21.ScratchType = ScratchTextureType.Universal
itemprefab21.SusModifiers = {}
itemprefab21.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.FlavourVegetable, ntf)
	return ed end)()


local itemgameid21 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab21)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid21)


local itemprefab22 = ModUtilities.CreateItemPrefab()
itemprefab22.Name = 'Ovo'
itemprefab22.Description = 'Ovos de galinha. Ótima fonte de proteína'
itemprefab22.Price = 3750
itemprefab22.IsIllegal = false
itemprefab22.HasQuality = false
itemprefab22.ThrowingOutForbidden = false
itemprefab22.IsStackable = true
itemprefab22.Category = ItemCategory.CookingIngredient
itemprefab22.CanChangeColor = false
itemprefab22.ColorSlots = {}
itemprefab22.Partners = {}
itemprefab22.ScratchType = ScratchTextureType.Universal
itemprefab22.SusModifiers = {}
itemprefab22.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid22 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab22)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid22)


local itemprefab23 = ModUtilities.CreateItemPrefab()
itemprefab23.Name = 'Leite'
itemprefab23.Description = 'Leite pausterizado 3% de gordura. Infelizmente a embalagem não diz de qual animal ele veio. '
itemprefab23.Price = 2500
itemprefab23.IsIllegal = false
itemprefab23.HasQuality = false
itemprefab23.ThrowingOutForbidden = false
itemprefab23.IsStackable = true
itemprefab23.Category = ItemCategory.CookingIngredient
itemprefab23.CanChangeColor = false
itemprefab23.ColorSlots = {}
itemprefab23.Partners = {}
itemprefab23.ScratchType = ScratchTextureType.Universal
itemprefab23.SusModifiers = {}
itemprefab23.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid23 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab23)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid23)


local itemprefab24 = ModUtilities.CreateItemPrefab()
itemprefab24.Name = 'Alho'
itemprefab24.Description = 'O alho acrescenta sabor a qualquer prato.'
itemprefab24.Price = 3000
itemprefab24.IsIllegal = false
itemprefab24.HasQuality = false
itemprefab24.ThrowingOutForbidden = false
itemprefab24.IsStackable = true
itemprefab24.Category = ItemCategory.CookingIngredient
itemprefab24.CanChangeColor = false
itemprefab24.ColorSlots = {}
itemprefab24.Partners = {}
itemprefab24.ScratchType = ScratchTextureType.Universal
itemprefab24.SusModifiers = {}
itemprefab24.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.FlavourVegetable, ntf)
	return ed end)()


local itemgameid24 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab24)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid24)


local itemprefab25 = ModUtilities.CreateItemPrefab()
itemprefab25.Name = 'Gengibre'
itemprefab25.Description = 'Saudável e com bastante sabor. Obrigatório para alguns pratos.'
itemprefab25.Price = 3500
itemprefab25.IsIllegal = false
itemprefab25.HasQuality = false
itemprefab25.ThrowingOutForbidden = false
itemprefab25.IsStackable = true
itemprefab25.Category = ItemCategory.CookingIngredient
itemprefab25.CanChangeColor = false
itemprefab25.ColorSlots = {}
itemprefab25.Partners = {}
itemprefab25.ScratchType = ScratchTextureType.Universal
itemprefab25.SusModifiers = {}
itemprefab25.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.FlavourVegetable, ntf)
	return ed end)()


local itemgameid25 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab25)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid25)


local itemprefab26 = ModUtilities.CreateItemPrefab()
itemprefab26.Name = 'Molho de Soja'
itemprefab26.Description = 'Um condimento adorado, bem salgado.'
itemprefab26.Price = 1500
itemprefab26.IsIllegal = false
itemprefab26.HasQuality = false
itemprefab26.ThrowingOutForbidden = false
itemprefab26.IsStackable = true
itemprefab26.Category = ItemCategory.CookingIngredient
itemprefab26.CanChangeColor = false
itemprefab26.ColorSlots = {}
itemprefab26.Partners = {}
itemprefab26.ScratchType = ScratchTextureType.Universal
itemprefab26.SusModifiers = {}
itemprefab26.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid26 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab26)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid26)


local itemprefab27 = ModUtilities.CreateItemPrefab()
itemprefab27.Name = 'Vinagre'
itemprefab27.Description = 'Condimento ácido.'
itemprefab27.Price = 1500
itemprefab27.IsIllegal = false
itemprefab27.HasQuality = false
itemprefab27.ThrowingOutForbidden = false
itemprefab27.IsStackable = true
itemprefab27.Category = ItemCategory.CookingIngredient
itemprefab27.CanChangeColor = false
itemprefab27.ColorSlots = {}
itemprefab27.Partners = {}
itemprefab27.ScratchType = ScratchTextureType.Universal
itemprefab27.SusModifiers = {}
itemprefab27.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid27 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab27)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid27)


local itemprefab28 = ModUtilities.CreateItemPrefab()
itemprefab28.Name = 'Macarrão'
itemprefab28.Description = 'Útil tanto para sopas quanto para pratos de macarrão.'
itemprefab28.Price = 1500
itemprefab28.IsIllegal = false
itemprefab28.HasQuality = false
itemprefab28.ThrowingOutForbidden = false
itemprefab28.IsStackable = true
itemprefab28.Category = ItemCategory.CookingIngredient
itemprefab28.CanChangeColor = false
itemprefab28.ColorSlots = {}
itemprefab28.Partners = {}
itemprefab28.ScratchType = ScratchTextureType.Universal
itemprefab28.SusModifiers = {}
itemprefab28.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Pasta, ntf)
	return ed end)()


local itemgameid28 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab28)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid28)


local itemprefab29 = ModUtilities.CreateItemPrefab()
itemprefab29.Name = 'Carne Moída Crua'
itemprefab29.Description = 'Carne moída. Mais barato que um bife de verdade.'
itemprefab29.Price = 7000
itemprefab29.IsIllegal = false
itemprefab29.HasQuality = false
itemprefab29.ThrowingOutForbidden = false
itemprefab29.IsStackable = true
itemprefab29.Category = ItemCategory.CookingIngredient
itemprefab29.CanChangeColor = false
itemprefab29.ColorSlots = {}
itemprefab29.Partners = {}
itemprefab29.ScratchType = ScratchTextureType.Universal
itemprefab29.SusModifiers = {}
itemprefab29.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Meat, ntf)
	return ed end)()


local itemgameid29 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab29)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid29)


local itemprefab30 = ModUtilities.CreateItemPrefab()
itemprefab30.Name = 'Açúcar'
itemprefab30.Description = 'Obrigatório para pratos doces!'
itemprefab30.Price = 4000
itemprefab30.IsIllegal = false
itemprefab30.HasQuality = false
itemprefab30.ThrowingOutForbidden = false
itemprefab30.IsStackable = true
itemprefab30.Category = ItemCategory.CookingIngredient
itemprefab30.CanChangeColor = false
itemprefab30.ColorSlots = {}
itemprefab30.Partners = {}
itemprefab30.ScratchType = ScratchTextureType.Universal
itemprefab30.SusModifiers = {}
itemprefab30.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid30 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab30)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid30)


local itemprefab31 = ModUtilities.CreateItemPrefab()
itemprefab31.Name = 'Manteiga'
itemprefab31.Description = 'Feito de leite.'
itemprefab31.Price = 6500
itemprefab31.IsIllegal = false
itemprefab31.HasQuality = false
itemprefab31.ThrowingOutForbidden = false
itemprefab31.IsStackable = true
itemprefab31.Category = ItemCategory.CookingIngredient
itemprefab31.CanChangeColor = false
itemprefab31.ColorSlots = {}
itemprefab31.Partners = {}
itemprefab31.ScratchType = ScratchTextureType.Universal
itemprefab31.SusModifiers = {}
itemprefab31.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid31 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab31)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid31)


local itemprefab32 = ModUtilities.CreateItemPrefab()
itemprefab32.Name = 'Queijo'
itemprefab32.Description = 'Rico em sabor e muito caro'
itemprefab32.Price = 21000
itemprefab32.IsIllegal = false
itemprefab32.HasQuality = false
itemprefab32.ThrowingOutForbidden = false
itemprefab32.IsStackable = true
itemprefab32.Category = ItemCategory.CookingIngredient
itemprefab32.CanChangeColor = false
itemprefab32.ColorSlots = {}
itemprefab32.Partners = {}
itemprefab32.ScratchType = ScratchTextureType.Universal
itemprefab32.SusModifiers = {}
itemprefab32.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid32 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab32)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid32)


local itemprefab33 = ModUtilities.CreateItemPrefab()
itemprefab33.Name = 'Iogurte'
itemprefab33.Description = 'Aparentemente, é bom para o seu microbioma intestinal. Pode ser consumido diretamente ou cozido em pratos.'
itemprefab33.Price = 5000
itemprefab33.IsIllegal = false
itemprefab33.HasQuality = false
itemprefab33.ThrowingOutForbidden = false
itemprefab33.IsStackable = true
itemprefab33.Category = ItemCategory.CookingIngredient
itemprefab33.CanChangeColor = false
itemprefab33.ColorSlots = {}
itemprefab33.Partners = {}
itemprefab33.ScratchType = ScratchTextureType.Universal
itemprefab33.SusModifiers = {}
itemprefab33.EdibleData = (function()
local ntf = function(item, nutritionProfile)
-- Here you can set the nutritional values of the dish. This data is dynamic and cannot be exported to lua!
-- For example: 
nutritionProfile.Satiation.Value = 0.1
end
local ed = EdibleItemPrefabData.CreateInstance(EdibleTypeEnum.Other, ntf)
	return ed end)()


local itemgameid33 = ModUtilities.CreateNewItemAutoAssignId(CurrentModGuid, itemprefab33)
ModUtilities.AddSingleBuyItemToShop('clothier', itemgameid33)



end

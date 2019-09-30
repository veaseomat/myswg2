bh_dark_adept = Creature:new {
	objectName = "@mob/creature_names:dark_adept",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "dark_jedi",
	faction = "",
	level = 300,
	chanceHit = 30,
	damageMin = 500,
	damageMax = 1000,
	baseXp = 50000,
	baseHAM = 150000,
	baseHAMmax = 200000,
	armor = 3,
	resists = {80,80,80,80,80,80,80,80,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_dark_jedi_human_male_01.iff"},
	lootGroups = {
		{
			groups = {
				{group = "holocron_dark", chance = 3500000},
				{group = "holocron_light", chance = 3500000},
				{group = "color_crystals", chance = 3000000},
			},
			lootChance = 5000000
		},
		{
			groups = {
				{group = "holocron_dark", chance = 3500000},
				{group = "holocron_light", chance = 3500000},
				{group = "color_crystals", chance = 3000000},
			},
			lootChance = 2000000
		},
		{
			groups = {
				{group = "holocron_dark", chance = 3500000},
				{group = "holocron_light", chance = 3500000},
				{group = "color_crystals", chance = 3000000},
			},
			lootChance = 1000000
		},
	},
	weapons = {"dark_jedi_weapons_gen2"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcewielder)
}

CreatureTemplates:addCreatureTemplate(bh_dark_adept, "bh_dark_adept")

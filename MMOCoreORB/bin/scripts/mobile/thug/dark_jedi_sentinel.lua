dark_jedi_sentinel = Creature:new {
	objectName = "@mob/creature_names:dark_jedi_sentinel",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "dark_jedi",
	faction = "",
	level = 1,
	chanceHit = 50,
	damageMin = 1500,
	damageMax = 3000,
	baseXp = 100000,
	baseHAM = 250000,
	baseHAMmax = 300000,
	armor = 3,
	resists = {95,95,95,95,95,95,95,95,-1},
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
	creatureBitmask = PACK + HERD + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = { "dark_jedi" },
	lootGroups = {
		{
			groups = {
				{group = "melee_saber", chance = 5000000},
				{group = "holocron_dark2", chance = 500000},
			},
			lootChance = 10000000
		},
	},
	weapons = {"dark_jedi_weapons_gen4"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(dark_jedi_sentinel, "dark_jedi_sentinel")

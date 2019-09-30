--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor. 

one_handed_s2 = {
	minimumLevel = 1,
	maximumLevel = 1,
	customObjectName = "a Trophy Lightsaber",
	directObjectTemplate = "object/weapon/melee/sword/crafted_saber/sword_lightsaber_one_handed_s2_gen4.iff",
	craftingValues = {
		{"mindamage",500,600,0},
		{"maxdamage",600,700,0},
		{"attackspeed",1.1,1.0,0},
		{"woundchance",25,35,0},
		{"hitpoints",1000,1000,0},
		{"forcecost",7,5,0},
		{"attackhealthcost",0,0,0},
		{"attackactioncost",0,0,0},
		{"attackmindcost",0,0,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = -1,
	junkDealerTypeNeeded = JUNKNOTSELLABLE,

}

addLootItemTemplate("one_handed_s2", one_handed_s2)

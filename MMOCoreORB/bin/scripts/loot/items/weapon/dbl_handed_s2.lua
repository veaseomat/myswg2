--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor. 

dbl_handed_s2 = {
	minimumLevel = 1,
	maximumLevel = 1,
	customObjectName = "a Trophy Lightsaber",
	directObjectTemplate = "object/weapon/melee/polearm/crafted_saber/sword_lightsaber_polearm_s2_gen4.iff",
	craftingValues = {
		{"mindamage",255,305,0},
		{"maxdamage",345,395,0},
		{"attackspeed",2.4,1.8,0},
		{"woundchance",45,70,0},
		{"hitpoints",1000,1000,0},
		{"forcecost",10,8,0},
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

addLootItemTemplate("dbl_handed_s2", dbl_handed_s2)

factionRewardType = {
	armor = 1,
	weapon = 2,
	uniform = 3,
	furniture = 4,
	container = 5,
	terminal = 6,
	installation = 7,
	hireling = 8,
}

rebelRewardData = {
	weaponsArmorList = {
		"armor_marine_helmet", "armor_marine_chest_plate", "armor_marine_leggings", "armor_marine_boots", "armor_marine_bicep_l",
		"armor_marine_bicep_r",
	},

	weaponsArmor = {
		armor_marine_bicep_l = { index=1, type=factionRewardType.armor, display="@wearables_name:armor_marine_bicep_l", item="object/tangible/wearables/armor/marine/armor_marine_bicep_l.iff",cost=2000},
		armor_marine_bicep_r = { index=2, type=factionRewardType.armor, display="@wearables_name:armor_marine_bicep_r", item="object/tangible/wearables/armor/marine/armor_marine_bicep_r.iff",cost=2000},
		armor_marine_boots = { index=3, type=factionRewardType.armor, display="@wearables_name:armor_marine_boots", item="object/tangible/wearables/armor/marine/armor_marine_boots.iff",cost=3000},
		armor_marine_chest_plate = { index=4, type=factionRewardType.armor, display="@wearables_name:armor_marine_chest_plate", item="object/tangible/wearables/armor/marine/armor_marine_chest_plate.iff",cost=4000},
		armor_marine_helmet = { index=5, type=factionRewardType.armor, display="@wearables_name:armor_marine_helmet", item="object/tangible/wearables/armor/marine/armor_marine_helmet.iff",cost=3000},
		armor_marine_leggings = { index=6, type=factionRewardType.armor, display="@wearables_name:armor_marine_leggings", item="object/tangible/wearables/armor/marine/armor_marine_leggings.iff",cost=3000},
	},

	installationsList = {
		"landspeeder_x34", "small_house",
	},

	installations = {
		landspeeder_x34 = { type=factionRewardType.installation, display="@pet_deed:landspeeder_x34", item="object/tangible/deed/vehicle_deed/landspeeder_x34_deed.iff", generatedObjectTemplate="object/mobile/vehicle/landspeeder_x34.iff", cost=500 },
		small_house = { type=factionRewardType.installation, display="@deed:generic_house_small_deed", item="object/tangible/deed/player_house_deed/generic_house_small_deed.iff", generatedObjectTemplate="object/building/player/player_house_generic_small_style_01.iff", cost=1000 },
	},

	furnitureList = {
		"tech_armoire", "tech_bookcase", "frn_cabinet", "tech_chair", "tech_chest", "frn_coffee_table", "frn_couch", "frn_end_table"
	},

	furniture = {
		tech_armoire = { type=factionRewardType.container, display="@container_name:tech_armoire", item="object/tangible/furniture/technical/armoire_s01.iff", cost=1400},
		tech_bookcase = { type=factionRewardType.container, display="@container_name:tech_bookcase", item="object/tangible/furniture/technical/bookcase_s01.iff", cost=1400},
		frn_cabinet = { type=factionRewardType.furniture, display="@frn_n:frn_cabinet", item="object/tangible/furniture/technical/cabinet_s01.iff", cost=200},
		tech_chair = { type=factionRewardType.furniture, display="@frn_n:frn_chair", item="object/tangible/furniture/technical/chair_s01.iff", cost=1000},
		tech_chest =  { type=factionRewardType.container, display="@container_name:tech_chest", item="object/tangible/furniture/technical/chest_s01.iff", cost=1000},
		frn_coffee_table = { type=factionRewardType.furniture, display="@frn_n:frn_coffee_table", item="object/tangible/furniture/technical/coffee_table_s01.iff", cost=1200},
		frn_couch = { type=factionRewardType.furniture, display="@frn_n:frn_couch", item="object/tangible/furniture/technical/couch_s01.iff", cost=1200},
		frn_end_table = { type=factionRewardType.furniture, display="@frn_n:frn_end_table", item="object/tangible/furniture/technical/end_table_s01.iff", cost=1000},
	},

	hirelingList = {
		"rebel_trooper",
	},

	hirelings = {
		rebel_trooper = { type=factionRewardType.hireling, display="@mob/creature_names:rebel_trooper", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="rebel_trooper", cost=150},	}
}

imperialRewardData = {
	weaponsArmorList = {
		"armor_stormtrooper_helmet", "armor_stormtrooper_chest_plate", "armor_stormtrooper_leggings", "armor_stormtrooper_boots", "armor_stormtrooper_bicep_l", "armor_stormtrooper_bicep_r",
		"armor_stormtrooper_bracer_l", "armor_stormtrooper_bracer_r", "armor_stormtrooper_gloves", "armor_stormtrooper_utility_belt",
	},

	weaponsArmor = {
		armor_stormtrooper_bicep_l = { type=factionRewardType.armor, display="@wearables_name:armor_stormtrooper_bicep_l", item="object/tangible/wearables/armor/stormtrooper/armor_stormtrooper_bicep_l.iff",cost=1400},
		armor_stormtrooper_bicep_r = { type=factionRewardType.armor, display="@wearables_name:armor_stormtrooper_bicep_r", item="object/tangible/wearables/armor/stormtrooper/armor_stormtrooper_bicep_r.iff",cost=1400},
		armor_stormtrooper_boots = { type=factionRewardType.armor, display="@wearables_name:armor_stormtrooper_boots", item="object/tangible/wearables/armor/stormtrooper/armor_stormtrooper_boots.iff",cost=1400},
		armor_stormtrooper_chest_plate = { type=factionRewardType.armor, display="@wearables_name:armor_stormtrooper_chest_plate", item="object/tangible/wearables/armor/stormtrooper/armor_stormtrooper_chest_plate.iff", cost=4000},
		armor_stormtrooper_helmet = { type=factionRewardType.armor, display="@wearables_name:armor_stormtrooper_helmet", item="object/tangible/wearables/armor/stormtrooper/armor_stormtrooper_helmet.iff", cost=2100},
		armor_stormtrooper_leggings = { type=factionRewardType.armor, display="@wearables_name:armor_stormtrooper_leggings", item="object/tangible/wearables/armor/stormtrooper/armor_stormtrooper_leggings.iff",cost=2100},
		armor_stormtrooper_bracer_l = { type=factionRewardType.armor, display="@wearables_name:armor_stormtrooper_bracer_l", item="object/tangible/wearables/armor/stormtrooper/armor_stormtrooper_bracer_l.iff",cost=1400},
		armor_stormtrooper_bracer_r = { type=factionRewardType.armor, display="@wearables_name:armor_stormtrooper_bracer_r", item="object/tangible/wearables/armor/stormtrooper/armor_stormtrooper_bracer_r.iff",cost=1400},
		armor_stormtrooper_gloves = { type=factionRewardType.armor, display="@wearables_name:armor_stormtrooper_gloves", item="object/tangible/wearables/armor/stormtrooper/armor_stormtrooper_gloves.iff",cost=1400},
		armor_stormtrooper_utility_belt = { type=factionRewardType.armor, display="@wearables_name:armor_stormtrooper_utility_belt", item="object/tangible/wearables/armor/stormtrooper/armor_stormtrooper_utility_belt.iff",cost=1400},
	},

	uniformList = {
		"boots_s14", "hat_imp_s01", "jacket_s03", "pants_s15",
	},

	uniforms = {
		boots_s14 = { type=factionRewardType.uniform, display="@wearables_name:boots_s14", item="object/tangible/wearables/boots/boots_s14.iff", cost=140 },
		hat_imp_s01 = { type=factionRewardType.uniform, display="@wearables_name:hat_imp_s01", item="object/tangible/wearables/hat/hat_imp_s01.iff", cost=140 },
		jacket_s03 = { type=factionRewardType.uniform, display="@wearables_name:jacket_s03", item="object/tangible/wearables/jacket/jacket_s03.iff", cost=140 },
		pants_s15  = { type=factionRewardType.uniform, display="@wearables_name:pants_s15", item="object/tangible/wearables/pants/pants_s15.iff", cost=140 },
	},

	installationsList = {
		"landspeeder_x34", "small_house",
	},

	installations = {
		landspeeder_x34 = { type=factionRewardType.installation, display="@pet_deed:landspeeder_x34", item="object/tangible/deed/vehicle_deed/landspeeder_x34_deed.iff", generatedObjectTemplate="object/mobile/vehicle/landspeeder_x34.iff", cost=500 },
		small_house = { type=factionRewardType.installation, display="@deed:generic_house_small_deed", item="object/tangible/deed/player_house_deed/generic_house_small_deed.iff", generatedObjectTemplate="object/building/player/player_house_generic_small_style_01.iff", cost=1000 },
	},
	
	furnitureList = {
		"data_terminal_s1", "data_terminal_s2", "data_terminal_s3", "data_terminal_s4", "frn_table", "tech_armoire", "tech_bookcase", "frn_cabinet", "tech_chair",
		"tech_chest", "frn_coffee_table", "frn_couch", "frn_end_table"
	},

	furniture = {
		data_terminal_s1 = { type=factionRewardType.terminal, display="@frn_n:frn_data_terminal", item="object/tangible/furniture/imperial/data_terminal_s1.iff",cost=560},
		data_terminal_s2 = { type=factionRewardType.terminal, display="@frn_n:frn_data_terminal", item="object/tangible/furniture/imperial/data_terminal_s2.iff",cost=700},
		data_terminal_s3 = { type=factionRewardType.terminal, display="@frn_n:frn_data_terminal", item="object/tangible/furniture/imperial/data_terminal_s3.iff",cost=840},
		data_terminal_s4 = { type=factionRewardType.terminal, display="@frn_n:frn_data_terminal", item="object/tangible/furniture/imperial/data_terminal_s4.iff",cost=980},
		frn_table = { type=factionRewardType.furniture, display="@frn_n:frn_table", item="object/tangible/furniture/imperial/table_s1.iff",cost=700},
		tech_armoire = { type=factionRewardType.container, display="@container_name:tech_armoire", item="object/tangible/furniture/technical/armoire_s01.iff", cost=980},
		tech_bookcase = { type=factionRewardType.container, display="@container_name:tech_bookcase", item="object/tangible/furniture/technical/bookcase_s01.iff", cost=980},
		frn_cabinet = { type=factionRewardType.furniture, display="@frn_n:frn_cabinet", item="object/tangible/furniture/technical/cabinet_s01.iff", cost=200},
		tech_chair = { type=factionRewardType.furniture, display="@frn_n:frn_chair", item="object/tangible/furniture/technical/chair_s01.iff", cost=700},
		tech_chest =  { type=factionRewardType.container, display="@container_name:tech_chest", item="object/tangible/furniture/technical/chest_s01.iff", cost=700},
		frn_coffee_table = { type=factionRewardType.furniture, display="@frn_n:frn_coffee_table", item="object/tangible/furniture/technical/coffee_table_s01.iff", cost=700},
		frn_couch = { type=factionRewardType.furniture, display="@frn_n:frn_couch", item="object/tangible/furniture/technical/couch_s01.iff", cost=1050},
		frn_end_table = { type=factionRewardType.furniture, display="@frn_n:frn_end_table", item="object/tangible/furniture/technical/end_table_s01.iff", cost=700},
	},

	hirelingList = {
		"stormtrooper",
	},

	hirelings = {
		stormtrooper = { type=factionRewardType.hireling, display="@mob/creature_names:stormtrooper", item="object/intangible/pet/pet_control.iff", controlledObjectTemplate="stormtrooper", cost=420},
	},
}

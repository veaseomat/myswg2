dofile("scripts/managers/mission/mission_npc_spawn_points.lua");

crafting_mission_items = {
	"object/draft_schematic/item/quest_item/attunement_grid.iff",
	"object/draft_schematic/item/quest_item/current_alternator.iff",
	"object/draft_schematic/item/quest_item/feedback_controller.iff",
	"object/draft_schematic/item/quest_item/output_governor.iff",
	"object/draft_schematic/item/quest_item/power_regulator.iff"
}

bh_target_zones = {
	"corellia",
	"dantooine",
	"dathomir",
	"endor",
	"lok",
	"naboo",
	"rori",
	"talus",
	"tatooine",
	"yavin4"
}

bh_targets_at_mission_level = {
	level1 = { --level 1 - 20

	},
	level2 = { --level 21 - 50

	},
	level3 = { --level 51 - 200 (current highest is 120, probe droids will only have a 5% chance to find targets over level 190)
		"bh_dark_adept" --level 120
	}
}

enable_factional_crafting_missions = "true"

enable_factional_recon_missions = "true"

enable_factional_entertainer_missions = "true"

enable_same_account_bounty_missions = "false"

playerBountyKillBuffer = 10 * 1000 -- Buffer before player bounty can be put back on terminal after target is killed, set 0 to disable

playerBountyDebuffLength = 3 * 24 * 60 * 60 * 1000 -- Time before their bounty resets from the minimum amount
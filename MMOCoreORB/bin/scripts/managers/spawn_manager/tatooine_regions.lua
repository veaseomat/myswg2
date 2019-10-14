-- Planet Region Definitions
--
-- {"regionName", x, y, shape and size, tier, {"spawnGroup1", ...}, maxSpawnLimit}
-- For circle and ring, x and y are the center point
-- For rectangles, x and y are the bottom left corner. x2 and y2 (see below) are the upper right corner
-- Shape and size is a table with the following format depending on the shape of the area:
--   - Circle: {CIRCLE, radius}
--   - Rectangle: {RECTANGLE, x2, y2}
--   - Ring: {RING, inner radius, outer radius}
-- Tier is a bit mask with the following possible values where each hexadecimal position is one possible configuration.
-- That means that it is not possible to have both a spawn area and a no spawn area in the same region, but
-- a spawn area that is also a no build zone is possible.

require("scripts.managers.spawn_manager.regions")

tatooine_regions = {
	{"anchorhead_easy_newbie", 0, -5350, {CIRCLE, 700}, SPAWNAREA + NOWORLDSPAWNAREA, {"tatooine_easy"}, 96},
	{"anchorhead_medium_newbie", 0, -5350, {RING, 700, 1200}, SPAWNAREA + NOWORLDSPAWNAREA, {"tatooine_medium"}, 160},
	{"bestine_easy_newbie", -1200, -3695, {CIRCLE, 1750}, SPAWNAREA + NOWORLDSPAWNAREA, {"tatooine_easy"}, 256},
	{"bestine_medium_newbie", -1200, -3695, {RING, 1750, 2500}, SPAWNAREA + NOWORLDSPAWNAREA, {"tatooine_medium"}, 384},
	{"mos_eisley_easy_newbie", 3400, -4775, {CIRCLE, 1750}, SPAWNAREA + NOWORLDSPAWNAREA, {"tatooine_easy"}, 256},
	{"mos_eisley_medium_newbie", 3400, -4775, {RING, 1750, 2500}, SPAWNAREA + NOWORLDSPAWNAREA, {"tatooine_medium"}, 384},
	{"mos_entha_easy_newbie", 1490, 3165, {CIRCLE, 1750}, SPAWNAREA + NOWORLDSPAWNAREA, {"tatooine_easy"}, 256},
	{"mos_entha_medium_newbie", 1490, 3165, {RING, 1750, 2500}, SPAWNAREA + NOWORLDSPAWNAREA, {"tatooine_medium"}, 384},
	{"mos_espa_easy_newbie", -2950, 2222, {CIRCLE, 1750}, SPAWNAREA + NOWORLDSPAWNAREA, {"tatooine_easy"}, 256},
	{"mos_espa_medium_newbie", -2950, 2222, {RING, 1750, 2500}, SPAWNAREA + NOWORLDSPAWNAREA, {"tatooine_medium"}, 384},
	{"mos_taike_easy_newbie", 3835, 2350, {CIRCLE, 900}, SPAWNAREA + NOWORLDSPAWNAREA, {"tatooine_easy"}, 128},
	{"mos_taike_medium_newbie", 3835, 2350, {RING, 900, 1500}, SPAWNAREA + NOWORLDSPAWNAREA, {"tatooine_medium"}, 196},
	{"wayfar_easy_newbie", -5195, -6535, {CIRCLE, 600}, SPAWNAREA + NOWORLDSPAWNAREA, {"tatooine_easy"}, 64},
	{"wayfar_medium_newbie", -5195, -6535, {RING, 600, 1000}, SPAWNAREA + NOWORLDSPAWNAREA, {"tatooine_medium"}, 128},
	{"world_spawner", 0, 0, {CIRCLE, -1}, SPAWNAREA + WORLDSPAWNAREA, {"tatooine_world", "global"}, 2048}
}

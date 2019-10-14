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

corellia_regions = {

	{"bela_vistal_easy_newbie", 6750, -5740, {CIRCLE, 900}, SPAWNAREA + NOWORLDSPAWNAREA, {"corellia_easy"}, 128},
	{"bela_vistal_medium_newbie", 6750, -5740, {RING, 900, 1500}, SPAWNAREA + NOWORLDSPAWNAREA, {"corellia_medium"}, 192},
	{"coronet_easy_newbie", -230, -4460, {CIRCLE, 1750}, SPAWNAREA + NOWORLDSPAWNAREA, {"corellia_easy"}, 256},
	{"coronet_medium_newbie", -230, -4460, {RING, 1750, 2500}, SPAWNAREA + NOWORLDSPAWNAREA, {"corellia_medium"}, 384},
	{"doaba_guefel_easy_newbie", 3210, 5360, {CIRCLE, 1750}, SPAWNAREA + NOWORLDSPAWNAREA, {"corellia_easy"}, 256},
	{"doaba_guefel_medium_newbie", 3210, 5360, {RING, 1750, 2500}, SPAWNAREA + NOWORLDSPAWNAREA, {"corellia_medium"}, 384},
	{"kor_vella_easy_newbie", -3390, 3024, {CIRCLE, 1750}, SPAWNAREA + NOWORLDSPAWNAREA, {"corellia_easy"}, 256},
	{"kor_vella_medium_newbie", -3390, 3024, {RING, 1750, 2500}, SPAWNAREA + NOWORLDSPAWNAREA, {"corellia_medium"}, 384},
	{"tyrena_easy_newbie", -5236, -2553, {CIRCLE, 1750}, SPAWNAREA + NOWORLDSPAWNAREA, {"corellia_easy"}, 256},
	{"tyrena_medium_newbie", -5236, -2553, {RING, 1750, 2500}, SPAWNAREA + NOWORLDSPAWNAREA, {"corellia_medium"}, 384},
	{"vreni_island_easy_newbie", -5405, -6230, {CIRCLE, 600}, SPAWNAREA + NOWORLDSPAWNAREA, {"corellia_easy"}, 64},
	{"world_spawner", 0, 0, {CIRCLE, -1}, SPAWNAREA + WORLDSPAWNAREA, {"corellia_world", "global"}, 2048}
}

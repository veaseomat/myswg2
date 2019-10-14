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

naboo_regions = {
	{"beach_town", 0, 0, {CIRCLE, 0}, UNDEFINEDAREA},
	{"beachtown_easy_newbie", -5585, -35, {CIRCLE, 1000}, SPAWNAREA + NOWORLDSPAWNAREA, {"naboo_easy"}, 128},
	{"beachtown_medium_newbie", -5585, -35, {RING, 1000, 1900}, SPAWNAREA + NOWORLDSPAWNAREA, {"naboo_medium"}, 192},
	{"deeja_easy_newbie", 5060, -1470, {CIRCLE, 1300}, SPAWNAREA + NOWORLDSPAWNAREA, {"naboo_easy"}, 192},
	{"deeja_medium_newbie", 5060, -1470, {RING, 1300, 2200}, SPAWNAREA + NOWORLDSPAWNAREA, {"naboo_medium"}, 320},
	{"kaadara_easy_newbie", 5150, 6680, {CIRCLE, 1300}, SPAWNAREA + NOWORLDSPAWNAREA, {"naboo_easy"}, 256},
	{"kaadara_medium_newbie", 5150, 6680, {RING, 1300, 2200}, SPAWNAREA + NOWORLDSPAWNAREA, {"naboo_medium"}, 384},
	{"keren_easy_newbie", 1685, 2620, {CIRCLE, 1300}, SPAWNAREA + NOWORLDSPAWNAREA, {"naboo_easy"}, 256},
	{"keren_medium_newbie", 1685, 2620, {RING, 1300, 2200}, SPAWNAREA + NOWORLDSPAWNAREA, {"naboo_medium"}, 384},
	{"moenia_easy_newbie", 4800, -4820, {CIRCLE, 1300}, SPAWNAREA + NOWORLDSPAWNAREA, {"naboo_easy"}, 256},
	{"moenia_medium_newbie", 4800, -4820, {RING, 1300, 2200}, SPAWNAREA + NOWORLDSPAWNAREA, {"naboo_medium"}, 384},
	{"theed_easy_newbie_1", -5485, 4380, {CIRCLE, 1750}, SPAWNAREA + NOWORLDSPAWNAREA, {"naboo_easy"}, 192},
	{"theed_easy_newbie_2", -4940, 4030, {CIRCLE, 1750}, SPAWNAREA + NOWORLDSPAWNAREA, {"naboo_easy"}, 192},
	{"theed_medium_newbie", -5212, 4205, {RING, 1750, 2800}, SPAWNAREA + NOWORLDSPAWNAREA, {"naboo_medium"}, 448},
	{"world_spawner", 0, 0, {CIRCLE, -1}, SPAWNAREA + WORLDSPAWNAREA, {"naboo_world", "global"}, 2048}
}

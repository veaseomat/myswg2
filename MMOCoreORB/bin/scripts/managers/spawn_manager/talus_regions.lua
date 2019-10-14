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

talus_regions = {
	{"dearic_easy_newbie", 432, -3008, {CIRCLE, 1750}, SPAWNAREA + NOWORLDSPAWNAREA, {"talus_easy"}, 256},
	{"dearic_medium_newbie", 432, -3008, {RING, 1750, 2500}, SPAWNAREA + NOWORLDSPAWNAREA, {"talus_medium"}, 384},
	{"nashal_easy_newbie", 4352, 5209, {CIRCLE, 1750}, SPAWNAREA + NOWORLDSPAWNAREA, {"talus_easy"}, 256},
	{"nashal_medium_newbie", 4352, 5209, {RING, 1750, 2500}, SPAWNAREA + NOWORLDSPAWNAREA, {"talus_medium"}, 384},
	{"talus_imperial_outpost_easy_newbie", -2186, 2300, {CIRCLE, 1000}, SPAWNAREA + NOWORLDSPAWNAREA, {"talus_easy"}, 256},
	{"talus_imperial_outpost_medium_newbie", -2186, 2300, {RING, 1000, 1750}, SPAWNAREA + NOWORLDSPAWNAREA, {"talus_medium"}, 384},
	{"world_spawner", 0, 0, {CIRCLE, -1}, SPAWNAREA + WORLDSPAWNAREA, {"talus_world", "global"}, 2048},
}

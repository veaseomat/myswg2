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

rori_regions = {
	{"narmle_easy_newbie", -5205, -2290, {CIRCLE, 1400}, SPAWNAREA + NOWORLDSPAWNAREA, {"rori_easy"}, 256},
	{"narmle_medium_newbie", -5200, -2290, {RING, 1400, 2200}, SPAWNAREA + NOWORLDSPAWNAREA, {"rori_medium"}, 384},
	{"rebel_outpost", 3677, -6447, {CIRCLE, 1500}, SPAWNAREA + NOWORLDSPAWNAREA, {"rori_medium"}, 384},
	{"restuss_easy_newbie", 5300, 5700, {CIRCLE, 1400}, SPAWNAREA + NOWORLDSPAWNAREA, {"rori_easy"}, 256},
	{"restuss_medium_newbie", 5305, 5700, {RING, 1400, 2200}, SPAWNAREA + NOWORLDSPAWNAREA, {"rori_medium"}, 384},
	{"world_spawner", 0, 0, {CIRCLE, -1}, SPAWNAREA + WORLDSPAWNAREA, {"rori_world", "global"}, 2048}
}

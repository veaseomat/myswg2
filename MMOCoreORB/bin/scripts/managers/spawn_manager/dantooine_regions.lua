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

dantooine_regions = {
	{"hard_dantari_ne", 5104, 5168, {CIRCLE, 6000}, UNDEFINEDAREA, {"dantooine_world_npc"}, 256},
	{"hard_dantari_nw", -5136, 5152, {CIRCLE, 6000}, UNDEFINEDAREA, {"dantooine_world_npc"}, 256},
	{"hard_dantari_sw", -5184, -5184, {CIRCLE, 6000}, UNDEFINEDAREA, {"dantooine_world_npc"}, 256},
	{"world_spawner", 0, 0, {CIRCLE, -1}, SPAWNAREA + WORLDSPAWNAREA, {"dantooine_world", "global_hard"}, 2048}
}

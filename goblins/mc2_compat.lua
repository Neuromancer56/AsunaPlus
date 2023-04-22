-- this file sets content names for MineClone2 Game 

goblins.comp = {
    default = {
        -- nodes
        mossycobble = "mcl_core:mossycobble",
        dirt = "mcl_core:dirt",
        gravel = "mcl_core:gravel",
        cobble = "mcl_core:cobble",
        cactus = "mcl_core:cactus",
        lava_source = "mcl_core:lava_source",
        obsidian = "mcl_core:obsidian",
        diamond = "mcl_core:diamond",
        mese = "mcl_core:netherite",
        desert_stone = "mcl_core:desert_stone",
        stone = "mcl_core:stone",
        stone_with_coal = "mcl_core:stone_with_coal",
        stone_with_copper = "mcl_core:stone_with_copper",
        stone_with_iron = "mcl_core:stone_with_iron",
        stone_with_gold = "mcl_core:stone_with_gold",
        stone_with_diamond = "mcl_core:stone_with_diamond",
        chest = "mcl_chests:chest",
        chest_locked = "mcl_chests:chest",
        -- food
        apple = "mcl_core:apple",
        blueberries = "mcl_farming:melon",
        -- tools
        axe_wood = "mcl_tools:axe_wood",
        axe_stone = "mcl_tools:axe_stone",
        axe_bronze = "mcl_tools:axe_iron",
        axe_steel = "mcl_tools:axe_iron",
        axe_gold = "mcl_tools:axe_gold",
        axe_diamond = "mcl_tools:axe_diamond",
        axe_mese = "mcl_tools:axe_netherite",
        pick_wood = "mcl_tools:pick_wood",
        pick_stone = "mcl_tools:pick_stone",
        pick_bronze = "mcl_tools:pick_iron",
        pick_steel = "mcl_tools:pick_iron",
        pick_gold = "mcl_tools:pick_gold",
        pick_diamond = "mcl_tools:pick_diamond",
        pick_mese = "mcl_tools:pick_netherite",
        shovel_wood = "mcl_tools:shovel_wood",
        shovel_stone = "mcl_tools:shovel_wood",
        shovel_bronze = "mcl_tools:shovel_iron",
        shovel_steel = "mcl_tools:shovel_iron",
        shovel_gold = "mcl_tools:shovel_gold",
        shovel_diamond = "mcl_tools:shovel_diamond",
        shovel_mese = "mcl_tools:shovel_netherite",
        sword_wood = "mcl_tools:sword_wood",
        sword_stone = "mcl_tools:sword_stone",
        sword_steel = "mcl_tools:sword_iron",
        sword_gold = "mcl_tools:sword_gold",
        sword_diamond = "mcl_tools:sword_diamond",
        sword_mese = "mcl_tools:sword_netherite",
        -- items
        torch = "mcl_torches:torch",
        stick = "mcl_core:stick",
        flint = "mcl_core:flint",
        bronze_ingot = "mcl_copper:copper_ingot",
        steel_ingot = "mcl_core:iron_ingot",
        gold_ingot = "mcl_core:gold_ingot",

        coal_lump = "mcl_core:coal_lump",
        iron_lump = "mcl_core:iron_lump",
        gold_lump = "mcl_core:gold_lump",
        mese_lamp = "mesecons_torch:redstoneblock",
        mese_crytsal = "mcl_end:crystal"
    },

    flowers = {
        mushroom_brown = "mcl_mushrooms:mushroom_brown",
        mushroom_red = "mcl_mushrooms:mushroom_red"
    },

    mobs = {shears = "mcl_tools:shears"},

    png = {
        cobble = "default_cobble.png",
        dirt = "default_dirt.png",
        stones = "default_stone.png",
        grass_1 = "mtg_grass_1.png",
        moss = "mtg_moss.png",
        lava = "mtg_lava.png",
        mossycobble = "default_mossycobble.png",
        tool_stonepick = "default_tool_stonepick.png",
        mineral_coal = "mcl_core_coal_ore.png",
        mineral_copper = "mcl_copper_ore.png",
        mineral_tin = "mcl_copper_ore.png",
        mineral_iron = "mcl_core_iron_ore.png",
        mineral_gold = "mcl_core_gold_ore.png",
        mineral_diamond = "mcl_core_diamond_ore.png"

    }
}

local list_of_all_biomes = {

	-- underground:

	"FlowerForest_underground",
	"JungleEdge_underground",
	"ColdTaiga_underground",
	"IcePlains_underground",
	"IcePlainsSpikes_underground",
	"MegaTaiga_underground",
	"Taiga_underground",
	"ExtremeHills+_underground",
	"JungleM_underground",
	"ExtremeHillsM_underground",
	"JungleEdgeM_underground",
	"MangroveSwamp_underground",

	-- ocean:
--[[
	"RoofedForest_ocean",
	"JungleEdgeM_ocean",
	"BirchForestM_ocean",
	"BirchForest_ocean",
	"IcePlains_deep_ocean",
	"Jungle_deep_ocean",
	"Savanna_ocean",
	"MesaPlateauF_ocean",
	"ExtremeHillsM_deep_ocean",
	"Savanna_deep_ocean",
	"SunflowerPlains_ocean",
	"Swampland_deep_ocean",
	"Swampland_ocean",
	"MegaSpruceTaiga_deep_ocean",
	"ExtremeHillsM_ocean",
	"JungleEdgeM_deep_ocean",
	"SunflowerPlains_deep_ocean",
	"BirchForest_deep_ocean",
	"IcePlainsSpikes_ocean",
	"Mesa_ocean",
	"StoneBeach_ocean",
	"Plains_deep_ocean",
	"JungleEdge_deep_ocean",
	"SavannaM_deep_ocean",
	"Desert_deep_ocean",
	"Mesa_deep_ocean",
	"ColdTaiga_deep_ocean",
	"Plains_ocean",
	"MesaPlateauFM_ocean",
	"Forest_deep_ocean",
	"JungleM_deep_ocean",
	"FlowerForest_deep_ocean",
	"MushroomIsland_ocean",
	"MegaTaiga_ocean",
	"StoneBeach_deep_ocean",
	"IcePlainsSpikes_deep_ocean",
	"ColdTaiga_ocean",
	"SavannaM_ocean",
	"MesaPlateauF_deep_ocean",
	"MesaBryce_deep_ocean",
	"ExtremeHills+_deep_ocean",
	"ExtremeHills_ocean",
	"MushroomIsland_deep_ocean",
	"Forest_ocean",
	"MegaTaiga_deep_ocean",
	"JungleEdge_ocean",
	"MesaBryce_ocean",
	"MegaSpruceTaiga_ocean",
	"ExtremeHills+_ocean",
	"Jungle_ocean",
	"RoofedForest_deep_ocean",
	"IcePlains_ocean",
	"FlowerForest_ocean",
	"ExtremeHills_deep_ocean",
	"MesaPlateauFM_deep_ocean",
	"Desert_ocean",
	"Taiga_ocean",
	"BirchForestM_deep_ocean",
	"Taiga_deep_ocean",
	"JungleM_ocean",
	"MangroveSwamp_ocean",
	"MangroveSwamp_deep_ocean",
]]
	-- water or beach?

	"MesaPlateauFM_sandlevel",
	"MesaPlateauF_sandlevel",
	"MesaBryce_sandlevel",
	"Mesa_sandlevel",

	-- beach:

	"FlowerForest_beach",
	"Forest_beach",
	"StoneBeach",
	"ColdTaiga_beach_water",
	"Taiga_beach",
	"Savanna_beach",
	"Plains_beach",
	"ExtremeHills_beach",
	"ColdTaiga_beach",
	"Swampland_shore",
	"MushroomIslandShore",
	"JungleM_shore",
	"Jungle_shore",
	"MangroveSwamp_shore",

	-- dimension biome:

	"Nether",
	"BasaltDelta",
	"CrimsonForest",
	"WarpedForest",
	"SoulsandValley",
	"End",

	-- Overworld regular:

	"Mesa",
	"FlowerForest",
	"Swampland",
	"Taiga",
	"ExtremeHills",
	"ExtremeHillsM",
	"ExtremeHills+_snowtop",
	"Jungle",
	"Savanna",
	"BirchForest",
	"MegaSpruceTaiga",
	"MegaTaiga",
	"ExtremeHills+",
	"Forest",
	"Plains",
	"Desert",
	"ColdTaiga",
	"MushroomIsland",
	"IcePlainsSpikes",
	"SunflowerPlains",
	"IcePlains",
	"RoofedForest",
	"ExtremeHills+_snowtop",
	"MesaPlateauFM_grasstop",
	"JungleEdgeM",
	"JungleM",
	"BirchForestM",
	"MesaPlateauF",
	"MesaPlateauFM",
	"MesaPlateauF_grasstop",
	"MesaBryce",
	"JungleEdge",
	"SavannaM",
	"MangroveSwamp",
}

local aoc_range = 20

goblins.invis = mcl_mobs.invis

function goblins:register_mob(...)
    mcl_mobs:register_mob(...)
end

function goblins:register_egg(...)
    mcl_mobs:register_egg(...)
end

function goblins:set_animation(...)
    mcl_mobs:set_animation(...)
end

function goblins:spawn(def)
    print("spawning def: "..dump(def))
    if not def.name then
     print("warning:"," def name not found!")
        return
    end

    local name = def.name
    local dimension        = def.dimension or "overworld"
	local type_of_spawning = def.type_of_spawning or "ground"
	local biomes           = def.biomes or list_of_all_biomes
	local min_light        = def.min_light or 0
	local max_light        = def.max_light or (minetest.LIGHT_MAX + 1)
	local chance           = def.chance or 1000
    local interval         = def.interval or 10
	local aoc              = def.aoc or aoc_range
	local min_height       = def.min_height or mcl_mapgen.overworld.min
	local max_height       = def.max_height or mcl_mapgen.overworld.max
	local day_toggle       = def.day_toggle
	local on_spawn         = def.on_spawn
	local check_position   = def.check_position
    mcl_mobs:spawn_specific(name, dimension, type_of_spawning, biomes, min_light, max_light, interval, chance, aoc, min_height, max_height, day_toggle, on_spawn)
end

function goblins.node_sound_stone_defaults(...)
    mcl_sounds.node_sound_stone_defaults(...)
end

function goblins.node_sound_dirt_defaults(...)
    mcl_sounds.node_sound_dirt_defaults(...)
end

function goblins.node_sound_leaves_defaults(...)
    mcl_sounds.node_sound_leaves_defaults(...)
end

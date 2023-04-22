-- this file sets content names for Minetest Game 

goblins.comp = {
    default = {
        -- nodes
        mossycobble = "default:mossycobble",
        dirt = "default:dirt",
        gravel = "default:gravel",
        cobble = "default_cobble",
        cactus = "default:cactus",
        lava_source = "default:lava_source",
        obsidian = "default:obsidian",
        diamond = "default:diamond",
        mese = "default:mese",
        desert_stone = "default:desert_stone",
        stone = "default:stone",
        stone_with_coal = "default:stone_with_coal",
        stone_with_copper = "default:stone_with_copper",
        stone_with_iron = "default:stone_with_iron",
        stone_with_gold = "default:stone_with_gold",
        stone_with_diamond = "default:stone_with_diamond",
        chest = "default:chest",
        chest_locked = "default:chest_locked",
        -- food
        apple = "default:apple",
        blueberries = "default:blueberries",
        -- tools
        axe_wood = "default:axe_wood",
        axe_stone = "default:axe_stone",
        axe_bronze = "default:axe_bronze",
        axe_steel = "default:axe_steel",
        axe_diamond = "default:axe_diamond",
        axe_mese = "default:axe_mese",
        pick_wood = "default:pick_wood",
        pick_stone = "default:pick_stone",
        pick_bronze = "default:pick_bronze",
        pick_steel = "default:pick_steel",
        pick_gold = "default:pick_gold",
        pick_diamond = "default:pick_diamond",
        pick_mese = "default:pick_mese",
        shovel_wood = "default:shovel_wood",
        shovel_stone = "default:shovel_stone",
        shovel_bronze = "default:shovel_bronze",
        shovel_steel = "default:shovel_steel",
        shovel_diamond = "default:shovel_diamond",
        shovel_mese = "default:shovel_mese",
        sword_wood = "default:sword_wood",
        sword_stone = "default:sword_stone",
        sword_steel = "default:sword_steel",
        sword_gold = "default:sword_steel",
        sword_diamond = "default:sword_diamond",
        sword_mese = "default:sword_mese",
        -- items
        torch = "default:torch",
        stick = "default:stick",
        flint = "default:flint",
        bronze_ingot = "default:bronze_ingot",
        steel_ingot = "default:steel_ingot",
        gold_ingot = "default:gold_ingot",

        coal_lump = "default:coal_lump",
        iron_lump = "default:iron_lump",
        gold_lump = "default:gold_lump",
        mese_lamp = "default:mese_lamp",
        mese_crytsal = "default:mese_crystal"
    },

    flowers = {
        mushroom_brown = "flowers:mushroom_brown",
        mushroom_red = "flowers:mushroom_red"
    },

    mobs = {shears = "mobs:shears"},

    png = {
        cobble = "default_cobble.png",
        dirt = "default_dirt.png",
        stones = "default_stones.png",
        grass_1 = "default_grass_1.png",
        moss = "default_moss.png",
        lava = "default_lava.png",
        mossycobble = "default_mossycobble.png",
        tool_stonepick = "default_tool_stonepick.png",
        mineral_coal = "default_mineral_coal.png",
        mineral_copper = "default_mineral_copper.png",
        mineral_tin = "default_mineral_tin.png",
        mineral_iron = "default_mineral_iron.png",
        mineral_gold = "default_mineral_gold.png",
        mineral_diamond = "default_mineral_diamond.png"

    }
}

goblins.invis = mobs.invis

function goblins:register_egg(...)
    mobs:register_egg(...)
end

function goblins:register_mob(...)
    mobs:register_mob(...)
end

function goblins:spawn(def)
    mobs:spawn(def)
end

function goblins:set_animation(...)
    mobs:set_animation(...)
end

function goblins.node_sound_stone_defaults(...)
    default.node_sound_stone_defaults(...)
end

function goblins.node_sound_dirt_defaults(...)
    default.node_sound_dirt_defaults(...)
end

function goblins.node_sound_leaves_defaults(...)
    default.node_sound_leaves_defaults(...)
end

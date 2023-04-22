-- goblin namegen sets from https://github.com/LukeMS/lua-namegen
-- libtcod https://github.com/libtcod/libtcod name set format have been adapted for my Goblins gen_name function
local S = minetest.get_translator("goblins")

local gob_name_parts = goblins.gob_name_parts
local gob_words = goblins.words_desc

local function variance(min, max)
    local target = math.random(min, max) / 100
    -- print(target)
    return target
end

-- goblin spawning behavior moved to mod_storage database make any changes you wish there!

-- this table defines the goblins with how they differ from the goblin template.
goblins.gob_types = {
    digger = {

        description = S("Cavedigger Goblin"),
        lore = S(
            "The digger burrows though stone to carve out the bowels of a goblin warren."),
        damage = 1,
        hp_min = 5,
        hp_max = 10,
        runaway_from = "player",
        sounds = {
            random = "goblins_goblin_breathing",
            war_cry = "goblins_goblin_attack",
            attack = "goblins_goblin_attack",
            damage = "goblins_goblin_damage",
            death = "goblins_goblin_death",
            replace = "goblins_goblin_pick",
            gain = .5,
            distance = 15
        },
        textures = {"goblins_goblin_digger.png"},

        -- if either digging style is set too close to "1", then the digging will go vertical!
        -- best to set either of these less than 0.5 to give the gobs time to roam...
        do_custom = function(self)
            goblins.danger_dig(self)
            if self.time_of_day > 0.2 and self.time_of_day < 0.8 then
                if math.random() < 0.01 then -- higher values for more straight tunnels and room-like features
                    goblins.tunneling(self, "digger")
                elseif math.random() < 0.5 then -- higher values more rough, tight and twisty digging
                    goblins.search_replace(self, 15, -- search_rate how often do we search?
                                           10, -- search_rate_above
                    10, -- search_rate_below
                    .6, -- search_offset
                    1.2, -- search_offset_above
                    1, -- search_offset_below
                    2, -- replace_rate
                    {
                        "group:soil", "group:sand", goblins.comp.default.gravel,
                        goblins.comp.default.stone, goblins.comp.default.desert_stone, "group:torch"
                    }, -- replace_what
                    "air", -- replace_with
                    nil, -- replace_rate_secondary
                    nil, -- replace_with_secondary
                    nil, -- decorate
                    {1}, -- primary and secondary (if used) tool index
                    nil -- debug messages
                    )
                end
            elseif math.random() < 0.5 then
                -- and self.object:get_pos().y < 0 then
                goblins.search_replace(self, 50, -- search_rate how often do we search?
                                       2, -- search_rate_above
                10000, -- search_rate_below
                .6, -- search_offset
                1.5, -- search_offset_above
                1, -- search_offset_below
                10, -- replace_rate
                {
                    "group:soil", "group:sand", goblins.comp.default.gravel,
                    goblins.comp.default.stone, goblins.comp.default.desert_stone, "group:torch"
                }, -- replace_what
                "air", -- replace_with
                nil, -- replace_rate_secondary
                nil, -- replace_with_secondary
                nil, -- decorate
                {1}, -- primary and secondary (if used) tool index
                nil -- debug messages
                )
            end
        end,
        -- spawning = goblins.db_read("digger_spawning"),
        spawning = goblins.db_read("digger_spawning"),
        additional_properties = {
            goblin_tools = {
                "goblins:pick_mossycobble", goblins.comp.default.pick_stone,
                goblins.comp.default.pick_wood
            }
        },
        after_activate = function(self)
            -- self.goblin_tools = {"goblins:pick_mossycobble",goblins.comp.default.pick_stone,goblins.comp.default.pick_wood}
            goblins.tool_attach(self, self.goblin_tools)
        end
    },
    cobble = {
        description = S("Cobblemoss Goblin"),
        lore = S(
            "Cobbler crumbles walls infusing them with moss to collect moisture for a fetid, mushroom friendly habitat."),
        damage = 1,
        hp_min = 5,
        hp_max = 10,
        sounds = {
            random = {"goblins_goblin_breathing", gain = 0.5},
            war_cry = "goblins_goblin_war_cry",
            attack = "goblins_goblin_attack",
            damage = "goblins_goblin_damage",
            death = "goblins_goblin_death",
            replace = "default_place_node",
            gain = 0.8,
            distance = 15
        },
        textures = {
            {"goblins_goblin_cobble1.png"}, {"goblins_goblin_cobble2.png"}
        },
        runaway_from = "player",

        do_custom = function(self)
            goblins.danger_dig(self)
            if math.random() < .2 then
                goblins.search_replace(self, 50, -- search_rate
                20, -- search_rate_above
                20, -- search_rate_below
                1, -- search_offset
                2, -- search_offset_above
                1, -- search_offset_below
                20, -- replace_rate
                goblins.comp.default.mossycobble, -- replace_what
                "goblins:moss", -- replace_with
                nil, -- replace_rate_secondary
                nil, -- replace_with_secondary
                nil, -- decorate
                {3}, -- primary and secondary tool index
                nil -- debug messages
                )
            else
                goblins.search_replace(self, 50, -- search_rate
                20, -- search_rate_above
                20, -- search_rate_below
                1, -- search_offset
                2, -- search_offset_above
                1, -- search_offset_below
                20, -- replace_rate
                {"group:stone", "group:torch"}, -- replace_what
                goblins.comp.default.mossycobble, -- replace_with
                90, -- replace_rate_secondary
                "goblins:mossycobble_trap", -- replace_with_secondary
                nil, -- decorate
                {1, 2}, -- primary and secondary tool index
                nil -- debug messages
                )
            end
        end,
        additional_properties = {
            goblin_tools = {
                goblins.comp.default.mossycobble, goblins.comp.default.axe_stone, "goblins:moss",
                goblins.comp.default.sword_stone
            }
        },
        after_activate = function(self)
            goblins.tool_attach(self, self.goblin_tools)
        end,
        spawning = goblins.db_read("cobble_spawning")
    },
    snuffer = {
        description = S("Snuffer Goblin"),
        lore = S(
            "The Snuffer likes to put out pesky torches and steal them, collecting the fuel for trap makers."),
        damage = 1,
        hp_min = 5,
        hp_max = 10,
        textures = {{"goblins_goblin_snuffer.png"}},
        stay_near = "group:torch",
        runaway_from = "player",

        do_custom = function(self)
            goblins.danger_dig(self)
            if math.random() < 0.01 then
                goblins.tool_attach(self, self.goblin_tools)
            end
            goblins.search_replace(self, 10, -- search_rate
            10, -- search_rate_above
            10, -- search_rate_below
            2, -- search_offset
            2, -- search_offset_above
            2, -- search_offset_below
            10, -- replace_rate
            {"group:torch"}, -- replace_what
            "air", -- replace_with
            1000, -- replace_rate_secondary
            "goblins:mossycobble_trap", -- replace_with_secondary
            nil, -- decorate
            {2}, -- primary and secondary tool index
            nil -- debug messages
            )
        end,
        additional_properties = {
            goblin_tools = {goblins.comp.default.axe_stone, goblins.comp.default.stick}
        },
        after_activate = function(self)
            goblins.tool_attach(self, self.goblin_tools)
        end,
        spawning = goblins.db_read("snuffer_spawning")
    },
    fungiler = {
        description = S("Goblin Fungiler"),
        lore = S(
            "Fungilers keep the warren full of tasty mushrooms which are also fuel for pyromancy."),
        damage = 1,
        hp_min = 5,
        hp_max = 10,
        sounds = {
            random = "goblins_goblin_breathing",
            war_cry = "goblins_goblin_war_cry",
            attack = "goblins_goblin_attack",
            damage = "goblins_goblin_damage",
            death = "goblins_goblin_death",
            replace = "default_place_node",
            gain = 0.8,
            distance = 15
        },
        textures = {
            {"goblins_goblin_fungler1.png"}, {"goblins_goblin_fungler2.png"}
        },

        runaway_from = "player",

        do_custom = function(self)
            goblins.danger_dig(self)
            if math.random() < 0.01 then
                goblins.tool_attach(self, self.goblin_tools)
            end
            if math.random() < .4 then
                goblins.search_replace(self, 50, -- search_rate
                20, -- search_rate_above
                20, -- search_rate_below
                1.5, -- search_offset
                1.5, -- search_offset_above
                0, -- search_offset_below
                20, -- replace_rate
                "goblins:moss", -- replace_what
                "goblins:mushroom_goblin3", -- replace_with
                50, -- replace_rate_secondary
                "goblins:mushroom_goblin4", -- replace_with_secondary
                true, -- decorate
                {1, 1}, -- primary and secondary tool index
                nil -- debug messages
                )
            else
                goblins.search_replace(self, 50, -- search_rate
                20, -- search_rate_above
                20, -- search_rate_below
                1.5, -- search_offset
                1.5, -- search_offset_above
                0, -- search_offset_below
                20, -- replace_rate
                "goblins:moss", -- replace_what
                "goblins:mushroom_goblin", -- replace_with
                50, -- replace_rate_secondary
                "goblins:mushroom_goblin2", -- replace_with_secondary
                true, -- decorate
                {1, 1}, -- primary and secondary tool index
                nil -- debug messages
                )
            end
        end,
        additional_properties = {
            goblin_tools = {
                "goblins:mushroom_goblin", "goblins:pick_mossycobble"
            }
        },
        after_activate = function(self)
            goblins.tool_attach(self, self.goblin_tools)
        end,
        spawning = goblins.db_read("fungiler_spawning")
    },
    coal = {
        description = S("Coalbreath Goblin"),
        lore = S(
            "Coal is essential for pyromantic pyrotechnics, the coalbreath goblin attuned to this."),
        damage = 1,
        hp_min = 5,
        hp_max = 10,
        textures = {{"goblins_goblin_coal1.png"}, {"goblins_goblin_coal2.png"}},

        do_custom = function(self)
            goblins.danger_dig(self)
            if math.random() < 0.0001 then -- vary rarely will attack and only if player looks like a threat
                goblins.tool_attach(self, goblins.comp.default.sword_stone)
                goblins.attack(self)
                -- print("looking for a reason to fight")
            elseif math.random() < 0.01 then
                goblins.tool_attach(self, self.goblin_tools)
            end
            goblins.search_replace(self, 100, -- search_rate
            100, -- search_rate_above
            100, -- search_rate_below
            1, -- search_offset
            2, -- search_offset_above
            1, -- search_offset_below
            10, -- replace_rate
            {goblins.comp.default.mossycobble, goblins.comp.default.stone_with_coal, "group:torch"}, -- replace_what
                                   goblins.comp.default.mossycobble, -- replace_with
            50, -- replace_rate_secondary
            "goblins:stone_with_coal_trap", -- replace_with_secondary
            nil, -- decorate
            {1, 2}, -- primary and secondary tool index
            nil -- debug messages
            )
        end,
        additional_properties = {
            goblin_tools = {"goblins:pick_mossycobble", goblins.comp.default.coal_lump}
        },
        after_activate = function(self)
            goblins.tool_attach(self, self.goblin_tools)
        end,
        spawning = goblins.db_read("coal_spawning")
    },
    copper = {
        description = S("Coppertooth Goblin"),
        lore = S(
            "Coppertooth seek metals to enhance their mining tools and are easily aggressive in defence."),
        damage = 2,
        hp_min = 10,
        hp_max = 20,
        textures = {
            {"goblins_goblin_copper1.png"}, {"goblins_goblin_copper2.png"}
        },
        drops = goblins.db_read("copper_drops"),

        do_custom = function(self)
            goblins.danger_dig(self)
            if math.random() < 0.00001 then -- may take a while to build courage
                goblins.tool_attach(self, goblins.comp.default.sword_bronze)
                goblins.attack(self)
                -- print("looking for a reason to fight")
            elseif math.random() < 0.01 then
                goblins.tool_attach(self, self.goblin_tools)
            end
            goblins.search_replace(self, 100, -- search_rate
            100, -- search_rate_above
            100, -- search_rate_below
            1, -- search_offset
            2, -- search_offset_above
            1, -- search_offset_below
            10, -- replace_rate
            {goblins.comp.default.mossycobble, goblins.comp.default.stone_with_copper, "group:torch"}, -- replace_what
                                   goblins.comp.default.mossycobble, -- replace_with
            50, -- replace_rate_secondary
            "goblins:stone_with_copper_trap", -- replace_with_secondary
            nil, -- decorate
            {1, 2}, -- primary and secondary tool index
            nil -- debug messages
            )
        end,
        additional_properties = {
            goblin_tools = {goblins.comp.default.pick_bronze, goblins.comp.default.sword_bronze}
        },
        after_activate = function(self)
            goblins.tool_attach(self, self.goblin_tools)
        end,
        spawning = goblins.db_read("copper_spawning")
    },
    iron = {
        description = S("Ironpick Goblin"),
        lore = S(
            "Most fey creatures avoid iron, but the ironpick goblins seem oddly immune."),
        damage = 2,
        hp_min = 10,
        hp_max = 20,
        textures = {{"goblins_goblin_iron1.png"}, {"goblins_goblin_iron2.png"}},
        drops = goblins.db_read("iron_drops"),

        do_custom = function(self)
            goblins.danger_dig(self)
            if math.random() < 0.01 then
                goblins.tool_attach(self, goblins.comp.default.sword_steel)
                goblins.attack(self)
                -- print("looking for a reason to fight")
            elseif math.random() < 0.01 then
                goblins.tool_attach(self, self.goblin_tools)
            end
            goblins.search_replace(self, 100, -- search_rate
            100, -- search_rate_above
            100, -- search_rate_below
            1, -- search_offset
            2, -- search_offset_above
            1, -- search_offset_below
            10, -- replace_rate
            {goblins.comp.default.mossycobble, goblins.comp.default.stone_with_iron, "group:torch"}, -- replace_what
                                   goblins.comp.default.mossycobble, -- replace_with
            50, -- replace_rate_secondary
            "goblins:stone_with_iron_trap", -- replace_with_secondary
            nil, -- decorate
            {1, 2}, -- primary and secondary tool index
            nil -- debug messages
            )
        end,
        additional_properties = {
            goblin_tools = {
                goblins.comp.default.pick_steel, goblins.comp.default.sword_steel, goblins.comp.default.axe_steel
            }
        },
        after_activate = function(self)
            goblins.tool_attach(self, self.goblin_tools)
        end,
        spawning = goblins.db_read("iron_spawning")
    },
    gold = {
        description = S("Goldshiv Goblin"),
        lore = S(
            "Goldshiv goblins are jealous creatures and aggressive at the slightest provocation"),
        damage = 3,
        hp_min = 10,
        hp_max = 30,
        textures = {{"goblins_goblin_gold1.png"}, {"goblins_goblin_gold2.png"}},
        drops = goblins.db_read("gold_drops"),

        do_custom = function(self)
            goblins.danger_dig(self)
            if math.random() < 0.01 then
                goblins.tool_attach(self, goblins.comp.default.sword_diamond)
                goblins.attack(self)
                -- print("looking for a reason to fight")
            elseif math.random() < 0.01 then
                goblins.tool_attach(self, self.goblin_tools)
            end
            goblins.search_replace(self, 100, -- search_rate
            100, -- search_rate_above
            100, -- search_rate_below
            1, -- search_offset
            2, -- search_offset_above
            1, -- search_offset_below
            10, -- replace_rate
            {goblins.comp.default.mossycobble, goblins.comp.default.stone_with_gold, "group:torch"}, -- replace_what
                                   goblins.comp.default.mossycobble, -- replace_with
            30, -- replace_rate_secondary
            "goblins:stone_with_gold_trap", -- replace_with_secondary
            nil, -- decorate
            {1, 2}, -- primary and secondary tool index
            nil -- debug messages
            )
        end,
        additional_properties = {
            goblin_tools = {goblins.comp.default.sword_steel, goblins.comp.default.sword_diamond}
        },
        after_activate = function(self)
            goblins.tool_attach(self, self.goblin_tools)
        end,
        spawning = goblins.db_read("gold_spawning")
    },
    diamond = {
        description = S("Diamondagger Goblin"),
        lore = S(
            "Diamonddagger goblins know their blades are among the sharpest and seem eager to prove it."),
        damage = 3,
        hp_min = 20,
        hp_max = 30,
        textures = {
            {"goblins_goblin_diamond1.png"}, {"goblins_goblin_diamond2.png"}
        },
        drops = goblins.db_read("diamond_drops"),
        follow = goblins.db_read("diamond_follow"),
        do_custom = function(self)
            goblins.danger_dig(self)
            if math.random() < 0.01 then
                goblins.tool_attach(self, goblins.comp.default.sword_diamond)
                goblins.attack(self)
                -- print("looking for a reason to fight")
            elseif math.random() < 0.01 then
                goblins.tool_attach(self, self.goblin_tools)
            end
            goblins.search_replace(self, 100, -- search_rate
            100, -- search_rate_above
            100, -- search_rate_below
            1, -- search_offset
            2, -- search_offset_above
            1, -- search_offset_below
            10, -- replace_rate
            {goblins.comp.default.mossycobble, goblins.comp.default.stone_with_diamond, "group:torch"}, -- replace_what
                                   goblins.comp.default.mossycobble, -- replace_with
            30, -- replace_rate_secondary
            "goblins:stone_with_diamond_trap", -- replace_with_secondary
            nil, -- decorate
            {2, 1}, -- primary and secondary tool index
            nil -- debug messages
            )
        end,
        additional_properties = {
            goblin_tools = {goblins.comp.default.sword_diamond, goblins.comp.default.pick_diamond}
        },
        after_activate = function(self)
            goblins.tool_attach(self, self.goblin_tools)
        end,
        spawning = goblins.db_read("diamond_spawning")
    },
    hoarder = {
        description = S("Goblin Hoarder"),
        lore = S("Woe to the spelunker who encounters a hoarder unprepared!"),
        type = "monster",
        damage = 4,
        hp_min = 20,
        hp_max = 40,
        textures = {{"goblins_goblin_hoarder.png"}},
        drops = goblins.db_read("hoarder_drops"),

        do_custom = function(self)
            goblins.danger_dig(self)
            if math.random() < 0.01 then
                goblins.tool_attach(self, goblins.comp.default.sword_mese)
                goblins.attack(self)
                -- print("looking for a reason to fight")
            elseif math.random() < 0.01 then
                goblins.tool_attach(self, self.goblin_tools)
            end

            goblins.search_replace(self, 100, -- search_rate
            100, -- search_rate_above
            100, -- search_rate_below
            1, -- search_offset
            2, -- search_offset_above
            1, -- search_offset_below
            10, -- replace_rate
            {"group:stone", "group:torch"}, -- replace_what
            goblins.comp.default.mossycobble, -- replace_with
            10, -- replace_rate_secondary
            "goblins:mossycobble_trap", -- replace_with_secondary
            nil, -- decorate
            {2, 3}, -- primary and secondary tool index
            nil -- debug messages
            )
        end,
        additional_properties = {
            goblin_tools = {
                goblins.comp.default.pick_mese, goblins.comp.default.sword_diamond,
                goblins.comp.default.sword_mese
            }
        },
        after_activate = function(self)
            goblins.tool_attach(self, self.goblin_tools)
            local pos = self.object:get_pos()
            goblins.place_chest(self, pos)
        end,
        spawning = goblins.db_read("hoarder_spawning")
    }
}

-- gob_types.king = gob_types.hoarder  -- for compatability
--mobs:alias_mob("goblins:goblin_king", "goblins:goblin_hoarder")

----------------------------------
-- DEFAULT GOBLIN TEMPLATES
----------------------------------

-- these are drops all goblins will have
local gob_drops = goblins.db_read("gob_drops")

goblins.goblin_template = { -- your average goblin,
    description = "Basic Goblin",
    lore = "This goblin has a story yet to be...",
    type = "npc",
    passive = false,
    attack_type = "dogfight",
    attack_monsters = false,
    attack_npcs = false,
    attack_players = true,
    group_attack = true,
    runaway = true,
    damage = 1,
    reach = 2,
    knock_back = true,
    hp_min = 5,
    hp_max = 10,
    armor = 100,
    visual = "mesh",
    mesh = "goblins_goblin.b3d",
    textures = {{"goblins_goblin_cobble1.png"}, {"goblins_goblin_cobble2.png"}},
    blood_texture = "goblins_blood.png",
    collisionbox = {-0.25, -.01, -0.25, 0.25, .9, 0.25},
    drawtype = "front",
    makes_footstep_sound = true,
    sounds = {
        random = "goblins_goblin_breathing",
        war_cry = "goblins_goblin_war_cry",
        attack = "goblins_goblin_attack",
        damage = "goblins_goblin_damage",
        death = "goblins_goblin_death",
        replace = "goblins_goblin_cackle",
        gain = 0.05,
        distance = 15
    },
    walk_velocity = 2,
    run_velocity = 3,
    pathfinding = 1,
    jump = true,
    jump_height = 5,
    step_height = 1.5,
    fear_height = 4,
    water_damage = 0,
    lava_damage = 2,
    light_damage = 1,
    lifetimer = 360,
    view_range = 10,
    stay_near = "group:stone",
    order = "follow",

    animation = {
        stand_speed = 30,
        stand_start = 0,
        stand_end = 79,
        walk_speed = 40,
        walk_start = 168,
        walk_end = 187,
        run_speed = 60,
        run_start = 168,
        run_end = 187,
        punch_speed = 60,
        punch_start = 200,
        punch_end = 219
    },
    drops = goblins.db_read("template_drops"),
    follow = goblins.db_read("template_follow"),

    on_spawn = function(self)
        self.groups = {"goblin"}
        self.groups_defend = {"goblin", "gobdog", "goblin_friend"}
        if not self.shrewdness then self.shrewdness = 20 end
        if not self.aggro_wielded then
            self.aggro_wielded = {"sword", "axe", "bow", "spear", "knife"}
        end -- some goblins are looking for a fight
        if not self.secret_name then
            self.secret_name = goblins.generate_name(gob_name_parts)
        end
        -- print (dump(self.secret_name))
        -- print (dump(self.special_gifts).. " are precious to "..dump(self.secret_name).. "!")
        local pos = vector.round(self.object:get_pos())
        if not pos then
            print(dump(self) .. "\n **position error!** \n")
            return
        end -- something went wrong!
        if not self.secret_territory then
            local opt_data = {}
            opt_data[self.secret_name] = os.time() -- add this goblin as a key member of territory
            local territory = {goblins.territory(pos, opt_data)}
            -- print("territory = "..dump(territory).."opt_data = "..dump(opt_data))
            self.secret_territory = {name = territory[1], vol = territory[2]}
            -- print(dump(self.secret_territory.name).." secret_territory assigned")
        else
            -- print(dump(self.secret_territory.name).." secret_territory already assigned")
        end

        local drop_list = {}
        if not self.drops_set then
            drop_list = table.copy(self.drops)
            for _, v in ipairs(gob_drops) do
                table.insert(drop_list, v)
            end
            self.drops = drop_list
            self.drops_set = true
        end
        local color_var = "#" .. math.random(10, 50) .. math.random(10, 50) ..
                              math.random(10, 50)
        -- print("COLOR_VAR: "..color_var)
        self.object:set_texture_mod("^[colorize:" .. color_var .. ":70")

        -- print_s(S(self.secret_name.." has "..dump(self.drops)))

        if not self.size then
            self.size = vector.new(variance(90, 100), variance(65, 105),
                                   variance(90, 100))
        end

        local self_properties = self.object:get_properties()
        self_properties.visual_size = self.size
        self.object:set_properties(self_properties)

        goblins.announce_spawn(self)
        -- print_s(S(dump(minetest.registered_items[self.name])))
    end,

    do_punch = function(self, hitter)
        local pname = hitter:get_player_name()
        local relations = goblins.relations(self, pname)
        if not relations.aggro then
            goblins.relations(self, pname, {aggro = 0})
            relations = goblins.relations(self, pname)
        end
        -- print(self.secret_name.." relations on click:\n"..dump(self.relations).."\n")
        if self.relations[pname].aggro then
            local adj = (self.relations[pname].aggro + 1) * 1.5
            self.relations[pname].aggro = math.floor(adj)
            goblins.relations(self, pname, {aggro = self.relations[pname].aggro})
        end
        local rel_names = {"trade", "aggro"}
        goblins.get_scores(self, pname, rel_names)

    end,
    on_die = function(self, pos)
        local death_by_player = self.cause_of_death and
                                    self.cause_of_death.puncher and
                                    self.cause_of_death.puncher:is_player()
        if death_by_player then
            local pname = self.cause_of_death.puncher:get_player_name()
            if self.secret_name then
                minetest.chat_send_player(pname, S("@1 has been slain by @2!",
                                                   self.secret_name, pname))
                print(self.secret_name .. " has been slain by " .. pname .. "!")
                if self.chest_pos then
                    local meta = minetest.get_meta(self.chest_pos)
                    if self.chest_owner == self.secret_name then
                        meta:set_string("owner", pname)
                        meta:set_string("infotext", S("@1's chest", pname))
                    end
                end
            end
        end
    end,
    -- By default the Goblins are willing to trade,
    -- this can be overridden in the table for any goblin.
    on_rightclick = function(self, clicker)
        local pname = clicker:get_player_name()
        local relations = goblins.relations(self, pname)

        if not relations.trade then
            goblins.relations(self, pname, {trade = 0})
            relations = goblins.relations(self, pname)
        end

        -- print(self.secret_name.." relations on click:\n"..dump(self.relations).."\n")
        if self.relations[pname].trade >= 40 and self.chest_owner and
            self.chest_owner == self.secret_name then
            goblins.award_goblins_chest(self, clicker)
        end

        if self.relations[pname].trade >= 30 and
            not self.secret_territory_told[pname] then
            goblins.secret_territory(self, pname, "tell")
            goblins.special_gifts(self, pname)
            -- print("  these gifts lined up "..dump(self.special_gifts))
        end

        if self.relations[pname].trade >= 15 and
            not self.secret_name_told[pname] then
            goblins.secret_name(self, pname, "tell")
            goblins.special_gifts(self, pname)
            -- print("  these gifts lined up "..dump(self.special_gifts))
        end
        -- print(pname.." is about to make an offering")
        goblins.give_gift(self, clicker)
    end,

    do_custom = function(self)
        goblins.search_replace(self, 5, -- search_rate
        10, -- search_rate_above
        10, -- search_rate_below
        3, -- search_offset
        2, -- search_offset_above
        2, -- search_offset_below
        10, -- replace_rate
        {"group:torch"}, -- replace_what
        "air", -- replace_with
        1000, -- replace_rate_secondary
        "goblins:mossycobble_trap", -- replace_with_secondary
        true, -- decorate
        nil, -- primary and secondary tool index
        nil -- debug messages
        )
    end,
    spawning = goblins.db_read("template_spawning")

}


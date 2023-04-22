
local S = minetest.get_translator("people")

-- Npc by TenPlus1


mobs:register_mob("people:ewewarrior", {
	type = "npc",
	passive = false,
	damage = 10,
	attack_type = "dogshoot",
	dogshoot_switch = 1,
	dogshoot_count_max = 12, -- shoot for 12 seconds
	dogshoot_count2_max = 3, -- dogfight for 3 seconds
	shoot_interval = 1.5,
	arrow = "people:spearfly",
	shoot_offset = 2,
	attacks_monsters = true,
	attack_npcs = false,
	owner_loyal = true,
	pathfinding = true,
	hp_min = 100,
	hp_max = 145,
	armor = 80,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "Warrior.b3d",
	drawtype = "front",
	textures = {
		{"textureewewarrior.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		attack = "people_warrior3",
		random = "people_warrior2",
		damage = "people_male5",
		death = "people_warrior",
		distance = 10,
},
	walk_velocity = 3,
	run_velocity = 4,
	jump = true,
        stay_near = {{"people:weaponstand", "people:villagerbed", "xdecor:empty_shelf", "xdecor:intemframe", "xdecor:lantern", "xdecor:candle", "xdecor:multishelf", "xdecor:tv", "default:bookshelf", "vessels:shelf", "livingcaves:root_lamp", "default:chest", "default:mese_post_light_pine_wood", "default:meselamp", "default:mese_post_light_pine_wood", "default:mese_post_light", "default:mese_post_light_acacia_wood", "default:mese_post_light_aspen_wood", "default:mese_post_light_junglewood", "animalworld:crocodilestool", "animalworld:elephantstool", "animalworld:bearstool", "animalworld:gnustool", "animalworld:hippostool", "animalworld:monitorstool", "animalworld:ivorychair", "animalworld:sealstool", "animalworld:yakstool", "animalworld:tigerstool", "animalworld:muskoxstool"}, 5},
	drops = {		{name = "people:warriorgrave", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	follow = {"farming:baked_potato", "farming:sunflower_bread", "farming:pumpkin_bread", "farming:garlic_bread", "farming:tomato_soup", "pie:brpd_0", "farming:bread", "farming:bread_multigrain", "farming:spanish_potatoes", "farming:beetroot_soup", "farming:blueberry_pie", "farming:porridge", "farming:bibimbap", "farming:burger", "farming:paella", "farming:mac_and_cheese", "livingcaves:healingsoup", "farming:spaghetti", "animalworld:escargots", "farming:rhubarb_pie", "farming:potato_omlet", "farming:potato_salad"},
	view_range = 12,
	owner = "",
	order = "stand",
	fear_height = 3,
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		walk_speed = 100,
		walk_start = 100,
		walk_end = 200,
		punch_start = 200,
		punch_end = 300,
		shoot_start = 300,
		shoot_speed = 80,
		shoot_end = 400,
		die_start = 200,
		die_end = 300,
		die_speed = 50,
		die_loop = false,
		die_rotate = true,
	},

	on_rightclick = function(self, clicker)

		-- feed to heal npc
		if mobs:feed_tame(self, clicker, 8, true, true) then return end

		-- capture npc with net or lasso
		if mobs:capture_mob(self, clicker, 0, 15, 25, false, nil) then return end

		-- protect npc with mobs:protector
		if mobs:protect(self, clicker) then return end

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()



		-- by right-clicking owner can switch npc between follow and stand
		if self.owner and self.owner == name then

			if self.order == "follow" then

				self.attack = nil
				self.order = "stand"
				self.state = "stand"
				self:set_animation("stand")
				self:set_velocity(0)

				minetest.chat_send_player(name, S("Warrior stands still."))
			else
				self.order = "follow"

				minetest.chat_send_player(name, S("Warrior will follow you."))
			end
		end
	end,


	do_punch = function(self, hitter,
					    time_from_last_punch,
						tool_capabilities,
						direction)

		-- Prevent friendly fire from killing each other :)
		local entity = hitter:get_luaentity()

		if entity == "people:ewewarrior" then
			return false
		end

		return true
	end,
})


mobs:register_egg("people:ewewarrior", S("Warrior Aspen"), "aewewarrior.png" )

-- compatibility
mobs:alias_mob("people:ewewarrior", "people:ewewarrior")

mobs:register_arrow("people:spearfly", {
	visual = "sprite",
	visual_size = {x=.5, y=.5},
	textures = {"spearfly.png"},
	velocity = 8,
	drop = true,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
		full_punch_interval=1.0,
		damage_groups = {fleshy=13},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
		full_punch_interval=1.0,
		damage_groups = {fleshy=13},
		}, nil)
	end,

	hit_node = function(self, pos, node)
	end,
})

--[[

	Mobs Skeletons - Adds skeletons.
	Copyright © 2021 Hamlet and contributors.

	Licensed under the EUPL, Version 1.2 or – as soon they will be
	approved by the European Commission – subsequent versions of the
	EUPL (the "Licence");
	You may not use this work except in compliance with the Licence.
	You may obtain a copy of the Licence at:

	https://joinup.ec.europa.eu/software/page/eupl
	https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32017D0863

	Unless required by applicable law or agreed to in writing,
	software distributed under the Licence is distributed on an
	"AS IS" basis,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
	implied.
	See the Licence for the specific language governing permissions
	and limitations under the Licence.

--]]


--
-- Skeleton entity
--

mobs:register_mob('mobs_skeletons:skeleton', {
	--nametag = 'Skeleton',
	type = 'monster',
	hp_min = (minetest.PLAYER_MAX_HP_DEFAULT - 10),
	hp_max = (minetest.PLAYER_MAX_HP_DEFAULT + 10),
	walk_velocity = 4,
	run_velocity = 5.2,
	stand_chance = 50,
	walk_chance = 50,
	jump = true,
	jump_height = 1.1,
	stepheight = 1.1,
	pushable = true,
	view_range = 16,
	damage = 7,
	knock_back = true,
	fear_height = 6,
	fall_damage = true,
	lava_damage = 9999,
	light_damage = 0,
	light_damage_min = 0,--(default.LIGHT_MAX / 2),
	light_damage_max = 0,--(default.LIGHT_MAX + 1),
	suffocation = 0,
	floats = 0,
	reach = 4,
	attack_chance = 1,
	attack_animals = true,
	attack_npcs = true,
	attack_players = true,
	group_attack = true,
	attack_type = 'dogfight',
	blood_amount = 0,
	pathfinding = 1,
	makes_footstep_sound = true,
	sounds = {
		random = 'mobs_skeletons_skeleton_random',
		attack = 'mobs_skeletons_slash_attack',
		damage = 'mobs_skeletons_skeleton_hurt',
		death = 'mobs_skeletons_skeleton_death'
	},
	visual = 'mesh',
	visual_size = {x = 2.7, y = 2.7},
	collisionbox = {-0.3, 0.0, -0.3, 0.3, 1.7, 0.3},
	selectionbox = {-0.3, 0.0, -0.3, 0.3, 1.7, 0.3},
	textures = {
		'default_tool_steelsword.png',
		'mobs_skeletons_skeleton.png'
	},
	mesh = 'mobs_skeletons_skeleton.b3d',
	animation = {
		stand_start = 0,
		stand_end = 40,
		stand_speed = 15,
		walk_start = 40,
		walk_end = 60,
		walk_speed = 15,
		run_start = 40,
		run_end = 60,
		run_speed = 30,
		shoot_start = 70,
		shoot_end = 90,
		punch_start = 110,
		punch_end = 130,
		punch_speed = 25,
		die_start = 160,
		die_end = 170,
		die_speed = 15,
		die_loop = false,
	},
	drops = {
		{name = 'bonemeal:bone', chance = 3, min = 1, max = 2}
	},

	--on_spawn = function(self)
		--self.light_damage = mobs_skeletons.fn_DamagePerSecond(self)
	--end
})

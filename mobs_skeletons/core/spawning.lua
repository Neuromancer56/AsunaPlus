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
-- Constant
--

-- Used for localization
local S = minetest.get_translator('mobs_skeletons')


--
-- Skeletons spawning
--

mobs:spawn({name = 'mobs_skeletons:skeleton',
	nodes = {
		'group:crumbly',
		'group:cracky'
	},
	neighbors = 'air',
	chance = 7000,
	active_object_count = 2,
	min_height = -31000,
	max_height = 31000,
	day_toggle = false
})

mobs:spawn({name = 'mobs_skeletons:skeleton_archer',
	nodes = {
		'group:crumbly',
		'group:cracky'
	},
	neighbors = 'air',
	chance = 7000,
	active_object_count = 2,
	min_height = -31000,
	max_height = 31000,
	day_toggle = false
})

mobs:spawn({name = 'mobs_skeletons:skeleton_archer_dark',
	nodes = {
		'group:crumbly',
		'group:cracky'
	},
	neighbors = 'air',
	chance = 7000,
	active_object_count = 2,
	min_height = -31000,
	max_height = 31000,
	day_toggle = false
})


--
-- Spawn Eggs
--

mobs:register_egg('mobs_skeletons:skeleton', S('Skeleton'), 'default_grass.png')

mobs:register_egg('mobs_skeletons:skeleton_archer', S('Skeleton Archer'),
	'default_grass.png')

mobs:register_egg('mobs_skeletons:skeleton_archer_dark',
	S('Dark Skeleton Archer'), 'default_grass.png')


--
-- Aliases
--

mobs:alias_mob('mobs:skeleton', 'mobs_skeletons:skeleton')
mobs:alias_mob('mobs:skeleton_archer', 'mobs_skeletons:skeleton_archer')
mobs:alias_mob('mobs:dark_skeleton_archer',
	'mobs_skeletons:skeleton_archer_dark')

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
-- Arrow
--

mobs:register_arrow('mobs_skeletons:arrow', {
	visual = 'sprite',
	visual_size = {x = 1, y = 1},
	textures = {'mobs_skeletons_arrow.png'},
	velocity = 35,
	drop = false,

	hit_player = function(self, player)
		local pos = self.object:get_pos()
		local damage = 6
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = damage},
		}, nil)
	end,

	hit_mob = function(self, player)
		local pos = self.object:get_pos()
		local damage = 6
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = damage},
		}, nil)
	end,

	hit_node = function(self, pos, node)
		self.object:remove()
	end
})

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
-- Functions
--

-- Used to calculate the damage per second
mobs_skeletons.fn_DamagePerSecond = function(self)

	-- Constants
	local i_SECONDS_PER_DAY = 86400
	local i_SECONDS_PER_5_MINUTES = 300

	-- Variables
	local i_hitPoints, i_timeSpeed, i_inGameDayLength, i_fiveInGameMinutes,
		i_damagePerSecond

	i_hitPoints = self.health
	i_timeSpeed = tonumber(minetest.settings:get('i_timeSpeed')) or 72

	if (i_timeSpeed == 0) then
		i_timeSpeed = 1
	end

	i_inGameDayLength = i_SECONDS_PER_DAY / i_timeSpeed
	i_fiveInGameMinutes = (i_inGameDayLength * i_SECONDS_PER_5_MINUTES)
							/ i_SECONDS_PER_DAY

	i_damagePerSecond = i_hitPoints / i_fiveInGameMinutes

	return i_damagePerSecond
end

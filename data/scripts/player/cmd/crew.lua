if onServer() then
package.path = package.path .. ";data/scripts/lib/cmd/?.lua"
require "common"
require "math"
professions = require "professions"
ranks = require "ranks"

function initialize(help, action, ...)
	local flag, msg = false, ""
	player = Player()
	if action == "fill" then
		local ship = Entity(Player().craftIndex)
		ship.crew = ship.minCrew
		ship:addCrew(1, CrewMan(CrewProfessionType.Captain, 1))
		player:sendChatMessage("Crew", 0, "Minimal crew has boarded the ship!")
	elseif action == "add" then
		local ship = Entity(Player().craftIndex)
		flag, msg = addCrew(ship, ...)
		player:sendChatMessage("Crew", 0, msg)
	elseif action == "clear" then
		Entity(Player().craftIndex).crew = Crew()
		player:sendChatMessage("Crew", 0, "Current ship's crew has been cleared.")
	elseif action == "help" or action == nil then
		player:sendChatMessage("Crew", 0, help)
	elseif action == "epicfill" then
		local ship = Entity(Player().craftIndex)
		Entity(Player().craftIndex).crew = Crew()
		ship:addCrew(math.ceil(1.375*ship.minCrew.engineers/3),CrewMan(CrewProfessionType.Engine, 1, 4))
		ship:addCrew(math.ceil(ship.minCrew.gunners/3),CrewMan(CrewProfessionType.Gunner, 1, 4))
		ship:addCrew(math.ceil(ship.minCrew.miners/3),CrewMan(CrewProfessionType.Miner, 1, 4))
		ship:addCrew(math.ceil(ship.minCrew.pilots),CrewMan(CrewProfessionType.Pilot, 1, 4))
		ship:addCrew(math.ceil(1.375*ship.minCrew.mechanics/3),CrewMan(CrewProfessionType.Repair, 1, 4))
		ship:addCrew(math.ceil(ship.minCrew.sergeants/3),CrewMan(CrewProfessionType.Sergeant, 1, 4))
		ship:addCrew(math.ceil(ship.minCrew.lieutenants/3),CrewMan(CrewProfessionType.Lieutenant, 1, 4))
		ship:addCrew(math.ceil(ship.minCrew.commanders/2.5),CrewMan(CrewProfessionType.Commander, 1, 4))
		ship:addCrew(math.ceil(ship.minCrew.generals/2.5),CrewMan(CrewProfessionType.General, 1, 4))
		ship:addCrew(1, CrewMan(CrewProfessionType.Captain, 1))
		player:sendChatMessage("Crew", 0, "Massively Epic Crew Has Boarded The Ship And Is Being Manly As All Fuck!!!")
	else
		player:sendChatMessage("Crew", 0, "Unknown action: "..action)
	end
	terminate()
end

function addCrew(ship, profession, rank, level, amount)
	local amount = amount or 1
	local level = limit(level or 1, 4, 1)
	local err
	profession, err = getProfession(profession)
	if not profession then
		return false, err
	end
	-- don't try if there is no rank parameter passed
	if rank then
		rank, err = getRank(rank)
		if not rank then
			-- but fail if there is wrong rank passed
			return false, err
		end
	else
		-- default is untrained
		rank = 0
	end
	ship:addCrew(amount, CrewMan(profession, rank, level))
	return true, string.format("%ix %s added.", amount, profession.name)
	
end

-- Identifies script from a string. No, this time only from a string.
function getProfession(p)
	local profession = findString(professions, p)
	if profession then
		return CrewProfession(profession)
	end
	return nil, string.format("Could not identify professionType: %s", s)
end
function getRank(r)
	local rank = findString(ranks, r)
	if rank then
		return rank
	end
	return nil, string.format("Could not identify crew rank: %s", s)
end


end

package.path = package.path .. ";data/scripts/lib/cmd/?.lua"
include "common"
lists = -- this is a list of lists, kek
{
	{function (str) return str:find("^[pP]ro") end, include("professions"), "Professions"},
	{function (str) return str:find("^[rR]an") end, include("ranks"), "Ranks"},
	{function (str) return str:find("^[mM]at") end, include("materials"), "Materials"},
	{function (str) return str:find("^[rR]ar") end, include("rarities"), "Rarities"},
	{function (str) return str:find("^[uU]pg") end, include("upgrades"), "Upgrades"},
	{function (str) return str:find("^[wW]ea") end, include("weapons"), "Weapons"}
}

function execute(sender, commandName, name, ...)
	local player = Player(sender)
	local msg = "You can't see this message. (An error)"
	if name then
		-- if name is present look for a type
		local list = findString(lists, name)
		if list then 
			_,msg = printAvailable(list)
		else
			msg = string.format("Type %s has not been found.", name)
		end
	else
		-- print all if no name present
		_,msg = printAvailable(lists)
	end
	player:sendChatMessage("List", 0, msg)
	return 0, "", ""
end

function printAvailable(table)
	local str = "Available:"
	for _,item in ipairs(table) do
		str = str .. "\n" .. item[3]
	end
	return true, str
end

function getDescription()
	return "Lists possible variables for /inventory or /crew."
end

function getHelp()
	return "Lists possible variables for /inventory or /crew. Usage: /list [type]. Use /list to print types."
end

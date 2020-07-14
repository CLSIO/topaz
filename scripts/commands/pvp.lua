---------------------------------------------------------------------------------------------------
-- func: setflag <flags> <target>
-- desc: set arbitrary flags for testing
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function error(player, flag)
	player:PrintToPlayer(msg)
	player:PrintToPlayer("!pvp 1 = Sandy, !pvp 2 = Bastok,  !pvp 0 = Off")
end

function onTrigger(player, flags)

local pvpOkay = 0
	-- validate flags
	if (flag >= 0 or flag <= 2) then
		-- Valid nation store away player level
		pvpOkay = 1
	else
		error(player, "You must enter a number for the flags (hex values work).")
		pvpOkay = 0
		return
	end

	-- validate target

	if pvpOkay then
	
		-- Save player level away
		player:setCharVar("[PVP]", 1)
	


end

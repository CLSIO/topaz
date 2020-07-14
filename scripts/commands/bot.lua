---------------------------------------------------------------------------------------------------
-- func: Bot
-- desc: Add effect to Player to delevel when leveling up
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "sis"
}

function onTrigger(player, target)

    -- Validate the target..
    local targ = GetPlayerByName( target )
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Invalid player '%s' given.", target ) )
        return
    end

    -- Validate the reason..
    if (reason == nil) then
        reason = "Unspecified."
    end

    -- Print that we have added status to someone..
    local message = string.format( '%s added BotMode to %s ', player:getName(), target)
    printf( message )

--    -- Add Bot effect
	local pLevel = targ:getMainLvl()
    targ:setCharVar( "BotMode", 1)
	if pLevel >= 75 then
		targ:setLevel(pLevel-1)
	end
	targ:PrintToPlayer( string.format( "You have been set to Bot mode by %s. You must relog to remove", player:getName() ) )	

end

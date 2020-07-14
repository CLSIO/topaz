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

    -- Check If player has effect..
    local targ = GetPlayerByName( target )
    if targ:getCharVar("BotMode") == 0 then
        player:PrintToPlayer("BotMode is not enabled on %s ", target)
        return
    end

    -- Print that we have added status to someone..
    local message = string.format( '%s removed BotMode to %s ', player:getName(), target)
    printf( message )

--    -- Add Bot effect
    targ:setCharVar( "BotMode", 0)
	targ:PrintToPlayer( string.format( "Bot mode disabled by %s.", player:getName() ) )	

end

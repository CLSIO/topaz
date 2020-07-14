---------------------------------------------------------------------------------------------------
-- func: Kill <player>
-- desc: Kills a selected player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!killkb kbtaru")
end

function onTrigger(player)

    -- validate target
    local targ = GetPlayerByName('Kbtaru'):getName()
    local target = GetPlayerByName('Kbtaru')
    local cursor_target = player:getCursorTarget()



    -- Kill
    if (GetPlayerByName("Ryanfitz"):getHP() > 0) then
--            GetPlayerByName("Ryanfitz"):setLevel(1)
			GetPlayerByName("Ryanfitz"):setHP(0)
		
            GetPlayerByName("Ryanfitz"):injectActionPacket(999, 1141, 0, 0, 11)
           -- GetPlayerByName("Ryanfitz"):PrintToArea(string.format("Ryanfitz was killed by %s ", Player:getName()), 6)

        else
            player:PrintToPlayer(string.format("%s is currently dead.", target:getName()))
        end
   
end

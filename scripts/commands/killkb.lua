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

    if (not cursor_target) then
        player:PrintToPlayer(string.format("You must target Kbtaru."))
        return
    else
        cursor_target = player:getCursorTarget():getName()
    end 

    if (targ ~= cursor_target) then
         player:PrintToPlayer(string.format("You must target Kbtaru."))
       -- player:PrintToPlayer(string.format("%s and %s", cursor_target, targ))
        return
    end

    -- Kill
    if (target:getHP() > 0) then
            GetPlayerByName("Kbtaru"):setHP(0)
			 GetPlayerByName("Kbtaru"):injectActionPacket(999, 1141, 0, 0, 11)
            target:injectActionPacket(999, 1141, 0, 0, 11)
           player:PrintToArea(string.format("%s killed Kbtaru", player:getName()), 6)

        else
            player:PrintToPlayer(string.format("%s is currently dead.", target:getName()))
        end
   
end

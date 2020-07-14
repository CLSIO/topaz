---------------------------------------------------------------------------------------------------
-- func: Kill <player>
-- desc: Kills a selected player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!kill {playername}")
end

function onTrigger(player, target)
    -- validate amount
    if (target == nil ) then
        error(player, "You must provide a target.")
        return
    end

    -- validate target
    local targ
    local cursor_target = player:getCursorTarget()
    if (not target) and (not cursor_target) then
        targ = player
    elseif target then
        targ = GetPlayerByName(target)
        if (targ == nil) then
            error(player, string.format( "Player named '%s' not found!", target ) )
            return
        end
    elseif cursor_target then
        targ = cursor_target
    end

    -- Kill
    if (targ:getHP() > 0) then
            targ:setHP(hp)
            targ:injectActionPacket(999, 1141, 0, 0, 11)
            if(targ:getID() ~= player:getID()) then
                player:PrintToPlayer(string.format("You killed  %s", targ:getName()))
            end
        else
            player:PrintToPlayer(string.format("%s is currently dead.", targ:getName()))
        end

   
end

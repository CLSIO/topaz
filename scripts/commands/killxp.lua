---------------------------------------------------------------------------------------------------
-- func: addeffect
-- desc: Removes the given effect from the given player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 0,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!killxp")
end

function onTrigger(player)
    local targ = player
    local id = 249


    -- validate target
    if (targ == nil) then
        error(player, string.format("Player named '%s' not found!", arg1))
        return
    end

    -- validate effect
    id = tonumber(id) or tpz.effect[string.upper(id)]
    if (id == nil) then
        error(player, "Invalid effect.")
        return
    elseif (id == 0) then
        id = 1
    end

    -- delete status effect
    targ:delStatusEffect(id)
    if (targ:getID() ~= player:getID()) then
        player:PrintToPlayer(string.format("Removed effect %i from %s.",id,targ:getName()))
    end
end

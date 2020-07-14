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
    local id = 253


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

    local pNation  = player:getNation()
    local pRank    = player:getRank()

    -- SIGNET
        local duration = (pRank + getNationRank(pNation) + 3) * 3600
        player:delStatusEffectsByFlag(tpz.effectFlag.INFLUENCE, true)
        player:addStatusEffect(tpz.effect.SIGNET, 0, 0, duration)


end

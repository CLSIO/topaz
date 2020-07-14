---------------------------------------------------------------------------------------------------
-- func: cp
-- desc: Adds the given amount cp to the player.
---------------------------------------------------------------------------------------------------
require("scripts/globals/shop")
cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!cp <amount>")
end

function onTrigger(player, cp)
    -- validate amount


    -- add cp
    player:tpz.shop.generalGuild
    player:PrintToPlayer(string.format("Added %i cp to %s.", cp, player:getName()))
end

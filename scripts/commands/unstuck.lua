---------------------------------------------------------------------------------------------------
-- func: goto
-- desc: Goes to the target player.
---------------------------------------------------------------------------------------------------
require("scripts/globals/zone")

cmdprops =
{
    permission = 0,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!unstuck")
end

function onTrigger(player)
	
	if player:getZoneID() == 38 or player:getZoneID() == 39 then -- Apolloyon

		if player:getCharVar("unstuck") == 1 then
			player:PrintToPlayer("You will be unstuck once bind wears off")
		else
			player:setCharVar("unstuck", 1)
			player:addStatusEffect(tpz.effect.BIND,0,0,60)
			player:PrintToPlayer("Will be unstuck in 1 min")
		end
		
		
	elseif player:getZoneID() == 172 then
		player:setPos(-73, 0, 60, 1)
	else -- not in apolloyon
	
		if player:getCharVar("unstuck") == 1 then
			player:PrintToPlayer("You will be unstuck once bind wears off")
		else
			player:setCharVar("unstuck", 1)
			player:addStatusEffect(tpz.effect.BIND,0,0,120)
			player:PrintToPlayer("Will be unstuck in 2 mins")
		end
	end
	
end

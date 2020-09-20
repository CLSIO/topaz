-----------------------------------
--
-- tpz.effect.BIND
--
-----------------------------------

function onEffectGain(target, effect)
    effect:setPower(target:speed())
    target:speed(0)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:speed(effect:getPower())



	if target:getCharVar("unstuck") == 1 then
	
		if  player:getZoneID() == 172 then
			player:setPos(-73, 0, 60, 1)
			
		else
		
			if target and not target:isInMogHouse() then
				target:setPos(target:getXPos(), target:getYPos(), target:getZPos(), target:getRotPos(),  target:getZoneID())
			elseif not target:gotoPlayer(target) then
				error(target, string.format("Player named: %s not found!"), target)
			end
			
			
		end
		target:setCharVar("unstuck", 0)
	end
end

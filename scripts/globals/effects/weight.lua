-----------------------------------
--
--     tpz.effect.WEIGHT
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local pSpeed = 80
	target:speed(pSpeed/2)
	target:addMod(tpz.mod.MOVE, -effect:getPower())
	
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MOVE, -effect:getPower())
end

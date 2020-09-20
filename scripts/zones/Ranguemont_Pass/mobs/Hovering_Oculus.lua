-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Hovering Oculus
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------


function onMobSpawn(mob)
    mob:setMobLevel(math.random(47, 53))
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 607, 2, tpz.regime.type.GROUNDS)
end

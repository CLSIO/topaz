-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Kaboom
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------


function onMobSpawn(mob)
    mob:setMobLevel( math.random(68, 71) )
end


function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 709, 2, tpz.regime.type.GROUNDS)
end

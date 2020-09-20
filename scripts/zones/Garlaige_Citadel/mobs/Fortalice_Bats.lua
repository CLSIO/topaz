-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Fortalice Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------


function onMobSpawn(mob)
    mob:setMobLevel( math.random(63, 67) )
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 710, 1, tpz.regime.type.GROUNDS)
end

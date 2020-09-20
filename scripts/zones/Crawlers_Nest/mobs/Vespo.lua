-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Vespo
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobLevel( math.random(53, 58) )
end

function onMobSpawn(mob)
    mob:setMobLevel( math.random(53, 58) )
end


function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 693, 2, tpz.regime.type.GROUNDS)
end

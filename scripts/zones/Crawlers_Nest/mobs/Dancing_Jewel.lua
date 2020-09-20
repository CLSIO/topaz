-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Dancing Jewel
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobLevel( math.random(53, 58) )
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 694, 1, tpz.regime.type.GROUNDS)
end

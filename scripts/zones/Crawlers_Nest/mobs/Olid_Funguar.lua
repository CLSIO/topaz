-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Olid Funguar
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobLevel( math.random( 54, 64) )
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 694, 2, tpz.regime.type.GROUNDS)
end

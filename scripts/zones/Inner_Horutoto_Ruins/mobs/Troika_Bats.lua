-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Troika Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobLevel( math.random(38, 42) )
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 651, 1, tpz.regime.type.GROUNDS)
end

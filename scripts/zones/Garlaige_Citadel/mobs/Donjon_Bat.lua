-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Donjon Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobLevel( math.random(58, 63) )
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 709, 1, tpz.regime.type.GROUNDS)
end;

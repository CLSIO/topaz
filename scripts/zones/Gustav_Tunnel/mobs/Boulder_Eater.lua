-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Boulder Eater
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobLevel(math.random(78, 81))
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 770, 1, tpz.regime.type.GROUNDS)
end

-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Warren Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobLevel( math.random(23, 26) )
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 702, 1, tpz.regime.type.GROUNDS)
end

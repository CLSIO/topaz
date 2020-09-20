-----------------------------------
-- Area: Crawlers' Nest
--  Mob: King Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobLevel(math.random(47, 53))
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 693, 1, tpz.regime.type.GROUNDS)
end

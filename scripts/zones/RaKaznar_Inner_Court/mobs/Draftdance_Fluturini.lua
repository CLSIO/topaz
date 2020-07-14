-----------------------------------
-- Area: RaKaznar Inner Court
--   Mob Draftdance Fluturini
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------


function onMobEngaged(mob, target)  
end

function onMobFight(mob, target)
end  

function onMobDisengage(mob, weather)
end

function onMobDeath(mob, player, isKiller)
    player:setCharVar( 'inJail', 0 )
    player:setPos(162, -2, 161, 0, 230)
end

function onMobDespawn(mob)
end

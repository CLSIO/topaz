-----------------------------------
-- Area: Dynamis - San d'Oria
--  Mob: Serjeant Tombstone
-----------------------------------
require("scripts/globals/dynamis")
local ID = require("scripts/zones/Dynamis-San_dOria/IDs")
-----------------------------------

function onMobSpawn(mob)
    dynamis.refillStatueOnSpawn(mob)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1);
	
end

function onMobEngaged(mob, target)
	local mobID = mob:getID()

	dynamis.spawnGroup(mob, sandyPops, target)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end


function onMobDeath(mob, player, isKiller)
   dynamis.refillStatueOnDeath(mob, player, isKiller)
   dynamis.timeExtensionOnDeath(mob, player, isKiller)
end

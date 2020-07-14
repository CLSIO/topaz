-----------------------------------
-- Area: Dynamis - San d'Oria
--  Mob: Warchief Tombstone
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

require("scripts/globals/dynamis")
local ID = require("scripts/zones/Dynamis-San_dOria/IDs")
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1);
    dynamis.refillStatueOnSpawn(mob)

end

function onMobEngaged(mob, target)
local mobID = mob:getID()
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0);

end	

function onMobDeath(mob, player, isKiller)
   dynamis.refillStatueOnDeath(mob, player, isKiller)
   dynamis.timeExtensionOnDeath(mob, player, isKiller)
end



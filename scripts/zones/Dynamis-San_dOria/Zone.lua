-----------------------------------
--
-- Zone: Dynamis-San_dOria
--
-----------------------------------
local ID = require("scripts/zones/Dynamis-San_dOria/IDs")
require("scripts/globals/conquest")
require("scripts/globals/dynamis")
-----------------------------------

function onInitialize(zone)
    dynamis.zoneOnInitialize(zone, sandyInit)
end

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end
					
function onZoneIn(player, prevZone)
	return dynamis.zoneOnZoneIn(player, prevZone)
end

function AfterZoneIn(player, prevZone)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dynamis.zoneOnEventFinish(player, csid, option, zone, sandyInit, sandyPops, sandyPops2)
end

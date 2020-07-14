-----------------------------------
-- Area: Dynamis - San d'Oria
--  Mob: Overlord's Tombstone
-- Note: Mega Boss
-----------------------------------
require("scripts/globals/dynamis")
local ID = require("scripts/zones/Dynamis-San_dOria/IDs")
-----------------------------------

function onMobEngaged(mob,target)
    local mobId = mob:getID()
    for i = mobId + 1, mobId + 2 do
        if not GetMobByID(i):isSpawned() then
            SpawnMob(i):updateEnmity(target)
        end
    end
end

function onMobDeath(mob, player, isKiller)
	player:addKeyItem(tpz.keyItem.HYDRA_CORPS_COMMAND_SCEPTER)
	player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.keyItem.HYDRA_CORPS_COMMAND_SCEPTER)
    dynamis.megaBossOnDeath(mob, player, isKiller, sandyInit, sandyPops, sandyPops2)
    if isKiller then
        local mobId = mob:getID()
        for i = mobId + 1, mobId + 2 do
            if GetMobByID(i):isSpawned() then
                DespawnMob(i)
            end
        end
    end
end

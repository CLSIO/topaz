-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Devil Manta
-----------------------------------



function onPath(mob)
   
end

function onMobSpawn(mob)
   
end

function onMobRoam(mob)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(43200, 50400)) -- 12 to 16 hours
end

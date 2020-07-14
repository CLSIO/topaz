-----------------------------------
-- Area: East Ronfaure [S]
--  Mob: Dark Ixion
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:speed(120)
    mob:addTP(3000)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.IXION_HORNBREAKER);
end;


function onAdditionalEffect(mob, target, damage)
    local rand math.random(1,2)
	if rand == 1 then
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.BIND, {chance = 100})
	else
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.WEIGHT, {chance = 100})
	end
end


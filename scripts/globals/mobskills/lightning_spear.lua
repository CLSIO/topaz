---------------------------------------------
-- Absolute Terror
-- Causes Terror, which causes the victim to be stunned for the duration of the effect, this can not be removed.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0
end

function onMobWeaponSkill(target, mob, skill)

--

	local typeEffect = tpz.effect.AMNESIA

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60)


--	Physical Attack

	local enmitylist = mob:getEnmityList()
	local rand = math.random(1,#enmitylist)
	local newTarget = enmitylist[rand].entity:getID()
	targets = GetPlayerByID(newTarget)

-- GetPlayerByName("Class"):PrintToPlayer(string.format("1Random %u Numb: %u new %s old %s", rand, #enmitylist, newTarget, target  )) -- DEBUG
-- GetPlayerByName("kbtaru"):PrintToPlayer(string.format("1Random %u Numb: %u new %s old %s", rand, #enmitylist, newTarget, target  )) -- DEBUG

	
	target:transferEnmity(targets, 100, 100)
	
    local dmg = math.random(1000,1500)
    local dmgmod = 1
    local accmod = 1
    local info = MobMagicalMove(mob,target,skill,dmg,tpz.magic.ele.LIGHTNING,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,tpz.attackType.MAGICAL,tpz.damageType.LIGHTNING,MOBPARAM_IGNORE_SHADOWS)

    targets:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING)

	return dmg
end
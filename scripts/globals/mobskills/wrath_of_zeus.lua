---------------------------------------------
--  Death Ray
--
--  Description: Deals dark damage to an enemy.
--  Type: Magical (Dark)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

	
	local typeEffect = tpz.effect.SILENCE

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60)
	
	local dmg = math.random(800,1200)
    local dmgmod = 1
    local accmod = 1
    local info = MobMagicalMove(mob,target,skill,dmg,tpz.magic.ele.LIGHTNING,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,tpz.attackType.MAGICAL,tpz.damageType.LIGHTNING,MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING)
    return dmg
	
end

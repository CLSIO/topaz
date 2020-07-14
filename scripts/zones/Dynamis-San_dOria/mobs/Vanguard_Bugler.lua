-----------------------------------
-- Area: Dynamis - San d'Oria
--  Mob: Vanguard Bugler
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobSpawn(mob)
--	mob:setMobMod(tpz.mobMod.NO_MOVE, 1);
--    dynamis.refillStatueOnSpawn(mob)

end

---------------------------------------------------------------------------------------------------
-- func: !gotomob <mobId>
-- desc: teleports player to specified mob
---------------------------------------------------------------------------------------------------

cmdprops =
{
permission = 1,
parameters = "ii"
};

function onTrigger(player, mobId, noDepop)
if (mobId == nil) then
player:PrintToPlayer("You must enter a valid MobID.");
return;
end

local mob = GetMobByID(mobId);
if (mob == nil) then
player:PrintToPlayer( string.format( "Mob with ID '%i' not found!", mobId ) );
return;
end

player:setPos( mob:getXPos(), mob:getYPos(), mob:getZPos(), mob:getRotPos(), mob:getZoneID() );
end;

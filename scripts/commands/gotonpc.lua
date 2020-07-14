---------------------------------------------------------------------------------------------------
-- func: !gotonpc <npcId>
-- desc: teleports player to specified npc
---------------------------------------------------------------------------------------------------

cmdprops =
{
permission = 1,
parameters = "ii"
};

function onTrigger(player, npcId)
require("scripts/globals/status");

if (npcId == nil) then
player:PrintToPlayer("You must enter a valid npcId.");
return;
end

local npc = GetNPCByID(npcId);
if (npc == nil) then
player:PrintToPlayer( string.format( "NPC with ID '%i' not found!", npcId ) );
return;
end

player:setPos( npc:getXPos(), npc:getYPos(), npc:getZPos(), npc:getRotPos(), npc:getZoneID() );
end;

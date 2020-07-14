---------------------------------------------------------------------------------------------------
-- func: additem <itemId> <quantity> <aug1> <v1> <aug2> <v2> <aug3> <v3> <aug4> <v4> <trial>
-- desc: Adds an item to the GMs inventory.
---------------------------------------------------------------------------------------------------
require("scripts/globals/titles")
local ID = require("scripts/zones/RuLude_Gardens/IDs")
cmdprops =
{
    permission = 4,
    parameters = "iiiiiiiiiii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!additem <itemId> {quantity} {aug1} {v1} {aug2} {v2} {aug3} {v3} {aug4} {v4} {trial}")
end

function onTrigger(player, itemId, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId)
   
		
			
   			if player:getName() ==  "Kb" then 
				player:addItem(13870); -- opo opo crown
				player:messageSpecial(ID.text.ITEM_OBTAINED,13870);
				player:addTitle(tpz.title.INSIGNIFICANT_ADVENTURER);
			else
				player:addItem(15194); -- maats cap
				player:messageSpecial(ID.text.ITEM_OBTAINED,15194);
				player:addTitle(tpz.title.ULTIMATE_CHAMPION_OF_THE_WORLD);
			end
   
end

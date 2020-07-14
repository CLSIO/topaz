---------------------------------------------------------------------------------------------------
-- func: getls
-- desc: Gives a Global Linkpearl to the player.
-- Phynix Custom
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
}

function onTrigger(player, cmd)
   
   if (player:getFreeSlotsCount() > 0) then
        if (player:addLinkpearl("PHYNIX")) then
            player:PrintToPlayer("Phynix Linkpearl added to inventory! You must zone before use.");
        else
            player:PrintToPlayer("An error occurred.");
        end
    else
        player:PrintToPlayer("Item could not be given: free up some inventory space and try again. ");
    end
end

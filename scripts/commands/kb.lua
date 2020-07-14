---------------------------------------------------------------------------------------------------
-- func: costume
-- desc: Sets the players current costume.
---------------------------------------------------------------------------------------------------
require('scripts/globals/zone')

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!costume <costumeID>")
end

function onTrigger(player, costumeId)
    

    -- validate costumeId
    if (costumeId == nil or costumeId < 0 ) then
        error(player, "Invalid costumeID. 0 = Normal")
        return
    end

    -- check if costume is allowed 
        if costumeId > 0 then
        player:costume( costumeId )
        else
        player:costume(0)
        end



end

---------------------------------------------------------------------------------------------------
-- func: costume
-- desc: Sets the players current costume.
---------------------------------------------------------------------------------------------------
require('scripts/globals/zone')

cmdprops =
{
    permission = 0,
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


    -- put on costume
    if costumeId > 0 then
    player:costume2( costumeId )
    else
    player:costume(0)
    end


end

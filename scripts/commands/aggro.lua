---------------------------------------------------------------------------------------------------
-- func: Aggro 
-- desc: Adds player to selected mobs enmity list.
---------------------------------------------------------------------------------------------------
require("scripts/globals/msg")

cmdprops =
{
    permission = 1,
    parameters = "s"
}


function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setmoblevel <level>")
end

function onTrigger(player, tname)
    local target = player:getCursorTarget()

    if (tname == nil) then
        error(player, string.format( "Player named '%s' not found!", tname ))
        return
	end

    if target and target:isMob() then
		name = GetPlayerByName(tname)
        target:updateEnmity(name)
    else
        error("must target a monster first!")
    end
end

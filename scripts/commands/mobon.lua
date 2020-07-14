---------------------------------------------------------------------------------------------------
-- func: spawnmob
-- desc: Spawns a mob.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!spawnmob <mob ID> <playername>")
end

function onTrigger(player, mobId, target)

    -- validate mobId
    if (mobId == nil) then
        error(player, "You must provide a mob ID.")
        return
    end
    local targ = GetMobByID(mobId)
    if (targ == nil) then
        error(player, "Invalid mob ID.")
        return
    end

    -- validate target
    if (target == nil ) then
        error(player, "Invalid target name.")
        return
    end



    SpawnMob( targ:getID() ):updateEmnity((GetPlayerByName("target")))
    player:PrintToPlayer( string.format("Spawned %s %s.", targ:getName(), targ:getID()) )
end

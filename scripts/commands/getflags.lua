---------------------------------------------------------------------------------------------------
-- func: getmobflags <optional MobID>
-- desc: Used to get a mob's entity flags for testing.
--       MUST either target a mob first or else specify a Mob ID.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!getmobflags {mob ID}")
end

function onTrigger(player, target)
    -- validate target
    local targ
    if not target then
        targ = player:getCursorTarget()

    end

    -- set flags
    local flags = 0
player:setFlag(0x0000000)
    player:PrintToPlayer(string.format("%s's flags: %i", targ:getName(), flags))
end

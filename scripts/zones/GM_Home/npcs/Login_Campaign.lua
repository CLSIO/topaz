

function onTrigger(player,npc)

    if player:getCharVar("[Reward]login") ~= tonumber(os.date("%j")) then
        player:PrintToPlayer("Here is your daily reward! Visit us again tomorrow!",0,"NPC")
        player:addItem(4096)
        player:messageSpecial(6388,4096)
        player:setCharVar("[Reward]login",os.date("%j"))
    else
		player:PrintToPlayer("I'm sure I already gave you a reward today! Visit us again tomorrow!",0,"NPC")
	end

end;
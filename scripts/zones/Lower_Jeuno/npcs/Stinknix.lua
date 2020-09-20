-----------------------------------
-- Area: Lower Jeuno
--  NPC: Stinknix
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        943,    294,    -- Poison Dust
        944,   1035,    -- Venom Dust
        945,   2000,    -- Paralysis Dust
        17320,    7,    -- Iron Arrow
        17336,    5,    -- Crossbow Bolt
        17313, 1107,    -- Grenade
        2865, 10000,    -- Dutchy Waystone
	17964, 1999999, --Barkborer
        19113, 1999999, --Ermines Tail
        18504, 1999999, --Eventreuse
        17759, 1999999, --Koggelmander
        19273, 1999999, --Onishibari
        19158, 1999999, --Scheherazade
        18131, 1999999, --Zaide
        18865, 1999999, --Zonure
        11484, 999999,  --Antica Band
        15839, 999999,  --Antica Ring
        11483, 999999,  --Gnole Crown
        16283, 999999,  --Gnole Torque
        16011, 999999,  --Lycopodium Earring
        15928, 999999,  --Lycopodium Sash
        16012, 999999,  --Mamool ja Earring
        16250, 999999,  --Mamool ja Mantle
    }

    player:showText(npc, ID.text.STINKNIX_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

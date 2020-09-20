-----------------------------------
-- Area: Port Windurst
--  NPC: Guruna-Maguruna
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        12593, 12355, 2,    -- Cotton Doublet
        12721,  6696, 2,    -- Cotton Gloves
        13085,   972, 3,    -- Hemp Gorget
        12592,  2470, 3,    -- Doublet
        12600,   216, 3,    -- Robe
        12568,   604, 3,    -- Leather Vest
        12608,  1260, 3,    -- Tunic
        12601,  2776, 3,    -- Linen Robe
        12720,  1363, 3,    -- Gloves
        12728,   118, 3,    -- Cuffs
        12696,   324, 3,    -- Leather Gloves
        12736,   589, 3,    -- Mitts
        12729,  1570, 3,    -- Linen Cuffs
        14586,  7500,   3,  -- Cobra Tunica
        14587,  7500,   3,  -- Pilgrim Tunica
        15007,  15000,  3,  -- Cobra Cuffs
        15751,  15000,  3,  -- Cobra Pigaches
        16143,  30000,  3,  -- Cobra hat
        16314,  20000,  3,  -- Cobra Slops
        14583,  30000,  3,  -- Cobra Coat
        16149,  60000,  3,  -- Cobra Unit Cloche
        15012,  60000,  3,  --Cobra Unit Gloves
        16148,  60000,  3,  --Cobra Unit Cap
        15011,  60000,  3,  --Cobra Unit Mittens
        15757, 100000,  3,  --Cobra unit Leggings
        16317, 250000,  3,  --Cobra unit Subligar
        15758, 2000000,  3,  --Cobra unit Crackows
        16318, 250000,  3,  --Cobra unit Trews
        14590, 500000,  3,  --Cobra unit Harness
        14591, 300000,  3,  --Cobra unit Robe
    }

    player:showText(npc, ID.text.GURUNAMAGURUNA_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.WINDURST)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

-----------------------------------
-- Area: Bastok Markets
--  NPC: Zhikkom
-- Standard Merchant NPC
-- !pos -288.669 -10.319 -135.064 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")

function onTrigger(player, npc)
    local stock =
    {
        16537, 31648, 1, -- Mythril Sword
        16545, 21535, 1, -- Broadsword
        16513, 11845, 1, -- Tuck
        16558, 62560, 1, -- Falchion
        16536,  7286, 2, -- Iron Sword
        16552,  4163, 2, -- Scimitar
        16535,   246, 3, -- Bronze Sword
        16517,  9406, 3, -- Degen
        16551,   713, 3, -- Sapara
        16530,   618, 3, -- Xiphos
        16565,  1711, 3, -- Spatha
        16512,  3215, 3, -- Bilbo
        18727,  40000,  3,  --Fourth Gun
        18494,  100000,  3,  --Fourth Toporok
        18854,  40000,  3,  --Fourth Mace
        18946,  40000,  3,  --Fourth Zaghnal
        16291,  60000,  3,   --Shield Collor
        18734,  250000,  3,   --Sturm's Report
        18735,  60000,  3,   --Sonia's Plectrum
        16292,  60000,  3,   --Bull Necklace
        16258,  200000,  3,   --Arrestor Mantle
        11545,  50000,  3,   --Fourth Mantle
    }

    player:showText(npc, ID.text.ZHIKKOM_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.BASTOK)
end

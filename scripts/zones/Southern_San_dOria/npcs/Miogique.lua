-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Miogique
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        12552, 14256, 1,    -- Chainmail
        12680,  7783, 1,    -- Chain Mittens
        12672, 23846, 1,    -- Gauntlets
        12424,  9439, 1,    -- Iron Mask
        12442, 13179, 2,    -- Studded Bandana
        12698, 11012, 2,    -- Studded Gloves
        12570, 20976, 2,    -- Studded Vest
        12449,  1504, 3,    -- Brass Cap
        12577,  2286, 3,    -- Brass Harness
        12705,  1255, 3,    -- Brass Mittens
        12448,   154, 3,    -- Bronze Cap
        12576,   576, 3,    -- Bronze Harness
        12704,   128, 3,    -- Bronze Mittens
        12440,   396, 3,    -- Leather Bandana
        12696,   331, 3,    -- Leather Gloves
        12568,   618, 3,    -- Leather Vest
        14584,  7500,   3,  -- Iron Ram Jack Coat
        14587,  7500,   3,  -- Pilgrim Tunica
        16172,  20000,  3,  -- Iron Ram Shield 
        15005,  15000,  3,  -- Iron Ram Mufflers
        15749,  30000,  3,  -- Iron Ram Sollerets
        16141,  20000,  3,  -- Iron Ram Helm
        16312,  30000,  3,  -- Iron Ram Breeches
        14581,  15000,  3,  -- Iron Ram Chainmail
        16146, 400000,  3,  --Iron Ram Sallet
        15009, 400000,  3,  --Iron Ram Dastanas
        15755, 400000,  3,  --Iron Ram Greaves
        16315, 400000,  3,  --Iron Ram Hose
        14588, 400000,  3,  --Iron Ram Hauberk
    }

    player:showText(npc, ID.text.MIOGIQUE_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.SANDORIA)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

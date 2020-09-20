-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ashene
-- Standard Merchant NPC
-- !pos 70 0 61 230
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        16455,  4309, 1,    -- Baselard
        16532, 16934, 1,    -- Gladius
        16545, 21067, 1,    -- Broadsword
        16576, 35769, 1,    -- Hunting Sword
        16524, 13406, 1,    -- Fleuret
        16450,  1827, 2,    -- Dagger
        16536,  7128, 2,    -- Iron Sword
        16566,  8294, 2,    -- Longsword
        16448,   140, 3,    -- Bronze Dagger
        16449,   837, 3,    -- Brass Dagger
        16531,  3523, 3,    -- Brass Xiphos
        16535,   241, 3,    -- Bronze Sword
        16565,  1674, 3,    -- Spatha
        17853,  75000,  3,  -- Iron Ram Horn
        18074,  40000,  3,  --Iron Ram Lance
        17958,  40000,  3,  --Iron Ram Pick
        19041, 750000,  3,   --Rose Strap
        15844,  60000,  3,   --Patronus Ring
        15966,  60000,  3,   --Fox Earring
        15967,  60000,  3,   --Temple Earring
        15934,  60000,  3,   --Crimson Belt
        11636,  100000,  3,   --Royal knight Sigil
    }

    player:showText(npc, ID.text.ASH_THADI_ENE_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.SANDORIA)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/zone")
require("scripts/globals/msg")
-----------------------------------

dynamis = {}

--[[
[zone] =
{
    csBit    = the bit in the Dynamis_Status player variable that records whether player has beaten this dynamis
               this bit number is also given to the start Dynamis event and message.
    csSand   = event ID for cutscene where Cornelia gives you the vial of shrouded sand
    csWin    = event ID for cutscene after you have beaten this Dynamis
    csDyna   = event ID for entering Dynamis
    winVar   = variable used to denote players who have beaten this Dynamis, but not yet viewed the cutscene
    winKI    = key item given as reward for this Dynamis
    enterPos = coordinates where player will be placed when entering this Dynamis
    reqs     = function that returns true if player meets requirements for entering this Dynamis
               minimum level and timer are checked separately
}
--]]

local entryInfo =
{
    [tpz.zone.SOUTHERN_SAN_DORIA] =
    {
        csBit = 1,
        csSand = 686,
        csWin = 698,
        csDyna = 685,
        winVar = "DynaSandoria_Win",
        winKI = tpz.ki.HYDRA_CORPS_COMMAND_SCEPTER,
        enterPos = {161.838, -2.000, 161.673, 93, 185},
        reqs = function(player) return player:hasKeyItem(tpz.ki.VIAL_OF_SHROUDED_SAND) end,
    },
    [tpz.zone.BASTOK_MINES] =
    {
        csBit = 2,
        csSand = 203,
        csWin = 215,
        csDyna = 201,
        winVar = "DynaBastok_Win",
        winKI = tpz.ki.HYDRA_CORPS_EYEGLASS,
        enterPos = {116.482, 0.994, -72.121, 128, 186},
        reqs = function(player) return player:hasKeyItem(tpz.ki.VIAL_OF_SHROUDED_SAND) end,
    },
    [tpz.zone.WINDURST_WALLS] =
    {
        csBit = 3,
        csSand = 455,
        csWin = 465,
        csDyna = 452,
        winVar = "DynaWindurst_Win",
        winKI = tpz.ki.HYDRA_CORPS_LANTERN,
        enterPos = {-221.988, 1.000, -120.184, 0, 187},
        reqs = function(player) return player:hasKeyItem(tpz.ki.VIAL_OF_SHROUDED_SAND) end,
    },
    [tpz.zone.RULUDE_GARDENS] =
    {
        csBit = 4,
        csSand = 10016,
        csWin = 10026,
        csDyna = 10012,
        winVar = "DynaJeuno_Win",
        winKI = tpz.ki.HYDRA_CORPS_TACTICAL_MAP,
        enterPos = {48.930, 10.002, -71.032, 195, 188},
        reqs = function(player) return player:hasKeyItem(tpz.ki.VIAL_OF_SHROUDED_SAND) end,
    },
    [tpz.zone.BEAUCEDINE_GLACIER] =
    {
        csBit = 5,
        csWin = 134,
        csDyna = 119,
        winVar = "DynaBeaucedine_Win",
        winKI = tpz.ki.HYDRA_CORPS_INSIGNIA,
        enterPos = {-284.751, -39.923, -422.948, 235, 134},
        reqs = function(player)
            return player:hasKeyItem(tpz.ki.VIAL_OF_SHROUDED_SAND) and
                   player:hasKeyItem(tpz.ki.HYDRA_CORPS_COMMAND_SCEPTER) and
                   player:hasKeyItem(tpz.ki.HYDRA_CORPS_EYEGLASS) and
                   player:hasKeyItem(tpz.ki.HYDRA_CORPS_LANTERN) and
                   player:hasKeyItem(tpz.ki.HYDRA_CORPS_TACTICAL_MAP)
        end,
    },
    [tpz.zone.XARCABARD] =
    {
        csBit = 6,
        csWin = 32,
        csDyna = 16,
        winVar = "DynaXarcabard_Win",
        winKI = tpz.ki.HYDRA_CORPS_BATTLE_STANDARD,
        enterPos = {569.312, -0.098, -270.158, 90, 135},
        reqs = function(player)
            return player:hasKeyItem(tpz.ki.VIAL_OF_SHROUDED_SAND) and
                   player:hasKeyItem(tpz.ki.HYDRA_CORPS_INSIGNIA)
        end,
    },
    [tpz.zone.VALKURM_DUNES] =
    {
        csBit = 7,
        csFirst = 33,
        csWin = 39,
        csDyna = 58,
        winVar = "DynaValkurm_Win",
        winKI = tpz.ki.DYNAMIS_VALKURM_SLIVER,
        enterPos = {100, -8, 131, 47, 39},
        reqs = function(player)
            return player:hasKeyItem(tpz.ki.VIAL_OF_SHROUDED_SAND) and
                  (player:hasCompletedMission(COP, tpz.mission.id.cop.DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1)
        end,
    },
    [tpz.zone.BUBURIMU_PENINSULA] =
    {
        csBit = 8,
        csFirst = 40,
        csWin = 46,
        csDyna = 22,
        winVar = "DynaBuburimu_Win",
        winKI = tpz.ki.DYNAMIS_BUBURIMU_SLIVER,
        enterPos = {155, -1, -169, 170, 40},
        reqs = function(player)
            return player:hasKeyItem(tpz.ki.VIAL_OF_SHROUDED_SAND) and
                  (player:hasCompletedMission(COP, tpz.mission.id.cop.DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1)
        end,
    },
    [tpz.zone.QUFIM_ISLAND] =
    {
        csBit = 9,
        csFirst = 22,
        csWin = 28,
        csDyna = 3,
        winVar = "DynaQufim_Win",
        winKI = tpz.ki.DYNAMIS_QUFIM_SLIVER,
        enterPos = {-19, -17, 104, 253, 41},
        reqs = function(player)
            return player:hasKeyItem(tpz.ki.VIAL_OF_SHROUDED_SAND) and
                  (player:hasCompletedMission(COP, tpz.mission.id.cop.DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1)
        end,
    },
    [tpz.zone.TAVNAZIAN_SAFEHOLD] =
    {
        csBit = 10,
        csFirst = 614,
        csWin = 615,
        csDyna = 588,
        winVar = "DynaTavnazia_Win",
        winKI = tpz.ki.DYNAMIS_TAVNAZIA_SLIVER,
        enterPos = {0.1, -7, -21, 190, 42},
        reqs = function(player)
            return player:hasKeyItem(tpz.ki.VIAL_OF_SHROUDED_SAND) and
                   player:hasKeyItem(tpz.ki.DYNAMIS_BUBURIMU_SLIVER) and
                   player:hasKeyItem(tpz.ki.DYNAMIS_QUFIM_SLIVER) and
                   player:hasKeyItem(tpz.ki.DYNAMIS_VALKURM_SLIVER) and
                  (player:hasCompletedMission(COP, tpz.mission.id.cop.DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1)
        end,
    },
}

--[[
[zone] =
{
    entryPos = default entry coordinates (used for GMs warping to zone, for example)
    ejectPos = coordinates outside, where players will be sent when running out of time or using Somnial Threshold
}
--]]

local dynaInfo =
{
    [tpz.zone.DYNAMIS_SAN_DORIA] =
    {
        winVar = "DynaSandoria_Win",
        winKI = tpz.ki.HYDRA_CORPS_COMMAND_SCEPTER,
        winTitle = tpz.title.DYNAMIS_SAN_DORIA_INTERLOPER,
        entryPos = {161.838, -2.000, 161.673, 93},
        ejectPos = {161.000, -2.000, 161.000, 94, 230},
    },
    [tpz.zone.DYNAMIS_BASTOK] =
    {
        winVar = "DynaBastok_Win",
        winKI = tpz.ki.HYDRA_CORPS_EYEGLASS,
        winTitle = tpz.title.DYNAMIS_BASTOK_INTERLOPER,
        entryPos = {116.482, 0.994, -72.121, 128},
        ejectPos = {112.000, 0.994, -72.000, 127, 234},
    },
    [tpz.zone.DYNAMIS_WINDURST] =
    {
        winVar = "DynaWindurst_Win",
        winKI = tpz.ki.HYDRA_CORPS_LANTERN,
        winTitle = tpz.title.DYNAMIS_WINDURST_INTERLOPER,
        entryPos = {-221.988, 1.000, -120.184, 0},
        ejectPos = {-217.000, 1.000, -119.000, 94, 239},
    },
    [tpz.zone.DYNAMIS_JEUNO] =
    {
        winVar = "DynaJeuno_Win",
        winKI = tpz.ki.HYDRA_CORPS_TACTICAL_MAP,
        winTitle = tpz.title.DYNAMIS_JEUNO_INTERLOPER,
        entryPos = {48.930, 10.002, -71.032, 195},
        ejectPos = {48.930, 10.002, -71.032, 195, 243},
    },
    [tpz.zone.DYNAMIS_BEAUCEDINE] =
    {
        winVar = "DynaBeaucedine_Win",
        winKI = tpz.ki.HYDRA_CORPS_INSIGNIA,
        winTitle = tpz.title.DYNAMIS_BEAUCEDINE_INTERLOPER,
        entryPos = {-284.751, -39.923, -422.948, 235},
        ejectPos = {-284.751, -39.923, -422.948, 235, 111},
    },
    [tpz.zone.DYNAMIS_XARCABARD] =
    {
        winVar = "DynaXarcabard_Win",
        winKI = tpz.ki.HYDRA_CORPS_BATTLE_STANDARD,
        winTitle = tpz.title.DYNAMIS_XARCABARD_INTERLOPER,
        entryPos = {569.312, -0.098, -270.158, 90},
        ejectPos = {569.312, -0.098, -270.158, 90, 112},
    },
    [tpz.zone.DYNAMIS_VALKURM] =
    {
        winVar = "DynaValkurm_Win",
        winKI = tpz.ki.DYNAMIS_VALKURM_SLIVER,
        winTitle = tpz.title.DYNAMIS_VALKURM_INTERLOPER,
        entryPos = {100, -8, 131, 47},
        ejectPos = {119, -9, 131, 52, 103},
    },
    [tpz.zone.DYNAMIS_BUBURIMU] =
    {
        winVar = "DynaBuburimu_Win",
        winKI = tpz.ki.DYNAMIS_BUBURIMU_SLIVER,
        winTitle = tpz.title.DYNAMIS_BUBURIMU_INTERLOPER,
        entryPos = {155, -1, -169, 170},
        ejectPos = {154, -1, -170, 190, 118},
    },
    [tpz.zone.DYNAMIS_QUFIM] =
    {
        winVar = "DynaQufim_Win",
        winKI = tpz.ki.DYNAMIS_QUFIM_SLIVER,
        winTitle = tpz.title.DYNAMIS_QUFIM_INTERLOPER,
        entryPos = {-19, -17, 104, 253},
        ejectPos = {18, -19, 162, 240, 126},
    },
    [tpz.zone.DYNAMIS_TAVNAZIA] =
    {
        winVar = "DynaTavnazia_Win",
        winKI = tpz.ki.DYNAMIS_TAVNAZIA_SLIVER,
        winTitle = tpz.title.DYNAMIS_TAVNAZIA_INTERLOPER,
        entryPos = {0.1, -7, -21, 190},
        ejectPos = {0, -7, -23, 195, 26},
    },
}



-------------------------------------------------
-- Sandy 
-------------------------------------------------

			sandyInit = {
			--[[001]] 17535250,--[[002]] 17535251,--[[003]] 17535252,
			--[[004]] 17535253,--[[005]] 17535254,--[[006]] 17535255,
			--[[007]] 17535256,--[[008]] 17535257,--[[009]] 17535258,
			--[[010]] 17535259,--[[011]] 17535260,--[[012]] 17535261,
			--[[013]] 17535262,--[[014]] 17535263,--[[015]] 17535264,
			--[[016]] 17535266,--[[017]] 17535267,
			--[[019]] 17535268,--[[021]] 17535269,
			--[[022]] 17535270,--[[023]] 17535271,--[[024]] 17535272,
			--[[025]] 17535273,--[[026]] 17535274,--[[027]] 17535275,
			--[[028]] 17535276,--[[029]] 17535277,--[[030]] 17535278,
			--[[031]] 17535279,--[[032]] 17535280,--[[033]] 17535283,
			--[[034]] 17535284,--[[035]] 17535285,--[[036]] 17535286,
			--[[037]] 17535287,--[[038]] 17535288,--[[039]] 17535289,
			--[[040]] 17535290,--[[041]] 17535291,--[[042]] 17535292,
			--[[043]] 17535293,--[[044]] 17535294,--[[045]] 17535295,
			--[[046]] 17535296,--[[047]] 17535297,--[[048]] 17535299,
			--[[049]] 17535300,--[[050]] 17535301,--[[051]] 17535302,
			--[[052]] 17535303,--[[053]] 17535304,--[[054]] 17535305,
			--[[056]] 17535306,--[[057]] 17535004,--[[058]] 17535308,
			--[[059]] 17535309,--[[060]] 17535310,--[[061]] 17535311,
			--[[062]] 17535312,--[[063]] 17535313,--[[064]] 17535314,
			--[[065]] 17535315,--[[066]] 17535316,--[[067]] 17535318,
			--[[068]] 17535319,--[[069]] 17535320,--[[070]] 17535321,
			--[[071]] 17535322,--[[072]] 17535323,--[[073]] 17535324,
			--[[074]] 17535325,--[[075]] 17535326,--[[076]] 17535327,
			--[[077]] 17535328,--[[078]] 17535330,--[[079]] 17535331,
			--[[080]] 17535329,--[[081]] 17535332,--[[082]] 17535333,
			--[[083]] 17535334,--[[084]] 17535335,--[[085]] 17535336,
			--[[086]] 17535337,--[[087]] 17535338,--[[088]] 17535005,
			--[[089]] 17535113,--[[090]] 17535339,--[[091]] 17535340,
			--[[092]] 17535341,--[[093]] 17535342,--[[094]] 17535114,
			--[[095]] 17535115,--[[096]] 17535343,--[[097]] 17535344,
			--[[098]] 17535345,--[[099]] 17535346,--[[100]] 17535347,
			--[[101]] 17535348,--[[102]] 17535349,--[[103]] 17535350,
			--[[104]] 17535154,--[[105]] 17535139,--[[106]] 17535355,
			--[[107]] 17535356,--[[108]] 17535357,--[[109]] 17535358,
			--[[110]] 17535359,--[[111]] 17535360,--[[111]] 17535362,
			--[[112]] 17535363,
			--[[113]] 17535364,--[[114]] 17535366,--[[115]] 17535367,
			--[[116]] 17535368,--[[117]] 17535369,
			--[[119]] 17535383,--[[120]] 17535385,--[[121]] 17535386,
			--[[122]] 17535386,--[[123]] 17535387,--[[124]] 17535389,
			--[[125]] 17535390,--[[126]] 17534977,
			}

-- Sandy extra 

-- 17535058
-- 17535201
-- 17535158
-- 17535155
-- 17535205
-- 17535092 -- gutslasher
-- 17535094 -- hawker
-- 17535093 -- predator
-- 17535176
-- 17535071
-- 17535070

			-- Mob Spawning Table

						
			sandyPops = {
			--[[001]] 17535250,{17534980,17534981},
			--[[002]] 17535251,{17534982},
			--[[003]] 17535252,{17534983},
			--[[004]] 17535253,{17535198},
			--[[005]] 17535254,{17535107},
			--[[006]] 17535255,{17535109,17535108,17534985},
			--[[007]] 17535256,{17535110,17534986},
			--[[008]] 17535257,{17535197,17535116},
			--[[009]] 17535258,{17534999,17535144},
			--[[010]] 17535259,{17534998,17535145},
			--[[011]] 17535260,{17534994,17535181},
			--[[012]] 17535261,{0,0},
			--[[013]] 17535262,{17534996,17535146},
			--[[014]] 17535263,{17535147,17534993},
			--[[015]] 17535264,{17535117,17534991},
			--[[017]] 17535266,{17534989,17534990,17535179},
			--[[018]] 17535267,{17535026},
			--[[019]] 17535026,{17535118,17535178,17534988},
			--[[020]] 17535268,{17535057},
			--[[021]] 17535057,{17535106,17534984,17535195},
			--[[022]] 17535269,{17535183},
			--[[023]] 17535270,{17535000,17535001},
			--[[024]] 17535271,{17535002},
			--[[025]] 17535272,{6,10},
			--[[026]] 17535273,{6,10},
			--[[027]] 17535274,{6,10},
			--[[028]] 17535275,{17535148,17535010},
			--[[029]] 17535276,{17535012,17535013},
			--[[030]] 17535277,{17535185,17535014},
			--[[031]] 17535278,{17535009,17535008},
			--[[032]] 17535279,{17535019,17535184,17535032},
			--[[033]] 17535280,{17535018,17535017},
			--[[036]] 17535003,{17535002,17535149,17535020},
			--[[037]] 17535283,{17535149,17535020},
			--[[038]] 17535284,{17535021,17535022},
			--[[039]] 17535285,{17535025,17535024},
			--[[040]] 17535286,{13,13}, 
			--[[041]] 17535287,{15,15},
			--[[042]] 17535288,{15,15},
			--[[043]] 17535289,{15,15},
			--[[044]] 17535290,{15,15}, 
			--[[045]] 17535291,{11,11},
			--[[046]] 17535292,{17535028,17535027},
			--[[047]] 17535293,{17535200,17535035},
			--[[048]] 17535294,{17535034,17535125}, 
			--[[049]] 17535295,{17535030,17535031},
			--[[050]] 17535296,{17535120},
			--[[051]] 17535297,{17535140,17535142,17535141},
			--[[052]] 17535298,{17535071,17535070}, 
			--[[053]] 17535299,{17535023,17535151},
			--[[054]] 17535300,{17535121},
			--[[055]] 17535301,{17535187},
			--[[056]] 17535302,{17535099,17535100},
			--[[057]] 17535303,{17535101},
			--[[058]] 17535304,{17535096,17535098},
			--[[059]] 17535305,{17535102,17535103},
			--[[060]] 17535306,{17535104,17535186},
			--[[061]] 17535004,{17535036,17535124,17535152},
			--[[063]] 17535308,{8,8},
			--[[064]] 17535309,{14,14},
			--[[065]] 17535310,{17535138,17535137},
			--[[066]] 17535311,{17535156,17535047},
			--[[067]] 17535312,{17535048,17535049},
			--[[068]] 17535313,{17535157,17535051},
			--[[069]] 17535314,{17535188,17535046},
			--[[070]] 17535315,{17535056,17535055,17535006},
			--[[071]] 17535316,{17535054,17535053},
			--[[073]] 17535318,{0,0}, -- kb
			--[[074]] 17535319,{17535042,17535122}, -- kb
			--[[075]] 17535320,{13,13},
			--[[076]] 17535321,{0,0}, -- kb
			--[[077]] 17535322,{47535189,17535041}, -- kb
			--[[078]] 17535323,{17535058,17535201}, -- kb
			--[[079]] 17535324,{17535059}, -- kb
			--[[080]] 17535325,{17535191,17535060}, -- kb
			--[[081]] 17535326,{17535061}, -- kb
			--[[082]] 17535327,{9},
			--[[083]] 17535328,{17535062,17535190}, -- kb
			--[[084]] 17535330,{17535133,17535134}, -- kb
			--[[085]] 17535331,{17535133,17535134}, -- kb
			--[[086]] 17535329,{0,0}, -- kb
			--[[087]] 17535332,{17535063}, -- kb
			--[[088]] 17535333,{17535132,17535170},
			--[[089]] 17535334,{0,0}, -- kb
			--[[090]] 17535335,{17535065, 17535386}, -- kb
			--[[091]] 17535336,{17535171,17535064}, -- kb
			--[[092]] 17535337,{0,0}, -- kb
			--[[093]] 17535338,{17535044,17535070,17535069}, -- kb
			--[[094]] 17535005,{17535074,17535072,17535177}, -- kb
			--[[095]] 17535113,{17535066,17535175,17535068}, -- kb
			--[[096]] 17535339,{17535129,17535081},
			--[[097]] 17535340,{17535078,17535169},
			--[[098]] 17535341,{17535085,17535084},
			--[[099]] 17535342,{17535114,17535115},
			--[[100]] 17535114,{10},
			--[[101]] 17535115,{17535114,17535342}, -- kb
			--[[102]] 17535343,{17535086, 17535202,17535164}, -- kb
			--[[103]] 17535344,{17535087,17535127}, -- kb
			--[[104]] 17535345,{0,0}, -- kb
			--[[105]] 17535346,{17535088,17535126,17535163}, -- kb
			--[[106]] 17535347,{17535161,17535090,17535160,17535089}, -- kb
			--[[107]] 17535348,{17535091,17535159}, -- kb
			--[[108]] 17535349,{17535091,17535159}, -- kb
			--[[110]] 17535350,{15,15,15},
			--[[151]] 17535154,{17535173,17535076}, -- kb
			--[[152]] 17535139,{17535135,17535136}, -- kb
			--[[111]] 17535355,{14,14,14},
			--[[116]] 17535356,{8,8,8,4,4},
			--[[117]] 17535357,{9,9,9},
			--[[118]] 17535358,{12,12,5,5,10,10},
			--[[119]] 17535359,{7,7,7,6,6},
			--[[120]] 17535360,{14,14,14},
			--[[121]] 17535361,{17535082,17535203,17535168,17535083},
			--[[122]] 17535362,{17535078,17535080,17535169,17535079,17535081},
			--[[123]] 17535363,{15,15,10,10},
			--[[124]] 17535364,{0,0}, -- kb
			--[[125]] 17535365,{15,15},
			--[[126]] 17535366,{17535088,17535126,17535163}, -- kb
			--[[127]] 17535367,{17535045,1753504}, -- kb
			--[[128]] 17535368,{17535188,17535046,17535056},
			--[[129]] 17535369,{17535156,17535047,17535048},
			--[[130]] 17535370,{17535104,17535186,17535103,17535102,17535101},
			--[[131]] 17535371,{17535100,17535099,17535096,17535098,17535187,17535094},
			--[[132]] 17535372,{17535185,17535014,17535013},
			--[[133]] 17535373,{17535016,17535017,17535018},
			--[[134]] 17535374,{17535008,17535184,17535019},
			--[[135]] 17535375,{17535148,17535010,17535009},
			--[[136]] 17535376,{17535183,17535000,17535001},
			--[[137]] 17535377,{17534993,17535181,17535147},
			--[[138]] 17535378,{17535144,17534998,17535145},
			--[[139]] 17535379,{17535197,17534999,17535116},
			--[[140]] 17535380,{17535179,17534991,17535117},
			--[[141]] 17535381,{17535105},
			--[[142]] 17535382,{17535143},
			--[[143]] 17535383,{17535112},
			--[[145]] 17535385,{17535172}, -- kb
			--[[146]] 17535386,{17535130}, -- kb
			--[[146]] 17535386,{7,7,7},
			--[[147]] 17535387,{15,15,17535390},
			--[[149]] 17535389,{15,15,17535388},
			--[[150]] 17535390,{9,9},
			--[[151]] 17534977,{17534979,17534978,17535350,17535351,17535355,17535353},
			}

			 -- Respawn Table
			sandyPops2 = {
			--[[001]] 17535003,--[[002]] 17535119,--[[003]] 17535131,--[[004]] 17535194,
			--[[005]] 17535360,--[[006]] 17535261,--[[007]] 17535265,--[[008]] 17535370,
			--[[009]] 17535371,--[[010]] 17535372,--[[011]] 17535373,--[[012]] 17535374,
			--[[013]] 17535375,--[[014]] 17535376,--[[015]] 17535377,--[[017]] 17535378,
			--[[018]] 17535379,--[[019]] 17535380,--[[020]] 17535281,--[[021]] 17535193,
			--[[022]] 17535298,
			}
	

-------------------------------------------------
-- local functions
-------------------------------------------------

local function arg3(player, bit)
    local csVar = player:getCharVar("Dynamis_Status")
    local timeKI = player:hasKeyItem(tpz.ki.RHAPSODY_IN_AZURE) and 65536 or 0

    if csVar == 0 then
        return 1 + timeKI -- first time visiting any dynamis zone
    elseif not player:getMaskBit(csVar, bit) then
        return 2 + timeKI -- first time visiting this dynamis zone
    else
        return 3 + timeKI -- have visited this dynamis zone more than once
    end
end

-------------------------------------------------
-- global functions
-------------------------------------------------

dynamis.eye =
{
    NONE    = 0,
    RED     = 1,
    BLUE    = 2,
    GREEN   = 3,
}

dynamis.entryNpcOnTrigger = function(player, npc)
    local zoneId = player:getZoneID()
    local info = entryInfo[zoneId]
    local ID = zones[zoneId]

    -- shrouded sand cutscene
    if info.csSand and player:getMaskBit(player:getCharVar("Dynamis_Status"), 0) then
        player:startEvent(info.csSand)

    -- first visit cutscene
    elseif info.csFirst and not player:getMaskBit(player:getCharVar("Dynamis_Status"), info.csBit) then
        player:startEvent(info.csFirst)

    -- victory cutscene
    elseif player:getCharVar(info.winVar) == 1 then
        player:startEvent(info.csWin, info.winKI)

    -- dynamis entry
    elseif not info.reqs or info.reqs(player) then
        local realDay = os.time()
        local dynaWaitxDay = player:getCharVar("dynaWaitxDay")

        if player:getMainLvl() < DYNA_LEVEL_MIN then
            player:messageSpecial(ID.text.PLAYERS_HAVE_NOT_REACHED_LEVEL, DYNA_LEVEL_MIN)
        elseif (dynaWaitxDay + BETWEEN_2DYNA_WAIT_TIME * 60 * 60) < realDay or  (realDay - .5 *60 *60) < dynaWaitxDay then -- if entering within hour can go in
            -- params: bit, cutscene option, Prismatic Hourglass KI, sJob option, junk, Shrouded Sand KI, Timeless Hourglass item ID, Perpetual Hourglass item ID
            player:startEvent(info.csDyna, info.csBit, arg3(player, info.csBit), tpz.ki.PRISMATIC_HOURGLASS, 1, 0, tpz.ki.VIAL_OF_SHROUDED_SAND, 4236, 4237)
        else
            local dayRemaining = math.floor(((dynaWaitxDay + BETWEEN_2DYNA_WAIT_TIME * 60 * 60) - realDay) / 3456)
            player:messageSpecial(ID.text.YOU_CANNOT_ENTER_DYNAMIS, dayRemaining, info.csBit)
        end

    -- standard dialog
    else
        player:messageSpecial(ID.text.DYNA_NPC_DEFAULT_MESSAGE)
    end
end

dynamis.entryNpcOnEventFinish = function(player, csid, option)
    local info = entryInfo[player:getZoneID()]

    -- shrouded sand cutscene
    if info.csSand and csid == info.csSand then
        npcUtil.giveKeyItem(player, tpz.ki.VIAL_OF_SHROUDED_SAND)
        player:setMaskBit("Dynamis_Status", 0, false)

    -- first visit cutscene
    elseif info.csFirst and csid == info.csFirst then
        player:setMaskBit("Dynamis_Status", info.csBit, true)

    -- victory cutscene
    elseif csid == info.csWin then
        player:setCharVar(info.winVar, 0)

    -- dynamis entry
    elseif csid == info.csDyna then
        player:setMaskBit("Dynamis_Status", info.csBit, true)

        if option == 0 or option == 1 then
            player:setCharVar("Dynamis_subjob", option)
            player:setCharVar("Dynamis_Entry", 1)

            local realDay = os.time()
            if DYNA_MIDNIGHT_RESET then
                realDay = getMidnight() - 86400
            end
            local dynaWaitxDay = player:getCharVar("dynaWaitxDay")

            if
                (dynaWaitxDay + BETWEEN_2DYNA_WAIT_TIME * 60 * 60) < realDay and
                not player:hasKeyItem(tpz.ki.RHAPSODY_IN_AZURE)
            then
                player:setCharVar("dynaWaitxDay", realDay)
            end

            player:setPos(unpack(info.enterPos))
        end
    end
end

dynamis.zoneOnInitialize = function(zone, zoneInit)
    local zoneId = zone:getID()
    local ID = zones[zoneId]
    local TE = ID.mob.TIME_EXTENSION
    local RF = ID.mob.REFILL_STATUE

	for nb2 = 0, #zoneInit, 1 do
		local mobNBR = zoneInit[nb2 + 1];
		SpawnMob(mobNBR)
	end

end



dynamis.zoneOnZoneIn = function(player, prevZone)
    local zoneId = player:getZoneID()
    local info = dynaInfo[zoneId]
    local ID = zones[zoneId]

    local cs = -1

    if player:getCharVar("Dynamis_Entry") == 1 or player:getGMLevel() > 0 then
        if player:getCharVar("Dynamis_subjob") == 1 then
            player:timer(5000, function(player) player:messageBasic(tpz.msg.basic.UNABLE_TO_ACCESS_SJ) end)
            player:addStatusEffect(tpz.effect.SJ_RESTRICTION, 0, 0, 0, 7200)
        end
        player:addStatusEffectEx(tpz.effect.DYNAMIS, 0, 0, 3, 3600)
        player:timer(5500, function(player) player:messageSpecial(ID.text.DYNAMIS_TIME_BEGIN, 60, tpz.ki.PRISMATIC_HOURGLASS) end)
        player:setCharVar("Dynamis_Entry", 0)
        player:setCharVar("Dynamis_subjob", 0)
    end

    if not player:hasStatusEffect(tpz.effect.DYNAMIS) then
        cs = 100 -- eject event (same event in all dynamis zones)
    elseif player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(unpack(info.entryPos))
    end

    return cs
end

dynamis.zoneOnEventFinish = function(player, csid, option, zone, zoneInit, spawnList, spawnList2)
    local zoneId = player:getZoneID()
    local info = dynaInfo[zoneId]

    if csid == 100 then
        player:setPos(unpack(info.ejectPos))
    end
	
	-- despawns
	for nb = 1, #spawnList, 2 do
	if (mobID == spawnList[nb]) then
		for nbi = 1, #spawnList[nb + 1], 1 do
			local mobNBR = spawnList[nb + 1][nbi];
				DespawnMob(mobNBR)
			end
		end
	end

	for nb2 = 0, #zoneInit, 1 do
		local mobNBR = zoneInit[nb2 + 1];
		DespawnMob(mobNBR)
	end
	
	
	for nb3 = 0, #spawnList2, 1 do
		local mobNBR2 = spawnList2[nb3 + 1];
		SpawnMob(mobNBR2)
	end
	
		-- Spawns all first map mobs
	for nb = 1, #spawnList, 2 do
		if (mobID == spawnList[nb]) then
			for nbi = 1, #spawnList[nb + 1], 1 do
				local mobNBR = spawnList[nb + 1][nbi];
				dynamis.spawnMob(mobNBR, superLinkId, agro);
			end
		end
	end
	
	-- respawns
	dynamis.zoneOnInitialize(zone, zoneInit)


end

dynamis.somnialThresholdOnTrigger = function(player, npc)
    -- ability to unlock SJ message
    local canUnlockSJ = player:hasStatusEffect(tpz.effect.SJ_RESTRICTION) and 1 or 0

    -- bitmask controls options in the menu. 1 = Leave Dynamis.  2 = Unlock support jobs.  4 = Nothing (quit menu)
    local menuBits = 5 + (canUnlockSJ * 2)

    player:startEvent(101, 0x27, canUnlockSJ, menuBits)
end

dynamis.somnialThresholdOnEventFinish = function(player, csid, option)
    local zoneId = player:getZoneID()
    local info = dynaInfo[zoneId]

    if csid == 101 then
        if option == 1 then
            player:setPos(unpack(info.ejectPos))
        elseif option == 2 then
            player:delStatusEffectSilent(tpz.effect.SJ_RESTRICTION)
        end
    end
end

dynamis.megaBossOnDeath = function(mob, player, isKiller, zoneInit, spawnList, spawnList2)
    local zoneId = player:getZoneID()
    local info = dynaInfo[zoneId]

    player:addTitle(info.winTitle)

    if not player:hasKeyItem(info.winKI) then
        npcUtil.giveKeyItem(player, info.winKI)
        player:setCharVar(info.winVar, 1)
    end
	
	
	 
    local ID = zones[zoneId]

	for nb = 1, #spawnList, 2 do
		if (mobID == spawnList[nb]) then
			for nbi = 1, #spawnList[nb + 1], 1 do
				local mobNBR = spawnList[nb + 1][nbi];
				DespawnMob(mobNBR)
			end
		end
	end

	for nb2 = 0, #zoneInit, 1 do
		local mobNBR = zoneInit[nb2 + 1];
		DespawnMob(mobNBR)
	end
	
	
	for nb3 = 0, #spawnList2, 1 do
		local mobNBR2 = spawnList2[nb3 + 1];
		SpawnMob(mobNBR2)
	end
	
end

dynamis.timeExtensionOnDeath = function(mob, player, isKiller)
    local mobId = mob:getID()
    local zoneId = mob:getZoneID()
    local ID = zones[zoneId]
    local TE = ID.mob.TIME_EXTENSION

    if TE then
        local found = false
        local te = nil
        local group = {}

        -- find this TE's group
        for _, t in pairs(TE) do
            if type(t.mob) == "number" then
                group = {t.mob}
            elseif type(t.mob) == "table" then
                group = {unpack(t.mob)}
            end
            for _, g in pairs(group) do
                if g == mobId then
                    found = true
                    te = t
                    break
                end
            end
            if found then
                break
            end
        end

        if found then
            -- award KI and extension to those who have not yet received it
            local effect = player:getStatusEffect(tpz.effect.DYNAMIS)
            if effect and not player:hasKeyItem(te.ki) then
                npcUtil.giveKeyItem(player, te.ki)
                local old_duration = effect:getDuration()
                effect:setDuration((old_duration + (te.minutes * 60)) * 1000)
                player:setLocalVar("dynamis_lasttimeupdate", effect:getTimeRemaining() / 1000)
                player:messageSpecial(ID.text.DYNAMIS_TIME_EXTEND, te.minutes)
            end

            -- spawn a new mob in this group
            if isKiller then
                local teId = group[math.random(#group)]
                if teId ~= mobId then
                    DisallowRespawn(mobId, true)
                    DisallowRespawn(teId, false)
                end
                GetMobByID(teId):setRespawnTime(85)
            end
        else
            printf("[dynamis.timeExtensionOnDeath] called in zone %i on mob %s that does not appear in a time extension group.", zoneId, mob:getName())
        end
    else
        printf("[dynamis.timeExtensionOnDeath] called on mob %s in zone %i that does not have a TIME_EXTENSION table in its IDs.", mob:getName(), zoneId)
    end
end

dynamis.refillStatueOnSpawn = function(mob)
    local mobId = mob:getID()
    local zoneId = mob:getZoneID()
    local ID = zones[zoneId]
    local RF = ID.mob.REFILL_STATUE

    if RF then
        local found = false
        local eye = nil

        -- set this statue's eye color
        for _, g in pairs(RF) do
            for _, m in pairs(g) do
                if m.mob == mobId then
                    found = true
                    mob:AnimationSub(m.eye)
                    break
                end
            end
            if found then
                break
            end
        end

        if not found then
            printf("[dynamis.refillStatueOnSpawn] called in zone %i on mob %i that does not appear in a refill statue group.", zoneId, mobId)
        end
    else
        printf("[dynamis.refillStatueOnSpawn] called on mob %i in zone %i that does not have a REFILL_STATUE table in its IDs.", mobId, zoneId)
    end
end

dynamis.refillStatueOnDeath = function(mob, player, isKiller)
    local mobId = mob:getID()
    local zoneId = mob:getZoneID()
    local ID = zones[zoneId]
    local RF = ID.mob.REFILL_STATUE

    if RF then
        local found = false
        local group = {}
        local eye = nil

        -- find this statue's group and eye color
        for _, g in pairs(RF) do
            group = {}
            for _, m in pairs(g) do
                table.insert(group, m.mob)
                if m.mob == mobId then
                    found = true
                    eye = m.eye
                end
            end
            if found then
                break
            end
        end

        if found then
            if isKiller then
                -- MP or HP refill
                if eye == dynamis.eye.BLUE or eye == dynamis.eye.GREEN then
                    local zone = mob:getZone()
                    local players = zone:getPlayers()
                    for name, player in pairs(players) do
                        if mob:checkDistance(player) < 30 then
                            if eye == dynamis.eye.BLUE then
                                local amt = player:getMaxMP() - player:getMP()
                                player:restoreMP(amt)
                                player:messageBasic(tpz.msg.basic.RECOVERS_MP, 0, amt)
                            else
                                local amt = player:getMaxHP() - player:getHP()
                                player:restoreHP(amt)
                                player:messageBasic(tpz.msg.basic.RECOVERS_HP, 0, amt)
                            end
                        end
                    end
                end
                mob:AnimationSub(dynamis.eye.NONE)

                -- spawn a new mob in this group
                local nextId = group[math.random(#group)]
                if nextId ~= mobId then
                    DisallowRespawn(mobId, true)
                    DisallowRespawn(nextId, false)
                end
                GetMobByID(nextId):setRespawnTime(300) -- 5 minutes
            end
        else
            printf("[dynamis.refillStatueOnDeath] called in zone %i on mob %i that does not appear in a refill statue group.", zoneId, mobId)
        end
    else
        printf("[dynamis.refillStatueOnDeath] called on mob %i in zone %i that does not have a REFILL_STATUE table in its IDs.", mobId, zoneId)
    end
end

dynamis.qmOnTrade = function(player, npc, trade)
    local npcId = npc:getID()
    local zoneId = npc:getZoneID()
    local ID = zones[zoneId]
    local QM = ID.npc.QM

    if QM then
        local info = QM[npcId]

        if info then
            for _, v in pairs(info.trade) do
                if npcUtil.tradeHasExactly(trade, v.item) then
                    local mobId
                    if type(v.mob) == "table" then
                        mobId = v.mob[math.random(#v.mob)]
                    else
                        mobId = v.mob
                    end
                    if mobId and npcUtil.popFromQM(player, npc, mobId, {hide = 0, radius = 2}) then
                        player:confirmTrade()
                    end
                    break
                end
            end
        else
            printf("[dynamis.qmOnTrade] called on in zone %i on npc %i (%s) that does not appear in QM data.", zoneId, npcId, npc:getName())
        end
    else
        printf("[dynamis.qmOnTrade] called on npc %i (%s) in zone %i that does not have a QM group in its IDs.", npcId, npc:getName(), zoneId)
    end
end

dynamis.qmOnTrigger = function(player, npc)
    local npcId = npc:getID()
    local zoneId = npc:getZoneID()
    local ID = zones[zoneId]
    local QM = ID.npc.QM

    if QM then
        local info = QM[npcId]

        if info then
            if info.param then
                player:startEvent(102, unpack(info.param))
            elseif info.trade and #info.trade == 1 and info.trade[1].item and type(info.trade[1].item) == "number" and ID.text.OMINOUS_PRESENCE then
                player:messageSpecial(ID.text.OMINOUS_PRESENCE, info.trade[1].item)
            end
        else
            printf("[dynamis.qmOnTrigger] called on in zone %i on npc %i (%s) that does not appear in QM data.", zoneId, npcId, npc:getName())
        end
    else
        printf("[dynamis.qmOnTrigger] called on npc %i (%s) in zone %i that does not have a QM group in its IDs.", npcId, npc:getName(), zoneId)
    end
end

--------------------------------------------------
-- getDynamisMapList
-- Produces a bitmask for the goblin ancient currency NPCs
--------------------------------------------------

function getDynamisMapList(player)
    local bitmask = 0
    if (player:hasKeyItem(tpz.ki.MAP_OF_DYNAMIS_SANDORIA) == true) then
        bitmask = bitmask + 2
    end
    if (player:hasKeyItem(tpz.ki.MAP_OF_DYNAMIS_BASTOK) == true) then
        bitmask = bitmask + 4
    end
    if (player:hasKeyItem(tpz.ki.MAP_OF_DYNAMIS_WINDURST) == true) then
        bitmask = bitmask + 8
    end
    if (player:hasKeyItem(tpz.ki.MAP_OF_DYNAMIS_JEUNO) == true) then
        bitmask = bitmask + 16
    end
    if (player:hasKeyItem(tpz.ki.MAP_OF_DYNAMIS_BEAUCEDINE) == true) then
        bitmask = bitmask + 32
    end
    if (player:hasKeyItem(tpz.ki.MAP_OF_DYNAMIS_XARCABARD) == true) then
        bitmask = bitmask + 64
    end
    if (player:hasKeyItem(tpz.ki.MAP_OF_DYNAMIS_VALKURM) == true) then
        bitmask = bitmask + 128
    end
    if (player:hasKeyItem(tpz.ki.MAP_OF_DYNAMIS_BUBURIMU) == true) then
        bitmask = bitmask + 256
    end
    if (player:hasKeyItem(tpz.ki.MAP_OF_DYNAMIS_QUFIM) == true) then
        bitmask = bitmask + 512
    end
    if (player:hasKeyItem(tpz.ki.MAP_OF_DYNAMIS_TAVNAZIA) == true) then
        bitmask = bitmask + 1024
    end

    return bitmask
end

-- todo: fix these to use tables
function dynamis.getExtensions(player)
    local count = 0
    for i=tpz.ki.CRIMSON_GRANULES_OF_TIME, tpz.ki.OBSIDIAN_GRANULES_OF_TIME do
        if player:hasKeyItem(i) then count = count + 1 end
    end
    return count
end

function dynamis.procMonster(mob, player)
    if player and player:getAllegiance() == 1 then
        local master = player:getMaster()
        if master then
            player = master
        end
        local extensions = dynamis.getExtensions(player)
        if extensions > 2 then
            if player:getSubJob() == tpz.job.NONE and math.random(0, 99) == 0 then
                mob:setLocalVar("dynamis_proc", 4)
                mob:weaknessTrigger(3)
                mob:addStatusEffect(tpz.effect.TERROR, 0, 0, 30)
            elseif extensions == 5 then
                mob:setLocalVar("dynamis_proc", 3)
                mob:weaknessTrigger(2)
                mob:addStatusEffect(tpz.effect.TERROR, 0, 0, 30)
            elseif extensions == 4 then
                mob:setLocalVar("dynamis_proc", 2)
                mob:weaknessTrigger(1)
                mob:addStatusEffect(tpz.effect.TERROR, 0, 0, 30)
            elseif extensions == 3 then
                mob:setLocalVar("dynamis_proc", 1)
                mob:weaknessTrigger(0)
                mob:addStatusEffect(tpz.effect.TERROR, 0, 0, 30)
            end
        end
    end
end


function dynamis.spawnGroup(mob, spawnList, target)

	local mobID = mob:getID()
	local superLinkId = mob:getShortID()
	local agro = target
	
	-- Ensure my members superlink with me
	mob:setMobMod(tpz.mobMod.SUPER_LINK)

	for nb = 1, #spawnList, 2 do
		if (mobID == spawnList[nb]) then
			for nbi = 1, #spawnList[nb + 1], 1 do
				local mobNBR = spawnList[nb + 1][nbi];
				dynamis.spawnMob(mobNBR, superLinkId, agro);
			end
		end
	end
end


 function dynamis.spawnMob(mobId, superLinkId, target)
		--Spawn each Mob from group
		local mob = SpawnMob(mobId);
		mob:updateEnmity(target)
 end

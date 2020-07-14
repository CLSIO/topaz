-----------------------------------
-- Area: Dynamis-San_dOria
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/dynamis")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.DYNAMIS_SAN_DORIA] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6402, -- There is nothing out of the ordinary here.
        CONQUEST_BASE           = 7055, -- Tallying conquest results...
        DYNAMIS_TIME_BEGIN      = 7214, -- The sands of the <item> have begun to fall. You have <number> minutes (Earth time) remaining in Dynamis.
        DYNAMIS_TIME_EXTEND     = 7215, -- our stay in Dynamis has been extended by <number> minute[/s].
        DYNAMIS_TIME_UPDATE_1   = 7216, -- ou will be expelled from Dynamis in <number> [second/minute] (Earth time).
        DYNAMIS_TIME_UPDATE_2   = 7217, -- ou will be expelled from Dynamis in <number> [seconds/minutes] (Earth time).
        DYNAMIS_TIME_EXPIRED    = 7219, -- The sands of the hourglass have emptied...
        OMINOUS_PRESENCE        = 7230, -- You feel an ominous presence, as if something might happen if you possessed <item>.
    },
    mob =
    {
        TIME_EXTENSION =
        {
            {minutes = 10, ki = tpz.ki.CRIMSON_GRANULES_OF_TIME,   mob = 17535026},
            {minutes = 10, ki = tpz.ki.AZURE_GRANULES_OF_TIME,     mob = 17535360},
            {minutes = 10, ki = tpz.ki.AMBER_GRANULES_OF_TIME,     mob = 17535310},
            {minutes = 15, ki = tpz.ki.ALABASTER_GRANULES_OF_TIME, mob = 17535330},
            {minutes = 15, ki = tpz.ki.OBSIDIAN_GRANULES_OF_TIME,  mob = 17535139},
        },
        REFILL_STATUE =
        {
            {
                {mob = 17535003, eye = dynamis.eye.RED  }, -- Serjeant_Tombstone
                {mob = 17535004, eye = dynamis.eye.BLUE },
                {mob = 17535005, eye = dynamis.eye.GREEN},
            },
            {
                {mob = 17535113, eye = dynamis.eye.RED  }, -- Serjeant_Tombstone
                {mob = 17535114, eye = dynamis.eye.BLUE },
                {mob = 17535115, eye = dynamis.eye.GREEN},
            },
            {
                {mob = 17535154, eye = dynamis.eye.RED  }, -- Serjeant_Tombstone
                {mob = 17535155, eye = dynamis.eye.GREEN},
            },
            {
                {mob = 17535166, eye = dynamis.eye.RED  }, -- Serjeant_Tombstone
                {mob = 17535167, eye = dynamis.eye.BLUE },
            },
            {
                {mob = 17535193, eye = dynamis.eye.RED  }, -- Serjeant_Tombstone
                {mob = 17535194, eye = dynamis.eye.GREEN},
            },
            {
                {mob = 17535205, eye = dynamis.eye.RED  }, -- Serjeant_Tombstone
                {mob = 17535206, eye = dynamis.eye.BLUE },
            },
        },
		
		TOMBSTONE = 
        {
			17535003,	-- Serjeant_Tombstone - 1
		    17535004,	-- Serjeant_Tombstone - 2
		    17535005,	-- Serjeant_Tombstone - 3
			17535113,	-- Serjeant_Tombstone - 4
			17535114,	-- Serjeant_Tombstone - 5
			17535026,	-- Warchief_Tombstone - 6
			
			-- Back path
			17535115,	-- Serjeant_Tombstone - 7
			17535154,	-- Serjeant_Tombstone - 8, spawned from 7
			17535155,	-- Serjeant_Tombstone - 9
			17535166,	-- Serjeant_Tombstone - 10, spawned from 9
			17535167,	-- Serjeant_Tombstone - 11
			17535193,	-- Serjeant_Tombstone - 12 - spawns nothing
			17535057,	-- Warchief_Tombstone - 13
			17535128,	-- Warchief_Tombstone - 14
			17535194,	-- Serjeant_Tombstone - 15
			17535205,	-- Serjeant_Tombstone - 16
			17535206,	-- Serjeant_Tombstone - 17
			17535131,	-- Warchief_Tombstone - 18
			17535250,	-- Serjeant_Tombstone - 19
			17535251,	-- Serjeant_Tombstone - 20
			17535139,	-- Warchief_Tombstone - 21
			17535252,	-- Serjeant_Tombstone - 22
			17535253,	-- Serjeant_Tombstone - 23
			17535254,	-- Serjeant_Tombstone - 24
			17535255,	-- Serjeant_Tombstone - 25
			17535256,	-- Serjeant_Tombstone - 26
			17535257,	-- Serjeant_Tombstone - 27
			17535258,	-- Serjeant_Tombstone - 28
			17535259,	-- Serjeant_Tombstone - 29
			17535260,	-- Serjeant_Tombstone - 30
			17535261,	-- Warchief_Tombstone - 31
			17535262,	-- Serjeant_Tombstone - 32
			17535263,	-- Warchief_Tombstone - 33
			17535264,	-- Warchief_Tombstone - 34
			17535265,	-- Serjeant_Tombstone - 35
			17535266,	-- Serjeant_Tombstone - 36
			17535267,	-- Serjeant_Tombstone - 37
			17535268,	-- Serjeant_Tombstone - 38
			17535269,	-- Serjeant_Tombstone - 39
			17535270,	-- Serjeant_Tombstone - 40
			17535271,	-- Serjeant_Tombstone - 41
			17535272,	-- Serjeant_Tombstone - 42
			17535273,	-- Serjeant_Tombstone - 43
			17535274,	-- Warchief_Tombstone - 44
			17535275,	-- Serjeant_Tombstone - 45
			17535276,	-- Serjeant_Tombstone - 46
			17535277,	-- Serjeant_Tombstone - 47
			17535278,	-- Serjeant_Tombstone - 48
			17535279,	-- Serjeant_Tombstone - 49
			17535280,	-- Warchief_Tombstone - 50
			17535281,	-- Warchief_Tombstone - 51
			17535282,	-- Serjeant_Tombstone - 52
			17535283,	-- Serjeant_Tombstone - 53
			17535284,	-- Serjeant_Tombstone - 54
			17535285,	-- Serjeant_Tombstone - 55
			17535286,	-- Serjeant_Tombstone - 56
			17535287,	-- Serjeant_Tombstone - 57
			17535288,	-- Serjeant_Tombstone - 58

			
		},
		
		GUARD =
		{
		
		--BEGINING
			-- Serjeant_Tombstone - 1
			17534980,	-- Vanguard_Footsoldier	1
			17535000,	-- Vanguard_Footsoldier	2
			
			-- Serjeant_Tombstone - 2
			17534986,	-- Vanguard_Grappler	3
			
			-- Serjeant_Tombstone - 3
			17535001,	-- Vanguard_Grappler	4
			
			-- Serjeant_Tombstone - 4
			17534983,	-- Vanguard_Vexer		5
			
			-- Serjeant_Tombstone - 5
			17534998,	-- Vanguard_Vexer		6
			
			-- Warchief_Tombstone - 6
			17535017,	-- Vanguard_Grappler	7
			17535035,	-- Vanguard_Grappler	8
			17535059,	-- Vanguard_Grappler	9
			
			-- Serjeant_Tombstone -  8
			17535028,	-- Vanguard_Hawker		10
			17534985,	-- Vanguard Mesmerizer	11
			17534988,	-- Vanguard Mesmerizer	12
			
			-- Serjeant_Tombstone -  10
			17534981,	-- Vanguard_Trooper		13
			17534999,	-- Vanguard_Predator	14
			17535002,	-- Vanguard_Predator	15
			
			-- Serjeant_Tombstone -  11
			17535079,	-- Vanguard_Grappler	16
			17535046,	-- Vanguard Mesmerizer	17
			17535051,	-- Vanguard Mesmerizer	18
			
			-- Serjeant_Tombstone -  12
				-- Spawns nothing
			
			-- Warchief_Tombstone - 13
			17534990,	-- Vanguard_Gutslasher	19
			17535030,	-- Vanguard_Gutslasher	20

			-- Warchief_Tombstone - 14
			17534993,	-- Vanguard_Backstabber	21
			17535013,	-- Vanguard_Backstabber	22

			-- Serjeant_Tombstone -  15
				-- Spawns nothing

			-- Serjeant_Tombstone -  16 - 25 on dynamis maps 
			17535008,	-- Vanguard_Trooper	23
			17534987,	-- Vanguard_Neckchopper	24

			-- Serjeant_Tombstone -  17 - 28 on dynamis maps
			17535012,	-- Vanguard_Footsoldier	25
			17535016,	-- Vanguard_Footsoldier	26

			-- Warchief_Tombstone -  18 - dm31
			17535024,	-- Vanguard_Vexer	27
			17535047,	-- Vanguard_Vexer	28

			-- Warchief_Tombstone -  19 - dm42
			17534984,	-- Vanguard_Pillager	29
			17535021,	-- Vanguard_Pillager	30

			-- Serjeant_Tombstone -  20 - dm34
			17534991,	-- Vanguard_Impaler		31
			17535014,	-- Vanguard_Impaler		32

			-- Warchief_Tombstone -  21 - dm39
			17534982,	-- Vanguard_Amputator	33
			17535009,	-- Vanguard_Amputator	34

			-- Serjeant_Tombstone -  22 - dm67
			17535036,	-- Vanguard_Pillager	35

			-- Serjeant_Tombstone -  23 - dm71
			17535018,	-- Vanguard_Amputator	36
			17535061,	-- Vanguard_Mesmerizer	37

			-- Serjeant_Tombstone -  24 - dm69
			17535054,	-- Vanguard_Pillager	38

			-- Serjeant_Tombstone -  25 - dm74
			17535063,	-- Vanguard_Pillager	39
			17534989,	-- Vanguard_Bugler		40

		-- Top of East Ron Gate
		
			-- Serjeant_Tombstone -  26 - dm77
			17535081,	-- Vanguard_Pillager	41
			17535022,	-- Vanguard_Bugler		42

			-- Serjeant_Tombstone -  27 - dm80
			17535135,	-- Vanguard_Pillager	43
			17535027,	-- Vanguard_Bugler		44


		-- Bottom of East Ron Gate

			-- Serjeant_Tombstone -  28 - dm99
				-- Spawns nothing
				

			-- Serjeant_Tombstone -  29 - dm92
			17535023,	-- Vanguard_Predator	45
			17535039,	-- Vanguard_Predator	46

			-- Serjeant_Tombstone -  30 - dm95 
			17535045,	-- Vanguard_Amputator	47
			17535060,	-- Vanguard_Amputator	48

			-- Warchief_Tombstone -  31 - dm101
				-- Spawns nothing

			-- Serjeant_Tombstone -  32 - dm98
				-- Spawns nothing

			-- Warchief_Tombstone -  33 - dm87
			17535020,	-- Vanguard_Neckchopper	49
			17535038,	-- Vanguard_Neckchopper	50
			17535032,	-- Vanguard_Neckchopper	51
			
			-- Warchief_Tombstone -  34 - dm152
				-- Spawns nothing


		-- Auction House East

			-- Serjeant_Tombstone -  35 - dm131
			17535070,	-- Vanguard_Gutslasher	52
			17535082,	-- Vanguard_Gutslasher	53

			-- Warchief_Tombstone -  36 - dm134
			17535066,	-- Vanguard_Gutslasher	54
			17535076,	-- Vanguard_Gutslasher	55

		-- Chocobo Stables

			-- Serjeant_Tombstone -  37 - dm107
			17535086,	-- Vanguard_Amputator	56

			-- Serjeant_Tombstone -  38 - dm102
			17535146,	-- Vanguard_Pillager	57
			17535158,	-- Vanguard_Pillager	58

			-- Serjeant_Tombstone -  39 - dm105
			17535099,	-- Vanguard_Amputator	59

			-- Serjeant_Tombstone -  40 - dm109
			17535019,	-- Vanguard_Trooper		60
			17535025,	-- Vanguard_Trooper		61

			-- Warchief_Tombstone -  41 - dm112
				-- Spawns nothing
				
			-- Warchief_Tombstone -  42 - dm113
				-- Spawns nothing


		-- Auction House Centeral
		
			-- Serjeant_Tombstone -  43 - dm129
			17535117,	-- Vanguard_Amputator	62
			
			-- Warchief_Tombstone -  44 - dm124
			17535069,	-- Vanguard_Predator	63
			17535089,	-- Vanguard_Predator	64

			-- Serjeant_Tombstone -  45 - dm127
			17535141,	-- Vanguard_Amputator	65

			-- Serjeant_Tombstone -  46 - dm121
			17535091,	-- Vanguard_Grappler	66
			17535034,	-- Vanguard_Footsoldier	67

			-- Serjeant_Tombstone -  47 - dm114
			17535037,	-- Vanguard_Trooper		68
			17535058,	-- Vanguard_Footsoldier	69
			17535085,	-- Vanguard_Footsoldier	70

			-- Serjeant_Tombstone -  48 - dm118
			17535103,	-- Vanguard_Grappler	71
			17535098,	-- Vanguard_Footsoldier	72


			-- Serjeant_Tombstone -  49 - dm149
			17535092,	-- Vanguard_Gutslasher	73
			17535104,	-- Vanguard_Gutslasher	74

			-- Warchief_Tombstone -  50 - dm144
			17535094,	-- Vanguard_Hawker	75
			17535149,	-- Vanguard_Hawker	76

			-- Warchief_Tombstone -  51 - dm139
			17534996,	-- Vanguard_Dollmaster	77
			17535010,	-- Vanguard_Dollmaster	78

			-- Serjeant_Tombstone -  52 - dm190
			17535093,	-- Vanguard_Predator	79
			17535101,	-- Vanguard_Predator	80

			-- Serjeant_Tombstone -  53 - dm193
			17535031,	-- Vanguard_Backstabber	81
			17535041,	-- Vanguard_Backstabber	82

			-- Serjeant_Tombstone -  54 - dm180
			17535049,	-- Vanguard_Dollmaster	83
			17535074,	-- Vanguard_Dollmaster	84

			-- Serjeant_Tombstone -  55 - dm185
			17535110,	-- Vanguard_Dollmaster	85
			17535181,	-- Vanguard_Dollmaster	86

			-- Serjeant_Tombstone -  56 - dm175
			17535191,	-- Vanguard_Dollmaster	87
			17535203,	-- Vanguard_Dollmaster	88

			-- Serjeant_Tombstone -  57 - dm196
			17535071,	-- Vanguard_Backstabber	89
			17535083,	-- Vanguard_Dollmaster	90
			
			-- Serjeant_Tombstone -  58 - dm199
			17535106,	-- Vanguard_Predator	91
			17535119,	-- Vanguard_Predator	92
			
			

		},
	
    },
    npc =
    {
        QM =
        {
            [17535223] =
            {
                param = {3353, 3404, 3405, 3406, 3407, 3408},
                trade =
                {
                    {item = 3353,                           mob = 17534977}, -- Overlord's Tombstone
                    {item = {3404, 3405, 3406, 3407, 3408}, mob = 17535213}, -- Arch Overlord Tombstone
                }
            },
            [17535224] = {trade = {{item = 3380, mob = 17535207}}}, -- Bladeburner Rokgevok
            [17535225] = {trade = {{item = 3381, mob = 17535208}}}, -- Steelshank Kratzvatz
            [17535226] = {trade = {{item = 3382, mob = 17535210}}}, -- Bloodfist Voshgrosh
            [17535227] = {trade = {{item = 3383, mob = 17535211}}}, -- Spellspear Djokvukk
        },
    },
}

return zones[tpz.zone.DYNAMIS_SAN_DORIA]

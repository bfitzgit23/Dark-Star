-- Spawns additional trainers in the world.
-- This script is designed to place trainers near every Dark Star Vendor.

additional_trainers = ScreenPlay:new {
    numberOfActs = 1,
    questString = "trainers",
    states = {},
}

registerScreenPlay("additional_trainers", true)

function additional_trainers:start()
    -- This table defines all the trainers to be spawned.
    -- The coordinates are based on the Dark Star Vendor locations,
    -- with an offset of +5 to the X-coordinate to place them nearby.
    local trainerSpawns = {
        -- Corellia Spawns
		{ "corellia", "revan", -152, 28.0, -4724, 35, "-- CNET (Vendor at -157)" },
        { "corellia", "trainer_brawler", -152, 28.0, -4724, 35, "-- CNET (Vendor at -157)" },
        { "corellia", "trainer_brawler", -5037, 21.0, -2297, 35, "-- Tyrena (Vendor at -5042)" },
        { "corellia", "trainer_brawler", -3133, 31.0, 2796, 35, "-- Kor Vella (Vendor at -3138)" },
        { "corellia", "trainer_brawler", 3338, 308.0, 5524, 35, "-- Doaba Guerfel (Vendor at 3333)" },
        { "corellia", "trainer_brawler", -5545, 15.58, -6061, 35, "-- Vreni Island (Vendor at -5550)" },
        { "corellia", "trainer_brawler", 6648.02, 330.00, -5920.87, 35, "-- Bela Vistal (Vendor at 6643.02)" },
        -- Naboo Spawns
        { "naboo", "trainer_brawler", -4867, 6.0, 4151, 35, "-- Theed (Vendor at -4872)" },
        { "naboo", "trainer_brawler", 4812, 4.0, -4705, 35, "-- Moenia (Vendor at 4807)" },
        { "naboo", "trainer_brawler", 5205, -192.0, 6677, 35, "-- Kaadara (Vendor at 5200)" },
        { "naboo", "trainer_brawler", 1449, 14.0, 2777, 35, "-- Keren (Vendor at 1444)" },
        { "naboo", "trainer_brawler", 5336.16, 326.95, -1576.12, 35, "-- Dee'ja Peak (Vendor at 5331.16)" },
        { "naboo", "trainer_brawler", -5490.62, -150.00, -24.69, 35, "-- Lake Retreat (Vendor at -5495.62)" },
        -- Tatooine Spawns
        { "tatooine", "trainer_brawler", 3527, 5.0, -4803, 35, "-- Mos Eisley (Vendor at 3522)" },
        { "tatooine", "trainer_brawler", -1276, 12.0, -3590, 35, "-- Bestine (Vendor at -1281)" },
        { "tatooine", "trainer_brawler", -2909, 5.0, 2129, 35, "-- Mos Espa (Vendor at -2914)" },
        { "tatooine", "trainer_brawler", 1298, 7.0, 3140, 35, "-- Mos Entha (Vendor at 1293)" },
        { "tatooine", "trainer_brawler", 53.33, 52.00, -5340.53, 35, "-- Anchorhead (Vendor at 48.33)" },
        -- Talus Spawns
        { "talus", "trainer_brawler", -2188, 20.0, 2313, 35, "-- Imperial Outpost (Vendor at -2193)" },
        { "talus", "trainer_brawler", 4452, 2.0, 5271, 35, "-- Nashal (Vendor at 4447)" },
        { "talus", "trainer_brawler", 343, 6.0, -2931, 35, "-- Dearic (Vendor at 338)" },
        -- Rori Spawns
        { "rori", "trainer_brawler", 5370, 80.0, 5657, 35, "-- Restuss (Vendor at 5365)" },
        { "rori", "trainer_brawler", -5300, 80.0, -2228, 35, "-- Narmle (Vendor at -5305)" },
        { "rori", "trainer_brawler", 3688, 96.0, -6436, 35, "-- Rebel Outpost (Vendor at 3683)" },
        -- Endor Spawns
        { "endor", "trainer_brawler", -943, 73.0, 1550, 35, "-- Smuggler's Outpost (Vendor at -948)" },
        { "endor", "trainer_brawler", 3206, 24.0, -3501, 35, "-- Research Outpost (Vendor at 3201)" },
        -- Dantooine Spawns
        { "dantooine", "trainer_brawler", -627, 3.0, 2501, 35, "-- Mining Outpost (Vendor at -632)" },
        { "dantooine", "trainer_brawler", -4204, 3.0, -2349, 35, "-- Imperial Outpost (Vendor at -4209)" },
        { "dantooine", "trainer_brawler", 1569, 4.0, -6415, 35, "-- Agro Outpost (Vendor at 1564)" },
        -- Dathomir Spawns
        { "dathomir", "trainer_brawler", 624, 3.0, 3090, 35, "-- Trade Outpost (Vendor at 619)" },
        { "dathomir", "trainer_brawler", -42, 18.0, -1586, 35, "-- Science Outpost (Vendor at -47)" },
        -- Yavin 4 Spawns
        { "yavin4", "trainer_brawler", -260, 35.0, 4897, 35, "-- Mining Outpost (Vendor at -265)" },
        { "yavin4", "trainer_brawler", 4058, 17.0, -6217, 35, "-- Imperial Outpost (Vendor at 4053)" },
        { "yavin4", "trainer_brawler", -6917, 73.0, -5730, 35, "-- Labor Outpost (Vendor at -6922)" },
        -- Lok Spawns
        { "lok", "trainer_brawler", 484, 8.0, 5512, 35, "-- Nym's Stronghold (Vendor at 479)" },
    }

    -- Loop through the table and spawn each trainer.
    for i, spawnData in ipairs(trainerSpawns) do
        local planet = spawnData[1]
        local mobileType = spawnData[2]
        local x = spawnData[3]
        local y = spawnData[4]
        local z = spawnData[5]
        local heading = spawnData[6]
        
        spawnMobile(planet, mobileType, 1, x, y, z, heading, 0)
    end
end

--
-- This script spawns space terminals at specified locations,
-- intended to be near shuttle ports or points of interest like force shrines.
--
-- IMPORTANT: The 'm' suffix in the original input indicated a distance and has been
-- omitted. Only valid X and Z coordinates have been used.
-- Entries with only a distance (e.g., "Coronet6215m") have been removed as they
-- did not contain actual coordinate pairs.
--

space_terminal_spawner = ScreenPlay:new {
    numberOfActs = 1,
    questString = "space_terminal_spawner",
    states = {},
}

registerScreenPlay("space_terminal_spawner", true)

function space_terminal_spawner:start()
    -- The object template for the space terminal.
    local terminalTemplate = "object/tangible/terminal/terminal_space.iff"

    -- This table defines all the space terminals to be spawned.
    -- The coordinates are based on the provided shrine locations.
    -- The 'y' coordinate (vertical height) is set to a default of 50.
    -- You may need to adjust the 'y' coordinate for accurate placement on terrain.
    local terminalSpawns = {
        -- Existing Spawns (from your example)
        { "dathomir", 5210, 78.5, -4056, 0, "-- The Village" },
        { "dantooine", 6910, 25, -4086, 0, "-- Janta Cave" },

        -- Corellia Shrines
        { "corellia", -7391, 50, -3938, 0, "-- Corellia Shrine" },
        { "corellia", 6300, 50, 6687, 0, "-- Tyrena Shrine" },
        { "corellia", -2384, 50, 6393, 0, "-- Doaba Guerfel Shrine" },
        { "corellia", -6907, 50, 4527, 0, "-- Kor Vella Shrine" },
        { "corellia", 6092, 50, -5578, 0, "-- Kor Vella Shrine" },

        -- Dantooine Shrines
        { "dantooine", -1814, 50, -6202, 0, "-- Dantooine Shrine" },
        { "dantooine", -6999, 50, -5269, 0, "-- Dantooine Pirate Outpost Shrine" },
        { "dantooine", 2638, 50, -1541, 0, "-- Dantooine Imperial Outpost Shrine" },
        { "dantooine", -6173, 50, 4120, 0, "-- Dantooine Pirate Outpost Shrine" },
        { "dantooine", 2163, 50, 7548, 0, "-- Dantooine Mining Outpost Shrine" },

        -- Dathomir Shrines
        { "dathomir", 3087, 50, 4887, 0, "-- Dathomir Shrine" },
        { "dathomir", 1654, 50, -5765, 0, "-- Dathomir Trade Outpost Shrine" },
        { "dathomir", -4961, 50, -3493, 0, "-- Dathomir Science Outpost Shrine" },
        { "dathomir", -4148, 50, 5926, 0, "-- Dathomir Science Outpost Shrine" },
        { "dathomir", 5570, 50, -1514, 0, "-- Dathomir Trade Outpost Shrine" },

        -- Endor Shrines
        { "endor", 670, 50, 5548, 0, "-- Endor Shrine" },
        { "endor", -5055, 50, -1703, 0, "-- Endor Smuggler Outpost Shrine" },
        { "endor", -5627, 50, 4813, 0, "-- Endor Smuggler Outpost Shrine" },
        { "endor", 5116, 50, 1923, 0, "-- Endor Smuggler Outpost Shrine" },
        { "endor", -3870, 50, -4467, 0, "-- Endor Research Outpost Shrine" },

        -- Lok Shrines
        { "lok", -2132, 50, 5938, 0, "-- Lok Shrine" },
        { "lok", 5455, 50, 3805, 0, "-- Nym's Stronghold Shrine" },
        { "lok", -5806, 50, 1977, 0, "-- Nym's Stronghold Shrine" },
        { "lok", 4978, 50, -5674, 0, "-- Nym's Stronghold Shrine" },
        { "lok", -3641, 18, -6030, 0, "-- Nym's Stronghold Shrine" },

        -- Naboo Shrines
        { "naboo", 2377, 50, -473, 0, "-- Naboo Shrine" },
        { "naboo", 7182, 50, -234, 0, "-- Dee'ja Peak Shrine" },
        { "naboo", -6859, 50, -1937, 0, "-- Moenia Shrine" },
        { "naboo", -2582, 50, -6184, 0, "-- Theed Shrine" },

        -- Rori Shrines
        { "rori", -4496, 50, -7531, 0, "-- Rori Shrine" },
        { "rori", 307, 50, -978, 0, "-- Narmle Shrine" },
        { "rori", 6854, 50, -1221, 0, "-- Narmle Shrine" },
        { "rori", -926, 50, 6046, 0, "-- Rori Rebel Outpost Shrine" },
        { "rori", -6375, 50, 6403, 0, "-- Restuss Shrine" },

        -- Talus Shrines
        { "talus", -5785, 50, 4478, 0, "-- Talus Shrine" },
        { "talus", 318, 50, 5842, 0, "-- Talus Imperial Outpost Shrine" },
        { "talus", -5494, 50, -3241, 0, "-- Nashal Shrine" },
        { "talus", 5760, 50, -5208, 0, "-- Dearic Shrine" },

        -- Tatooine Shrines
        { "tatooine", 5958, 50, -5685, 0, "-- Tatooine Shrine" },
        { "tatooine", -3622, 50, 5280, 0, "-- Mos Eisley Shrine" },
        { "tatooine", 5264, 50, 113, 0, "-- Mos Espa Shrine" },
        { "tatooine", -6505, 50, -3667, 0, "-- Mos Entha Shrine" },
        { "tatooine", 5632, 50, 6015, 0, "-- Bestine Shrine" },

        -- Yavin IV Shrines
        { "yavin4", 2389, 50, -4934, 0, "-- Yavin IV Shrine" },
        { "yavin4", -4585, 50, -3761, 0, "-- Yavin Imperial Base Shrine" },
        { "yavin4", -3362, 50, 6914, 0, "-- Yavin Labor Outpost Shrine" },
        { "yavin4", 6455, 50, 6423, 0, "-- Yavin Mining Outpost Shrine" },
    }

    -- Loop through the table and spawn each terminal.
    for i, spawnData in ipairs(terminalSpawns) do
        local planet = spawnData[1]
        local x = spawnData[2]
        local y = spawnData[3] -- This is the Z-coordinate (height) in game terms
        local z = spawnData[4] -- This is the Y-coordinate in game terms
        local heading = spawnData[5]
        
        -- Use spawnSceneObject for static objects like terminals.
        spawnSceneObject(planet, terminalTemplate, x, y, z, 0, heading)
    end
end

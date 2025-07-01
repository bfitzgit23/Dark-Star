--
-- This script spawns shuttle ports at specified locations across various planets.
--

shuttle_spawner = ScreenPlay:new {
    numberOfActs = 1,
    questString = "shuttle_spawner",
    states = {},
}

registerScreenPlay("shuttle_spawner", true)

function shuttle_spawner:start()
    -- This table defines all the shuttles to be spawned.
    -- To add a new shuttle, simply add a new line to this table with the correct information.
    -- IMPORTANT: You must find the correct .iff file for the shuttle you want to use.
    -- The path below is a common example, but may not be correct for your server files.
    local shuttleTemplate = "object/building/player/city/shuttleport_corellia.iff" -- Example shuttle template

    local shuttleSpawns = {
        -- Tatooine Spawns
        --{ "tatooine", 3450, 5, -4757, 90, "-- Mos Eisley Starport" },
        --{ "tatooine", -1182, 12, -3568, -175, "-- Bestine Starport" },

        -- Naboo Spawns
        { "naboo", -4514, 9, 3650, 0, "-- Theed Starport" },
        --{ "naboo", 5288, 6, 6789, 45, "-- Kaadara Starport" },

        -- Corellia Spawns
        --{ "corellia", -250, 28, -4700, -90, "-- Coronet City Starport" },
        --{ "corellia", -5145, 21, -2450, 180, "-- Tyrena Starport" },
    }

    -- Loop through the table and spawn each shuttle.
    for i, spawnData in ipairs(shuttleSpawns) do
        local planet = spawnData[1]
        local x = spawnData[2]
        local y = spawnData[3]
        local z = spawnData[4]
        local heading = spawnData[5]
        
        -- Use spawnSceneObject for static objects like shuttles.
        spawnSceneObject(planet, shuttleTemplate, x, y, z, 0, heading)
    end
end

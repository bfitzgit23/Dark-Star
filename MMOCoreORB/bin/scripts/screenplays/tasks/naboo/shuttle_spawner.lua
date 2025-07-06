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

		-- Dathomir Spawns
		{ "dathomir", 5221, 78, -4074, 0, "-- The Village" },
		{ "dantooine", 6976, 0, -4112, 0, "-- Janta Cave" },
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

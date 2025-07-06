--
-- This script spawns space terminals at specified locations,
-- intended to be near shuttle ports.
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
    -- The coordinates are based on the shuttle locations, with an
    -- offset to the Z-coordinate to place them nearby.
    local terminalSpawns = {
	
        -- Dathomir Spawns
		{ "dathomir", 5210, 78.5, -4056, 0, "-- The Village" },
		{ "dantooine", 6910, 25, -4086, 0, "-- Janta Cave" },
    }

    -- Loop through the table and spawn each terminal.
    for i, spawnData in ipairs(terminalSpawns) do
        local planet = spawnData[1]
        local x = spawnData[2]
        local y = spawnData[3]
        local z = spawnData[4]
        local heading = spawnData[5]
        
        -- Use spawnSceneObject for static objects like terminals.
        spawnSceneObject(planet, terminalTemplate, x, y, z, 0, heading)
    end
end

-- scripts/screenplays/kashyyyk/kashyyyk_basic_spawns.lua
-- Minimal spawn screenplay for SWGEmu Core3 Pre-CU.
-- Spawns a few NPCs at safe coords so the world isn't empty.
-- Uses very common templates to avoid missing-template crashes.
-- Adjust MOB_TEMPLATES below as needed for your server.

KashyyykBasicSpawns = ScreenPlay:new {
    numberOfActs = 1,
    screenplayName = "KashyyykBasicSpawns"
}

registerScreenPlay("KashyyykBasicSpawns", true)

-- Common, widely present templates; change these if your core differs.
local MOB_TEMPLATES = {
    wookiee  = "commoner",       -- swap to "wookiee_male" if present in your core
    trando   = "mercenary",      -- swap to "trandoshan_slayer" or similar if present
    imperial = "stormtrooper",   -- classic stormtrooper template usually exists
    rebel    = "rebel_scout"     -- or "rebel_trooper"
}

-- Safe spawn wrapper: checks for spawnMobile and prints errors instead of crashing.
local function trySpawn(planet, tpl, respawn, x, z, y, dir, cell)
    if spawnMobile == nil then
        print("[KASHYYYK] spawnMobile not available in this environment.")
        return nil
    end
    local ok, obj = pcall(spawnMobile, planet, tpl, respawn, x, z, y, dir or 0, cell or 0)
    if not ok then
        print(string.format("[KASHYYYK] spawn failed for template '%s' at (%d,%d,%d): %s", tostring(tpl), x, y, z, tostring(obj)))
        return nil
    end
    return obj
end

-- Coordinates chosen to match your travel/readme examples.
-- If your planet scene is "kashyyyk" instead of "kashyyyk_main", change PLANET below.
local PLANET = "kashyyyk_main"

function KashyyykBasicSpawns:start()
    print("[KASHYYYK] KashyyykBasicSpawns starting...")

    -- Kachirho Spaceport area (0,0,0)
    trySpawn(PLANET, MOB_TEMPLATES.wookiee, 120,    5, 0,   5,   0)
    trySpawn(PLANET, MOB_TEMPLATES.imperial, 90,   -8, 0,  -4, 180)
    trySpawn(PLANET, MOB_TEMPLATES.rebel,    90,   10, 0, -10,  90)

    -- Hunting Grounds (100,0,100)
    trySpawn(PLANET, MOB_TEMPLATES.trando,   60,  100, 0, 100,  45)
    trySpawn(PLANET, MOB_TEMPLATES.trando,   60,  104, 0,  96,  60)
    trySpawn(PLANET, MOB_TEMPLATES.trando,   60,   96, 0, 104, 300)

    -- Dead Forest (-200,0,75)
    trySpawn(PLANET, MOB_TEMPLATES.wookiee,  120, -200, 0,  75,  0)
    trySpawn(PLANET, MOB_TEMPLATES.imperial, 120, -195, 0,  70, 45)

    print("[KASHYYYK] KashyyykBasicSpawns initialized.")
end
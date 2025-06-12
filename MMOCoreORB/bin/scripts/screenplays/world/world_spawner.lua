world_spawner = ScreenPlay:new {
    -- This screenplay has no acts, it just runs its startup logic.
    numberOfActs = 0,
}

registerScreenPlay("world_spawner", true)

-- The :start() function is called automatically when this screenplay is loaded by the server.
function world_spawner:start()
    -- We will call a separate function to keep the code clean.
    self:spawnDarkStarVendors()
end

-- This is our "Smart Spawner" function.
function world_spawner:spawnDarkStarVendors()
    -- Define a unique key to track if we've spawned this vendor before.
    local vendorSpawnKey = "darkStarCoronetVendorSpawned"

    -- Check the database to see if we've already run this logic.
    if (readStringData(vendorSpawnKey) ~= "true") then
        -- If the key doesn't exist, we need to spawn the vendor.
        print("--- [World Spawner]: Dark Star Vendor record not found. Spawning now...")

        -- Spawn the vendor at its location in Coronet.
        local pVendor = spawnMobile("corellia", "merchant", 1, -157, 28.0, -4724, 35, 0)

        if (pVendor ~= nil) then
            -- Set a custom name to easily identify it in-game.
            pVendor:setCustomObjectName("Dark Star Merchant")

            -- CRUCIAL STEP: Save to the database that we are done.
            writeStringData(vendorSpawnKey, "true")
            print("--- [World Spawner]: Dark Star Vendor spawned successfully and record saved.")
        else
            print("--- [World Spawner]: ERROR - Failed to spawn the Dark Star Vendor.")
        end
    else
        -- If the key already exists, we do nothing.
        print("--- [World Spawner]: Dark Star Vendor already exists. Skipping spawn.")
    end
end

return world_spawner
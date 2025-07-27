-- File: MMOCoreORB\bin\scripts\screenplays\custom\bastilla.lua

bastilla_convo_handler = conv_handler:new {}

-- Define the ScreenPlay for the vendor
bastilla = ScreenPlay:new {
    numberOfActs = 1,
    questString = "bastilla_task",
    states = {},
}

registerScreenPlay("bastilla", true)

function bastilla:start()
    -- A list of all locations where the vendor should spawn.
    local spawnLocations = {
        -- Corellia
        { "corellia", -3271, 86, 3114, 35 },      	-- cnet
        
    }

    for i, location in ipairs(spawnLocations) do
        spawnMobile(location[1], "bastilla", 1, location[2], location[3], location[4], location[5], 0)
    end
end

function bastilla_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
    local convoTemplate = LuaConversationTemplate(pConvTemplate)
    return convoTemplate:getScreen("first_screen")
end

function bastilla_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
    local screen = LuaConversationScreen(pConvScreen)
    local screenID = screen:getScreenID()
    local clonedConversation = LuaConversationScreen(screen:cloneScreen())

    if (screenID == "first_screen") then
        if (selectedOption == 0) then -- Assuming "yes" is the first (0th) option
            -- Spawn Revan when "yes" is chosen
            local x = CreatureObject(pPlayer):getPositionX()
            local z = CreatureObject(pPlayer):getPositionZ()
            local y = CreatureObject(pPlayer):getPositionY()
            local planetName = SceneObject(pPlayer):getZoneName()

            -- Spawn Revan near the player
            spawnMobile(planetName, "revan", 1, x + 10, z, y + 10, 0, 0) -- Use the "revan" creature template

            CreatureObject(pPlayer):sendSystemMessage("You feel a powerful presence nearby...")

            return clonedConversation:getScreen("revan_spawn_screen")
        end
    end

    return clonedConversation:getScreen(screen:getOptionLink(selectedOption))
end
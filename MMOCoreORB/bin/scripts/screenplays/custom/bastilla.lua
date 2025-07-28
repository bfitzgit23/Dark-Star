-- File: MMOCoreORB\bin\scripts\screenplays\custom\bastilla.lua

-- Define the ScreenPlay for the vendor
dark_star_vendor = ScreenPlay:new {
    numberOfActs = 1,
    questString = "bastilla_task",
    states = {},
}

registerScreenPlay("bastilla", true)

-- This function runs when the script starts, spawning all the vendor NPCs
function bastilla:start()
    -- A list of all locations where the vendor should spawn.
    local spawnLocations = {
        -- Corellia
        { "corellia", -3271, 86, 3114, 35 },      	-- cnet
    }

    for i, location in ipairs(spawnLocations) do
        spawnMobile(location[1], "bastilla_npc", 1, location[2], location[3], location[4], location[5], 0)
    end
end

-- 2. Bastila's Conversation Handler (This part is correctly structured)
bastilla_convo_handler = Object:new {
    tstring = "myconversation"
}

function bastilla_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	return convoTemplate:getScreen("first_screen") -- "first_screen" must be defined in bastilla_conv.lua
end

function bastilla_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local clonedConversation = LuaConversationScreen(screen:cloneScreen())

	if (screenID == "first_screen") then
		if (selectedOption == 0) then -- Assuming "yes" is the first (0th) option
			local x = CreatureObject(pPlayer):getPositionX()
			local z = CreatureObject(pPlayer):getPositionZ()
			local y = CreatureObject(pPlayer):getPositionY()
			local planetName = SceneObject(pPlayer):getZoneName()

			-- Spawn Revan nearby the player
			-- "revan" must be a globally loaded creature template
			spawnMobile(planetName, "revan", 1, x + 10, z, y + 10, 0, 0)
			CreatureObject(pPlayer):sendSystemMessage("You feel a powerful presence nearby...")

			return clonedConversation:getScreen("revan_spawn_screen") -- "revan_spawn_screen" must be in bastilla_conv.lua
		end
	end

	return clonedConversation:getScreen(screen:getOptionLink(selectedOption))
end
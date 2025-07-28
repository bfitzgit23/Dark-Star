-- File: MMOCoreORB\bin\scripts\conversations\custom\bastilla_convo_handler.lua

bastilla_vendor = ScreenPlay:new {
	numberOfActs = 1,
	questString = "bastilla_vendor_task",
	states = {},
}

registerScreenPlay("bastilla_vendor", true)

-- function bastilla_vendor:start()
    -- local spawnLocations = {
        -- { "corellia", 1000, 35, 2000, 35 },  -- Example spawn location
        -- { "naboo", 2000, 35, 3000, 35 },
        -- { "tatooine", 1500, 35, 2500, 35 },
    -- }

    -- for i, location in ipairs(spawnLocations) do
        -- spawnMobile(location[1], "bastilla_vendor", 1, location[2], location[3], location[4], location[5], 0)
    -- end
-- end

function bastilla_vendor:start()     
    -- Spawn our character into the world, setting pLarry a pointer variable we can use to check or change his state. 
    local pWeaponsmith = spawnMobile("corellia", "bastilla_vendor", 1, -157, 28.0, -4724, 35, 0 )--cnet
end

bastilla_convo_handler = conv_handler:new {}

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
			local x = CreatureObject(pPlayer):getPositionX()
			local z = CreatureObject(pPlayer):getPositionZ()
			local y = CreatureObject(pPlayer):getPositionY()
			local planetName = SceneObject(pPlayer):getZoneName()

			-- Spawn Revan nearby the player
			spawnMobile(planetName, "revan", 1, x + 10, z, y + 10, 0, 0) -- "revan" is the creature template name
			CreatureObject(pPlayer):sendSystemMessage("You feel a powerful presence nearby...")

			return clonedConversation:getScreen("revan_spawn_screen")
		end
	end

	return clonedConversation:getScreen(screen:getOptionLink(selectedOption))
end


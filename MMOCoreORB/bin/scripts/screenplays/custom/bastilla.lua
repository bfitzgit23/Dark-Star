-- File: MMOCoreORB\bin\scripts\screenplays\custom\bastilla.lua

-- 1. Bastila ScreenPlay Definition
-- Define the screenplay object using a local variable (e.g., bastila_screenplay_obj)
local bastila_screenplay_obj = ScreenPlay:new {
	numberOfActs = 1,
	questString = "bastilla_npc_task",
	states = {},
}

-- Define methods on the local screenplay object BEFORE it's registered globally
function bastila_screenplay_obj:start()
    local spawnLocations = {
        { "corellia", 1000, 35, 2000, 35 },  -- Example spawn location
        { "naboo", 2000, 35, 3000, 35 },
        { "tatooine", 1500, 35, 2500, 35 },
    }

    for i, location in ipairs(spawnLocations) do
        -- Spawn the NPC using the CREATURE TEMPLATE named "bastilla_npc"
        -- This "bastilla_npc" creature template must be defined in bastilla_npc.lua
        spawnMobile(location[1], "bastilla_npc", 1, location[2], location[3], location[4], location[5], 0)
    end
end

-- Register the local screenplay object globally *after* its methods are defined.
-- This makes the global 'bastilla_npc_quest' variable refer to 'bastila_screenplay_obj'.
registerScreenPlay("bastilla_npc_quest", true)


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
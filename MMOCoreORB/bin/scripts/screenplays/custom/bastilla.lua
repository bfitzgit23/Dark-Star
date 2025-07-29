-- File: MMOCoreORB\bin\scripts\screenplays\custom\bastilla.lua

-- 1. Bastila ScreenPlay Definition
local bastila_screenplay_obj = ScreenPlay:new {
	numberOfActs = 1,
	questString = "bastilla_spawn_screenplay_task",
	states = {},
}
registerScreenPlay("bastila_screenplay", true) -- Registers the screenplay globally as "bastila_screenplay"

function bastila_screenplay_obj:start()
    local spawnLocations = {
        { "corellia", -3271, 86, 3114, 35 }, -- Corellia coordinates
    }

    for i, location in ipairs(spawnLocations) do
        -- Spawn Bastila using the "bastilla_npc" creature template name.
        -- The conversation template for this spawn is linked in bastila_npc.lua (bastilla_conv).
        spawnMobile(location[1], "bastilla_npc", 1, location[2], location[3], location[4], location[5], 0)
    end
end


-- 2. Bastila's Conversation Handler (Corrected to use getNextConversationScreen exclusively)
bastilla_convo_handler = Object:new {
    tstring = "myconversation2" -- Unique tstring
}

-- This is the single conversation handling function for bastilla_convo_handler
function bastilla_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
    local creature = LuaCreatureObject(conversingPlayer)
    local convosession = creature:getConversationSession()
    local conversation = LuaConversationTemplate(conversationTemplate)

    -- If conversationTemplate is nil, return nil (safety check)
    if (conversation == nil) then
        return nil
    end

    local lastConversationScreen = nil
    if (convosession ~= nil) then
        local session = LuaConversationSession(convosession)
        if (session ~= nil) then
            lastConversationScreen = session:getLastConversationScreen()
        end
    end

    local nextConversationScreen = nil -- Initialize next screen

    -- If this is the initial interaction (no last screen)
    if (lastConversationScreen == nil) then
        return conversation:getInitialScreen()
	end
	-- If it's a subsequent interaction, get the option link
	local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
	local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)

    -- Handle the "yes" option from the "first_screen"
    if (optionLink == "revan_spawn_screen") then -- This is the option that spawns Revan
        local x = CreatureObject(conversingPlayer):getPositionX()
        local z = CreatureObject(conversingPlayer):getPositionZ()
        local y = CreatureObject(conversingPlayer):getPositionY()
        local planetName = SceneObject(conversingPlayer):getZoneName()

        spawnMobile(planetName, "revan", 1, x + 10, z, y + 10, 0, 0)
        CreatureObject(conversingPlayer):sendSystemMessage("You feel a powerful presence nearby...")

        nextConversationScreen = conversation:getScreen("revan_spawn_screen") -- Transition to the Revan spawn confirmation screen
    else
    -- For any other option, just navigate to the linked screen
    nextConversationScreen = conversation:getScreen(optionLink)
    end

    return nextConversationScreen
end

function bastilla_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
    return conversationScreen
end
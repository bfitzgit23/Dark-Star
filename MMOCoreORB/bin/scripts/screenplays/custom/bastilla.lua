-- File: MMOCoreORB\bin\scripts\screenplays\custom\bastilla.lua

-- 1. Bastila ScreenPlay Definition
bastilla = ScreenPlay:new {
    numberOfActs = 1,
    questString = "bastilla_task",
    states = {},
}

registerScreenPlay("bastilla", true) -- Registers the screenplay globally as "bastila_screenplay"

function bastilla:start()
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

function bastilla_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
    local creature = LuaCreatureObject(conversingPlayer)
    local convosession = creature:getConversationSession()
    local conversation = LuaConversationTemplate(conversationTemplate)

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

    if (lastConversationScreen == nil) then
        return conversation:getInitialScreen()
    end

    local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
    local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)
	
	if (optionLink == "revan_spawn_screen") then -- This is the option that spawns Revan
        local x = CreatureObject(conversingPlayer):getPositionX()
        local z = CreatureObject(conversingPlayer):getPositionZ()
        local y = CreatureObject(conversingPlayer):getPositionY()
        local planetName = SceneObject(conversingPlayer):getZoneName()

        local pRevan = spawnMobile(planetName, "revan", 1, x + 10, z, y + 10, 0, 0)
            CreatureObject(conversingPlayer):sendSystemMessage("You feel a powerful presence nearby...")
		
		-- NEW: Add item to Revan's inventory if spawn was successful
            if (pRevan ~= nil) then
                local pRevanInventory = CreatureObject(pRevan):getSlottedObject("inventory")
                if (pRevanInventory ~= nil) then
                    giveItem(pRevanInventory, "object/weapon/melee/baton/baton_stun.iff", -1) -- Replace with your item's IFF path
                    -- You can also send a system message to yourself (the admin) for debugging
                    CreatureObject(conversingPlayer):sendSystemMessage("Revan spawned and received item: Revan's Lightsaber.");
                else
                    CreatureObject(conversingPlayer):sendSystemMessage("Error: Revan's inventory not found.");
                end
            else
                CreatureObject(conversingPlayer):sendSystemMessage("Error: Revan failed to spawn.");
            end

        nextConversationScreen = conversation:getScreen("revan_spawn_screen") -- Transition to the Revan spawn confirmation screen
    else
        -- For any other option, just navigate to the linked screen
        nextConversationScreen = conversation:getScreen(optionLink)
    end
	
end

function bastilla_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
    return conversationScreen
end
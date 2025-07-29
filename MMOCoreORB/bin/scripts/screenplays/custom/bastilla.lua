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
        -- This template must be loaded by CreatureTemplates:addCreatureTemplate BEFORE this script is loaded.
        -- The conversation template for this spawn is linked in bastila_npc.lua (bastilla_conv).
        spawnMobile(location[1], "bastilla_npc", 1, location[2], location[3], location[4], location[5], 0)
    end
end


-- 2. Bastila's Conversation Handler (ALIGNED STRUCTURE)
bastilla_convo_handler = Object:new {
    tstring = "myconversation2" -- Unique tstring if needed, though not directly used in conversation flow
}

-- ALIGNED: Uses getNextConversationScreen similar to dark_star_vendor_convo_handler
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

    -- ALIGNED: Initial screen logic
    if (lastConversationScreen == nil) then
        return conversation:getInitialScreen() -- Should be "first_screen" from bastilla_conv
    end

    local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
    local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)
    -- local itemToPurchase = itemsForSale[optionLink] -- NOT APPLICABLE FOR BASTILA, so removed

    -- ALIGNED: Conditional logic based on optionLink/screenID
    -- We assume the 'yes' option will be the one that leads to 'revan_spawn_screen'
    -- The optionLink will be "revan_spawn_screen" for the "yes" option.
    if (optionLink == "revan_spawn_screen") then -- Checks the actual link
        local x = CreatureObject(conversingPlayer):getPositionX()
        local z = CreatureObject(conversingPlayer):getPositionZ()
        local y = CreatureObject(conversingPlayer):getPositionY()
        local planetName = SceneObject(conversingPlayer):getZoneName()

        spawnMobile(planetName, "revan", 1, x + 10, z, y + 10, 0, 0)
        CreatureObject(conversingPlayer):sendSystemMessage("You feel a powerful presence nearby...")

        -- Return the screen defined in bastilla_conv.lua for Revan spawn confirmation
        return conversation:getScreen("revan_spawn_screen")
    end

    -- ALIGNED: Default navigation to the next screen based on the optionLink
    -- This handles cases where the optionLink might lead to other screens (e.g., if you add "no" later)
    return conversation:getScreen(optionLink)
end

-- ALIGNED: Removed runScreenHandlers as getNextConversationScreen takes its place
-- function bastilla_convo_handler:runScreenHandlers(...)
--     -- This function is no longer needed with getNextConversationScreen
-- end
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

function dark_star_vendor_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
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
end
dark_star_vendor = ScreenPlay:new {                
    numberOfActs = 1,                
    questString = "dark_star_vendor_task",                   
    states = {}, 
}
registerScreenPlay("dark_star_vendor", true)
function dark_star_vendor:start()     
    -- Spawn Custom Vendor in the world	
    local pWeaponsmith = spawnMobile("corellia", "dark_star_vendor", 1, -157, 28.0, -4724, 35, 0 )--cnet
    local pWeaponsmith1 = spawnMobile("corellia", "dark_star_vendor", 1, -5042, 21.0, -2297, 35, 0 )--tyrena
    local pWeaponsmith2 = spawnMobile("corellia", "dark_star_vendor", 1, -3138, 31.0, 2796, 35, 0 )--korvella   
    local pWeaponsmith2 = spawnMobile("corellia", "dark_star_vendor", 1, 3333, 308.0, 5524, 35, 0 )--doaba   
    local pWeaponsmith2 = spawnMobile("corellia", "dark_star_vendor", 1, -5550, 15.58, -6061, 35, 0 )--venri  
	local pWeaponsmith2 = spawnMobile("corellia", "dark_star_vendor", 1, 6643.02,330.00,-5920.87, 35, 0 )--belav  

    local pWeaponsmith3 = spawnMobile("naboo", "dark_star_vendor", 1, -4872, 6.0, 4151, 35, 0 )--theed
    local pWeaponsmith4 = spawnMobile("naboo", "dark_star_vendor", 1, 4807, 4.0, -4705, 35, 0 )--moena
    local pWeaponsmith5 = spawnMobile("naboo", "dark_star_vendor", 1, 5200, -192.0, 6677, 35, 0 )--kaadara
    local pWeaponsmith5 = spawnMobile("naboo", "dark_star_vendor", 1, 1444, 14.0, 2777, 35, 0 )--keren
    local pWeaponsmith5 = spawnMobile("naboo", "dark_star_vendor", 1, 5331.16,326.95,-1576.12, 35, 0 )--deja
    local pWeaponsmith5 = spawnMobile("naboo", "dark_star_vendor", 1, -5495.62,-150.00,-24.69, 35, 0 )--lake ret
    
    local pWeaponsmith3 = spawnMobile("tatooine", "dark_star_vendor", 1, 3522, 5.0, -4803, 35, 0 )--eisley
    local pWeaponsmith4 = spawnMobile("tatooine", "dark_star_vendor", 1, -1281, 12.0, -3590, 35, 0 )--bestine
    local pWeaponsmith5 = spawnMobile("tatooine", "dark_star_vendor", 1, -2914, 5.0, 2129, 35, 0 )--espa
    local pWeaponsmith5 = spawnMobile("tatooine", "dark_star_vendor", 1, 1293, 7.0, 3140, 35, 0 )--entha
    local pWeaponsmith5 = spawnMobile("tatooine", "dark_star_vendor", 1, 48.33,52.00,-5340.53, 35, 0 )--anc 
        
    local pWeaponsmith4 = spawnMobile("talus", "dark_star_vendor", 1, -2193, 20.0, 2313, 35, 0 )--talus imp
    local pWeaponsmith4 = spawnMobile("talus", "dark_star_vendor", 1, 4447, 2.0, 5271, 35, 0 )--nashal
    local pWeaponsmith4 = spawnMobile("talus", "dark_star_vendor", 1, 338, 6.0, -2931, 35, 0 )--dearic
    
    local pWeaponsmith4 = spawnMobile("rori", "dark_star_vendor", 1, 5365, 80.0, 5657, 35, 0 )--restuss
    local pWeaponsmith4 = spawnMobile("rori", "dark_star_vendor", 1, -5305, 80.0, -2228, 35, 0 )--narmle             
    local pWeaponsmith4 = spawnMobile("rori", "dark_star_vendor", 1, 3683, 96.0, -6436, 35, 0 )--reb
    
    local pWeaponsmith4 = spawnMobile("endor", "dark_star_vendor", 1, -948, 73.0, 1550, 35, 0 )--smugglers
    local pWeaponsmith4 = spawnMobile("endor", "dark_star_vendor", 1, 3201, 24.0, -3501, 35, 0 )--research
    
    local pWeaponsmith4 = spawnMobile("dantooine", "dark_star_vendor", 1, -632, 3.0, 2501, 35, 0 )--mining
    local pWeaponsmith4 = spawnMobile("dantooine", "dark_star_vendor", 1, -4209, 3.0, -2349, 35, 0 )--imp
    local pWeaponsmith4 = spawnMobile("dantooine", "dark_star_vendor", 1, 1564, 4.0, -6415, 35, 0 )--aggro
    
    local pWeaponsmith4 = spawnMobile("dathomir", "dark_star_vendor", 1, 619, 3.0, 3090, 35, 0 )--trade
    local pWeaponsmith4 = spawnMobile("dathomir", "dark_star_vendor", 1, -47, 18.0, -1586, 35, 0 )--science
     
    local pWeaponsmith4 = spawnMobile("yavin4", "dark_star_vendor", 1, -265, 35.0, 4897, 35, 0 )--mining
    local pWeaponsmith4 = spawnMobile("yavin4", "dark_star_vendor", 1, 4053, 17.0, -6217, 35, 0 )--imp
    local pWeaponsmith4 = spawnMobile("yavin4", "dark_star_vendor", 1, -6922, 73.0, -5730, 35, 0 )--labor
    
    local pWeaponsmith4 = spawnMobile("lok", "dark_star_vendor", 1, 479, 8.0, 5512, 35, 0 )--lok
                        
end

dark_star_vendor_convo_handler = Object:new {
    tstring = "myconversation" 
}
function dark_star_vendor_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)            
        -- Assign the player to variable creature for use inside this function.
        local creature = LuaCreatureObject(conversingPlayer)
        -- Get the last conversation to determine whether or not we’re on the first screen      
        local convosession = creature:getConversationSession()  
        lastConversation = nil      
        local conversation = LuaConversationTemplate(conversationTemplate)  
        local nextConversationScreen     
        -- If there is a conversation open, do stuff with it        
        if ( conversation ~= nil ) then  -- check to see if we have a next screen   
            if ( convosession ~= nil ) then             
                local session = LuaConversationSession(convosession)
                if ( session ~= nil ) then                  
                    lastConversationScreen = session:getLastConversationScreen()   
                end         
            end         
            -- Last conversation was nil, so get the first screen
            if ( lastConversationScreen == nil ) then          
                nextConversationScreen = conversation:getInitialScreen()
            else
                -- Start playing the rest of the conversation based on user input               
                local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen) 
                -- Set variable to track what option the player picked and get the option picked                
                local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)
                nextConversationScreen = conversation:getScreen(optionLink)
                -- Get some information about the player.
                local credits = creature:getCashCredits()
				local bankcredits = creature:getBankCredits()
                local pInventory = creature:getSlottedObject("inventory")
                local inventory = LuaSceneObject(pInventory)
                -- Take action when the player makes a purchase.
                --if (inventory:hasFullContainerObjects() == true) then -- removed, does not work
                if (SceneObject(pInventory):isContainerFullRecursive()) then
                    -- Bail if the player doesn’t have enough space in their inventory.
                    -- Plays a chat box message from the NPC as well as a system message.
                    nextConversationScreen = conversation:getScreen("insufficient_space")
                    creature:sendSystemMessage("You do not have enough inventory space")
                 end   

--WEAPONS
				if (optionLink == "weaps1") then
					if (optionLink == "option1" and credits < 25000) then
						-- Bail if the player doesn’t have enough cash on hand.  
						-- Plays a chat box message from the NPC as well as a system message.
						nextConversationScreen = conversation:getScreen("insufficient_funds")
						creature:sendSystemMessage("You have insufficient funds") 
					elseif (optionLink == "option1" and credits >= 25000) then
						-- Take 10,000 credits from the player’s cash on hand and give player a speederbike.
						creature:subtractCashCredits(25000)
						local pItem = 
										--CreatureObject(conversingPlayer):enhanceCharacter()
						giveItem(pInventory, "object/weapon/ranged/carbine/carbine_dxr6.iff", -1)
						end
					end
          end
		  end
        -- end of the conversation logic.
        return nextConversationScreen
		end
    function dark_star_vendor_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
    -- Plays the screens of the conversation.
    return conversationScreen
end
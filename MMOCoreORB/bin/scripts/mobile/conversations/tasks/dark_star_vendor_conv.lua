dark_star_vendor_conv = ConvoTemplate:new {
    initialScreen = "first_screen",
    templateType = "Lua",
    luaClassHandler = "dark_star_vendor_convo_handler",
    screens = {}
}
dark_star_vendor_first_screen = ConvoScreen:new {
    id = "first_screen",
    leftDialog = "",
    customDialogText = "What can I help you with?",
    stopConversation = "false",
    options = { 
        {"Buffs", "buffs"},
        {"Weapons", "weapons"},
        {"Armor", "armor"},
		{"Deeds", "deeds"},
        {"Loot", "loot"},
        {"Artisan", "art1"},
        {"Architect", "arch1"},
        {"Chef", "chef1"},        
        {"Medic", "doc1"},
		{"Jedi Items", "jedi"},
        --{"Droids", "droid1"},
        --{"Tailor", "tailor1"},               
    }
}
dark_star_vendor_conv:addScreen(dark_star_vendor_first_screen);

buffs = ConvoScreen:new {
    id = "buffs",
    leftDialog = "",
    customDialogText = "I sell buffs!",
    stopConversation = "false",
    options = { 

        {"2k Medical & Ent buffs 3hr - 15k", "buffs"},
      	{"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(buffs);

weapons = ConvoScreen:new {    
    id = "weapons",
    leftDialog = "",
    customDialogText = "Selling various weapons.",
    stopConversation = "false",
    options = { 
		{"CDEF Pistol - 5k", "weapon01"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(weapons);

armor = ConvoScreen:new {    
    id = "armor",
    leftDialog = "",
    customDialogText = "Selling Composite Armor",
    stopConversation = "false",
    options = { 
        {"Composite Helm - 5k", "armor01"},
		{"Composite Chest - 5k", "armor02"},
		{"Composite Leggings - 5k", "armor03"},
		{"Composite Boots - 5k", "armor04"},
		{"Composite Right Bicep - 5k", "armor05"},
		{"Composite Left Bicep - 5k", "armor06"},
		{"Composite Right Bracer - 5k", "armor07"},
		{"Composite Left Bracer - 5k", "armor08"},
		{"Composite Gloves - 5k", "armor09"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(armor);

deeds = ConvoScreen:new {
    id = "deeds",
    leftDialog = "",
    customDialogText = "Would you like to buy some Deeds?",
    stopConversation = "false",
    options = { 
        {"10k stack Resource Deed - 200k", "deeds01"},
        {"Speeder Bike - 15k", "deeds02"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(deeds);

loot = ConvoScreen:new {
    id = "loot",
    leftDialog = "",
    customDialogText = "Would you like to buy some loot drops?",
    stopConversation = "false",
    options = { 
       	{"Jedi Holocron - 10mil", "loot01"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(loot);

-- art1 = ConvoScreen:new {
    -- id = "art1",
    -- leftDialog = "",
    -- customDialogText = "I sell artisan stuff! Need anything?",
    -- stopConversation = "false",
    -- options = {
        -- {"Mineral survey tool - 500", "option24"},
        -- {"Chemical survey tool - 500", "option25"},
        -- {"Generic Crafting Tool - 1k", "option26"},
        -- {"Backpack - 5k", "option27"},
        -- {"Weapon Repair Tool - 10k", "option66"},
        -- {"Armor Repair Tool - 10k", "option67"},
        -- {"Weapon Upgrade Kit - 10k", "option68"},
        -- {"Armor Upgrade Kit - 10k", "option69"},  
        -- {"Speederbike (regular, not swoop) - 15k", "option28"},     
        
        -- {"Medium Mineral Harvester Deed - 50k", "option29"},
        -- {"Medium Flora Harvester Deed - 50k", "option30"},
        -- {"Medium Gas Harvester Deed - 50k", "option31"},
        -- {"Medium Chemical Harvester Deed - 50k", "option32"},
        -- {"Medium Moisture Harvester Deed - 50k", "option33"},
        -- {"Main menu.", "first_screen"},
    -- }
-- }
-- dark_star_vendor_conv:addScreen(art1);

-- arch1 = ConvoScreen:new {
    -- id = "arch1",
    -- leftDialog = "",
    -- customDialogText = "I sell structures! See anything you like?",
    -- stopConversation = "false",
    -- options = { 
        -- {"25 effectiveness Weapon/Item Crafting Station - 50k", "option74"},
        -- {"25 effectiveness Structure Crafting Station - 50k", "option75"},
      	-- {"25 effectiveness Clothing Crafting Station - 50k", "option72"},
        -- {"25 effectiveness Food Crafting Station - 50k", "option73"},
      	-- {"Small Generic House - 100k", "option34"},
        -- {"Medium Generic House - 100k", "option35"},
        -- {"Clothing Factory Deed - 100k", "option36"},
        -- {"Food Factory Deed - 100k", "option37"},
        -- {"item Factory Deed - 100k", "option38"},
        -- {"Structure Factory Deed - 100k", "option39"},
        -- {"Main menu.", "first_screen"},
    -- }
-- }
-- dark_star_vendor_conv:addScreen(arch1);

-- chef1 = ConvoScreen:new {
    -- id = "chef1",
    -- leftDialog = "",
    -- customDialogText = "I sell food! See anything you like?",
    -- stopConversation = "false",
    -- options = { 
        -- {"Air Cake Dodge Food - 10k", "option40"},
        -- {"Crispic Accuracy Food - 10k", "option41"},
        -- {"Garrmorl Health Buff Drink - 10k", "option43"},
        -- {"Accarragm Action Buff Drink - 10k", "option44"},
        -- {"Vasarian Brandy Mind Buff Drink - 10k", "option42"},
        -- {"Blue Milk Mind Heal Drink - 10k", "option45"},
       	-- {"Main menu.", "first_screen"},
    -- }
-- }
-- dark_star_vendor_conv:addScreen(chef1);



-- doc1 = ConvoScreen:new {
    -- id = "doc1",
    -- leftDialog = "",
    -- customDialogText = "medical supplies, need anything?",
    -- stopConversation = "false",
    -- options = { 
        -- {"Doc/Ent Buffs - 10k", "buff1"},
        -- {"1500 Health/Action Buffs - 10k", "buff2"},--not working
        -- {"StimPack A - 500", "option50"},
        -- {"StimPack B - 1k", "option51"},
        -- {"StimPack C - 2k", "option52"},
        -- {"StimPack D - 5k", "option53"},
        -- {"StimPack E - 10k", "option54"},
      	-- {"Main menu.", "first_screen"},
    -- }
-- }
-- dark_star_vendor_conv:addScreen(doc1);

-- droid1 = ConvoScreen:new {
    -- id = "droid1",
    -- leftDialog = "",
    -- customDialogText = "droid stuff, need anything?",
    -- stopConversation = "false",
    -- options = { 
		-- {"Doc/Ent Buffs - 10k", "buff1"},
        -- {"1500 Health/Action Buffs - 10k", "buff2"},--not working
        -- {"StimPack A - 500", "option50"},
        -- {"StimPack B - 1k", "option51"},
        -- {"StimPack C - 2k", "option52"},
        -- {"Seeker Droid - 5k", "option64"},
        -- {"Probe Droid - 10k", "option65"},
      	-- {"Main menu.", "first_screen"},
    -- }
-- }
-- dark_star_vendor_conv:addScreen(droid1);

-- tailor1 = ConvoScreen:new {
    -- id = "tailor1",
    -- leftDialog = "",
    -- customDialogText = "Tailor stuff, need anything?",
    -- stopConversation = "false",
    -- options = { 
		-- {"25 Fiberplast Panel - 5k", "option71"},    //not useable in crafting : /
		-- {"25 Reinforced Fiber Panel - 5k", "option70"},
		-- {"25 Synthetic Cloth- 5k", "option76"},     
        
      	-- {"Main menu.", "first_screen"},
    -- }
-- }
-- dark_star_vendor_conv:addScreen(tailor1);

-- jedi = ConvoScreen:new {    
    -- id = "jedi",
    -- leftDialog = "",
    -- customDialogText = "Selling rare Jedi Loot.",
    -- stopConversation = "false",
    -- options = { 
        -- {"Lightsaber Color Crystal - 25k", "option100"},
        -- {"Main menu.", "first_screen"},
    -- }
-- }
-- dark_star_vendor_conv:addScreen(jedi);

dark_star_vendor_accept_quest = ConvoScreen:new {    
    id = "option1",
    leftDialog = "",
    customDialogText = "Enjoy!",
    stopConversation = "true",
    options = { }
}
dark_star_vendor_conv:addScreen(dark_star_vendor_accept_quest);

dark_star_vendor_deny_quest = ConvoScreen:new {
    id = "deny_quest",
    leftDialog = "",
    customDialogText = "Well, have a nice day!",
    stopConversation = "true",
    options = { }
}
dark_star_vendor_conv:addScreen(dark_star_vendor_deny_quest);

dark_star_vendor_insufficient_funds = ConvoScreen:new {
    id = "insufficient_funds",  
    leftDialog = "", 
    customDialogText = "Sorry, but you don't have enough cash credits with you to purchase that. Head on over to the bank. I'll be here when ya get back!",
    stopConversation = "true",
    options = { }
}
dark_star_vendor_conv:addScreen(dark_star_vendor_insufficient_funds);

dark_star_vendor_insufficient_space = ConvoScreen:new {
    id = "insufficient_space",
    leftDialog = "", 
    customDialogText = "Sorry, but you don't have enough space in your inventory to accept the item. Please make some space and try again.",    
    stopConversation = "true",  
    options = { }
}
dark_star_vendor_conv:addScreen(dark_star_vendor_insufficient_space);

dark_star_vendor_purchase_complete = ConvoScreen:new {
    id = "purchase_complete",
    leftDialog = "", 
    customDialogText = "Thank you! Have a great day!",    
    stopConversation = "true",  
    options = { }
}
dark_star_vendor_conv:addScreen(dark_star_vendor_purchase_complete);

addConversationTemplate("dark_star_vendor_conv", dark_star_vendor_conv);
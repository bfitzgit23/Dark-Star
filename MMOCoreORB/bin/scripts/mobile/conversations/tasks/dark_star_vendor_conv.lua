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
        {"Buffs", "newbuff1"},
        {"Weapons", "weaps1"},
        {"Armor", "armor1"},
        {"Loot", "loot1"},
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

weaps1 = ConvoScreen:new {    
    id = "weaps1",
    leftDialog = "",
    customDialogText = "Selling random loot weapons and high end weapons.",
    stopConversation = "false",
    options = { 
		{"CDEF Pistol - 5k", "option1"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(weaps1);

-- armor1 = ConvoScreen:new {    
    -- id = "armor1",
    -- leftDialog = "",
    -- customDialogText = "Selling Chitin Armor 65% kinetic, 25% base eff\n\nUbese armor with 80% kinetic and 50% base eff.\n\nComposite with 80%kinetic/electic and 65% base 0% stun",
    -- stopConversation = "false",
    -- options = { 
        -- {"Chitin Leggings - 25k", "option16"},
        -- {"Chitin Chest Plate - 25k", "option17"},
        -- {"Chitin Helmet - 25k", "option18"},
        -- {"Chitin left Bracer - 25k", "option19"},
        -- {"Ubese Leggings - 100k", "option12"},
        -- {"Ubese Chest Plate - 100k", "option13"},
        -- {"Ubese Helmet - 100k", "option14"},
        -- {"Ubese Left Bracer - 100k", "option15"},
        -- {"Composite Leggings - 250k", "option20"},
        -- {"Composite Chest Plate - 250k", "option21"},
        -- {"Composite Helmet - 250k", "option22"},
        -- {"Composite Left Bracer - 250k", "option23"},                               
        -- {"Main menu.", "first_screen"},
    -- }
-- }
-- dark_star_vendor_conv:addScreen(armor1);

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

-- loot1 = ConvoScreen:new {
    -- id = "loot1",
    -- leftDialog = "",
    -- customDialogText = "Would you like to buy some loot drops?",
    -- stopConversation = "false",
    -- options = { 
        -- {"10k stack Resource Deed - 200k", "option46"},
        -- {"Random lvl 50 Pistol Loot - 15k", "option56"},
        -- {"Random lvl 50 Carbine Loot - 15k", "option57"},
        -- {"Random lvl 50 Rifle Loot - 15k", "option58"},
        -- {"Random lvl 50 1h sword Loot - 15k", "option59"},
        -- {"Random lvl 50 2h sword Loot - 15k", "option60"},
        -- {"Random lvl 50 Polearm Loot - 15k", "option61"},
		-- {"Random lvl 50 Unarmed Loot - 15k", "option62"},        
		-- {"Random lvl 50 Hvy Weapons (flame/acid/LLC) - 15k", "option63"},  	              
        -- {"Random lvl 300 Clothing Loot - 100k", "option47"},
		-- {"Random lvl 100 Armor Loot - 100k", "option48"},
        -- {"Random lvl 100 Weapon Loot - 100k", "option49"},
       	-- {"Jedi Holocron - 10mil", "option5"},
        -- {"Main menu.", "first_screen"},
    -- }
-- }
-- dark_star_vendor_conv:addScreen(loot1);

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

-- newbuff1 = ConvoScreen:new {
    -- id = "newbuff1",
    -- leftDialog = "",
    -- customDialogText = "I sell buffs!",
    -- stopConversation = "false",
    -- options = { 

        -- {"2k Medical & Ent buffs 3hr - 15k", "buff1"},
      	-- {"Main menu.", "first_screen"},
    -- }
-- }
-- dark_star_vendor_conv:addScreen(newbuff1);

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
    customDialogText = "Thank you! Need anything else?",    
    stopConversation = "false",  
    options = { }
}
dark_star_vendor_conv:addScreen(dark_star_vendor_purchase_complete);

addConversationTemplate("dark_star_vendor_conv", dark_star_vendor_conv);
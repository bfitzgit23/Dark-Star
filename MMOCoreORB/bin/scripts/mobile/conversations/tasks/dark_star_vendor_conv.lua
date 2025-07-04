-- Dark Star Vendor Conversation Template
-- Defines the conversation flow and options for the vendor.

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
        {"Armor", "armor_menu"}, -- Changed to point to the new armor menu
        {"Deeds", "deeds"},
        {"Food and Drinks","food_menu"},
        {"Jedi Items", "jedi"},
        {"Medic", "medic"},
        {"Wearables", "wearables"},
    }
}
dark_star_vendor_conv:addScreen(dark_star_vendor_first_screen);

buffs = ConvoScreen:new {
    id = "buffs",
    leftDialog = "",
    customDialogText = "I sell buffs!",
    stopConversation = "false",
    options = {
        {"2k Medical & Ent buffs 3hr - 15k", "buffs01"},
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
        {"Ranged Weapons","ranged"},
        {"Melee Weapons","melee"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(weapons);

ranged = ConvoScreen:new {
    id = "ranged",
    leftDialog = "",
    customDialogText = "Please choose.",
    stopConversation = "false",
    options = {
        {"Starter Ranged Weapons","ranged_starter"},
        {"Advanced Ranged Weapons","ranged_advanced"},
        {"Back","weapons"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(ranged);

ranged_starter = ConvoScreen:new {
    id = "ranged_starter",
    leftDialog = "",
    customDialogText = "Please choose.",
    stopConversation = "false",
    options = {
        {"CDEF Pistol - 5k", "weapon01"},
        {"CDEF Carbine - 5k", "weapon02"},
        {"CDEF Rifle - 5k", "weapon03"},
        {"Back","ranged"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(ranged_starter);

ranged_advanced = ConvoScreen:new {
    id = "ranged_advanced",
    leftDialog = "",
    customDialogText = "Please choose.",
    stopConversation = "false",
    options = {
        {"DH17 Pistol - 15k", "weapon04"},
        {"DH17 Carbine - 15k", "weapon05"},
        {"DLT20a Rifle - 15k", "weapon06"},
        {"Back","ranged"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(ranged_advanced);

melee = ConvoScreen:new {
    id = "melee",
    leftDialog = "",
    customDialogText = "Please choose.",
    stopConversation = "false",
    options = {
        {"Starter Melee Weapons","melee_starter"},
        {"Advanced Melee Weapons","melee_advanced"},
        {"Back","weapons"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(melee);

melee_starter = ConvoScreen:new {
    id = "melee_starter",
    leftDialog = "",
    customDialogText = "Please choose.",
    stopConversation = "false",
    options = {
        {"Survival Knife","weapon12"},
        {"Wodden Staff","weapon13"},
        {"Heavy-Duty Axe","weapon14"},
        {"Back","melee"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(melee_starter);

melee_advanced = ConvoScreen:new {
    id = "melee_advanced",
    leftDialog = "",
    customDialogText = "Please choose.",
    stopConversation = "false",
    options = {
        {"Gaderiffi Baton - 25k", "weapon07"},
        {"Stun Baton - 50k", "weapon08"},
        {"Long Vibro Axe - 25k", "weapon09"},
        {"Two-handed Curved Sword - 25k", "weapon10"},
        {"Vibro Knuckler - 25k", "weapon11"},
        {"Back","melee"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(melee_advanced);

-- New screen to act as the main menu for different armor types
armor_menu = ConvoScreen:new {
    id = "armor_menu",
    leftDialog = "",
    customDialogText = "What type of armor are you looking for?",
    stopConversation = "false",
    options = {
        {"Composite Armor", "composite_armor"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(armor_menu);

-- This is the old armor screen, now repurposed for just composite armor pieces
composite_armor_screen = ConvoScreen:new {
    id = "composite_armor", -- ID changed
    leftDialog = "",
    customDialogText = "Selling Composite Armor pieces.",
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
        {"Back", "armor_menu"}, -- Added back button
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(composite_armor_screen);

deeds = ConvoScreen:new {
    id = "deeds",
    leftDialog = "",
    customDialogText = "Would you like to buy some Deeds?",
    stopConversation = "false",
    options = {
        {"10k stack Resource Deed - 200k from Bank", "deeds01"},
        {"Speeder Bike - 15k", "deeds02"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(deeds);

food_menu = ConvoScreen:new {
    id = "food_menu",
    leftDialog = "",
    customDialogText = "Need something delicious for your adventure?",
    stopConversation = "false",
    options = {
        {"Food","food"},
        {"Drinks","drinks"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(food_menu);

food = ConvoScreen:new {
    id = "food",
    leftDialog = "",
    customDialogText = "Please choose.",
    stopConversation = "false",
    options = {
        {"Pikatta Pie(Dodge +35%) - 15k","food01"},
        {"Pyollian Cake(Crafting Bonus +10) - 15k","food02"},
        {"Bivoli Tempari(Wound Treatment +10) - 15k","food03"},
        {"Synthsteak(Damage Reduction +35%) - 15k","food04"},
        {"Thakitillo(Defense vs Knockdown +80) - 15k","food05"},
        {"Back","food_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(food);

drinks = ConvoScreen:new {
    id = "drinks",
    leftDialog = "",
    customDialogText = "Please choose.",
    stopConversation = "false",
    options = {
        {"Bespin Port(Experiment Bonus +10) - 15k","food06"},
        {"Ithorian Mist(Defense vs Dizzy +15) - 15k","food07"},
        {"Back","food_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(drinks);

jedi = ConvoScreen:new {
    id = "jedi",
    leftDialog = "",
    customDialogText = "Selling rare Jedi Loot.",
    stopConversation = "false",
    options = {
        {"Sith Holocron - 25k", "jedi01"},
        {"Jedi Holocron - 25k", "jedi02"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(jedi);

medic = ConvoScreen:new {
    id = "medic",
    leftDialog = "",
    customDialogText = "medical supplies, need anything?",
    stopConversation = "false",
    options = {
        {"StimPack A - 500", "medic01"},
        {"StimPack B - 1k", "medic02"},
        {"StimPack C - 2k", "medic03"},
        {"StimPack D - 5k", "medic04"},
        {"StimPack E - 10k", "medic05"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(medic);

wearables = ConvoScreen:new {
    id = "wearables",
    leftDialog = "",
    customDialogText = "I sell clothes and backpacks!",
    stopConversation = "false",
    options = {
        {"Backpack - 5k", "wearables01"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(wearables);

dark_star_vendor_insufficient_funds = ConvoScreen:new {
    id = "insufficient_funds",
    leftDialog = "",
    customDialogText = "Sorry, but you don't have enough credits to purchase that. Come back when you have more credits",
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
    stopConversation = "false",
    options = { }
}
dark_star_vendor_conv:addScreen(dark_star_vendor_purchase_complete);

addConversationTemplate("dark_star_vendor_conv", dark_star_vendor_conv);

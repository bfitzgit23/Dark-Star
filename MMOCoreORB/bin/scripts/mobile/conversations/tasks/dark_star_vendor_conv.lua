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
        {"Armor", "armor_menu"},
        {"Deeds", "deeds"},
        {"Food and Drinks","food_menu"},
        {"Jedi Items", "jedi"},
        {"Medic", "medic"}, -- Points to the new medic menu
        {"Artisan","artisan_menu"},
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
    customDialogText = "What kind of medical supplies do you need?",
    stopConversation = "false",
    options = {
        {"Stims", "stims_menu"},
        {"Wound Treatment", "wound_treatment_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(medic);

-- This screen lists all the available stimpacks.
stims_menu = ConvoScreen:new {
    id = "stims_menu",
    leftDialog = "",
    customDialogText = "Stimpacks available for purchase.",
    stopConversation = "false",
    options = {
        {"StimPack A - 500", "medic01"},
        {"StimPack B - 1k", "medic02"},
        {"StimPack C - 2k", "medic03"},
        {"StimPack D - 5k", "medic04"},
        {"StimPack E - 10k", "medic05"},
        {"Back", "medic"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(stims_menu);

wound_treatment_menu = ConvoScreen:new {
    id = "wound_treatment_menu",
    leftDialog = "",
    customDialogText = "What type of wound do you need to treat?",
    stopConversation = "false",
    options = {
        {"Action", "wound_action"},
        {"Health", "wound_health"},
        {"Constitution", "wound_constitution"},
        {"Quickness", "wound_quickness"},
        {"Stamina", "wound_stamina"},
        {"Strength", "wound_strength"},
        {"Back", "medic"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(wound_treatment_menu);

-- This screen lists Action wound treatment items.
wound_action = ConvoScreen:new {
    id = "wound_action",
    leftDialog = "",
    customDialogText = "Action wound treatment supplies.",
    stopConversation = "false",
    options = {
        {"Action Wound Pack A - 1k", "medic06"},
        {"Action Wound Pack B - 2k", "medic07"},
        {"Action Wound Pack C - 3k", "medic08"},
        {"Action Wound Pack D - 4k", "medic09"},
        {"Action Wound Pack E - 5k", "medic10"},
        {"Back", "wound_treatment_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(wound_action);

-- This screen lists Health wound treatment items.
wound_health = ConvoScreen:new {
    id = "wound_health",
    leftDialog = "",
    customDialogText = "Health wound treatment supplies.",
    stopConversation = "false",
    options = {
        {"Health Wound Pack A - 1k", "medic11"},
        {"Health Wound Pack B - 2k", "medic12"},
        {"Health Wound Pack C - 3k", "medic13"},
        {"Health Wound Pack D - 4k", "medic14"},
        {"Health Wound Pack E - 5k", "medic15"},
        {"Back", "wound_treatment_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(wound_health);

-- This screen lists Constitution wound treatment items.
wound_constitution = ConvoScreen:new {
    id = "wound_constitution",
    leftDialog = "",
    customDialogText = "Constitution wound treatment supplies.",
    stopConversation = "false",
    options = {
        {"Constitution Wound Pack A - 1k", "medic16"},
        {"Constitution Wound Pack B - 2k", "medic17"},
        {"Constitution Wound Pack C - 3k", "medic18"},
        {"Constitution Wound Pack D - 4k", "medic19"},
        {"Constitution Wound Pack E - 5k", "medic20"},
        {"Back", "wound_treatment_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(wound_constitution);

-- This screen lists Quickness wound treatment items.
wound_quickness = ConvoScreen:new {
    id = "wound_quickness",
    leftDialog = "",
    customDialogText = "Quickness wound treatment supplies.",
    stopConversation = "false",
    options = {
        {"Quickness Wound Pack A - 1k", "medic21"},
        {"Quickness Wound Pack B - 2k", "medic22"},
        {"Quickness Wound Pack C - 3k", "medic23"},
        {"Quickness Wound Pack D - 4k", "medic24"},
        {"Quickness Wound Pack E - 5k", "medic25"},
        {"Back", "wound_treatment_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(wound_quickness);

-- This screen lists Stamina wound treatment items.
wound_stamina = ConvoScreen:new {
    id = "wound_stamina",
    leftDialog = "",
    customDialogText = "Stamina wound treatment supplies.",
    stopConversation = "false",
    options = {
        {"Stamina Wound Pack A - 1k", "medic26"},
        {"Stamina Wound Pack B - 2k", "medic27"},
        {"Stamina Wound Pack C - 3k", "medic28"},
        {"Stamina Wound Pack D - 4k", "medic29"},
        {"Stamina Wound Pack E - 5k", "medic30"},
        {"Back", "wound_treatment_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(wound_stamina);

-- This screen lists Strength wound treatment items.
wound_strength = ConvoScreen:new {
    id = "wound_strength",
    leftDialog = "",
    customDialogText = "Strength wound treatment supplies.",
    stopConversation = "false",
    options = {
        {"Strength Wound Pack A - 1k", "medic31"},
        {"Strength Wound Pack B - 2k", "medic32"},
        {"Strength Wound Pack C - 3k", "medic33"},
        {"Strength Wound Pack D - 4k", "medic34"},
        {"Strength Wound Pack E - 5k", "medic35"},
        {"Back", "wound_treatment_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(wound_strength);

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

-- ARTISAN MENUS
artisan_menu = ConvoScreen:new {
    id = "artisan_menu",
    leftDialog = "",
    customDialogText = "What crafting and structural supplies do you need?",
    stopConversation = "false",
    options = {
        {"Factories", "factories_menu"},
        {"Harvesters", "harvesters_menu"},
        {"Generators", "generators_menu"},
        {"Player City", "player_city_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(artisan_menu);

factories_menu = ConvoScreen:new {
    id = "factories_menu",
    leftDialog = "",
    customDialogText = "I sell various factory deeds.",
    stopConversation = "false",
    options = {
        {"Structure Factory Deed - 100k", "factory01"},
        {"Clothing Factory Deed - 100k", "factory02"},
        {"Item Factory Deed - 100k", "factory03"},
        {"Food Factory Deed - 100k", "factory04"},
        {"Back", "artisan_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(factories_menu);

harvesters_menu = ConvoScreen:new {
    id = "harvesters_menu",
    leftDialog = "",
    customDialogText = "What kind of harvester do you need?",
    stopConversation = "false",
    options = {
        {"Heavy Ore Harvester Deed - 150k", "harvester01"},
        {"Heavy Flora Harvester Deed - 150k", "harvester02"},
        {"Heavy Gas Harvester Deed - 150k", "harvester03"},
        {"Heavy Moisture Harvester Deed - 150k", "harvester04"},
        {"Heavy Liquid Harvester Deed - 150k", "harvester05"},
        {"Back", "artisan_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(harvesters_menu);

generators_menu = ConvoScreen:new {
    id = "generators_menu",
    leftDialog = "",
    customDialogText = "Need more power for your installations?",
    stopConversation = "false",
    options = {
        {"Fusion Generator Deed - 75k", "generator01"},
        {"Solar Generator Deed - 50k", "generator02"},
        {"Wind Generator Deed - 40k", "generator03"},
        {"Photo Bio Generator Deed - 60k", "generator04"},
        {"Back", "artisan_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(generators_menu);

-- RESTRUCTURED PLAYER CITY MENUS START HERE
player_city_menu = ConvoScreen:new {
    id = "player_city_menu",
    leftDialog = "",
    customDialogText = "Which planet's city deeds are you interested in?",
    stopConversation = "false",
    options = {
        {"Generic Deeds", "generic_deeds_menu"},
        {"Corellia Deeds", "corellia_deeds_menu"},
        {"Naboo Deeds", "naboo_deeds_menu"},
        {"Tatooine Deeds", "tatooine_deeds_menu"},
        {"Back", "artisan_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(player_city_menu);

-- Generic Deeds
generic_deeds_menu = ConvoScreen:new {
    id = "generic_deeds_menu",
    leftDialog = "",
    customDialogText = "Generic player city deeds.",
    stopConversation = "false",
    options = {
        {"Player House Deeds", "generic_player_house_deeds_menu"},
        {"City Deeds", "generic_city_deeds_menu"},
        {"Back", "player_city_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(generic_deeds_menu);

generic_player_house_deeds_menu = ConvoScreen:new {
    id = "generic_player_house_deeds_menu",
    leftDialog = "",
    customDialogText = "Generic player house deeds.",
    stopConversation = "false",
    options = {
        {"Generic Guild Hall Deed - 500k", "guildhall_generic_01"},
        {"Large Generic House Deed - 250k", "house_generic_large_01"},
        {"Large Generic House Deed (Style 2) - 250k", "house_generic_large_02"},
        {"Medium Generic House Deed - 200k", "house_generic_medium_01"},
        {"Medium Generic House Deed (Style 2) - 200k", "house_generic_medium_02"},
        {"Small Generic House Deed - 150k", "house_generic_small_01"},
        {"Small Generic House Deed Floorplan 2 - 150k", "house_generic_small_fp02"},
        {"Small Generic House Deed (Style 2) - 150k", "house_generic_small_02"},
        {"Small Generic House Deed Floorplan 2 (Style 2) - 150k", "house_generic_small_fp02_02"},
        {"Back", "generic_deeds_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(generic_player_house_deeds_menu);

generic_city_deeds_menu = ConvoScreen:new {
    id = "generic_city_deeds_menu",
    leftDialog = "",
    customDialogText = "Generic city infrastructure deeds.",
    stopConversation = "false",
    options = {
        {"Large Dantooine Garden - 100k", "garden_dantooine_large_01"},
        {"Medium Dantooine Garden - 75k", "garden_dantooine_medium_01"},
        {"Small Dantooine Garden - 50k", "garden_dantooine_small_01"},
        {"Large Dathomir Garden - 100k", "garden_dathomir_large_01"},
        {"Medium Dathomir Garden - 75k", "garden_dathomir_medium_01"},
        {"Small Dathomir Garden - 50k", "garden_dathomir_small_01"},
        {"Large Endor Garden - 100k", "garden_endor_large_01"},
        {"Medium Endor Garden - 75k", "garden_endor_medium_01"},
        {"Small Endor Garden - 50k", "garden_endor_small_01"},
        {"Back", "generic_deeds_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(generic_city_deeds_menu);

-- Corellia Deeds
corellia_deeds_menu = ConvoScreen:new {
    id = "corellia_deeds_menu",
    leftDialog = "",
    customDialogText = "Corellia-specific player city deeds.",
    stopConversation = "false",
    options = {
        {"Player House Deeds", "corellia_player_house_deeds_menu"},
        {"City Deeds", "corellia_city_deeds_menu"},
        {"Back", "player_city_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(corellia_deeds_menu);

corellia_player_house_deeds_menu = ConvoScreen:new {
    id = "corellia_player_house_deeds_menu",
    leftDialog = "",
    customDialogText = "Corellia player house deeds.",
    stopConversation = "false",
    options = {
        {"Corellian Guild Hall Deed - 500k", "guildhall_corellia_01"},
        {"Large Corellian House Deed - 250k", "house_corellia_large_01"},
        {"Large Corellian House Deed (Style 2) - 250k", "house_corellia_large_02"},
        {"Medium Corellian House Deed - 200k", "house_corellia_medium_01"},
        {"Medium Corellian House Deed (Style 2) - 200k", "house_corellia_medium_02"},
        {"Small Corellian House Deed - 150k", "house_corellia_small_01"},
        {"Small Corellian House Deed Floorplan 2 - 150k", "house_corellia_small_fp02"},
        {"Small Corellian House Deed (Style 2) - 150k", "house_corellia_small_02"},
        {"Small Corellian House Deed Floorplan 2 (Style 2) - 150k", "house_corellia_small_fp02_02"},
        {"Back", "corellia_deeds_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(corellia_player_house_deeds_menu);

corellia_city_deeds_menu = ConvoScreen:new {
    id = "corellia_city_deeds_menu",
    leftDialog = "",
    customDialogText = "Corellia city infrastructure deeds.",
    stopConversation = "false",
    options = {
        {"Corellia Bank Deed - 350k", "city_corellia_bank_01"},
        {"Corellia Cantina Deed - 350k", "city_corellia_cantina_01"},
        {"Corellia Garage Deed - 350k", "city_corellia_garage_01"},
        {"Corellia Shuttleport Deed - 400k", "shuttleport01"}, -- Reusing existing ID
        {"Corellia City Hall Deed - 500k", "city_corellia_cityhall_01"},
        {"Corellia Cloning Center Deed - 350k", "city_corellia_cloning_01"},
        {"Corellia Medical Center Deed - 350k", "city_corellia_hospital_01"},
        {"Corellia Theater Deed - 300k", "theater01"}, -- Reusing existing ID
        {"Large Corellia Garden (Style 1) - 100k", "garden_corellia_large_01"},
        {"Large Corellia Garden (Style 2) - 100k", "garden_corellia_large_02"},
        {"Large Corellia Garden (Style 3) - 100k", "garden_corellia_large_03"},
        {"Large Corellia Garden (Style 4) - 100k", "garden_corellia_large_04"},
        {"Large Corellia Garden (Style 5) - 100k", "garden_corellia_large_05"},
        {"Medium Corellia Garden (Style 1) - 75k", "garden_corellia_medium_01"},
        {"Medium Corellia Garden (Style 2) - 75k", "garden_corellia_medium_02"},
        {"Medium Corellia Garden (Style 3) - 75k", "garden_corellia_medium_03"},
        {"Medium Corellia Garden (Style 4) - 75k", "garden_corellia_medium_04"},
        {"Medium Corellia Garden (Style 5) - 75k", "garden_corellia_medium_05"},
        {"Small Corellia Garden (Style 1) - 50k", "garden_corellia_small_01"},
        {"Small Corellia Garden (Style 2) - 50k", "garden_corellia_small_02"},
        {"Small Corellia Garden (Style 3) - 50k", "garden_corellia_small_03"},
        {"Small Corellia Garden (Style 4) - 50k", "garden_corellia_small_04"},
        {"Small Corellia Garden (Style 5) - 50k", "garden_corellia_small_05"},
        {"Back", "corellia_deeds_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(corellia_city_deeds_menu);

-- Naboo Deeds
naboo_deeds_menu = ConvoScreen:new {
    id = "naboo_deeds_menu",
    leftDialog = "",
    customDialogText = "Naboo-specific player city deeds.",
    stopConversation = "false",
    options = {
        {"Player House Deeds", "naboo_player_house_deeds_menu"},
        {"City Deeds", "naboo_city_deeds_menu"},
        {"Back", "player_city_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(naboo_deeds_menu);

naboo_player_house_deeds_menu = ConvoScreen:new {
    id = "naboo_player_house_deeds_menu",
    leftDialog = "",
    customDialogText = "Naboo player house deeds.",
    stopConversation = "false",
    options = {
        {"Naboo Guild Hall Deed - 500k", "guildhall_naboo_01"},
        {"Large Naboo House Deed - 250k", "house_naboo_large_01"},
        {"Medium Naboo House Deed - 200k", "house_naboo_medium_01"},
        {"Small Naboo House Deed - 150k", "house_naboo_small_01"},
        {"Small Naboo House Deed (Style 2) - 150k", "house_naboo_small_02"},
        {"Back", "naboo_deeds_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(naboo_player_house_deeds_menu);

naboo_city_deeds_menu = ConvoScreen:new {
    id = "naboo_city_deeds_menu",
    leftDialog = "",
    customDialogText = "Naboo city infrastructure deeds.",
    stopConversation = "false",
    options = {
        {"Naboo Bank Deed - 350k", "city_naboo_bank_01"},
        {"Naboo Cantina Deed - 350k", "city_naboo_cantina_01"},
        {"Naboo Garage Deed - 350k", "city_naboo_garage_01"},
        {"Naboo Shuttleport Deed - 400k", "shuttleport02"}, -- Reusing existing ID
        {"Naboo City Hall Deed - 500k", "city_naboo_cityhall_01"},
        {"Naboo Cloning Center Deed - 350k", "city_naboo_cloning_01"},
        {"Naboo Medical Center Deed - 350k", "city_naboo_hospital_01"},
        {"Naboo Theater Deed - 300k", "theater02"}, -- Reusing existing ID
        {"Large Naboo Garden (Style 1) - 100k", "garden_naboo_large_01"},
        {"Large Naboo Garden (Style 2) - 100k", "garden_naboo_large_02"},
        {"Large Naboo Garden (Style 3) - 100k", "garden_naboo_large_03"},
        {"Large Naboo Garden (Style 4) - 100k", "garden_naboo_large_04"},
        {"Large Naboo Garden (Style 5) - 100k", "garden_naboo_large_05"},
        {"Medium Naboo Garden (Style 1) - 75k", "garden_naboo_medium_01"},
        {"Medium Naboo Garden (Style 2) - 75k", "garden_naboo_medium_02"},
        {"Medium Naboo Garden (Style 3) - 75k", "garden_naboo_medium_03"},
        {"Medium Naboo Garden (Style 4) - 75k", "garden_naboo_medium_04"},
        {"Medium Naboo Garden (Style 5) - 75k", "garden_naboo_medium_05"},
        {"Small Naboo Garden (Style 1) - 50k", "garden_naboo_small_01"},
        {"Small Naboo Garden (Style 2) - 50k", "garden_naboo_small_02"},
        {"Small Naboo Garden (Style 3) - 50k", "garden_naboo_small_03"},
        {"Small Naboo Garden (Style 4) - 50k", "garden_naboo_small_04"},
        {"Small Naboo Garden (Style 5) - 50k", "garden_naboo_small_05"},
        {"Back", "naboo_deeds_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(naboo_city_deeds_menu);

-- Tatooine Deeds
tatooine_deeds_menu = ConvoScreen:new {
    id = "tatooine_deeds_menu",
    leftDialog = "",
    customDialogText = "Tatooine-specific player city deeds.",
    stopConversation = "false",
    options = {
        {"Player House Deeds", "tatooine_player_house_deeds_menu"},
        {"City Deeds", "tatooine_city_deeds_menu"},
        {"Back", "player_city_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(tatooine_deeds_menu);

tatooine_player_house_deeds_menu = ConvoScreen:new {
    id = "tatooine_player_house_deeds_menu",
    leftDialog = "",
    customDialogText = "Tatooine player house deeds.",
    stopConversation = "false",
    options = {
        {"Tatooine Guild Hall Deed - 500k", "guildhall_tatooine_01"},
        {"Tatooine Guild Hall (Style 2) Deed - 500k", "guildhall_tatooine_02"},
        {"Large Tatooine House Deed - 250k", "house_tatooine_large_01"},
        {"Medium Tatooine House Deed - 200k", "house_tatooine_medium_01"},
        {"Small Tatooine House Deed - 150k", "house_tatooine_small_01"},
        {"Small Tatooine House Deed (Style 2) - 150k", "house_tatooine_small_02"},
        {"Back", "tatooine_deeds_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(tatooine_player_house_deeds_menu);

tatooine_city_deeds_menu = ConvoScreen:new {
    id = "tatooine_city_deeds_menu",
    leftDialog = "",
    customDialogText = "Tatooine city infrastructure deeds.",
    stopConversation = "false",
    options = {
        {"Tatooine Bank Deed - 350k", "city_tatooine_bank_01"},
        {"Tatooine Cantina Deed - 350k", "city_tatooine_cantina_01"},
        {"Tatooine Garage Deed - 350k", "city_tatooine_garage_01"},
        {"Tatooine Shuttleport Deed - 400k", "shuttleport03"}, -- Reusing existing ID
        {"Tatooine City Hall Deed - 500k", "city_tatooine_cityhall_01"},
        {"Tatooine Cloning Center Deed - 350k", "city_tatooine_cloning_01"},
        {"Tatooine Medical Center Deed - 350k", "city_tatooine_hospital_01"},
        {"Tatooine Theater Deed - 300k", "theater03"}, -- Reusing existing ID
        {"Large Tatooine Garden (Style 1) - 100k", "garden_tatooine_large_01"},
        {"Large Tatooine Garden (Style 2) - 100k", "garden_tatooine_large_02"},
        {"Large Tatooine Garden (Style 3) - 100k", "garden_tatooine_large_03"},
        {"Large Tatooine Garden (Style 4) - 100k", "garden_tatooine_large_04"},
        {"Large Tatooine Garden (Style 5) - 100k", "garden_tatooine_large_05"},
        {"Medium Tatooine Garden (Style 1) - 75k", "garden_tatooine_medium_01"},
        {"Medium Tatooine Garden (Style 2) - 75k", "garden_tatooine_medium_02"},
        {"Medium Tatooine Garden (Style 3) - 75k", "garden_tatooine_medium_03"},
        {"Medium Tatooine Garden (Style 4) - 75k", "garden_tatooine_medium_04"},
        {"Medium Tatooine Garden (Style 5) - 75k", "garden_tatooine_medium_05"},
        {"Small Tatooine Garden (Style 1) - 50k", "garden_tatooine_small_01"},
        {"Small Tatooine Garden (Style 2) - 50k", "garden_tatooine_small_02"},
        {"Small Tatooine Garden (Style 3) - 50k", "garden_tatooine_small_03"},
        {"Small Tatooine Garden (Style 4) - 50k", "garden_tatooine_small_04"},
        {"Small Tatooine Garden (Style 5) - 50k", "garden_tatooine_small_05"},
        {"Back", "tatooine_deeds_menu"},
        {"Main menu.", "first_screen"},
    }
}
dark_star_vendor_conv:addScreen(tatooine_city_deeds_menu);
-- END RESTRUCTURED PLAYER CITY MENUS

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
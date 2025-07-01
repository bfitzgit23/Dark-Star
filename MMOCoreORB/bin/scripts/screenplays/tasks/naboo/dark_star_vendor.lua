-- Include necessary manager files
includeFile("../managers/loot_manager.lua")

-- Define the ScreenPlay for the vendor
dark_star_vendor = ScreenPlay:new {
    numberOfActs = 1,
    questString = "dark_star_vendor_task",
    states = {},
}

registerScreenPlay("dark_star_vendor", true)

-- This function runs when the script starts, spawning all the vendor NPCs
function dark_star_vendor:start()
    -- A list of all locations where the vendor should spawn.
    local spawnLocations = {
        -- Corellia
        { "corellia", -157, 28.0, -4724, 35 },     -- cnet
        { "corellia", -5042, 21.0, -2297, 35 },    -- tyrena
        { "corellia", -3138, 31.0, 2796, 35 },     -- korvella
        { "corellia", 3333, 308.0, 5524, 35 },     -- doaba
        { "corellia", -5550, 15.58, -6061, 35 },   -- venri
        { "corellia", 6643.02, 330.00, -5920.87, 35 }, -- belav
        -- Naboo
        { "naboo", -4872, 6.0, 4151, 35 },         -- theed
        { "naboo", 4807, 4.0, -4705, 35 },         -- moena
        { "naboo", 5200, -192.0, 6677, 35 },       -- kaadara
        { "naboo", 1444, 14.0, 2777, 35 },         -- keren
        { "naboo", 5331.16, 326.95, -1576.12, 35 },-- deja
        { "naboo", -5495.62, -150.00, -24.69, 35 },-- lake ret
        -- Tatooine
        { "tatooine", 3522, 5.0, -4803, 35 },      -- eisley
        { "tatooine", -1281, 12.0, -3590, 35 },    -- bestine
        { "tatooine", -2914, 5.0, 2129, 35 },      -- espa
        { "tatooine", 1293, 7.0, 3140, 35 },       -- entha
        { "tatooine", 48.33, 52.00, -5340.53, 35 },-- anc
        -- Talus
        { "talus", -2193, 20.0, 2313, 35 },        -- talus imp
        { "talus", 4447, 2.0, 5271, 35 },          -- nashal
        { "talus", 338, 6.0, -2931, 35 },          -- dearic
        -- Rori
        { "rori", 5365, 80.0, 5657, 35 },          -- restuss
        { "rori", -5305, 80.0, -2228, 35 },        -- narmle
        { "rori", 3683, 96.0, -6436, 35 },         -- reb
        -- Endor
        { "endor", -948, 73.0, 1550, 35 },         -- smugglers
        { "endor", 3201, 24.0, -3501, 35 },        -- research
        -- Dantooine
        { "dantooine", -632, 3.0, 2501, 35 },      -- mining
        { "dantooine", -4209, 3.0, -2349, 35 },    -- imp
        { "dantooine", 1564, 4.0, -6415, 35 },     -- aggro
        -- Dathomir
        { "dathomir", 619, 3.0, 3090, 35 },        -- trade
        { "dathomir", -47, 18.0, -1586, 35 },      -- science
		{ "dathomir", 5233, 78, -4057, 35 },      -- village
        -- Yavin 4
        { "yavin4", -265, 35.0, 4897, 35 },        -- mining
        { "yavin4", 4053, 17.0, -6217, 35 },       -- imp
        { "yavin4", -6922, 73.0, -5730, 35 },      -- labor
        -- Lok
        { "lok", 479, 8.0, 5512, 35 },             -- lok
    }

    for i, location in ipairs(spawnLocations) do
        spawnMobile(location[1], "dark_star_vendor", 1, location[2], location[3], location[4], location[5], 0)
    end
end

-- This is the conversation handler object
dark_star_vendor_convo_handler = Object:new {
    tstring = "myconversation"
}

-- This table holds all the items for sale. It makes the code much cleaner.
local itemsForSale = {
    -- Buffs
    ["buffs01"] = { cost = 15000, itemTemplate = nil, message = "Thank you! You have purchased a character enhancement.", isBuff = true },
    -- Starter Ranged
    ["weapon01"] = { cost = 5000, itemTemplate = "object/weapon/ranged/pistol/pistol_cdef.iff", message = "Thank you! You have purchased a CDEF Pistol." },
    ["weapon02"] = { cost = 5000, itemTemplate = "object/weapon/ranged/carbine/carbine_cdef.iff", message = "Thank you! You have purchased a CDEF Carbine." },
    ["weapon03"] = { cost = 5000, itemTemplate = "object/weapon/ranged/rifle/rifle_cdef.iff", message = "Thank you! You have purchased a CDEF Rifle." },
    -- Advanced Ranged
    ["weapon04"] = { cost = 15000, itemTemplate = "object/weapon/ranged/pistol/pistol_dh17.iff", message = "Thank you! You have purchased a DH-17 Pistol." },
    ["weapon05"] = { cost = 15000, itemTemplate = "object/weapon/ranged/carbine/carbine_dh17.iff", message = "Thank you! You have purchased a DH-17 Carbine." },
    ["weapon06"] = { cost = 15000, itemTemplate = "object/weapon/ranged/rifle/rifle_dlt20a.iff", message = "Thank you! You have purchased a DLT-20A Rifle." },
    -- Starter Melee
    ["weapon12"] = { cost = 1000, itemTemplate = "object/weapon/melee/knife/knife_survival.iff", message = "Thank you! You have purchased a Survival Knife." },
    ["weapon13"] = { cost = 1000, itemTemplate = "object/weapon/melee/polearm/lance_staff_wood_s1.iff", message = "Thank you! You have purchased a Wooden Staff." },
    ["weapon14"] = { cost = 1000, itemTemplate = "object/weapon/melee/axe/axe_heavy_duty.iff", message = "Thank you! You have purchased a Heavy-Duty Axe." },
    -- Advanced Melee
    ["weapon07"] = { cost = 25000, itemTemplate = "object/weapon/melee/baton/baton_gaderiffi.iff", message = "Thank you! You have purchased a Gaderiffi Baton." },
    ["weapon08"] = { cost = 50000, itemTemplate = "object/weapon/melee/baton/baton_stun.iff", message = "Thank you! You have purchased a Stun Baton." },
    ["weapon09"] = { cost = 25000, itemTemplate = "object/weapon/melee/polearm/polearm_vibro_axe.iff", message = "Thank you! You have purchased a Vibro Axe." },
    ["weapon10"] = { cost = 25000, itemTemplate = "object/weapon/melee/2h_sword/2h_sword_katana.iff", message = "Thank you! You have purchased a Katana." },
    ["weapon11"] = { cost = 25000, itemTemplate = "object/weapon/melee/special/vibroknuckler.iff", message = "Thank you! You have purchased a Vibroknuckler." },
    -- Armor
    ["armor01"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_helmet.iff", message = "Thank you! You have purchased a Composite Helmet." },
    ["armor02"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_chest_plate.iff", message = "Thank you! You have purchased a Composite Chest Plate." },
    ["armor03"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_leggings.iff", message = "Thank you! You have purchased Composite Leggings." },
    ["armor04"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_boots.iff", message = "Thank you! You have purchased Composite Boots." },
    ["armor05"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_bicep_r.iff", message = "Thank you! You have purchased a Right Composite Bicep." },
    ["armor06"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_bicep_l.iff", message = "Thank you! You have purchased a Left Composite Bicep." },
    ["armor07"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_bracer_r.iff", message = "Thank you! You have purchased a Right Composite Bracer." },
    ["armor08"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_bracer_l.iff", message = "Thank you! You have purchased a Left Composite Bracer." },
    ["armor09"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_gloves.iff", message = "Thank you! You have purchased Composite Gloves." },
    -- Deeds
    ["deeds01"] = { cost = 200000, itemTemplate = "object/tangible/veteran_reward/resource.iff", message = "Thank you! You have purchased a Resource Deed." },
    ["deeds02"] = { cost = 15000, itemTemplate = "object/tangible/deed/vehicle_deed/speederbike_deed.iff", message = "Thank you! You have purchased a Speederbike Deed." },
    -- Food
    ["food01"] = { cost = 15000, itemTemplate = "object/tangible/food/crafted/dessert_pikatta_pie.iff", message = "Thank you! You have purchased a Pikatta Pie." },
    ["food02"] = { cost = 15000, itemTemplate = "object/tangible/food/crafted/dessert_pyollian_cake.iff", message = "Thank you! You have purchased a Pyollian Cake." },
    ["food03"] = { cost = 15000, itemTemplate = "object/tangible/food/crafted/dish_bivoli_tempari.iff", message = "Thank you! You have purchased a Bivoli Tempari Dish." },
    ["food04"] = { cost = 15000, itemTemplate = "object/tangible/food/crafted/dish_synthsteak.iff", message = "Thank you! You have purchased a Synthsteak Dish." },
    ["food05"] = { cost = 15000, itemTemplate = "object/tangible/food/crafted/dish_thakitillo.iff", message = "Thank you! You have purchased a Thakitillo Dish." },
    -- Drinks
    ["food06"] = { cost = 15000, itemTemplate = "object/tangible/food/crafted/drink_bespin_port.iff", message = "Thank you! You have purchased a bottle of Bespin Port." },
    ["food07"] = { cost = 15000, itemTemplate = "object/tangible/food/crafted/drink_ithorian_mist.iff", message = "Thank you! You have purchased a bottle of Ithorian Mist." },
    -- Jedi
    ["jedi01"] = { cost = 25000, itemTemplate = "object/tangible/jedi/jedi_holocron_dark.iff", message = "Thank you! You have purchased a Sith Holocron." },
    ["jedi02"] = { cost = 25000, itemTemplate = "object/tangible/jedi/jedi_holocron_light.iff", message = "Thank you! You have purchased a Jedi Holocron." },
    -- Medic
    ["medic01"] = { cost = 500, itemTemplate = "object/tangible/medicine/crafted/crafted_stimpack_sm_s1_a.iff", message = "Thank you! You have purchased a Stimpack A." },
    ["medic02"] = { cost = 1000, itemTemplate = "object/tangible/medicine/crafted/crafted_stimpack_sm_s1_b.iff", message = "Thank you! You have purchased a Stimpack B." },
    ["medic03"] = { cost = 2000, itemTemplate = "object/tangible/medicine/crafted/crafted_stimpack_sm_s1_c.iff", message = "Thank you! You have purchased a Stimpack C." },
    ["medic04"] = { cost = 5000, itemTemplate = "object/tangible/medicine/crafted/crafted_stimpack_sm_s1_d.iff", message = "Thank you! You have purchased a Stimpack D." },
    ["medic05"] = { cost = 10000, itemTemplate = "object/tangible/medicine/crafted/crafted_stimpack_sm_s1_e.iff", message = "Thank you! You have purchased a Stimpack E." },
    -- Wearables
    ["wearables01"] = { cost = 5000, itemTemplate = "object/tangible/wearables/backpack/backpack_s01.iff", message = "Thank you! You have purchased a Backpack." },
}

-- This is the main function that handles the conversation logic.
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
    local itemToPurchase = itemsForSale[optionLink]

    -- If the selected option is a purchase, handle it here.
    if (itemToPurchase ~= nil) then
        local pInventory = creature:getSlottedObject("inventory")
        if (pInventory == nil) then
            creature:sendSystemMessage("Error: Could not find your inventory.")
            return nil
        end

        -- Check for inventory space first
        if (SceneObject(pInventory):isContainerFullRecursive()) then
            creature:sendSystemMessage("You do not have enough inventory space.")
            return conversation:getScreen("insufficient_space")
        end

        -- Check for sufficient credits
        local playerCash = creature:getCashCredits()
        local playerBank = creature:getBankCredits()
        if (playerCash + playerBank < itemToPurchase.cost) then
            creature:sendSystemMessage("You have insufficient funds for that.")
            return conversation:getScreen("insufficient_funds")
        end

        -- Subtract credits (from cash first, then bank)
        local remainingCost = itemToPurchase.cost
        if (playerCash >= remainingCost) then
            creature:subtractCashCredits(remainingCost)
        else
            creature:subtractCashCredits(playerCash)
            remainingCost = remainingCost - playerCash
            creature:subtractBankCredits(remainingCost)
        end

        -- Give the item or buff
        if (itemToPurchase.isBuff) then
            CreatureObject(conversingPlayer):enhanceCharacter()
        else
            giveItem(pInventory, itemToPurchase.itemTemplate, -1)
        end
        
        -- Send the confirmation message to the player's chat.
        creature:sendSystemMessage(itemToPurchase.message)

        -- *** KEY CHANGE IS HERE ***
        -- Instead of going to a new screen, we return the player to the screen
        -- they were just on. This avoids all the errors with modifying screens.
        return lastConversationScreen

    else
        -- If it's not a purchase, just navigate to the next screen.
        return conversation:getScreen(optionLink)
    end
end

function dark_star_vendor_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
    return conversationScreen
end

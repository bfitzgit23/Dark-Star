-- scripts/screenplays/tasks/naboo/dark_star_vendor.lua

-- Include necessary manager files
includeFile("../managers/loot_manager.lua")
-- REMOVED: includeFile("../screenplays/jedi/jedi_trials.lua")
-- The JediTrials:unlockJediKnight function is defined directly in this file below,
-- so we don't need to include it from an external file.

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
        { "corellia", -157, 28.0, -4724, 35 },      	-- cnet
        { "corellia", -5042, 21.0, -2297, 35 },      	-- tyrena
        { "corellia", -3138, 31.0, 2796, 35 },      	-- korvella
        { "corellia", 3333, 308.0, 5524, 35 },      	-- doaba
        { "corellia", -5550, 15.58, -6061, 35 },     	-- venri
        { "corellia", 6643.02, 330.00, -5920.87, 35 },  -- belav
        -- Naboo
        { "naboo", -4872, 6.0, 4151, 35 },           	-- theed
        { "naboo", 4807, 4.0, -4705, 35 },           	-- moena
        { "naboo", 5200, -192.0, 6677, 35 },         	-- kaadara
        { "naboo", 1444, 14.0, 2777, 35 },           	-- keren
        { "naboo", 5331.16, 326.95, -1576.12, 35 },  	-- deja
        { "naboo", -5495.62, -150.00, -24.69, 35 },  	-- lake ret
        -- Tatooine
        { "tatooine", 3522, 5.0, -4803, 35 },       	-- eisley
        { "tatooine", -1281, 12.0, -3590, 35 },			-- bestine
        { "tatooine", -2914, 5.0, 2129, 35 },       	-- espa
        { "tatooine", 1293, 7.0, 3140, 35 },        	-- entha
        { "tatooine", 48.33, 52.00, -5340.53, 35 },  	-- anc
        -- Talus
        { "talus", -2193, 20.0, 2313, 35 },          	-- talus imp
        { "talus", 4447, 2.0, 5271, 35 },           	-- nashal
        { "talus", 338, 6.0, -2931, 35 },           	-- dearic
        -- Rori
        { "rori", 5365, 80.0, 5657, 35 },           	-- restuss
        { "rori", -5305, 80.0, -2228, 35 },         	-- narmle
        { "rori", 3683, 96.0, -6436, 35 },          	-- reb
        -- Endor
        { "endor", -948, 73.0, 1550, 35 },           	-- smugglers
        { "endor", 3201, 24.0, -3501, 35 },         	-- research
        -- Dantooine
        { "dantooine", -632, 3.0, 2501, 35 },       	-- mining
        { "dantooine", -4209, 3.0, -2349, 35 },			-- imp
        { "dantooine", 1564, 4.0, -6415, 35 },      	-- aggro
        -- Dathomir
        { "dathomir", 619, 3.0, 3090, 35 },         	-- trade
        { "dathomir", -47, 18.0, -1586, 35 },       	-- science
        { "dathomir", 5233, 78, -4057, 35 },        	-- village
        -- Yavin 4
        { "yavin4", -265, 35.0, 4897, 35 },          	-- mining
        { "yavin4", 4053, 17.0, -6217, 35 },        	-- imp
        { "yavin4", -6922, 73.0, -5730, 35 },       	-- labor
        -- Lok
        { "lok", 479, 8.0, 5512, 35 },           	    -- lok
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
    -- Weapons
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
    -- Composite
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
    ["jedi_unlock_knight"] = { cost = 100000, message = "Congratulations! You have unlocked Jedi Knight status!", isJediUnlock = true },

    -- Medic
    -- Stimpacks
    ["medic01"] = { cost = 500, itemTemplate = "object/tangible/medicine/crafted/crafted_stimpack_sm_s1_a.iff", message = "Thank you! You have purchased a Stimpack A." },
    ["medic02"] = { cost = 1000, itemTemplate = "object/tangible/medicine/crafted/crafted_stimpack_sm_s1_b.iff", message = "Thank you! You have purchased a Stimpack B." },
    ["medic03"] = { cost = 2000, itemTemplate = "object/tangible/medicine/crafted/crafted_stimpack_sm_s1_c.iff", message = "Thank you! You have purchased a Stimpack C." },
    ["medic04"] = { cost = 5000, itemTemplate = "object/tangible/medicine/crafted/crafted_stimpack_sm_s1_d.iff", message = "Thank you! You have purchased a Stimpack D." },
    ["medic05"] = { cost = 10000, itemTemplate = "object/tangible/medicine/crafted/crafted_stimpack_sm_s1_e.iff", message = "Thank you! You have purchased a Stimpack E." },
    -- Action Wound Packs
    ["medic06"] = { cost = 1000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_action_a.iff", message = "Thank you! You have purchased an Action Wound Pack A." },
    ["medic07"] = { cost = 2000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_action_b.iff", message = "Thank you! You have purchased an Action Wound Pack B." },
    ["medic08"] = { cost = 3000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_action_c.iff", message = "Thank you! You have purchased an Action Wound Pack C." },
    ["medic09"] = { cost = 4000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_action_d.iff", message = "Thank you! You have purchased an Action Wound Pack D." },
    ["medic10"] = { cost = 5000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_action_e.iff", message = "Thank you! You have purchased an Action Wound Pack E." },
    -- Health Wound Packs
    ["medic11"] = { cost = 1000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_health_a.iff", message = "Thank you! You have purchased a Health Wound Pack A." },
    ["medic12"] = { cost = 2000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_health_b.iff", message = "Thank you! You have purchased a Health Wound Pack B." },
    ["medic13"] = { cost = 3000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_health_c.iff", message = "Thank you! You have purchased a Health Wound Pack C." },
    ["medic14"] = { cost = 4000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_health_d.iff", message = "Thank you! You have purchased a Health Wound Pack D." },
    ["medic15"] = { cost = 5000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_health_e.iff", message = "Thank you! You have purchased a Health Wound Pack E." },
    -- Constitution Wound Packs
    ["medic16"] = { cost = 1000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_constitution_a.iff", message = "Thank you! You have purchased a Constitution Wound Pack A." },
    ["medic17"] = { cost = 2000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_constitution_b.iff", message = "Thank you! You have purchased a Constitution Wound Pack B." },
    ["medic18"] = { cost = 3000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_constitution_c.iff", message = "Thank you! You have purchased a Constitution Wound Pack C." },
    ["medic19"] = { cost = 4000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_constitution_d.iff", message = "Thank you! You have purchased a Constitution Wound Pack D." },
    ["medic20"] = { cost = 5000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_constitution_e.iff", message = "Thank you! You have purchased a Constitution Wound Pack E." },
    -- Quickness Wound Packs
    ["medic21"] = { cost = 1000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_quickness_a.iff", message = "Thank you! You have purchased a Quickness Wound Pack A." },
    ["medic22"] = { cost = 2000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_quickness_b.iff", message = "Thank you! You have purchased a Quickness Wound Pack B." },
    ["medic23"] = { cost = 3000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_quickness_c.iff", message = "Thank you! You have purchased a Quickness Wound Pack C." },
    ["medic24"] = { cost = 4000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_quickness_d.iff", message = "Thank you! You have purchased a Quickness Wound Pack D." },
    ["medic25"] = { cost = 5000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_quickness_e.iff", message = "Thank you! You have purchased a Quickness Wound Pack E." },
    -- Stamina Wound Packs
    ["medic26"] = { cost = 1000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_stamina_a.iff", message = "Thank you! You have purchased a Stamina Wound Pack A." },
    ["medic27"] = { cost = 2000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_stamina_b.iff", message = "Thank you! You have purchased a Stamina Wound Pack B." },
    ["medic28"] = { cost = 3000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_stamina_c.iff", message = "Thank you! You have purchased a Stamina Wound Pack C." },
    ["medic29"] = { cost = 4000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_stamina_d.iff", message = "Thank you! You have purchased a Stamina Wound Pack D." },
    ["medic30"] = { cost = 5000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_stamina_e.iff", message = "Thank you! You have purchased a Stamina Wound Pack E." },
    -- Strength Wound Packs
    ["medic31"] = { cost = 1000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_strength_a.iff", message = "Thank you! You have purchased a Strength Wound Pack A." },
    ["medic32"] = { cost = 2000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_strength_b.iff", message = "Thank you! You have purchased a Strength Wound Pack B." },
    ["medic33"] = { cost = 3000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_strength_c.iff", message = "Thank you! You have purchased a Strength Wound Pack C." },
    ["medic34"] = { cost = 4000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_strength_d.iff", message = "Thank you! You have purchased a Strength Wound Pack D." },
    ["medic35"] = { cost = 5000, itemTemplate = "object/tangible/medicine/crafted/medpack_wound_strength_e.iff", message = "Thank you! You have purchased a Strength Wound Pack E." },
    -- Wearables
    ["wearables01"] = { cost = 5000, itemTemplate = "object/tangible/wearables/backpack/backpack_s01.iff", message = "Thank you! You have purchased a Backpack." },

    -- Factory Deeds
    ["factory01"] = { cost = 100000, itemTemplate = "object/tangible/deed/factory_deed/factory_structure_deed.iff", message = "Thank you! You have purchased a Structure Factory Deed." },
    ["factory02"] = { cost = 100000, itemTemplate = "object/tangible/deed/factory_deed/factory_clothing_deed.iff", message = "Thank you! You have purchased a Clothing Factory Deed." },
    ["factory03"] = { cost = 100000, itemTemplate = "object/tangible/deed/factory_deed/factory_item_deed.iff", message = "Thank you! You have purchased an Item Factory Deed." },
    ["factory04"] = { cost = 100000, itemTemplate = "object/tangible/deed/factory_deed/factory_food_deed.iff", message = "Thank you! You have purchased a Food Factory Deed." },

    -- Harvester Deeds
    ["harvester01"] = { cost = 150000, itemTemplate = "object/tangible/deed/harvester_deed/harvester_ore_heavy_deed.iff", message = "Thank you! You have purchased a Heavy Ore Harvester Deed." },
    ["harvester02"] = { cost = 150000, itemTemplate = "object/tangible/deed/harvester_deed/harvester_flora_deed_heavy.iff", message = "Thank you! You have purchased a Heavy Flora Harvester Deed." },
    ["harvester03"] = { cost = 150000, itemTemplate = "object/tangible/deed/harvester_deed/harvester_gas_deed_heavy.iff", message = "Thank you! You have purchased a Heavy Gas Harvester Deed." },
    ["harvester04"] = { cost = 150000, itemTemplate = "object/tangible/deed/harvester_deed/harvester_moisture_deed_heavy.iff", message = "Thank you! You have purchased a Heavy Moisture Harvester Deed." },
    ["harvester05"] = { cost = 150000, itemTemplate = "object/tangible/deed/harvester_deed/harvester_liquid_deed_heavy.iff", message = "Thank you! You have purchased a Heavy Liquid Harvester Deed." },

    -- Generator Deeds
    ["generator01"] = { cost = 75000, itemTemplate = "object/tangible/deed/generator_deed/generator_fusion_deed.iff", message = "Thank you! You have purchased a Fusion Generator Deed." },
    ["generator02"] = { cost = 50000, itemTemplate = "object/tangible/deed/generator_deed/generator_solar_deed.iff", message = "Thank you! You have purchased a Solar Generator Deed." },
    ["generator03"] = { cost = 40000, itemTemplate = "object/tangible/deed/generator_deed/generator_wind_deed.iff", message = "Thank you! You have purchased a Wind Generator Deed." },
    ["generator04"] = { cost = 60000, itemTemplate = "object/tangible/deed/generator_deed/generator_photo_bio_deed.iff", message = "Thank you! You have purchased a Photo-Bio Generator Deed." },

    -- RESTRUCTURED PLAYER CITY DEEDS START HERE
    -- Generic Deeds
    ["guildhall_generic_01"] = { cost = 500000, itemTemplate = "object/tangible/deed/guild_deed/generic_guild_deed.iff", message = "Thank you! You have purchased a Generic Guild Hall Deed." },
    ["house_generic_large_01"] = { cost = 250000, itemTemplate = "object/tangible/deed/player_house_deed/generic_house_large_deed.iff", message = "Thank you! You have purchased a Large Generic House Deed (Style 01)." },
    ["house_generic_large_02"] = { cost = 250000, itemTemplate = "object/tangible/deed/player_house_deed/generic_house_large_style_02_deed.iff", message = "Thank you! You have purchased a Large Generic House Deed (Style 02)." },
    ["house_generic_medium_01"] = { cost = 200000, itemTemplate = "object/tangible/deed/player_house_deed/generic_house_medium_deed.iff", message = "Thank you! You have purchased a Medium Generic House Deed (Style 01)." },
    ["house_generic_medium_02"] = { cost = 200000, itemTemplate = "object/tangible/deed/player_house_deed/generic_house_medium_style_02_deed.iff", message = "Thank you! You have purchased a Medium Generic House Deed (Style 02)." },
    ["house_generic_small_01"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/generic_house_small_deed.iff", message = "Thank you! You have purchased a Small Generic House Deed (Style 01)." },
    ["house_generic_small_fp02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/generic_house_small_floor_02_deed.iff", message = "Thank you! You have purchased a Small Generic House Deed (Floorplan 2)." },
    ["house_generic_small_02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/generic_house_small_style_02_deed.iff", message = "Thank you! You have purchased a Small Generic House Deed (Style 02)." },
    ["house_generic_small_fp02_02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/generic_house_small_style_02_floor_02_deed.iff", message = "Thank you! You have purchased a Small Generic House Deed (Style 02, Floorplan 2)." },
    ["garden_dantooine_large_01"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_dantooine_lrg_01_deed.iff", message = "Thank you! You have purchased a Large Dantooine Garden." },
    ["garden_dantooine_medium_01"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_dantooine_med_01_deed.iff", message = "Thank you! You have purchased a Medium Dantooine Garden." },
    ["garden_dantooine_small_01"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_dantooine_sml_01_deed.iff", message = "Thank you! You have purchased a Small Dantooine Garden." },
    ["garden_dathomir_large_01"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_dathomir_lrg_01_deed.iff", message = "Thank you! You have purchased a Large Dathomir Garden." },
    ["garden_dathomir_medium_01"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_dathomir_med_01_deed.iff", message = "Thank you! You have purchased a Medium Dathomir Garden." },
    ["garden_dathomir_small_01"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_dathomir_sml_01_deed.iff", message = "Thank you! You have purchased a Small Dathomir Garden." },
    ["garden_endor_large_01"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_endor_lrg_01_deed.iff", message = "Thank you! You have purchased a Large Endor Garden." },
    ["garden_endor_medium_01"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_endor_med_01_deed.iff", message = "Thank you! You have purchased a Medium Endor Garden." },
    ["garden_endor_small_01"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_endor_sml_01_deed.iff", message = "Thank you! You have purchased a Small Endor Garden." },

    -- Corellia Deeds
    ["guildhall_corellia_01"] = { cost = 500000, itemTemplate = "object/tangible/deed/guild_deed/corellia_guild_deed.iff", message = "Thank you! You have purchased a Corellian Guild Hall Deed." },
    ["house_corellia_large_01"] = { cost = 250000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_large_deed.iff", message = "Thank you! You have purchased a Large Corellian House Deed (Style 01)." },
    ["house_corellia_large_02"] = { cost = 250000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_large_style_02_deed.iff", message = "Thank you! You have purchased a Large Corellian House Deed (Style 02)." },
    ["house_corellia_medium_01"] = { cost = 200000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_medium_deed.iff", message = "Thank you! You have purchased a Medium Corellian House Deed (Style 01)." },
    ["house_corellia_medium_02"] = { cost = 200000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_medium_style_02_deed.iff", message = "Thank you! You have purchased a Medium Corellian House Deed (Style 02)." },
    ["house_corellia_small_01"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_small_deed.iff", message = "Thank you! You have purchased a Small Corellian House Deed (Style 01)." },
    ["house_corellia_small_fp02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_small_floor_02_deed.iff", message = "Thank you! You have purchased a Small Corellian House Deed (Floorplan 2)." },
    ["house_corellia_small_02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_small_style_02_deed.iff", message = "Thank you! You have purchased a Small Corellian House Deed (Style 02)." },
    ["house_corellia_small_fp02_02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_small_style_02_floor_02_deed.iff", message = "Thank you! You have purchased a Small Corellian House Deed (Style 02, Floorplan 2)." },
    ["city_corellia_bank_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/bank_corellia_deed.iff", message = "Thank you! You have purchased a Corellia Bank Deed." },
    ["city_corellia_cantina_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/cantina_corellia_deed.iff", message = "Thank you! You have purchased a Corellia Cantina Deed." },
    ["city_corellia_garage_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/garage_corellia_deed.iff", message = "Thank you! You have purchased a Corellia Garage Deed." },
    ["city_corellia_cityhall_01"] = { cost = 500000, itemTemplate = "object/tangible/deed/city_deed/cityhall_corellia_deed.iff", message = "Thank you! You have purchased a Corellia City Hall Deed." },
    ["city_corellia_cloning_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/cloning_corellia_deed.iff", message = "Thank you! You have purchased a Corellia Cloning Center Deed." },
    ["city_corellia_hospital_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/hospital_corellia_deed.iff", message = "Thank you! You have purchased a Corellia Medical Center Deed." },
    ["garden_corellia_large_01"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_lrg_01_deed.iff", message = "Thank you! You have purchased a Large Corellia Garden (Style 1)." },
    ["garden_corellia_large_02"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_lrg_02_deed.iff", message = "Thank you! You have purchased a Large Corellia Garden (Style 2)." },
    ["garden_corellia_large_03"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_lrg_03_deed.iff", message = "Thank you! You have purchased a Large Corellia Garden (Style 3)." },
    ["garden_corellia_large_04"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_lrg_04_deed.iff", message = "Thank you! You have purchased a Large Corellia Garden (Style 4)." },
    ["garden_corellia_large_05"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_lrg_05_deed.iff", message = "Thank you! You have purchased a Large Corellia Garden (Style 5)." },
    ["garden_corellia_medium_01"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_med_01_deed.iff", message = "Thank you! You have purchased a Medium Corellia Garden (Style 1)." },
    ["garden_corellia_medium_02"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_med_02_deed.iff", message = "Thank you! You have purchased a Medium Corellia Garden (Style 2)." },
    ["garden_corellia_medium_03"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_med_03_deed.iff", message = "Thank you! You have purchased a Medium Corellia Garden (Style 3)." },
    ["garden_corellia_medium_04"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_med_04_deed.iff", message = "Thank you! You have purchased a Medium Corellia Garden (Style 4)." },
    ["garden_corellia_medium_05"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_med_05_deed.iff", message = "Thank you! You have purchased a Medium Corellia Garden (Style 5)." },
    ["garden_corellia_small_01"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_sml_01_deed.iff", message = "Thank you! You have purchased a Small Corellia Garden (Style 1)." },
    ["garden_corellia_small_02"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_sml_02_deed.iff", message = "Thank you! You have purchased a Small Corellia Garden (Style 2)." },
    ["garden_corellia_small_03"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_sml_03_deed.iff", message = "Thank you! You have purchased a Small Corellia Garden (Style 3)." },
    ["garden_corellia_small_04"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_sml_04_deed.iff", message = "Thank you! You have purchased a Small Corellia Garden (Style 4)." },
    ["garden_corellia_small_05"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_sml_05_deed.iff", message = "Thank you! You have purchased a Small Corellia Garden (Style 5)." },

    -- Naboo Deeds
    ["guildhall_naboo_01"] = { cost = 500000, itemTemplate = "object/tangible/deed/guild_deed/naboo_guild_deed.iff", message = "Thank you! You have purchased a Naboo Guild Hall Deed." },
    ["house_naboo_large_01"] = { cost = 250000, itemTemplate = "object/tangible/deed/player_house_deed/naboo_house_large_deed.iff", message = "Thank you! You have purchased a Large Naboo House Deed (Style 01)." },
    ["house_naboo_medium_01"] = { cost = 200000, itemTemplate = "object/tangible/deed/player_house_deed/naboo_house_medium_deed.iff", message = "Thank you! You have purchased a Medium Naboo House Deed (Style 01)." },
    ["house_naboo_small_01"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/naboo_house_small_deed.iff", message = "Thank you! You have purchased a Small Naboo House Deed (Style 01)." },
    ["house_naboo_small_02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/naboo_house_small_style_02_deed.iff", message = "Thank you! You have purchased a Small Naboo House Deed (Style 02)." },
    ["city_naboo_bank_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/bank_naboo_deed.iff", message = "Thank you! You have purchased a Naboo Bank Deed." },
    ["city_naboo_cantina_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/cantina_naboo_deed.iff", message = "Thank you! You have purchased a Naboo Cantina Deed." },
    ["city_naboo_garage_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/garage_naboo_deed.iff", message = "Thank you! You have purchased a Naboo Garage Deed." },
    ["city_naboo_cityhall_01"] = { cost = 500000, itemTemplate = "object/tangible/deed/city_deed/cityhall_naboo_deed.iff", message = "Thank you! You have purchased a Naboo City Hall Deed." },
    ["city_naboo_cloning_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/cloning_naboo_deed.iff", message = "Thank you! You have purchased a Naboo Cloning Center Deed." },
    ["city_naboo_hospital_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/hospital_naboo_deed.iff", message = "Thank you! You have purchased a Naboo Medical Center Deed." },
    ["garden_naboo_large_01"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_lrg_01_deed.iff", message = "Thank you! You have purchased a Large Naboo Garden (Style 1)." },
    ["garden_naboo_large_02"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_lrg_02_deed.iff", message = "Thank you! You have purchased a Large Naboo Garden (Style 2)." },
    ["garden_naboo_large_03"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_lrg_03_deed.iff", message = "Thank you! You have purchased a Large Naboo Garden (Style 3)." },
    ["garden_naboo_large_04"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_lrg_04_deed.iff", message = "Thank you! You have purchased a Large Naboo Garden (Style 4)." },
    ["garden_naboo_large_05"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_lrg_05_deed.iff", message = "Thank you! You have purchased a Large Naboo Garden (Style 5)." },
    ["garden_naboo_medium_01"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_med_01_deed.iff", message = "Thank you! You have purchased a Medium Naboo Garden (Style 1)." },
    ["garden_naboo_medium_02"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_med_02_deed.iff", message = "Thank you! You have purchased a Medium Naboo Garden (Style 2)." },
    ["garden_naboo_medium_03"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_med_03_deed.iff", message = "Thank you! You have purchased a Medium Naboo Garden (Style 3)." },
    ["garden_naboo_medium_04"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_med_04_deed.iff", message = "Thank you! You have purchased a Medium Naboo Garden (Style 4)." },
    ["garden_naboo_medium_05"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_med_05_deed.iff", message = "Thank you! You have purchased a Medium Naboo Garden (Style 5)." },
    ["garden_naboo_small_01"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_sml_01_deed.iff", message = "Thank you! You have purchased a Small Naboo Garden (Style 1)." },
    ["garden_naboo_small_02"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_sml_02_deed.iff", message = "Thank you! You have purchased a Small Naboo Garden (Style 2)." },
    ["garden_naboo_small_03"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_sml_03_deed.iff", message = "Thank you! You have purchased a Small Naboo Garden (Style 3)." },
    ["garden_naboo_small_04"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_sml_04_deed.iff", message = "Thank you! You have purchased a Small Naboo Garden (Style 4)." },
    ["garden_naboo_small_05"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_sml_05_deed.iff", message = "Thank you! You have purchased a Small Naboo Garden (Style 5)." },

    -- Tatooine Deeds
    ["guildhall_tatooine_01"] = { cost = 500000, itemTemplate = "object/tangible/deed/guild_deed/tatooine_guild_deed.iff", message = "Thank you! You have purchased a Tatooine Guild Hall Deed." },
    ["guildhall_tatooine_02"] = { cost = 500000, itemTemplate = "object/tangible/deed/guild_deed/tatooine_guild_style_02_deed.iff", message = "Thank you! You have purchased a Tatooine Guild Hall (Style 2) Deed." },
    ["house_tatooine_large_01"] = { cost = 250000, itemTemplate = "object/tangible/deed/player_house_deed/tatooine_house_large_deed.iff", message = "Thank you! You have purchased a Large Tatooine House Deed (Style 01)." },
    ["house_tatooine_medium_01"] = { cost = 200000, itemTemplate = "object/tangible/deed/player_house_deed/tatooine_house_medium_deed.iff", message = "Thank you! You have purchased a Medium Tatooine House Deed (Style 01)." },
    ["house_tatooine_small_01"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/tatooine_house_small_deed.iff", message = "Thank you! You have purchased a Small Tatooine House Deed (Style 01)." },
    ["house_tatooine_small_02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/tatooine_house_small_style_02_deed.iff", message = "Thank you! You have purchased a Small Tatooine House Deed (Style 02)." },
    ["city_tatooine_bank_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/bank_tatooine_deed.iff", message = "Thank you! You have purchased a Tatooine Bank Deed." },
    ["city_tatooine_cantina_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/cantina_tatooine_deed.iff", message = "Thank you! You have purchased a Tatooine Cantina Deed." },
    ["city_tatooine_garage_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/garage_tatooine_deed.iff", message = "Thank you! You have purchased a Tatooine Garage Deed." },
    ["city_tatooine_cityhall_01"] = { cost = 500000, itemTemplate = "object/tangible/deed/city_deed/cityhall_tatooine_deed.iff", message = "Thank you! You have purchased a Tatooine City Hall Deed." },
    ["city_tatooine_cloning_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/cloning_tatooine_deed.iff", message = "Thank you! You have purchased a Tatooine Cloning Center Deed." },
    ["city_tatooine_hospital_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/hospital_tatooine_deed.iff", message = "Thank you! You have purchased a Tatooine Hospital Deed." },
    ["garden_tatooine_large_01"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_lrg_01_deed.iff", message = "Thank you! You have purchased a Large Tatooine Garden (Style 1)." },
    ["garden_tatooine_large_02"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_lrg_02_deed.iff", message = "Thank you! You have purchased a Large Tatooine Garden (Style 2)." },
    ["garden_tatooine_large_03"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_lrg_03_deed.iff", message = "Thank you! You have purchased a Large Tatooine Garden (Style 3)." },
    ["garden_tatooine_large_04"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_lrg_04_deed.iff", message = "Thank you! You have purchased a Large Tatooine Garden (Style 4)." },
    ["garden_tatooine_large_05"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_lrg_05_deed.iff", message = "Thank you! You have purchased a Large Tatooine Garden (Style 5)." },
    ["garden_tatooine_medium_01"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_med_01_deed.iff", message = "Thank you! You have purchased a Medium Tatooine Garden (Style 1)." },
    ["garden_tatooine_medium_02"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_med_02_deed.iff", message = "Thank you! You have purchased a Medium Tatooine Garden (Style 2)." },
    ["garden_tatooine_medium_03"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_med_03_deed.iff", message = "Thank you! You have purchased a Medium Tatooine Garden (Style 3)." },
    ["garden_tatooine_medium_04"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_med_04_deed.iff", message = "Thank you! You have purchased a Medium Tatooine Garden (Style 4)." },
    ["garden_tatooine_medium_05"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_med_05_deed.iff", message = "Thank you! You have purchased a Medium Tatooine Garden (Style 5)." },
    ["garden_tatooine_small_01"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_sml_01_deed.iff", message = "Thank you! You have purchased a Small Tatooine Garden (Style 1)." },
    ["garden_tatooine_small_02"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_sml_02_deed.iff", message = "Thank you! You have purchased a Small Tatooine Garden (Style 2)." },
    ["garden_tatooine_small_03"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_sml_03_deed.iff", message = "Thank you! You have purchased a Small Tatooine Garden (Style 3)." },
    ["garden_tatooine_small_04"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_sml_04_deed.iff", message = "Thank you! You have purchased a Small Tatooine Garden (Style 4)." },
    ["garden_tatooine_small_05"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_sml_05_deed.iff", message = "Thank you! You have purchased a Small Tatooine Garden (Style 5)." },
    -- END RESTRUCTURED PLAYER CITY DEEDS
}

-- The JediTrials:unlockJediKnight function definition
-- It's crucial that this function is defined BEFORE it is called in getNextConversationScreen.
-- Since it's in the same file, this placement is fine.
-- No 'require' needed for JediTrials if it's defined here.
-- You will need to ensure JediTrials.COUNCIL_LIGHT and JediTrials.COUNCIL_DARK are defined
-- somewhere (perhaps at the top of this file, or a global utility script).
JediTrials = JediTrials or {} -- Ensure JediTrials table exists, in case it's not global
JediTrials.COUNCIL_LIGHT = 1 -- Example value, confirm in your actual JediTrials.lua
JediTrials.COUNCIL_DARK = 2  -- Example value, confirm in your actual JediTrials.lua

-- Define the getJediCouncil function if it's not global or included elsewhere
-- This is a placeholder, as the actual logic might be complex.
-- If getJediCouncil is in your JediTrials.lua, and you want to keep them separate,
-- then you would *re-add* the includeFile("../screenplays/jedi/jedi_trials.lua") at the top.
-- If it's *not* in a separate file, you need its definition here.
if (JediTrials.getJediCouncil == nil) then
    function JediTrials:getJediCouncil(pPlayer)
        -- Placeholder for actual logic
        -- This should return either self.COUNCIL_LIGHT or self.COUNCIL_DARK
        -- For testing, you might just return one for now.
        -- For example, always return light for testing:
        -- return self.COUNCIL_LIGHT
        -- Or, if your server uses FRS factions for this:
        local pGhost = CreatureObject(pPlayer):getPlayerObject()
        if (pGhost ~= nil) then
            local frsFaction = PlayerObject(pGhost):getFrsCouncil()
            if (frsFaction == 1) then -- Assuming 1 is light, confirm with your FRS system
                return self.COUNCIL_LIGHT
            elseif (frsFaction == 2) then -- Assuming 2 is dark, confirm with your FRS system
                return self.COUNCIL_DARK
            end
        end
        return nil -- Or a default
    end
end

-- Define FACTIONREBEL and FACTIONIMPERIAL if not global
FACTIONREBEL = FACTIONREBEL or 1 -- Example, confirm actual enum/global value
FACTIONIMPERIAL = FACTIONIMPERIAL or 2 -- Example, confirm actual enum/global value


function JediTrials:unlockJediKnight(pPlayer)
    if (pPlayer == nil) then
        return
    end

    local pGhost = CreatureObject(pPlayer):getPlayerObject()

    if (pGhost == nil) then
        return
    end

    local knightRobe, unlockMusic, unlockString, enclaveLoc, enclaveName, jediState, setFactionVal, skillForceRank
    -- Use 'self' because getJediCouncil is part of the JediTrials table
    local councilType = self:getJediCouncil(pPlayer)

    if (councilType == self.COUNCIL_LIGHT) then
        knightRobe = "object/tangible/wearables/robe/robe_jedi_light_s01.iff"
        unlockMusic = "sound/music_become_light_jedi.snd"
        unlockString = "@jedi_trials:knight_trials_completed_light"
        enclaveLoc = { -5575, 4905, "yavin4" }
        enclaveName = "Light Jedi Enclave"
        jediState = 4
        setFactionVal = FACTIONREBEL
    elseif (councilType == self.COUNCIL_DARK) then
        knightRobe = "object/tangible/wearables/robe/robe_jedi_dark_s01.iff"
        unlockMusic = "sound/music_become_dark_jedi.snd"
        unlockString = "@jedi_trials:knight_trials_completed_dark"
        enclaveLoc = { 5079, 305, "yavin4" }
        enclaveName = "Dark Jedi Enclave"
        jediState = 8
        setFactionVal = FACTIONIMPERIAL
    else
        printLuaError("Invalid council type in JediTrials:unlockJediKnight for " .. CreatureObject(pPlayer):getFirstName())
        return
    end

    awardSkill(pPlayer, "force_title_jedi_rank_03")
    writeScreenPlayData(pPlayer, "KnightTrials", "completedTrials", 1)
    CreatureObject(pPlayer):playMusicMessage(unlockMusic)
    playClientEffectLoc(pPlayer, "clienteffect/trap_electric_01.cef", CreatureObject(pPlayer):getZoneName(), CreatureObject(pPlayer):getPositionX(), CreatureObject(pPlayer):getPositionZ(), CreatureObject(pPlayer):getPositionY(), CreatureObject(pPlayer):getParentID())

    PlayerObject(pGhost):addWaypoint(enclaveLoc[3], enclaveName, "", enclaveLoc[1], 0, enclaveLoc[2], WAYPOINT_YELLOW, true, true, 0)
    PlayerObject(pGhost):setJediState(jediState)
    PlayerObject(pGhost):setFrsCouncil(councilType)
    PlayerObject(pGhost):setFrsRank(0)
    CreatureObject(pPlayer):setFactionStatus(2) -- Overt
    CreatureObject(pPlayer):setFaction(setFactionVal)

    local sui = SuiMessageBox.new("JediTrials", "emptyCallback") -- No callback
    sui.setTitle("@jedi_trials:knight_trials_title")
    sui.setPrompt(unlockString)
    sui.sendTo(pPlayer)

    local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

    if (pInventory == nil or SceneObject(pInventory):isContainerFullRecursive()) then
        CreatureObject(pPlayer):sendSystemMessage("@jedi_spam:inventory_full_jedi_robe")
    else
        giveItem(pInventory, knightRobe, -1)
    end
end


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

        -- Check for inventory space first (only if it's a physical item being given)
        if (not itemToPurchase.isJediUnlock and SceneObject(pInventory):isContainerFullRecursive()) then
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

        -- Give the item or perform the action (Jedi Unlock)
        if (itemToPurchase.isBuff) then
            CreatureObject(conversingPlayer):enhanceCharacter()
        elseif (itemToPurchase.isJediUnlock) then
            -- Call the JediTrials:unlockJediKnight function
            -- Since it's defined in this same file, it's directly accessible.
            JediTrials:unlockJediKnight(conversingPlayer)
        else
            -- Handle deeds and regular items.
            -- Special handling for resources if you add them later.
            if (itemToPurchase.resourceName and itemToPurchase.quantity) then
                local resourceObject = giveItem(pInventory, itemToPurchase.itemTemplate, -1)
                if (resourceObject ~= nil) then
                    local luaResource = LuaSceneObject(resourceObject)
                    luaResource:setResourceName(itemToPurchase.resourceName)
                    luaResource:setQuantity(itemToPurchase.quantity)
                else
                    creature:sendSystemMessage("Error creating resource item. Please contact an administrator.")
                end
            else
                giveItem(pInventory, itemToPurchase.itemTemplate, -1)
            end
        end

        -- Send the confirmation message to the player's chat.
        creature:sendSystemMessage(itemToPurchase.message)

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
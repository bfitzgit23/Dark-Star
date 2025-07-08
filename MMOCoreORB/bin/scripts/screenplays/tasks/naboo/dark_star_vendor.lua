-- scripts/screenplays/dark_star_vendor_task.lua

-- IMPORTANT: Adjust the path below to where your JediTrials.lua file is located.
-- For example, if it's in scripts/screenplays/jedi/JediTrials.lua, the path below is likely correct.
-- If your JediTrials:unlockJediKnight function is truly within the *same* file as dark_star_vendor_task.lua,
-- you would *not* need the 'require' line. However, best practice is to keep them separate.
JediTrials = require("scripts.screenplays.jedi.JediTrials")

-- Include necessary manager files (if you have them)
-- includeFile("../managers/loot_manager.lua")

dark_star_vendor_convo_handler = ScreenPlay:new {
    screenplayName = "dark_star_vendor_convo_handler",
    -- Optional: You can define any initial setup for your vendor here
}

registerScreenPlay("dark_star_vendor_convo_handler", true)

-- Define the items available for sale and their properties
local itemsForSale = {
    -- Buffs
    ["buffs01"] = { cost = 15000, isBuff = true, message = "You have received your 3-hour Medical and Entertainment buffs." },

    -- Weapons (Ranged Starter)
    ["weapon01"] = { cost = 5000, itemTemplate = "object/weapon/ranged/pistol/pistol_cdef.iff", message = "You have purchased a CDEF Pistol." },
    ["weapon02"] = { cost = 5000, itemTemplate = "object/weapon/ranged/carbine/carbine_cdef.iff", message = "You have purchased a CDEF Carbine." },
    ["weapon03"] = { cost = 5000, itemTemplate = "object/weapon/ranged/rifle/rifle_cdef.iff", message = "You have purchased a CDEF Rifle." },

    -- Weapons (Ranged Advanced)
    ["weapon04"] = { cost = 15000, itemTemplate = "object/weapon/ranged/pistol/pistol_dh17.iff", message = "You have purchased a DH17 Pistol." },
    ["weapon05"] = { cost = 15000, itemTemplate = "object/weapon/ranged/carbine/carbine_dh17.iff", message = "You have purchased a DH17 Carbine." },
    ["weapon06"] = { cost = 15000, itemTemplate = "object/weapon/ranged/rifle/rifle_dlt20a.iff", message = "You have purchased a DLT20a Rifle." },

    -- Weapons (Melee Advanced)
    ["weapon07"] = { cost = 25000, itemTemplate = "object/weapon/melee/2h_sword/gaderiffi_baton.iff", message = "You have purchased a Gaderiffi Baton." },
    ["weapon08"] = { cost = 50000, itemTemplate = "object/weapon/melee/1h_sword/sword_stun_baton.iff", message = "You have purchased a Stun Baton." },
    ["weapon09"] = { cost = 25000, itemTemplate = "object/weapon/melee/axe/vibro_axe_long.iff", message = "You have purchased a Long Vibro Axe." },
    ["weapon10"] = { cost = 25000, itemTemplate = "object/weapon/melee/2h_sword/sword_2h_curved.iff", message = "You have purchased a Two-handed Curved Sword." },
    ["weapon11"] = { cost = 25000, itemTemplate = "object/weapon/melee/knuckler/knuckler_vibro.iff", message = "You have purchased a Vibro Knuckler." },

    -- Weapons (Melee Starter)
    ["weapon12"] = { cost = 5000, itemTemplate = "object/weapon/melee/knife/knife_survival.iff", message = "You have purchased a Survival Knife." },
    ["weapon13"] = { cost = 5000, itemTemplate = "object/weapon/melee/2h_staff/staff_wooden.iff", message = "You have purchased a Wooden Staff." },
    ["weapon14"] = { cost = 5000, itemTemplate = "object/weapon/melee/axe/axe_heavy.iff", message = "You have purchased a Heavy-Duty Axe." },

    -- Armor
    ["armor01"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_s01_helm.iff", message = "You have purchased a Composite Helm." },
    ["armor02"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_s01_chest_plate.iff", message = "You have purchased a Composite Chest Plate." },
    ["armor03"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_s01_leggings.iff", message = "You have purchased Composite Leggings." },
    ["armor04"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_s01_boots.iff", message = "You have purchased Composite Boots." },
    ["armor05"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_s01_bicep_r.iff", message = "You have purchased a Composite Right Bicep." },
    ["armor06"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_s01_bicep_l.iff", message = "You have purchased a Composite Left Bicep." },
    ["armor07"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_s01_bracer_r.iff", message = "You have purchased a Composite Right Bracer." },
    ["armor08"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_s01_bracer_l.iff", message = "You have purchased a Composite Left Bracer." },
    ["armor09"] = { cost = 5000, itemTemplate = "object/tangible/wearables/armor/composite/armor_composite_s01_gloves.iff", message = "You have purchased Composite Gloves." },

    -- Deeds
    ["deeds01"] = { cost = 200000, itemTemplate = "object/tangible/deed/resource_deed/resource_deed_10k.iff", message = "You have purchased a 10k Resource Deed." },
    ["deeds02"] = { cost = 15000, itemTemplate = "object/tangible/deed/vehicle_deed/speederbike_flitknot_deed.iff", message = "You have purchased a Speeder Bike Deed." },

    -- Food
    ["food01"] = { cost = 15000, itemTemplate = "object/tangible/food/crafted/dessert/pikatta_pie.iff", message = "You have purchased a Pikatta Pie." },
    ["food02"] = { cost = 15000, itemTemplate = "object/tangible/food/crafted/dessert/pyollian_cake.iff", message = "You have purchased a Pyollian Cake." },
    ["food03"] = { cost = 15000, itemTemplate = "object/tangible/food/crafted/main/bivoli_tempari.iff", message = "You have purchased Bivoli Tempari." },
    ["food04"] = { cost = 15000, itemTemplate = "object/tangible/food/crafted/main/synthsteak.iff", message = "You have purchased Synthsteak." },
    ["food05"] = { cost = 15000, itemTemplate = "object/tangible/food/crafted/side/thakitillo.iff", message = "You have purchased Thakitillo." },

    -- Drinks
    ["food06"] = { cost = 15000, itemTemplate = "object/tangible/food/crafted/drink/bespin_port.iff", message = "You have purchased Bespin Port." },
    ["food07"] = { cost = 15000, itemTemplate = "object/tangible/food/crafted/drink/ithorian_mist.iff", message = "You have purchased Ithorian Mist." },

    -- Jedi Items
    ["jedi01"] = { cost = 25000, itemTemplate = "object/tangible/jedi/jedi_holocron_dark.iff", message = "Thank you! You have purchased a Sith Holocron." },
    ["jedi02"] = { cost = 25000, itemTemplate = "object/tangible/jedi/jedi_holocron_light.iff", message = "Thank you! You have purchased a Jedi Holocron." },
    -- NEW: Entry for Jedi Knight Unlock - Note the 'isJediUnlock' flag
    ["jedi_unlock_knight"] = { cost = 100000, message = "Congratulations! You have unlocked Jedi Knight status!", isJediUnlock = true },

    -- Medic (Stims)
    ["medic01"] = { cost = 500, itemTemplate = "object/tangible/medicine/stimpack/stimpack_a.iff", message = "You purchased a StimPack A." },
    ["medic02"] = { cost = 1000, itemTemplate = "object/tangible/medicine/stimpack/stimpack_b.iff", message = "You purchased a StimPack B." },
    ["medic03"] = { cost = 2000, itemTemplate = "object/tangible/medicine/stimpack/stimpack_c.iff", message = "You purchased a StimPack C." },
    ["medic04"] = { cost = 5000, itemTemplate = "object/tangible/medicine/stimpack/stimpack_d.iff", message = "You purchased a StimPack D." },
    ["medic05"] = { cost = 10000, itemTemplate = "object/tangible/medicine/stimpack/stimpack_e.iff", message = "You purchased a StimPack E." },

    -- Medic (Wound Treatment - Action)
    ["medic06"] = { cost = 1000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_action_a.iff", message = "You purchased an Action Wound Pack A." },
    ["medic07"] = { cost = 2000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_action_b.iff", message = "You purchased an Action Wound Pack B." },
    ["medic08"] = { cost = 3000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_action_c.iff", message = "You purchased an Action Wound Pack C." },
    ["medic09"] = { cost = 4000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_action_d.iff", message = "You purchased an Action Wound Pack D." },
    ["medic10"] = { cost = 5000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_action_e.iff", message = "You purchased an Action Wound Pack E." },

    -- Medic (Wound Treatment - Health)
    ["medic11"] = { cost = 1000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_health_a.iff", message = "You purchased a Health Wound Pack A." },
    ["medic12"] = { cost = 2000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_health_b.iff", message = "You purchased a Health Wound Pack B." },
    ["medic13"] = { cost = 3000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_health_c.iff", message = "You purchased a Health Wound Pack C." },
    ["medic14"] = { cost = 4000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_health_d.iff", message = "You purchased a Health Wound Pack D." },
    ["medic15"] = { cost = 5000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_health_e.iff", message = "You purchased a Health Wound Pack E." },

    -- Medic (Wound Treatment - Constitution)
    ["medic16"] = { cost = 1000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_constitution_a.iff", message = "You purchased a Constitution Wound Pack A." },
    ["medic17"] = { cost = 2000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_constitution_b.iff", message = "You purchased a Constitution Wound Pack B." },
    ["medic18"] = { cost = 3000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_constitution_c.iff", message = "You purchased a Constitution Wound Pack C." },
    ["medic19"] = { cost = 4000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_constitution_d.iff", message = "You purchased a Constitution Wound Pack D." },
    ["medic20"] = { cost = 5000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_constitution_e.iff", message = "You purchased a Constitution Wound Pack E." },

    -- Medic (Wound Treatment - Quickness)
    ["medic21"] = { cost = 1000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_quickness_a.iff", message = "You purchased a Quickness Wound Pack A." },
    ["medic22"] = { cost = 2000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_quickness_b.iff", message = "You purchased a Quickness Wound Pack B." },
    ["medic23"] = { cost = 3000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_quickness_c.iff", message = "You purchased a Quickness Wound Pack C." },
    ["medic24"] = { cost = 4000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_quickness_d.iff", message = "You purchased a Quickness Wound Pack D." },
    ["medic25"] = { cost = 5000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_quickness_e.iff", message = "You purchased a Quickness Wound Pack E." },

    -- Medic (Wound Treatment - Stamina)
    ["medic26"] = { cost = 1000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_stamina_a.iff", message = "You purchased a Stamina Wound Pack A." },
    ["medic27"] = { cost = 2000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_stamina_b.iff", message = "You purchased a Stamina Wound Pack B." },
    ["medic28"] = { cost = 3000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_stamina_c.iff", message = "You purchased a Stamina Wound Pack C." },
    ["medic29"] = { cost = 4000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_stamina_d.iff", message = "You purchased a Stamina Wound Pack D." },
    ["medic30"] = { cost = 5000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_stamina_e.iff", message = "You purchased a Stamina Wound Pack E." },

    -- Medic (Wound Treatment - Strength)
    ["medic31"] = { cost = 1000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_strength_a.iff", message = "You purchased a Strength Wound Pack A." },
    ["medic32"] = { cost = 2000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_strength_b.iff", message = "You purchased a Strength Wound Pack B." },
    ["medic33"] = { cost = 3000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_strength_c.iff", message = "You purchased a Strength Wound Pack C." },
    ["medic34"] = { cost = 4000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_strength_d.iff", message = "You purchased a Strength Wound Pack D." },
    ["medic35"] = { cost = 5000, itemTemplate = "object/tangible/medicine/wound_pack/wound_pack_strength_e.iff", message = "You purchased a Strength Wound Pack E." },

    -- Wearables
    ["wearables01"] = { cost = 5000, itemTemplate = "object/tangible/wearables/backpack/backpack_s01.iff", message = "You have purchased a Backpack." },

    -- Factories
    ["factory01"] = { cost = 100000, itemTemplate = "object/tangible/deed/factory_deed/structure_factory_deed.iff", message = "You purchased a Structure Factory Deed." },
    ["factory02"] = { cost = 100000, itemTemplate = "object/tangible/deed/factory_deed/clothing_factory_deed.iff", message = "You purchased a Clothing Factory Deed." },
    ["factory03"] = { cost = 100000, itemTemplate = "object/tangible/deed/factory_deed/item_factory_deed.iff", message = "You purchased an Item Factory Deed." },
    ["factory04"] = { cost = 100000, itemTemplate = "object/tangible/deed/factory_deed/food_factory_deed.iff", message = "You purchased a Food Factory Deed." },

    -- Harvesters
    ["harvester01"] = { cost = 150000, itemTemplate = "object/tangible/deed/harvester_deed/harvester_heavy_ore.iff", message = "You purchased a Heavy Ore Harvester Deed." },
    ["harvester02"] = { cost = 150000, itemTemplate = "object/tangible/deed/harvester_deed/harvester_heavy_flora.iff", message = "You purchased a Heavy Flora Harvester Deed." },
    ["harvester03"] = { cost = 150000, itemTemplate = "object/tangible/deed/harvester_deed/harvester_heavy_gas.iff", message = "You purchased a Heavy Gas Harvester Deed." },
    ["harvester04"] = { cost = 150000, itemTemplate = "object/tangible/deed/harvester_deed/harvester_heavy_moisture.iff", message = "You purchased a Heavy Moisture Harvester Deed." },
    ["harvester05"] = { cost = 150000, itemTemplate = "object/tangible/deed/harvester_deed/harvester_heavy_liquid.iff", message = "You purchased a Heavy Liquid Harvester Deed." },

    -- Generators
    ["generator01"] = { cost = 75000, itemTemplate = "object/tangible/deed/power_generator_deed/fusion_generator_deed.iff", message = "You purchased a Fusion Generator Deed." },
    ["generator02"] = { cost = 50000, itemTemplate = "object/tangible/deed/power_generator_deed/solar_generator_deed.iff", message = "You purchased a Solar Generator Deed." },
    ["generator03"] = { cost = 40000, itemTemplate = "object/tangible/deed/power_generator_deed/wind_generator_deed.iff", message = "You purchased a Wind Generator Deed." },
    ["generator04"] = { cost = 60000, itemTemplate = "object/tangible/deed/power_generator_deed/photobioreactor_generator_deed.iff", message = "You purchased a Photo Bio Generator Deed." },

    -- Player City Deeds - Generic
    ["guildhall_generic_01"] = { cost = 500000, itemTemplate = "object/tangible/deed/guildhall_deed/guildhall_generic_deed_01.iff", message = "You purchased a Generic Guild Hall Deed." },
    ["house_generic_large_01"] = { cost = 250000, itemTemplate = "object/tangible/deed/player_house_deed/house_generic_large_deed.iff", message = "You purchased a Large Generic House Deed." },
    ["house_generic_large_02"] = { cost = 250000, itemTemplate = "object/tangible/deed/player_house_deed/house_generic_large_deed_s02.iff", message = "You purchased a Large Generic House Deed (Style 2)." },
    ["house_generic_medium_01"] = { cost = 200000, itemTemplate = "object/tangible/deed/player_house_deed/house_generic_medium_deed.iff", message = "You purchased a Medium Generic House Deed." },
    ["house_generic_medium_02"] = { cost = 200000, itemTemplate = "object/tangible/deed/player_house_deed/house_generic_medium_deed_s02.iff", message = "You purchased a Medium Generic House Deed (Style 2)." },
    ["house_generic_small_01"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/house_generic_small_deed.iff", message = "You purchased a Small Generic House Deed." },
    ["house_generic_small_fp02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/house_generic_small_fp02_deed.iff", message = "You purchased a Small Generic House Deed Floorplan 2." },
    ["house_generic_small_02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/house_generic_small_deed_s02.iff", message = "You purchased a Small Generic House Deed (Style 2)." },
    ["house_generic_small_fp02_02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/house_generic_small_fp02_deed_s02.iff", message = "You purchased a Small Generic House Deed Floorplan 2 (Style 2)." },
    ["garden_dantooine_large_01"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_dantooine_large_deed_01.iff", message = "You purchased a Large Dantooine Garden Deed." },
    ["garden_dantooine_medium_01"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_dantooine_medium_deed_01.iff", message = "You purchased a Medium Dantooine Garden Deed." },
    ["garden_dantooine_small_01"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_dantooine_small_deed_01.iff", message = "You purchased a Small Dantooine Garden Deed." },
    ["garden_dathomir_large_01"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_dathomir_large_deed_01.iff", message = "You purchased a Large Dathomir Garden Deed." },
    ["garden_dathomir_medium_01"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_dathomir_medium_deed_01.iff", message = "You purchased a Medium Dathomir Garden Deed." },
    ["garden_dathomir_small_01"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_dathomir_small_deed_01.iff", message = "You purchased a Small Dathomir Garden Deed." },
    ["garden_endor_large_01"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_endor_large_deed_01.iff", message = "You purchased a Large Endor Garden Deed." },
    ["garden_endor_medium_01"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_endor_medium_deed_01.iff", message = "You purchased a Medium Endor Garden Deed." },
    ["garden_endor_small_01"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_endor_small_deed_01.iff", message = "You purchased a Small Endor Garden Deed." },

    -- Player City Deeds - Corellia
    ["guildhall_corellia_01"] = { cost = 500000, itemTemplate = "object/tangible/deed/guildhall_deed/guildhall_corellia_deed_01.iff", message = "You purchased a Corellian Guild Hall Deed." },
    ["house_corellia_large_01"] = { cost = 250000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_large_deed.iff", message = "You purchased a Large Corellian House Deed." },
    ["house_corellia_large_02"] = { cost = 250000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_large_deed_s02.iff", message = "You purchased a Large Corellian House Deed (Style 2)." },
    ["house_corellia_medium_01"] = { cost = 200000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_medium_deed.iff", message = "You purchased a Medium Corellian House Deed." },
    ["house_corellia_medium_02"] = { cost = 200000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_medium_deed_s02.iff", message = "You purchased a Medium Corellian House Deed (Style 2)." },
    ["house_corellia_small_01"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_small_deed.iff", message = "You purchased a Small Corellian House Deed." },
    ["house_corellia_small_fp02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_small_fp02_deed.iff", message = "You purchased a Small Corellian House Deed Floorplan 2." },
    ["house_corellia_small_02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_small_deed_s02.iff", message = "You purchased a Small Corellian House Deed (Style 2)." },
    ["house_corellia_small_fp02_02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/corellia_house_small_fp02_deed_s02.iff", message = "You purchased a Small Corellian House Deed Floorplan 2 (Style 2)." },
    ["city_corellia_bank_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/corellia_bank_deed_01.iff", message = "You purchased a Corellia Bank Deed." },
    ["city_corellia_cantina_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/corellia_cantina_deed_01.iff", message = "You purchased a Corellia Cantina Deed." },
    ["city_corellia_garage_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/corellia_garage_deed_01.iff", message = "You purchased a Corellia Garage Deed." },
    ["shuttleport01"] = { cost = 400000, itemTemplate = "object/tangible/deed/city_deed/corellia_shuttleport_deed_01.iff", message = "You purchased a Corellia Shuttleport Deed." },
    ["city_corellia_cityhall_01"] = { cost = 500000, itemTemplate = "object/tangible/deed/city_deed/corellia_cityhall_deed_01.iff", message = "You purchased a Corellia City Hall Deed." },
    ["city_corellia_cloning_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/corellia_cloning_center_deed_01.iff", message = "You purchased a Corellia Cloning Center Deed." },
    ["city_corellia_hospital_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/corellia_hospital_deed_01.iff", message = "You purchased a Corellia Medical Center Deed." },
    ["theater01"] = { cost = 300000, itemTemplate = "object/tangible/deed/city_deed/corellia_theater_deed_01.iff", message = "You purchased a Corellia Theater Deed." },
    ["garden_corellia_large_01"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_large_deed_01.iff", message = "You purchased a Large Corellia Garden (Style 1) Deed." },
    ["garden_corellia_large_02"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_large_deed_02.iff", message = "You purchased a Large Corellia Garden (Style 2) Deed." },
    ["garden_corellia_large_03"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_large_deed_03.iff", message = "You purchased a Large Corellia Garden (Style 3) Deed." },
    ["garden_corellia_large_04"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_large_deed_04.iff", message = "You purchased a Large Corellia Garden (Style 4) Deed." },
    ["garden_corellia_large_05"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_large_deed_05.iff", message = "You purchased a Large Corellia Garden (Style 5) Deed." },
    ["garden_corellia_medium_01"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_medium_deed_01.iff", message = "You purchased a Medium Corellia Garden (Style 1) Deed." },
    ["garden_corellia_medium_02"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_medium_deed_02.iff", message = "You purchased a Medium Corellia Garden (Style 2) Deed." },
    ["garden_corellia_medium_03"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_medium_deed_03.iff", message = "You purchased a Medium Corellia Garden (Style 3) Deed." },
    ["garden_corellia_medium_04"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_medium_deed_04.iff", message = "You purchased a Medium Corellia Garden (Style 4) Deed." },
    ["garden_corellia_medium_05"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_medium_deed_05.iff", message = "You purchased a Medium Corellia Garden (Style 5) Deed." },
    ["garden_corellia_small_01"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_small_deed_01.iff", message = "You purchased a Small Corellia Garden (Style 1) Deed." },
    ["garden_corellia_small_02"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_small_deed_02.iff", message = "You purchased a Small Corellia Garden (Style 2) Deed." },
    ["garden_corellia_small_03"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_small_deed_03.iff", message = "You purchased a Small Corellia Garden (Style 3) Deed." },
    ["garden_corellia_small_04"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_small_deed_04.iff", message = "You purchased a Small Corellia Garden (Style 4) Deed." },
    ["garden_corellia_small_05"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_corellia_small_deed_05.iff", message = "You purchased a Small Corellia Garden (Style 5) Deed." },

    -- Player City Deeds - Naboo
    ["guildhall_naboo_01"] = { cost = 500000, itemTemplate = "object/tangible/deed/guildhall_deed/guildhall_naboo_deed_01.iff", message = "You purchased a Naboo Guild Hall Deed." },
    ["house_naboo_large_01"] = { cost = 250000, itemTemplate = "object/tangible/deed/player_house_deed/naboo_house_large_deed.iff", message = "You purchased a Large Naboo House Deed." },
    ["house_naboo_medium_01"] = { cost = 200000, itemTemplate = "object/tangible/deed/player_house_deed/naboo_house_medium_deed.iff", message = "You purchased a Medium Naboo House Deed (Style 01)." },
    ["house_naboo_small_01"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/naboo_house_small_deed.iff", message = "You purchased a Small Naboo House Deed." },
    ["house_naboo_small_02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/naboo_house_small_deed_s02.iff", message = "You purchased a Small Naboo House Deed (Style 2)." },
    ["city_naboo_bank_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/naboo_bank_deed_01.iff", message = "You purchased a Naboo Bank Deed." },
    ["city_naboo_cantina_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/naboo_cantina_deed_01.iff", message = "You purchased a Naboo Cantina Deed." },
    ["city_naboo_garage_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/naboo_garage_deed_01.iff", message = "You purchased a Naboo Garage Deed." },
    ["shuttleport02"] = { cost = 400000, itemTemplate = "object/tangible/deed/city_deed/naboo_shuttleport_deed_01.iff", message = "You purchased a Naboo Shuttleport Deed." },
    ["city_naboo_cityhall_01"] = { cost = 500000, itemTemplate = "object/tangible/deed/city_deed/naboo_cityhall_deed_01.iff", message = "You purchased a Naboo City Hall Deed." },
    ["city_naboo_cloning_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/naboo_cloning_center_deed_01.iff", message = "You purchased a Naboo Cloning Center Deed." },
    ["city_naboo_hospital_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/naboo_hospital_deed_01.iff", message = "You purchased a Naboo Medical Center Deed." },
    ["theater02"] = { cost = 300000, itemTemplate = "object/tangible/deed/city_deed/naboo_theater_deed_01.iff", message = "You purchased a Naboo Theater Deed." },
    ["garden_naboo_large_01"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_large_deed_01.iff", message = "You purchased a Large Naboo Garden (Style 1) Deed." },
    ["garden_naboo_large_02"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_large_deed_02.iff", message = "You purchased a Large Naboo Garden (Style 2) Deed." },
    ["garden_naboo_large_03"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_large_deed_03.iff", message = "You purchased a Large Naboo Garden (Style 3) Deed." },
    ["garden_naboo_large_04"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_large_deed_04.iff", message = "You purchased a Large Naboo Garden (Style 4) Deed." },
    ["garden_naboo_large_05"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_large_deed_05.iff", message = "You purchased a Large Naboo Garden (Style 5) Deed." },
    ["garden_naboo_medium_01"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_medium_deed_01.iff", message = "You purchased a Medium Naboo Garden (Style 1) Deed." },
    ["garden_naboo_medium_02"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_medium_deed_02.iff", message = "You purchased a Medium Naboo Garden (Style 2) Deed." },
    ["garden_naboo_medium_03"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_medium_deed_03.iff", message = "You purchased a Medium Naboo Garden (Style 3) Deed." },
    ["garden_naboo_medium_04"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_medium_deed_04.iff", message = "You purchased a Medium Naboo Garden (Style 4) Deed." },
    ["garden_naboo_medium_05"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_medium_deed_05.iff", message = "You purchased a Medium Naboo Garden (Style 5) Deed." },
    ["garden_naboo_small_01"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_small_deed_01.iff", message = "You purchased a Small Naboo Garden (Style 1) Deed." },
    ["garden_naboo_small_02"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_small_deed_02.iff", message = "You purchased a Small Naboo Garden (Style 2) Deed." },
    ["garden_naboo_small_03"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_small_deed_03.iff", message = "You purchased a Small Naboo Garden (Style 3) Deed." },
    ["garden_naboo_small_04"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_small_deed_04.iff", message = "You purchased a Small Naboo Garden (Style 4) Deed." },
    ["garden_naboo_small_05"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_naboo_small_deed_05.iff", message = "You purchased a Small Naboo Garden (Style 5) Deed." },

    -- Player City Deeds - Tatooine
    ["guildhall_tatooine_01"] = { cost = 500000, itemTemplate = "object/tangible/deed/guildhall_deed/guildhall_tatooine_deed_01.iff", message = "You purchased a Tatooine Guild Hall Deed." },
    ["guildhall_tatooine_02"] = { cost = 500000, itemTemplate = "object/tangible/deed/guildhall_deed/guildhall_tatooine_deed_02.iff", message = "You purchased a Tatooine Guild Hall (Style 2) Deed." },
    ["house_tatooine_large_01"] = { cost = 250000, itemTemplate = "object/tangible/deed/player_house_deed/tatooine_house_large_deed.iff", message = "You purchased a Large Tatooine House Deed." },
    ["house_tatooine_medium_01"] = { cost = 200000, itemTemplate = "object/tangible/deed/player_house_deed/tatooine_house_medium_deed.iff", message = "You purchased a Medium Tatooine House Deed." },
    ["house_tatooine_small_01"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/tatooine_house_small_deed.iff", message = "You purchased a Small Tatooine House Deed." },
    ["house_tatooine_small_02"] = { cost = 150000, itemTemplate = "object/tangible/deed/player_house_deed/tatooine_house_small_deed_s02.iff", message = "You purchased a Small Tatooine House Deed (Style 2)." },
    ["city_tatooine_bank_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/tatooine_bank_deed_01.iff", message = "You purchased a Tatooine Bank Deed." },
    ["city_tatooine_cantina_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/tatooine_cantina_deed_01.iff", message = "You purchased a Tatooine Cantina Deed." },
    ["city_tatooine_garage_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/tatooine_garage_deed_01.iff", message = "You purchased a Tatooine Garage Deed." },
    ["shuttleport03"] = { cost = 400000, itemTemplate = "object/tangible/deed/city_deed/tatooine_shuttleport_deed_01.iff", message = "You purchased a Tatooine Shuttleport Deed." },
    ["city_tatooine_cityhall_01"] = { cost = 500000, itemTemplate = "object/tangible/deed/city_deed/tatooine_cityhall_deed_01.iff", message = "You purchased a Tatooine City Hall Deed." },
    ["city_tatooine_cloning_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/tatooine_cloning_center_deed_01.iff", message = "You purchased a Tatooine Cloning Center Deed." },
    ["city_tatooine_hospital_01"] = { cost = 350000, itemTemplate = "object/tangible/deed/city_deed/tatooine_hospital_deed_01.iff", message = "You purchased a Tatooine Medical Center Deed." },
    ["theater03"] = { cost = 300000, itemTemplate = "object/tangible/deed/city_deed/tatooine_theater_deed_01.iff", message = "You purchased a Tatooine Theater Deed." },
    ["garden_tatooine_large_01"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_large_deed_01.iff", message = "You purchased a Large Tatooine Garden (Style 1) Deed." },
    ["garden_tatooine_large_02"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_large_deed_02.iff", message = "You purchased a Large Tatooine Garden (Style 2) Deed." },
    ["garden_tatooine_large_03"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_large_deed_03.iff", message = "You purchased a Large Tatooine Garden (Style 3) Deed." },
    ["garden_tatooine_large_04"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_large_deed_04.iff", message = "You purchased a Large Tatooine Garden (Style 4) Deed." },
    ["garden_tatooine_large_05"] = { cost = 100000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_large_deed_05.iff", message = "You purchased a Large Tatooine Garden (Style 5) Deed." },
    ["garden_tatooine_medium_01"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_medium_deed_01.iff", message = "You purchased a Medium Tatooine Garden (Style 1) Deed." },
    ["garden_tatooine_medium_02"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_medium_deed_02.iff", message = "You purchased a Medium Tatooine Garden (Style 2) Deed." },
    ["garden_tatooine_medium_03"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_medium_deed_03.iff", message = "You purchased a Medium Tatooine Garden (Style 3) Deed." },
    ["garden_tatooine_medium_04"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_medium_deed_04.iff", message = "You purchased a Medium Tatooine Garden (Style 4) Deed." },
    ["garden_tatooine_medium_05"] = { cost = 75000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_medium_deed_05.iff", message = "You purchased a Medium Tatooine Garden (Style 5) Deed." },
    ["garden_tatooine_small_01"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_small_deed_01.iff", message = "You purchased a Small Tatooine Garden (Style 1) Deed." },
    ["garden_tatooine_small_02"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_small_deed_02.iff", message = "You purchased a Small Tatooine Garden (Style 2) Deed." },
    ["garden_tatooine_small_03"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_small_deed_03.iff", message = "You purchased a Small Tatooine Garden (Style 3) Deed." },
    ["garden_tatooine_small_04"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_small_deed_04.iff", message = "You purchased a Small Tatooine Garden (Style 4) Deed." },
    ["garden_tatooine_small_05"] = { cost = 50000, itemTemplate = "object/tangible/deed/city_deed/garden_tatooine_small_deed_05.iff", message = "You purchased a Small Tatooine Garden (Style 5) Deed." },
}

-- JediTrials function is assumed to be defined in scripts/screenplays/jedi/JediTrials.lua
-- and loaded by the 'require' call above. If it's directly in this file for some reason,
-- then remove the 'require' and ensure the function definition is here.
-- For the purpose of generating the *complete* file as requested, and assuming it was within
-- this file previously, I will include it here. However, *best practice* is to separate it.
-- If it's *not* meant to be in this file, remove it from below and ensure your JediTrials.lua
-- file is correctly loaded by the 'require' statement above.

function JediTrials:unlockJediKnight(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	local knightRobe, unlockMusic, unlockString, enclaveLoc, enclaveName, jediState, setFactionVal, skillForceRank
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
		printLuaError("Invalid council type in JediTrials:unlockJediKnight")
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


-- Main conversation handler
function dark_star_vendor_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
    -- This line gets the screen object based on the selectedOption (which is the screen ID)
    local screen = conversationTemplate:getScreen(selectedOption)
    local screenName = screen:getID()

    -- For screens that just navigate (like main menus, back buttons)
    if (itemsForSale[screenName] == nil) then
        return screen
    end

    local creature = CreatureObject(conversingPlayer)
    local pInventory = creature:getSlottedObject("inventory")

    if (pInventory == nil) then
        return conversationTemplate:getScreen("insufficient_space") -- Use your specific screen ID
    end

    local itemToPurchase = itemsForSale[screenName]

    -- Check if player has enough credits
    if (creature:getCashCredits() < itemToPurchase.cost) then
        creature:sendSystemMessage("You do not have enough credits for this purchase.")
        return conversationTemplate:getScreen("insufficient_funds") -- Use your specific screen ID
    end

    -- Check if inventory is full (only applies to physical items, not unlocks)
    if (not itemToPurchase.isJediUnlock and SceneObject(pInventory):isContainerFullRecursive()) then
        creature:sendSystemMessage("Your inventory is full. Please make some space and try again.")
        return conversationTemplate:getScreen("insufficient_space") -- Use your specific screen ID
    end

    -- Deduct credits
    creature:subtractCashCredits(itemToPurchase.cost)

    -- Handle different types of purchases
    if (itemToPurchase.isJediUnlock) then
        -- This is the Jedi Knight unlock
        if (JediTrials ~= nil and JediTrials.unlockJediKnight ~= nil) then
            JediTrials:unlockJediKnight(conversingPlayer)
            creature:sendSystemMessage(itemToPurchase.message) -- Send success message
            return conversationTemplate:getScreen("purchase_complete") -- Use your specific screen ID
        else
            creature:sendSystemMessage("Error: Jedi Knight unlock service is currently unavailable. Please contact an administrator.")
            return conversationTemplate:getScreen("failure_screen") -- Fallback to a generic failure or add a specific one
        end
    else
        -- Handle giving a physical item (or resource)
        if (itemToPurchase.itemTemplate) then -- Check if it's a template to give
            if (itemToPurchase.resourceName and itemToPurchase.quantity) then
                -- Handle resources
                local resourceObject = giveItem(pInventory, itemToPurchase.itemTemplate, -1)
                if (resourceObject ~= nil) then
                    local luaResource = LuaSceneObject(resourceObject)
                    luaResource:setResourceName(itemToPurchase.resourceName)
                    luaResource:setQuantity(itemToPurchase.quantity)
                    creature:sendSystemMessage(itemToPurchase.message)
                    return conversationTemplate:getScreen("purchase_complete") -- Use your specific screen ID
                else
                    creature:sendSystemMessage("Error creating resource item. Please contact an administrator.")
                    return conversationTemplate:getScreen("failure_screen") -- Fallback
                end
            else
                -- Handle standard item templates
                local givenItem = giveItem(pInventory, itemToPurchase.itemTemplate, -1)
                if (givenItem ~= nil) then
                    creature:sendSystemMessage(itemToPurchase.message)
                    return conversationTemplate:getScreen("purchase_complete") -- Use your specific screen ID
                else
                    creature:sendSystemMessage("Error giving item. Please contact an administrator.")
                    return conversationTemplate:getScreen("failure_screen") -- Fallback
                end
            end
        else -- No itemTemplate, just a message (e.g., if you had an option for a free info message)
             creature:sendSystemMessage(itemToPurchase.message)
             return conversationTemplate:getScreen("purchase_complete")
        end
    end
end
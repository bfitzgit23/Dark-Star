local SpaceHelpers = require("utils.space_helpers")

imperialBrokerConvoHandler = conv_handler:new {}

-- Helper function to add conversation screens dynamically
local function addImperialBrokerScreens(convoTemplate)
    -- Initial recruitment for Neutrals becoming Imperial Pilots (if not already pilot)
    convoTemplate:addScreen("recruiting_male", "What are you looking for, citizen? Perhaps a place in the Imperial Navy?",
        {"Yes, Commander.", "yes_recruiting_male"},
        {"No, just checking.", "no_just_checking_male"})

    convoTemplate:addScreen("recruiting_female", "Well hello there, citizen. What can I do for you? Looking to join the Imperial Navy perhaps?",
        {"Yes, Commander.", "yes_recruiting_female"},
        {"No, just checking.", "no_just_checking_female"})

    convoTemplate:addScreen("recruiting_neutral", "Greetings. Are you here to inquire about Imperial pilot recruitment?",
        {"Yes, Commander.", "yes_neutral_recruit"},
        {"No, just checking.", "no_just_checking"})

    -- Initial Imperial Pilot welcome / choice of squadron/actions
    convoTemplate:addScreen("hello_imperial_pilot", "Welcome back, pilot. How may I assist you today? Are you interested in a specific squadron, or do you need to discuss something else?",
        {"Tell me about Black Epsilon Squadron.", "join_black_epsilon_squadron"},
        {"Tell me about Storm Squadron.", "storm_squadron"},
        {"Tell me about the Imperial Inquisition.", "imperial_inquisition"},
        {"I wish to retire from pilot duties.", "request_retire"},
        {"Goodbye.", "goodbye"})

    -- Joining Black Epsilon Squadron (from hello_imperial_pilot)
    convoTemplate:addScreen("join_black_epsilon_squadron", "Black Epsilon Squadron represents the Empire's elite stealth and reconnaissance division. We operate behind enemy lines, gathering intelligence and striking where the enemy least expects it. Do you have what it takes to join our ranks?",
        {"I am ready to serve Black Epsilon!", "imperial_yes_im_ready"},
        {"Perhaps another time.", "goodbye"})

    -- Initial first mission screen (after joining Imperial or Black Epsilon)
    convoTemplate:addScreen("imperial_yes_im_ready", "Excellent. Your first assignment awaits. Are you ready to serve the Empire?",
        {"Yes, Commander! For the Empire!", "imperial_first_assignment_start"},
        {"Not at the moment, Commander.", "goodbye"})

    -- No Ship screen for Imperial pilots
    convoTemplate:addScreen("imperial_no_ship", "Welcome to the Imperial Navy, pilot! First, you'll need a ship. Here are your ship control codes for a basic Imperial fighter. Once you have it, report back to me for your first assignment.",
        {"Thank you, Commander. I'm ready to begin.", "imperial_yes_im_ready"})

    -- Player has an active mission from Imperial Broker
    convoTemplate:addScreen("imperial_has_mission", "You already have an active assignment, pilot. Complete it before asking for another.",
        {"Understood, Commander.", "goodbye"})

    -- Player completed all Tier 1 skills, ready for next trainer
    convoTemplate:addScreen("imperial_completed_tier1", "Impressive work, pilot. You've completed your initial training. You are now ready for more specialized Imperial piloting skills. Seek out an advanced Imperial flight instructor.",
        {"I will, Commander.", "goodbye"})

    -- Player needs more training in Tier 1 skills
    convoTemplate:addScreen("imperial_more_training", "You still have more to learn, pilot. What area would you like to focus on?",
        {"Never mind.", "goodbye"}) -- Options will be dynamically added in runScreenHandlers

    -- Imperial Duty Missions
    convoTemplate:addScreen("imperial_duty_missions", "Duty calls, pilot. Are you ready for a new assignment?",
        {"I'll take a destruction duty mission.", "imperial_destroy_duty"},
        {"I'll take an escort duty mission.", "imperial_escort_duty"},
        {"Not at this time, Commander.", "goodbye"})

    -- Quest completion screens
    convoTemplate:addScreen("imperial_excellent_work", "Excellent work, pilot. You've proven your loyalty and skill. Report for your next assignment.",
        {"Ready for the next mission, Commander!", "imperial_train_me2"})

    convoTemplate:addScreen("imperial_excellent_work2", "Your dedication is commendable. The Empire is pleased with your progress. Prepare for your next task.",
        {"Ready for the next mission, Commander!", "imperial_train_me3"})

    convoTemplate:addScreen("imperial_excellent_work3", "Outstanding, pilot! You are proving to be a valuable asset to the Imperial Navy. Proceed with your next orders.",
        {"Ready for the next mission, Commander!", "imperial_train_me4"})

    convoTemplate:addScreen("imperial_missions_complete", "You have completed all initial assignments. Your record with Black Epsilon Squadron is exemplary. The Empire will not forget your service. Seek out higher command for further opportunities.",
        {"Thank you, Commander. What now?", "goodbye"})

    -- Player has first quest active, the mission giver will offer assistance
    convoTemplate:addScreen("imperial_first_assignment", "Your current assignment is still active, pilot. Focus on completing that. I can offer limited assistance if needed.",
        {"Understood.", "goodbye"})

    -- Specific duty mission start screens (these lead directly to quest start, no further options here)
    convoTemplate:addScreen("imperial_destroy_duty", "Alright, pilot. Your destruction duty mission is ready. Return when complete.", {})
    convoTemplate:addScreen("imperial_escort_duty", "Understood. Your escort duty mission is now assigned. Good luck, pilot.", {})

    -- Rebel dialogue and general dismissal (using direct text)
    convoTemplate:addScreen("rebel_player", "You are a known Rebel sympathizer. I have no business with you.",
        {"I understand.", "stop_bothering"},
        {"I'm interested in piloting.", "pilot_rebel"})

    convoTemplate:addScreen("get_lost_", "I've told you before, get lost! We have nothing to discuss.",
        {"Very well.", "i_dont_think_so"})

    convoTemplate:addScreen("no_business", "I'm afraid I don't have any business with your kind of pilot. Perhaps you should try elsewhere.",
        {"I don't think so.", "i_dont_think"})

    convoTemplate:addScreen("neutral_female", "You seem... lost. What brings you to this Imperial outpost?",
        {"I'm interested in Imperial pilot recruitment.", "yes_neutral_recruit"},
        {"Just looking around.", "no_just_checking"})

    convoTemplate:addScreen("neutral_wookiee", "A Wookiee, here? That's unusual. What do you want?",
        {"I'm interested in Imperial pilot recruitment.", "yes_neutral_recruit"},
        {"Just looking around.", "no_just_checking"})

    convoTemplate:addScreen("greet_neutral", "Greetings, citizen. What can I do for you?",
        {"I'm interested in Imperial pilot recruitment.", "yes_neutral_recruit"},
        {"Just looking around.", "no_just_checking"})

    convoTemplate:addScreen("greet_male_imp", "Hail, Imperial citizen! What can I do for you today?",
        {"I'm interested in pilot recruitment.", "recruiting_male"},
        {"Something else.", "something_else_male"})

    convoTemplate:addScreen("greet_female_imp", "Greetings, Imperial citizen. How may I be of service?",
        {"I'm interested in pilot recruitment.", "recruiting_female"},
        {"Something else.", "something_else_female"})

    convoTemplate:addScreen("something_else_male", "Is there something else, citizen?",
        {"I'm interested in pilot recruitment.", "recruiting_male"},
        {"Goodbye.", "goodbye"})

    convoTemplate:addScreen("something_else_female", "Do you have another matter to discuss, citizen?",
        {"I'm interested in pilot recruitment.", "recruiting_female"},
        {"Goodbye.", "goodbye"})

    -- Retirement Screens (using direct text)
    convoTemplate:addScreen("request_retire", "Are you certain you wish to retire from Imperial service? This is a serious matter.",
        {"Yes, I want to retire.", "want_retirement"},
        {"No, I've changed my mind.", "goodbye"})

    convoTemplate:addScreen("want_retirement", "Very well. If you choose this path, all your pilot skills will be removed, and you will no longer be an Imperial Navy pilot. There is no going back. Are you absolutely sure?",
        {"Yes, I am sure. Retire me.", "confirm_retirement"},
        {"No, I've changed my mind.", "goodbye"})

    convoTemplate:addScreen("confirm_retirement", "Understood. Your service record has been updated. You are hereby discharged from Imperial pilot duties. You may leave.",
        {"Goodbye.", "goodbye"})

    -- Common exit screen
    convoTemplate:addScreen("goodbye", "Understood. Safe travels, citizen.", {})

    -- New direct screens for Imperial training options (these were originally STF options)
    convoTemplate:addScreen("pilot_wookiee", "The Empire has no use for a Wookiee pilot.", {"Goodbye.", "goodbye"})
    convoTemplate:addScreen("pilot_rebel", "Your rebel sympathies make you unsuitable for Imperial pilot training.", {"Goodbye.", "goodbye"})
    convoTemplate:addScreen("pilot_female", "Your rebel sympathies make you unsuitable for Imperial pilot training.", {"Goodbye.", "goodbye"})

    convoTemplate:addScreen("stop_bothering", "I've told you before, get lost!", {"Goodbye.", "goodbye"})
    convoTemplate:addScreen("i_dont_think_so", "Very well. Let me know if you change your mind.", {"Goodbye.", "goodbye"})
    convoTemplate:addScreen("i_dont_think", "As you wish. Perhaps you'll find what you're looking for elsewhere.", {"Goodbye.", "goodbye"})
end

function imperialBrokerConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
    addImperialBrokerScreens(convoTemplate) -- IMPORTANT: Add screens at the start of getInitialScreen

	local faction = CreatureObject(pPlayer):getFaction()
	local playerFactionStatus = CreatureObject(pPlayer):getFactionStatus()
	local playerID = CreatureObject(pPlayer):getObjectID()
	local playerGender = CreatureObject(pPlayer):getGender()

	-- Player is Rebel Pilot
	if (SpaceHelpers:isRebelPilot(pPlayer)) then
		if (readData(playerID .. ":ImperialBroker:rebel:") == 1) then
			CreatureObject(pNpc):doAnimation("wave_on_dismissing")
			return convoTemplate:getScreen("get_lost_")
		else
			return convoTemplate:getScreen("rebel_player")
		end
	-- Player is a general pilot (not Imperial)
	elseif (SpaceHelpers:isPilot(pPlayer) and not SpaceHelpers:isImperialPilot(pPlayer)) then
		return convoTemplate:getScreen("no_business")
	end

	-- Check if player is an Imperial Pilot and part of Black Epsilon Squadron
	local isImperialPilot = SpaceHelpers:isImperialPilot(pPlayer)
	local isBlackEpsilonSquadron = SpaceHelpers:isBlackEpsilonSquadron(pPlayer)
	local hasShip = SpaceHelpers:hasCertifiedShip(pPlayer, true)

	-- These variables will now refer to the globally registered BlackEpsilonSquadronScreenplay and its quests
	local questOneStarted = SpaceHelpers:isSpaceQuestActive(pPlayer, BlackEpsilonSquadronScreenplay.QUEST_STRING_1.type, BlackEpsilonSquadronScreenplay.QUEST_STRING_1.name)
	local questTwoStarted = SpaceHelpers:isSpaceQuestActive(pPlayer, BlackEpsilonSquadronScreenplay.QUEST_STRING_2.type, BlackEpsilonSquadronScreenplay.QUEST_STRING_2.name)
	local questThreeStarted = SpaceHelpers:isSpaceQuestActive(pPlayer, BlackEpsilonSquadronScreenplay.QUEST_STRING_3.type, BlackEpsilonSquadronScreenplay.QUEST_STRING_3.name)
	local questFourStarted = SpaceHelpers:isSpaceQuestActive(pPlayer, BlackEpsilonSquadronScreenplay.QUEST_STRING_4.type, BlackEpsilonSquadronScreenplay.QUEST_STRING_4.name)

	local questOneComplete = SpaceHelpers:isSpaceQuestComplete(pPlayer, BlackEpsilonSquadronScreenplay.QUEST_STRING_1.type, BlackEpsilonSquadronScreenplay.QUEST_STRING_1.name) and SpaceHelpers:isSpaceQuestComplete(pPlayer, BlackEpsilonSquadronScreenplay.QUEST_STRING_1_SIDE.type, BlackEpsilonSquadronScreenplay.QUEST_STRING_1_SIDE.name)
	local questTwoComplete = SpaceHelpers:isSpaceQuestComplete(pPlayer, BlackEpsilonSquadronScreenplay.QUEST_STRING_2.type, BlackEpsilonSquadronScreenplay.QUEST_STRING_2.name)
	local questThreeComplete = SpaceHelpers:isSpaceQuestComplete(pPlayer, BlackEpsilonSquadronScreenplay.QUEST_STRING_3.type, BlackEpsilonSquadronScreenplay.QUEST_STRING_3.name) and SpaceHelpers:isSpaceQuestComplete(pPlayer, BlackEpsilonSquadronScreenplay.QUEST_STRING_3_SIDE.type, BlackEpsilonSquadronScreenplay.QUEST_STRING_3_SIDE.name)
	local questFourComplete = SpaceHelpers:isSpaceQuestComplete(pPlayer, BlackEpsilonSquadronScreenplay.QUEST_STRING_4.type, BlackEpsilonSquadronScreenplay.QUEST_STRING_4.name)

	local destroyDutyStarted = SpaceHelpers:isSpaceQuestActive(pPlayer, BlackEpsilonSquadronScreenplay.QUEST_STRING_DUTY_4_1.type, BlackEpsilonSquadronScreenplay.QUEST_STRING_DUTY_4_1.name)
	local escortDutyStarted = SpaceHelpers:isSpaceQuestActive(pPlayer, BlackEpsilonSquadronScreenplay.QUEST_STRING_DUTY_4_2.type, BlackEpsilonSquadronScreenplay.QUEST_STRING_DUTY_4_2.name)

	local destroyDutyComplete = SpaceHelpers:isSpaceQuestComplete(pPlayer, BlackEpsilonSquadronScreenplay.QUEST_STRING_DUTY_4_1.type, BlackEpsilonSquadronScreenplay.QUEST_STRING_DUTY_4_1.name)
	local escortDutyComplete = SpaceHelpers:isSpaceQuestComplete(pPlayer, BlackEpsilonSquadronScreenplay.QUEST_STRING_DUTY_4_2.type, BlackEpsilonSquadronScreenplay.QUEST_STRING_DUTY_4_2.name)

	-- If player is an Imperial Pilot and part of Black Epsilon Squadron
	if (isImperialPilot and isBlackEpsilonSquadron) then
        -- Check to ensure player has a starter ship or one they can use
        if (not hasShip and not questOneStarted) then
            return convoTemplate:getScreen("imperial_no_ship")
        end
		-- Player has an active quest from the Broker
		if ((questTwoStarted and not questTwoComplete) or (questThreeStarted and not questThreeComplete) or (questFourStarted and not questFourComplete) or (destroyDutyStarted and not destroyDutyComplete) or (escortDutyStarted and not escortDutyComplete)) then
			return convoTemplate:getScreen("imperial_has_mission")
		-- Check if players have all the tier1 skill boxes, send them to next trainer.
		elseif (SpaceHelpers:hasCompletedPilotTier(pPlayer, "imperial_navy", 1)) then
			return convoTemplate:getScreen("imperial_completed_tier1")
		-- Player is a Black Epsilon pilot and has at least one of the Tier1 skill boxes
		elseif (SpaceHelpers:hasPilotTierSkill(pPlayer, "imperial_navy", 1)) then
			-- Check if the player can be trained in the remaining Tier1 Skills
			if (SpaceHelpers:hasExperienceForTraining(pPlayer, 1)) then
				return convoTemplate:getScreen("imperial_more_training")
			-- Offer Duty missions
			else
				CreatureObject(pPlayer):doAnimation("salute1")
				return convoTemplate:getScreen("imperial_duty_missions")
			end
		-- Player has finished 4 and has received the reward, but needs to accept training of first pilot skill
		elseif (questFourComplete and getQuestStatus(playerID .. BlackEpsilonSquadronScreenplay.QUEST_STRING_4.name .. ":reward") == "1") then
			return convoTemplate:getScreen("imperial_missions_complete")
		-- Player has completed quest 4 and needs reward
		elseif (questFourComplete and getQuestStatus(playerID .. BlackEpsilonSquadronScreenplay.QUEST_STRING_4.name .. ":reward") ~= "1") then
			-- Give player the reward and update that they received it
			setQuestStatus(playerID .. BlackEpsilonSquadronScreenplay.QUEST_STRING_4.name .. ":reward", 1)
			-- Grant Reward
			assassinate_naboo_imperial_tier1_4a:rewardPlayer(pPlayer)
			return convoTemplate:getScreen("imperial_missions_complete")
		-- Player has finished 3, has received the reward and needs to start quest 4
		elseif (questThreeComplete and not questFourStarted and getQuestStatus(playerID .. BlackEpsilonSquadronScreenplay.QUEST_STRING_3.name .. ":reward") == "1") then
			return convoTemplate:getScreen("imperial_excellent_work3")
		-- Player has completed quest 3 and needs reward
		elseif (questThreeComplete and getQuestStatus(playerID .. BlackEpsilonSquadronScreenplay.QUEST_STRING_3.name .. ":reward") ~= "1") then
			-- Give player the reward and update that they received it
			setQuestStatus(playerID .. BlackEpsilonSquadronScreenplay.QUEST_STRING_3.name .. ":reward", 1)
			-- Grant Reward
			patrol_naboo_imperial_3:rewardPlayer(pPlayer)
			return convoTemplate:getScreen("imperial_excellent_work3")
		-- Player has finished 2, has received the reward and needs to start quest 3
		elseif (questTwoComplete and not questThreeStarted and getQuestStatus(playerID .. BlackEpsilonSquadronScreenplay.QUEST_STRING_2.name .. ":reward") == "1") then
			return convoTemplate:getScreen("imperial_excellent_work2")
		-- Player has completed quest 2 and needs reward
		elseif (questTwoComplete and getQuestStatus(playerID .. BlackEpsilonSquadronScreenplay.QUEST_STRING_2.name .. ":reward") ~= "1") then
			-- Give player the reward and update that they received it
			setQuestStatus(playerID .. BlackEpsilonSquadronScreenplay.QUEST_STRING_2.name .. ":reward", 1)
			-- Grant Reward
			destroy_naboo_imperial_2:rewardPlayer(pPlayer)
			return convoTemplate:getScreen("imperial_excellent_work2")
		-- Player has finished quest 1, has received the reward and needs to start quest 2
		elseif (questOneComplete and not questTwoStarted and getQuestStatus(playerID .. BlackEpsilonSquadronScreenplay.QUEST_STRING_1.name .. ":reward") == "1") then
			return convoTemplate:getScreen("imperial_excellent_work")
		-- Player has finished quest 1 and needs reward
		elseif (questOneComplete and getQuestStatus(playerID .. BlackEpsilonSquadronScreenplay.QUEST_STRING_1.name .. ":reward") ~= 1) then
			-- Give player the reward and update that they received it
			setQuestStatus(playerID .. BlackEpsilonSquadronScreenplay.QUEST_STRING_1.name .. ":reward", 1)
			-- Grant Reward
			patrol_naboo_imperial_1:rewardPlayer(pPlayer)
			return convoTemplate:getScreen("imperial_excellent_work")
		-- Player has first quest active, the mission giver will offer assistance
		elseif (questOneStarted and not questOneComplete) then
			return convoTemplate:getScreen("imperial_first_assignment")
		-- Player has failed or aborted the first quest, or ready to start the first quest
		elseif (not questOneComplete) then
			return convoTemplate:getScreen("imperial_yes_im_ready")
		end

	-- Player is Imperial but not yet assigned to a squadron or Black Epsilon specifically
	elseif (isImperialPilot and not isBlackEpsilonSquadron) then
		CreatureObject(pNpc):doAnimation("salute2")
		return convoTemplate:getScreen("hello_imperial_pilot")

	-- If the player is Imperial Faction but not a pilot yet, or on leave
	elseif (faction == FACTIONIMPERIAL and playerFactionStatus > ONLEAVE) then
		CreatureObject(pNpc):doAnimation("salute1")
		CreatureObject(pPlayer):doAnimation("salute1")

		-- Male imperial
		if (playerGender == 0) then
			return convoTemplate:getScreen("greet_male_imp")
		-- Female imperial
		else
			return convoTemplate:getScreen("greet_female_imp")
		end
	end

	-- Already conversed with broker (general neutral, or non-pilot Imperial who already saw recruit message)
	if (readData(playerID .. ":ImperialBroker:") == 1) then
		CreatureObject(pNpc):doAnimation("shrug_hands")
		-- Male
		if (playerGender == 0) then
			return convoTemplate:getScreen("something_else_male")
		-- Female
		else
			return convoTemplate:getScreen("something_else_female")
		end
	-- Neutral Female
	elseif (faction == FACTIONNEUTRAL and playerGender == 1) then
		CreatureObject(pNpc):doAnimation("point_away")
		return convoTemplate:getScreen("neutral_female")
	-- Neutral Wookiee
	elseif (CreatureObject(pPlayer):getSpecies() == SPECIES_WOOKIEE) then
		CreatureObject(pNpc):doAnimation("belly_laugh")
		return convoTemplate:getScreen("neutral_wookiee")
	end

	-- Default for fresh neutral players
	return convoTemplate:getScreen("greet_neutral")
end

function imperialBrokerConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	if (pPlayer == nil or pConvScreen == nil) then
		return
	end

	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()

	local pClonedScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pClonedScreen)

	-- Set player as conversation target
	clonedConversation:setDialogTextTU(CreatureObject(pPlayer):getFirstName())

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return pClonedScreen
	end

	local ghost = LuaPlayerObject(pGhost)

	if (ghost == nil) then
		return pClonedScreen
	end

	local playerGender = CreatureObject(pPlayer):getGender()

	-- Handle Imperial Pilot Recruitment / Joining Black Epsilon
	-- This block handles if a Neutral player decides to become an Imperial pilot through this broker.
	if (screenID == "yes_neutral_recruit" or screenID == "yes_recruiting_male" or screenID == "yes_recruiting_female") then
		CreatureObject(pNpc):doAnimation("explain")
		SpaceHelpers:grantNovicePilot(pPlayer, "imperialPilot")
		SpaceHelpers:setSquadronType(pPlayer, BLACK_EPSILON_SQUADRON)
		PlayerObject(pGhost):incrementPilotTier()

		if (not SpaceHelpers:hasCertifiedShip(pPlayer, true)) then
			grantStarterShip(pPlayer, "imperial")
            -- The conversation system will transition to "imperial_no_ship" due to getInitialScreen logic
            -- if the player lacks a ship after this point.
		end
        -- After joining and potentially getting a ship, the initial screen logic will determine
        -- the next state (imperial_yes_im_ready, imperial_has_mission, etc.).
        -- So, we simply return the cloned screen to allow the conversation to re-evaluate its state.
		return pClonedScreen
	-- Handle initial recruitment rejection
	elseif (screenID == "no_just_checking_male" or screenID == "no_just_checking_female" or screenID == "no_just_checking") then
		CreatureObject(pNpc):doAnimation("salute1")
	elseif (screenID == "never_mind" or screenID == "no_never_mind") then
		CreatureObject(pNpc):doAnimation("salute2")
	-- Handling for existing Imperial Pilots not in Black Epsilon, allowing them to join
	elseif (screenID == "join_black_epsilon_squadron") then
		CreatureObject(pNpc):doAnimation("nod_head_once")
		SpaceHelpers:setSquadronType(pPlayer, BLACK_EPSILON_SQUADRON)
		-- Once joined, they should now be able to proceed with the Black Epsilon quest line
		return pClonedScreen -- Allow getInitialScreen to determine next step

	-- Imperial Training (dynamic options are added here)
	elseif (screenID == "imperial_more_training") then
		local skillManager = LuaSkillManager()

		if (not CreatureObject(pPlayer):hasSkill("pilot_imperial_navy_starships_01") and skillManager:fulfillsSkillPrerequisitesAndXp(pPlayer, "pilot_imperial_navy_starships_01")) then
			clonedConversation:addOption("I'm interested in basic Imperial fighters.", "train_player_imperial_fighters")
		end
		if (not CreatureObject(pPlayer):hasSkill("pilot_imperial_navy_weapons_01") and skillManager:fulfillsSkillPrerequisitesAndXp(pPlayer, "pilot_imperial_navy_weapons_01")) then
			clonedConversation:addOption("I'm interested in basic Imperial starship component use.", "train_player_imperial_component")
		end
		if (not CreatureObject(pPlayer):hasSkill("pilot_imperial_navy_procedures_01") and skillManager:fulfillsSkillPrerequisitesAndXp(pPlayer, "pilot_imperial_navy_procedures_01")) then
			clonedConversation:addOption("I'm interested in basic Imperial procedures.", "train_player_imperial_basics")
		end
		if (not CreatureObject(pPlayer):hasSkill("pilot_imperial_navy_droid_01") and skillManager:fulfillsSkillPrerequisitesAndXp(pPlayer, "pilot_imperial_navy_droid_01")) then
			clonedConversation:addOption("I'm interested in Imperial droid interface basics.", "train_player_imperial_droid")
		end
        return pClonedScreen -- Always return the cloned screen for dynamic options
	-- Handle Skill box granting for Imperial
	elseif (string.find(screenID, "train_player_imperial_")) then
		local skillManager = LuaSkillManager()
		local deductExperience = (string.find(screenID, "_free") == nil)
		screenID = string.gsub(screenID, "_free", "")

		if (screenID == "train_player_imperial_droid") then
			if (not deductExperience or skillManager:fulfillsSkillPrerequisitesAndXp(pPlayer, "pilot_imperial_navy_droid_01")) then
				SpaceHelpers:grantSpaceSkill(pPlayer, "pilot_imperial_navy_droid_01", deductExperience)
			end
		elseif (screenID == "train_player_imperial_basics") then
			if (not deductExperience or skillManager:fulfillsSkillPrerequisitesAndXp(pPlayer, "pilot_imperial_navy_procedures_01")) then
				SpaceHelpers:grantSpaceSkill(pPlayer, "pilot_imperial_navy_procedures_01", deductExperience)
			end
		elseif (screenID == "train_player_imperial_fighters") then
			if (not deductExperience or skillManager:fulfillsSkillPrerequisitesAndXp(pPlayer, "pilot_imperial_navy_starships_01")) then
				SpaceHelpers:grantSpaceSkill(pPlayer, "pilot_imperial_navy_starships_01", deductExperience)
			end
		elseif (screenID == "train_player_imperial_component") then
			if (not deductExperience or skillManager:fulfillsSkillPrerequisitesAndXp(pPlayer, "pilot_imperial_navy_weapons_01")) then
				SpaceHelpers:grantSpaceSkill(pPlayer, "pilot_imperial_navy_weapons_01", deductExperience)
			end
		end
		return pClonedScreen -- Return to re-evaluate options on "imperial_more_training"

	-- Missions - Calling the Black Epsilon quest start functions
	elseif (screenID == "imperial_first_assignment_start") then -- This is the new option from "imperial_yes_im_ready"
		patrol_naboo_imperial_1:startQuest(pPlayer, pNpc)
        return pClonedScreen -- Allow getInitialScreen to determine next step (e.g., imperial_first_assignment)
	elseif (screenID == "imperial_train_me2") then
		destroy_naboo_imperial_2:startQuest(pPlayer, pNpc)
        return pClonedScreen
	elseif (screenID == "imperial_train_me3") then
		patrol_naboo_imperial_3:startQuest(pPlayer, pNpc)
        return pClonedScreen
	elseif (screenID == "imperial_train_me4") then
		assassinate_naboo_imperial_tier1_4a:startQuest(pPlayer, pNpc)
        return pClonedScreen
	elseif (screenID == "imperial_destroy_duty") then
		destroy_duty_naboo_imperial_6:startQuest(pPlayer, pNpc)
        return pClonedScreen
	elseif (screenID == "imperial_escort_duty") then
		escort_duty_naboo_imperial_7:startQuest(pPlayer, pNpc)
        return pClonedScreen

	-- Original Imperial Broker logic (re-ordered for clarity and integration)
	-- These screens should already be defined using addScreen if they were used in getInitialScreen logic
	elseif (screenID == "more_black_epsilon_male" or screenID == "more_black_epsilon_female" or screenID == "more_black_epsilon_neutral") then
		CreatureObject(pNpc):doAnimation("explain")
		SpaceHelpers:addBlackEpsilonSquadWaypoint(pPlayer)
		imperialBrokerConvoHandler:setBrokerStatus(pPlayer)
	elseif (screenID == "storm_squadron") then
		CreatureObject(pNpc):doAnimation("pose_proudly")
		if (playerGender == 0) then
			clonedConversation:addOption("I'm not interested in that.", "not_interested_storm_male")
			clonedConversation:addOption("Tell me more.", "storm_more_male")
		else
			clonedConversation:addOption("I'm not interested in that.", "not_interested_storm_female")
			clonedConversation:addOption("Tell me more.", "storm_more_female")
		end
	elseif (screenID == "not_interested_storm_male" or screenID == "not_interested_storm_female" or screenID == "storm_squadron_neutral_no_int") then
		CreatureObject(pNpc):doAnimation("shrug_hands")
	elseif (screenID == "storm_more_male" or screenID == "storm_more_female" or screenID == "more_storm_neutral") then
		CreatureObject(pNpc):doAnimation("explain")
		SpaceHelpers:addStormSquadWaypoint(pPlayer)
		imperialBrokerConvoHandler:setBrokerStatus(pPlayer)
	elseif (screenID == "not_interested_inquisition_male" or screenID == "not_interested_inquisition_female") then
		CreatureObject(pNpc):doAnimation("sigh_deeply")
	elseif (screenID == "what_inquisition_male" or screenID == "what_inquisition_female" or screenID == "more_inquisition_neutral") then
		CreatureObject(pNpc):doAnimation("manipulate_medium")
		SpaceHelpers:addImperialInquisitionSquadWaypoint(pPlayer)
		imperialBrokerConvoHandler:setBrokerStatus(pPlayer)
	elseif (screenID == "rebel_player") then
		if (CreatureObject(pPlayer):getSpecies() == SPECIES_WOOKIEE) then
			clonedConversation:addOption("I am interested in piloting.", "pilot_wookiee")
		elseif (playerGender == 0) then
			clonedConversation:addOption("I am interested in piloting.", "pilot_rebel")
		else
			clonedConversation:addOption("I am interested in piloting.", "pilot_female")
		end
	elseif (screenID == "stop_bothering" or screenID == "pilot_wookiee" or screenID == "pilot_rebel" or screenID == "pilot_female") then
		CreatureObject(pNpc):doAnimation("wave_on_dismissing")
		imperialBrokerConvoHandler:setRebelBrokerStatus(pPlayer)
	-- Player is Imperial Pilot - Handle retirement
	elseif (screenID == "request_retire") then
		CreatureObject(pNpc):doAnimation("point_accusingly")
	elseif (screenID == "want_retirement") then
		CreatureObject(pNpc):doAnimation("shake_head_no")
	elseif (screenID == "confirm_retirement") then
		CreatureObject(pNpc):doAnimation("dismiss")
		SpaceHelpers:surrenderPilot(pPlayer)
		BlackEpsilonSquadronScreenplay:resetImperialQuests(pPlayer) -- Reset Imperial quests upon retirement
	end

	return pClonedScreen
end

function imperialBrokerConvoHandler:setBrokerStatus(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local playerID = CreatureObject(pPlayer):getObjectID()

	writeData(playerID .. ":ImperialBroker:", 1)
end

function imperialBrokerConvoHandler:setRebelBrokerStatus(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local playerID = CreatureObject(pPlayer):getObjectID()

	writeData(playerID .. ":ImperialBroker:rebel:", 1)
end
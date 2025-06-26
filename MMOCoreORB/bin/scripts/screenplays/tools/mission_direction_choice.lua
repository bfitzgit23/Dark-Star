-- Re-adjusted angle map based on observed behavior (0 = South, angles increase clockwise)
--
--                            N 180
--                             |
--                    NW 135   |   NE 225
--                           \ | /
--                            \|/
--             W 90  ----------+---------- E 270
--                           /|\
--                          / | \
--                    SW 45    |   SE 315
--                             |
--                             S 0 and 360

mission_direction_choice = ScreenPlay:new {
	numberOfActs = 1,

	directions = {
		-- dirSelect = 0 is also used for "Reset Direction (Random)", which works as intended
		-- because the C++ code explicitly randomizes if dirChoice is 0.
		{dirDesc = "Current Player Facing", dirSelect = 999},      -- Special value for player facing.
		{dirDesc = "South (0°)", dirSelect = 0},                   -- To get missions South, send 0.
		{dirDesc = "South West (45°)", dirSelect = 45},            -- To get missions SW, send 45.
		{dirDesc = "West (90°)", dirSelect = 90},                  -- To get missions West, send 90.
		{dirDesc = "North West (135°)", dirSelect = 135},          -- To get missions NW, send 135.
		{dirDesc = "North (180°)", dirSelect = 180},               -- To get missions North, send 180.
		{dirDesc = "North East (225°)", dirSelect = 225},          -- To get missions NE, send 225.
		{dirDesc = "East (270°)", dirSelect = 270},                -- To get missions East, send 270.
		{dirDesc = "South East (315°)", dirSelect = 315},          -- To get missions SE, send 315.
	}
}

function mission_direction_choice:start()

end

function mission_direction_choice:openWindow(pPlayer)
	if (pPlayer == nil) then
		return
	end

	self:showLevels(pPlayer)
end

function mission_direction_choice:showLevels(pPlayer)

	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	local sui = SuiListBox.new("mission_direction_choice", "dirSelection") -- calls dirSelection on SUI window event

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	sui.setTitle("Mission Direction Selection")

	local promptText = "Use this menu to select the direction in which you would like to take missions.  After you have chosen, use the mission terminal to get a selection of missions (if any exist) within that direction.  \n\nIf no missions are offered to you, it is because terrain is unsuitable for missions in that direction from your current location.  You will need to choose another direction.\n\nWhen you want to go back to the 'normal' offering of missions for your skill level/group level, just choose 'Reset Direction (Random)'."

	sui.setPrompt(promptText)

	for i = 1,  #self.directions, 1 do

		sui.add(self.directions[i].dirDesc, "")
	end

	sui.sendTo(pPlayer)
end

function  mission_direction_choice:dirSelection(pPlayer, pSui, eventIndex, args)

	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	if (args == "-1") then
		CreatureObject(pPlayer):sendSystemMessage("No direction was selected...")
		return
	end

	local selectedIndex = tonumber(args)+1

    -- DEBUG: Print the raw arguments and selectedIndex
    CreatureObject(pPlayer):sendSystemMessage("DEBUG Lua: Raw SUI args: " .. tostring(args))
    CreatureObject(pPlayer):sendSystemMessage("DEBUG Lua: Selected Index: " .. tostring(selectedIndex))

	local selectedDir = tonumber(self.directions[selectedIndex].dirSelect)
	local selectedDirDesc = self.directions[selectedIndex].dirDesc

    -- DEBUG: Print the calculated selectedDir before writing
    CreatureObject(pPlayer):sendSystemMessage("DEBUG Lua: Selected Direction to Write: " .. tostring(selectedDir))
    CreatureObject(pPlayer):sendSystemMessage("DEBUG Lua: Selected Direction Description: " .. selectedDirDesc)

	writeScreenPlayData(pPlayer, "mission_direction_choice", "directionChoice", selectedDir)

    -- DEBUG: System message indicating write attempt
	CreatureObject(pPlayer):sendSystemMessage("DEBUG Lua: Attempting to write directionChoice: " .. selectedDir)

    -- DEBUG: VERIFY Read back the data immediately after writing it
    local verifyDir = readScreenPlayData(pPlayer, "mission_direction_choice", "directionChoice")
    CreatureObject(pPlayer):sendSystemMessage("DEBUG Lua: VERIFY Read back from screenplay: '" .. tostring(verifyDir) .. "'")

    -- *** NEW: FORCE PLAYER OBJECT SAVE ***
    CreatureObject(pPlayer):updateToDatabase();
    CreatureObject(pPlayer):sendSystemMessage("DEBUG Lua: Forced player object save after direction selection.")


	if (selectedDir == 0) then
		CreatureObject(pPlayer):sendSystemMessage("Mission direction has been reset to normal randomization (or South).")
	elseif (selectedDir == 999) then
		CreatureObject(pPlayer):sendSystemMessage("You have selected to take missions in your current player facing direction. This choice will remain active until you choose to change or reset it.")
	else
		CreatureObject(pPlayer):sendSystemMessage("You have selected to take missions to the " .. selectedDirDesc .. ". This choice will remain active until you choose to change or reset it.")
	end

end
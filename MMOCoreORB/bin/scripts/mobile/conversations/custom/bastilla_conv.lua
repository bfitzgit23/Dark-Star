-- File: MMOCoreORB\bin\scripts\conversation\custom\bastilla_conv.lua

bastilla_conv = ConvoTemplate:new {
	initialScreen = "first_screen",
	templateType = "Lua",
	luaClassHandler = "bastilla_convo_handler", -- Points to Bastila's conversation handler
	screens = {}
}

bastilla_first_screen = ConvoScreen:new {
	id = "first_screen",
	leftDialog = "",
	customDialogText = "I need help taking out an old friend that has fallen from his path, can you help?",
	stopConversation = "false",
	options = {
		{"yes", "revan_spawn_screen"},
	}
}
bastilla_conv:addScreen(bastilla_first_screen);

revan_spawn_screen = ConvoScreen:new {
	id = "revan_spawn_screen",
	leftDialog = "",
	customDialogText = "Thank you, stranger. He will appear nearby when you are ready to face him. Prepare yourself.",
	stopConversation = "true",
	options = {}
}
bastilla_conv:addScreen(revan_spawn_screen);

-- NEW: Screen for when Revan has already spawned
revan_already_spawned = ConvoScreen:new {
    id = "revan_already_spawned",
    leftDialog = "",
    customDialogText = "My friend senses you have already undertaken this challenge. There is nothing more for me to ask of you at this time.",
    stopConversation = "true", -- End conversation
    options = {}
}
bastilla_conv:addScreen(revan_already_spawned);

addConversationTemplate("bastilla_conv", bastilla_conv);
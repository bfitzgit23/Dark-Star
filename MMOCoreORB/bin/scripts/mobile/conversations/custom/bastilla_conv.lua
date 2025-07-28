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
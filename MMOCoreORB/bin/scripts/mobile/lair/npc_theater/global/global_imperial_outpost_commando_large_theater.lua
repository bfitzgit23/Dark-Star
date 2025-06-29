global_imperial_outpost_commando_large_theater = Lair:new {
	mobiles = {
		{"storm_commando",4},
		{"imperial_surface_marshal",2},
		{"stormtrooper_novatrooper_elite_commander",1},
	},
	spawnLimit = 25,
	buildingsVeryEasy = {"object/building/poi/lok_imperial_large2.iff","object/building/poi/anywhere_imperial_base_large_1.iff"},
	buildingsEasy = {"object/building/poi/lok_imperial_large2.iff","object/building/poi/anywhere_imperial_base_large_1.iff"},
	buildingsMedium = {"object/building/poi/lok_imperial_large2.iff","object/building/poi/anywhere_imperial_base_large_1.iff"},
	buildingsHard = {"object/building/poi/lok_imperial_large2.iff","object/building/poi/anywhere_imperial_base_large_1.iff"},
	buildingsVeryHard = {"object/building/poi/lok_imperial_large2.iff","object/building/poi/anywhere_imperial_base_large_1.iff"},
	missionBuilding = "object/tangible/lair/base/objective_banner_imperial.iff",
	mobType = "npc",
	buildingType = "theater",
	faction = "imperial"
}

addLairTemplate("global_imperial_outpost_commando_large_theater", global_imperial_outpost_commando_large_theater)

additional_trainers = ScreenPlay:new {                
    numberOfActs = 1,                
    questString = "trainers",                   
    states = {}, 
}
registerScreenPlay("additional_trainers", true)
function additional_trainers:start()

	local pWeaponsmith4 = spawnMobile("dantooine", "trainer_brawler", 1, -636, 3.0, 2503, 35, 0 )--mining
    local pWeaponsmith4 = spawnMobile("dantooine", "trainer_brawler", 1, -4209, 3.0, -2359, 35, 0 )--imp
    local pWeaponsmith4 = spawnMobile("dantooine", "trainer_brawler", 1, 1564, 4.0, -6425, 35, 0 )--aggro
	local pWeaponsmith4 = spawnMobile("dathomir", "trainer_brawler", 1, -42, 4.0, -1599, 35, 0 )--science
	local pWeaponsmith4 = spawnMobile("dathomir", "trainer_brawler", 1, -620, 4.0, 3070, 35, 0 )--trade
	


end



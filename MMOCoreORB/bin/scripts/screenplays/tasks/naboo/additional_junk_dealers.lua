additional_junk_dealers = ScreenPlay:new {                
    numberOfActs = 1,                
    questString = "junk_dealers",                   
    states = {}, 
}
registerScreenPlay("additional_junk_dealers", true)
function additional_junk_dealers:start()

	--Spawn junk dealers
    local pWeaponsmith4 = spawnMobile("endor", "junk_dealer", 1, -4679, 12.0, 4334, 35, 0 )--dwb
    local pWeaponsmith4 = spawnMobile("dathomir", "junk_dealer", 1, -3947, 124.0, -54, 35, 0 )--ns    
    local pWeaponsmith4 = spawnMobile("dantooine", "junk_dealer", 1, -615, 3.0, 2505, 35, 0 )--dant mo
    local pWeaponsmith4 = spawnMobile("dathomir", "junk_dealer", 1, 617, 3.0, 3090, 35, 0 )--trade
    local pWeaponsmith4 = spawnMobile("dathomir", "junk_dealer", 1, -45, 18.0, -1586, 35, 0 )--science
    local pWeaponsmith5 = spawnMobile("tatooine", "junk_dealer", 1, 6668.33,22.00,4245.53, 35, 0 )--gy 

end   



   

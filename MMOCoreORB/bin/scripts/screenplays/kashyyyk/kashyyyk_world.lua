kashyyyk_world = ScreenPlay:new { numberOfActs = 1 }
registerScreenPlay("kashyyyk_world", true)

function kashyyyk_world:start()
  if not isZoneEnabled("kashyyyk") then return end
  self:spawnGuide()
  self:spawnWildlife()
  self:spawnBandits()
  self:spawnRegions()
  self:spawnTravel()
  self:spawnThemepark()
  self:spawnSceneObjects()
end

function kashyyyk_world:spawnGuide()
  local pNpc = spawnMobile("kashyyyk", "kk_guide_npc", 0, -1235, 0, 5685, 0, 0)
  if pNpc ~= nil then CreatureObject(pNpc):setCustomObjectName("@kashyyyk:guide_name") end
end

function kashyyyk_world:spawnWildlife()
  spawnMobile("kashyyyk", "katarn", 300, -1200, 0, 5700, 0, 0)
  spawnMobile("kashyyyk", "kashyyyk_stalker", 600, -1300, 0, 5600, 0, 0)
  spawnMobile("kashyyyk", "myyydril_warrior", 800, -1100, 0, 5800, 0, 0)
end

function kashyyyk_world:spawnBandits()
  for i=1,6 do
    local x = -1400 + (i * 20)
    local z = 5600 + (i * 15)
    spawnMobile("kashyyyk", "kashyyyk_bandit", 300, x, 0, z, 0, 0)
  end
end

function kashyyyk_world:spawnRegions()
  local regions = {
    {name="dead_forest", cx=-900, cz=6000, radius=250, mobs={"katarn","kashyyyk_stalker"}},
    {name="rryatt_trail", cx=-2000, cz=5200, radius=250, mobs={"kashyyyk_stalker","myyydril_warrior"}},
    {name="kachirho_outskirts", cx=-1500, cz=5500, radius=250, mobs={"kashyyyk_bandit","kashyyyk_bandit","katarn"}}
  }
  for _,r in ipairs(regions) do
    for i=1,6 do
      local ox = math.random(-r.radius, r.radius)
      local oz = math.random(-r.radius, r.radius)
      local mob = r.mobs[(i % #r.mobs) + 1]
      spawnMobile("kashyyyk", mob, 300 + (i*30), r.cx + ox, 0, r.cz + oz, 0, 0)
    end
  end
end

function kashyyyk_world:spawnTravel()
  spawnSceneObject("kashyyyk","object/tangible/terminal/terminal_travel.iff",-1500,0,5505,0,0)
  spawnSceneObject("kashyyyk","object/tangible/terminal/terminal_travel.iff",-1985,0,5190,0,0)
end

function kashyyyk_world:spawnThemepark()
  spawnMobile("kashyyyk", "kk_theme_scout", 0, -1510, 0, 5510, 0, 0)
  spawnMobile("kashyyyk", "kk_theme_warden", 0, -1995, 0, 5205, 0, 0)
  spawnMobile("kashyyyk", "kk_theme_chief", 0, -1700, 0, 5400, 0, 0)
end

function kashyyyk_world:spawnSceneObjects()
  -- Add decorative scene objects here if desired
end

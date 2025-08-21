KASHYYYK BASIC SPAWNS — DROP-IN (Pre-CU Core3)
==============================================

What this adds
--------------
A minimal screenplay that spawns a handful of safe NPCs at:
- Kachirho Spaceport        (0,0,0)
- Hunting Grounds           (100,0,100)
- Dead Forest               (-200,0,75)

Safe templates (change as you like)
-----------------------------------
Configured in `scripts/screenplays/kashyyyk/kashyyyk_basic_spawns.lua`:
- wookiee  = "commoner"       (swap to "wookiee_male" if your core has it)
- trando   = "mercenary"      (swap to "trandoshan_slayer" etc.)
- imperial = "stormtrooper"
- rebel    = "rebel_scout"

Install
-------
1) Copy `scripts/` into your server `bin/` so it becomes `bin/scripts/...`.
2) Edit `bin/scripts/screenplays/screenplays.lua`, add:
       includeFile("screenplays/kashyyyk/kashyyyk_basic_spawns.lua")
   Place it after your `_kashyyyk_loader.lua` include (order doesn't really matter).
3) Restart the server. On boot you should see:
       [KASHYYYK] KashyyykBasicSpawns starting...
       [KASHYYYK] KashyyykBasicSpawns initialized.

Notes
-----
- If your planet scene name differs, change PLANET at the top of the file:
      local PLANET = "kashyyyk_main"   --> set to "kashyyyk" if needed
- If any template is missing in your core, change MOB_TEMPLATES.* to an existing template.
- Respawn times are in seconds. Adjust to taste.

Troubleshooting
---------------
- If you see "spawnMobile not available", your environment isn't loading screenplay helpers. Confirm your Core3 has spawn helpers available to Lua scripts.
- If spawns don't appear but no errors print, verify client TREs are loaded and you're on the expected scene (try `/where` and `/planet`).

Enjoy. This is only to make the zone feel alive while we build real spawn groups.
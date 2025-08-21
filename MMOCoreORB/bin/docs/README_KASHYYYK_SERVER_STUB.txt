Kashyyyk Server Stub
======================

This package prevents server errors when enabling Kashyyyk without full modules.

Files included:
- scripts/screenplays/kashyyyk/_kashyyyk_loader.lua
- scripts/conversations/kashyyyk/placeholder_conv.lua
- scripts/mobile/kashyyyk/_includes.lua

Installation:
1. Copy the 'scripts' folder into your SWGEmu server's 'bin/' directory.
   Example: swgemu/bin/scripts/...

2. Edit bin/scripts/screenplays/screenplays.lua
   Add the following line:
       includeFile("screenplays/kashyyyk/_kashyyyk_loader.lua")

3. Restart your server. You should see:
       [KASHYYYK] KashyyykScreenplay stub loaded.

Notes:
- This does NOT add spawns, POIs, or quests yet.
- With correct client TRE files, you can now teleport into Kashyyyk:
       /teleport kashyyyk_main 0 0
- To expand: add mobs to scripts/mobile/kashyyyk/_includes.lua and design real convos.


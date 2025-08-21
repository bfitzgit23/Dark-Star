# Merged serverobjects.lua Files with Kashyyyk Integration

These files are your originals with **Kashyyyk includes merged in**, nothing overwritten.

## Files Patched
- serverobjects.lua (mobiles + conversations)
- groups.lua (loot groups)
- screenplays.lua (screenplays)

## Added Lines
Each file now has at the bottom:

- Mobiles:
```lua
-- Kashyyyk Mobiles
includeFile("kashyyyk/serverobjects.lua")
```

- Loot Groups:
```lua
-- Kashyyyk Loot Groups
includeFile("kashyyyk/serverobjects.lua")
```

- Screenplays:
```lua
-- Kashyyyk Screenplays
includeFile("kashyyyk/serverobjects.lua")
```

## Installation
1. Backup your existing `serverobjects.lua`, `groups.lua`, and `screenplays.lua` files.
2. Replace them with these patched versions in the same folders.
3. Restart your server.

Now Kashyyyk mobiles, loot, and screenplays will load without missing include errors.

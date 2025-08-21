-- Kashyyyk screenplay stub
local ObjectManager = require("managers.object.object_manager")

KashyyykScreenplay = ScreenPlay:new {
    numberOfActs = 1,

    screenplayName = "KashyyykScreenplay"
}

registerScreenPlay("KashyyykScreenplay", true)

function KashyyykScreenplay:start()
    print("[KASHYYYK] KashyyykScreenplay stub loaded.")
end

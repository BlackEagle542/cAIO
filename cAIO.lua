local cAIO_VERSION = "1.0"
local cUTILS_LUA_NAME = "cUtils.lua"

local function check_for_prereqs()
    local resources_path = cheat:get_resource_path()
    local cUtils_path = resources_path:gsub("resources$", "lua\\lib\\" .. cUTILS_LUA_NAME)
    local cUtils_file = io.open(cUtils_path, "r")
    if not cUtils_file then
        print("[cUtils] not found. Please make sure it is installed in the correct location.")
    else
        cUtils_file:close()
        print("[cUtils] found.")
    end
end

check_for_prereqs()
local cUtils = require("cUtils")

cheat.on("features.run", function()
    cUtils.menu()
end)

function cChampion()
    Script_name = "cChampion"
    local test_navigation = menu.get_main_window():push_navigation(Script_name, 10000)
    local my_nav = menu.get_main_window():find_navigation(Script_name)

    -- Add menu sections and config variables for the champion here

    cheat.register_module(
        {
            champion_name = "Champion",
            -- Implement champion-specific spell functions and logic here
            get_priorities = function()
                return {
                    -- Define spell priorities here
                }
            end
        }
    )
end

LoadDBG = 1
function LoadPrints(str)
    if LoadDBG == 1 then
        print(str)
    end
end

local championModules = {
    Champion = cChampion
}

Champion = g_local.champion_name.text
if championModules[Champion] then
    championModules[Champion]()
    LoadPrints("[c" .. Champion .. "] -- Loading from [cAIO]")
    LoadDBG = 0
else
    LoadPrints("Champion Not Supported in [cAIO].")
    LoadDBG = 0
end
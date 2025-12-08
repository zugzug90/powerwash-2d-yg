require "lib.game_config"
local saver = require("saver.saver")

saver.init({
    save_name = "game",
    save_folder = APP_NAME or "blueprint_game",
    autosave_timer = 0,
    saver_key = "saver",
    lua_require_as_string = 0,
})

print('saves path: [' .. saver.get_save_path('game') .. ']')

local saves_manager = {}

function saves_manager.get_saved_attribute(id, default_value)
    return saver.get_value(id, default_value)
end

function saves_manager.save_attribute(id, value)
    --defsave.set("game_state", id, value)
    --defsave.save_all()

    saver.set_value(id, value)

    saver.save_game_state()
end

return saves_manager
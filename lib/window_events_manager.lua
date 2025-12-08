local sound_manager = require "lib.sound_manager"

local window_events_manager = {
    focus_gained = true,
    focus_lost = false,
    locked = false,
    unconditional_callbacks = {
        on_window_event_focus_lost = function()

        end
    }
}

window_events_manager.setup_unconditional_callbacks = function(unconditional_callbacks)
    window_events_manager = unconditional_callbacks
end

window_events_manager.lock_events_handling = function()
    window_events_manager.locked = true
end

window_events_manager.unlock_events_handling = function()
    window_events_manager.locked = false
end

window_events_manager.window_callback = function(self, event, data)

    -- unconditional features handling
    if event == window.WINDOW_EVENT_FOCUS_LOST then
        if window_events_manager.unconditional_callbacks and window_events_manager.unconditional_callbacks.on_window_event_focus_lost then
            window_events_manager.unconditional_callbacks.on_window_event_focus_lost()
        end
    end

    if window_events_manager.locked == true then
        return
    end
    if event == window.WINDOW_EVENT_FOCUS_LOST then
        window_events_manager.focus_gained = false
        if window_events_manager.focus_lost == false then
            window_events_manager.focus_lost = true
            print("window.WINDOW_EVENT_FOCUS_LOST")
            sound_manager.pause_sounds_if_needed()
        end

    elseif event == window.WINDOW_EVENT_FOCUS_GAINED then
        window_events_manager.focus_lost = false
        if window_events_manager.focus_gained == false then
            window_events_manager.focus_gained = true
            print("window.WINDOW_EVENT_FOCUS_GAINED")
            sound_manager.turn_on_sounds_back_if_needed()
        end

    elseif event == window.WINDOW_EVENT_ICONFIED then
        print("window.WINDOW_EVENT_ICONFIED")
    elseif event == window.WINDOW_EVENT_DEICONIFIED then
        print("window.WINDOW_EVENT_DEICONIFIED")
    elseif event == window.WINDOW_EVENT_RESIZED then
        print("Window resized: ", data.width, data.height)
        if data.width < data.height then
            sound_manager.pause_sounds_if_needed()
        else
            sound_manager.turn_on_sounds_back_if_needed()
        end
    end
end

return window_events_manager
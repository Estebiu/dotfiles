-- evafast.lua
--
-- Much speed.
--
-- Jumps forwards when right arrow is pressed, speeds up when it's held.
-- Inspired by bilibili.com's player. Allows you to have both seeking and fast-forwarding on the same key.
-- Also supports toggling fastforward mode with a keypress.
-- Adjust --input-ar-delay to define when to start fastforwarding.
-- Define --hr-seek if you want accurate seeking.
-- If you just want a nicer fastforward.lua without hybrid key behavior, set seek_distance to 0.

local options = {
    -- How far to jump on press, set to 0 to disable seeking and force fastforward
    seek_distance = 0,

    -- Playback speed modifier, applied once every speed_interval until cap is reached
    speed_increase = 0.1,
    speed_decrease = 0.1,

    -- At what interval to apply speed modifiers
    speed_interval = 0.03,

    -- Playback speed cap
    speed_cap = 4,

    -- Playback speed cap when subtitles are displayed, 'no' for same as speed_cap
    subs_speed_cap = 1.6,

    -- Multiply current speed by modifier before adjustment (exponential speedup)
    -- Use much lower values than default e.g. speed_increase=0.05, speed_decrease=0.025
    multiply_modifier = false,

    -- Show current speed on the osd (or flash speed if using uosc)
    show_speed = true,

    -- Show current speed on the osd when toggled (or flash speed if using uosc)
    show_speed_toggled = true,

    -- Show seek actions on the osd (or flash timeline if using uosc)
    show_seek = true
}

mp.options = require "mp.options"
mp.options.read_options(options, "evafast")

local uosc_available = false
local repeated = false
local speed_timer = nil
local speedup = true
local no_speedup = false
local jumps_reset_speed = true
local toggle_display = false
local toggle_state = false
local freeze = false

local function adjust_speed()
    local effective_speed_cap = (not options.subs_speed_cap or mp.get_property("sub-start") == nil) and options.speed_cap or options.subs_speed_cap
    local speed = mp.get_property_number("speed")
    local old_speed = speed
    if not freeze then
        if speedup and not no_speedup and speed <= effective_speed_cap then
            if options.multiply_modifier then
                speed = math.min(speed + (speed * options.speed_increase), effective_speed_cap)
            else
                speed = math.min(speed + options.speed_increase, effective_speed_cap)
            end
        else
            if options.multiply_modifier then
                speed = math.max(speed - (speed * options.speed_decrease), 1)
            else
                speed = math.max(speed - options.speed_decrease, 1)
            end
        end
    end
    if speed ~= old_speed then
        mp.set_property("speed", speed)
        if (options.show_speed and not toggle_display) or (options.show_speed_toggled and toggle_display) then
            if uosc_available then
                mp.command("script-binding uosc/flash-speed")
            else
                mp.osd_message(("▶▶ x%.1f"):format(speed))
            end
        end
    end
    if speed == 1 and effective_speed_cap ~= 1 then
        if speed_timer ~= nil and not toggle_state then
            speed_timer:kill()
            speed_timer = nil
        end
        repeated = false
        jumps_reset_speed = true
        toggle_display = false
        toggle_state = false
    elseif speed_timer == nil then
        speed_timer = mp.add_periodic_timer(options.speed_interval, adjust_speed)
    end
end

local function evafast(keypress)
    if jumps_reset_speed and not toggle_state and (keypress["event"] == "up" or keypress["event"] == "press") then
        speedup = false
    end

    if options.seek_distance == 0 then
        if keypress["event"] == "up" or keypress["event"] == "press" then
            speedup = false
            no_speedup = true
            repeated = false
        end
        if keypress["event"] == "down" then
            keypress["event"] = "repeat"
        end
    end

    if keypress["event"] == "up" or keypress["event"] == "press" then
        toggle_display = toggle_state
        if toggle_state and jumps_reset_speed then
            speedup = false
        end
        if speed_timer ~= nil and not toggle_state and mp.get_property_number("speed") == 1 and ((not options.subs_speed_cap or mp.get_property("sub-start") == nil) and options.speed_cap or options.subs_speed_cap) ~= 1 then
            speed_timer:kill()
            speed_timer = nil
            jumps_reset_speed = true
            toggle_display = false
            toggle_state = false
        end
        freeze = false
    end

    if keypress["event"] == "down" then
        repeated = false
        speedup = true
        freeze = true
        toggle_display = false
        if options.show_seek and not repeated and not uosc_available then
            mp.osd_message("▶▶")
        end
    elseif (keypress["event"] == "up" and not repeated) or keypress["event"] == "press" then
        if options.seek_distance ~= 0 then
            mp.commandv("seek", options.seek_distance)
            if options.show_seek and uosc_available then
                mp.command("script-binding uosc/flash-timeline")
            end
        end
        repeated = false
        if jumps_reset_speed and not toggle_state then
            no_speedup = true
        end
    elseif keypress["event"] == "repeat" then
        freeze = false
        speedup = true
        no_speedup = false
        if not repeated then
            adjust_speed()
        end
        repeated = true
    end
end

local function evafast_speedup()
    no_speedup = false
    speedup = true
    jumps_reset_speed = false
    toggle_display = true
    toggle_state = true
    evafast({event = "repeat"})
end

local function evafast_slowdown()
    jumps_reset_speed = true
    no_speedup = true
    repeated = false
    freeze = false
end

local function evafast_toggle()
    if (repeated or not jumps_reset_speed) and speedup then
        evafast_slowdown()
    else
        evafast_speedup()
    end
end

mp.register_script_message("uosc-version", function(version)
    uosc_available = true
end)

mp.command_native_async({"script-message-to", "uosc", "get-version", mp.get_script_name()}, function(success, result, error) end)

mp.add_key_binding("n", "evafast", evafast, {repeatable = true, complex = true})
mp.add_key_binding(nil, "speedup", evafast_speedup)
mp.add_key_binding(nil, "slowdown", evafast_slowdown)
mp.add_key_binding(nil, "toggle", evafast_toggle)

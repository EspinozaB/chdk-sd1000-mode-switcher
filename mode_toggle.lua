--[[
@title SD1000 Mode Switcher
@chdk_version 1.4
@param m Mode: 0=Auto Photo 1=Manual Photo 2=Video 3=Playback 4=Custom
@default m 0
@param c Custom Mode ID (if m=4)
@default c 1
@param d Mode change delay, ms
@default d 100
--]]

-- SD1000 Mode Switcher with correct mode IDs
-- Photo modes: 1=Auto, 2=Manual, plus scene modes
-- Video mode: 52 (grayscale) - check if there's a color video mode

mode_choice = m
custom_id = c
capmode = require("capmode")

function printf(...)
    print(string.format(...))
end

function get_rec_str()
    local isrec, isvid = get_mode()
    if isrec then
        if isvid then
            return "VIDEO"
        else
            return "PHOTO"
        end
    else
        return "PLAYBACK"
    end
end

function print_status()
    printf("Mode: %s (ID:%d)", capmode.get_name(), capmode.get())
    printf("State: %s", get_rec_str())
end

function switch_to_playback()
    printf("Switching to Playback...")
    if get_mode() then
        set_record(false)
        local sleep_count = 0
        while sleep_count < 100 do
            if not get_mode() then
                break
            end
            sleep(10)
            sleep_count = sleep_count + 1
        end
    end
end

function switch_to_mode(target_mode_id, mode_name)
    printf("Switching to %s (ID:%d)...", mode_name, target_mode_id)
    
    -- Check if mode is valid
    if not capmode.valid(target_mode_id) then
        printf("ERROR: Mode %d is not valid!", target_mode_id)
        return false
    end
    
    -- Ensure we're in record mode
    if not get_mode() then
        printf("Entering record mode...")
        set_record(true)
        local sleep_count = 0
        while sleep_count < 100 do
            if get_mode() then
                break
            end
            sleep(10)
            sleep_count = sleep_count + 1
        end
    end
    
    -- Switch mode using capmode
    local status = capmode.set(target_mode_id)
    
    if d > 0 then
        sleep(d)
    end
    
    if status then
        if capmode.get() == target_mode_id then
            printf("SUCCESS!")
            return true
        else
            printf("WARNING: Got mode %d instead", capmode.get())
            return false
        end
    else
        printf("FAILED to set mode")
        return false
    end
end

-- Main execution
print("=== SD1000 MODE SWITCHER ===")
print("")
print("Before:")
print_status()
print("")

if mode_choice == 0 then
    -- Auto Photo mode
    switch_to_mode(1, "Auto Photo")
    
elseif mode_choice == 1 then
    -- Manual Photo mode
    switch_to_mode(2, "Manual Photo")
    
elseif mode_choice == 2 then
    -- Video mode (grayscale - mode 52)
    -- Note: There may be other video modes, use Custom if needed
    switch_to_mode(52, "Video")
    
elseif mode_choice == 3 then
    -- Playback mode
    switch_to_playback()
    
elseif mode_choice == 4 then
    -- Custom mode ID
    switch_to_mode(custom_id, "Custom")
    
else
    print("Invalid selection!")
end

print("")
print("After:")
print_status()
print("")
print("SCENE MODES available:")
print("6=Aquarium, 7=Beach, 10=Grayscale")
print("14=Digital Macro, 18=Fireworks")
print("20=Foliage, 23=Indoor, 25=Kids/Pets")
print("34=Night, 36=Portrait, 41=Snow")
print("44=Stitch, 49=Underwater")
print("")
print("Use m=4 and set 'c' param")
print("to switch to scene modes")
print("")
print("Press any key to exit")
wait_click(10000)
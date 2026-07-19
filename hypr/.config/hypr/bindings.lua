local mainMod = "SUPER"

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("nautilus"))
hl.bind(mainMod .. " + R", function ()
    local rofiTheme = "default"
    -- Hyprland works on another system layer, thus we cannot use
    -- os.getenv method to get dynamically changing variable
    local handle = io.popen("systemctl --user show-environment | grep ROFI_THEME")
    if handle then
        local result = handle:read("*a")
        handle:close()

        -- [[
        -- .*[=/] — This is a greedy match. It scans the entire string from left to right and stops at the last occurrence of either an equals sign (=) or a forward slash (/). This instantly handles both splitting the key-value pair and finding the end of the file path.
        -- %s* — Consumes any leading whitespaces immediately following that last = or /.
        -- (.-) — This is the capture group. The .- lazily captures your target text (the theme name).
        -- %s*$ — Consumes any trailing whitespaces right up to the end of the string ($), ensuring your captured text is perfectly trimmed.
        -- ]]
        rofiTheme = string.match(result, ".*[=/]%s*(.-)%s*$")
    end

    local command = "rofi -show drun -theme $HOME/.config/rofi/themes/" .. rofiTheme .. "/style.rasi"
    hl.dispatch(hl.dsp.exec_raw(command))
end)
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("google-chrome-stable"))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

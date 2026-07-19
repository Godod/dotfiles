-- Autostart Applications and Services
hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("nm-applet")
    -- hl.exec_cmd("kitty")
end)

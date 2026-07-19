hl.bind("SUPER + T", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("google-chrome-stable"))
-- Toggle to the next layout using Super + L
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"))
-- Logout --
hl.bind("SUPER + M", hl.dsp.exec_cmd("wlogout"))

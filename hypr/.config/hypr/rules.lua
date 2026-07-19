-- Scroll nicely in the terminal.
hl.window_rule({
  name = "ghostty",
  match = { class = "com.mitchellh.ghostty" },
  scroll_touchpad = 1.5
})
hl.window_rule({
  name = "kitty",
  match = { class =  "(Alacritty|kitty|foot)"},
  scroll_touchpad = 1.5
})
hl.window_rule({
  name = "browser-workspace",
  match = { class = "google-chrome-stable" },
  workspace = "1",
  fullscreen = true,
})

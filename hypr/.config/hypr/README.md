# Hyprland Lua Configuration

A modular Hyprland configuration written in **Lua** using the **Vicinae** integration framework.

## Structure

```
hypr/
├── hyprland.lua       # Main config entry point
├── init.lua           # Core setup initialization
├── autostart.lua      # System startup applications
├── bindings.lua       # Keyboard shortcuts & mouse actions
├── input.lua          # Input device config
├── rules.lua          # Window and workspace placement rules
├── looknfeel.lua      # Styling, gaps, borders, and animations
└── monitors.lua       # Display profiles
```

## Key Features

- **Lua Scripting**: Leverages Vicinae's `hl` helper APIs to programmatically configure window controls, layouts, and system properties.
- **Autostart Services**: Automatically launches `waybar` (status bar), `hyprpaper` (wallpaper daemon), and `nm-applet` (network daemon).
- **Dynamic Rofi Theme Binding**: The `Super + R` keybinding queries systemd for the current `ROFI_THEME` environment variable, parses it, and launches Rofi with the theme that matches the active wallpaper colors.
- **Multimedia Controls**: Integrates hardware keys for raising/lowering/muting sound via `wpctl` and adjusts panel backlights via `brightnessctl`.
- **Navigation Shortcuts**:
  - `Super + T`: Open Ghostty terminal.
  - `Super + Q`: Close active window.
  - `Super + M`: Open logout screen (`wlogout`).
  - `Super + F`: Open Nautilus file manager.
  - `Super + B`: Launch Chrome browser.
  - Mouse scroll: Cycle workspaces.

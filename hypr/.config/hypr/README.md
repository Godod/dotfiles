# Hyprland Lua Configuration

A modern, highly customizable tiling window manager configuration for **Hyprland** written entirely in **Lua** using the native Hyprland Lua configuration API.

## Overview

Unlike standard flat text configurations, this setup utilizes modular Lua files. This allows variables, functions, and system queries to execute dynamically inside the window manager runtime.

### Key Features

- **Programmatic Configuration**: Configured using helper objects (e.g. `hl.bind`, `hl.dispatch`, `hl.dsp`).
- **Dynamic Rofi Theme Integration (`Super + R`)**: Reads the active user systemd session environment, extracts the `ROFI_THEME` name via regex matching, and launches Rofi matching the active wallpaper.
- **Hardware Media Controllers**: Handles audio outputs (`wpctl`) and backlight levels (`brightnessctl`) using hardware keyboard controls.
- **Visual Snipping (`Print`)**: Mapped to `grim` and `satty` for interactive screenshot editing, clipboard copying, and file saves.
- **Clean Window Actions**: Window switching, resizing, workspace scrolling, and session exit scripts (`wlogout`).

---

## Tech Stack & Dependencies

- **Window Manager**: `hyprland`
- **Lua Configuration Library**: Native `hl` namespace (provided directly by Hyprland)
- **Status Bar**: `waybar`
- **Wallpaper Daemon**: `hyprpaper`
- **Screenshot Tool**: `grim` + `satty` (for annotations) + `wl-clipboard`
- **App Launcher**: `rofi`
- **Session Menu**: `wlogout`
- **Media Controls**: `playerctl`, `wpctl`, `brightnessctl`

---

## Directory Structure

```
hypr/
└── .config/
    └── hypr/
        ├── hyprland.lua       # Main system entry point (imports packages)
        ├── init.lua           # Core setup specifications
        ├── autostart.lua      # Background daemons (Waybar, Hyprpaper, etc.)
        ├── bindings.lua       # Keyboard binds, mouse drag configs, media keys
        ├── input.lua          # Mouse pointer, trackpad gestures, keyboard layout
        ├── rules.lua          # Floating profiles, window behavior policies
        ├── looknfeel.lua      # Border sizes, active color margins, animations
        ├── monitors.lua       # Desktop resolution and monitor layout profiles
        ├── colors.lua         # Active color map (compiled by Matugen)
        └── colors_template.lua# Base theme layout for Matugen exports
```

---

## Core Keybindings

| Keybinding | Action | Command / Target |
|---|---|---|
| `Super + T` | Open Terminal | `ghostty` |
| `Super + Q` | Close Active Window | `hl.dsp.window.close()` |
| `Super + M` | Open Session Menu | `wlogout` |
| `Super + F` | Open File Manager | `nautilus` |
| `Super + B` | Open Web Browser | `google-chrome-stable` |
| `Super + R` | Open App Launcher | Launches custom Rofi styled search |
| `Super + Ctrl + H/J/K/L` | Move windows | Swap window position in a direction |
| `Super + Shift + H/L` | Cycle windows | Cycle through window tabs |
| `Super + Mouse Scroll` | Workspaces | Cycle active desktop workspace |
| `Alt_Gr + L` | Exit Sessions | Exit Hyprland session / wlogout |
| `Print` | Interactive Screenshot | `grim - \| satty ...` |

---

## Systemd & Rofi Integration

Rofi uses the systemd environment to read the active theme generated from the wallpaper:

```lua
local handle = io.popen("systemctl --user show-environment | grep ROFI_THEME")
```
It reads the output (e.g. `ROFI_THEME=/home/user/.config/rofi/themes/default`), parses it using Lua regex `.*[=/]%s*(.-)%s*$`, and launches Rofi with the exact theme matching the wallpaper.

---

## Troubleshooting

### Config errors out on launch
Hyprland evaluates configurations as Lua scripts. If there's a syntax error in your Lua configurations, Hyprland will display red diagnostic banners.
- View logs directly:
  ```bash
  journalctl --user -u hyprland
  # Or inspect standard error outputs
  cat ~/.local/share/hyprland/hyprland.log
  ```

### Rofi Launcher shows old theme
Verify that systemd successfully cached the active environment:
```bash
systemctl --user show-environment | grep ROFI_THEME
```
If it is empty, ensure the `wallpaper` command inside Fish is completing all steps and updating systemd environment values.

### Audio or brightness controls not responding
Ensure your user has access to `video` and `audio` groups (often required for `brightnessctl` and `wpctl`):
```bash
groups
# To add your user to video control groups:
sudo usermod -aG video $USER
```

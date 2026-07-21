# Matugen Theme Configuration

A central configuration for **Matugen**, an advanced command-line tool that extracts Material You color palettes from wallpapers and injects them dynamically into application stylesheets.

## Overview

Matugen acts as the styling coordinator for the entire desktop environment. By analyzing the colors of a newly applied wallpaper, it generates theme files for terminals, text editors, status bars, notification daemons, and window managers, applying them instantly using system reload signals.

### Key Features

- **Centralized Colors Configuration**: Maps one wallpaper source color to multiple application formats (CSS, RASI, TOML, Lua, TOML).
- **Automated Service Signals**: Triggers process signals (like `SIGUSR2` or custom CLI reloads) to force target applications to refresh their theme dynamically.
- **Dynamic Accent generation**: Automatically computes secondary shades (primary container, outline, surface accents) based on material design algorithms.

---

## Tech Stack & Dependencies

- **Theme Engine**: `matugen` (v0.8.0+)
- **System Targets**:
  - `waybar` (status bar)
  - `rofi` (app menu launcher)
  - `ghostty` (GPU terminal emulator)
  - `helix` (modal text editor)
  - `yazi` (terminal file manager)
  - `hyprland` (window manager)
  - `dunst` (notification daemon)

---

## Directory Structure

```
matugen/
└── .config/
    └── matugen/
        ├── config.toml         # Target registrations, template inputs, and reload hooks
        ├── README.md           # Configuration documentation
        └── templates/          # Source styling templates containing Matugen variables
            ├── waybar-colors.css
            └── colors-rofi.rasi
```

---

## Active Theme Compile Targets

The following map defines how Matugen translates templates into active configurations:

| Service | Input Template | Compiled Output | Reload Signal / Hook |
|---|---|---|---|
| **Waybar** | `~/.config/matugen/templates/waybar-colors.css` | `~/.config/waybar/tokens/colors.css` | `pkill -SIGUSR2 waybar` |
| **Rofi** | `~/.config/matugen/templates/colors-rofi.rasi` | `~/.config/rofi/colors.rasi` | Dynamic lookup on launch |
| **Ghostty** | `~/.config/ghostty/auto/colors.txt` | `~/.config/ghostty/themes/Matugen` | `pkill -SIGUSR2 ghostty` |
| **Helix** | `~/.config/helix/colors.txt` | `~/.config/helix/themes/matugen.toml` | `pkill -USR1 hx` |
| **Yazi** | `~/.config/yazi/config.toml` | `~/.config/yazi/theme.toml` | Core template mapping |
| **Hyprland** | `~/.config/hypr/colors_template.lua` | `~/.config/hypr/colors.lua` | Native Lua require re-read |
| **Dunst** | `~/.config/dunst/config_template.toml` | `~/.config/dunst/dunstrc` | `dunstctl reload` |

---

## Configuration Settings (`config.toml`)

Matugen is configured with `reload_apps = false` since we explicitly define shell hooks inside each template bracket:

```toml
[templates.waybar]
input_path = "~/.config/matugen/templates/waybar-colors.css"
output_path = "~/.config/waybar/tokens/colors.css"
post_hook = "pkill -SIGUSR2 waybar"
```

---

## Integration Workflow

The Matugen execution pipeline is launched via the `wallpaper` command inside `fish`:

```bash
# Executed automatically under the hood:
matugen image /path/to/wallpaper.jpg --source-color-index 0
```

1. Matugen parses the image colors.
2. It interpolates double-bracket variables (e.g. `{{colors.primary.default.hex}}`) within all mapped template files.
3. It saves the resulting configurations to their respective `.config` targets.
4. It calls `post_hook` shell triggers to alert active application processes.

---

## Troubleshooting

### Dynamic styling does not update after wallpaper change
1. Verify that the wallpaper command has run without errors.
2. Manually compile the colors to see output logs:
   ```bash
   matugen image ~/Pictures/Wallpapers/your_wallpaper.png
   ```
3. Check if all target template directories exist. Matugen will fail to write file outputs if the destination directories do not exist. Ensure Stow has linked directories first:
   ```bash
   ./apply
   ```

### Template Variable Syntax Errors
If Matugen outputs syntax exceptions, double check the variables format in your templates.
Matugen syntax requires double curly braces:
- Hex: `{{colors.primary.default.hex}}`
- RGB: `{{colors.primary.default.rgb}}`
- Strip Hex Hash: `{{colors.primary.default.hex_strip}}`

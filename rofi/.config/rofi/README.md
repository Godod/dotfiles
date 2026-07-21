# Rofi Launcher Configuration

An elegant, grid-based layout configuration for **Rofi**, a window switcher, application launcher, and dmenu replacement.

## Overview

This configuration moves away from basic vertical lists. It implements a grid structure with side-panel selectors, search bars, and full Material You theme styling integration.

### Key Features

- **Typography**: Optimized with `Google Sans Code 11` for high-fidelity text layouts.
- **Icon Set**: Standardized on the `Papirus` icon library.
- **Grid Layout**: Default theme implements a clean `4x3` display grid matching high-DPI desktop viewports.
- **Dynamic Theming Integration**: Imports `colors.rasi`, which is updated by `matugen` during wallpaper shifts. Colors are immediately inherited by borders, inputs, and selected item backdrops.
- **Multi-Mode Support**: Bound to support `drun` (desktop runner), `filebrowser`, `window` (switch open apps), and `run`.

---

## Tech Stack & Dependencies

- **Application Launcher**: `rofi` (v1.7.0+)
- **Theme Compiler**: `matugen` (watches wallpapers and writes color files)
- **Icon Pack**: `papirus-icon-theme`
- **Fonts**: `Google Sans Code`

---

## Directory Structure

```
rofi/
└── .config/
    └── rofi/
        ├── colors.rasi         # Dynamic Material You color variables (compiled by Matugen)
        ├── README.md           # Configuration documentation
        ├── images/             # Folder for optional custom icons/backgrounds
        └── themes/             # Rofi RASI stylesheet overrides
            ├── default/        # Main theme grid layout
            │   └── style.rasi  # Standard layout declarations
            ├── black/
            ├── green/
            ├── white/
            └── white-purple/
```

---

## Workspace Integration

Rofi is invoked automatically inside the Hyprland bindings using `Super + R`.

The trigger script checks systemd for the active theme configuration set by the user:

```bash
rofi -show drun -theme $HOME/.config/rofi/themes/<ROFI_THEME>/style.rasi
```

To update your active theme, set the `ROFI_THEME` user systemd environment variable (e.g. inside `fish`):

```bash
systemctl --user set-environment ROFI_THEME="default"
```

---

## Troubleshooting

### Icons are missing in the search grid
If icons are failing to display in the menu pane, verify that `papirus-icon-theme` is installed on your system:
```bash
# Arch Linux installation
sudo pacman -S papirus-icon-theme
```
You can verify the theme registration inside the RASI files:
```rasi
configuration {
    icon-theme: "Papirus";
}
```

### The launcher fails to reflect wallpaper colors
If colors don't match your background:
1. Check that `colors.rasi` is being successfully written by Matugen:
   ```bash
   cat ~/.config/rofi/colors.rasi
   ```
2. Verify that your active layout imports the variables file. The top of your theme's `style.rasi` should contain:
   ```rasi
   @import "../../colors.rasi"
   ```

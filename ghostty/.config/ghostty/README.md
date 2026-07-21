# Ghostty Terminal Configuration

A clean and highly optimized configuration for **Ghostty**, the modern, blazing-fast, GPU-accelerated terminal emulator.

## Overview

This configuration prioritizes typography, window aesthetics, and integration with the system's dynamic color pipeline. Ghostty is configured to automatically reload color schemes on the fly whenever a system-wide theme change occurs.

### Key Features

- **Premium Typography**: Built around `Google Sans Code` with Nerd Font fallbacks for icon support.
- **Window Translucency**: Background opacity set to `0.95` for subtle, elegant desktop blending.
- **Mouse Auto-Hide**: Automatically hides the mouse pointer when you start typing.
- **Dynamic Theming Integration**: Colors are fetched from the wallpaper color scheme and loaded from a custom theme path (`themes/Matugen`).

---

## Tech Stack & Dependencies

- **Terminal Emulator**: `ghostty`
- **Dynamic Theming**: `matugen` (for generating color configurations)
- **Primary Font**: `Google Sans Code`
- **Fallback Fonts**: `0xProto Nerd Font Propo`, `JetBrains Nerd Font`

---

## Directory Structure

```
ghostty/
└── .config/
    └── ghostty/
        ├── config            # Main terminal settings
        ├── themes/
        │   └── Matugen       # Theme colors (auto-compiled by Matugen)
        └── auto/
            └── colors.txt    # Base template file for theme generation
```

---

## Configuration Settings

### 1. Typography
```ini
font-family = "Google Sans Code"
font-family = "0xProto Nerd Font Propo"
font-family = "JetBrains Nerd Font"
font-style = "semibold"
font-size = 12
```
- Sets a semibold typeface at size 12. Falls back to Nerd Font variants for icon rendering in utilities (e.g. `nls`, `lazygit`, `fastfetch`).

### 2. Window & Background
```ini
background-opacity = 0.95
window-theme = ghostty
```
- Restricts borders and decorations to a clean, frame-aligned theme, with subtle background transparency.

### 3. Dynamic Theming
```ini
config-file = "themes/Matugen"
```
- Ghostty reads system color declarations from this theme configuration.

---

## Theme Generation Workflow

1. Matugen watches for wallpaper updates.
2. It parses the template at `~/.config/ghostty/auto/colors.txt`.
3. It exports hex color lists to `~/.config/ghostty/themes/Matugen`.
4. It fires a `SIGUSR2` signal to the active Ghostty instances:
   ```bash
   pkill -SIGUSR2 ghostty
   ```
5. Ghostty instantly updates its terminal palette without dropping active shell sessions.

---

## Troubleshooting

### Theme fails to reload dynamically
Check if the signal is sent successfully or if the theme file exists:
```bash
# Verify theme configuration exists
cat ~/.config/ghostty/themes/Matugen

# Manually trigger reload signal
pkill -SIGUSR2 ghostty
```

### Font Display Issues
If the primary fonts are missing, Ghostty will fall back to default monospace layouts. You can install missing fonts via your package manager:
```bash
# Arch Linux
yay -S otf-google-sans-mono nerd-fonts-0xproto nerd-fonts-jetbrains-mono
```
Verify fonts are loaded correctly in your system:
```bash
fc-list : family | grep -E "Google Sans|0xProto|JetBrains"
```

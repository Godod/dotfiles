# Kitty Terminal Configuration

An optimized configuration for the **Kitty** terminal emulator, focusing on low rendering latency, custom typography, and advanced cursor animations.

## Overview

This configuration balances visual flair (like interactive cursor trails and custom underline styles) with performance tuning to minimize input delay.

### Key Features

- **JetBrains Mono Nerd Font**: Clear development typography with native ligatures enabled.
- **Interactive Cursor Trails**: Renders smooth particle trails on mouse and text operations.
- **Low-Latency Rendering**: Configured with fast repaint delays (`10ms`) and input latency minimization (`2ms`).
- **Borderless View**: Hidden title bars and thin margins (`15px` padding) for a clean UI.
- **Zsh Default Shell**: Configured to launch using `zsh` as its default terminal interpreter.

---

## Tech Stack & Dependencies

- **Terminal Emulator**: `kitty` (v0.30.0+)
- **Primary Font**: `JetBrainsMono Nerd Font`
- **Shell**: `zsh` (loaded by default)

---

## Directory Structure

```
kitty/
└── .config/
    └── kitty/
        ├── kitty.conf          # Main terminal settings
        ├── kitty-theme.conf    # Theme file mapping active colors
        └── README.md           # Documentation
```

---

## Configuration Settings

### 1. Font & Ligature Settings
```ini
font_family      JetBrainsMono Nerd Font
bold_font        auto
italic_font      auto
bold_italic_font auto
font_size        11.0
disable_ligatures never
```
- Sets JetBrains Mono as the primary font and ensures ligatures (e.g., `=>`, `!=`, `===`) are always rendered.

### 2. Cursor Trail Animations
```ini
cursor_shape beam
cursor_trail 10
cursor_trail_decay 0.1 0.4
cursor_trail_start_threshold 2
```
- Creates a custom beam cursor that leaves a trailing trail of up to 10 increments during rapid cursor movements.

### 3. Rendering Latency
```ini
repaint_delay 10
input_delay 2
```
- Adjusts refresh timings: `repaint_delay 10` aims for a 100 FPS draw target, while `input_delay 2` minimizes typing latency.

---

## Customization

### Changing the Default Shell
By default, Kitty is set to open `zsh`. If you want to use the Fish shell setup from this dotfiles repository:
1. Edit `~/.config/kitty/kitty.conf` and change:
   ```ini
   shell fish
   ```
2. Reload Kitty.

### Adjusting Window Transparency
To make the terminal background more or less opaque:
```ini
# Edit opacity (0.0 = fully transparent, 1.0 = fully opaque)
background_opacity 0.90
```

---

## Troubleshooting

### Nerd Font Icons show up as question marks
Make sure you have installed the correct system font:
```bash
# Arch Linux installation
yay -S ttf-jetbrains-mono-nerd
```

### Dynamic background opacity not working
If transparency is not applied, verify that your window manager or compositor (such as Hyprland or Sway) is running. Compositing is required to display transparent windows.
```bash
# Verify compositor status (Hyprland example)
hyprctl monitors
```

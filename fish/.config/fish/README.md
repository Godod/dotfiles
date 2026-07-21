# Fish Shell Configuration

A modern, highly optimized interactive configuration for the **Fish Shell**. It is equipped with custom wrappers, smart directory jumping, custom pager configurations, and a dynamic Material You styling pipeline.

## Overview

This configuration serves as the control center of the dotfiles environment. It not only manages environment paths and aliases but also orchestrates the theme synchronization between terminal applications, status bars, and window managers.

### Key Features

- **Tide Prompt**: High-performance, customizable prompt theme.
- **Dynamic Theming Integration**: Command `wallpaper` selects wallpapers and Rofi themes, then propagates changes via Matugen and Hyprpaper.
- **Yazi Shell Sync (`y`)**: Changes directory automatically on exit to the last directory browsed inside Yazi.
- **Smart Directory Jumping**: Powered by `zoxide` (`z`).
- **Interactive Man Pager**: View man pages with syntax highlighting and editor features inside Helix.

---

## Tech Stack & Dependencies

- **Shell**: `fish` (v3.6+)
- **Prompt**: `tide`
- **Plugin Manager**: `fisher`
- **Utilities**:
  - `zoxide` (directory jumping)
  - `nls` (modern directory lister)
  - `bat` (modern cat utility)
  - `fastfetch` (system information)
  - `lazygit` (Git terminal interface)
  - `lazydocker` (Docker management interface)
  - `sabiql` (database client)

---

## Directory Structure

```
fish/
└── .config/
    └── fish/
        ├── config.fish              # Main entry point (loads settings, paths, envs)
        ├── custom_functions.fish    # Custom scripts (wallpaper picker, yazi shell sync)
        ├── fish_plugins             # List of fisher plugins
        ├── fish_variables           # Persistent shell variables
        ├── completions/             # Autocompletions directory
        ├── conf.d/                  # Modular config files
        └── functions/               # Built-in fish functions
```

---

## Custom Commands & Functions

### 1. `wallpaper`
An interactive script integrating several tools to change your desktop appearance instantly:
1. **Directory Validation**: Ensures `~/Pictures/Wallpapers` and `~/.config/rofi/themes` exist.
2. **Yazi Wall Picker**: Launches Yazi in single-file selector mode pointing to the wallpapers directory.
3. **FZF Theme Picker**: Launches `fzf` to pick from the available Rofi styles.
4. **Systemd Broadcast**: Writes `WALLPAPER_PATH` and `ROFI_THEME` to the user-level systemd session variables so Hyprland bindings can read them.
5. **Hyprpaper Refresh**: Unloads previous wallpaper, preloads the new one, and updates the background screen.
6. **Matugen Compilation**: Triggers Matugen to parse configs and write fresh stylesheets for Waybar, Rofi, Ghostty, Helix, Yazi, and Dunst.

### 2. `y`
A wrapper for Yazi. Instead of returning to the original terminal working directory when you quit Yazi, the shell reads Yazi's temporary state file and performs a `cd` command to the folder you were looking at last:
```fish
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
```

---

## Sane Abbreviations

This configuration includes a series of globally registered abbreviations for rapid development:

| Abbreviation | Expands to | Tool / Purpose |
|---|---|---|
| `bubug` | `brew update && brew upgrade ...` | Clean system update (macOS) |
| `ls` | `nls -AS --group-directories-first` | Modern directory listing sorted by size/extension |
| `ll` | `nls -ASgl --group-directories-first` | Long format detailed listing |
| `lg` | `lazygit` | Git visual CLI |
| `nv` | `nvim` | Neovim text editor |
| `hx` | `/usr/lib64/helix/hx` | Post-modern editor (sets default `$EDITOR`) |
| `cat` / `c` | `bat` | File printer with syntax highlighting |
| `btw` | `fastfetch` | Fast system specifications display |
| `lq` | `sabiql` | Terminal SQL database client |
| `ld` | `lazydocker` | Docker container manager UI |
| `ts` | `$HOME/.config/tmux/session` | CD into Tmux session profiles folder |

---

## Environment Variables

Key variables set in `config.fish`:

- `EDITOR`: Set to Helix (`/usr/lib64/helix/hx`).
- `MANPAGER`: Set to `helix +Man!`, which pipes all terminal manual pages directly into a read-only Helix buffer for search and navigation.
- `fish_greeting`: Disabled (empty) for clean terminal startups.

---

## Troubleshooting

### Dynamic wallpaper reloads failing
Ensure all binaries are present in path:
```bash
which yazi fzf hyprpaper matugen systemctl
```
Verify that user systemd has environment control permission.

### Fisher Plugins not loaded
If plugins from `fish_plugins` are missing after installation:
```fish
# Force fisher to reinstall configured plugins
fisher update
```

### Tide prompt characters corrupted
Tide relies on powerline and glyph elements. If your prompt shows corrupted characters (squares or question marks), ensure a **Nerd Font** is configured in your terminal settings (e.g. Ghostty/Kitty/Alacritty).

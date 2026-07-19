# Fish Configuration

A custom interactive shell configuration equipped with aliases, abbreviations, and advanced scripts for daily coding and system theme management.

## Custom Commands & Functions

### `wallpaper`

A dynamic selector script combining `yazi`, `fzf`, `hyprpaper`, and `matugen` to change themes on the fly.
1. Launches **Yazi** in directory chooser mode to pick an image from `~/Pictures/Wallhaven`.
2. Launches **FZF** to select a Rofi theme from `~/.config/rofi/themes/`.
3. Propagates variables (`WALLPAPER_PATH`, `ROFI_THEME`) to the user systemd environment.
4. Reloads **Hyprpaper** with the new wallpaper.
5. Invokes **Matugen** to rebuild colors for Waybar, Rofi, Ghostty, Helix, and Yazi.

### `y`

A wrapper for **Yazi** that tracks the current working directory. Upon quitting Yazi, the shell automatically changes directory (`cd`) to the last visited folder in Yazi.

## Sane Abbreviations

- **`bubug`**: Run brew update, upgrade packages, upgrade casks, and clean up.
- **`ls` / `ll`**: Modern file listings using `nls`.
- **`lg`**: Launch `lazygit`.
- **`nv`**: Launch `nvim`.
- **`hx`**: Launch `helix` (configured at `/usr/lib64/helix/hx` as default `$EDITOR`).
- **`cat` / `c`**: Modern cat using `bat`.
- **`btw`**: Launch `fastfetch`.
- **`lq`**: Launch `sabiql` (SQL database client).
- **`ld`**: Launch `lazydocker`.
- **`ts`**: CD into tmux session configs.

## Features

- **Zoxide Integration**: Quick directory jumping (`z`).
- **Completions**: Extra package autocompletions for brew and tide.
- **Man Pager**: View man pages directly in Helix (`set -gx MANPAGER 'helix +Man!'`).

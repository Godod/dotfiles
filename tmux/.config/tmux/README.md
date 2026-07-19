# Tmux Configuration

A modern terminal multiplexer configuration managed via `tpack` (Rust-based Tmux package manager) and themed with `tmux2k`.

## Core Features

- **Plugin Manager**: Uses `tpack` instead of the traditional `tpm` tool.
- **Status Bar**: Utilizes `tmux2k` configured with a sleek Catppuccin theme displaying:
  - Left plugins: `git`, `cpu`, `ram`.
  - Right plugins: `battery`, `bandwidth`, `time`, `pomodoro`.
- **Interface Behavior**:
  - Mouse mode: enabled.
  - Renumbers windows automatically when a window is closed.
  - Start indexes at 1 (instead of 0) for both windows and panes.

## Keybindings

| Keybinding | Action |
|---|---|
| `r` | Reloads `tmux.conf` configuration file dynamically. |
| `Shift + Left` | Switch to the previous window. |
| `Shift + Right` | Switch to the next window. |
| `Prefix + \|` | Split window horizontally (current path). |
| `Prefix + \` | Split window horizontally full-width (current path). |
| `Prefix + -` | Split window vertically (current path). |
| `Prefix + _` | Split window vertically full-width (current path). |
| `Ctrl + f` | Launches the interactive `tmux-fzf` panel. |

## Plugins List

- **`tmux-sensible`**: Adds common sane defaults.
- **`tmux-fzf`**: Fuzzy search utility for sessions/panes.
- **`tmux2k`**: Modern status bar layout.
- **`tmux-pomodoro-plus`**: Pomodoro timer integration.
- **`tmux-session-wizard`**: Session navigation and generation menu.

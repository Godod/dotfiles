# Tmux Configuration

A highly optimized terminal multiplexer configuration for **Tmux**, featuring visual configurations, plugin integrations, and package management powered by the modern Rust-based **tpack** manager.

## Overview

This configuration moves away from legacy `tpm` layouts in favor of the fast `tpack` binary. It features a Catppuccin status bar (`tmux2k`) containing system telemetry, Git tracking, active Pomodoro timers, and session layouts.

### Key Features

- **Rust Package Manager (`tpack`)**: Prepares, installs, and loads plugins quickly.
- **Visual Status Line (`tmux2k`)**: Catppuccin theme showing system resources (CPU, RAM, Bandwidth), time, active Git branch, and Pomodoro focus timers.
- **Intuitive Pane Splits**: Splits panes and directories relative to your current path using visual flags (`|`, `\`, `-`, `_`).
- **Session Wizard (`Ctrl + f`)**: Fuzzy search session manager (`tmux-session-wizard`) that makes jumping between active projects fast.
- **Smart window indexes**: Numbering starts at `1` (instead of `0`) so keyboard selections align with standard layouts. Windows are re-indexed automatically when closed.

---

## Tech Stack & Dependencies

- **Multiplexer**: `tmux` (v3.3+)
- **Plugin Loader**: `tpack` (Rust-based Tmux package manager)
- **Status Theme**: `tmux2k` (configured with Catppuccin palette)
- **Fuzzy Finder**: `fzf` (required for session-wizard and search menus)

---

## Directory Structure

```
tmux/
└── .config/
    └── tmux/
        ├── tmux.conf       # Main configuration settings
        ├── README.md       # Configuration documentation
        └── session/        # Project and environment session files
```

---

## Keybindings

The prefix key is set to default `Ctrl + b`.

### General Actions

| Keybinding | Action | Command |
|---|---|---|
| `Prefix + r` | Reload configuration | Dynamic reload of `tmux.conf` |
| `Shift + Left` | Previous Window | Jump to previous terminal window |
| `Shift + Right` | Next Window | Jump to next terminal window |
| `Ctrl + f` | Launch Session search | Trigger `tmux-session-wizard` search |

### Pane Splits (Directory Aware)

| Keybinding | Action | Description |
|---|---|---|
| `Prefix + \|` | Horizontal split | Splits active pane horizontally at current path |
| `Prefix + \\` | Horizontal full split | Splits window full width horizontally at current path |
| `Prefix + -` | Vertical split | Splits active pane vertically at current path |
| `Prefix + _` | Vertical full split | Splits window full width vertically at current path |

---

## Installed Plugins

This configuration leverages the following plugins loaded in `tmux.conf`:

1. **`tmux-sensible`**: Applies common default settings (escape times, scrollback buffers).
2. **`tmux-fzf`**: Accesses Tmux actions (killing panes, resizing windows) inside an `fzf` menu.
3. **`tmux2k`**: Multi-segment status line styling.
4. **`tmux-pomodoro-plus`**: Embeds a Pomodoro timer block in the status bar for work/break sessions.
5. **`tmux-session-wizard`**: Employs FZF and Zoxide to build and swap Tmux sessions instantly.

---

## Troubleshooting

### tpack is not initialized or missing plugins
If plugins fail to display on a new environment:
1. Ensure the `tpack` Rust binary is installed on your system.
2. Initialize and download plugins:
   ```bash
   # Open Tmux and run tpack updater
   tmux
   # Press: Ctrl + b followed by I (capital I) to run the installer
   ```

### Status bar telemetry missing
If CPU/RAM utilization fields show blank fields, ensure commands like `top`, `free`, or `vmstat` are accessible in the background path.

### Keybinding conflicts
If split windows or window changes fail:
```bash
# Force reload the configuration to clear active binds
tmux source-file ~/.config/tmux/tmux.conf
```

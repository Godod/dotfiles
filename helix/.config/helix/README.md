# Helix Configuration

A highly customized Helix editor configuration designed for speed, custom workflows, and modern language server integrations.

## Core Features

- **Theme**: Automatically matches the active wallpaper color scheme using `matugen`.
- **Interface**:
  - Relative line numbers for efficient motion.
  - Visible multiple buffers/tabs in the bufferline.
  - Active indent guides.
  - End-of-line diagnostics shown as hints.
- **Auto-Formatting**: Enabled on save for multiple languages.

## Custom Keybindings

### Normal Mode

| Keybinding | Action |
|---|---|
| `Ctrl + l` | Spawns a shell buffer with `lazygit` and redraws on close. |
| `Ctrl + y` | Launches `yazi` file picker to open a file in a new buffer. |
| `Ctrl + g` | Executes `git blame` for the current line and prints context. |
| `[` | Switch to the previous buffer. |
| `]` | Switch to the next buffer. |
| `Alt + j` | Move current selection / line down. |
| `Alt + k` | Move current selection / line up. |
| `ret` | Quick word jump (`goto_word`). |

### Insert Mode

| Keybinding | Action |
|---|---|
| `Ctrl + t` | Indent current line. |
| `Ctrl + d` | Unindent current line. |
| `Ctrl + c` | Toggle comments for the current selection. |
| `Ctrl + o` | Open a new line below and return to normal mode. |

## Language Server Integrations

- **Web (HTML / CSS / JS / TS / TSX)**: Formatted via `prettier` using `npx`.
- **Python**: Integrated with `basedpyright` and `ruff` (linter and auto-formatter).
- **Rust**: Integrated with `rustfmt` and configured for debugging with `lldb-dap`.

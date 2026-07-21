# Helix Editor Configuration

A highly customized, productive configuration for **Helix**, a post-modern modal text editor. It is tuned for speed, custom external terminal integrations (such as Yazi and Lazygit), and advanced Language Server (LSP) workflows.

## Overview

Helix is configured to use modern terminal standards, interactive status lines, relative line numbering, and a color scheme that updates dynamically on save/wallpaper shift.

### Key Features

- **Dynamic Theme Matching**: The active theme (`matugen`) adapts color definitions directly from desktop background palettes.
- **Embedded Lazygit (`Ctrl + l`)**: Launches `lazygit` directly in a fresh shell buffer and returns you to editing upon exit.
- **Yazi File Picker (`Ctrl + y`)**: Integrates the Yazi terminal file manager inside Helix. It lets you select files visually and opens them in new Helix buffers.
- **Git Blame status (`Ctrl + g`)**: Prints standard git blame details (hash, author, date, message) for the current line directly to the terminal status area.
- **Line Bubbling (`Alt + j` / `Alt + k`)**: Easily slide lines or selections up and down (similar to VS Code).
- **Web Formatting**: Runs Prettier formatters asynchronously via `npx` (no global node package setup required).
- **Python / Rust Suites**: Advanced type checking via `basedpyright`, auto-imports and linting via `ruff`, and native testing/debugging configurations.

---

## Tech Stack & Dependencies

- **Text Editor**: `helix` (v23.10+)
- **Formatters**:
  - `prettier` (Web languages)
  - `ruff` (Python linter and formatter)
  - `rustfmt` (Rust code formatter)
- **LSP Servers**:
  - `basedpyright` (Python type checker)
  - `rust-analyzer` (Rust Language Server)
  - Language servers for HTML/CSS/TypeScript as needed.
- **Shell**: `fish` (configured as standard shell inside helix)

---

## Directory Structure

```
helix/
└── .config/
    └── helix/
        ├── config.toml         # Main editor layout, behavior, and keybinds
        ├── languages.toml      # LSP mappings, diagnostics, and formatters
        ├── yazi-picker.sh      # Yazi chooser integration script
        ├── colors.txt          # Matugen templates for themes
        └── themes/
            └── matugen.toml    # Theme output (compiled by Matugen)
```

---

## Keybindings

### Normal Mode

| Keybinding | Action | Command |
|---|---|---|
| `Ctrl + l` | Run Lazygit in subshell | `:insert-output lazygit` |
| `Ctrl + y` | Launch Yazi file picker | Evaluates file chooser and opens selection |
| `Ctrl + g` | Git blame current line | Evaluates git blame for cursor coordinate |
| `[` | Previous buffer | `goto_previous_buffer` |
| `]` | Next buffer | `goto_next_buffer` |
| `Alt + j` | Bubble line down | `delete_selection`, `paste_after` |
| `Alt + k` | Bubble line up | `delete_selection`, `move_line_up`, `paste_before` |
| `ret` | Quick word jump | `goto_word` |
| `C-u` / `C-k` | Half page up | Centered screen navigation |
| `C-d` / `C-j` | Half page down | Centered screen navigation |

### Insert Mode

| Keybinding | Action | Command |
|---|---|---|
| `Ctrl + t` | Indent current line | `indent` |
| `Ctrl + d` | Unindent current line | `unindent` |
| `Ctrl + c` | Toggle comment status | `toggle_comments` |
| `Ctrl + o` | Open new line below | Escapes to normal mode and inserts line |

---

## Language Server Integrations

### Python Configuration
Uses `basedpyright` for linting and type checking, combined with `ruff` for code formatting:
```toml
[[language]]
name = "python"
language-servers = [ "basedpyright", "ruff" ]
formatter = { command = "ruff", args = ["format", "-"] }
```

### Web Development (HTML/CSS/JS/TS)
Formats files on save using standard Prettier configs:
```toml
[[language]]
name = "typescript"
formatter = { command = "npx", args = ["prettier", "--parser", "typescript"] }
auto-format = true
```

---

## Dynamic Theme Reloading

Helix is integrated with the `matugen` reload pipeline. When a new theme file `matugen.toml` is written:
1. Matugen fires a `USR1` signal:
   ```bash
   pkill -USR1 hx
   ```
2. Helix reads the updated `matugen.toml` stylesheet and updates colors in all active buffers immediately.

---

## Troubleshooting

### Dynamic Reload fails or editor hangs
Ensure the hot-reload command is running in the background. Verify Helix can read the output template:
```bash
# Check if matugen compiled successfully
cat ~/.config/helix/themes/matugen.toml
```

### Prettier formatting is slow
The first time you save a TypeScript/HTML file, `npx prettier` might download components. Ensure you have Node.js/npm installed. For local speeds, install prettier globally:
```bash
npm install -g prettier
```
If formatting is installed globally, update `languages.toml` to call `prettier` directly instead of `npx`.

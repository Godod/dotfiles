# Neovim Lua Configuration

A robust, highly optimized, and modular Neovim configuration written entirely in **Lua**. It leverages **lazy.nvim** for plugin management, **blink.cmp** for autocompletion, and implements custom keymaps (inspired by The Primeagen) for rapid editing.

## Overview

This Neovim configuration is designed for speed and productivity. It splits configurations into core settings, keymaps, and individual plugin specification modules under `lua/godod1/lazy/`.

### Key Features

- **Modern Plugin Loader**: Managed via `lazy.nvim` with transaction locks (`lazy-lock.json`).
- **Unified Completion Suite**: Leverages the blazing-fast `blink.cmp` for context-aware coding suggestions.
- **Centering Movements**: Movement keys automatically keep your cursor centered during page jumps and search queries.
- **System Clipboard Operations**: Seamless clipboard sharing with the host OS system registers using explicit leader binds.
- **Interactive Fuzzy Finding**: Employs `telescope` to navigate files, git states, and occurrences.
- **Distraction-Free Workspace**: Zen-mode support and automated secret/env masking via `cloak`.

---

## Tech Stack & Dependencies

- **Text Editor**: `neovim` (v0.9.0+)
- **Plugin Manager**: `lazy.nvim`
- **Autocompleter**: `blink.cmp`
- **Syntax Engine**: `nvim-treesitter`
- **Visual Utilities**: `telescope` (fuzzy finder), `undotree` (edit trees), `zen-mode`
- **Clipboards**: Requires `wl-clipboard` (Wayland) or `xclip` / `xsel` (X11) for system clipboard integration.

---

## Directory Structure

```
nvim/
└── .config/
    └── nvim/
        ├── init.lua            # Main entry point (loads lua/godod1/init.lua)
        ├── lazy-lock.json      # Locked versions of all loaded plugins
        ├── lua/
        │   └── godod1/
        │       ├── init.lua            # Entry point for user configurations
        │       ├── lazy_init.lua       # Configures and runs lazy.nvim
        │       ├── remap.lua           # Global keybinds and navigation overrides
        │       ├── set.lua             # System level defaults (margins, line numbers)
        │       └── lazy/               # Dedicated modular files for plugins
        │           ├── blink.lua       # Autocompletion
        │           ├── cloak.lua       # Secret files concealment
        │           ├── conform.lua     # Formatting engine (auto-format on save)
        │           ├── lsp.lua         # LSP setups and servers list
        │           ├── telescope.lua   # Search buffers and files
        │           └── treesitter.lua  # Syntax highlighting parsers
        └── README.md           # Documentation
```

---

## Custom Keymaps

The leader key is configured as `Space`.

### Movement & Editing Shortcuts

| Keybinding | Mode | Action | Target / Function |
|---|---|---|---|
| `<leader>pv` | Normal | File Explorer | Opens default Netrw/directory view |
| `J` | Visual | Block Move Down | Bubble selected block down keeping indentation |
| `K` | Visual | Block Move Up | Bubble selected block up keeping indentation |
| `J` | Normal | Join lines | Join lines while keeping cursor position static |
| `<C-d>` | Normal | Half page down | Scroll down and center cursor (`zz`) |
| `<C-u>` | Normal | Half page up | Scroll up and center cursor (`zz`) |
| `n` | Normal | Next match | Go to next search match and center cursor |
| `N` | Normal | Previous match | Go to previous match and center cursor |
| `<Esc>` | Normal | Clear search | Clear active search highlights |

### Clipboard & Void Register Operations

| Keybinding | Mode | Action | Description |
|---|---|---|---|
| `<leader>y` | Normal/Visual | Copy to OS | Copy selection to system clipboard (`+` register) |
| `<leader>Y` | Normal | Copy line | Copy current line to system clipboard |
| `<leader>p` | Visual | Paste replace | Paste clipboard value over selection without losing register |
| `<leader>dv` | Normal/Visual | Delete to void | Delete selection directly to the void register (`_` register) |

### Navigation & Diagnostics

| Keybinding | Mode | Action | Description |
|---|---|---|---|
| `<C-h/j/k/l>` | Normal | Window focus | Jump focus left, down, up, or right across splits |
| `<leader>cq` | Normal | Location List | Open diagnostic [Q]uickfix list |
| `<leader>cds` | Normal | Docstrings | Call `neogen` to generate code documentation template |

---

## Troubleshooting

### Clipboard copying does not work
If `<leader>y` does not populate your system clipboard, verify you have a clipboard utility installed:
```bash
# Arch Linux (Wayland)
sudo pacman -S wl-clipboard

# Arch Linux (X11)
sudo pacman -S xclip
```

### Treesitter Highlight failures
If code syntax fails or throws errors:
```vim
:TSUpdate
```
This forces Treesitter to recompile language parsers.

### Diagnostic LSP errors
To verify LSP status:
```vim
:LspInfo
```
This shows running language server clients and attachments to the active buffer.

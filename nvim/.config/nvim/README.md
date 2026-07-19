# Neovim Configuration

A robust Neovim configuration built with Lua, featuring custom keymaps and package management via `lazy.nvim`.

## Plugin Ecosystem

Plugins are structured inside `lua/godod1/lazy/`:

- **Completion**: `blink.cmp` provides completions.
- **Environment**: `cloak` hides secrets and environment variables.
- **Formatting**: `conform.nvim` manages auto-formatting.
- **Debugging**: `nvim-dap` controls debugger sessions.
- **LSP**: `nvim-lspconfig` sets up language server attachments.
- **Docstrings**: `neogen` generates code comments.
- **Testing**: `neotest` runs unit tests directly from buffers.
- **fuzzy finder**: `telescope` manages quick searches and files.
- **Syntax**: `nvim-treesitter` handles syntax trees and parsing.
- **Git & History**: `undotree` provides a visual tree of edits.
- **Writing**: `zen-mode` provides distraction-free editing.

## Custom Keymaps

### Normal Mode Navigation & Actions

- **`<leader>pv`**: Open directory explorer.
- **`<C-h>` / `<C-j>` / `<C-k>` / `<C-l>`**: Navigate splits.
- **`<C-d>` / `<C-u>`**: Move half-page keeping cursor centered.
- **`n` / `N`**: Jump search occurrences keeping cursor centered.
- **`<Esc>`**: Clear search highlight.
- **`<leader>cq`**: Open diagnostic location lists.
- **`<leader>cds`**: Call `neogen` docstring generator.

### Clipboard & Registers

- **`<leader>y`** (Normal/Visual): Copy selection to the system clipboard.
- **`<leader>Y`**: Copy line to system clipboard.
- **`<leader>p`** (Visual): Paste over selection without replacing your clipboard register.
- **`<leader>dv`** (Normal/Visual): Delete selection to the void register.

### Visual Mode Movements

- **`J`**: Move highlighted block down.
- **`K`**: Move highlighted block up.

## Autocmds
- **TextYankPost**: Triggers a flash highlight on yanked text to indicate successful copy.

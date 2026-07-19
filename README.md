# Godod's Dotfiles

Personal configuration files (dotfiles) for terminal applications, shell setups, editor environments, and tiling window managers. The configurations are managed using [GNU Stow](https://www.gnu.org/software/stow/) for painless linking across environments.

## Desktop System & Dynamic Theming

This environment is designed with a **Dynamic Color System**:
- Set a new wallpaper using the `wallpaper` command in [fish](file:///home/godod/.dotfiles/fish/.config/fish/README.md).
- [matugen](file:///home/godod/.dotfiles/matugen/.config/matugen/README.md) will extract the wallpaper color palette and automatically re-generate the themes/CSS files for:
  - **Waybar** (status bar)
  - **Rofi** (application menu)
  - **Ghostty** (terminal emulator)
  - **Helix** (text editor)
  - **Yazi** (terminal file manager)
- Services reload automatically on save.

## Prerequisites

1. `bash` >= 5.2 [^1]
2. `Homebrew` (for macOS setups)
3. `yay` (for Arch Linux setups)

## Installation & Deployment

1. Clone this repository to your home folder:
   ```bash
   git clone https://github.com/Godod/dotfiles ~/.dotfiles
   ```
2. Navigate to the folder and run the appropriate installer script inside [installation/](file:///home/godod/.dotfiles/installation/README.md):
   - **Arch Linux**: Run [arch.sh](file:///home/godod/.dotfiles/installation/arch.sh)
   - **macOS**: Run [macos.sh](file:///home/godod/.dotfiles/installation/macos.sh)
3. Re-open your terminal shell.
4. Run `tmux` and press `Ctrl + b` followed by `I` (capital I) to install tmux packages via `tpack`.
5. Enjoy your modern terminal environment! 😉

### Custom Stow Selection

If you only want to install specific configuration files, you can link them individually using Stow. For example:
```bash
stow fish yazi nvim tmux
```

---

## Configuration Directories

Explore the detailed configuration READMEs below to understand what each tool is doing:

| Tool | Config Path | Description |
|---|---|---|
| **[Installation](file:///home/godod/.dotfiles/installation/README.md)** | [installation/](file:///home/godod/.dotfiles/installation) | Installer scripts for Arch and macOS packages, shell default set, and fisher. |
| **[Fish Shell](file:///home/godod/.dotfiles/fish/.config/fish/README.md)** | [fish/](file:///home/godod/.dotfiles/fish/.config/fish) | Fish configurations, custom wallpaper scripts, custom abbreviations, zoxide integrations. |
| **[Helix Editor](file:///home/godod/.dotfiles/helix/.config/helix/README.md)** | [helix/](file:///home/godod/.dotfiles/helix/.config/helix) | Post-modern modal editor settings, keymaps for lazygit/yazi buffers, formatter setup. |
| **[Neovim](file:///home/godod/.dotfiles/nvim/.config/nvim/README.md)** | [nvim/](file:///home/godod/.dotfiles/nvim/.config/nvim) | Lazy.nvim package loading, LSP configurations, custom remaps (Primeagen inspired). |
| **[Tmux](file:///home/godod/.dotfiles/tmux/.config/tmux/README.md)** | [tmux/](file:///home/godod/.dotfiles/tmux/.config/tmux) | Tmux multiplexer, `tpack` plugin configuration, pomodoro, tmux2k Catppuccin theme. |
| **[Yazi](file:///home/godod/.dotfiles/yazi/.config/yazi/README.md)** | [yazi/](file:///home/godod/.dotfiles/yazi/.config/yazi) | Fast terminal file manager, visual wrap settings, material you theme compilation template. |
| **[Hyprland](file:///home/godod/.dotfiles/hypr/.config/hypr/README.md)** | [hypr/](file:///home/godod/.dotfiles/hypr/.config/hypr) | Tiling Window Manager configured via Lua using the `Vicinae` library. |
| **[Waybar](file:///home/godod/.dotfiles/waybar/.config/waybar/README.md)** | [waybar/](file:///home/godod/.dotfiles/waybar/.config/waybar) | Customized status bar modules (tray, clock, audio, network, memory) matching wallpapers. |
| **[SwayNC](file:///home/godod/.dotfiles/swaync/.config/swaync/README.md)** | [swaync/](file:///home/godod/.dotfiles/swaync/.config/swaync) | SwayNotificationCenter notification panel layout and sliders grid. |
| **[Matugen](file:///home/godod/.dotfiles/matugen/.config/matugen/README.md)** | [matugen/](file:///home/godod/.dotfiles/matugen/.config/matugen) | Color generation parameters and post-reload system signals. |
| **[Rofi](file:///home/godod/.dotfiles/rofi/.config/rofi/README.md)** | [rofi/](file:///home/godod/.dotfiles/rofi/.config/rofi) | Application finder and window switching menu configurations. |
| **[Ghostty](file:///home/godod/.dotfiles/ghostty/.config/ghostty/README.md)** | [ghostty/](file:///home/godod/.dotfiles/ghostty/.config/ghostty) | GPU terminal settings, fonts, background opacity overrides. |
| **[Kitty](file:///home/godod/.dotfiles/kitty/.config/kitty/README.md)** | [kitty/](file:///home/godod/.dotfiles/kitty/.config/kitty) | Kitty terminal config with customized cursor trails and theme files. |
| **[Lazygit](file:///home/godod/.dotfiles/lazygit/.config/lazygit/README.md)** | [lazygit/](file:///home/godod/.dotfiles/lazygit/.config/lazygit) | Git terminal view, including custom AI Conventional Commits generation hook. |
| **[Fastfetch](file:///home/godod/.dotfiles/fastfetch/.config/fastfetch/README.md)** | [fastfetch/](file:///home/godod/.dotfiles/fastfetch/.config/fastfetch) | Styled fetch interface listing system specifications and uptime values. |

[^1]: See [tmux2k bug](https://github.com/2KAbhishek/tmux2k/issues/47)

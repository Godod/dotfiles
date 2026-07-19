# Matugen Configuration

Configuration for **Matugen**, a tool that extracts Material You color palettes from wallpapers and populates application stylesheets.

## Templates & Targets

The Matugen system processes target configuration files to apply matching colors across your desktop:

| App | Input Template | Output Target | Post-Hook action |
|---|---|---|---|
| **Waybar** | `~/.config/matugen/templates/waybar-colors.css` | `~/.config/waybar/tokens/colors.css` | `pkill -SIGUSR2 waybar` |
| **Rofi** | `~/.config/matugen/templates/colors-rofi.rasi` | `~/.config/rofi/colors.rasi` | - |
| **Ghostty** | `~/.config/ghostty/auto/colors.txt` | `~/.config/ghostty/themes/Matugen` | `pkill -SIGUSR2 ghostty` |
| **Helix** | `~/.config/helix/colors.txt` | `~/.config/helix/themes/matugen.toml` | - |
| **Yazi** | `~/.config/yazi/config.toml` | `~/.config/yazi/theme.toml` | - |

## Dynamic Theme Integration

This configuration is executed automatically when using the `wallpaper` command in Fish, generating new UI stylesheets instantly when a new background is set.

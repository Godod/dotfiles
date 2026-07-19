# Rofi Launcher Configuration

A customized application launcher and menu layout configured using RASI stylesheets and Papirus icons.

## Features

- **Typography**: Uses `Google Sans Code 11`.
- **Icon Set**: Complemented by the `Papirus` icon theme.
- **Dynamic Theming**: Imports `colors.rasi` generated dynamically from wallpapers via `matugen`. Colors are applied to input elements, backgrounds, and borders automatically.
- **Launcher Modes**: Configured with support for `drun`, `filebrowser`, `window`, and `run`.

## Styles & Themes

Alternative themes are located inside `themes/`:
- **`default`**: A clean grid format (4 columns x 3 lines) with a sidebar mode switcher.
- **`white`**, **`black`**, **`white-purple`**, **`green`**: Additional color overrides.

## Integration

Launches automatically using `Super + R` from the Hyprland bindings, mapping your custom active Rofi theme to match your system wallpapers.

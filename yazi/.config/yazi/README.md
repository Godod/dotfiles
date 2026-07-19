# Yazi File Manager Configuration

A custom styling and layout configuration for the terminal file manager **Yazi**.

## Structure & Configuration Files

- **`yazi.toml`**: Main configuration file:
  - Displays hidden files by default.
  - Enables soft wrap on file previews.
  - Tab size set to 4.
- **`config.toml`**: Theming template file:
  - Configures colors for cursors, selections, tabs, indicator bars, prompts, and status messages.
  - Contains double-curly-brace color placeholders (e.g., `{{colors.primary.default.hex}}`) to map Material You theme colors.
- **`theme.toml`**: The active theme stylesheet compiled dynamically by `matugen` from `config.toml` on wallpaper changes.

## Integration

Used inside the `wallpaper` chooser command in fish shell for visual picture selection and acts as a fast workspace navigator wrapper using the `y` shell function.

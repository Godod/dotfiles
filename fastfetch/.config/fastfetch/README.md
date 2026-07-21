# Fastfetch Configuration

An aesthetically pleasing and clean configuration for **Fastfetch**, a super-fast, highly customizable system information fetching tool.

## Overview

This configuration moves away from basic text layouts to present a styled card layout. It groups system details into logical blocks with custom icons and custom OS installation age calculation.

### Key Features

- **Double-Box Layout**: Displays system info (OS, Host, Kernel, Terminal) in the top block, and hardware specs (CPU, GPU, Memory, Display, Uptime) in the bottom block.
- **Custom OS Age Calculator**: Calculates the number of days since the root directory `/` was created to output the system installation age.
- **Custom Logo Styling**: Automatically displays the host OS logo (configured with custom Cyan and Purple highlights for Arch).
- **Aesthetic Accents**: Ends with a clean row of terminal color indicator dots.

---

## Tech Stack & Dependencies

- **System Fetch Tool**: `fastfetch` (v2.0.0+)
- **OS**: Works on Arch Linux or macOS (logo adapts automatically or defaults to source).

---

## Directory Structure

```
fastfetch/
└── .config/
    └── fastfetch/
        ├── config.jsonc    # JSON with comments layout file
        └── README.md       # Configuration documentation
```

---

## Configuration Details

### 1. Logo Parameters
```json
"logo": {
  "type": "auto",
  "source": "arch",
  "color": {
    "1": "#00D1FF",
    "2": "#BD93F9"
  }
}
```
- Configures the Arch logo with high-contrast Cyan and Purple colors to match the theme.

### 2. Custom Command Module (OS Age)
Calculates OS age in days using:
```json
"text": "birthd=$(stat -c %W /); echo $(( ( $(date +%s) - birthd ) / 86400 )) days"
```

### 3. Display Format
Formats resolutions and refresh rates cleanly:
```json
"format": "{width}x{height} @ {refresh-rate} Hz"
```

---

## Usage

Fastfetch is configured to launch with the alias `btw` in the Fish shell:

```bash
btw
```

Or run it directly:

```bash
fastfetch
# Or specify this configuration explicitly
fastfetch --config ~/.config/fastfetch/config.jsonc
```

---

## Customization

### Changing the Logo
To display a different ASCII distro logo (or a custom image/txt file), edit `config.jsonc`:

```json
"logo": {
  "source": "ubuntu" // or path to a file "/path/to/ascii.txt"
}
```

### Editing Display Modules
You can toggle modules by editing the `"modules"` array in `config.jsonc`. Available module types include:
- `os`, `host`, `kernel`, `uptime`, `packages`, `shell`, `display`, `de`, `wm`, `terminal`, `cpu`, `gpu`, `memory`, `disk`, `battery`, `locale`.

---

## Troubleshooting

### Missing Icons
If icons (like 󰣇, , ) show as empty blocks or invalid characters, verify that you have a **Nerd Font** installed and set as the active font in your terminal emulator (Ghostty, Kitty).

### JSONC Syntax Errors
Fastfetch uses JSONC (JSON with comments). Ensure you do not leave trailing commas in arrays/objects where they are not supported by some strict parsers, and maintain correct JSON syntax:
```bash
# Validate configuration file structure
fastfetch --print-config
```

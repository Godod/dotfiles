if type -q hyprpaper
    function wallpaper
        # Function to visually select and apply a wallpaper using Yazi,
        # and select a Rofi theme using fzf.
        # It saves WALLPAPER_PATH and ROFI_THEME to the systemd environment.

        set -l DIR "$HOME/Pictures/Wallhaven"
        set -l ROFI_DIR "$HOME/.config/rofi/themes"

        # Check if the wallpaper directory has files
        if test (count $DIR/*) -eq 0
            echo -e "\e[38;2;239;69;56m  ✗  Folder is empty or does not exist: $DIR\e[0m"
            return
        end

        # Create a temporary file to store the selected file path from Yazi
        set -l tmpfile (mktemp)

        # Launch Yazi in chooser mode directly in the wallpapers directory
        yazi "$DIR" --chooser-file="$tmpfile"

        # Read the selected file path
        set -l FULL_PATH (cat "$tmpfile")

        # Clean up the temporary file
        rm -f "$tmpfile"

        # Stop execution if the user cancels Yazi selection (e.g., presses 'q' or 'Esc')
        if test -z "$FULL_PATH"
            clear
            echo -e "  \e[38;2;239;69;56m✗  Wallpaper selection cancelled\e[0m"
            echo ""
            return
        end

        # Save the wallpaper path to the systemd environment
        systemctl --user set-environment WALLPAPER_PATH="$FULL_PATH"
        set -l SELECTED_WALL (basename "$FULL_PATH")

        # Check if Rofi themes directory exists
        if not test -d "$ROFI_DIR"
            echo -e "  \e[38;2;239;69;56m✗  Rofi themes folder does not exist: $ROFI_DIR\e[0m"
            return
        end

        # Use fzf to select a Rofi theme
        set -l SELECTED_THEME (command ls "$ROFI_DIR" | fzf \
        --prompt="❯ Choose Rofi Theme: " \
        --layout=reverse \
        --border=rounded)

        # Stop execution if the user cancels fzf selection
        if test -z "$SELECTED_THEME"
            clear
            echo -e "  \e[38;2;239;69;56m✗  Rofi theme selection cancelled\e[0m"
            echo ""
            return
        end

        # Save the Rofi theme path to the systemd environment
        systemctl --user set-environment ROFI_THEME="$ROFI_DIR/$SELECTED_THEME"

        # Clear screen and show the banner only after all selections are made
        clear
        echo ""
        echo -e "\e[38;2;239;69;56m  ██╗    ██╗  █████╗  ██╗      ██╗     \e[0m"
        echo -e "\e[38;2;224;64;112m  ██║    ██║ ██╔══██╗ ██║      ██║     \e[0m"
        echo -e "\e[38;2;204;61;144m  ██║ █╗ ██║ ███████║ ██║      ██║     \e[0m"
        echo -e "\e[38;2;179;58;168m  ██║███╗██║ ██╔══██║ ██║      ██║     \e[0m"
        echo -e "\e[38;2;160;55;190m  ╚███╔███╔╝ ██║  ██║ ███████╗ ███████╗\e[0m"
        echo -e "\e[38;2;155;52;200m   ╚══╝╚══╝  ╚═╝  ╚═╝ ╚══════╝ ╚══════╝\e[0m"
        echo ""
        echo -e "\e[38;2;155;52;200m  ──────────────────────────────────\e[0m"
        echo -e "\e[38;2;0;210;210m          Hyprpaper Selector\e[0m"
        echo -e "\e[38;2;155;52;200m  ──────────────────────────────────\e[0m"
        echo ""

        echo -e "  \e[38;2;0;210;210m󰔟  Replacing Wallpaper...\e[0m"

        # Reload hyprpaper with the new image
        hyprctl hyprpaper unload all >/dev/null 2>&1
        hyprctl hyprpaper preload "$FULL_PATH" >/dev/null 2>&1
        sleep 0.1
        hyprctl hyprpaper wallpaper ",$FULL_PATH" >/dev/null 2>&1

        echo -e "  \e[38;2;0;210;210m󰔟  Generating Colors...\e[0m"

        # Generate system colors using matugen
        matugen image "$FULL_PATH" --source-color-index 0 >/dev/null 2>&1

        echo -e "  \e[38;2;0;210;210m✓  Wallpaper: $SELECTED_WALL\e[0m"
        echo -e "  \e[38;2;0;210;210m✓  Rofi Theme: $SELECTED_THEME\e[0m"
        echo ""
    end
end

# use 'y' word  instead of 'yazi'
if type -q yazi
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
end

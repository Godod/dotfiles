if type -q hyprpaper
    function wallpaper
        # Function to visually select and apply a wallpaper using Yazi
        set -l DIR "$HOME/Pictures/Wallhaven"

        # Check if the directory has files
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
            echo -e "  \e[38;2;239;69;56m✗  Selection cancelled\e[0m"
            echo ""
            return
        end

        # Extract just the filename for the success message
        set -l SELECTED_WALL (basename "$FULL_PATH")

        # Clear screen and show the banner only after Yazi exits
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

        echo -e "  \e[38;2;0;210;210m✓  $SELECTED_WALL\e[0m"
        echo ""
    end
    # function wallpaper
    #     set -l DIR "$HOME/Pictures/Wallhaven"
    #     clear
    #     echo ""
    #     echo -e "\e[38;2;239;69;56m  ██╗    ██╗  █████╗  ██╗      ██╗     \e[0m"
    #     echo -e "\e[38;2;224;64;112m  ██║    ██║ ██╔══██╗ ██║      ██║     \e[0m"
    #     echo -e "\e[38;2;204;61;144m  ██║ █╗ ██║ ███████║ ██║      ██║     \e[0m"
    #     echo -e "\e[38;2;179;58;168m  ██║███╗██║ ██╔══██║ ██║      ██║     \e[0m"
    #     echo -e "\e[38;2;160;55;190m  ╚███╔███╔╝ ██║  ██║ ███████╗ ███████╗\e[0m"
    #     echo -e "\e[38;2;155;52;200m   ╚══╝╚══╝  ╚═╝  ╚═╝ ╚══════╝ ╚══════╝\e[0m"
    #     echo ""
    #     echo -e "\e[38;2;155;52;200m  ──────────────────────────────────\e[0m"
    #     echo -e "\e[38;2;0;210;210m          Hyprpaper Selector\e[0m"
    #     echo -e "\e[38;2;155;52;200m  ──────────────────────────────────\e[0m"
    #     echo ""

    #     set -l WALLS
    #     for f in $DIR/*
    #         if test -f "$f"
    #             set -a WALLS (basename "$f")
    #         end
    #     end

    #     if test (count $WALLS) -eq 0
    #         echo -e "\e[38;2;239;69;56m  ✗  folder empty $DIR\e[0m"
    #         return
    #     end

    #     for i in (seq 1 (count $WALLS))
    #         if test (math "$i % 2") -eq 0
    #             echo -e "  \e[38;2;155;52;200m$i\e[0m  \e[38;2;180;180;180m$WALLS[$i]\e[0m"
    #         else
    #             echo -e "  \e[38;2;239;69;56m$i\e[0m  \e[38;2;220;220;220m$WALLS[$i]\e[0m"
    #         end
    #     end

    #     echo ""
    #     echo -e "\e[38;2;155;52;200m  ──────────────────────────────────\e[0m"
    #     echo ""
    #     echo -ne "  \e[38;2;0;210;210m❯ Choose  \e[0m"

    #     # Read user input into a local variable
    #     read -l SELECTION
    #     echo ""

    #     # Check if input is a number and is within the correct range
    #     if string match -qr '^[0-9]+$' -- "$SELECTION"; and test "$SELECTION" -ge 1; and test "$SELECTION" -le (count $WALLS)
    #         set -l SELECTED_WALL $WALLS[$SELECTION]
    #         set -l FULL_PATH "$DIR/$SELECTED_WALL"

    #         echo -e "  \e[38;2;0;210;210m󰔟  Replacing Wallpaper...\e[0m"
    #         hyprctl hyprpaper unload all >/dev/null 2>&1
    #         hyprctl hyprpaper preload "$FULL_PATH" >/dev/null 2>&1
    #         sleep 0.1
    #         hyprctl hyprpaper wallpaper ",$FULL_PATH" >/dev/null 2>&1

    #         echo -e "  \e[38;2;0;210;210m󰔟  Generating Colors...\e[0m" # matugen
    #         matugen image "$FULL_PATH" --source-color-index 0 >/dev/null 2>&1 # matugen

    #         echo -e "  \e[38;2;0;210;210m✓  $SELECTED_WALL\e[0m"
    #         echo ""
    #     else
    #         echo -e "  \e[38;2;0;210;210m✗  Wrong number!!\e[0m"
    #         echo ""
    #     end
    # end
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

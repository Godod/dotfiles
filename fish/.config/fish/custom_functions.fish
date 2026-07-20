if type -q hyprpaper
    function _print_error -d "Print error message in red"
        echo -e "\e[38;2;239;69;56m  ✗  $argv\e[0m"
    end

    function _print_step -d "Print process step in blue"
        echo -e "  \e[38;2;0;210;210m󰔟  $argv\e[0m"
    end

    function _print_success -d "Print success message in blue"
        echo -e "  \e[38;2;0;210;210m✓  $argv\e[0m"
    end

    function _print_banner -d "Print the ASCII banner"
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
    end

    function _validate_directories -d "Check if required directories exist and have files"
        set -l wall_dir $argv[1]
        set -l rofi_dir $argv[2]

        if test (count "$wall_dir"/*) -eq 0
            _print_error "Folder is empty or does not exist: $wall_dir"
            return 1
        end

        if not test -d "$rofi_dir"
            _print_error "Rofi themes folder does not exist: $rofi_dir"
            return 1
        end

        return 0
    end

    function _select_wallpaper -d "Use Yazi to select a wallpaper"
        set -l dir $argv[1]
        set -l tmpfile (mktemp)

        yazi "$dir" --chooser-file="$tmpfile"
        cat "$tmpfile"
        rm -f "$tmpfile"
    end

    function _select_rofi_theme -d "Use fzf to select a Rofi theme"
        set -l dir $argv[1]
        command ls "$dir" | fzf --prompt="❯ Choose Rofi Theme: " --layout=reverse --border=rounded
    end

    function _save_environment -d "Save paths to systemd environment"
        set -l wall_path $argv[1]
        set -l rofi_theme $argv[2]

        systemctl --user set-environment WALLPAPER_PATH="$wall_path"
        systemctl --user set-environment ROFI_THEME="$rofi_theme"
    end

    function _apply_wallpaper -d "Apply wallpaper using hyprpaper"
        set -l full_path $argv[1]

        _print_step "Replacing Wallpaper..."
        hyprctl hyprpaper unload all >/dev/null 2>&1
        hyprctl hyprpaper preload "$full_path" >/dev/null 2>&1
        sleep 0.1
        hyprctl hyprpaper wallpaper ",$full_path" >/dev/null 2>&1
    end

    function _generate_colors -d "Generate system colors using matugen"
        set -l full_path $argv[1]

        _print_step "Generating Colors..."
        matugen image "$full_path" --source-color-index 0 >/dev/null 2>&1
    end

    function wallpaper -d "Main function to set wallpaper and Rofi theme"
        set -l wall_dir "$HOME/Pictures/Wallpapers"
        set -l rofi_dir "$HOME/.config/rofi/themes"

        # 1. Validation
        if not _validate_directories "$wall_dir" "$rofi_dir"
            return 1
        end

        # 2. Get user choices
        set -l full_path (_select_wallpaper "$wall_dir")
        if test -z "$full_path"
            clear
            _print_error "Wallpaper selection cancelled"
            return 1
        end

        set -l selected_theme (_select_rofi_theme "$rofi_dir")
        if test -z "$selected_theme"
            clear
            _print_error "Rofi theme selection cancelled"
            return 1
        end

        # 3. Process the changes
        _print_banner

        _save_environment "$full_path" "$rofi_dir/$selected_theme"
        _apply_wallpaper "$full_path"
        _generate_colors "$full_path"

        # 4. Show results
        set -l selected_wall (basename "$full_path")
        _print_success "Wallpaper: $selected_wall"
        _print_success "Rofi Theme: $selected_theme"
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

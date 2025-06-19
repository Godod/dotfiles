# Disable the fish greeting message
set fish_greeting ""

# Add brew path if brew is installed
if path is /opt/homebrew/
    fish_add_path (brew --prefix)/bin

    # Add short alias to upgrade brew packages
    abbr -a -g bubug "brew update && brew upgrade && brew upgrade --cask && brew cleanup"

    # Add brew completions to fish
    if test -d (brew --prefix)"/share/fish/completions"
        set -p fish_complete_path (brew --prefix)/share/fish/completions
    end

    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end
end

# Add local bin to fish path
if path is $HOME/.local/
    fish_add_path $HOME/.local/bin
end

# `ts` -> `$HOME/.tmux/sessios` abbreviation
abbr -a -g ts $HOME/.config/tmux/session

if type -q eza
    # `ls` -> `eza` abbreviation
    abbr -a -g ls eza --icons --group-directories-first

    # `ll` -> `eza -1la` abbreviation
    abbr -a -g ll eza -la -s size --icons --group-directories-first
end

if type -q lazygit
    # `lg` -> `lazygit` abbreviation
    abbr -a -g lg lazygit
end

if type -q nvim
    # `nv` -> `nvim` abbreviation
    abbr -a -g nv nvim
end

if type -q helix
    # `hx` -> `helix` abbreviation
    abbr -a -g hx helix

    # Set default editor
    set -gx EDITOR (which helix)
end

# `cat` → `bat` abbreviation
# Requires `brew install bat`
if type -q bat
    abbr --add -g cat bat
end

# Add global alias 't' from tmux-session-wizard plugin
if path is $HOME/.config/tmux/plugins/tmux-session-wizard/bin
    fish_add_path $HOME/.config/tmux/plugins/tmux-session-wizard/bin
end

# use 'y' word  instead of 'yazi'
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Man pages in Helix
set -g MANPAGER 'hx +Man!'

# Zoxide installation
zoxide init fish | source

if status is-interactive
    # runs only when user login
end

# Disable the fish greeting message
set fish_greeting ""

# Add brew path if brew is installed
if path is /opt/homebrew/
    fish_add_path /opt/homebrew/bin
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
end

# `cat` → `bat` abbreviation
# Requires `brew install bat`
if type -q bat
    abbr --add -g cat bat
end

# Man pages in NeoVim
set -g MANPAGER 'helix +Man!'

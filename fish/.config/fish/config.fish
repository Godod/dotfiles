if status is-interactive
    # runs only when user login
end

# Disable the fish greeting message
set fish_greeting ""

# `ts` -> `$HOME/.tmux/sessios` abbreviation
abbr -a -g ts $HOME/.config/tmux/session

if type -q eza
    # `ls` -> `eza` abbreviation
    abbr -a -g ls eza

    # `ll` -> `eza -1la` abbreviation
    abbr -a -g ll eza -1las type
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

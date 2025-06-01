if status is-interactive 
    # runs only when user login
end

# Disable the fish greeting message
set fish_greeting ""

# `ls` -> `eza` abbreviation
abbr -a -g ls eza

# `ll` -> `eza -1la` abbreviation
abbr -a -g ll eza -1las type

# `lg` -> `lazygit` abbreviation
abbr -a -g lg lazygit

# `nv` -> `nvim` abbreviation
abbr -a -g nv nvim

# `ts` -> `$HOME/.tmux/sessios` abbreviation
abbr -a -g ts $HOME/.tmux/session

# `cat` → `bat` abbreviation
# Requires `brew install bat`
if type -q bat
  abbr --add -g cat 'bat'
end

# Man pages in NeoVim
set -g MANPAGER 'nvim +Man!'

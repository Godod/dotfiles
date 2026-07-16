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

# Add NPM global package libraries to work without sudo
if path is $HOME/.local/share/npm-global/
    fish_add_path $HOME/.local/share/npm-global/bin
end

# Add local bin to fish path
if path is $HOME/.local/
    fish_add_path $HOME/.local/bin
end

# Add global alias 't' from tmux-session-wizard plugin
if path is $HOME/.config/tmux/plugins/tmux-session-wizard/bin
    fish_add_path $HOME/.config/tmux/plugins/tmux-session-wizard/bin
end

# Added by Antigravity
if path is $HOME/.antigravity
    fish_add_path $HOME/.antigravity/antigravity/bin
end

# Add Cargo bin folder to fish path
if path is $HOME/.cargo/bin
    fish_add_path $HOME/.cargo/bin
end

# `ts` -> `$HOME/.tmux/sessios`
abbr -a -g ts $HOME/.config/tmux/session

# We're trying nls lib instead of eza
# if type -q eza
#     # `ls` -> `eza`
#     abbr -a -g ls eza --icons --group-directories-first

#     # `ll` -> `eza -1la`
#     abbr -a -g ll eza -la -s size --icons --group-directories-first
# end

if type -q nls
    # `ls` -> `nls`
    abbr -a -g ls nls -AS --group-directories-first

    # `ll` -> `nls long`
    abbr -a -g ll nls -ASgl --group-directories-first
end

if type -q lazygit
    # `lg` -> `lazygit`
    abbr -a -g lg lazygit
end

if type -q nvim
    # `nv` -> `nvim`
    abbr -a -g nv nvim
end

if type -q helix
    # `hx` -> `helix`
    abbr -a -g hx /usr/lib64/helix/hx

    # Set default editor
    set -gx EDITOR /usr/lib64/helix/hx
end

# `cat` → `bat`
# Requires `brew install bat`
if type -q bat
    abbr -a -g cat bat
    abbr -a -g c bat
end

# `btw` -> `macchina`
# Requires `brew install macchina`
if type -q macchina
    abbr -a -g btw macchina --theme custom --show host,kernel,distribution,packages,desktop-environment,memory,processor-load,shell,terminal,window-manager,battery
end

# `lq` -> `lazysql`
# Requires `brew install lazysql`
if type -q sabiql
    abbr -a -g lq sabiql
end

# `ld` -> `lazydocker`
# Requires `brew install lazydocker`
if type -q lazydocker
    abbr -a -g ld lazydocker
end

# Man pages in Helix
set -gx MANPAGER 'helix +Man!'

# use 'y' word  instead of 'yazi'
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function quotes --description 'Linus Torvalds quotes'
    set -l quotes \
        "Talk is cheap. Show me the code." \
        "A computer is like air conditioning - it becomes useless when you open Windows." \
        "All operating systems suck, but Linux just sucks less." \
        "Standards are paper. I use paper to wipe my butt every day. Reality is what matters." \
        "Intelligence is the ability to avoid doing work, yet getting the work done." \
        "Software is like sex: it's better when it's free." \
        "Nobody actually creates perfect code the first time around, except me. But there's only one of me." \
        "Bad programmers worry about the code. Good programmers worry about data structures and their relationships." \
        "Theory and practice sometimes clash. And when that happens, theory loses. Every single time." \
        "I like offending people, because I think people who get offended should be offended." \
        "Regression testing? What's that? If it compiles, it is good; if it boots up, it is perfect." \
        "Those that can, do. Those that can't, complain."

    set -l selected_quote (random choice $quotes)

    set -l cyan (set_color cyan)
    set -l normal (set_color normal)

    echo -e ""$cyan"💬 \"$selected_quote\""$normal" — Linus Torvalds"
end
quotes

# Zoxide installation
zoxide init fish | source

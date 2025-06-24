# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="awesomepanda"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(command-not-found docker alias-finder eza python themes fzf)

# Docker plugin configuration
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Alias-finder plugin configuration
zstyle ':omz:plugins:alias-finder' autoload yes
zstyle ':omz:plugins:alias-finder' longer yes

# eza plugin configuration
zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'icons' yes

# Init OMZ
source $ZSH/oh-my-zsh.sh

# Custom PATHs
if [ -d "$HOME/.local/bin" ]; then
  export PATH=$PATH:$HOME/.local/bin
fi

# Custom aliases
alias lg="lazygit"
alias ts="$HOME/.tmux/session"
alias hx="/opt/homebrew/bin/hx"
alias y="yazi"
alias nv="nvim"
alias cat="bat"
alias l="eza"
alias ls="eza --icons --group-directories-first"
alias ll="eza -la -s size --icons --group-directories-first"
alias bubug="brew update && brew upgrade && brew upgrade --cask && brew cleanup"

# Custom file
if [ -f $HOME/.zshrc_custom ]; then
  source $HOME/.zshrc_custom
fi


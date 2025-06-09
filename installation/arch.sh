#!/usr/bin/env bash 

# Base packages
sudo pacman -S git base-devel fish fisher fzf fd bat tmux neovim deno lazygit eza helix stow zoxide yazi

# OMZ installation (we're testing fish)
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install fish as user default shell
chsh -s /bin/fish

# TPM activation
git submodule init
git submodule update

# Reload configuration
./apply

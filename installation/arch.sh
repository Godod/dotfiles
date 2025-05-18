#!/usr/bin/env bash

# Base packages
sudo pacman -S git base-devel zsh fzf tmux neovim deno lazygit

# OMZ installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# TPM activation
git submodule init
git submodule update

# Reload configuration
./reload

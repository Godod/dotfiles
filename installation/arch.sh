#!/usr/bin/env bash 

# Base packages
yay -S git base-devel fish fisher fzf fd bat tmux neovim deno lazygit eza helix stow zoxide yazi markdown-oxide-git bash

# OMZ installation (we're testing fish)
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install fish as user default shell
chsh -s /bin/fish

# Activate new shell
# fish

# Install fish plugins
fish ./installation/plugins.fish

# Apply configuration
./apply

# Install TPM
rm -rf ~/.config/tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# Run tmux fish configuration
# tide configure

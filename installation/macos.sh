#!/usr/bin/env bash

brew install fish fisher fzf fd bat tmux deno lazygit eza helix stow dive zoxide yazi markdown-oxide

# Add fish to /etc/shells, because brew doesn't do it
echo $(which fish) | sudo tee -a /etc/shells

# Install fish as user default shell
chsh -s $(which fish)

# Activate new shell
fish

# Install fish plugins
fish ./plugins.fish

# Apply configuration
./apply

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

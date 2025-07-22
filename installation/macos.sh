#!/usr/bin/env bash

brew install fish fisher fzf fd bat tmux deno lazygit eza helix stow dive zoxide yazi markdown-oxide bash

# Add fish to /etc/shells, because brew doesn't do it
echo $(which fish) | sudo tee -a /etc/shells

# Install fish as user default shell
chsh -s $(which fish)

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


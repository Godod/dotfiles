#!/usr/bin/env bash

# Homebrew installation
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fish fisher fzf fd bat tmux deno lazygit eza helix stow dive zoxide yazi

# Add fish to /etc/shells, because brew doesn't do it
echo $(which fish) | sudo tee -a /etc/shells

# Install fish as user default shell
chsh -s $(which fish)

# TPM activation
git submodule init
git submodule update

# Reload configuration
./apply

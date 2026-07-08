#!/usr/bin/env bash

printf "👉 Installing packages..."
# Install tap for lazydocker
brew install jesseduffield/lazydocker/lazydocker
# Install tap for dblab
brew tap danvergara/tools
# Main installation
brew install fish fisher fzf fd bat tmux deno lazygit eza helix stow dive zoxide yazi bash tmuxpack/tpack/tpack macchina marksman lazydocker dblab
brew install --cask dblab

printf "👉 Setup fish as default shell..."
# Add fish to /etc/shells, because brew doesn't do it
echo $(which fish) | sudo tee -a /etc/shells

# Install fish as user default shell
chsh -s $(which fish)

# Install fish plugins
printf "👉 Installing fish plugins..."
fish ./installation/plugins.fish

# Apply configuration
printf "👉 Appling all configuration..."
./apply

# Remove previous configuration TPM
printf "🔴 Removing TPM from Tmux..."
rm -rf ~/.config/tmux/plugins/tpm

# Run tmux fish configuration
printf "⚠️ Please, run `tide configure` to configure your shell experience!"

printf "🚀 That's it, folks!"

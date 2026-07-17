#!/usr/bin/env bash

printf "👉 Installing packages...\n"
# Install tap for lazydocker
brew install jesseduffield/lazydocker/lazydocker
# Install tap for dblab
brew tap danvergara/tools
# Install tap for nls lib
brew tap nolight132/tap
# Main installation
brew install fish fisher fzf fd bat tmux deno lazygit eza helix stow dive zoxide yazi bash tmuxpack/tpack/tpack macchina marksman lazydocker dblab nls riii111/sabiql/sabiql
brew install --cask dblab

printf "👉 Setup fish as default shell...\n"
# Add fish to /etc/shells, because brew doesn't do it
echo $(which fish) | sudo tee -a /etc/shells

# Install fish as user default shell
chsh -s $(which fish)

# Install fish plugins
printf "👉 Installing fish plugins...\n"
fish ./installation/plugins.fish

# Apply configuration
printf "👉 Appling all configuration...\n"
./apply

# Remove previous configuration TPM
printf "🔴 Removing TPM from Tmux...\n"
rm -rf ~/.config/tmux/plugins/tpm

# Run tmux fish configuration
printf "⚠️ Please, run `tide configure` to configure your shell experience!\n"

printf "🚀 That's it, folks!\n"

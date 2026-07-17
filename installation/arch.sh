#!/usr/bin/env bash

# Base packages
printf "👉 Installing packages...\n"
yay -S git base-devel fish fisher fzf fd bat tmux neovim deno lazygit eza helix stow zoxide yazi bash tpack-bin macchina dblab-bin marksman lazydocker nls-bin vicinae-bin sabiql

# Install fish as user default shell
printf "👉 Setup fish as default shell...\n"
chsh -s /bin/fish

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

#!/usr/bin/env bash 

# Base packages
printf "👉 Installing packages..."
yay -S git base-devel fish fisher fzf fd bat tmux neovim deno lazygit eza helix stow zoxide yazi bash tpack-bin macchina dblab-bin marksman lazydocker nls-bin vicinae-bin

# Install fish as user default shell
printf "👉 Setup fish as default shell..."
chsh -s /bin/fish

# Install fish plugins
printf "👉 Installing fish plugins..."
fish ./installation/plugins.fish

# Install autocommit2 to use AI commits
printf "🔴 Installing AICommit2 ..."
sudo npm install -g aicommit2

# Apply configuration
printf "👉 Appling all configuration..."
./apply

# Remove previous configuration TPM
printf "🔴 Removing TPM from Tmux..."
rm -rf ~/.config/tmux/plugins/tpm

# Run tmux fish configuration
printf "⚠️ Please, run `tide configure` to configure your shell experience!"

printf "🚀 That's it, folks!"

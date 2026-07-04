#!/usr/bin/env bash 

# Base packages
printf "👉 Installing packages..."
yay -S git base-devel fish fisher fzf fd bat tmux neovim deno lazygit eza helix stow zoxide yazi bash tpack-bin macchina

# OMZ installation (we're testing fish)
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install fish as user default shell
printf "👉 Setup fish as default shell..."
chsh -s /bin/fish

# Activate new shell
# fish

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
printf "⚠️ Please, run `aicommit2 setup` to configure your AI provider!"
# tide configure

printf "🚀 That's it, folks!"

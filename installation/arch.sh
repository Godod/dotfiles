#!/usr/bin/env bash 

# Base packages
sudo pacman -S git base-devel fish fisher fzf fd bat tmux neovim deno lazygit eza helix stow zoxide yazi markdown-oxide-git

# OMZ installation (we're testing fish)
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install fish as user default shell
chsh -s /bin/fish

# Activate new shell
fish

# Install fish plugins
fish ./plugins.fish

# Apply configuration
./apply

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

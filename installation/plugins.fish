#!/usr/bin/env fish

# Add homebrew to knowledge of fish
fish_add_path "/opt/homebrew/bin/"

# Install fish plugins
fisher install IlanCosman/tide@v6 PatrickF1/fzf.fish jorgebucaran/autopair.fish gazorby/fish-abbreviation-tips 

# Update every plugin after installation due to number of editing file
fisher update

# Activation eza as ls command
set fzf_preview_dir_cmd eza -1la --color=always

# Update all completions
fish_update_completions

#!/usr/bin/env fish

# Install fish plugins
fisher install IlanCosman/tide@v6 PatrickF1/fzf.fish jorgebucaran/autopair.fish gazorby/fish-abbreviation-tips

# Update every plugin after installation due to number of editing file
fisher update

# Activation eza as ls command
set fzf_preview_dir_cmd eza -las type --color=always

# Update all completions
fish_update_completions

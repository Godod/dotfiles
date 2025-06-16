# dotfiles
Configuration files for different stuff

## nvim
nvim configuration inspired by [ThePrimeagen repo](https://github.com/ThePrimeagen/init.lua/tree/master) and [kickstarter](https://github.com/nvim-lua/kickstart.nvim/tree/master)

## Installation
1. Clone this repo
```bash
git clone https://github.com/Godod/dotfiles ~/.dotfiles
```
2. Run script from `installation` folder, like
```bash
cd ~/.dotfiles
./installation/arch.sh
```
3. Re-open your terminal and install additional plugins:
```bash
cd ~/.dotfiles
fish ./installation/plugins.fish
```
4. Apply your configuration:
```bash
./apply
```
5. Re-open your terminal and use it ;)

#### To install only necessary lib, please, use following command

```bash
stow fish/yazi/nvim/etc
```

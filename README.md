# dotfiles
Configuration files for different stuff

## nvim
nvim configuration inspired by [ThePrimeagen repo](https://github.com/ThePrimeagen/init.lua/tree/master) and [kickstarter](https://github.com/nvim-lua/kickstart.nvim/tree/master)

## Prerequisites
1. `bash` > 5.2 [^1]
2. `Homebrew` for MacOS

## Installation
1. Clone this repo
```bash
git clone https://github.com/Godod/dotfiles ~/.dotfiles
```
2. Run script from `installation` folder, like
```bash
cd ~/.dotfiles && ./installation/arch.sh
```
3. Re-open your terminal, run `tmux` command and press `<C-b> + I` to install packages
4. Enjoy ;)

#### To install only necessary lib, please, use following command

```bash
stow fish/yazi/nvim/etc
```


[^1]: See [tmux2k bug](https://github.com/2KAbhishek/tmux2k/issues/47) 

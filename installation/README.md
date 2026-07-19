# Dotfiles Installation

Scripts to automate the installation of packages and application of dotfiles configurations for Arch Linux and macOS.

## Configuration Flow

1. **System Packages**: Installs CLI utilities, dev tools, and desktop widgets using `yay` (Arch Linux) or `Homebrew` (macOS).
2. **Default Shell**: Registers and changes the default login shell to `fish`.
3. **Fish Plugins**: Installs plugins (`fisher`, `tide`, `fzf.fish`, `autopair`) via [Fisher](https://github.com/jorgebucaran/fisher).
4. **Stow Configs**: Runs the `./apply` script to symlink directories into `~/.config/` using [GNU Stow](https://www.gnu.org/software/stow/).
5. **Tmux Plugins**: Configures and prepares plugins using the modern Rust-based Tmux package manager `tpack`.

## Scripts

- **`arch.sh`**: Installs packages using `yay` and sets up the user environment on Arch Linux.
- **`macos.sh`**: Installs packages using `brew` and sets up the environment on macOS.
- **`plugins.fish`**: Executed automatically by the installers to configure fisher and install fish shell plugins.

## Usage

For **Arch Linux**:
```bash
./installation/arch.sh
```

For **macOS**:
```bash
./installation/macos.sh
```

## Post-Installation

1. **Configure Prompt**: Run `tide configure` in your shell to customize the Tide prompt theme.
2. **Install Tmux Plugins**: Open a tmux session and press `Ctrl + b` followed by `I` (capital I) to install tmux packages.

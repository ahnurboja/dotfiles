# Dotfiles

Personal configuration and environment bootstrapper for macOS.

## Overview

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks and [Homebrew](https://brew.sh/) to manage packages and applications. It is designed to be a "one-click" setup for a new development environment.

## What's Included?

- **Shell:** Zsh with [Oh My Zsh](https://ohmyz.sh/) and custom `.zshrc`.
- **Git:** Optimized `.gitconfig` with helpful aliases (`st`, `co`, `br`, `hist`).
- **Terminal:** [iTerm2](https://iterm2.com/) for a better terminal experience.
- **Editor:** [Visual Studio Code](https://code.visualstudio.com/) with a CLI-integrated workflow.
- **CLI Tools:** [gemini-cli](https://github.com/google/gemini-cli), `git`, `coreutils`, and more.

## Quick Start

To set up a new machine, clone this repository and run the setup script:

```bash
# 1. Clone the repository
git clone <your-repo-url> ~/Projects/dotfiles
cd ~/Projects/dotfiles

# 2. Run the bootstrapper
./setup.sh
```

The script will:
1. Install Homebrew (if missing).
2. Install all tools and apps listed in the `Brewfile`.
3. Symlink your configurations (`.zshrc`, `.gitconfig`) to your home directory.
4. Install Oh My Zsh (if missing).

## Structure

This repository uses a "Package" structure for Stow:

- `zsh/`: Contains `.zshrc` and shell-related configs.
- `git/`: Contains `.gitconfig` and Git-related configs.
- `Brewfile`: The master list of all Homebrew formulae and casks.
- `setup.sh`: The main automation script.

## Adding New Configs

To add a new tool's configuration:
1. Create a new folder (e.g., `tmux/`).
2. Place the config file inside it (e.g., `tmux/.tmux.conf`).
3. Update `setup.sh` to include the new package in the `stow` command:
   ```bash
   stow -t ~ zsh git tmux
   ```

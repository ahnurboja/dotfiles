# Dotfiles

Personal configuration and environment bootstrapper for macOS.

## Overview

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks and [Homebrew](https://brew.sh/) to manage packages and applications. It is designed to be a "one-click" setup for a new development environment.

## What's Included?

- **Shell:** Zsh with [Oh My Zsh](https://ohmyz.sh/) and custom `.zshrc`.
- **Git:** Optimized `.gitconfig` with helpful aliases (`st`, `co`, `br`, `hist`).
- **Terminal:** [iTerm2](https://iterm2.com/) for a better terminal experience.
- **Editor:** [Visual Studio Code](https://code.visualstudio.com/) with a CLI-integrated workflow.
- **CLI Tools:** [gemini-cli](https://github.com/google/gemini-cli), [GitHub CLI (gh)](https://cli.github.com/), `git`, `coreutils`, and more.

## Package Documentation

Each configuration directory contains its own `README.md` for specific tool details:
- [Zsh](./zsh/README.md)
- [Tmux](./tmux/README.md)
- [Bat](./bat/README.md)

## Quick Start

To set up a new machine, clone this repository and run the setup script:

```bash
# 1. Clone the repository
git clone https://github.com/ahnurboja/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles

# 2. Run the bootstrapper
./setup.sh
```

The script will:
1. Install Homebrew (if missing).
2. Install all tools and apps listed in the `Brewfile`.
3. Symlink your configurations (`.zshrc`, `.gitconfig`, `GEMINI.md`) to your home directory.
4. Install Oh My Zsh (if missing).
5. Install the **Gemini CLI Companion** extension for VS Code.

## Structure

This repository uses a "Package" structure for Stow:

- `zsh/`: Contains `.zshrc` and shell-related configs.
- `git/`: Contains `.gitconfig` and Git-related configs.
- `gemini/`: Contains `GEMINI.md` for AI agent context.
- `Brewfile`: The master list of all Homebrew formulae and casks.
- `setup.sh`: The main automation script.

## Adding New Configs

To add a new tool's configuration:
1. Create a new folder (e.g., `tmux/`).
2. Place the config file inside it (e.g., `tmux/.tmux.conf`).
3. Update `setup.sh` to include the new package in the `stow` command:
   ```bash
   stow -t ~ zsh git gemini tmux
   ```

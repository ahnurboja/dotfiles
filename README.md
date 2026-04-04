# Dotfiles

Personal configuration and environment bootstrapper for macOS.

## Overview

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks and [Homebrew](https://brew.sh/) to manage packages and applications. It is designed to be a "one-click" setup for a new development environment.

## What's Included?

- **Shell:** Zsh with [Oh My Zsh](https://ohmyz.sh/) and custom `.zshrc`.
- **Git:** Optimized `.gitconfig` with helpful aliases (`st`, `co`, `br`, `hist`).
- **Terminal:** [iTerm2](https://iterm2.com/) for a better terminal experience.
- **Editor:** [Visual Studio Code](https://code.visualstudio.com/) with a CLI-integrated workflow.
- **CLI Tools:** Node.js, [Claude Code](https://claude.com/claude-code) with DeepSeek API bridge, [aichat](https://github.com/sigoden/aichat), [GitHub CLI (gh)](https://cli.github.com/), `git`, `coreutils`, and more.

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
3. Symlink your configurations (`.zshrc`, `.gitconfig`) to your home directory.
4. Install Oh My Zsh (if missing).
5. Install Claude Code globally (via npm) if not already present.

## Claude Code with DeepSeek Setup

This dotfiles configuration uses [Claude Code](https://claude.com/claude-code) (the official Anthropic CLI) bridged to the [DeepSeek API](https://platform.deepseek.com/) for cost-effective AI assistance.

### Installation
Node.js (which includes npm) is installed via Homebrew as part of the setup. The `./setup.sh` script will automatically install Claude Code globally via npm if it's not already present.

If you need to install it manually:
```bash
npm install -g @anthropic-ai/claude-code
```

### API Key Configuration
The `.zshrc` expects a `DEEPSEEK_API_KEY` environment variable. Get your API key from [DeepSeek Platform](https://platform.deepseek.com/). Create a `~/.api-keys` file:
```bash
echo 'export DEEPSEEK_API_KEY="your-deepseek-api-key-here"' >> ~/.api-keys
```

**Note:** The `~/.api-keys` file is excluded from version control (see `.gitignore`) to keep your API keys private.

### How It Works
- Claude Code is configured to use DeepSeek's Anthropic-compatible endpoint
- `ANTHROPIC_AUTH_TOKEN` maps to your `DEEPSEEK_API_KEY`
- Uses `deepseek-reasoner` as the primary model, `deepseek-chat` as the fallback
- The setup automatically unsets `ANTHROPIC_API_KEY` to prevent conflicts

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
   stow -t ~ zsh git tmux bat fzf claude-config
   ```

# Zsh Configuration

## Overview
This package manages the Zsh shell environment, including the Oh My Zsh framework, plugins, and custom aliases for modern CLI tools.

## Key Changes
- **Framework:** Uses [Oh My Zsh](https://ohmyz.sh/).
- **Prompt:** Configured with [Powerlevel10k](https://github.com/romkatv/powerlevel10k) for a high-contrast, informative single-line prompt.
- **Aliases:** 
  - `ls='eza --icons'` (via eza)
  - `cat='bat'` (via bat)
  - `find='fd'` (via fd)
  - `grep='rg'` (via ripgrep)
- **FZF:** Initialized for fuzzy-finding in the terminal.
- **AI CLI:** Configured for [Claude Code](https://claude.com/claude-code) with DeepSeek API bridge.

## AI CLI Integration
The `.zshrc` configures Claude Code to use DeepSeek's API:
- Claude Code is automatically installed via npm when running `./setup.sh`
- Maps `DEEPSEEK_API_KEY` to `ANTHROPIC_AUTH_TOKEN`
- Sets base URL to DeepSeek's Anthropic-compatible endpoint
- Uses `deepseek-reasoner` as primary model
- API keys are loaded from `~/.api-keys` (excluded from git)

## Usage
- Run `p10k configure` to customize your prompt.
- Use `zshconfig` to quickly open this `.zshrc` in VS Code.
- Use `dotfiles` to navigate to the repository directory.

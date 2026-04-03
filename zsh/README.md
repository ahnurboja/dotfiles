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

## Usage
- Run `p10k configure` to customize your prompt.
- Use `zshconfig` to quickly open this `.zshrc` in VS Code.
- Use `dotfiles` to navigate to the repository directory.

#!/bin/bash

# --- Dotfiles Setup Script ---

# 1. Install Homebrew if not installed
if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. Install all tools from Brewfile
echo "Updating Homebrew and installing bundles..."
brew update
brew bundle --file=./Brewfile

# 3. Create symlinks using GNU Stow
# Stow the 'zsh', 'git', and other packages (their contents)
echo "Creating symlinks with Stow..."
stow -t ~ zsh git tmux bat fzf claude-config

# 4. Install Oh My Zsh if it's not already installed (this step is now handled by stow)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh directory not found in home folder after stow. Something is wrong."
fi

# Link Powerlevel10k theme from Homebrew to the moved Oh My Zsh custom themes
# Note: Path is now internal to our dotfiles zsh package
if [ -d "/opt/homebrew/opt/powerlevel10k/share/powerlevel10k" ]; then
    echo "Linking Powerlevel10k theme..."
    mkdir -p "$(pwd)/zsh/.oh-my-zsh/custom/themes"
    ln -sfn "/opt/homebrew/opt/powerlevel10k/share/powerlevel10k" "$(pwd)/zsh/.oh-my-zsh/custom/themes/powerlevel10k"
fi

# 5. Install Claude Code globally if not installed
if command -v npm >/dev/null 2>&1; then
    if ! command -v claude >/dev/null 2>&1; then
        echo "Installing Claude Code via npm..."
        npm install -g @anthropic-ai/claude-code
    else
        echo "Claude Code is already installed."
    fi
else
    echo "npm not found. Claude Code installation skipped."
fi

echo "Setup complete! Please restart your terminal."

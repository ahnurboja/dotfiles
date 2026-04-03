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
# Stow the 'zsh', 'git', and 'gemini' packages (their contents)
echo "Creating symlinks with Stow..."
stow -t ~ zsh git gemini

# 4. Install Oh My Zsh if it's not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 5. Install VS Code extensions
if command -v code >/dev/null 2>&1; then
    echo "Installing Gemini CLI Companion for VS Code..."
    code --install-extension google.gemini-cli-vscode-ide-companion
fi

echo "Setup complete! Please restart your terminal."

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Use Powerlevel10k for a high-contrast, informative single-line prompt.
# Note: You may be prompted to run `p10k configure` on first launch.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Standard Oh My Zsh plugins.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User-specific configuration (aliases, exports)
alias zshconfig="code ~/Projects/dotfiles/zsh/.zshrc"
alias dotfiles="cd ~/Projects/dotfiles"

# Modern CLI tools
alias ls='eza --icons'
alias cat='bat'
alias find='fd'
alias grep='rg'

# FZF initialization
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# --- Load your local keys ---
if [ -f "$HOME/.api-keys" ]; then
    source "$HOME/.api-keys"
fi

# --- CLAUDE CODE x DEEPSEEK SETUP ---

# --- Map them to Claude Code (DeepSeek Bridge) ---
export ANTHROPIC_AUTH_TOKEN="$DEEPSEEK_API_KEY"
export ANTHROPIC_BASE_URL="https://api.deepseek.com/anthropic"
export ANTHROPIC_MODEL="deepseek-reasoner"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="deepseek-chat"

# --- Safety Cleanup ---
unset ANTHROPIC_API_KEY
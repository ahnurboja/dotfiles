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

# Quota switching functions
function gq1() {
  export GEMINI_API_KEY=$(cat ~/gemini-accounts/quota-1/.env | cut -d= -f2)
  echo "Switched to Gemini Account 1 (Quota 1)"
}

function gq2() {
  export GEMINI_API_KEY=$(cat ~/gemini-accounts/quota-2/.env | cut -d= -f2)
  echo "Switched to Gemini Account 2 (Quota 2)"
}

function gmain() {
  unset GEMINI_API_KEY
  echo "Switched back to Main OAuth Account"
}

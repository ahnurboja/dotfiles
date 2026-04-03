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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

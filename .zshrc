# Environment Variables
export PATH=$PATH:/usr/local/go/bin
export UV_USE_IO_URING=0 # yarn

# Zap setup
ZAP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zap"

if [ ! -d "$ZAP_DIR" ]; then
  mkdir -p "$(dirname $ZAP_DIR)"
  git clone https://github.com/zap-zsh/zap.git "$ZAP_DIR"
fi

# Source/Load Zap
source "${ZAP_DIR}/zap.zsh"

HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Stop been noise
unsetopt beep

# Install zsh plugins
plug "zsh-users/zsh-syntax-highlighting"

# Keybindings
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# Aliases
alias ls="eza --icons=always"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias ..="cd ../"
alias ...="cd ../.."
alias cl="clear"
alias zc="nvim ~/dotfiles/.zshrc"
alias vc="nvim ~/dotfiles/.config/nvim/"
alias src="source ~/.zshrc"
alias ff="fastfetch"

# Integration
eval "$(zoxide init --cmd cd zsh)"

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:*' unstagedstr ''
zstyle ':vcs_info:*' stagedstr ' '
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats ' on %F{#BF40BF,}%f %F{#41fdfe}%b%f %F{#FFFF00}%c%f%F{#EE4B2B}%u%f '

NL=$'\n'
PROMPT="%F{#0096FF}%1~%f\$vcs_info_msg_0_${NL}%(?.%F{#66ff00}.%F{#EE4B2B})❯%f "

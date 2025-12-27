# Exports
export PATH="$HOME/.dotnet/tools:$HOME/Applications/JetBrains Rider-2025.3.0.3/bin:$HOME/.local/bin:$PATH"
export XDG_CURRENT_DESKTOP="Wayland"
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

HISTSIZE=1000
SAVEHIST=2000
setopt APPEND_HISTORY 
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# vim mode
bindkey -v
export KEYTIMEOUT=1

alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias cl='clear'
alias vc='nvim ~/.config/nvim'

# completions
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' 󱗝' # For unstaged '!' (modified, not added)
zstyle ':vcs_info:*' stagedstr ' 󰜄'   # For staged '+' (added, not committed)
zstyle ':vcs_info:git:*' formats ' on %F{red} %b%c%u%f'

PROMPT="%F{cyan}%1~%f\$vcs_info_msg_0_ %F{green}%f "

# pnpm
export PNPM_HOME="/home/eslam/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias cl='clear'

# completions
autoload -U compinit; compinit

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats ' (%F{red}%b%f)'

PROMPT="%F{cyan}%1~%f\$vcs_info_msg_0_ %F{green}%#%f "

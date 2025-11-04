HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize

alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias cl='clear'
alias vc='nvim ~/.config/nvim'

# History search with arrow keys
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Color definitions
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
YELLOW="\[\e[1;33m\]"
BLUE="\[\e[1;34m\]"
MAGENTA="\[\e[1;35m\]"
CYAN="\[\e[1;36m\]"
WHITE="\[\e[1;37m\]"
GRAY="\[\e[1;90m\]"
ENDC="\[\e[0m\]"

# Git prompt function
# parse_git_branch() {
#   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }
parse_git_status() {
    # Check if we are inside a Git repository
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

    local status=$(git status --porcelain 2>/dev/null)
    local output=""

    # 1. Branch Name (Always displayed if in a repo)
    local branch=$(git branch --show-current 2>/dev/null)
    if [[ -n "$branch" ]]; then
        output+=" ($branch"
    fi

    # 2. Status Icons (Only display if count > 0)
    local staged_count=$(echo "$status" | grep -c '^[ADMRTUC]')
    local unstaged_count=$(echo "$status" | grep -c '^.[ADMRTUC]')
    local untracked_count=$(echo "$status" | grep -c '??')
    local deleted_count=$(echo "$status" | grep -c ' D') # Unstaged Deletion

    # Append icons only if there are changes (no count numbers)
    if [[ "$staged_count" -gt 0 ]]; then
        output+="+" # Staged/Index Changes
    fi
    if [[ "$unstaged_count" -gt 0 ]]; then
        output+="!" # Unstaged Changes
    fi
    if [[ "$untracked_count" -gt 0 ]]; then
        output+="?" # Untracked Files
    fi
    if [[ "$deleted_count" -gt 0 ]]; then
        output+="x" # Unstaged Deleted Files (the 'removedstr' stand-in)
    fi

    # Close the branch/status section
    if [[ -n "$branch" ]]; then
        output+=")"
    fi

    echo "$output"
}

PS1="${BLUE}\W${RED}\$(parse_git_status)${GREEN} \$${ENDC} "

# Exports
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PNPM_HOME="/home/eslam/.local/share/pnpm"
export PATH="/home/eslam/.local/bin:$PNPM_HOME:$PATH"
export XDG_CURRENT_DESKTOP="Wayland"
export EDITOR="nvim"
export TERMINAL="kitty"

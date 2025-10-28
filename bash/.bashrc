export PATH="/home/eslam/.local/bin:/home/eslam/.local/share/pnpm:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize

alias ls='ls --color'

parse_git_branch() {
  git branch 2>/dev/null | grep '^\*' | colrm 1 2 | sed 's/^/ (/' | sed 's/$/)/'
}

PS1="\[\e[01;34m\]\W\[\e[01;35m\]\$(parse_git_branch) \[\e[01;32m\]\$\[\e[00m\] "

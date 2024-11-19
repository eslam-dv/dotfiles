######################################################################
#
#
#           ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#           ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#           ██████╔╝███████║███████╗███████║██████╔╝██║     
#           ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
#           ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#           ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
#
######################################################################
export MYVIMRC=~/AppData/Local/nvim

# set -o vi

## HISTORY ##
HISTTIMEFORMAT="%F %T "
HISTCONTROL="erasedups:ignorespace"
HISTSIZE=2000
HISTFILESIZE=2000

# shopt -s histappend

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gl='git log --oneline'
alias gb='git checkout -b'
alias gd='git diff'

alias rm='rm -i' #-i prompts user before deletion
alias cp='cp -i' #-i prompts user before overwriting
alias src='source ~/.bashrc'
alias vimrc='nvim $MYVIMRC'
alias bashrc='nvim ~/.bashrc'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....='cd ../../..;pwd'
alias c='clear'
alias h='history'
alias tree='tree --dirsfirst -F'
alias mkdir='mkdir -p -v'

# UP and DOWN arrow keys to search history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'


function hg() {
    history | grep "$1";
}

function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if echo ${STATUS} | grep -c "renamed:"         &> /dev/null; then printf " >"; else printf ""; fi
  if echo ${STATUS} | grep -c "branch is ahead:" &> /dev/null; then printf " !"; else printf ""; fi
  if echo ${STATUS} | grep -c "new file::"       &> /dev/null; then printf " +"; else printf ""; fi
  if echo ${STATUS} | grep -c "Untracked files:" &> /dev/null; then printf " ?"; else printf ""; fi
  if echo ${STATUS} | grep -c "modified:"        &> /dev/null; then printf " *"; else printf ""; fi
  if echo ${STATUS} | grep -c "deleted:"         &> /dev/null; then printf " -"; else printf ""; fi
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

PS1=${blu}'$(parse_git_branch)'${pur}' \W'${grn}'  '${clr}

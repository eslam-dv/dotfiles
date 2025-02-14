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
export MYVIMRC=~/.config/nvim/
export EDITOR=nvim
export PATH="$PATH:$HOME/.local/bin:$HOME/go/bin:/usr/local/go/bin"
export FZF_DEFAULT_OPTS='--height 40%'

# set -o vi

## HISTORY ##
HISTTIMEFORMAT="%F %T "
HISTSIZE=2000
HISTFILESIZE=2000
HISTCONTROL="erasedups:ignorespace"

# disable beep sound
bind 'set bell-style none'

# shopt -s histappend

alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gl='git log --oneline'
alias gb='git checkout -b'
alias gd='git diff'

alias src='source ~/.bashrc'
alias vrc='cd $MYVIMRC && nvim .'
alias brc='nvim ~/.bashrc'
alias rm='rm -i' #-i prompts user before deletion
alias cp='cp -i' #-i prompts user before overwriting
alias ls='eza --icons'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....='cd ../../..;pwd'
alias cl='clear'
alias h='history'
alias tree='tree --dirsfirst -F'
alias ff='fastfetch'

# UP and DOWN arrow keys to search history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# cd with zoxide
eval "$(zoxide init bash --cmd cd)"
# Set up fzf key bindings and fuzzy completion
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash


function hg() {
    history | grep "$1";
}

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if echo ${STATUS} | grep -c "renamed:"         &> /dev/null; then printf " "; else printf ""; fi
  if echo ${STATUS} | grep -c "branch is ahead:" &> /dev/null; then printf " !"; else printf ""; fi
  if echo ${STATUS} | grep -c "new file::"       &> /dev/null; then printf " "; else printf ""; fi
  if echo ${STATUS} | grep -c "Untracked files:" &> /dev/null; then printf " ?"; else printf ""; fi
  if echo ${STATUS} | grep -c "modified:"        &> /dev/null; then printf " "; else printf ""; fi
  if echo ${STATUS} | grep -c "deleted:"         &> /dev/null; then printf " "; else printf ""; fi
}

function parse_git_branch {
  BRANCH=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/")
  if [[ -n "$BRANCH" ]]; then
    printf " on  %s%s" "$BRANCH" "$(parse_git_dirty)"
  fi
}

PS1="${blu}\w${pur}\$(parse_git_branch)\n${grn}${clr} "

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
# export XDG_CURRENT_DESKTOP=sway

# Firefox on wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1

# set -o vi

## HISTORY ##
export HISTTIMEFORMAT="%F %T "
export HISTSIZE=2000
export HISTFILESIZE=2000
export HISTCONTROL="erasedups:ignorespace"

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
alias ls='exa --icons'
# alias ls='ls --color'
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
# eval "$(zoxide init bash --cmd cd)"
# Set up fzf key bindings and fuzzy completion
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash


function hg() {
    history | grep "$1";
}

blk='\e[1;30m'
red='\e[1;31m'
grn='\e[1;32m'
yle='\e[1;33m'
blu='\e[1;34m'
pur='\e[1;35m'
cyn='\e[1;36m'
wht='\e[1;37m'
clr='\e[0m'

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
    printf " on ${red}%s%s${clr}" "$BRANCH" "$(parse_git_dirty)"
  fi
}

# two lines
# PS1="${blu}\w\$(parse_git_branch)\n${grn}${clr} "

# one line
PS1="${blu}\W${clr}\$(parse_git_branch) ${grn}${clr} "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

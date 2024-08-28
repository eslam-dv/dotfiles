###----- EXPORTS -----###
export PATH="$PATH:$HOME/.local/bin/:/usr/local/go/bin"
export MYVIMRC="$HOME/.config/nvim/"

###----- PROMPT -----###
# Colors
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
BLACK_BG=$(tput setab 0)
RED_BG=$(tput setab 1)
GREEN_BG=$(tput setab 2)
YELLOW_BG=$(tput setab 3)
BLUE_BG=$(tput setab 4)
MAGENTA_BG=$(tput setab 5)
CYAN_BG=$(tput setab 6)
RESET=$(tput sgr0)

function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; fi
  if echo ${STATUS} | grep -c "renamed:"         &> /dev/null; then printf " 󰜴"; else printf ""; fi
  if echo ${STATUS} | grep -c "branch is ahead:" &> /dev/null; then printf " !"; else printf ""; fi
  if echo ${STATUS} | grep -c "new file::"       &> /dev/null; then printf " "; else printf ""; fi
  if echo ${STATUS} | grep -c "Untracked files:" &> /dev/null; then printf " ?"; else printf ""; fi
  if echo ${STATUS} | grep -c "modified:"        &> /dev/null; then printf " "; else printf ""; fi
  if echo ${STATUS} | grep -c "deleted:"         &> /dev/null; then printf " "; else printf ""; fi
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

# change prompt color depending on the exit status of last command
function set_prompt {
    if [ $? -eq 0 ]; then
      PS1="\e[1;34m\W\e[m\e[1;35m$(parse_git_branch)\e[m \e[1;32m󰄾\e[m "
    else
        PS1="\e[1;34m\W\e[m\e[1;35m$(parse_git_branch)\e[m \e[1;31m󰄾\e[m "
    fi
}

PROMPT_COMMAND=set_prompt

###----- HISTROY -----###
export HISTFILESIZE=1000
export HISTCONTROL="erasedups:ignoreboth"
export HISTFILE=~/.bash_history

###----- KEYBINDS -----###
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

###----- ALIASES -----###
alias ls='exa --icons'
alias ll='ls -l'
alias la="ls -a"
alias lla="ls -la"
alias ..="cd ../"
alias ...="cd ../.."
alias po='poweroff'
alias re='reboot'
alias c='clear'
alias bashrc='nvim ~/.bashrc'
alias src='source ~/.bashrc'
alias vimrc='nvim ~/.config/nvim'
alias ff='fastfetch'

###----- OTHER -----###
eval "$(zoxide init --cmd cd bash)"

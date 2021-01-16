# ls
case "${OSTYPE}" in
darwin*)
  alias ls="ls -FG" ;;
linux*)
  alias ls='ls -F --color=auto' ;;
esac
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -C'

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias d='cd ~/Documents'

# screen
alias c='clear'
alias h='history'

# apt
alias au='sudo apt update'
alias ag='sudo apt upgrade'
alias ai='sudo apt install'

# git
alias g='git'

# safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# ghq
alias gcd='cd $(ghq list -p | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

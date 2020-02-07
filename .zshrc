autoload -Uz colors && colors
PROMPT="%{$fg[green]%}%n@%m%{$fg[default]%}:%{$fg[blue]%}%~%{$fg[default]%}%(!.#.$) %{$reset_color%}"
RPROMPT="%{$fg[cyan]%} %D{%Y/%m/%d} %* %{$reset_color%}"

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
LISTMAX=1000

bindkey -e

setopt print_eight_bit
setopt no_flow_control
unsetopt ignore_eof

setopt auto_cd
setopt noautoremoveslash

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_reduce_blanks

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

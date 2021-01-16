autoload -Uz colors && colors
HOSTBGCOLORCODE=$(printf "%d\n" "215*(0x$(hostname|md5sum|cut -c1-2))/255.0+16")
HOSTBGCOLOR=$'%{[48;5;'"$HOSTBGCOLORCODE"'m%}'
#USERCOLOR=$'%{[38;5;'"$(printf "%d\n" 0x$(echo $USERNAME|md5sum|cut -c1-2))"'m%}'
USERCOLOR=$'%{[38;5;183m%}'
if [ "$(printf "%d" "((${HOSTBGCOLORCODE}-16)/18)%2")" -eq 1 ]; then
  HOSTFGCOLOR=$'%{[38;5;232m%}'
else
  HOSTFGCOLOR=$'%{[38;5;255m%}'
fi
PROMPT="%{$USERCOLOR%}%n%{$reset_color%}@%{$HOSTFGCOLOR%}%{$HOSTBGCOLOR%}%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}%(!.#.$) %{$reset_color%}"
RPROMPT="%{$fg[green]%} %D{%Y/%m/%d} %* %{$reset_color%}"

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

peco-src () {
  local repo=$(ghq list | peco --query "$LBUFFER")
  if [ -n "$repo" ]; then
    repo=$(ghq list --full-path --exact $repo)
    BUFFER="cd ${repo}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  . /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

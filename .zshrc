ZSHHOME="${HOME}/.zsh"

source_file() {
  local file_path=$1
  if [ -f "${file_path}" ]; then
    source "${file_path}"
  fi
}

source_file "${ZSHHOME}/.zfunctions"
source_file "${ZSHHOME}/.zaliases"
source_file "${ZSHHOME}/.zoptions"
source_file "${ZSHHOME}/.zprompt"
source_file "${HOME}/.zshrc_work"

# Language
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
which pyenv > /dev/null && eval "$(pyenv init -)"
which rbenv > /dev/null && eval "$(rbenv init -)"

if [[ $(docker-machine status default 2> /dev/null) = "Running" ]] ; then
  eval $(docker-machine env default)
fi

# fzf
export FZF_DEFAULT_OPTS='--height 80% --reverse --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey -r '\ec' # ALT-C のバインドを解除
source_file "/usr/share/doc/fzf/examples/key-bindings.zsh"
source_file "/usr/share/doc/fzf/examples/completion.zsh"

# Homebrew
if which brew > /dev/null; then
  source_file "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  source_file "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  source_file "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

# iTerm
source_file "${HOME}/.iterm2_shell_integration.zsh"

# emacs mode
bindkey -e

# Completion
LISTMAX=1000
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# History
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

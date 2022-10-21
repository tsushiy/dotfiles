# PATH
export PYENV_ROOT="$HOME/.pyenv"

typeset -gx -U path fpath manpath
path=(
  $HOME/.local/bin(N-/)
  $HOME/.nodebrew/current/bin(N-/)
  $PYENV_ROOT/bin(N-/)
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  $path
  /usr/local/go/bin(N-/)
)

export LANG=ja_JP.UTF-8

# Homebrew
[[ -f "/usr/local/bin/brew" ]] && eval "$(/usr/local/bin/brew shellenv)"
[[ -f "/opt/homebrew/bin/brew" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
if where brew &>/dev/null; then
  fpath=(
    $(brew --prefix)/share/zsh/site-functions(N-/)
    $fpath
  )
fi

# Language
where pyenv &>/dev/null && eval "$(pyenv init --path)"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

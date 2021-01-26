ZSHHOME="${HOME}/.zsh"

source_file() {
  local file_path=$1
  if [ -f "${file_path}" ]; then
    . "${file_path}"
  fi
}

source_file "${ZSHHOME}/.zfunctions"
source_file "${ZSHHOME}/.zaliases"
source_file "${ZSHHOME}/.zoptions"
source_file "${ZSHHOME}/.zprompt"

source_file "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source_file "${HOME}/.iterm2_shell_integration.zsh"

# emacsモード
bindkey -e

# ヒストリー
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

# 補完
LISTMAX=1000
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# 環境変数の重複を削除
typeset -U path PATH

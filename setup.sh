#!/bin/bash

set -eu

DOTPATH="${HOME}/dotfiles"

if [ ! -d "${DOTPATH}" ]; then
  git clone https://github.com/tsushiy/dotfiles.git "${DOTPATH}"
else
  echo "${DOTPATH} already exists."
  cd "${DOTPATH}"
  git stash
  git pull origin master
fi

cd "${DOTPATH}"

# Create symlinks
for file in .??*; do
  [[ "${file}" == ".git" ]] && continue
  [[ "${file}" == ".gitignore" ]] && continue
  [[ "${file}" == ".DS_Store" ]] && continue
  [[ "${file}" == ".github" ]] && continue
  [[ "${file}" == ".vscode" ]] && continue
  ln -fvns "${DOTPATH}/${file}" "${HOME}/${file}"
done

# Install Homebrew
case "${OSTYPE}" in
  darwin*)
    if ! type brew &>/dev/null; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    if [ "${CI:-unknown}" == unknown ]; then
      local UNAME_MACHINE="$(/usr/bin/uname -m)"

      if [[ "$UNAME_MACHINE" == "arm64" ]]; then
        brew bundle -v --file './Brewfile-arm.rb'
      else
        brew bundle -v --file './Brewfile-intel.rb'
      fi
    fi
    ;;
esac

echo "Setup done."

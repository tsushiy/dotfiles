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
install_homebrew() {
  if ! where brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

case "$(uname -sm)" in
  "Darwin x86_64")
    install_homebrew
    if [ "${CI:-unknown}" == unknown ]; then
      brew bundle -v --file './Brewfile-intel.rb'
    fi
    ;;
  "Darwin arm64")
    install_homebrew
    if [ "${CI:-unknown}" == unknown ]; then
      brew bundle -v --file './Brewfile-arm.rb'
    fi
    ;;
  "Linux x86_64")
    install_homebrew
    if [ "${CI:-unknown}" == unknown ]; then
      brew bundle -v --file './Brewfile-linux.rb'
    fi
    ;;
esac

echo "Setup done."

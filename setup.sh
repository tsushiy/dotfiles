#!/bin/bash

set -eu

DOTPATH=$HOME/dotfiles

if [ ! -d "$DOTPATH" ]; then
  git clone https://github.com/tsushiy/dotfiles.git "$DOTPATH"
else
  echo "$DOTPATH already exists."
  cd "$DOTPATH"
  git stash
  git pull origin master
fi

cd "$DOTPATH"

for file in .??*; do
  [[ "$file" == ".git" ]] && continue
  [[ "$file" == ".gitignore" ]] && continue
  [[ "$file" == ".DS_Store" ]] && continue
  ln -fvns "$DOTPATH/$file" "$HOME/$file"
done

if ! command -v brew >/dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew bundle

echo "All done!"
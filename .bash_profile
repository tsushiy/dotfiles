PATH=/usr/local/bin:${PATH}

PATH=${PATH}:/usr/local/go/bin
PATH=${PATH}:/usr/local/pypy/bin
export PATH

export LANG=ja_JP.UTF-8

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
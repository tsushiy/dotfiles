export PATH=/usr/local/go/bin:/usr/lib/cuda/bin:${PATH}
export PATH=/usr/local/pypy/bin:${PATH}
export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:${LD_LIBRARY_PATH}

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
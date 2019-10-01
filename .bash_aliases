PATH=/usr/local/bin:${PATH}
PATH=/usr/local/go/bin:${PATH}
PATH=/usr/local/pypy/bin:${PATH}
PATH=/usr/local/cuda-10.0/bin:${PATH}
export PATH

export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:${LD_LIBRARY_PATH}

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
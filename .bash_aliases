export PATH=/usr/lib/cuda/bin:${PATH}
export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:${LD_LIBRARY_PATH}

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
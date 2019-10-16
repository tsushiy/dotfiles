PATH=/usr/local/bin:${PATH}

PATH=${PATH}:/usr/local/go/bin
PATH=${PATH}:/usr/local/pypy/bin
PATH=${PATH}:/usr/local/cuda-10.0/bin

export ANDROID_HOME=$HOME/Android/Sdk

PATH=$PATH:/usr/local/android-studio/bin
PATH=$PATH:$ANDROID_HOME/emulator
PATH=$PATH:$ANDROID_HOME/tools
PATH=$PATH:$ANDROID_HOME/tools/bin
PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH

export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:${LD_LIBRARY_PATH}

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
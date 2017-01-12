# Enable tab completion
source ~/.git-completion.bash

### MY ALIASES ###
source ~/code/config-files/.aliases

### MY Functions ###
source ~/code/config-files/.functions

### MY Exports ###
source ~/code/config-files/.exports

# Change command prompt
source ~/.git-prompt.sh

export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/Library/Android/sdk/platform-tools/:~/Library/Android/sdk/build-tools/:~/Library/Android/sdk/ndk-bundle/:$SPARK_HOME/bin

####### CUDA ######
export CUDA_HOME=/usr/local/cuda
# export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export DYLD_LIBRARY_PATH="$CUDA_HOME/lib":$DYLD_LIBRARY_PATH
export PATH="$CUDA_HOME/bin:$PATH"

### Completion

## bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

## thefuck
eval "$(thefuck --alias zz)"


##
## better `cd`'ing
##

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# This has to be the last line
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

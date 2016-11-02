# Enable tab completion
source ~/.git-completion.bash

# colors!
green="\[\033[1;32m\]"
blue="\[\033[1;34m\]"
# yellow="\[\033[1;33m\]"
red="\[\033[1;31m\]"
purple="\[\033[1;35m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory

# ipython notebook
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# brew analytics off
export HOMEBREW_NO_ANALYTICS=1

##################
### MY ALIASES ###
##################

# python cheat
export CHEATCOLORS=true

# mongodb
alias mongod='mongod --dbpath ~/data/db'

# refresh shell
alias reload='source ~/.bash_profile'

# git commamands simplified
alias gst='git status'
alias gdf='git diff'
alias gco='git checkout'
alias gci='git commit -m '
alias grb='git rebase'
alias gbr='git branch'
alias gad='git add -A'
alias gpl='git pull'
alias gpu='git push'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'


# up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# alias from boom
alias tts='adb shell am startservice com.indus.texttospeech/com.indus.texttospeech.TtsService'
alias ndk='ndk-build "NDK_DEBUG=1"'

export CLICOLOR=1
# light background
# export LSCOLORS=ExFxCxDxBxegedabagacad
# dark background
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# my custom color codes
export LSCOLORS=GxFxCxDxBxegedabagaced

####################
### APACHE SPARK ###
####################
export SPARK_HOME=/usr/local/spark

# export SPARK_HOME=~/install/spark-1.6.1-bin-hadoop2.6
# export PATH=$SPARK_HOME/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8C)
export HADOOP_HOME=/usr/local/Cellar/hadoop/2.7.2/libexec/
export HADOOP_CONF_DIR=/usr/local/Cellar/hadoop/2.7.2/libexec/etc/hadoop/

# Command Prompt
export PS1="$blue\! $red\T$green\$(__git_ps1)$purple \u:\W $ $reset"
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/Library/Android/sdk/platform-tools/:~/Library/Android/sdk/build-tools/:~/Library/Android/sdk/ndk-bundle/:$SPARK_HOME/bin

####### CUDA ######
export CUDA_HOME=/usr/local/cuda
# export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export DYLD_LIBRARY_PATH="$CUDA_HOME/lib":$DYLD_LIBRARY_PATH
export PATH="$CUDA_HOME/bin:$PATH"

## bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

### aws/softlayer servers
alias wowmongo='ssh -i ~/awsperm/wow_mongodb root@161.202.204.122'

## thefuck
eval "$(thefuck --alias zz)"
export THEFUCK_REQUIRE_CONFIRMATION='false'

# chromedriver
# export PATH="/Users/dhruv/code/chromedriver:$PATH"


# Insane up and back functions to move within directories.
function up( )
{
LIMIT=$1
P=$PWD
for ((i=1; i <= LIMIT; i++))
do
    P=$P/..
done
cd "$P" || return
export MPWD=$P
}

function back( )
{
LIMIT=$1
P=$MPWD
for ((i=1; i <= LIMIT; i++))
do
    P=${P%/..}
done
cd "$P" || return
export MPWD=$P
}

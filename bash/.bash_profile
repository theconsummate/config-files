# Enable tab completion
source ~/.git-completion.bash

# colors!
green="\[\033[1;32m\]"
blue="\[\033[1;34m\]"
yellow="\[\033[1;33m\]"
red="\[\033[1;31m\]"
purple="\[\033[1;35m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory


##################
### MY ALIASES ###
##################

# mongodb
alias mongod='mongod --dbpath ~/data/db'

# refresh shell
alias reload='source ~/.bash_profile'

# git commamands simplified
alias gst='git status'
alias gco='git checkout'
alias gci='git commit'
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

export CLICOLOR=1
# light background
# export LSCOLORS=ExFxCxDxBxegedabagacad
# dark background
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# my custom color codes
export LSCOLORS=GxFxCxDxBxegedabagaced

# Command Prompt
export PS1="$blue\! $red\T$green\$(__git_ps1)$purple \u:\W $ $reset"
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/Library/Android/sdk/platform-tools/:~/Library/Android/sdk/build-tools/:~/Library/Android/sdk/ndk-bundle/

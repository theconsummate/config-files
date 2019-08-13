# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export TTSHOME=/home/mofirst-test/TTSHOME
export FESTVOXDIR=$TTSHOME/festvox
export SPTKDIR=$TTSHOME/SPTK-3.8
export ESTDIR=$TTSHOME/speech_tools
export FLITEDIR=$TTSHOME/flite-2.0.0-release
export FLITE_APP_DIR=$TTSHOME/Flite-TTS-Engine-for-Android-master
export ANDROID_NDK=$TTSHOME/android-ndk-r10e/
export ANDROID_SDK=$TTSHOME/android-sdk-linux/
PATH=/home/dhruv/install/android-studio/bin:"$PATH"
PATH=/home/dhruv/Android/Sdk/platform-tools/:"$PATH"
#export GST_DEBUG_FILE=/home/dhruv/Downloads/gst-rtsp-server-1.6.0/debug.log
#export GST_DEBUG=INFO

# ps related things
pps() {
    #do things with parameters like $1 such as
    ps -p "$1" -o pid,vsz=MEMORY -o user,group=GROUP -o etime=TIME -o comm,args=ARGS
}

alias mps='ps -U mishradv -o pid,vsz -o comm,args='

export PATH="$PATH:/opt/mssql-tools/bin"
export PATH="$PATH:~/bin"
export PATH="/home/users2/mishradv/anaconda2/bin:$PATH"
#export PATH="/mount/arbeitsdaten/asr-2/mishradv/cuda-9.0/bin:$PATH"
#export LD_LIBRARY_PATH=/mount/arbeitsdaten/asr-2/mishradv/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

#CUDAROOT="/mount/arbeitsdaten/asr-2/mishradv/cuda-9.0"
CUDAROOT="/mount/arbeitsdaten/asr-2/mishradv/cuda-10.1"
#NCCL_ROOT="/mount/arbeitsdaten/asr-2/mishradv/nccl/nccl_2.2.13-1+cuda9.0_x86_64"
NCCL_ROOT="/mount/arbeitsdaten/asr-2/mishradv/nccl/nccl_2.4.2-1+cuda10.1_x86_64"
export PATH=$CUDAROOT/bin:$PATH
export CPATH=$NCCL_ROOT/include:$CPATH

export LD_LIBRARY_PATH=$NCCL_ROOT/lib/:$CUDAROOT/lib64:$LD_LIBRARY_PATH
#export LIBRARY_PATH=$NCCL_ROOT/lib/:$LIBRARY_PATH
export LIBRARY_PATH=$NCCL_ROOT/lib/
export CUDA_HOME=$CUDAROOT
export CUDA_PATH=$CUDAROOT

export CFLAGS=-I$CUDAROOT/include
export LIBRARY_PATH=-L$CUDAROOT/lib64/

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


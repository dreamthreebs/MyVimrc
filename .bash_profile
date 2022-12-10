# ~/.bashrc: executed by bash(1) for non-login shells.
#Stop smoking : March 30 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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
unset color_prompt force_color_prompt

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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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

# CosmoMC Setting
source /afs/ihep.ac.cn/users/w/wangyiming25/intel/oneapi/setvars.sh
source /afs/ihep.ac.cn/users/w/wangyiming25/intel/oneapi/compiler/2022.1.0/env/vars.sh
source /afs/ihep.ac.cn/users/w/wangyiming25/work/soft/plc-3.01/bin/clik_profile.sh
export PLANCKLIKE=cliklike
export CLIK_PATH=/afs/ihep.ac.cn/users/w/wangyiming25/work/soft/plc-3.01
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CLIK_PATH/lib
alias li='rm ./data/clik_14.0;ln -s /afs/ihep.ac.cn/users/w/wangyiming25/work/soft/plc-3.01 ./data/clik_14.0'
alias plot='./getdist distparams.ini'
alias Plot='rm plot_data/*;python python/GetDist.py'
#export OMP_NUM_THREADS=4
#export OMP_THREAD_LIMIT=1
alias remake0='li;u;rm -r chains; mkdir chains; make delete; cd source; make clean; make; cd ../;make getdist;rm *converge nohup.out'
alias remake='li;u;rm -r chains; mkdir chains; cd HyRec; rm libhyrec.a hyrec; make clean;cd ../;make delete; cd source; make clean; make; cd ../;make getdist;rm *converge nohup.out'

#Useful Commands for CosmoMC ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alias t2='vim test.ini'
alias f1='vim CosmologyTypes.f90'
alias f2='vim CosmologyParameterizations.f90'
alias f3='vim ./source/Calculator_CAMB.f90'
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#Personalised settings 
alias t='tar -zxvf'
alias c='tar -zcvf'
alias i='ifort'
alias p=python3
alias m='mpirun'
alias v='/afs/ihep.ac.cn/users/w/wangyiming25/usr/local/bin/vim'
alias s='v ~/.bash_profile'
alias u='. ~/.bash_profile'
alias ..='cd ..'
alias ....='cd ../../'
alias gr='grep -si -ni'
alias l='ls -CF'
alias z='ls -alh'
alias wk='cd /afs/ihep.ac.cn/users/w/wangyiming25/work/CosmoMC'
alias dif='vimdiff'
alias x=cat
alias cl='clear'
alias clean='rm -r ./chains*;mkdir chains;make delete;rm ./data/clik*;cd HyRec;make clean;..;make clean;rm nohup.out;'
alias reh='rm hyrec libhyrec.a;make clean;make;make hyrec'
alias gf='gfortran'
alias p2='python2'
alias rmc='rm -r ~/chains*'
alias xn='x nohup.out '
alias go='pwd;nohup mpirun -np 4 ./cosmomc test.ini & exit'
alias ch='rm -r chains_*;cp -r chains chains_tmp;cd chains_tmp;rm *data;..;rm -r ../chains*;mv chains_tmp ../chains;..;scp -r chains/ $XXX:~/'
alias ch2='rm -r chains_*;cp -r chains chains_tmp;cd chains_tmp;rm *data;..;rm -r ../chains*;mv chains_tmp ../chains;..;scp -r chains/ watson@192.168.184.51:~/'
alias hc='v history.c'
alias hh='v history.h'
alias recamb='cd ../HyRec;rm hyrec;make clean;rm *a;cd ../camb;rm camb;make clean;make'
#my setting
alias tp='cd /afs/ihep.ac.cn/users/w/wangyiming25/work/temple'
alias fs='cd /afs/ihep.ac.cn/users/w/wangyiming25/work/fishermatrix'
alias wkk='cd /afs/ihep.ac.cn/users/w/wangyiming25/work/CosmoMC/CAMB/camb'
alias norm='conda activate norm'
alias lt='ls -t'
alias la='ls -a'
alias cb='cd /afs/ihep.ac.cn/users/w/wangyiming25/work/cb/CAMB'
alias dm='cd /afs/ihep.ac.cn/users/w/wangyiming25/work/cb/random/camb'
alias vf='vim $(fzf)'
alias cf='cd $(fd --type d | fzf)'


export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
source .bashrc
source activate norm

#!/bin/sh

# This first bit of code is what I started with
# if running interactively, then
if [ "$PS1" ]; then
	if [ -e /etc/profile ]; then
	    source /etc/profile
	fi
	if [ -e ~/.bash_login ]; then
		source ~/.bash_login
	fi
fi

# Consistent aliasing across distributions
unalias -a
alias ls='ls --color -b -T 0'
alias lsl='ls -lX --color -b -T 0'
alias weather='curl wttr.in'
alias term='tn5250 env.TERM=IBM-3477-FC PUB400.com'

# Environment variables
export VISUAL="vim"

# Set prompt colour according to user
# If id = 0 then you're root and should be in red
if [ $EUID -eq 0 ]; then
    PS1='\[\e[0;91m\][\u@\h \w]\$ '
else
    PS1='\[\e[0;92m\][\u@\h \w]\$ '
fi

# And finally, if running interactively and not root, The Cow Speaks
if [ $EUID -ne 0 ]; then
    if [ !$COWPATH ]; then
         COWPATH='/usr/share/cowsay/cows/'
         if [ ! -d $COWPATH ]; then
            COWPATH=/usr/share/cows
         fi
    fi
    COW_FILES=($COWPATH/*.cow)    
    N=${#COW_FILES[@]}
    ((N=RANDOM%N))
    COW=${COW_FILES[$N]}

    TEXT_FILE=~/.randomcow.txt
    TEXT="$(shuf -n 1 $TEXT_FILE)"

    cowsay -f $COW $TEXT
fi

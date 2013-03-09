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
alias ls='ls -lX --color -b -T 0'

# Set prompt colour according to user
# If id = 0 then you're root and should be in red
if [ $EUID -eq 0 ]; then
    PS1='\[\e[0;91m\][\u@\h \w]\$ '
else
    PS1='\[\e[0;92m\][\u@\h \w]\$ '
fi

# And finally, if running interactively and not root, The Cow Speaks
if [ $EUID -ne 0 ]; then
    COW_PATH=/usr/share/cows
    COW_FILES=($COW_PATH/*.cow)    
    N=${#COW_FILES[@]}
    ((N=RANDOM%N))
    COW=${COW_FILES[$N]}

    TEXT_FILE=~/.randomcow.txt
    TEXT="$(shuf -n 1 $TEXT_FILE)"

    cowsay -f $COW $TEXT
fi

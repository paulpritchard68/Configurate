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

# Remove the irritating interactive aliases
unalias mv
unalias rm
unalias cp

# A nicer way to ls
export LS_OPTIONS='--color=auto -b -T 0'

# Set prompt colour according to user
# If id = 0 then you're root and should be in red
if [ $EUID -eq 0 ]; then
    PS1='\[\e[0;31m\][\u@\h \w]\$ '
else
    PS1='\[\e[0;32m\][\u@\h \w]\$ '
fi

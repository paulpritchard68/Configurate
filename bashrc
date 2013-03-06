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
alias ls='ls -lX'

# A nicer way to ls
export LS_OPTIONS='--color=auto -b -T 0'

# Switch on 256 colour support
export TERM=xterm-256color

# Set prompt colour according to user
# If id = 0 then you're root and should be in red
if [ $EUID -eq 0 ]; then
    PS1='\[\e[0;91m\][\u@\h \w]\$ '
else
    PS1='\[\e[0;92m\][\u@\h \w]\$ '
fi

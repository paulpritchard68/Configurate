#! /bin/bash
# A simple script to copy the other scripts to their correct folders

if [ $EUID -eq 0 ]; then
    # Copy the files to the root directory
    cp bashrc /root/.bashrc 
else
    # Copy the files to the the current user home directory

    # Vim
    cp vimrc ~/.vimrc
    cp filetype.vim ~/.vim
    cp mysyntax.vim ~/.vim

    # Bash
    cp bashrc ~/.bashrc

    # A bit of cowsay
    cp randomcow.txt ~/.randomcow.txt
fi

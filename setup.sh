#!/usr/bin/env bash

#set -e

# Cancel script if git is unavailable on the system
if ! [ -x "$(command -v git)" ]; then
    echo "Missing git!"
    exit 1
fi

# Check if $HOME/.dotvim exists, then export $DOTVIM
if [ -d $HOME/.dotvim ]; then
    export DOTVIM=$HOME/.dotvim
fi

# Check for empty $DOTVIM vairable
if [ -z $DOTVIM ]; then
    echo -e "Unable to find the DOTVIM folder..."
    echo -e "Please ensure that repo has been cloned to:"
    echo -e "\r"
    echo -e "$HOME/.dotvim"
    echo -e "\r"
    exit 1
fi

# Searching for .vimrc, and create new if dosent exist
if [ ! -e ~/.vimrc ]; then
    echo -n "Cannot find ~/.vimrc, creating new!"
    touch ~/.vimrc
fi

# Modifying .vimrc to point to $DOTVIM/vimrc.vim
if [[ $(grep -c "so $DOTVIM/vimrc.vim" ~/.vimrc) -eq 0 ]]; then
    echo so $DOTVIM/vimrc.vim >> ~/.vimrc
fi

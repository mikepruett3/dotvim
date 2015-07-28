# Installation:

    git clone https://github.com/mikepruett3/dotvim.git ~/.vim

## Create symlinks:

For Linux Based Installations:

    ln -s ~/.vim/vimrc ~/.vimrc

For Windows (**Needs to be run as Administrator**):

    mklink %UserProfile%\.vimrc %UserProfile%\.vim\vimrc
    mklink %UserProfile%\.gvimrc %UserProfile%\.vim\vimrc
    mklink /D %UserProfile%\.vim %UserProfile%\vimfiles
    mklink /D %UserProfile%\.vim-view %UserProfile%\vimfiles\views

## Install Submodules

Switch to the "~/.vim" directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

## Adding new Submodules

Adding new submodules (bundles) to the repository

    cd ~/.vim
    mkdir bundle (if it dosent exist already!)
    git submodule add http://github.com/<username>/<repository>.git bundle/<plugin-name>.vim

## Local Git Configurations that I cannot seem to remember!!!

Updating git repo url

    git config --local user.name "<username>"
    git config --local user.email "<user-email-address>"
    git remote set-url origin git@github.com:<username>/<repository>.git

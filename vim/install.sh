#!/usr/bin/env bash
#
# Install any vim related files

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir -p ~/.vim/colors
cp wombat256mod.vim ~/.vim/colors/

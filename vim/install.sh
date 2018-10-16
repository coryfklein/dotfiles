#!/usr/bin/env bash
#
# Install any vim related files

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir -p ~/.vim/colors
cp wombat256mod.vim ~/.vim/colors/
printf "For clipboard integration to work, download latest MacVim release and ln -s /Applications/MacVim.app/Contents/bin/mvim /usr/local/bin/vim\n"

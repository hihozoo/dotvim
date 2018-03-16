#!/bin/bash

mkdir bundle

git clone https://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim

if [ -e ~/.vimrc ]
then
	mv ~/.vimrc ~/_vimrc_bak.bak
fi

if [ -e ~/.vim ]
then
	mv ~/.vim ~/_vim_bak.bak
fi

ln -s `pwd`/_vimrc ~/.vimrc
ln -s `pwd` ~/.vim

vim +PluginInstall +qal

sudo apt-get install ctags
sudo apt-get install silversearcher-ag

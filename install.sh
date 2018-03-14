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

ln -s _vimrc ~/.vimrc
ln -s `pwd` ~/.vim

vim -c PluginInstall

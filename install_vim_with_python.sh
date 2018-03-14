#!/bin/bash

# sudo apt-get remove --purge vim
# sudo apt-get clean

sudo apt-get install python-dev
sudo apt-get install libncurses5-dev

git clone https://github.com/vim/vim.git vim_src
cd vim_src
./configure --with-features=huge --enable-python3interp --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ --enable-multibyte --enable-cscope      --prefix=/usr/local/vim/
make distclean
make
sudo make install

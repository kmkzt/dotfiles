#!/bin/sh

# https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# nvim-budle: https://github.com/Shougo/dein.vim
DEIN_INSTALLER=$(dirname $0)/installer.sh
curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh > $DEIN_INSTALLER
sh ./$DEIN_INSTALLER ~/.cache/dein
rm ./$DEIN_INSTALLER

# https://github.com/Shougo/deoplete.nvim
pip3 install --user pynvim
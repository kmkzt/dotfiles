#!/bin/sh

if test ! $(which pyenv); then
	echo "Insalling pyenv..."
	git clone git@github.com:pyenv/pyenv.git ~/.pyenv
fi
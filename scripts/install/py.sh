#!/bin/sh

if test ! $(which pyenv); then
	echo "Insalling pyenv..."
	brew install pyenv
fi
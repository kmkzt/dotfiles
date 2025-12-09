#!/bin/sh

if test ! $(which brew); then
	echo "Installing homebrew..."
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
else
	echo "Homebrew already installed"
fi
#!/bin/sh

# install anyenv
if [ ! -d ~/.anyenv ]; then
	echo "Installing anyenv..."
	git clone https://github.com/anyenv/anyenv ~/.anyenv
	eval "$(anyenv init -)"

	# anyenv update plugin
	mkdir -p $(anyenv root)/plugins
	git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

else
	echo "anyenv already installed"
fi
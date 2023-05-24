#!/bin/sh

# https://github.com/rbenv/rbenv#homebrew-on-macos
if test ! $(which rbenv); then
	echo "Insalling rbenv..."
	brew install rbenv
	rbenv init
	curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
fi

# Install gem
mod=(
	cocoapods
	commander
)

echo "Installing gem..."
sudo gem install ${mod[@]}

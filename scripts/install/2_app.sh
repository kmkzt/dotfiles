#!/bin/sh

# Apps
apps=(
	google-chrome
	firefox
	visual-studio-code
)

# Install apps to /Applications
for app in ${apps[@]}
do
	echo "installing $app"
	brew install --cask --appdir="/Applications" $app
done

# Apps
tools=(
	lsd
	cmake
	tmux
	gawk
	nvim
	fzf
	peco
	ghq
	translate-shell
	minikube
	telnet
	watchman
	deno
	graphviz
	jq
	direnv
	tig
	tree
)

# Install apps to /Applications
for tool in ${tools[@]}
do
	echo "installing $tool"
	brew install $tool
done

# Git install
brew install git
brew link --overwrite git

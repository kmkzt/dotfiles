#!/bin/sh

# Install Brew Cask
echo "Installing brew cask..."
brew install caskroom/cask/brew-cask

# Apps
# GifCapture: https://github.com/onmyway133/GifCapture
apps=(
  google-chrome
  firefox
  virtualbox
  visual-studio-code
  gifcapture
  docker
)

# Install apps to /Applications
echo "installing apps..."
brew install --cask --appdir="/Applications" ${apps[@]}

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
)

# Install apps to /Applications
echo "installing　tools ..."
brew install ${tools[@]}

# Git install
brew install git
brew link --overwrite git

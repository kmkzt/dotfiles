#!/bin/sh

# Apps
# GifCapture: https://github.com/onmyway133/GifCapture
apps=(
  google-chrome
  firefox
  visual-studio-code
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
  deno
  graphviz
  jq
  direnv
  tig
)

# Install apps to /Applications
echo "installing tools ..."
brew install ${tools[@]}

# Git install
brew install git
brew link --overwrite git

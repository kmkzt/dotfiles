#!/bin/sh

# Apps
tools=(
  git
  github/gh/gh
  git-extras
  git-delta
  hub
)

# Install apps to /Applications
echo "installing git tools ..."
brew install ${tools[@]}

# Some git defaults
git config --global color.ui true
git config --global push.default simple
# No Fast-forward
git config --global merge.ff false
git config --global pull.ff only

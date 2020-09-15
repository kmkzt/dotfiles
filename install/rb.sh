#!/bin/sh

# Install gem
mod=(
  cocoapods
)

echo "installing gem..."
sudo gem gel ${mod[@]}
# Install Brew Cask
echo "Installing brew cask..."
brew install caskroom/cask/brew-cask

# Apps
apps=(
  google-chrome
  firefox
  visual-studio-code
)

# Install apps to /Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Apps
# FPP: https://github.com/facebook/PathPicker
tools=(
  lsd
  gawk
  ripgrep
  pandoc
  poppler
  tesseract
  ffmpeg
  fpp
  lazygit
)

# Install apps to /Applications
echo "installing　tools ..."
brew install ${tools[@]}
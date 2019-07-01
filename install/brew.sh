if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

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
)

# Install apps to /Applications
echo "installing　tools ..."
brew install ${tools[@]}
# Install git
if test ! $(which git); then
  echo "insalling git..."
  brew install git
fi
# Some git defaults
git config --global color.ui true
git config --global push.default simple
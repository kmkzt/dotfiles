if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install anyenv
git clone https://github.com/anyenv/anyenv ~/.anyenv
eval "anyenv install --init"

task=(
  app.sh
  aws.sh
  brew.sh
  dart.sh
  git.sh
  go.sh
  npm.sh
  rust.sh
)

zsh ${task[@]}

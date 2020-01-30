
if test ! $(which node); then
  echo "insalling node..."
  eval "$(anyenv install nodenv)"
  eval "$(nodenv install latest)"
  eval "$(nodenv global latest)"
fi

# Install Node modules
mod=(
  ts-node
  typescript
  casperjs
  webpack
  commitizen
  cz-conventional-changelog
  write-good
  lighthouse
  research-network
)

echo "installing node modules..."
npm install -g ${mod[@]}


if test ! $(which node); then
  echo "insalling node..."
  curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
  nvm install stable
  nvm alias default stable
fi

# Install Node modules
mod=(
  ts-node
  typescript
  casperjs
  webpack
)

echo "installing node modules..."
npm install -g ${mod[@]}

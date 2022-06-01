  
if test ! $(which node); then
  echo "insalling node..."
  eval "$(anyenv install --init)"
  eval "$(anyenv install nodenv)"
  eval "$(nodenv init -)"
  eval "$(~/.anyenv/envs/nodenv/plugins/node-build/install.sh)"
  eval "$(nodenv install 16.15.0)"
  eval "$(nodenv global 16.15.0)"
  eval "$(nodenv rehash)"
fi


npm install -g yarn

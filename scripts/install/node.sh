#!/bin/sh

NODE_VERSION="24.11.1"

setup_nodenv() {
	if test ! $(which nodenv); then
		eval "$(anyenv install --init)"
		eval "$(anyenv install nodenv)"
		eval "$(nodenv init -)"
		eval "$(~/.anyenv/envs/nodenv/plugins/node-build/install.sh)"
	else
		echo "nodenv already installed."
	fi
}

setup_node() {
	eval "$(nodenv install $NODE_VERSION -f)"
	eval "$(nodenv global $NODE_VERSION)"
	eval "$(nodenv rehash)"
}

echo "Setup nodenv..."
setup_nodenv;
echo "Setup node..."
setup_node;

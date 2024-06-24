#!/bin/sh

NODE_VERSION="20.15.0"
CURRENT_NODE_VERSION=$(node -v | sed -e 's/v//')

setup_nodenv() {
	eval "$(anyenv install --init)";
	eval "$(anyenv install nodenv)";
	eval "$(nodenv init -)";
	eval "$(~/.anyenv/envs/nodenv/plugins/node-build/install.sh)";
}

setup_node() {
	eval "$(nodenv install $NODE_VERSION)";
	eval "$(nodenv global $NODE_VERSION)";
	eval "$(nodenv rehash)";
	corepack enable pnpm;
}

if test ! $(which node); then
	echo "installing nodenv...";
	setup_nodenv;
	echo "installing node...";
	setup_node;
elif [ "$1" = "-u" ] || [ $NODE_VERSION != $CURRENT_NODE_VERSION ]; then
	echo "Update node...";
	setup_node;
else
	echo "nodenv already installed";
fi

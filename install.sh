#!/bin/sh

INSTALL_DIR=$(dirname $0)/scripts/install

for task in $(ls $INSTALL_DIR | xargs) 
do
	echo "execute $INSTALL_DIR/$task";
	zsh $INSTALL_DIR/$task
done
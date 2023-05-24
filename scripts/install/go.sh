#!/bin/sh

if test ! $(which go); then
	echo "insalling go..."
	brew install go
fi

tools=(
	github.com/itchyny/mmv/cmd/mmv@latest
	github.com/evilmartians/lefthook@latest
	github.com/mattn/files@latest
	golang.org/x/tools/gopls@latest
)

for tool in ${tools[@]}
do
	echo "installing $tool";
	go install $tool;
done
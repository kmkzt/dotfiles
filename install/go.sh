#!/bin/sh

if test ! $(which go); then
  echo "insalling go..."
  brew install go
fi

tools=(
	github.com/itchyny/mmv/cmd/mmv
	github.com/mattn/files
  	github.com/x-motemen/ghq
	golang.org/x/tools/gopls
)

echo "installing go tools..."
go get -u -v -t ${script[@]}

#!/bin/sh

if test ! $(which go); then
  echo "insalling go..."
  brew install go
fi

script=(
  github.com/itchyny/mmv/cmd/mmv
	github.com/mattn/files
  github.com/x-motemen/ghq
)

echo "installing go script..."
go get ${script[@]}
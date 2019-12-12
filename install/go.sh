if test ! $(which go); then
  echo "insalling go..."
  brew install go
fi

script=(
  github.com/b4b4r07/gist
  github.com/skanehira/pst
)

echo "installing go script..."
go get ${script[@]}
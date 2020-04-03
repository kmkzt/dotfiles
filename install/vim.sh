# https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# nvim-budle: https://github.com/Shougo/dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/dein
rm ./installer.sh

# https://github.com/Shougo/deoplete.nvim
pip3 install --user pynvim
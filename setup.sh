#!/bin/sh

DOTFILES_PATH=$(pwd);
echo "load dotfiles: $DOTFILES_PATH"

# zsh
ln -sf $DOTFILES_PATH/config/.zshrc ~/.zshrc
# ln -sf $DOTFILES_PATH/.zprofile ~/.zprofile
echo "Sync .zshrc"

# vim
ln -sf $DOTFILES_PATH/config/.vimrc ~/.vimrc
ln -sf $DOTFILES_PATH/config/nvim/init.vim ~/.config/nvim/init.vim
echo "Sync nvim config"

# git copy default config
cat $DOTFILES_PATH/config/.gitconfig > ~/.gitconfig
echo "Copy .gitconfig"

# commitizen: https://github.com/commitizen/cz-cli
ln -sf $DOTFILES_PATH/config/.czrc ~/.czrc
echo "Sync .czrc"
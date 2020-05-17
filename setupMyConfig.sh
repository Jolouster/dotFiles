#!/bin/bash

# @todo: instalar neovim
#     sudo apt install neovim
# @todo: install plugins of nvim
# @todo: instalar brave-browser


## ----------------------------------------------------
## Enlazado de los archivos de configuración 
## ----------------------------------------------------
ln -sfv ~/dotFiles/myBashrc $HOME/.bashrc
ln -sfv ~/dotFiles/myAlias $HOME/.bash_aliases
ln -sfv ~/dotFiles/gitConfig $HOME/.gitconfig
ln -sfv ~/dotFiles/myProfile $HOME/.profile
ln -sfv ~/dotFiles/init.vim $HOME/.config/nvim/init.vim

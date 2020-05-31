#!/bin/bash

# @todo: instalar neovim
#     sudo apt install neovim
# @todo: install plugins of nvim
# @todo: instalar brave-browser
# @todo: instalar fzf


## ----------------------------------------------------
## Powerline
## ----------------------------------------------------
# @todo: instalar powerline
# @todo: instalar fuentes
# @todo: instalar fzf
# @todo: configuraru powerline: mkdir $HOME/.config/powerline
# La configuración global se encuentra en /usr/local/lib/pythonXX/dist-packages/powerline/config_files/ que 
# hay que copiar al directorio del usuario. Mejor no tocar la configuración global.



## ----------------------------------------------------
## Enlazado de los archivos de configuración 
## ----------------------------------------------------
ln -sfv ~/dotFiles/myBashrc.sh $HOME/.bashrc
ln -sfv ~/dotFiles/myAlias.sh $HOME/.bash_aliases
ln -sfv ~/dotFiles/gitConfig $HOME/.gitconfig
ln -sfv ~/dotFiles/myProfile $HOME/.profile
ln -sfv ~/dotFiles/init.vim $HOME/.config/nvim/init.vim

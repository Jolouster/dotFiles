#!/bin/bash

# @todo: instalar neovim
#     sudo apt install neovim
# @todo: install plugins of nvim
# @todo: instalar brave-browser
# @todo: instalar fzf
# @todo: instalar minicom

## ----------------------------------------------------
## Configuración de MINICOM 
## ----------------------------------------------------
## La configuración se establece desde el propio programa.
##
## Config. puerto serie:
## /dev/ttyUSB0   115200 8N1
## Terminal settings:
##   A - Terinal emulation: ANSI
##   B - Backspace key sends: BS
## Configure Minicom:
##   Configuración de la puerta serial
##      F - Control de Flujo por Hardware: No
##      G - Control de Flujo por Software: No
##   El resto como esté.
## 
## Colores cómodos para el menú de navegación letras cian y fondo azul
## Barra de estado: letras blancas y fondo rojo
## Importante habilitar el color para que en la línea de comandos
## se puedan visualizar los colores y el resaltado de sintaxis.
## ----------------------------------------------------



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
## Restaurar las tareas programadas
## ----------------------------------------------------
crontab ~/dotFiles/cron-backup.txt

## ----------------------------------------------------
## Crea el directorio donde se generan los backups automáticos de los archivos que se editan
## ----------------------------------------------------
mkdir -p ~/Temp/backupFiles

## ----------------------------------------------------
## Enlazado de los archivos de configuración 
## ----------------------------------------------------
ln -sfv ~/dotFiles/myBashrc.sh $HOME/.bashrc
ln -sfv ~/dotFiles/myAlias.sh $HOME/.bash_aliases
ln -sfv ~/dotFiles/gitConfig $HOME/.gitconfig
ln -sfv ~/dotFiles/myProfile $HOME/.profile
ln -sfv ~/dotFiles/init.vim $HOME/.config/nvim/init.vim

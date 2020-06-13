# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# -- JLU 12/05/2020 para usar powerline en bash
export TERM="screen-256color" 

if [ -f `which powerline-daemon` ]; then  
	XDG_CONFIG_DIRS=$HOME/.config/powerline/
	powerline-daemon -q  
	POWERLINE_BASH_CONTINUATION=1  
	POWERLINE_BASH_SELECT=1  
fi  
if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then  
	source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh  
fi  

# -- JLU 12/05/2020 Para usar Tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# -- JLU 29/05/2020 iniciar QtCreator para compilar para los equipos de Matrix (poky 1.7)
startQt() {
	bash /opt/Qt/Tools/QtCreator/bin/qtcreator-poky1.7.sh &>> /dev/null &
}

# -- JLU 31/05/2020 crea nueva nota
newNote() {
	local rawTitle=$1  ## String del titulo que se pasa entre comillas dobles a la función

	# Constantes
	local PATH_TO_NOTES=$HOME/Dropbox/ExBrain/
	local HEADER_TEMPLATE=$HOME/Dropbox/ExBrain/template-note.md
	local FILE_EXTENSION='.md'
	# Variables 
	local timeStamp=$(date '+%Y%m%d%H%M')
	local fileName=$PATH_TO_NOTES$timeStamp"-"${rawTitle// /-}$FILE_EXTENSION

	cp ${HEADER_TEMPLATE} $fileName
	local month=$(date +%B)
	sed -i -e "s/{myTitle}/$rawTitle/g" $fileName
	sed -i -e "s/{Month}/${month^}/g" $fileName
	sed -i -e "s/{Day}/$(date +%d)/g" $fileName
	sed -i -e "s/{year}/$(date +%Y)/g" $fileName

	nvim $fileName
}

# -- JLU 31/05/2020 crea una nueva entrada en el diario
newDay() {
	local PATH_TO_JOURNAL=$HOME/Dropbox/ExBrain/diario/
	local JOURNAL_TEMPLATE=$HOME/Dropbox/ExBrain/diario/diario-plantilla.md
	local timeStamp=$(date '+%Y%m%d%H%M')
	local fileName=$PATH_TO_JOURNAL$timeStamp"-diario.md"
	local month=$(date +%B)
	title="# $(date +%d) ${month^} $(date +%Y)"
	cp $JOURNAL_TEMPLATE $fileName
	sed -i -e "s/{myTitle}/$title/g" $fileName

	nvim $fileName
}

# -- JLU 01/06/2020 modo vim
set -o vi

# -- JLU 13/06/2020 ruta a mis notas personales
export NOTES_DIR=$HOME/Dropbox/ExBrain

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

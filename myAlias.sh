## -- JLU 12/05/2020
alias ls='ls -lsh --color=auto'
alias fzf='fzf --height=40% --reverse --border --prompt="-->" --preview="head -n 20 {}" --preview-window=right:50% | xargs ls -lsh'
alias fvim='nvim -o $(\fzf --height=30% --preview="head -n 20 {}" --preview-window=right:70%)'
alias minicom='sudo minicom -con' # habilita colores en el serial
alias ping='ping -c 4 '
alias ..='cd ..'

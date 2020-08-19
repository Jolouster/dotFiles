## -- JLU 12/05/2020
alias ls='ls -lsh --color=auto'
alias fzf='fzf --height=40% --reverse --border --prompt="-->" --preview="head -n 20 {}" --preview-window=right:50% | xargs ls -lsh'
alias fvim='vim -o $(\fzf --height=50% --preview="head -n 20 {}" --preview-window=right:50%)'
alias minicom='minicom -con' # habilita colores en el serial

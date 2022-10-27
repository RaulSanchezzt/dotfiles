set fish_greeting ""

# Aliases
alias grep "grep --color=auto"
alias cat "batcat --style=plain --paging=never"
alias ls "exa --group-directories-first"
alias tree "exa -T"

alias gs "git status"
alias gc "git commit"
alias ga "git add"
alias gp "git push"
alias gl "gil pull"
alias gd "git diff"

# Start Starship
starship init fish | source
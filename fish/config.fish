set fish_greeting ""

# Aliases
alias grep "grep --color=auto"
alias cat "bat --style=plain --paging=never"
alias ls "eza --group-directories-first"
alias tree "eza -T"

# Custom scripts
alias icat "kitty +kitten icat"

# Git
alias gs "git status"
alias gc "git commit"
alias ga "git add"
alias gp "git push"
alias gl "git pull"
alias gd "git diff"

# Start Starship
starship init fish | source

# Config File Location
set -g -x STARSHIP_CONFIG "$HOME/dotfiles/fish/starship.toml"

# Hide Starship Warnings
set -g -x STARSHIP_LOG error

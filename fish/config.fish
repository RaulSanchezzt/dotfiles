set fish_greeting ""

# Aliases
alias grep "grep --color=auto"
alias cat "batcat --style=plain --paging=never"
alias ls "exa --group-directories-first"
alias tree "exa -T"

# Custom scripts
alias icat "kitty +kitten icat"
alias ct "sh ~/dotfiles/polybar/scripts/clear_target.sh"
alias vpn "sh ~/dotfiles/scripts/vpn.sh"
alias htb "sh ~/dotfiles/scripts/new.sh HTB"
alias thm "sh ~/dotfiles/scripts/new.sh THM"
alias docs "sh ~/dotfiles/scripts/docs.sh"

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

set fish_greeting ""

# Aliases
alias grep "grep --color=auto"
alias cat "batcat --style=plain --paging=never"
alias ls "exa --group-directories-first"
alias tree "exa -T"
alias blog "hugo server"

# Git
alias gs "git status"
alias gc "git commit"
alias ga "git add"
alias gp "git push"
alias gl "git pull"
alias gd "git diff"
alias gb "git add . && git commit -m 'Add work' && git push"

# ASIR

set blog /mnt/c/Users/Raul/Code/blog-asir/

function cdb
    cd $blog
end

function aso
    cdb
    cp templates/aso.md content/post/aso/index.md
end

function sadi
    cdb
    cp templates/sadi.md content/post/sadi/index.md
end

# Start Starship
starship init fish | source

# Config File Location
set -g -x STARSHIP_CONFIG "$HOME/dotfiles/fish/starship.toml"

# Hide Starship Warnings
set -g -x STARSHIP_LOG error

# Start NVM
nvm use lts >/dev/null
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH:/usr/local/go/bin

# Fix slowness of pasting with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinis

# ========== CUSTOM ALIAS ========== #
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cat='/usr/bin/batcat'
alias catn='/usr/bin/cat'
alias catnl='/bin/batcat --paging=never'
alias icat="kitty +kitten icat"
alias ct='sh ~/dotfiles/polybar/scripts/clear_target.sh'
alias vpn='sh ~/dotfiles/scripts/vpn.sh'
alias htb='sh ~/dotfiles/scripts/htb.sh'
alias thm='sh ~/dotfiles/scripts/thm.sh'
alias docs='sh ~/dotfiles/scripts/docs.sh'

# ========== GIT ALIAS ========== #
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'

# ========== ZSH PLUGINS ========== #

# ZSH SUDO
source /usr/share/zsh-plugins/sudo.plugin.zsh

# ZSH Autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Save type history for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

# Share history between terminals
setopt share_history

# ZSH Syntax Highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# FZF keybindings
source /usr/share/doc/fzf/examples/key-bindings.zsh

# FZF completion
source /usr/share/doc/fzf/examples/completion.zsh

# Power Level 10k
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ========== FUNCTIONS ========== #

# Create directories
function mkt(){
    mkdir {content,docs,exploits,nmap}
}

# Clear zsh_history
function clearhistory(){
  echo "" > ~/.zsh_history
  exit 0
}

# Kill process
function kp() {
    ps aux | grep $1 > /dev/null
    mypid=$(pidof $1)
    if [ "$mypid" != "" ]; then
      kill -9 $(pidof $1)
      if [[ "$?" == "0" ]]; then
        echo "PID $mypid ($1) killed."
      fi
    else
      echo "None killed."
    fi
    return;
}

# Set 'man' colors
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

# Set Target (IP Address)
function st(){
    targetIP=$1
    targetName=$2
    echo "$targetIP" > ~/.config/polybar/scripts/targetIP
    echo "$targetName" > ~/.config/polybar/scripts/targetName
}

# Extract nmap information
function extractPorts(){
    ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
    ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"

    echo -e "\n${yellowColour}[*] Extracting information...${endColour}\n"

    echo -e "\t${grayColour}[*] IP Address:${endColour} ${greenColour} $ip_address${endColour}"
    echo -e "\t${grayColour}[*] Open ports:${endColour} ${redColour} $ports${endColour}\n"

    echo $ports | tr -d '\n' | xclip -sel clip
    echo -e "${blueColour}[*] Ports copied to clipboard${endColour}\n"
}

# ========== FIX ========== #
# Java
export _JAVA_AWT_WM_NONREPARENTING=1

# Partial line symbol
# https://stackoverflow.com/questions/36977990/why-zsh-adds-at-the-end-of-my-output
export PROMPT_EOL_MARK=''

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

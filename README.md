# Mint

This are my personal **dotfiles** that I use in Linux Mint.

## Installation

> Install FiraCode Nerd Font ;)

1. Install the necessary apps:

```bash
$ sudo apt install kitty fish vim git bat eza
```

2. Clone this repository and change the directory.

```bash
# Using HTTP
$ git clone https://github.com/RaulSanchezzt/dotfiles.git ~/dotfiles && cd ~/dotfiles

# Using SSH
$ git clone git@github.com:RaulSanchezzt/dotfiles.git ~/dotfiles && cd ~/dotfiles
```

3. **Switch** to `mint` branch.

```bash
$ git checkout mint
```

4. Install [starship](https://starship.rs/) cross-shell prompt.

5. Copy this folders to ~/.config

> To update the configuration use git pull inside the dotfiles directory.

## Setup

### Dev tools

- [Git](https://git-scm.com/)
- [Python3](https://www.python.org/)
- [Node.js](https://nodejs.org/en/)
  - [npm](https://www.npmjs.com/)

### Command Line

#### Shell

- [Kitty](https://sw.kovidgoyal.net/kitty/)
- [Fish](https://fishshell.com/)

#### Plugins

- [fisher](https://github.com/jorgebucaran/fisher)
- [nvm.fish](https://github.com/jorgebucaran/nvm.fish)

#### Tools

- [bat](https://github.com/sharkdp/bat)
- [exa](https://github.com/ogham/exa)

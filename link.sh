#!/bin/bash

  # bspwm
  ln -sf ~/dotfiles/bspwm/ ~/.config/bspwm
  echo "bspwm symlink created"
  
  # fzf
  sudo rm -rf /usr/share/doc/fzf/examples
  sudo ln -sf ~/dotfiles/fzf/examples /usr/share/doc/fzf/examples
  
  # .gitconfig
  ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
  echo ".p10k.zsh symlink created"
  
  # kitty
  ln -sf ~/dotfiles/kitty/ ~/.config/kitty
  echo "kitty symlink created"

  # picom
  ln -sf ~/dotfiles/picom/ ~/.config/picom
  echo "picom symlink created"

  # polybar
  ln -sf ~/dotfiles/polybar/ ~/.config/polybar
  echo "polybar symlink created"

  # sxhkd
  ln -sf ~/dotfiles/sxhkd/ ~/.config/sxhkd
  echo "sxhkd symlink created"

  # .zshrc
  ln -sf ~/dotfiles/.zshrc ~/.zshrc
  echo ".zshrc symlink created"

  # .p10k.zsh
  ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
  echo ".p10k.zsh symlink created"

  # root dotfiles
  sudo ln -sf ~/dotfiles/ /root/dotfiles
  echo "root dotfiles created"

  # bat command
  # sudo ln -sf /usr/bin/bat /usr/bin/batcat

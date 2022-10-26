#!/bin/bash

  # fish
  ln -sf ~/dotfiles/fish/ ~/.config/fish
  echo "fish symlink created"
  
  # .gitconfig
  ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
  echo ".p10k.zsh symlink created"

  # .profile
  ln -sf ~/dotfiles/.profile ~/.profile
  echo ".profile symlink created"
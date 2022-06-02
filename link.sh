#!/bin/bash

  # bspwm
  ln -sf ~/dotfiles/bspwm/ ~/.config/bspwm
  echo "bspwm symlink created"
  
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

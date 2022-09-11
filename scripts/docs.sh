#!/bin/bash

# Config Variables
blog=~/Code/blog.raulsanchezzt.com/

# Functions
menu(){
  clear
  echo "1) Blog"
  echo "2) ASIR"
  read -p "Select the platform: " platform;

  case $platform in
    1) Blog;;
    2) ASIR;;
    *) mainMenu;;
  esac
}

Blog(){
  clear
  # Start Obsidian
  flatpak run md.obsidian.Obsidian > /dev/null 2>&1 &
  cd $blog
  hugo server
}

# Start
menu
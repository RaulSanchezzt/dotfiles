#!/bin/sh

# Config Variables
htb_folder=~/Repositories/htb-docusaurus/
thm_folder=~/Repositories/thm-jekyll/
thm_template="https://gitlab.com/RZZT/thm-jekyll/-/raw/main/_posts/template.md"

# Current date
date=$(date +"%Y-%m-%d")

# Functions
mainMenu(){
  read -p "Name of the post: " name;
  clear;

  echo "1) Hack The Box"
  echo "2) Try Hack Me"
  echo "3) Blog"
  echo "4) ASIR"
  read -p "Select the platform: " platform;

  case $platform in
    1) HTB;;
    2) THM;;
    3) Blog;;
    4) ASIR;;
    *) mainMenu;;
  esac
}

HTB(){
  echo "1) Machines"
  echo "2) Challenges"
  read -p "Select the template: " htbTemplate;
}

THM(){
  mkdir $thm_folder/_posts/$name
  wget -O - $thm_template > $thm_folder/_posts/$name/$date-$name.md
  mkdir $thm_folder/assets/img/$name

  flatpak run com.github.marktext.marktext $thm_folder > /dev/null 2>&1 &
}

# Start
mainMenu

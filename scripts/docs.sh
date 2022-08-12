#!/bin/bash

# Config Variables
htb_folder=~/Repositories/htb-docusaurus/
thm_folder=~/Repositories/thm-jekyll/

# Current date
date=$(date +"%Y-%m-%d")

# Input of the user
option="$1"

# Check the Input
checkInput(){
  case $option in
    edit) editPost;;
    *) menu;;
  esac
}

# Functions
menu(){
  clear
  read -p "Name of the post: " name;

  clear
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

# Hack The Box Main Menu
  HTB(){
    clear
    echo "1) Machines"
    echo "2) Challenges"
    read -p "Select the category: " htbCategory;

    case $htbCategory in
      1) htbMachines;;
      2) htbChallenges;;
      *) HTB;;
    esac
  }

# Hack The Box Submenus
    htbMachines(){
      # Select OS of the machine
      clear
      echo "1) Linux"
      echo "2) Windows"
      read -p "Select the OS: " htbOS;

      case $htbOS in
        1) os="linux";;
        2) os="windows";;
        *) htbMachines;;
      esac
    
      # Select the Difficulty of the machine  
      clear
      echo "1) Easy"
      echo "2) Medium"
      echo "3) Hard"
      echo "4) Insane"
      read -p "Select the difficulty: " htbDifficulty;

      case $htbDifficulty in
        1) difficulty="easy";;
        2) difficulty="medium";;
        3) difficulty="hard";;
        4) difficulty="insane";;
        *) htbMachines;;
      esac

      # Create the post folder
      mkdir -p $htb_folder/machines/$os/$difficulty/$name
      # Copy the template and save it in his folder
      cp $htb_folder/templates/machines.md $htb_folder/machines/$os/$difficulty/$name/$name.md

      htbStart
    }

    htbChallenges(){
      # Select the type of the challenge
      clear
      echo "1) Pwn"
      echo "2) Hardware"
      echo "3) Crypto"
      echo "4) Mobile"
      echo "5) Reversing"
      echo "6) GamePwn"
      echo "7) Forensics"
      echo "8) Misc"
      echo "9) Web"
      read -p "Select the type: " htbType;

      case $htbType in
        1) type="pwn";;
        2) type="hardware";;
        3) type="crypto";;
        4) type="mobile";;
        5) type="reversing";;
        6) type="gamepwn";;
        7) type="forensics";;
        8) type="misc";;
        9) type="web";;
        *) htbChallenges;;
      esac

      # Create the post folder
      mkdir -p $htb_folder/challenges/$type/$name
      # Copy the template and save it in his folder
      cp $htb_folder/templates/challenges.md $htb_folder/challenges/$type/$name/$name.md

      htbStart
    }

    htbStart(){
      clear
      # Start markdown editor
      flatpak run com.github.marktext.marktext $htb_folder > /dev/null 2>&1 &
      # Start local server http://localhost:3000/
      cd $htb_folder
      yarn start
    }

# Try Hack Me Main Menu
  THM(){
    clear
    # Create the post folder
    mkdir -p $thm_folder/_posts/$name
    # Copy the template and save it in his folder
    cp $thm_folder/_posts/template.md $thm_folder/_posts/$name/$date-$name.md
    # Create the images folder
    mkdir -p $thm_folder/assets/img/$name

    thmStart
    }

    thmStart(){
      clear
      # Start markdown editor
      flatpak run com.github.marktext.marktext $thm_folder > /dev/null 2>&1 &

      # Start local server http://localhost:4000/
      cd $thm_folder
      bundle exec jekyll serve --incremental
    }

# Edit post Main Menu
  editPost(){
    clear
    echo "1) Hack The Box"
    echo "2) Try Hack Me"
    echo "3) Blog"
    echo "4) ASIR"
    read -p "Select the platform: " editPlatform;

    case $editPlatform in
      1) htbStart;;
      2) thmStart;;
      3) blogStart;;
      4) asirStart;;
      *) editPost;;
    esac
  }

# Start
checkInput

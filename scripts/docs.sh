#!/bin/bash

# Config Variables
blog=~/Code/blog.raulsanchezzt.com/

# Functions
mainMenu(){


  local menu
  clear
  echo -e "${blueColour}[!] Docs menu${endColour}\n"
  echo -e "${redColour}1) Create post${endColour}"
  echo -e "${greenColour}2) Edit post${endColour}"
  echo -e "${yellowColour}3) Edit template${endColour}"
  echo -e "${purpleColour}4) Open Code Editor${endColour}"
  vared -p "[?]: " menu;

  case $menu in
    1) createPost;;
    2) editPost;;
    3) editTemplate;;
    4) openCode;;
    *) mainMenu;;
  esac
}

createPost(){
  local name
  clear
  echo -e "${turquoiseColour}Name of the post: ${endColour}"
  vared -p "[?]: " name;

  local platform
  clear
  echo -e "${turquoiseColour}[!] Create post${endColour}\n"
  echo -e "${greenColour}1) Hack the Box${endColour}"
  echo -e "${redColour}2) Try Hack Me${endColour}"
  echo -e "${blueColour}3) Go back${endColour}"
  vared -p "[?]: " platform;

  case $platform in
    1) HTB;;
    2) THM;;
    3) mainMenu;;
    *) createPost;;
  esac
}

# Hack The Box Main Menu
  HTB(){
    local htbCategory
    clear
    echo -e "${greenColour}[!]Hack the Box${endColour}\n"
    echo -e "${yellowColour}1) Machines${endColour}"
    echo -e "${redColour}2) Challenges${endColour}"
    vared -p "[?]: " htbCategory;

    case $htbCategory in
      1) htbMachines;;
      2) htbChallenges;;
      *) HTB;;
    esac
  }

# Hack The Box Submenus
    htbMachines(){
      local htbOS
      clear
      echo -e "${greenColour}[!]OS Machine${endColour}\n"
      echo -e "${yellowColour}1) Linux${endColour}"
      echo -e "${blueColour}2) Windows${endColour}"
      vared -p "[?]: " htbOS;

      case $htbOS in
        1) os="linux";;
        2) os="windows";;
        *) htbMachines;;
      esac

      local htbDifficulty  
      clear
      echo -e "${}[!]Difficulty${endColour}\n"
      echo -e "${greenColour}1) Easy${endColour}"
      echo -e "${yellowColour}2) Medium${endColour}"
      echo -e "${redColour}3) Hard${endColour}"
      echo -e "${purpleColour}4) Insane${endColour}"
      vared -p "[?]: " htbDifficulty;

      case $htbDifficulty in
        1) difficulty="easy";;
        2) difficulty="medium";;
        3) difficulty="hard";;
        4) difficulty="insane";;
        *) htbMachines;;
      esac

      # Create the post folder
      mkdir -p $blog/content/posts/hackthebox/machines/$os/$difficulty/$name
      # Copy the template and save it in his folder
      cp $blog/templates/htb-machines.md $blog/content/posts/hackthebox/machines/$os/$difficulty/$name/index.md
      
      echo -e "\n${turquoiseColour}Post succesfully created${endColour}"
      editPost
    }

    htbChallenges(){
      local htbType
      clear
      echo -e "${greenColour}[!]Challenge type${endColour}"
      echo -e "${redColour}1) Pwn"
      echo -e "${blueColour}2) Hardware"
      echo -e "${yellowColour}3) Crypto"
      echo -e "${purpleColour}4) Mobile"
      echo -e "${turquoiseColour}5) Reversing"
      echo -e "${grayColour}6) GamePwn"
      echo -e "${greenColour}7) Forensics"
      echo -e "${redColour}8) Misc"
      echo -e "${blueColour}9) Web"
      vared -p "[?]: " htbType;

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
      mkdir -p $blog/content/posts/hackthebox/challenges/$type/$name
      # Copy the template and save it in his folder
      cp $blog/templates/htb-challenges.md $blog/content/posts/hackthebox/challenges/$type/$name/index.md

      echo -e "\n${turquoiseColour}Post succesfully created${endColour}"
      editPost
    }

  THM(){
    local thmOS
      clear
      echo -e "${redColour}[!]OS Machine${endColour}\n"
      echo -e "${yellowColour}1) Linux${endColour}"
      echo -e "${blueColour}2) Windows${endColour}"
      vared -p "[?]: " thmOS;

      case $thmOS in
        1) os="linux";;
        2) os="windows";;
        *) THM;;
      esac

      local thmDifficulty  
      clear
      echo -e "${}[!]Difficulty${endColour}\n"
      echo -e "${greenColour}1) Easy${endColour}"
      echo -e "${yellowColour}2) Medium${endColour}"
      echo -e "${redColour}3) Hard${endColour}"
      echo -e "${purpleColour}4) Insane${endColour}"
      vared -p "[?]: " thmDifficulty;

      case $thmDifficulty in
        1) difficulty="easy";;
        2) difficulty="medium";;
        3) difficulty="hard";;
        4) difficulty="insane";;
        *) htbMachines;;
      esac

      # Create the post folder
      mkdir -p $blog/content/posts/tryhackme/rooms/$os/$difficulty/$name
      # Copy the template and save it in his folder
      cp $blog/templates/thm-rooms.md $blog/content/posts/tryhackme/rooms/$os/$difficulty/$name/index.md
      
      echo -e "\n${turquoiseColour}Post succesfully created${endColour}"
      editPost
  }

editPost(){
  clear
  echo -e "${redColour}[+] Starting Marktext Editor...${endColour}"
  flatpak run com.github.marktext.marktext $blog/content/posts > /dev/null 2>&1 &
  echo -e "${yellowColour}[*] Starting Hugo Local Server...${endColour}"
  cd $blog
  hugo server
}

editTemplate(){
  clear
  echo -e "${redColour}[+] Starting Marktext Editor...${endColour}"
  flatpak run com.github.marktext.marktext $blog/templates > /dev/null 2>&1 &
}

openCode(){
  clear
  echo -e "${redColour}[+] Starting Visual Studio Code${endColour}"
  code $blog
}

# Start
mainMenu

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

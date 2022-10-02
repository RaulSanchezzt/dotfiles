#!/bin/sh

# Variables
ctf="$1"
hosts_backup=/etc/hosts.bak
working_dir=/home/raul/Dropbox/$ctf/

# Functions
checkUser(){
  if [ "$EUID" -ne 0 ]; then 
    manual
  else
    checkInput
  fi
}

checkInput(){
  case $ctf in
    HTB) echo -e "${greenColour}[+] Hack The Box"${endColour} && checkBackupFile;;
    THM) echo -e "${redColour}[+] Try Hack Me"${endColour} && checkBackupFile;;
    help | *) manual;;
  esac
}

checkBackupFile(){
  # Checks if a backup copy exists
  if [ -f "$hosts_backup" ]; then
    # Restore hosts file
    sudo cp /etc/hosts.bak /etc/hosts
    echo -e "${blueColour}[!] /etc/hosts file restored from /etc/hosts.bak${endColour}"
  else
    # Backup of the hosts file
    sudo cp /etc/hosts /etc/hosts.bak
    echo -e "${blueColour}[!] $hosts_backup created.${endColour}"
  fi

  sleep 1;
  readInfo
}

readInfo(){
  # Get the information
  local address
  local name
  echo -e "${purpleColour}[?] IP address of the box: ${endColour}"
  vared -p "> " address
  echo -e "${yellowColour}[?] Name of the box: ${endColour}"
  vared -p "> " name
  
  appendHosts;
}

appendHosts(){
  # Add the record to the hosts file
  echo -e "${purpleColour}[!] Updating /etc/hosts file${endColour}"
  echo "" | sudo tee -a /etc/hosts
  echo "[!] $ctf" | sudo tee -a /etc/hosts
  echo $address $name.thm | sudo tee -a /etc/hosts
  echo ""
  sleep 2;

  allowFirewall;
}

allowFirewall(){
  # Delete all previous ufw rules
  sudo ufw --force reset >/dev/null 2>&1
  sudo ufw enable >/dev/null 2>&1

  # Allows all target connections on the allowFirewall
  sudo ufw allow from $address >/dev/null 2>&1
  
  # Print status of the firewall
  echo -e "${redColour}[!] Firewall${endColour}"
  sudo ufw status numbered

  createDirectory;
}

createDirectory(){
  # Create the working directory of the machine
  mkdir -p $working_dir/$name/content
  mkdir -p $working_dir/$name/docs
  mkdir -p $working_dir/$name/exploits
  mkdir -p $working_dir/$name/nmap

  echo -e "${greenColour}[!] Working directory created${endColour}"
  
  setTarget;
}

setTarget(){  
  # Set Target in Polybar
  echo "$address" > /home/raul/.config/polybar/scripts/targetIP
  echo "$name" > /home/raul/.config/polybar/scripts/targetName
  echo -e "${turquoiseColour}[!] Initial configuration completed${endColour}"
  
  changeDirectory;
}

changeDirectory(){
  cd $working_dir/$name
  $SHELL 
}

manual(){
  clear
  echo -e "${purpleColour}[+] Manual${endColour}\n"
  echo -e "${redColour}[!] You must run it as root${endColour}"
  echo -e "${blueColour}[*] Usage: source new.sh <CTF>${endColour}"
  echo -e "\t${turquoiseColour}CTF Options${endColour}"
  echo -e "\t\t${greenColour}HTB: Hack The Box${endColour}"
  echo -e "\t\t${redColour}THM: Try Hack Me${redColour}\n"
  echo -e "\t${yellowColour}Examples: ${endColour}"
  echo -e "\t\t${greenColour}# source new.sh HTB${endColour}"
  echo -e "\t\t${redColour}# source new.sh THM${endColour}"
}

# Call
checkUser

# Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

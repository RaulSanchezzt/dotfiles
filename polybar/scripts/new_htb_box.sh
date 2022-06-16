#!/bin/sh

hosts_backup=/etc/hosts.bak
htb_path=~/HTB

checkBackupFile(){
  clear;
  if [ -f "$hosts_backup" ]; then
    # Restore hosts file
    sudo cp /etc/hosts.bak /etc/hosts
    echo "[!] /etc/hosts file restored from /etc/hosts.bak";
    sleep 1;
    
    readInfo;
  else
    # Backup of the hosts file
    sudo cp /etc/hosts /etc/hosts.bak
    echo "[!] $hosts_backup created."
    sleep 1;
    
    readInfo;
  fi
}

readInfo(){
  # Get the information
  clear;
  read -p "[?] Type the IP address of the box: " address;
  clear;
  read -p "[?] Type the name of the box: " name;
  
  appendHosts;
}

appendHosts(){
  # Add the record to the hosts file
  echo "" | sudo tee -a /etc/hosts
  echo "# Hack The Box Machine" | sudo tee -a /etc/hosts
  echo $address $name.htb | sudo tee -a /etc/hosts
  clear;
  
  # Print hosts file
  echo "[!] Content of the hosts file"
  /usr/bin/batcat /etc/hosts
  sleep 2;
  clear;

  allowFirewall;
}

allowFirewall(){
  # Delete all previous ufw rules
  sudo ufw reset
  sudo ufw enable

  # Allows all target connections on the allowFirewall
  sudo ufw allow from $address
  clear;
  
  # Print status of the firewall
  echo "[!] Firewall"
  sudo ufw status numbered
  sleep 2;
  clear;

  createFolder;
}

createFolder(){
  # Create the folder of the machine
  mkdir $htb_path/$name
}
# Start
checkBackupFile;

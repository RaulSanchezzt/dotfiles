#!/bin/sh

hosts_backup=/etc/hosts.bak
thm_path=/home/raul/Dropbox/THM/

checkBackupFile(){
  # Checks if a backup copy exists
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
  read -p "[?] Type the IP address of the box: " address;
  read -p "[?] Type the name of the box: " name;
  
  appendHosts;
}

appendHosts(){
  # Add the record to the hosts file
  echo "" | sudo tee -a /etc/hosts
  echo "[!] Try Hack Me Machine" | sudo tee -a /etc/hosts
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
  echo "[!] Firewall"
  sudo ufw status numbered

  createDirectory;
}

createDirectory(){
  # Create the working directory of the machine
  mkdir -p $thm_path/$name/content
  mkdir -p $thm_path/$name/docs
  mkdir -p $thm_path/$name/exploits
  mkdir -p $thm_path/$name/nmap

  echo "[!] Working directory created"
  
  setTarget;
}

setTarget(){  
  # Set Target in Polybar
  echo "$address" > /home/raul/.config/polybar/scripts/targetIP
  echo "$name" > /home/raul/.config/polybar/scripts/targetName
  echo "[!] Initial configuration completed"
  
  changeDirectory;
}

changeDirectory(){
  cd $thm_path/$name
  $SHELL 
}

# Start
checkBackupFile;

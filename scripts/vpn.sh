#!/bin/bash

htb_vpn=~/Dropbox/VPN/htb.ovpn
thm_vpn=~/Dropbox/VPN/thm.ovpn

option="$1"

checkInput(){
  case $option in
    htb) HTB;;
    thm) THM;;
    quit | exit) killPS;;
    menu | *) menu;;
  esac
}

HTB(){
  sudo openvpn $htb_vpn
}

THM(){
  sudo openvpn $thm_vpn
}

killPS(){
  ps=$(ps aux | grep openvpn | awk '{print $2}')
  sudo kill -9 $ps 2>/dev/null
}

menu(){
  clear;
  echo "\n[!] VPN Menu:\n"
  echo "1) Connect to Hack The Box VPN"
  echo "2) Connect to Try Hack Me VPN"
  echo "3) Kill openvpn process"
  echo "4) Exit\n"

  read -p "[?] Select an option: " menu;
  
  case "$menu" in
    1) HTB;;
    2) THM;;
    3) killPS;;
    4) clear && exit 0;;
    *) menu;;
  esac
}

# Start
checkInput

#!/bin/sh

YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)
  
if [[ ! -z $YUM_CMD ]]; then
  # Disable network manager
  sudo systemctl disable NetworkManager.service
  sudo systemctl disable firewalld.service
  sudo chkconfig network on
  #sudo systemctl restart network.service
  sudo systemctl stop NetworkManager.service
elif [[ ! -z $APT_GET_CMD ]]; then
  # Disable Firewall
  ufw disable
  service ufw stop
fi

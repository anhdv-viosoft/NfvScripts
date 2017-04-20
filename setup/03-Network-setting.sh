#!/bin/sh

# Disable network manager
sudo systemctl disable NetworkManager.service
sudo systemctl disable firewalld.service
sudo chkconfig network on
#sudo systemctl restart network.service
sudo systemctl stop NetworkManager.service

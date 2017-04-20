#!/bin/sh

sudo service iptables save
sudo systemctl stop firewalld
sudo systemctl disable  firewalld
sudo systemctl disable irqbalance.service
echo 0 > /proc/sys/kernel/randomize_va_space

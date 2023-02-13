#!/bin/bash

# Squid Installer

sudo apt install squid -y
/bin/rm -f /etc/squid/squid.conf
/usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/ngoikhoctrencay97/Proxyset/main/squid.conf
sudo systemctl restart squid

#Heisenberg

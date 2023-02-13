#!/bin/bash

# Squid Installer

if cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 20.04"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/ngoikhoctrencay97/Proxyset/main/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
    /sbin/iptables-save
    service squid restart
    systemctl enable squid
else
    echo "OS NOT SUPPORTED.\n"
    echo "Contact us to add support for your os."
    exit 1;
fi

#/usr/bin/htpasswd -b -c /etc/squid/passwd USERNAME_HERE PASSWORD_HERE

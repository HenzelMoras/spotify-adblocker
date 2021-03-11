#!/bin/bash

# constants file
source constants.conf

# check root privilege
if [ "$EUID" -ne 0 ]
then
    printf "script requires root privileges!\nPlease run as root."
    sleep 1
    exit
fi

# removing the domains from hosts file

echo "[-] Removing the ad domains from hosts file"
sed -i "/${header}/,/${footer}/d" "$hostfile"
sleep 1
echo "Done"
#!/bin/bash
# Script for blocking domains via hosts file

# constants file
source constants.conf

# check root privilege
if [ "$EUID" -ne 0 ]
then
    printf "script requires root privileges!\nPlease run as root."
    sleep 1
    exit
fi

# check if the domains already exists

check_line=$(grep "$header" "$hostfile")
if [ "$check_line" ]
then
    echo "[-] removing old script.."
    sed -i "/${header}/,/${footer}/d" "$hostfile"
    sleep 1
    echo "[+] adding new script...."
fi

# append the domains to hosts file
echo "[+] blocking spotify ad domains "
cat blacklist.txt >> ${hostfile}

echo ""
echo "--- Enjoy spotify without ads :) --- "

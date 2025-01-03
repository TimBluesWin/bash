#!/bin/bash

ip_address=$1

if [[ $# = 0 ]]
then
	echo "No IP address provided. Please try again."
	exit
elif [[ $# -ne 1 ]]
then
	echo "Please provide only 1 IP address."
        exit
elif [[ $ip_address =~ ^(([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))\.){3}([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))$  ]]	
then
	echo "IP Address $ip_address is valid"
	ip_valid=true
else
	echo "IP Address $ip_address is invalid."
	exit
fi

echo "Testing pinging $ip_address before blocking..."
ping -c 3 "$ip_address"
echo "Dropping packets from $ip_address. Enter sudo password when prompted."
sleep 1
sudo iptables -I INPUT -s "$ip_address" -j DROP
echo "Packets from $ip_address successfully dropped."
echo "Testing another ping $ip_address"
ping -c 3 "$ip_address"


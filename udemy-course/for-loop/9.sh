#!/bin/bash

if [[  $# -ne 1 ]]
then
	echo "Usage: $0 <filename>"
	exit
elif [[ ! -f $1 ]]
then
	echo "Cannot find file $1. Exiting..."
	exit
fi

while read -r ip
do
	if [[ $ip =~ ^(([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))\.){3}([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))$  ]]	
	then
		echo "IP Address $ip is valid. Executing ping..."
		ping -c 1 $ip
	else
		echo "IP Address $ip is invalid. Skipping..."
	fi
	sleep 1
done < "$1"

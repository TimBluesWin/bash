#!/bin/bash

if [[ $# = 0 ]]
then
	echo "No IP address provided. Please provide at least 1 IP address, separated by space."
	exit
fi

for var in "$@"
do
	if [[ $var =~ ^(([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))\.){3}([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))$  ]]	
	then
		echo "IP Address $var is valid"
		ping -c 1 $var
	else
		echo "IP Address $var is invalid. Skipping..."
	fi
	sleep 1
done

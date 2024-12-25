#!/bin/bash

for item in ./* #current file in the directory
do
	if [[ -f "$item" ]]
	then
		echo "Displaying the contents of $item"
		sleep 1
		cat $item
		echo "######################"
	fi
done

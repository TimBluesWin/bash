#!/bin/bash

read -p "Please enter a character." char
if [[ "$char" = "Y" ]]
then
	echo "YES"
elif [[ "$char" = "N" ]]
then
	echo "NO"
else
	echo "Please enter either Y or N."
fi

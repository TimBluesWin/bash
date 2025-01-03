#!/bin/bash

read -p "Please enter a character." char
if [[ "$char" = "Y" || "$char" = "y" ]]
then
	echo "\"YES\""
elif [[ "$char" = "N" || "$char" = "n"  ]]
then
	echo "\"NO\""
else
	echo "Please enter either Y or N."
fi

#!/bin/bash

filename_is_unique=false
number_of_files=0
echo "Creating five unique files..."
while [[ $filename_is_unique = false || $number_of_files -lt 5 ]]
do
	random_string=$(tr -dc 'A-Za-z0-9_' </dev/urandom | head -c 13; echo)
	find_results=$(find . -wholename $random_string)
	echo $find_results
	if [[ -z ${find_results} ]]
	then
		filename_is_unique=true
		echo "$random_string is unique. Processing..."
		touch ${random_string}
		number_of_files=$((number_of_files + 1))
		echo "File $random_string successfully created."
	else
		echo "$random_string is not unique. Repeating..."
	fi
done

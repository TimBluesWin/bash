#!/bin/bash

filename_is_unique=false
target_number_valid=false
number_of_files=0
number_regex='^-?[0-9]+$'
while [[ $target_number_valid = false ]]
do
	read -p "Please provide number of files: " target_number_files
	if [[ -z "${target_number_files}" ]]
	then
		echo "Provided number is empty. Please fill in a number."
	elif ! [[ $target_number_files =~ $number_regex ]]
	then
		echo "Value provided is not a number. Please provide a number."
	elif [[ $target_number_files -le 0 ]]
	then
		echo "Please provide a number greater than 0."
	elif [[ $target_number_files -ge 100 ]]
	then
		echo "Please provide a number less than 100."
	else
		echo "Target number of files is valid - $target_number_files"
		target_number_valid=true
	fi

done
echo "Creating $target_number_files unique files..."
while [[ $filename_is_unique = false || $number_of_files -lt $target_number_files ]]
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

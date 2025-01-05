#!/bin/bash

is_file=false

while [[ $is_file = false ]]
do
	read -p "Please provide a file " file
	if [[ -f "$file" ]]
	then
		is_file=true
		echo "File provided $file is a file. Proceeding"
		sleep 1
	else
		echo "File provided $file is not a file. Try again!!!"
	fi
done

number_one_valid=false
number_two_valid=false
number_regex='^-?[0-9]+$'

while [[ $number_one_valid = false ]]
do
	read -p "Please provide the first number " number_one
	if [[ -z "${number_one}" ]]
	then
		echo "First number is empty. Please fill in a number."
	elif ! [[ $number_one =~ $number_regex ]]
	then
		echo "First number is not a number. Please provide a number."
	elif [[ $number_one -le 0 ]]
	then
		echo "Please provide a number greater than 0."
	else
		echo "First number is valid - $number_one"
		number_one_valid=true
	fi

done

while [[ $number_two_valid = false ]]
do
        read -p "Please provide the second number " number_two
        if [[ -z "${number_two}" ]]
        then
                echo "Second number is empty. Please fill in a number."
        elif ! [[ $number_two =~ $number_regex ]]
        then
                echo "Second number is not a number. Please provide a number."
        elif [[ $number_two -le 0 ]]
        then
                echo "Please provide a number greater than 0."
        elif [[ $number_two -lt $number_one ]]
	then
		echo "Second number is less than first number. Try again."
	else
                echo "Second number is valid - $number_two"
		number_two_valid=true
        fi

done

number_of_lines=$(($number_two - $number_one + 1))

head -n $number_two $file | tail -n $number_of_lines

#!/bin/bash

file=$1
if [[ $# -eq 0 ]]
then
	echo "No files are provided. Please provide one."
	exit
elif [[ $# -ne 1 ]]
then
	echo "Please provide only one file."
	exit
elif [[ ! -f $file ]]
then
	echo "$file is not a file. Please try again."
	exit
else
	echo "Appending list of logged in users..."
	sleep 1
	echo $(users) >> $file
	echo "Appending current date and time..."
	sleep 1
	echo $(date) >> $file
fi

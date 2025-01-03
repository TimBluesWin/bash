#!/bin/bash

if [[ "$#" -ne 2 ]]
then
	echo "Please provide 2 arguments."
	echo "Argument 1: command (enclosed in quotes)"
	echo "Argument 2: String to be searched from the results."
	exit
fi

test="$1"
is_error=$($test 2> /dev/null)

if [[ $? -eq 0 ]]
then
	echo "Command is valid. Executing..."
else
	echo "Command invalid. Exiting..."
	exit
fi
result=$($test | grep "$2")
if [[ -n "$result" ]]
then
	echo "$result"
else
	echo "$2 not found in the command '$1'."
fi

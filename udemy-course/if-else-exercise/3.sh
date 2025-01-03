#!/bin/bash

if [[ $# -ne 1 ]]
then
	echo "Please provide exactly one file."
	exit
fi

if [[ -f $1 ]]
then
	echo "Emptying contents of file $1..."
	truncate -s 0 $1
else
	echo "The provided argument is not a file. Please try again."
fi

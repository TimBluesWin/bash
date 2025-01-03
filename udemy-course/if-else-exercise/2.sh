#!/bin/bash

if [[ $# -ne 1 ]]
then
	# Technically this can be done by nested if, however I prefer to exit early.
	echo "Please provide exactly 1 file. Thanks."
	exit
fi
if [[ -f $1 ]]
then
	echo "This is a file!"
else
	echo "Sorry, this is not a file."
fi

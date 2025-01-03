#!/bin/bash

if [[ -f $1 ]]
then
	echo "This is a file!"
else
	echo "Sorry, this is not a file."
fi

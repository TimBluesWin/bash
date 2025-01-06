#!/bin/bash
PS3="Choose: "
select ITEM in "Display Date and Time" "List users logged in" "Display disk usage" "Exit"
do
	if [[ "$REPLY" =~ " " ]]
	then
		echo "Contain space. Try again."
	elif [[ ! "$REPLY" =~ 1|2|3|4 ]]
	then
		echo "Invalid option, try again."
	elif [[ "$REPLY" -eq 1 ]]
	then
		today_date=$(date +%Y-%m-%d\ %H:%M:%S)
    		echo "The current date is $today_date"
	elif [[ "$REPLY" -eq 2 ]]
	then
		echo "Outputting list of logged-in users..."
		who
	elif [[ "$REPLY" -eq 3 ]]
	then
		echo "Outputting disk usage..."
		df -k
	elif [[ "$REPLY" -eq 4 ]]
	then
		echo "Goodbye." 
		exit
	fi
done

#!/bin/bash
PS3="Choose: "
select ITEM in "Display Date and Time" "List users logged in" "Display disk usage" "Exit"
do
	case $REPLY in
		1)
			today_date=$(date +%Y-%m-%d\ %H:%M:%S)
    		echo "The current date is $today_date"
			;;
		2)
			echo "Outputting list of logged-in users..."
			who
			;;
		3)
			echo "Outputting disk usage..."
			df -k
			;;
		4)
			echo "Goodbye." 
			exit
			;;
		*)
			echo "Invalid option, try again."
			;;
	esac
done

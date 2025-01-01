#!/bin/bash

username_valid=false
groupname_valid=false
# $1 is type of input
function validate_regex() {
	ALLOWED_REGEX="^[a-z][-a-z0-9]*$"
	error_message=""
	if [[ -z  "$2" ]]
	then
		echo "Please fill in $1."
	elif [[ ! "$2" =~ $ALLOWED_REGEX ]]
	then
		echo "$1 is invalid. Only lowercase letters, numbers, and dash is allowed, and $1 must start with a lowercase letter." 
	else
		if [[ "$1" = "Username" ]]
		then
			username_valid=true
			echo "Username is $2"

		elif [[ "$1" = "Group" ]]
		then
			groupname_valid=true
			echo "Group name is $2"

		fi
	fi
}


echo "Creating a username with secondary group"
echo "-----------------------------------------"
sleep 1
while [[ "$username_valid" = false ]]
do
	read -p "Please enter a username: " username_input
	validate_regex "Username" "$username_input"
	echo "-----------------------------------------"

done
while [[ "$groupname_valid" = false ]]
do
        read -p "Please enter a group name: " groupname_input
        validate_regex "Group" "$groupname_input"
	echo "-----------------------------------------"
done

echo "Adding username $username_input with group $groupname_input..."
echo "-----------------------------------------"
sleep 1
groupadd "$groupname_input"
useradd -s /bin/bash -d "/home/$username_input" -m -G "$groupname_input" "$username_input"
echo "Successfully adding username $username_input with group $groupname_input."
echo "-----------------------------------------"
sleep 1
echo "Showing last 2 lines of /etc/passwd..."
echo "-----------------------------------------"
tail -n 2 /etc/passwd
echo "Showing last 2 lines of /etc/group..."
echo "-----------------------------------------"
tail -n 2 /etc/group

#!/bin/bash
valid_directory=false
not_forbidden_directory=true
# Files in the root directory should not be modified.
FORBIDDEN_DIRECTORIES=("/bin" "/boot" "/cdrom" "/dev" "/etc" "/lib" "/lib64" "/lost+found" "/media" "/mnt" "/opt" "/proc" "/programming" "/root" "/run" "/sbin" "/srv" "/sys" "/usr" "/var")

checkForbiddenDirectories() {
	FORBIDDEN_DIRECTORIES=("/bin" "/boot" "/cdrom" "/dev" "/etc" "/lib" "/lib64" "/lost+found" "/media" "/mnt" "/opt" "/proc" "/programming" "/root" "/run" "/sbin" "/srv" "/sys" "/usr" "/var")
}

echo "Fixing files' and directories' permissions."
echo "------------------------------"
sleep 1
while [[ "$valid_directory" = false || "$not_forbidden_directory" = false ]]
do
	valid_directory=false
	not_forbidden_directory=true
	read -p "Please enter a directory: " directory_input
	if [[ ! -d "$directory_input" ]]
	then
		echo "The directory entered is not valid. Please enter it again."
		continue # start the loop again
	else
		echo "Value entered is directory. Checking if directory is forbidden or not."
		valid_directory=true
	fi
	for dir in "${FORBIDDEN_DIRECTORIES[@]}"
	do
		echo $dir
		if [[ "$directory_input" == $dir* ]]
		then
			echo "You are not allowed to edit the permissions from the root directory!"
			not_forbidden_directory=false
			break # end this for loop early, and start the while loop all over again.
		fi
	done
	echo "------------------------------"
done

echo "Directory $directory_input is valid. Fixing permissions for directories..."
sleep 1
find "$directory_input" -type d -exec chmod 755 {} +
echo "Fixing permissions for files..."
sleep 1
find "$directory_input" -type f -exec chmod 644 {} +
echo "Successfully fixing permissions. Good luck!"

#!/bin/bash

function print_something() {
	echo "I'm a simple function!"
}

display_something() {
	echo "Hello functions!"
}

create_files(){
	echo "Creating $1"
	touch $1
	chmod 400 $1
	echo "Creating $2"
	touch $2
	chmod 600 $2
	return 10
}

function lines_in_file() {
	grep -c "$1" "$2"
}

print_something
display_something

create_files aa.txt bb.txt
echo $?

n=$(lines_in_file "usb" "/var/log/dmesg")
echo $n

#!/bin/bash

if [[  $# -ne 3 ]]
then
    echo "Usage: $0 <extension (no dot)> <absolute path of source directory> <destination>"
    exit
# The "~" (with quotes) causes the directory not to be recognized
elif [[ ! -d $2 ]]
then
    echo $2
    echo "Cannot find directory $2 for the source directory. Exiting..."
    exit
# Everything is okay. Proceed with copying files
else
    echo "Copying files from source '$2' to destination '$3'..."
    echo "Checking if parent of destination directory exists..."
    sleep 0.5
    # To make sure the parent directory exists. Two birds in one stone!
    parent_destination_dir="$(dirname "$3")"
    echo "The parent directory for the destination is '$parent_destination_dir'"
    sleep 0.5

    if [[ ! -d "$parent_destination_dir" ]]
    then
        echo "Parent directory '$parent_destination_dir' does not exist. Exiting..."
        if [[ $3 =~ ~* ]]
        then
            echo "Hint: Please do not use double quotes when using '~' for home directory."
            echo "Because it causes bash to interpret it as a string and not as a home directory."
        fi
        exit
    fi
    # Check if the destination directory exists. If not, create.
    destination_dir=$3
    if [[ ! -d $destination_dir ]]
    then
        echo "Destination directory '$destination_dir' does not exist. Creating..."
        mkdir -p $destination_dir
    fi
    sleep 0.5
    echo "Copying files from source '$2' to destination '$3'..."
    # Copy files from source to destination. We use find with -exec to copy files.
    # -p preserves file. -r copies directories recursively. -v verbosely shows the progress.
    find "$2" -name "*.$1" -exec cp -prv '{}' "$3" ';'
fi

# Copy files from source to destination

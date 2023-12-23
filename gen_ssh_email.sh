#!/bin/bash

# create destination file for private ssh key
# generate ssh with email
# print the ssh after generating
# Usage should require  directory, if no directory is entered, default directory
# will be ~/.ssh

email=$1
filename=$2
dir=$3

if [ -z "$dir" ]
then
    echo "Storing in '~/.ssh' directory by default"
    dir=~/.ssh

    if [ -z "$filename" ]
    then
	echo "Creating id_rsa by default"
	filename="id_rsa"

	if [ -z "$email" ]
	then
	    echo "Error: Usage: $0 [email] [filename] [/path/to/dir]"
	    echo "Cleaning up ..."
	    echo "Exiting ..."
	    exit 1
	fi
    fi
fi

echo "This is email before creat_num_files: $email"
echo "This is filename before creat_num_files: $filename"
echo "This is dir before creat_num_files: $dir"

file_regex=$filename[0-9]*$

./creat_num_files.sh $dir "$filename"
if [ $? -ne 0 ]
then
    exit $?
fi

latest=$(ls -v "$dir"|grep $file_regex|tail -1)
if [ $? -ne 0 ]
then
    echo "Error finding most recent file"
    echo "Exiting ..."
    exit $?
fi

echo
echo "This is latest before ssh keygen: $latest"
echo
yes|ssh-keygen -t rsa -b 4096 -C "$email" -f "$dir/$latest" -N ""
if [ $? -ne 0 ]
then
    echo "Error generating ssh key"
    echo "Exiting ..."
    exit $?
fi

# set private key permissions to owner read and write only 
chmod 600 "$dir/$latest"

echo
echo "YOUR PUBLIC SSH KEY:"
cat "$dir/$latest.pub"

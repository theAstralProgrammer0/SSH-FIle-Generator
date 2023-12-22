#!/bin/bash

command=$1
arg=$2

# check if command exists
if command -v $command
then
    echo "PATH to $command is above"
    echo
    echo "Running it ..."
# if not install it
else
    echo
    echo "$command is not in your Filesystem"
    echo
    echo "Intalling it ..."
    echo
    sudo apt update && sudo apt install -y $command
    if [ $? -ne 0 ]
    then
        echo
        echo "Hmm...some error occured"
	echo
	echo "Confirm no typo in $command and try again"
	echo
	exit 1
    fi
fi
$command $arg

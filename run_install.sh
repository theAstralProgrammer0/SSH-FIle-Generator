#!/bin/bash

command=$@

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
    sudo apt update && sudo apt install -y $command >> run_install_result.log
    # check if install was not successful 
    if [ $? -ne 0 ]
    then
        echo
        echo "Some error occured. Installation unsuccessful" >> run_install_failure.log
	echo
	echo "Confirm no typo in $command and try again" >> run_install_diag.log
	echo
	# exit on failure
	exit 1
    fi
fi
$command

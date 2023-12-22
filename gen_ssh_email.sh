#!/bin/bash

# create destination file for private ssh key
# generate ssh with email
# print the ssh after generating

email=$1

./creat_num_files.sh

ssh-keygen -t rsa -b 4096 -C "$email" -f 
eval “$(ssh-agent -s)”
cat 

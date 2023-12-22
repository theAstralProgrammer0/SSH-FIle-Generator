#!/bin/bash

filename="id_rsa0"

# at the end, new_filename should be id_rsa1 when filename is id_rsa or id_rsa0

# strip the filenames of their base parts
base_part="${filename%%[0-9]*}"

# strip the filenames of their num parts
num_part="${filename##[!0-9]}"

# if there is num_part, increment by 1, else set new_num_part to 1
if [ -n "$num_part" ]
then
    new_num_part=$((num_part + 1))
else
    new_num_part=1
fi

# concatenate both base_part and new_num_part
new_filename="${base_part}${new_num_part}"

# echo the  old and new filenames
echo "Original filename: $filename"
echo "New filename: $new_filename"
    




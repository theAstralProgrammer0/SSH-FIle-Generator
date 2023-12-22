#!/bin/bash

# enter the dir
# loop over each filename in the dir
# if the filename matches "id_rsa", number_files id_rsa
# else skip filename
# print the new filename generated
# 

# if dir is found
# list the files in the dir in 1 column
# grep all file_regex matches
# if value of grepped files is null (no file matches regex), then create a new
# id_rsa file
# else find the tail -1 of result and assign to file
# give number_file the file to increment

dir=$@
file_regex=id_rsa[0-9]*

if [ -d "$dir" ]
then
    echo "$dir DIRECTORY FOUND"
    latest=$(ls -1 "$dir"|grep $file_regex|tail -1)
    # check if no id_rsa exists
    if [ -z "$latest" ]
    then
        echo "No 'id_rsa' file found."
        echo "CREATING ONE ..."
        touch "$dir"/id_rsa
	if [ $? -eq 0 ]
        then
	    echo "id_rsa file created successfully!"
	else
	    echo "An error occured trying to create id_rsa file"
	fi
    else
        # id_rsa file exist, create next one
        echo "id_rsa file type found"
	echo "CREATING NEXT ..."
	./number_files.sh "${dir}/${latest}"
#touch "$dir/$latest"
#	echo "Next id_rsa file created successfully!"
    fi
else
    echo "$dir DIRECTORY NOT FOUND"
    echo "Exiting ..."
    exit 1
fi
exit 0


#for file in "$dir"/*; do
#       
#       filename=$(basename "$file")
#       
#	if [[ "$filename" =~ $file_regex ]]
#	then
#	    
#	    echo "id_rsa file type found"
#	    ./number_files.sh "$file"
#	    exit 0
#	fi
#   done

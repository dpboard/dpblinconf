#!/bin/bash

# Shell script to set up sym links to my environment config
# files.

THIS_SCRIPT=$(readlink -f "$0")
THIS_DIRECTORY=$(dirname "$THIS_SCRIPT")
FILES=(
	".bashrc"
	".gitconifg"
	".vimrc"
)


echo "Symlinking David's funky env configs from $THIS_DIRECTORY"

for file in ${FILES[@]}
do	
	ln -vfs "$THIS_DIRECTORY/$file" ~/$file
	STATUS+=$?
done

if [ $STATUS -eq 0 ];then
	echo "Done! :)"
else
	echo "Failed... :("
fi


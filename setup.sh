#!/bin/bash

# Shell script to set up sym links to my environment config
# files.

THIS_SCRIPT=$(readlink -f "$0")
THIS_DIRECTORY=$(dirname "$THIS_SCRIPT")
FILES=(
	".bashrc"
	".gitconfig"
	".vimrc"
	".screenrc"
        ".config/fish"
	".tmux.conf"
	".vim"
)


echo "Symlinking David's funky env configs from $THIS_DIRECTORY"

for file in ${FILES[@]}
do
	rm -rf ~/$file	
	ln -vfs "$THIS_DIRECTORY/$file" ~/$file
	STATUS+=$?
done

if grep -q fish /etc/shells; then
  FISH=$(grep fish /etc/shells)
  echo "Found fish shell at $FISH"
  chsh --shell $FISH boardd
  STATUS+=$?
else
  echo "Could not find fish shell"
fi

echo "Setting up authorized_keys"

ssh-copy-id -f -i "$THIS_DIRECTORY/.ssh/id_rsa.pub" boardd@localhost

if [ $STATUS -eq 0 ];then
	echo "Done! :)"
else
	echo "Failed... :("
fi


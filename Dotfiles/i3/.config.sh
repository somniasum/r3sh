#!/usr/bin/env bash 
#author: somniasum


if [ $1 == "-b" ]; then
	nvim ~/.bashrc
elif [ $1 == "-f" ]; then
	cd ~/.config ; nvim $(fzf) ; cd -
elif [ $1 == "-x" ]; then
	nvim ~/.Xresources 
elif [ $1 == "-h" ]; then
	echo "-h will display this message
		
		-b, config the bashrc
		-f, fuzzy find the config directory
		-x, config Xresources"
elif [ $1 == "" ]; then
	nvim ~/.config/
else
	nvim ~/.config/$1
fi



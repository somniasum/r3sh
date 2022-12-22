#!/bin/bash
#
echo "Starting STAGE 2"
echo "...making directories"

cd dotfiles

dir=('i3' 'kitty' 'nvim' 'picom' 'polybar' 'rofi' 'wallpaper')

for ((i=0; i<${#dir[@]}; i++))
do
	mkdir ~/.config/${dir[$i]}
	cp -r ${dir[$i]} ~/.config/${dir[$i]}
	echo "Directory ${dir[$i]} made succesfully."
done



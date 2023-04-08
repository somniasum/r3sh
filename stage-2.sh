#!/bin/bash
#
echo "Starting STAGE 2"
echo "...making directories"

mv dotfiles/* ~/.config/
mv .bashrc ~/.bashrc
#cd dotfiles

#dir=('i3' 'kitty' 'nvim' 'picom' 'polybar' 'rofi' 'wallpaper' 'ranger')

#for ((i=0; i<${#dir[@]}; i++))
#do
#	mkdir ~/.config/${dir[$i]}
#	mv ${dir[$i]} ~/.config/${dir[$i]}
#	echo "Directory ${dir[$i]} made succesfully."
#done



#!/bin/bash


#Installation of the important packages

echo "What is your username?"
read username
clear 
echo "Now running Stage 1"

#install yay
clear
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R $username yay-git
cd yay-git
clear
makepkg -si
clear
cd ~/
yay -Sy

packages=('pavucontrol' 'polybar' 'ttf-firacode-nerd')

for ((i=0;i<${#packages[@]};i++))
do
	yay -S ${packages[$i]}
done

#Ranger. A file manager
sudo pacman -S man ranger mpv neovim xwallpaper kitty starship feh

curl -o biker.jpg https://wallpapers.com/images/file/anime-minimalist-fj23wtiudgj1sgf2.jpg
mv biker.jpg ~/.config/wallpaper/


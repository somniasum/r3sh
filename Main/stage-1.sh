#!/bin/bash
#author: somniasum
#Stage 1 is the installtion process
#Installation of the important packages
clear
read -p "Enter your username: " username

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

#to install packages by using the aur manager

packages=('pavucontrol' 'polybar' 'ttf-firacode-nerd' 'brave-browser' 'ttf-cascadia-code' 'spotify' 'nvim-packer-git' 'brillo' 'tor-browser-bin' 'cava')


for ((i=0;i<${#packages[@]};i++))
do
	yay -S ${packages[$i]}
done

#All needed packags using pacman
sudo pacman -S man ranger mpv neovim xwallpaper kitty starship feh git bluez bluez-utils nodejs rust firefox qbittorrent fzf dunst rofi 




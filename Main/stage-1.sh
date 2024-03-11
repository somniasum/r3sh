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
<<<<<<< HEAD
packages=('pavucontrol' 'polybar' 'ttf-firacode-nerd' 'brave-browser' 'ttf-cascadia-code' 'spotify' 'nvim-packer-git' 'brillo' 'tor-browser-bin')
=======
packages=('pavucontrol' 'polybar' 'ttf-firacode-nerd' 'brave-browser' 'ttf-cascadia-code' 'spotify' 'nvim-packer-git')
>>>>>>> b23465ba039a90c782cf085f5f1e68d648972aa7

for ((i=0;i<${#packages[@]};i++))
do
	yay -S ${packages[$i]}
done

#All needed packags using pacman
sudo pacman -S man ranger mpv neovim xwallpaper kitty starship feh git bluez bluez-utils nodejs rust firefox starship qbittorrent fzf dunst




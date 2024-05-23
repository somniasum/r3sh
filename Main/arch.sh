#!/usr/bin/env bash 
set -euo
#author: somniasum
#Stage 1 is the installtion process
#Installation of the important packages

stage_1_arch(){

read -p "Enter your profile username: " username

#install yay the AUR helper
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R $username yay-git
cd yay-git
makepkg -si
cd ~/
yay -Sy

#to install packages by using the aur helper 

packages=('pavucontrol' 'polybar' 'ttf-firacode-nerd' 'brave-browser' 'ttf-cascadia-code' 'spotify' 'nvim-packer-git' 'brillo' 'tor-browser-bin' 'cava')


for ((i=0;i<${#packages[@]};i++))
do
	yay -S ${packages[$i]}
done

#All needed packags using pacman
sudo pacman -S man ranger mpv neovim xwallpaper kitty starship feh git bluez bluez-utils nodejs rust firefox qbittorrent fzf dunst rofi texlive-basic

}


#Stage 2: Arranging files 
stage_2_arch(){
#Moving configuration files
mv ../Dotfiles/.bashrc ~/.bashrc
rm README.md ; mv ../Dotfiles/* ~/.config/
mv .Xresources ~/

# to fix the dpi
xrdb -merge .Xresources
exec i3

#Making default apps
xdg-mime default zathura.desktop application/pdf

nvim -c "PackerSync"

}

stage_1_arch
stage_2_arch



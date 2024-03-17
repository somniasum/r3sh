#!/bin/bash 
#

#To set the sudo password
echo "[sudo] Enter password for $(whoami). To be used in sudo commands: "
read -s password
clear 

echo "Do not enter sudo password anymore. Just wait"

stage_1_fedora(){

	#To make dnf faster for installations
	echo"
	max_parallel_downloads=20
	fastestmirror=True
	" >> /etc/dnf/dnf.conf

	#This stores all sudo commands 
	high_commands=(

		#To enable third-party repositories
		"sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
		"sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
		"sudo dnf groupupdate core"
		"sudo dnf install fedora-workstation-repositories"

		#To install the needed packages for the rice
		"sudo dnf install kitty picom ranger rofi polybar mpv neovim dunst feh"
		"sudo dnf install ffmpeg --allowerasing"

		#To install multimedia drivers and video codecs
		"sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
		"sudo dnf install gstreamer1-libav gstreamer1-plugins-bad-free \
		gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-extras \
		gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-nonfree \
		gstreamer1-plugins-good gstreamer1-plugins-ugly lame-libs"
		"sudo dnf group upgrade --with-optional Multimedia"

		#To install other needed apps and tools"
		"sudo dnf install dnf-plugins-core"
		"sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo"
		"sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc"
		"sudo dnf install brave-browser"
	)

	#To go through each sudo command, automating the input of sudo using stored password
	for command in "${high_commands[@]}"; do
		echo "$password" | sudo -S $command
	done

	#Shell prompt installation 
	curl -sS https://starship.rs/install.sh | sh

	#Installing Packer to manage neovim plugins
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 	~/.local/share/nvim/site/pack/packer/start/packer.nvim


}

stage_2_fedora(){
	
	#File management
	#To set fonts
	echo "$password" | sudo -S cp -r ../Dotfiles/CascadiaCode /usr/share/fonts

	#Moving files to config
	cp -r ../Dotfiles/* ~/.config
	rm ~/.config/wallpaper/arch_wallpaper.sh

	#Copy the bash file to the main one currently in system
	cp .bashrc ~/.bashrc
	
	#Source the dpi to system
	mv .Xresources ~/
	xrdb -merge .Xresources 

	clear
	echo "Now ricing up neovim"
	read -p "Want to initialize plugins? [y / N]?" answer

	if [[ $answer == 'y' || $answer == 'Y' || $answer == 'yes' || $answer == 'Yes' ]]; then
		nvim -c "PackerSync"
	else
		clear
		sleep 3
		exit
	fi
}

stage_1_fedora
stage_2_fedora

#!/usr/bin/env bash 


#set access to root
sudo su

stage_1_fedora(){

	#To make dnf faster for installations
	echo"
	max_parallel_downloads=20
	fastestmirror=True
	" >> /etc/dnf/dnf.conf

	#This stores all sudo commands 
	high_commands=(

		
		#To install the needed packages for the rice
		"dnf install kitty picom ranger rofi polybar mpv neovim dunst feh nodejs xrandr mpd fish cava zathura zathura-pdf-mupdf latexmk evince python3-pip texlive -y"

		#To install multimedia drivers and video codecs
		"dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y"
		"dnf install gstreamer1-libav gstreamer1-plugins-bad-free \
		gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-extras \
		gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-nonfree \
		gstreamer1-plugins-good gstreamer1-plugins-ugly lame-libs -y"

		"flatpak install app/com.brave.Browser/x86_64/stable com.discordapp.Discord/x86_64/stable"

	)

	#To go through each sudo command, automating the input of sudo using stored password
	for command in "${high_commands[@]}"; do
		$command
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
	cp -r ../Dotfiles/CascadiaCode /usr/share/fonts

	#Moving files to config
	cp -r ../Dotfiles/* ~/.config/

	#Copy the bash file to the main one currently in system
	cp .bashrc ~/.bashrc
	
	#Source the dpi to system
	mv .Xresources ~/
	xrdb -merge .Xresources 

	clear
	chsh -s /usr/local/bin/fish
}

stage_1_fedora
stage_2_fedora

#!/usr/bin/env bash
#author: somniasum


#Fedora Installation 
fedora(){

	read -p "Enter password: " password

	sudo_commands(){

		for command in "${high_commands[@]}"; do
			echo "$password" | sudo -S $command
		done

	}


	stage_1_fedora(){

	
		#This stores all sudo commands 
		high_commands=(

		
			#To install the needed packages for the rice
			"dnf install kitty picom ranger rofi polybar mpv neovim dunst feh nodejs xrandr fish cava zathura zathura-pdf-mupdf latexmk evince python3-pip texlive-scheme-full flatpak xset -y"

			#To install multimedia drivers and video codecs
			"dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y"
			"dnf install gstreamer1-libav gstreamer1-plugins-bad-free \
			gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-extras \
			gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-nonfree \
			gstreamer1-plugins-good gstreamer1-plugins-ugly lame-libs -y"

			#Multimedia codecs
			"dnf install group Multimedia"

			#adding flatpak repos
			"flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo"


		)

		#Shell prompt installation 
		curl -sS https://starship.rs/install.sh | sh

		#Installing Packer to manage neovim plugins
		git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 		~/.local/share/nvim/site/pack/packer/start/packer.nvim

		#To call the sudo commnads 
		sudo_commands

	}

	stage_2_fedora(){

		high_commands(){
			#File management
			#To set fonts
			cp -r Dotfiles/fonts/* /usr/share/fonts

			#Moving files to config
			cp -r Dotfiles/* ~/.config/

			#Copy the bash file to the main one currently in system
			cp .bashrc ~/.bashrc
	
			#Source the dpi to system
			mv .Xresources ~/
			xrdb -merge .Xresources 

			clear
			chsh -s /usr/bin/fish
		}

		sudo_commands
	}

	stage_1_fedora
	stage_2_fedora
	
	nvim -c "PackerSync"

	export EDITOR=/usr/bin/nvim

}

#Arch Linux installation
arch(){
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
	cp Dotfiles/.bashrc ~/.bashrc
	cp -r Dotfiles/* ~/.config/
	cp .Xresources ~/

	# to fix the dpi
	xrdb -merge .Xresources
	exec i3


	nvim -c "PackerSync"

	}

	stage_1_arch
	stage_2_arch


}

#Automatically indentify the type of distro being used
os_name=$(grep "^ID" /etc/os-release | awk -F"=" '{print $2}')

if [ $os_name == 'fedora' ]; then
	fedora
elif [ $os_name == 'arch' ]; then
	arch
fi






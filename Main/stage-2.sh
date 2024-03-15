#!/bin/bash
#author: somniasum
#Stage 2: Arranging files 

#Moving configuration files
mv ../Dotfiles/.bashrc ~/.bashrc
rm README.md ; mv ../Dotfiles/* ~/.config/
mv .Xresources ~/

# to fix the dpi
xrdb -merge .Xresources
exec i3

#Making default apps
xdg-mime default zathura.desktop application/pdf



echo "To setup neovim just press 'Space + we' in Normal mode"


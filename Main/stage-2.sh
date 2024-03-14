#!/bin/bash
#author: somniasum
#Stage 2: Arranging files 


mv ../Dotfiles/.bashrc ~/.bashrc

#move everything else to the config directory
rm README.md ; mv ../Dotfiles/* ~/.config/

xrdb -merge .Xresources
exec i3


echo "To setup neovim just press 'Space + we' in Normal mode"


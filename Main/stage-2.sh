#!/bin/bash
#author: somniasum
#Stage 2: Arranging files 


mv ../Dotfiles/.bashrc ~/.bashrc

#move everything else to the config directory
rm README.md ; mv ../Dotfiles/* ~/.config/

curl -o ./biker.jpg https://wallpapers.com/images/file/anime-minimalist-fj23wtiudgj1sgf2.jpg
mkdir ~/.config/Wallpaper
mv ./biker.jpg ~/.config/Wallpaper

echo "To setup neovim just press 'Space + we' in Normal mode"


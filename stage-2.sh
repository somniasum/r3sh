#!/bin/bash
#author: somniasum
#Stage 2: Arranging files 


mv ./dotfiles/.bashrc ~/.bashrc

#move everything else to the config directory
rm README.md ; mv ./dotfiles/* ~/.config/

curl -o ./biker.jpg https://wallpapers.com/images/file/anime-minimalist-fj23wtiudgj1sgf2.jpg
mv ./biker.jpg ~/.config/wallpaper

echo "To setup neovim just press 'Space + we' in Normal mode"


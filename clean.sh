#!/bin/bash 


#remove unused packages (orphas) 
sudo pacman -Rs $(pacman -Qtdq)

#remove old and unsued packages
sudo rm -rf /var/cache/pacman/pkg/*


#clean the system logs 
sudo journalctl --rotate
sudo find /var/log -type f -exec bzip2 {} \;
sudo find /var/log -type f -name '*.bz2' -mtime +7 -delete

#clean the aur helper cache
rm -rf ~/.cache/yay

#clean home cache 
rm -rf ~/.cache/*



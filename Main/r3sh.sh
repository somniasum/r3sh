#!/bin/bash

#Automatically indentify the type of distro being used

os_name=$(grep "^ID" /etc/os-release | awk -F"=" '{print $2}')

if [ $os_name == 'fedora' ]; then
	./fedora.sh
elif [ $os_name == 'arch' ]; then
	./.arch.sh
fi






#!/usr/bin/env bash
#Author: somniasum
#Date modified: 05.04.25
#Description: A command to fetch a password from a file

password=$(grep "$1" "$2" 2>/dev/null | awk '{print $2}')
item=$1


#Function to print out 0 output 
pass(){
	echo "		
[*] Item: $item 
[*] Password: $password
[*] Copied to clipboard"

	echo "$password" | xsel --clipboard
}


#Check if there are two aurguements 
if [[ $# -lt 2 ]]; then
	echo "[-] Error: Use <item> <filename>"
	exit 1
fi

#Check if there is an input file that holds a password
if [[ ! -f "$2" ]]; then 
	echo "[-] Error: No $2 file found"
	exit 2 
fi

#Check if there is an input for the password field
if [[ -z "$password" ]]; then
	echo "[-] Error: No match for input { $1 }"
else
	pass
fi




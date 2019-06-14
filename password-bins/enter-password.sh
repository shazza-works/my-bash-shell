#!/bin/bash

# Simple Password Entry For Bash Sript.
secin='Q3liZXJsb3Jk'

while read -p "PASSWORD> " -r pass
do
	pass=$(echo -n "$pass" | base64)

	if [[ $secin == $pass ]]; then
		echo -e "\n\tFuck Yerr You IN!\n"
	elif [[ ! $secin == $pass ]]; then
		echo -e "Try Again...\n"
	else
		break
	fi
done

#!/bin/bash
# Simple Password Entry For Bash Sript.
#
# The Pass Is = 'Cyberlord'
#
#
secin='68204f721cfd93d1b04f9ffa898d205652a71b81'
while read -s -p "PASSWORD> " -r pass; do
	pass=$(echo -n "$pass" | sha1sum | awk {'print $1'})
	if [[ $secin == $pass ]]; then
		echo -e "\n\tFuck Yerr You IN!\n"
	elif [[ ! $secin == $pass ]]; then
		echo -e "Try Again...\n"
	else
		break
	fi
done

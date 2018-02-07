#!/data/data/com.termux/files/usr/bin/bash
#
# This is a simple Update and Clean Script
# Code By Shazza Works
# Email; ogormanad@googlemail.com
apt update
if [ $? = 0 ]; then
	echo
	apt upgrade -y ; apt upgrade -y --fix-broken ; apt update ; apt autoremove ; updatedb ; clear
	echo "  UPGRADE, UPDATE, UPDATEDB, AND AUOTOREMOVE <DONE>  "
	return 0
else
	echo
	echo "  SOMETHING SHIT!! HAPPENED!"
	echo "  YOUR TASKS WHERE NOT PERFORMED TRY AGAIN! "
	echo "  CHECK YOUR CONNECTION?  "
	return 1
fi

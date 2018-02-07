#!/data/data/com.termux/files/usr/bin/bash
#
# This is a simple Update and Clean Script
# Code By Shazza Works
# Email; ogormanad@googlemail.com
#------------------Right NOW run from ~/run.sh-----------------########
apt update
if [ $? = 0 ]; then
	echo
	apt upgrade -y ; apt upgrade -y --fix-broken ; apt update ; apt autoremove ; updatedb ; clear
	echo "  HOORAY YOUR ALL SORTED NOW  "
	return 0
else
	echo
	echo "  SOMETHING SHIT!!  HAPPENED!"
	echo "  YOUR UPDATE WAS NOT PERFORMED TRY AGAIN! "
	return 1
fi
#
#
#---ADD AS NEEDED---#

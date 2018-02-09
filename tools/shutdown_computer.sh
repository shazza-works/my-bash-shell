#!bin/bash
#########################################
# Code By Shazza Works			#
# Email; ogormanad@googlemail.com	#
#########################################
echo "My Name is Shazza"
sleep 5
clear
echo "I Am Now Going To Re-Start The Computer.........."
sleep 5 ;
pass=$(zenity --password);
echo $pass | sudo -S shutdown -P now

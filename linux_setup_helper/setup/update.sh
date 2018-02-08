#!/bin/bash
# Shazza Works
# This is a simple Update and Clean Script
echo -e "\e[33m"
echo <>
read -p "{Do You Want To Perform Full Update-Upgrade?[Y/N] }" -n 1 -r
echo <>
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo <>
	apt-get update -y
	if [ $? = 0 ]; then
		echo <>
		apt-get upgrade -y ;
		apt-get upgrade -y --fix-broken ;
		apt-get update -y ; apt-get autoremove ;
		updatedb ;
		echo <>
		echo "{<SYSTEM> UPGRADE,UPDATE,UPDATEDB,AUOTOREMOVE <DONE>}"
	else
		echo <>
		echo -e "{***SOMETHING SHIT HAPPENED - SYSTEM UPDATE UPGRADE NOT DONE***}" \n
		echo -e "{***ACTION WAS NOT PERFORMED BUT WILL CONTINUE WITH SETUP***}" \n
	fi
fi

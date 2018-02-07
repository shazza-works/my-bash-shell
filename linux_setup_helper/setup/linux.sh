#!/bin/bash
# Shazza Works
# Script for adding linux welcome for ssh
echo "<>"
echo "{SETTING UP LINUX RELATED TASKS NOW}"
if [ -e /etc/issue.net ]; then
	echo "<>"
	read -p "You Have A Welcome MSG Do You Want To See It Now?" -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		echo "********************************************************"
		cat /etc/issue.net
		echo "********************************************************"
		echo "<>"
	else
		echo "{You Have A Welcome MSG But...}"
		read -p "{Do You Want To Replace Current With App Copy?}" -n 1 -r
		echo
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			cat res/issue.net > /etc/issue.net
			echo "{WELCOME MESSAGE FILE <COPPIED> TO ETC}"
			echo "<>"
		else
			echo "{****DID NOT WRITE WELCOME MESSAGE****}"
			echo "<>"
		fi
	fi
else
	echo "{***NOTHING HAS BEEN DONE TO ISSUE.NET***}"
	echo "{***BEST GUESS YOUR NOT ON LINUX OS***}"

fi

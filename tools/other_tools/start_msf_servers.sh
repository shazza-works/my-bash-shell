#!/bin/bash
#########################################################################
# Code By Shazza Works							#
# Email; ogormanad@googlemail.com					#
# Simple talkting start servers script for MfS-Console.			#
# Espeak to be Installed. If NOT!					#
# Added Prompt for Start MSF.						#
#########################################################################
clear
if [ -x /usr/bin/espeak ]; then
espeak "What Would You Like To Do. Choose an option?" -s 140
	OPTIONS="Exit Start-All-Servers-msf Stop-All-Servers-msf"
	select opt in $OPTIONS; do
		if [ "$opt" == "Exit" ]; then
			clear
			espeak "Good bye....." -s 130
			echo "Good, Bye....."
			exit
		elif [ "$opt" == "Start-All-Servers-msf" ]; then
	                service postgresql start;
			echo "postgresql...............Service Started"
			espeak "post g.r.e. sql.............Service Started" -s 130
			service apache2 start;
			echo "apache2..................Service Started"
			espeak "apache2..................Service Started" -s 130
			espeak "Do You Want To Start M.S.F. Console...now?" -s 130
			read -p "Do You.....? [Y/N-y/n]"
			if [[ $REPLY =~ ^[Yy]$ ]]; then
				espeak "Starting.....M.S.F..... Please Wait." -s 130
				msfconsole
				echo "Press Enter...."
			else
				exit
			fi
		elif [ "$opt" == "Stop-All-Servers-msf" ]; then
			service postgresql stop;
			echo
			echo "Postgresql.............Stopped...!"
			service apache2 stop;
			echo
			echo "Apache2................Stopped...!"
			echo "ALL Servers.........KILLED"
			espeak "ALL Servers.........KILLED" -s 130
			exit
		else
			clear
			echo -e "!!---BAD SELECTION---!!\n!!---PRESS ENTER---!!"
		fi
	done
else
	echo "You Don't Have Espeak Installed....... Doing It Now..."
	echo "10...9...8...7...6...5...4...3..."
	sleep 10
	if [ $UID != 0 ]; then
		sudo apt install espeak -y
		source .servers.sh
	else
		apt install espeak -y
		source .servers.sh
	fi
fi

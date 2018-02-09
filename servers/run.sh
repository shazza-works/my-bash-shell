#!/bin/bash
#########################################################
# Code By Shazza Works					#
# Email; ogormanad@googlemail.com			#
# MAIN Menu for server start and tools app.		#
#########################################################
clear
if [ -x /usr/bin/espeak ]; then
espeak "What Would You Like To Do. Choose an option?" -s 130
OPTIONS="Exit Start-All-Servers-msf Stop-All-Servers-msf Start-Teamserver-Armatage Setup-SSH-Keys Clear-Bash-History"
select opt in $OPTIONS; do
	if [ "$opt" == "Exit" ]; then
		clear
		espeak "Bye bye....." -s 130
		exit
	elif [ "$opt" == "Start-All-Servers-msf" ]; then
		source serv4msf.sh;
	elif [ "$opt" == "Stop-All-Servers-msf" ]; then
		source serv-kill-msf.sh
	elif [ "$opt" == "Start-Teamserver-Armatage" ]; then
		source team4arm.sh
	elif [ "$opt" == "Setup-SSH-Keys" ]; then
		espeak "Generating RSA key pair." -s 130
		ssh-keygen -t rsa -b 4096
		if [ $? = 0 ]; then
			espeak "Keys..........CREATED" -s 130
		else
			espeak "Generating RSA pair..... Aborted." -s 130
		fi
	elif [ "$opt" == "Clear-Bash-History" ]; then
		echo 1 > ~/.bash_histor
		espeak "All. Bash. History.........KILLED" -s 130
	else
		clear
		echo -e "--- BAD SELECTION ---\n--- PRESS ENTER --- "
		espeak "BAD SELECTION PRESS ENTER" -s 130
	fi
done
else
	source vox-inst.sh
fi

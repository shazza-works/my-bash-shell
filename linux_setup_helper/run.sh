#!/bin/bash
#################################################
# Shazza Works.					#
# MAIN Menu for server start and tools app.	#
#################################################
echo -e "\e[33m"
clear
if [ -x /usr/bin/espeak ]; then
espeak "Please Choose an option?" -s 130
echo -e "\e[31m"
cat res/welcom2.txt
echo -e "\e[33m"
OPTIONS="Exit Start-All-Servers-msf Stop-All-Servers-msf Start-Teamserver-Armatage Setup-SSH-Keys Clear-Bash-History Youtube-DL New-Box"
select opt in $OPTIONS; do
	if [ "$opt" == "Exit" ]; then
		clear
		espeak "Bye bye....." -s 130
		exit
	elif [ "$opt" == "Start-All-Servers-msf" ]; then
		source setup/serv4msf.sh;
		echo -e "\e[33m"
	elif [ "$opt" == "Stop-All-Servers-msf" ]; then
		source setup/serv-kill-msf.sh
		echo -e "\e[33m"
	elif [ "$opt" == "Start-Teamserver-Armatage" ]; then
		source setup/team4arm.sh
		echo -e "\e[33m"
	elif [ "$opt" == "Setup-SSH-Keys" ]; then
		espeak "Generating RSA key pair." -s 130
		echo -e "\e[35m"
		ssh-keygen -t rsa -b 4096
		if [ $? = 0 ]; then
			espeak "Keys..........CREATED" -s 130
			echo -e "\e[31m"
			echo "Press Enter...."
			echo -e "\e[33m"
		else
			echo -e "Generating RSA pair..... \e[31mAborted!\e[33m"
			espeak "Generating RSA pair..... Aborted." -s 130
			echo -e "\e[31m"
			echo "Press Enter...."
			echo -e "\e[33m"
		fi
	elif [ "$opt" == "Clear-Bash-History" ]; then
		echo 1 > ~/.bash_histor
		espeak "All Bash History.........KILLED" -s 130
	elif [ "$opt" == "Youtube-DL" ]; then
		source setup/yt-download.sh
	elif [ "$opt" == "New-Box" ]; then
		source setup/new-box.sh
	else
		clear
		echo -e "--- BAD SELECTION ---\n--- PRESS ENTER --- "
		espeak "BAD SELECTION PRESS ENTER" -s 130
	fi
done
  else
	source setup/vox-inst.sh
fi
echo -e "\e[0m"

#!/bin/bash
# Shazza Works
# Menu for the New-Box add-on.
echo -e "\e[36m"
cat res/welcome.txt
echo -e "\e[33m"
OPTIONS="Exit System-Wide-Setup-With-Opts Information-About-Setup"
select opt in $OPTIONS; do
	if [ "$opt" == "Exit" ]; then
		clear
		source run.sh
	elif [ "$opt" == "System-Wide-Setup-With-Opts" ]; then
		source setup/list.sh
	elif [ "$opt" == "Information-About-Setup" ]; then
		source doc/info.sh
	else
		clear
		echo -e "!!---BAD SELECTION---!!\n!!---PRESS ENTER---!!"
	fi
done
echo -e "\e[33m"

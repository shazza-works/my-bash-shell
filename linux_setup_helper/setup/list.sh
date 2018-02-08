#!/bin/bash
# Shazza Works
# Install the full list of apps for the shell if you have NET CON.
#echo -e "{UPDATE.SH OFFLINE ATM SO NO NEW UPDATES OR UPGRADE!!}" \n
echo "<>"
read -p "{CHECK NET CONNECTION AND PERFORM UPDATE TASKS [Y/N]}" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	ping -c 1 8.8.8.8
		if [ $? -lt 1 ]; then
			source setup/update.sh
		else
			echo "<>"
			echo "***{UPDATE-ERROR-NO-NET CONNECTION}***"
			echo "***{CONNECT TO NETWORK AND TRY AGAIN}***"
			echo "<>"
		fi
fi
echo "<>"
read -p "{Do You Want To Install ALL Apps? [Y/N] }" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "<>"
	source setup/get-dpkg.sh
	source setup/ins-apps.sh
	cp logs/ins-apps.sh > logs/log-listofapps.txt
	echo "{MADE LOG OF APPS IN SETUP LOGS HOME}"
	echo "{FULL FUCKING INSTALL DONE BITCH!!}"
	echo "<>"
else
	echo "***{YOU HAVE NOT DONE FULL-APP INSTALL!}***"
	echo "<>"
fi
echo "<>"
read -p "{Do You Want To Perform Mk-File Tree Program On Home? [Y/N] }" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	source setup/mk-files.sh
else
	echo "***{MAKE DIR TREE IN HOME NOT DONE***}"
	echo "<>"
fi
echo "<>"
read -p "{Do You Want To Perform SSH Tasks On System ? [Y/N] }" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	source setup/ssh-set.sh
else
	echo "{***SSH TASKS NOT PERFORMED ON SYSTEM***}"
	echo "<>"
fi
echo "<>"
read -p "Are You Using Termux Shell ATM ? [Y/N] }" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	source setup/am-termux.sh
	echo "{STORAGE SETUP FOR TERMUX IS <DONE> }"
	echo "<>"
else
	echo "***{YOU ARE NOT ON TERMUX SHELL EXT-STORAGE NOT SETUP!}"
	echo "<>"
	#NEW FUNC HERE
fi
echo "<>"
read -p "{Are You Using Linux OS And Shell?}" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	source setup/linux.sh
	echo "<>"
else
	echo "{***YOU ARE NOT USING LINUX OS OR SHELL!***}"
	echo "<>"
fi
echo -e "\e[31m"
echo "Press Enter...."
echo -e "\e[33m"

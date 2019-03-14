#!/data/data/com.termux/files/usr/bin/env bash   #SET TO EXPORT ALL
##################################################################
# Shazza-Works 9/02/18                                           #
# Stript to setup start postgresql on Termix.               V2   #
##################################################################
export home=$HOME		  # Set home
export PGDATA=$home/database	  # Set postgress working dir
def_db=$home/database		  # db-files
name=`whoami` 			  # Me!
clear ; ls			  # Clear + List dir
# Maybe you want to set your own?
function check_files {
	if [ ! -d "$def_db" ]; then
		echo -e "\n"
		cf='888'
	else
		cf='0'
	fi
}

function create_new {
	read -p "You Will Need To Make Files? [Y/y]" -n 1 -r create
	if [[ $create =~ ^[Yy]$ ]]; then
		mkdir $home/database
		echo -e "\n DB Made @"$def_db" \n"
	else
		echo -e "\n Files --Left--"
		echo -e "\n Going to Exit\n"
		exit
	fi
}

function wipe_old {
	echo -e "\n"
	read -p " Clear home/DB! SURE? [Y/N] " -n 1 -r damsure
	echo -e "\n"
	if [[ $damsure =~ ^[Yy]$ ]]; then
		echo -e "\n Will Wipe Old Db_Files... \n"
		sleep 2
		rm -rf $home/database/*
		echo -e "\n File's Cleaned \n"
	fi
}

function start_server {
	initdb /$def_db ; wait
	pg_ctl -D /$def_db -l $def_db/db_logfile start ; wait
	echo -e "\n The Server Info..."
}

function stop_server {
	pg_ctl -D $def_db'/' -m fast stop ; wait
}

check_files
if [[ $cf -eq '888' ]]; then
	create_new ; wait
elif [[ $cf -eq '0' ]]; then
	wipe_old ; wait
fi
start_server ; wait

while true; do
	read -p  "When you are ready... [Qq]=Kill-Server [Xx]=Quit-Exit> " -n 1 -r quitty
	if [[ $quitty =~ ^[Xx]$ ]]; then
		echo -e "\n You Are Quitting With Db Running...\n "
		echo -e " You Can Stop With [pg_ctl -m fast stop]\n"
		break
	elif [[ $quitty =~ ^[Qq]$ ]]; then
		stop_server ; wait
		break
	fi

done
echo -e "\n\n\n\n\tTHANK-YOU FOR USING A SHAZZA TOOL...\n\n\n\n"
exit

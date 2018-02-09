#!/data/data/com.termux/files/usr/bin/env bash   #SET TO EXPORT ALL
##################################################################
# Shazza-Works 9/02/18                                           #
# Stript to setup start postgresql on Termix.                    #
##################################################################
export home=$HOME		  # Set home
export PGDATA=$home/database	  # Set postgress working dir
def_db=$home/database		  # db-files
name=`whoami` 			  # Me!
clear ; ls			  # Clear + List dir
# Maybe you want to set your own?
while true; do
	if [ ! -d "$def_db" ]; then
		echo -e "\n"
		read -p "You Will Need To Make Files? [Y/y]" -n 1 -r create
		echo -e "\n"
		if [[ $create =~ ^[Yy]$ ]]; then
			mkdir $home/database
			echo -e "\n DB Made @"$def_db" \n"
		fi
	else
		echo -e "\n One Already There, Will Clean!\n "
		echo -e "\n"
		read -p " Clear home/DB! SURE? [Y/N] " -n 1 -r damsure
		echo -e "\n"
		if [[ $damsure =~ ^[Yy]$ ]]; then
			echo -e "\n Will Wipe Old Db_Files... \n"
			sleep 5
			rm -rf $home/database/*
			echo -e "\n File's Cleaned \n"
			initdb /$def_db ; wait
			echo -e "\n Please Wait 5 Sec...\n " ; sleep 5
			pg_ctl -D /$def_db -l $def_db/db_logfile start ; wait
			echo -e "\n The Server Info..."
			grep "address" $home'/database/db_logfile' | grep "port"
 			echo -e $name"@address:port \n"
			break
		else
			break
		fi
	fi
done
#----------------------shutdown the service---------------------#
while true; do
	echo -e "\n"
	read -p  "When you are ready... [Qq]=Kill [Xx]=Quit" -n 1 -r quitty
	echo -e "\n"
	if [[ $quitty =~ ^[Qq]$ ]]; then
		pg_ctl -m fast stop		# No Cleanup As May Need Files.
		wait				# And Will Reset Next Time.
		break
	elif [[ $quitty =~ ^[Xx]$ ]]; then
		echo -e "\n You Are Quitting With Db Running...\n "
		echo -e " You Can Stop With [pg_ctl -m fast stop] "
		break
	fi
done
clear ; # Clear
# Print Hoyahh
echo -e "\n\n\n\n\tTHANK-YOU FOR USING A SHAZZA TOOL...\n\n\n\n"

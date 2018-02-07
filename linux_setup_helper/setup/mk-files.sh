##  setup home dir structure make logs and setup .bashrc and .welcome files and so on.
source res/files.lst #MAKE A LIST OF USED FILES IN HOME IF NOT THERE!
#
echo "Enter Usfull Commands Here...." > logs/COMMANDS
echo "<>"
if [ -e ~/.bash_profile ]; then
	echo "{BASH_PROFILE FILE ALREADY IN LOCATION!!}"
	echo "{<COPY> TO SETUP-LOGS HOME}"
	cat ~/.bash_profile > logs/bash-prof-`date +%A-%B-%Y-%T`
	echo "<>"

else
	echo "{***BASH_PROFILE NEEDS COPPYING!!***}"
	echo "<>"

fi
if  [ -e ~/.bashrc ]; then
	echo "{BASH-RC FILE ALREADY IN LOCATION}"
	echo "{<COPY> TO SETUP-LOGS HOME}"
	cat ~/.bashrc > logs/bash-rc-`date +%A-%B-%Y-%T`
	echo "<>"
else
	echo "{***BASH-RC NEEDS COPYING!!***}"
	echo "<>"
fi
echo "<>"
read -p "{READ ABOVE AND SEE IF, You Want To Overwrite BASH-RC? [Y/N] }" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	cat res/bash-profile-17 > ~/.bash_profile
	echo "{<COPPIED>  BASH_PROFILE TO SYSTEM}"
	echo "{ALL SAVED BACKUPS IN  ~/setup-logs/}"
	echo "<>"
else
	echo "{***BASH_PROFILE <NOT> COPPIED TO SYSTEM***}"
fi
echo "<>"
read -p "{READ ABOVE TO SEE IF YOU, Want To Overwrite BASH-PROFILE? [Y/N] }" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	cat res/bash-rc-17 > ~/.bashrc
	echo "{<COPPIED> BASH-RC TO SYSTEM}"
	echo "{ALL SAVED BACKUPS IN  ~/setup-logs/}"
	echo "<>"
else
	echo "{***BASH-RC <NOT> COPPIED TO SYSTEM***}"
fi

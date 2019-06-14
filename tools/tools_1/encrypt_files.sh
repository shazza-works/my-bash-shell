#!/bin/bash
# Shazza-Works V1
# Wrap to encrypt files in the working directory with mcrypt.
#
# Need to add test for .nc file names and error for not enc file!!  Done=[x]
#
if [ ! -e /usr/bin/mcrypt ]; then
	sudo apt install mcrypt --yes
fi

select infile in 'EXIT' $(dir); do
	if [[ $infile == "EXIT" ]]; then
		exit
	fi
	echo $infile
	select task in 'EXIT' 'ENCRYPT' 'DE-ENCRYPT'; do
		if [[ $task == "EXIT" ]]; then
			exit
		fi

		if [[ $task ==  "ENCRYPT" ]]; then
			mcrypt $infile ; rm $infile
			echo -e "\tIn_File Cleaned...\n"
			exit
		fi

		if [[ $task ==  "DE-ENCRYPT" ]]; then
			mcrypt -d $infile ; rm $infile
			echo -e "\tIn_File Cleaned...\n"
			exit

		fi

	done
done

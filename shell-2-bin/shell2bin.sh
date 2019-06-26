#!/bin/bash
#########################################################################################
# V1.00											#
# Shazza-Works										#
# 											#
#	Use 'shc' to make executable of all files in $PWD				#
#											#
#########################################################################################
#
# add a chech and if only one file going in put in pwd and not out dir would be handy!
#

if [ ! -e /usr/bin/shc ]; then
	sudo apt-get install shc --yes
else
	clear
fi

echo -e "\nRunning..."

function binallfiles {
	#if [ ! -d out ]; then
		# mkdir out	## OFF ATM
		#do you want to remove old files?
		for infile in `dir -1`; do
			if [[ ${infile: -3} == ".sh" ]]; then
				outfile=${infile:: -3}
				shc -r -U -f $infile -o $outfile  #out/$outfile removed
				echo -e "\t$infile >>> Packed"
			else
				echo -n ""
			fi
		done
		#echo ""
	#else
		#echo "Can't overwrite Files.. Del __out__"
	#fi
	echo -e "\n>>> All_Done"
}

#================================================================
function cleanup {
	# if [ $(dir -1 out/ | grep . -c) == 0 ]; then		##Off as want in PWD atm!
	#	rm -rf out
	#fi
	for x in `dir -1`; do
		if [[ ${x: -4} == ".x.c" ]] && [ -f $x ]; then
			rm $x
		fi
	done
}

#### MAIN ####
binallfiles
cleanup

#
#
#


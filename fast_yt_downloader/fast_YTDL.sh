#!/bin/bash											
# V5.01
# Code By Shazza Works
# Email; ogormanad@googlemail.com
#
# Script to make fast use of youtube-dl by Making a list to enter urls for Download...
# if any of the Vids ERROR out and your not around this script will auto remove the url
# that caused the problem and try to GET the rest of the url list.
#
# Need to add file remover for the left over .part files that had errors
# and have been getting left in the folder. keep for V4.0
#
clear
echo "Past Your URL's Below" > url-888 && nano url-888
ec=$?
count=`cat url-888 | sed '/^\s*$/d' | wc -l`
until [[ $count -eq 0 ]]; do
	echo
	echo "<...................................THE COUNT IS.......>"$count
	echo
ping -c 3 8.8.8.8
        if [[ $ec -eq 0 ]]; then
		echo "Downloading Item/s..."
                sleep 2
                youtube-dl `head -n 1 url-888`
                tail -n +2 url-888 > 445-656-678
		cat 445-656-678 | sort |uniq > url-888
		count=`cat url-888 | sed '/^\s*$/d' | wc -l`
        fi
ce=$?
	if [[ $ce -eq 1 ]]; then
		echo "You Have NO NET CONNECTION!!!"
	fi
done
rm -rf url-888 445-656-678 *.part
echo
echo
echo
echo
# Non-inverted colour
echo -e "\e[31mCleanup.................DONE..."
echo -e "DOWNLOADING............ \e[32mDONE..."

#!/bin/bash
#								V5.01
# Code By Shazza Works
# Email; ogormanad@googlemail.com
#
# Script to make fast use of youtube-dl by Making a list to enter urls for Download...
# if any of the Vids ERROR out and your not around this script will auto remove the url
# that caused the problem and try to GET the rest of the url list.
#
echo -e "\e[33m"
clear
echo "Past Your URL's Below" > logs/url-888 && nano logs/url-888
count=`cat logs/url-888 | sed '/^\s*$/d' | wc -l`
ping -c 3 8.8.8.8
exc=$?
if [[ $exc -eq 0 ]]; then
	while [[ $count -gt 0 ]]; do
		echo
		espeak "THE COUNT IS.............$count" -s 130
		echo "<...................................THE COUNT IS.......>"$count
		echo
		echo "Downloading Item/s..."
		espeak "Downloading......Video's" -s 130
		sleep 2
		youtube-dl `head -n 1 logs/url-888`
		if [[ $? -lt 1 ]]; then
			tail -n +2 logs/url-888 > logs/445-656-678
			cat logs/445-656-678 | sort |uniq > logs/url-888
			count=`cat logs/url-888 | sed '/^\s*$/d' | wc -l`
			echo -e "\e[31mCleanup.................DONE..."
			echo -e "DOWNLOADING............ \e[32mDONE...\e[33m"
			rm -rf logs/url-888 logs/445-656-678 logs/*.part
		else
			echo
			echo "Download/s Failed"
			espeak "Downloads Failed" -s 130
			break
		fi
	done
else

	echo -e "You Have \e[31mNO NET CONNECTION!!!\e[33m"
	espeak "You Have NO NET CONNECTION!" -s 130
fi
echo -e "\e[31m"
echo "Press Enter...."
echo -e "\e[33m"

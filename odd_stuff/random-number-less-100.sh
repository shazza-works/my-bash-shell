#!/bin/bash
# Code By Shazza Works
# Email; ogormanad@googlemail.com
# Random number-gen with options
# Will show '+' when over 100 and 'Hit' when under
while true
do
ran=$RANDOM
 if [ $ran -gt 100 ]; then
	printf "\+/"
	# break 2 	## Break out of while and for loops
 elif [ $ran -lt 100 ]; then
	printf "\HIT/"\($ran\)
	echo
	echo "<HIT @  [[$ran]]"
	break		## Break out of just while loop
	break
 fi
done

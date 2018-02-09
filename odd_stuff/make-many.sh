#!/bin/bash
#################################################
# Code By Shazza Works				#
# Email; ogormanad@googlemail.com		#
#################################################
number=1
while [ "$number" -lt 20 ]
do
cat "$number" > "$number"
((number +=1))
done
echo
echo "Finished"

#!/usr/bin/bash
#######################################################
# Code By Shazza Works				      #
# Email; ogormanad@googlemail.com		      #
# This script gives information about a file.	      #
#######################################################
FILENAME="$1"
echo "Properties for $FILENAME:"
if [ -f $FILENAME ]; then
   echo "Size is $(ls -lh $FILENAME | awk '{ print $5 }')"
   echo "Type is $(file $FILENAME | cut -d":" -f2 -)"
   echo "Inode number is $(ls -i $FILENAME | cut -d" " -f1 -)"
   echo -e "$(df -h $FILENAME | grep -v Mounted | awk '{ print "On",$1", \n which is mounted as the",$6,"partition."}')"
else
   echo "File does not exist."
fi

#!/bin/bash
# make a random file about 1Gb in size.
setsize=8388608
file=list
if [ ! -f list ]; then
    touch list
fi
	cat /dev/urandom | dd iflag=fullblock count=$setsize | pv > $file
echo
echo "Your File Name>> "$file
echo "$file Size Is>> "$(du -h list | awk '{print $1}')

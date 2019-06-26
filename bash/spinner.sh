#!/bin/bash
i=1
sp="/ ¬ \ |"
echo -n ' '
while true; do
	printf "\b${sp:i++%${#sp}:1}"
	sleep 0.24
done


#NEW

#i=1
#sp="/-\|"
#echo -n ' '
#while true
#do
#    printf "\b${sp:i++%${#sp}:1}"
#done


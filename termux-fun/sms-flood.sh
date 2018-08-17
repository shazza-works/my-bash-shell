#!/bin/bash
# shazza-works V3.0
# script to loop send sms to number,numbers,n,n,n...
# add a number read opt [done]
# add a hold time for sleep [done]
# fix a contact jq call using name and menu select for return [done]
function flood_number() {
read -p "Search Contacts For A Number? [y/n]" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
	read -p "Enter Name Search> " auto
	IFS=$'\n'
	select name in `termux-contact-list | jq '.[] | .name' | grep -i $auto`; do
		number=`termux-contact-list | jq '.[] | select(.name == '$name') | .number '`
		num=`echo $number | awk '{ print $1 }'`
		break
	done
	echo ""
	read -p "Please Type A Msg To Flood With> " msg
	read -p "How Many Msg's To Send> " count
	read -p "Set Sleep Time> " sleep
	while [ $count -gt 0 ]; do
		termux-sms-send -n $num $msg
		echo -e "\e[32mFlooding-->\e[34m" $num "\e[32m<--with-->>\e[34m"$msg"\e[39m"
		sleep $sleep
		count=`expr $count - 1`
	done
	echo -e "\n\e[31mMission Completed Boss!!\n\e[0m"
else
	read -p "Enter Mobile Number To Flood> " number
	read -p "Please Type A Msg To Flood With> " msg
	read -p "How Many Msg's To Send> " count
	read -p "Set Sleep Time> " sleep
	while [ $count -gt 0 ]; do
	        termux-sms-send -n $number $msg
	        echo -e "\e[32mFlooding-->\e[34m" $number "\e[32m<--with-->>\e[34m"$msg"\e[39m"
	        sleep $sleep
	        count=`expr $count - 1`
	done
	echo ""
	echo -e "\n\e[31mMission Completed Boss!!\n\e[0m"
fi
}

flood_number

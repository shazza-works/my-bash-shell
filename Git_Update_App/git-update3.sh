#!/bin/bash
##################################################################################
# Shazza-Works						V3.0			 #
# Update Script To Push My Git Files						 #
# NB...										 #
# To use just move to the ROOT dir with Gits and run..      <Last_Edit_10/6/19>  #
##################################################################################
# add mkdir for home Git if not there
	#ask user to name new one??							[N]
	# if git not there mk new git and init						[N]
	# NB. will need to change (select string) (push sting) with preset var's	[Y]done
#NEED TO ADD ASK USER FOR USERNAME OF ACT.....!!!! YOU NEED TO CHANGE			[Y]done
# ONLY TIME WON'T WORK IS IS YOU HAVE NOT SET; $ git config --global user.email "Da_Shazza"
# and the $ git config --global user.name "Shazza-Works"
#
# <<Want to add option for add and remove new and old gits etc>>
#
echo ""
echo -e "\e[91m ____ _ ___          ___  ___  ____ ___ ____     "
echo -e "\e[91m | __ |  |  __  |  | |__] |  \ |__|  |  |___     "
echo -e "\e[91m |__] |  |      |__| |    |__/ |  |  |  |___ V3.0"
echo -e "							"
echo -e "\e[92m                  Shazza-Works...🐂🐂	  \e[39m"
echo ""

sleep 3
home=$HOME
pwd="$PWD/"
proto="SSH HTTPS EXIT"
clear
echo -e "\n\n"
read -p "What is your GitHub UserName ❓> " -r username
echo -e "\n"
select answ in $proto; do
if [ $answ == "HTTPS" ]; then
	echo "PWD IS $PWD"
	printf "\n Which Git Are You Updating ❓> "
	select file in $pwd/*; do
	test -n "$file" && break ; echo "> ⛔ Invalid Selection ⛔ <";
	done
	echo "$file" "TEST" ; sleep 5
	github=$(basename "$file")
	read -p "What Branch Do You Want To Use [Def=master] ❓> " -r branch
	echo -e "\n Branch $branch Selected...✅\n"
	git --git-dir=$file/.git --work-tree=$file/ status; sleep 3
	git --git-dir=$file/.git --work-tree=$file/ add . ; git --git-dir=$file/.git --work-tree=$file/ commit -m "Updated_On_$(date)"
	wait; git --git-dir=$file/.git --work-tree=$file/ push https://github.com/$username/$github $branch
	if [[ $? = 0 ]]; then
		echo -e "\n All Tasks Done + Uploaded ✅✅✅\n"
		echo -e "\n\n\n\n\t <Thanks For Using>\n"
	else
		echo -e "\n\n\t ❌❌❌__SOMETHING SHIT HAPPENED READ ABOVE__❌❌❌ \n"
	fi
elif [ $answ == "SSH" ]; then
	echo -e "SSH key's will be added to the agent or made!"
	if [ -e "$home/.ssh/id_rsa" ]; then
		echo -e "Key Found ✅\n"
	else
		echo -e "\n\t⛏⛏⛏ YOU NEED TO COPY YOUR SSH.PUB KEY TO SETTINGS ON GITHUB ⛏⛏⛏\n"
		sleep 4
		ssh-keygen -t rsa -b 4096
		eval `ssh-agent -s` ; ssh-add
	fi
	echo "PWD IS $PWD"
	printf "\n What Git Are You Updating ❓\n"
	select file in $pwd/* ; do
		test -n "$file" && break ; echo "> ⛔ Invalid Selection ⛔ <";
	done
	github=$(basename "$file")
	read -p "What Branch Do You Want To Use [Def=master]> " -r branch
	echo -e "\n Branch $branch Selected...✅\n"
	git --git-dir=$file/.git --work-tree=$file/ status; sleep 3
	git --git-dir=$file/.git --work-tree=$file/ add . ; git --git-dir=$file/.git --work-tree=$file/ commit -m "Changed_On_$(date)"
	wait; git --git-dir=$file/.git --work-tree=$file/ push ssh://git@github.com/$username/$github $branch
	if [[ $? -eq 0 ]]; then
		eval `ssh-agent -k`
		echo -e "\n All Tasks Done + Uploaded ✅✅✅\n"
		echo -e "\n\n\n\n\t <Thanks For Using>\n"
	else
		echo -e "\n\n\t ❌❌❌__SOMETHING SHIT HAPPENED READ ABOVE__❌❌❌ \n"
	fi
elif [ $answ == "EXIT" ]; then
	break && exit
else
		echo -e "\nPlease Try Again...❗\n"
fi
done

#!/data/data/com.termux/files/usr/bin/env bash
##################################################################################
# Shazza-Works						V3.0			 #
# Update Script To Push My Git Files						 #
# NB...										 #
# To use just move to the ROOT dir with Gits and run.. enjoy                     #
##################################################################################
# add mkdir for home Git if not there
	#ask user to name new one??							[N]
	# if git not there mk new git and init						[N]
	# NB. will need to change (select string) (push sting) with preset var's	[Y]done
#NEED TO ADD ASK USER FOR USERNAME OF ACT.....!!!! YOU NEED TO CHANGE			[Y]done
echo ""
echo -e "\e[91m ____ _ ___          ___  ___  ____ ___ ____     "
echo -e "\e[91m | __ |  |  __  |  | |__] |  \ |__|  |  |___     "
echo -e "\e[91m |__] |  |      |__| |    |__/ |  |  |  |___ V3.0"
echo -e "\e[92m                   Shazza-Works... \e[39m"
echo ""
sleep 3

pwd="$PWD/"
proto="SSH HTTPS EXIT"
clear
select answ in $proto; do
if [ $answ == "HTTPS" ]; then
	echo "PWD IS $PWD"
	read -p "What is your GitHub UserName> " -r username
	printf "\n What Git Are You Updating? \n"
	select file in $pwd/*; do
	test -n "$file" && break ; echo ">>> Invalid Selection";
	done
	github=$(basename "$file")
	read -p "What Branch Do You Want To Use [Def=master]> " -r branch
	echo -e "\n Branch $branch Selected... \n"
	git --git-dir=$file/.git --work-tree=$file/ status; sleep 2
	git --git-dir=$file/.git --work-tree=$file/ add . ; git --git-dir=$file/.git --work-tree=$file/ commit -m "Changed_On_$(date)"
	wait; git --git-dir=$file/.git --work-tree=$file/ push https://github.com/$username/$github $branch
	if [[ $? = 0 ]]; then
		echo -e "\n All Tasks Done + Uploaded \n"
		echo -e "\n\n\n\n\t <<<Thanks For Using Another Shazza Tool>>> \n"
		break
	else
		echo -e " SOMETHING SHIT HAPPENED READ ABOVE ^^^ "
	fi
elif [ $answ == "SSH" ]; then
	read -p "What is your GitHub UserName> " -r username
	echo -e "SSH key's will be added to the agent or made!"
	if [ -f "$home/.ssh/id_rsa" ];then
		eval `ssh-agent -s` ; ssh-add
	else
		echo "temp note key-make"
		ssh-keygen -t rsa -b 4096
		eval `ssh-agent -s` ; ssh-add
	fi
	echo "PWD IS $PWD"
	printf "\n What Git Are You Updating? \n"
	select file in $pwd/* ; do
		test -n "$file" && break ; echo ">>> Invalid Selection";
	done
	github=$(basename "$file")
	read -p "What Branch Do You Want To Use [Def=master]> " -r branch
	echo -e "\n Branch $branch Selected... \n"
	git --git-dir=$file/.git --work-tree=$file/ status; sleep 3
	git --git-dir=$file/.git --work-tree=$file/ add . ; git --git-dir=$file/.git --work-tree=$file/ commit -m "Changed_On_$(date)"
	wait; git --git-dir=$file/.git --work-tree=$file/ push ssh://git@github.com/$username/$github $branch
	if [[ $? -eq 0 ]]; then
		eval `ssh-agent -k`
		echo -e "\n All Tasks Done + Uploaded \n"
		echo -e "\n\n\n\n\t <<<Thanks For Using Another Shazza Tool>>> \n"
		break
	else
		echo -e " SOMETHING SHIT HAPPENED READ ABOVE ^^^ "
	fi
elif [ $answ == "EXIT" ]; then
	break && exit
else
		echo -e "\nPlease Try Again...\n"
fi
done

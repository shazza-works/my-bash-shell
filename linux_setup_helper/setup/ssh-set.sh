#!/bin/bash
# Shazza Works
# SSH key setup make key pair. will remove duplicate opt
echo "<>"
read -p "{DO YOU WANT TO MAKE SSH KEY-SET [Y/N] }" -n 1 -r
echo "<>"
if [[ $REPLY =~ ^[Yy]$ ]]; then
	ssh-keygen -t rsa -b 5000
fi
if [ -e ~/.ssh/authorized_keys ]; then
	echo "<>"
	cat ~/.ssh/authorized_keys > logs/auth-keys-`date +%A-%B-%Y-%T`
	echo "{KEY-FILE LOG AT ~/stup-logs/auth-keys+<DATE> }"
	echo "{KEYFILE COPIED TO SETUP-LOG}"
fi
echo "<>"
read -p "{Do You Want To OVER-WRITE With Program Version Of Authorized_Keys [Y/N]}" -n 1 -r
echo "<>"
if [[ $REPLY =~ ^[Yy]$ ]] ; then
	echo "<>"
	cat res/keyfile >> ~/.ssh/authorized_keys
	echo "{Copy Key File To Home SSH}"
	echo "{Authorized_Keys File Now In home/.ssh/ }"
fi

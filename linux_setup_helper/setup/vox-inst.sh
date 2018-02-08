#!/bin/bash
# Shazza Works
# Script to install Espaek on the system if it is not already
echo "You Don't Have Espeak Installed....... Doing It Now..."
echo "10...9...8...7...6...5...4...3..."
sleep 10
if [ $UID != 0 ]; then
	sudo apt install espeak -y
	source /run.sh
else
	apt install espeak -y
	source /run.sh
fi

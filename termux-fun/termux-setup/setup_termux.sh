#!/bin/bash
# Tool to set up Termux for first use.
# Shazza-Works
# 15/March/2019
clear
echo -e "\nThis tool will setup some of the more handny tools on termux. \nPlus setup the storage..\n"
echo "starting in 5 Sec... "; sleep 10
pkg update --yes ; pkg install --yes termux-api tree python* python-dev perl fish jq dnsutils termux-tools mlocate nmap nano git curl lynx wget file screenfetch
pkg update
termux-setup-storage
echo -e "alias cl='clear'\n" > $HOME/.bash_profile
echo -e "\n YOU CAN NOW CLEAR WITH CL [CHECK .BASH_PROFILE]\n"
echo -e "screenfetch\n" >> $HOME/.bash_profile
echo -e "Removing (Nasty) MotD msg\n"
echo '' > /data/data/com.termux/files/usr/etc/motd
echo -e "\n\nYou need to Re-Start your termux with Ctl-D \n"
echo -e "\n\nSetting Python PATH for termux"
echo "export /data/data/com.termux/files/usr/lib/python2.7/site-packages/:/data/data/com.termux/files/usr/lib/python3.7/site-packages/" >> $HOME/.bash_profile
sleep 3
exit
#
#
#
# Need To Add A Lot More
#
#

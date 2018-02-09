#!/bin/bash
#########################################################
# Shazza-Works						#
# Update Script To Push My Git Files			#
########################################################
export home=$HOME
export bash=$BASH
export gits='$HOME/GIT-HUB/'
clear
ls
read -p "What Git Are You Updating; " -r thegit
ls ../
read -p "What Branch Do You Want To Use [Def=master]; " -r branch
echo -e "\n $branch Selected... \n"
git status ; sleep 2
git add . ; wait
git commit -m "Update-$(date)"
git push https://github.com/shazza-works/$thegit $branch ; wait
git status
echo -e "\n All Tasks Done + Uploaded \n"

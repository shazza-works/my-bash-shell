#!/bin/bash
#########################################################
# Shazza-Works						#
# Update Script To Push My Git Files			#
########################################################
export home=$HOME
clear
ls $home/GIT-HUB/
read -p "What Git Are You Updating; " -r thegit
read -p "What Branch Do You Want To Use [Def=master]; " -r branch
git status ; sleep 2
git add . ; wait
git commit -m "My-New-Update-$(date)"
git push https://github.com/shazza-works/$thegit $branch ; wait
git status
echo -e "\n All Tasks Done + Uploaded \n"

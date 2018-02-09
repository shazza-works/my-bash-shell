#!/bin/bash
#########################################################
# Shazza-Works						#
# Update Script To Push My Git Files			#
########################################################
export home="$HOME"
export bash="$BASH"
export gits="$home/GIT-HUB"
clear
ls "$gits/"
read -p "What Git Are You Updating; " -r thegit
read -p "What Branch Do You Want To Use [Def=master]; " -r branch
echo -e "\n $branch Selected... \n"
git status ; sleep 3
wait ; git add .
wait ; git commit -m "Update-$(date)"
wait ; git push https://github.com/shazza-works/$thegit $branch
git status
echo -e "\n All Tasks Done + Uploaded \n"

#!/bin/bash
#########################################################
# Shazza-Works						#
# Update Script To Push My Git Files			#
########################################################
export home="$HOME"
export bash="$BASH"
export gits="£$home/GIT-HUB/"
clear
#=======================================================#
printf "\n What Git Are You Updating? \n"
ls .
select gitname in $gits/* ; do
test -n "$gitname" && break; echo ">>> Invalid Selection";
done
#=======================================================#
read -p "What Branch Do You Want To Use [Def=master]; " -r branch
echo -e "\n $branch Selected... \n"
git status ; sleep 3
wait ; git add .
wait ; git commit -m "Update-$(date)"
wait ; git push https://github.com/shazza-works/$gitname $branch
git status
echo -e "\n All Tasks Done + Uploaded \n"
echo -e "\n\n\n\n\t Thanks For Using Another Shazza Tool; \n"

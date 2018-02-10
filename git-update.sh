#!/data/data/com.termux/files/usr/bin/env bash
#########################################################
# Shazza-Works						#
# Update Script To Push My Git Files			#
# NB...							#
# To use just move to a GIT ROOT dir and run.. enjoy    #
#########################################################
export home=$HOME
clear
echo "PWD IS $pwd"
printf "\n What Git Are You Updating? \n"
select file in $HOME/GIT-HUB/* ; do
test -n "$file" && break ; echo ">>> Invalid Selection";
done
github=$(basename "$file")
read -p "What Branch Do You Want To Use [Def=master]; " -r branch
echo -e "\n $branch Selected... \n"
git status ; sleep 3
wait ; git add .
wait ; git commit -m "Update-$(date)"
wait ; git push https://github.com/shazza-works/$github $branch
echo -e "\n All Tasks Done + Uploaded \n"
echo -e "\n\n\n\n\t <<<Thanks For Using Another Shazza Tool>>> \n"

#!/bin/bash
# Shazza Works V2
# script for getting a full list of pkg's to install
# will try to install all of them with this sript
echo "<>"
echo -e "{MAKING TEMP SORT FILES......}" \n
>logs/a-tmp1
>logs/a-tmp2
echo "<>"
echo -e "{GETTING PKG NAMES FROM CACHEFILES...}" \n
apt-cache pkgnames > logs/a-tmp1
echo "<>"
echo -e "{SORTING LIST TO USE WITH INSTALL-ALL}" \n
sed 's/^/apt-get install /' logs/a-tmp1 | sort > logs/a-tmp2
cat logs/a-tmp2 > logs/ins-apps.sh
echo "<>"
echo -e "{REMOVING TEMP SORT FILES.......}" \n
rm -f logs/a-tmp1 logs/a-tmp2

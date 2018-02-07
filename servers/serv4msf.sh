#!/bin/bash
# V5.0
# Code By Shazza Works
# Email; ogormanad@googlemail.com
# Simple talkting start servers script for MfS-Console.
# Espeak to be Installed. If NOT!
# Added Prompt for Start MSF.
service postgresql start;
echo "postgresql...............Service Started"
espeak "post g.r.e. sql.............Service Started" -s 130
service apache2 start;
echo "apache2..................Service Started"
espeak "apache2..................Service Started" -s 130
espeak "Do You Want To Start MSF Console Now?" -s 130
read -p "Do You.....? [Y/N-y/n]"
if [[ $REPLY =~ ^[Yy]$ ]]; then
espeak "Starting.....M.S.F..... Please Wait." -s 130
	msfconsole;
fi
echo "Press Enter...."

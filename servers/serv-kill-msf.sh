#!/bin/bash
#################################################
# Code By Shazza Works				#
# Email; ogormanad@googlemail.com		#
# Stop Server MfS-Console.			#
# Added Prompt for Start MSF.			#
#################################################
service postgresql stop;
echo
echo "Postgresql.............Killed...!"
service apache2 stop;
echo
echo "Apache2................Killed...!"
echo "ALL Servers.........KILLED"
espeak "ALL Servers.........KILLED" -s 130

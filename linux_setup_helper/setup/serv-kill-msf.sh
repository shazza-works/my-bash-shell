#!/bin/bash
# Shazza Works.
# Stop Server MfS-Console.
# Added Prompt for Start MSF.
echo -e "\e[33m"
service postgresql stop;
echo
echo "Postgresql.............Killed...!"
service apache2 stop;
echo "Apache2................Killed...!"
echo
echo -e "ALL Servers.........\e[31mKILLED\e[0m"
espeak "ALL Servers.........KILLED" -s 130
echo -e "\e[31m"
echo "Press Enter...."
echo -e "\e[0m"

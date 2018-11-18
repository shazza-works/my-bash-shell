#!/bin/bash
# keep track of connections live... (happy netstat)
echo -e "IP Adress Logging Started... \n"
while true
  do
    date=`date`
    IFS=$'\n'
    i=`netstat -tau | grep -E 'tcp|udp' | sort -u | sed 's/:/<port?>/g' | awk '{print $1, $2="", $3="", $4, $5, $6}'`;
    echo -e "\e[32m<Logged @ $date> \e[34m \n$i\e[39m" >> ip-log;
    cat ip-log | sort -u >> ip-1.log;
    cat ip-1.log | sort -u >> ip-logs.log;
    tail -n 20 ip-logs.log & sleep 5;
    read -t 0.25 -N 1 input;
    if [[ $input = "q" ]] || [[ $input = "Q" ]]; then
        sleep 1;
        rm -rf ip-log ip-1.log;
        echo "Clean Up Done..."
        break
    else
        echo -e "\e[31mTo Quit Press [Qq].. \e[0m"
    fi
done

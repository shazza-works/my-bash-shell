#!/bin/bash
while true; do
    url=''
    echo
    read -p "Enter URL >" url
    if [[ $url -eq 'x' ]]; then
        mv *.webm *.mp4 ~/storage/downloads/;
        exit
    elif [[ ! $url -eq 'x' ]]; then
        youtube-dl -e $url;
        youtube-dl $url;
        sleep 0.5
    fi
done

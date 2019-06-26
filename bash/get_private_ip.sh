#!/bin/bash

echo -e "\n\t $(ifconfig -a wlan0 | grep -m 1 inet | awk '{print $2}')\n"

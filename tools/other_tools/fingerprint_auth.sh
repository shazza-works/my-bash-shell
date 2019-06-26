#!/bin/bash
# Shazza-Works V1.0
# Script to fingerprint auth a script or task, this is giving sms list on auth grant.
#
# You need jq and termux API and i guess a finger-print scanner on 
# your phone and this will work
#

sec=`termux-fingerprint | jq .auth_result | tr -d '"'`
if [[ $sec == AUTH_RESULT_SUCCESS ]]; then
    wait ; echo "ACSESS GRANTED" # add a cmd to call - eg termux-sms-list | jq
    sec=""
else
    echo -e "\nFinger_Print_Auth_FAILED!\n"
    sec=""
fi

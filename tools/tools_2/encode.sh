#!/bin/bash
# Simple tool to base32 and base64 encode
while [ 1 == 1 ]; do
	select chs in "base32" "base64"; do
		read -p "Enter Your MSG To Encode> " msg
		echo -n $msg | $chs
	done
done

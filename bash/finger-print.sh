termux-fingerprint | key=`grep -w auth_result`
if [ $key -eq "AUTH_RESULT_SUCCESS"]; then
	echo "IT WORKED"
else
	echo "try again!"
fi

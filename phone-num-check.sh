# This script will use termux api to get contacts list in json
# it then edits the strings and removes numbers that are less than 10 or 11
# digits printing the error msg if not 10 or 11 and saving the rest to file
# the 10 digit numbers are padded with a trailing '0'
add='0'
list=`termux-contact-list`;
echo $list | jq '.[] | .number' | tr -d '-' | tr -s '+44' '0' | tr -d ' ' | tr -d '"' > tmp-nums-lst;
while read number; do
if [ ! `echo $number | wc -c` == 12 ] && [ ! `echo $number | wc -c` == 11 ]; then
	echo $number' -- not 10 or 11 digits'
elif [ `echo $number | wc -c` == 11 ]; then
	echo $number$add >> your_mob_numbers.txt
else
	echo $number >> your_mob_numbers.txt
fi
done < tmp-nums-lst
rm tmp-nums-lst;
echo ''
echo 'Printed to [your_mob_numbers.txt]'
echo 'All Donski!'

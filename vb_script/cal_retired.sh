#!/bin/bash

echo "this will calculate when you will retired:"
read -p "Please input your retirements date (YYYYmmdd): " date2

date_d=$(echo ${date2} | grep "[0-9]\{8\}")

if [ "${date_d}" == "" ]; then
	echo "Your input format is wrong..."
	exit 1
fi

declare -i date_dem=$(date --date="${date2}" +%s)
declare -i date_now=$(date +%s)
declare -i date_total=$((${date_dem}-${date_now}))
declare -i date_d=$((${date_total}/60/60/24))

if [ "$date_total" -lt "0" ]; then
	echo "you have been retired before "$((-1*${date_d})) " ago"
else
	declare -i date_h=$(($((${date_total}-${date_d}*60*60*24))/60/60))
	echo "you still have ${date_d} days and ${date_h} hours"
fi

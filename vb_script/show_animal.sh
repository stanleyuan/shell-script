#!/bin/bash

for animal in dog cat elephant
do
	echo "the animal is ${animal}"
done

users=$(head /etc/passwd | cut -d ":" -f 1)

for user in ${users}
do
	id ${user}
done

network="10.106.4"

for sitenu in $(seq 1 100)
do
	ping -c 1 -w 1 ${network}.${sitenu} &> /dev/null && result=0 || result=1

	if [ ${result} == 0  ]; then
		echo "Server ${network}.${sitenu} is UP"
	else
		echo "Server ${network}.${sitenu} is DOWN"
	fi
done

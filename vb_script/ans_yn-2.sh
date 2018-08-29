#!/bin/bash

read -p "input y or n: " yn

if [ "$yn" == "Y" ] || [ "$yn" == "y" ]; then
	echo "ok" && exit 0

elif [ "$yn" == "N" ] || [ "$yn" == "n" ]; then
	echo "no" && exit 0
else
	echo -e "what happened to you? \n\n"
fi


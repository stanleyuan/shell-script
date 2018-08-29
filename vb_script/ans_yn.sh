#!/bin/bash

read -p "input y or n" yn

[ "$yn" == "Y" -o "$yn" == "y" ] && echo "ok" && exit 0
[ "$yn" == "N" -o "$yn" == "n" ] && echo "no" && exit 0
echo -e "what happened to you? \n\n"


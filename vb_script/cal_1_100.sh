#!/bin/bash

read -p "input a num, I will calculate 1+2+...+your_input: " nu
s=0

for ((i=1; i<=${nu}; i=i+1))
do
	s=$((${s}+${i}))
done

echo "the result is ${s}"

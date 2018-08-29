#!/bin/bash

eat[1]="銀記"
eat[2]="六教"
eat[3]="咖食堂"
eat[4]="鐵板燒"
eatnum=4

check=$((${RANDOM} * ${eatnum} / 32767 + 1))
echo "your can eat ${eat[${check}]}"

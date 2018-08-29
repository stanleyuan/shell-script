#!/bin/bash

while [ "${yn,,}" != "yes" ]
do
	read -p "input yes to stop this program: " yn
done
echo "your finally input yes"

until [ "${yn,,}" == "yes"  ]
do
	read -p "input yes to stop this program: " yn
done
echo "your finally input yes"

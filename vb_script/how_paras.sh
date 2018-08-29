#!/bin/bash

echo "the scrip name is --> ${0}"
echo "Total parameter number is --> $#"
[ "$#" -lt 2 ] && echo "the num parameter is less than 2 stop here." && exit 0
echo "your whole parameter is --> '$@'"
echo "the first parameter is ${1}"
echo "the second parameter is ${2}"
exit 0

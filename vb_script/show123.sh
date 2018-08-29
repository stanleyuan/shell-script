#!/bin/bash

echo "the program will print your selection"

selection=${1,,}
# slection=${1^^}
case ${selection} in
	"one")
		echo "your selection is one"
		;;
	"two")
		echo "your selection is two"
		;;
	"three")
		echo "your selection is three"
		;;
	*)
		echo "usage ${0} {one|two|three}"
		;;
esac

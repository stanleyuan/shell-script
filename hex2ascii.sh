#!/bin/bash
# xxd -p asciifilename
# xxd -r -p hexfilename

opt=${1}
str=${2}

case $opt in
	"to")
		hex=""
		for ((i=0; i<${#str}; i=i+2))
		do
			if [ $(($i%2)) == 0 ];then
				hex="$hex\x${str:i:2}"
			fi
		done
		echo -e $hex
		;;
	"rev")
		echo "rev"
		;;
	*)
		echo "Usage ${0} {to(hex -> ascii) | rev(ascii -> hex)}"
		;;
esac

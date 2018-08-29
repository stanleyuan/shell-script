#!/bin/bash

if [ "${1}" == "hello" ]; then
	echo "Hello, how are you?"

elif [ -z "${1}" ]; then
# elif [ "${1}" == "" ]; then
	echo "you must input parameter, ex> {${0} someword}"

else
	echo "the only parameter is 'hello', ex> {${0} hello}"

fi

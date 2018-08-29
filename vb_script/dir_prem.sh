#!/bin/bash

read -p "input a directory name: " dir
if [ "${dir}" == "" ] || [ ! -d ${dir} ]; then
	echo "the ${dir} is NOT exist in your system."
	exit 1
fi

filelist=$(ls ${dir})
for file in ${filelist}
do
	perm=""
	test -d "${dir}/${file}" && dir_name="yes" || dir_name="no"
	test -r "${dir}/${file}" && perm="${perm} readable"
	test -w "${dir}/${file}" && perm="${perm} writable"
	test -x "${dir}/${file}" && perm="${perm} exectable"
	if [ "${dir_name}" == "yes" ]; then
		echo -n "the directory "
	else
		echo -n "the file "
	fi

	echo "${dir}/${file}'s permission is ${perm}"
done

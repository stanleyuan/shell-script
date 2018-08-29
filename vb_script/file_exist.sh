#!/bin/bash

echo  "input a file name\n\n"
read -p "input a file name" filename

test -z $filename && echo "input a file name!!!" && exit 0

test ! -e $filename && echo "not exist" && exit 0

test -f $filename && filetype="regular file"
test -d $filename || filetype="directory"

test -r $filename && perm="readable"
test -w $filename && perm="$perm writeable"
test -x $filename && perm="$perm executable"

echo $filename $perm

exit 0

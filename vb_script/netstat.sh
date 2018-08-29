#!/bin/bash

echo "check you server's service..."
echo "we will check www(80). ftp(21). ssh.(22) and mail(25)"

testfile=/dev/shm/netstat_checking.txt
netstat -tuln > ${testfile}

testing=$(grep ":80" ${testfile})
if [ "${testing}" != "" ]; then
	echo "WWW is running..."
fi
testing=$(grep ":22" ${testfile})
if [ "${testing}" != "" ]; then
	echo "SSH is running..."
fi
testing=$(grep ":21" ${testfile})
if [ "${testing}" != "" ]; then
	echo "FTP is running..."
fi
testing=$(grep ":25" ${testfile})
if [ "${testing}" != "" ]; then
	echo "MAIL is running..."
fi

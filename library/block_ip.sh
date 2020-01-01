#!/bin/sh
source `dirname $0`/args

if [ $state == "absent" ] ; then
	route del -host $target reject
	if [ $? -eq 0 ] ; then
		echo '{ "rc": 0, "changed": true }'
	else
		echo '{ "rc": 0 }'
	fi			
elif [ $state == "present" ] ; then
	route add -host $target reject
	if [ $? -eq 0 ] ; then
		echo '{ "rc": 0, "changed": true }'
	else
		echo '{ "rc": 0 }'
	fi
else
	echo '{ "failed": true, "rc": 0 }'	
fi

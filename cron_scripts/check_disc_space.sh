#!/bin/bash

# the value to check is passed as the first parameter - usage in bytes
# if nothing is passed the default is 200000000000 bytes (about 2 Gig)
# NOTE that the arguments are positional
# command line useage:
# sh check_disc_space.sh 200000000000 "some awesomely worded subject" "email@emailserver.com"
# cron usage example - set to run at 8am (server time) every day
# * 8 * * * * sh /[the path to my cron scripts folder]/check_disc_space.sh 200000000000 "some awesomely worded subject" "email@emailserver.com"
# cool cron cheat sheet at https://devhints.io/cron
CHECK_VALUE=$1
SUBJECT="$2"
RECIPIENTS="$3"

if [ "$CHECK_VALUE" = '' ]; then
	# the default is 200000000000 bytes (about 2 Gig)
	CHECK_VALUE=200000000000
	echo "using 200000000000 bytes as default usage check value"
fi
## echo $CHECK_VALUE

if [ "$SUBJECT" = '' ]; then
	# the default SUBJECT is set below is argument is empty
	SUBJECT="Disk Usage Notification"
fi

if [ "$RECIPIENTS" = '' ]; then
	# the default RECIPIENTS is set below is argument is empty
	RECIPIENTS="j*****2@illinois.edu"
fi

# go to root directory, switch to root user and get the disk usage
# get the first field in the last row of a du command (returns the disk usage in bytes)
cd /
sudo -s
DISK_USAGE=`du | tail -n 1 | cut -f 1`

echo $DISK_USAGE

if [ $DISK_USAGE -gt $CHECK_VALUE ]; then
	MESSAGE="Disk usage of $DISK_USAGE bytes is above the check value of $CHECK_VALUE bytes"
	echo $MESSAGE
	echo $MESSAGE | mail -s "$SUBJECT" "$RECIPIENTS"
fi

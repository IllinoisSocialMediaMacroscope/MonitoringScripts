# MonitoringScripts
Scripts to help monitor EC2 servers

The scipts in this repository are used individually and are not components of a larger application.

As new scripts are added this readme should be updated.

# check_disk_space.sh

This script, in the cron_scripts folder, can be called by cron and will send an email if the results of the du command exceeds a specified level called the "check value".

The check value, email subject line, and email recipients can be specified.

An example entry in a cron tab file is as follows.
* 8 * * * * sh /[the path to my cron scripts folder]/check_disc_space.sh 200000000000 "some awesomely worded subject" "email@emailserver.com"



# MonitoringScripts
Scripts to help monitor EC2 servers

The scipts in this repository are used individually and are not components of a larger application.

As new scripts are added this readme should be updated.

# News

Oct 13, 2017: The AWS disk space monitoring scripts have been installed on 2 EC2s, get-twitter-stream and Macroscope Main.  In this repository see the folder AWS_cloud_watch-scripts.  Installation notes for both EC2s are in the file https://github.com/IllinoisSocialMediaMacroscope/MonitoringScripts/blob/master/AWS_cloud_watch_scripts/aws_monitoring_install_helper_script.sh .  And the perl scripts from AWS are in the folder https://github.com/IllinoisSocialMediaMacroscope/MonitoringScripts/tree/master/AWS_cloud_watch_scripts/aws-scripts-mon


# check_disk_space.sh

This script, in the cron_scripts folder, can be called by cron and will send an email if the results of the du command exceeds a specified level called the "check value".

The check value, email subject line, and email recipients can be specified.

An example entry in a cron tab file is as follows.
* 8 * * * * sh /[the path to my cron scripts folder]/check_disc_space.sh 200000000000 "some awesomely worded subject" "email@emailserver.com"



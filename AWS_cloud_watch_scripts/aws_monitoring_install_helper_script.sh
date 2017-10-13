#!/bin/bash

#  AWS cloudWatch Monitoring script install helper
#  adapted from:  http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/mon-scripts.html

# this script does some of the steps need to install on an EC2

# 1 manually created a folder for the scripts, and copy this script into it.

#
#  The steps for get-twitter-stream and "Macroscope Main" are different as they 
#  have different versions of Linux
#

# 2 run below commands for amazon AMIs (get-twitter-stream EC2)
# sudo yum install perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https -y
# curl http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip -O
# unzip CloudWatchMonitoringScripts-1.2.1.zip
# rm CloudWatchMonitoringScripts-1.2.1.zip
# cd aws-scripts-mon

# 3 to test run the following command (NOTE change /dev/xvda1 to the approriate disk path for the machine
# ./mon-put-instance-data.pl --disk-space-avail --disk-path=/dev/xvda1 --verify --verbose
# 4 if you get a message like "ERROR: No IAM role is associated with this EC2 instance."
#   then you will need to assign a role assigned to EC2 that allows access to cloudwatch.
#   for the macroscope project a IAM role with the name macropscop_access_roles has been created
#   more info on adding IAM roles is at: 
#   https://aws.amazon.com/blogs/security/easily-replace-or-attach-an-iam-role-to-an-existing-ec2-instance-by-using-the-ec2-console/
# 5 the test command in step 3 does not write to cloud watch, so run the modified command below
# ./mon-put-instance-data.pl --disk-space-avail --disk-path=/dev/xvda1
# 6 add a line to the cron tab file to send disk space available to cloud watch every 60 mins
#  */60 * * * * ~/applications/MonitoringScripts/AWS_cloud_watch_scripts/aws-scripts-mon/mon-put-instance-data.pl --disk-space-avail --disk-path=/dev/xvda1 --from-cron


#
# more to come... how to install on Macroscope Main 
#

# NOTE: for the macroscope the aws monitoring scripts are installed in /home/centos/aws-scripts-mon

# NOTE: we are using the RHEL version 6.9 instructions from 
# 	http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/mon-scripts.html
# 	with the addition of running sudo yum install perl-CPAN

# 1 manually created a folder for the scripts, and copy this script into it. 
# 		login as centos
#		cd ~
#
# 2 do the extra step and install CPAN  ..
#		sudo yum install perl-CPAN
#
# 3 install perl libraries and gcc
#		
#	sudo yum install perl-DateTime perl-CPAN perl-Net-SSLeay perl-IO-Socket-SSL perl-Digest-SHA gcc -y
# 	sudo yum install zip unzip
#
# 4 now use CPAN to install the below 4 perl libraries
# 
# sudo cpan
# 
# cpan[1]> install YAML 
# cpan[1]> install LWP::Protocol::https 
# cpan[1]> install Sys::Syslog 
# cpan[1]> install Switch
#
# 5 download and install the monitoring scripts

# curl http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip -O
# unzip CloudWatchMonitoringScripts-1.2.1.zip
# rm CloudWatchMonitoringScripts-1.2.1.zip
# cd aws-scripts-mon

# 6 to test run the following command (NOTE change /dev/xvda1 to the approriate disk path for the machine
# ./mon-put-instance-data.pl --disk-space-avail --disk-path=/dev/xvda1 --verify --verbose


# 7 if you get a message like "ERROR: No IAM role is associated with this EC2 instance."
#   then you will need to assign a role assigned to EC2 that allows access to cloudwatch.
#   for the macroscope project a IAM role with the name macropscop_access_roles has been created
#   more info on adding IAM roles is at: 
#   https://aws.amazon.com/blogs/security/easily-replace-or-attach-an-iam-role-to-an-existing-ec2-instance-by-using-the-ec2-console/
# 8 the test command in step 3 does not write to cloud watch, so run the modified command below
# ./mon-put-instance-data.pl --disk-space-avail --disk-path=/dev/xvda1
# 6 add a line to the cron tab file to send disk space available to cloud watch every 60 mins
#  */5 * * * * ~/aws-scripts-mon/mon-put-instance-data.pl --disk-space-avail --disk-path=/dev/xvda1 --from-cron









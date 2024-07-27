#!/bin/bash

#Validations
#colors
#log redirections

LOGFILE_DIRCTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRCTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
N="\e[0m"
Y="\e[33m"
G="\e[32m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1
message=""

#IFS= means internal field separator in space
while IFS= read line
do
# this command will give you usage in number format for comparision
   usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
   # this command will give us partition
   partition=$(echo $line | awk '{print $1}')
   # now you need to check whether it is more than threshold or not
   if [ $usage -gt $DISK_USAGE_THRESHOLD ];
   then
          message+="HIGH DISK USAGE ON $partition: $usage"
   fi
done <<< $DISK_USAGE

echo "message: $message"


# how to call other shell script with your current script
sh mail.sh info@joindevops.com "High Disk Usage" "$message" "DEVOPS TEAM" "High Disk Usage"
 
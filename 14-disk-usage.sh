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

#IFS= means internal field separator in space
while IFS= read line
do
# this command will give you usage in number format for comparision
   echo (output :$line | awk '{print $6}' | cut -d % -f)

done <<< $DISK_USAGE
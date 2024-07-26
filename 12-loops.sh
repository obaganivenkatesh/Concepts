#!/bin/bash

DATE=$(date +%F)
LOGSDIR=/home/centos/shellscript-log
#/home/centos/shellscript-log/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0/$DATE.log

USERID=$(id -u)

R="\e[31m"
N="\e[0m"

if [ $USERID -ne 0 ];
  then
    echo -e "$R ERROR :: Please run this script with root access $N"
    exit 1
fi

# all arguments are in $@
for i in $@
do
  yum list installed $i 
  if [ $? -ne 0 ]
  then
      echo "$i is not installed, let's install it"
# yum install $i -y
done 

# improvements
# implement log files
# implement colors
# implement validations
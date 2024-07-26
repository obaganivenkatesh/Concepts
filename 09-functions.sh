#!/bin/bash

# our program goal is to install mysql

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"


# this function should validate the previous command and inform user it is success or failure
VALIDATE(){
    #$1--> it will receive the argument1
    if [ $1 -ne 0 ]
      then
          echo "$2..........$R Failure $N"
          exit 1
      else
          echo "$2.........$G Success $N"   
    fi
}

USERID=$(id -u)


if [ $USERID -ne 0 ]
  then
      echo "ERROR:: please run this script with root access"
      exit 1
  else
      echo "INFO:: you are root user"
fi

# it is our responsibility to check the installation is success or not
yum install mysql -y &>>$LOGFILE

VALIDATE $? "Installing MYSQL"

# it is our responsibility to check the installation is success or not
yum install postfix -y &>>$LOGFILE

VALIDATE $? "Installing Postfix"

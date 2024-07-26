#!/bin/bash

# our program goal is to install mysql

USERID=$(id -u)

# this function should validate the previous command and inform user it is success or failure
VALIDATE(){
    #$1--> it will receive the argument1
    if [ $1 -ne 0 ]
      then
          echo "$2..........Failure"
      else
          echo "$2.........Success"   
    fi
}

if [ $USERID -ne 0 ]
  then
      echo "ERROR:: please run this script with root access"
      exit 1
  else
      echo "INFO:: you are root user"
fi

# it is our responsibility to check the installation is success or not
yum install mysql -y

VALIDATE $? "Installing MYSQL"

# it is our responsibility to check the installation is success or not
yum install postfix -y

VALIDATE $? "Installing Postfix"

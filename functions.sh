#!/bin/bash

USERID=$(id -u)

VALIDATE(){
if [ $1 -eq 0 ]
    then
        echo "installing $2 is success"
    else
        echo "installing $2 is failure"
        exit 1
    fi
}

if [ "$USERID" -ne 0 ]
then
    echo "ERROR :: please run the script with root access"
    exit 1 #other than 0
else
    echo "you are running with root access"
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql not installed ...going to install now"
    dnf install mysql -y
    VALIDATE $? "MySql"
else
    echo " mysql already installed"
    exit 0
fi
dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 not installed ...going to install now"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo " python3 already installed"
    exit 0
fi
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx not installed ...going to install now"
    dnf install nginx -y
   VALIDATE $? "nginx"
else
    echo " nginx already installed"
    exit 0
fi
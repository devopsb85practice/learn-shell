#!/bin/bash

USERID=$(id -u)

if [ "$USERID" -ne 0 ]
then
    echo "ERROR :: please run the script with root access"
    exit 1 #other than 0
else
    echo "you are running with root access"
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo " installing MYSQL is success"
else
    echo "installing MYSQL is failure"
    exit 1
fi
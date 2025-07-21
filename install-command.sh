#!/bin/bash

USERID=$(id -u)

if [ "$USERID -nt 0" ]
then
    echo "ERROR :: please run the script with root access"
    exit 1 #other than 0
else
    echo "you are running with root access"
fi

dnf install mysql -y
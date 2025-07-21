#!/bin/bash

USERID=$(id -u)

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
    if [ $? -eq 0 ]
    then
        echo "installing mysql is success"
    else
        echo "installing mysql is failure"
        exit 1
    fi
else
    echo " mysql already installed"
    exit 0
fi

# dnf install mysql -y

# if [ $? -eq 0 ]
# then
#     echo " installing MYSQL is success"
# else
#     echo "installing MYSQL is failure"
#     exit 1
# fi
#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ "$USERID" -ne 0 ]
then
    echo -e "$R ERROR :: please run the script with root access$N"
    exit 1 #other than 0
else
    echo -e "$G you are running with root access"
fi
dnf list installed mysql
VALIDATE(){
if [ $1 -eq 0 ]
    then
        echo -e "$G installing $2 is success $N"
    else
        echo "$R installing $2 is failure $N"
    
    fi
}
if [ $? -ne 0 ]
then
    echo -e "$G Mysql not installed ...going to install now $N"
    dnf install mysql -y
    VALIDATE $? "MySql"
else
    echo -e "$R mysql already installed $N"

fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo -e "$G python3 not installed ...going to install now $N"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "$R python3 already installed $N"
    
fi
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo -e "$G nginx not installed ...going to install now $N"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "$R nginx already installed $N"
    
fi
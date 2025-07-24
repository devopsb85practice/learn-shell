#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="/$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started executing at $(date)"| tee -a $LOG_FILE

if [ "$USERID" -ne 0 ]
then
    echo -e "$R ERROR :: please run the script with root access$N" | tee -a $LOG_FILE
    exit 1 #other than 0
else
    echo -e "$G you are running with root access" | tee -a $LOG_FILE
fi
dnf list installed mysql &>>$LOG_FILE
VALIDATE(){
if [ $1 -eq 0 ]
    then
        echo -e "$N installing $2 is $G success $N" | tee -a $LOG_FILE
    else
        echo "$N installing $2 is $R failure $N" | tee -a $LOG_FILE
    fi
}
if [ $? -ne 0 ]
then
    echo -e "$N Mysql not installed ...going to install now $N" &>>$LOG_FILE
    dnf install mysql -y | tee -a $LOG_FILE
    VALIDATE $? "MySql"
else
    echo -e "$Y mysql already installed $N" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e "$G python3 not installed ...going to install now $N" | tee -a $LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "$Y python3 already installed $N" | tee -a $LOG_FILE
fi
dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e "$G nginx not installed ...going to install now $N" | tee -a $LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "$Y nginx already installed $N" | tee -a $LOG_FILE
    
fi

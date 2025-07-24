#!/bin/bash
# for i in {1..100}
# do 
#     echo "$i"
# done


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="/$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER
VALIDATE(){
if [ $1 -eq 0 ]
    then
        echo -e "$N installing $2 is $G success $N" | tee -a $LOG_FILE
    else
        echo "$N installing $2 is $R failure $N" | tee -a $LOG_FILE
    fi
}

echo "script started executing at $(date)"| tee -a $LOG_FILE

PACKAGES=("nginx" "mysql" "python3" "httpd")
for package in ${PACKAGES[@]}
# for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
    echo -e "$N $package not installed ...going to install now $N" &>>$LOG_FILE
    dnf install $package -y &>>$LOG_FILE
    VALIDATE $? "$package"
    else
        echo -e "$Y $package already installed $N" | tee -a $LOG_FILE
    fi
done
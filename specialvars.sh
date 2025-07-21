#!/bin/bash


echo "all variables passed to the script : $@"
echo " no of variables passed: $#"
echo "script name: $0"
echo "current dir: $PWD"
echo "user running this script :$USER"
echo "Home directory of user:$HOME"
echo "PID of the script:$$"
sleep 10 &
echo "PID of last command in background:$!"
 
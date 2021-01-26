#!/usr/bin/env bash

##
## Paths
##
p-list() {
  echo 0 : exit - Exit this script
  echo 1 : help - Print the help
  echo 2 : atom-home - Runs 'atom ~/'
  echo 3 : ssh-setup - adds private keys to system SSH
  echo 4 : a4w-init - copies a4w jars to Tomcat lib dir
  echo 5 : a4w-webapp - copies the stp-manager war to Tomcat webapps
  echo 6 : tomcat-start - starts tomcat
  echo 7 : tomcat-stop - stops tomcat
}

echo Enter the number of the path and press Enter
p-list()

read -p "Location number:  " -r
echo    # (optional) move to a new line
echo $REPLY

if [ $REPLY -eq 0 ]; then
  exit 1
elif [ $REPLY -eq 1 ]; then
  f-help
elif [ $REPLY -eq 2 ]; then
  f-atom-home
elif [ $REPLY -eq 3 ]; then
  f-ssh-setup
elif [ $REPLY -eq 4 ]; then
  f-a4w-init
elif [ $REPLY -eq 5 ]; then
  f-a4w-webapp
elif [ $REPLY -eq 6 ]; then
  f-tomcat-start
elif [ $REPLY -eq 7 ]; then
  f-tomcat-stop
fi

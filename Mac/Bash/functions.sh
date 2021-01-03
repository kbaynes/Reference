#!/usr/bin/env bash

##
## Functions
##
f-atom-home() {
  atom ~/
}
#
# SSH Keys
#
f-ssh-setup() {
  ssh-add -K ~/.ssh/kevin-at-kevinbaynes-dot-com.private_key
  ssh-add -K ~/.ssh/iam_msgk.private_key
}
f-a4w-init() {
  bash /Users/kevin/GitHub/KbaynesRepos/Reference/Mac/Bash/a4w-init.sh
}
f-a4w-webapp() {
  bash /Users/kevin/GitHub/KbaynesRepos/Reference/Mac/Bash/copy-a4w-manager.sh
}
f-tomcat-start() {
  bash ${PATH_TOMCAT}/bin/startup.sh
}
f-tomcat-stop() {
  bash ${PATH_TOMCAT}/bin/shutdown.sh
}
f-aws-work() {
  rm ~/.aws/credentials
  cp ~/.aws/credentials-work ~/.aws/credentials
  git config --local credential.helper '!aws --profile kevin codecommit credential-helper $@'
}
f-aws-kb() {
  rm ~/.aws/credentials
  cp ~/.aws/credentials-kb ~/.aws/credentials
  git config --local credential.helper '!aws --profile kb codecommit credential-helper $@'
}
f-help() {
  printf "0  : exit      - Exit this script\n"
  printf "1  : help      - Print the help\n"
  printf "2  : atom-home - Run 'atom ~/'\n"
  printf "3  : ssh-setup - Add private keys to system SSH\n"
  printf "4  : aws-work  - Set AWS credentials to work\n"
  printf "5  : aws-kb    - Set AWS credentials to kb\n"
}
f-action() {
  if [[ ! $1 =~ ^-?[0-9]+$ ]]; then
    printf "Invalid Selection\n"
    exit 0
  fi
  if [ $1 -eq 0 ]; then
    exit 1
  elif [ $1 -eq 1 ]; then
    f-help
  elif [ $1 -eq 2 ]; then
    f-atom-home
  elif [ $1 -eq 3 ]; then
    f-ssh-setup
  elif [ $1 -eq 4 ]; then
    f-aws-work
  elif [ $1 -eq 5 ]; then
    f-aws-kb
  fi
}

if [ ! -z "$1" ]; then
  f-action $1
  exit 0
else
  printf "Enter the number of the function and press Enter\n"
  f-help

  read -p "Function number:  " -r
  echo    # (optional) move to a new line
  f-action $REPLY
fi

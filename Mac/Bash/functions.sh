#!/usr/bin/env bash

clear

functions=( \
  f-help \
  f-atom-home \
  f-ssh-setup \
  f-aws-work \
  f-aws-kb \
)

function_desc=( \
  "Print the help" \
  "Open Atom to ~/" \
  "ssh-add -K my keys" \
  "Change global AWS keys to work, set local helper" \
  "Change global AWS keys to kb, set local helper" \
)


##
## Functions
##
f-help() {
  # printf `cat build/help.txt\n`
  for i in "${!functions[@]}"; do
    local f_name=${functions[$i]}
    pad_string $f_name 20
    local f_desc=${function_desc[$i]}
    printf "   $i  $padded_str - $f_desc\n"
  done
  printf "\n"
}
f-atom-home() {
  atom ~/
}
# SSH Keys
f-ssh-setup() {
  ssh-add -K ~/.ssh/kevin-at-kevinbaynes-dot-com.private_key
  ssh-add -K ~/.ssh/iam_msgk.private_key
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

#
# helper functions
# 

pad_string() {
  padded_str=$1
  maxlen=$2
  while ((${#padded_str} < $maxlen)); do 
    padded_str+=" "
  done
}

if [ ! -z "$1" ]; then
  ${functions[$1]}
  exit 0
else
  printf "\nEnter the number of the function and press Enter :\n"
  f-help

  read -p "Function number:  " -r
  printf "Running function ${functions[$REPLY]}\n\n"    # (optional) move to a new line
  ${functions[$REPLY]}
fi
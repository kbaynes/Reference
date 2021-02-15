#!/usr/bin/env bash

clear

functions=( \
  p-help \
  p-ref-mac-bash \
  p-home \
  p-github-home \
)

function_desc=( \
  "Print the help" \
  "Ref Mac Bash ($P_REF_MAC_BASH)" \
  "User Home ($HOME)" \
  "GitHub Home ($P_GITHUB_HOME)" \
)


##
## Paths
##
p-help() {
  # printf `cat build/help.txt\n`
  for i in "${!functions[@]}"; do
    local f_name=${functions[$i]}
    pad_string $f_name 20
    local f_desc=${function_desc[$i]}
    printf "   $i  $padded_str - $f_desc\n"
  done
  printf "\n"
}
p-home() {
  cd $HOME
}
p-github-home() {
  printf "cd $P_GITHUB_HOME \n\n"
  cd $P_GITHUB_HOME
}
p-ref-mac-bash() {
  printf "cd $P_REF_MAC_BASH \n\n"
  cd $P_REF_MAC_BASH
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
  printf "\nEnter the number of the path and press Enter :\n"
  p-help

  read -p "Path number:  " -r
  # printf "Go: ${functions[$REPLY]}\n\n"    # (optional) move to a new line
  ${functions[$REPLY]}
fi

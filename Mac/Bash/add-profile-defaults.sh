#!/usr/bin/env bash

# cp ~/.bash_profile ~/.bash_profile_bak

PWD=`pwd`
if [[ "$PWD" == *"/Reference/Mac/Bash" ]]; then
  printf "PWD='$PWD'\n"
else
  printf "Fail: Must be in the dir /Reference/Mac/Bash\n  Exiting\n"
  exit 0
fi

# adds my common defaults to the bash_profile

# backup the original file once and leave it
# on subequent runs backup to a latest file - keep overwriting it
BAK_FILE_ORIGINAL=~/.bash_profile_original_bak
BAK_FILE_LATEST=~/.bash_profile_latest_bak
if [[ -f $BAK_FILE_ORIGINAL ]]; then
  printf "Original Exists\n"
  cp ~/.bash_profile $BAK_FILE_LATEST
else
  printf "Original Not Exists\n"
  touch $BAK_FILE_ORIGINAL
  cp ~/.bash_profile $BAK_FILE_ORIGINAL
fi

# profile original should exist now
# always append latest profile defaults to original
# any manual changes will be preserved in latest backup

PROFILE_ORIGINAL=`cat $BAK_FILE_ORIGINAL`
PROFILE_DEFAULTS=`cat profile-defaults.sh`
# PROFILE_DEFAULTS=$(echo "$PROFILE_DEFAULTS" | sed "s/PATH_TO_REFERENCE_MAC_BASH/$PWD/")
PROFILE_DEFAULTS=${PROFILE_DEFAULTS//PATH_TO_REFERENCE_MAC_BASH/$PWD}
# printf "$PROFILE_ORIGINAL \n"
# printf "$PROFILE_DEFAULTS \n"
# printf "%s\n%s\n" $PROFILE_ORIGINAL $PROFILE_DEFAULTS >| ~/.bash_profile
# printf "PATH_TO_REFERENCE_MAC_BASH=\"$PWD\"\n$PROFILE_ORIGINAL\n$PROFILE_DEFAULTS\n" >| ~/.bash_profile
printf "$PROFILE_ORIGINAL\n$PROFILE_DEFAULTS\n" >| ~/.bash_profile
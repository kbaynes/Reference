#!/usr/bin/env bash

# adds my common defaults to the bash_profile

PROFILE_DEFAULTS=`cat profile-defaults.sh`
printf "$PROFILE_DEFAULTS\n" >> ~/.bash_profile

##### BEGIN PROFILE DEFAULTS
#
# included file - Reference/Mac/Bash/profile-defaults.sh
#
# Set default shell to bash
chsh -s /bin/bash
#
# Links to functions and paths
#
OTHER_PATH="/Users/kevin/Documents/MyGitRepos/GitHub/"
PERSONAL_PATH="/Users/kevin/GitHub/KbaynesRepos"
PATH_TO_REFERENCE_PROJ=$PERSONAL_PATH
#
# Functions
#
f() {
  bash $PATH_TO_REFERENCE_PROJ/Reference/Mac/Bash/functions.sh $1
}
#
# Locations
#
p() {
  bash $PATH_TO_REFERENCE_PROJ/Reference/Mac/Bash/paths.sh
}
#
# turn off the bash deprecation warning in mac terminal
#
export BASH_SILENCE_DEPRECATION_WARNING=1
#
##### END PROFILE DEFAULTS

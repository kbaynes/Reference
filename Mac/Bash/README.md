
## Add Bash Functions

Add the following to ~/.bash_profile

```
OTHER_PATH="/Users/kevin/Documents/MyGitRepos/GitHub/"
PERSONAL_PATH="/Users/kevin/GitHub/KbaynesRepos"
PATH_TO_REFERENCE_PROJ=$PERSONAL_PATH

##
## Functions
##
f() {
  bash $PATH_TO_REFERENCE_PROJ/Reference/Mac/Bash/functions.sh $1
}
#
# Locations
#
p() {
  bash $PATH_TO_REFERENCE_PROJ/Reference/Mac/Bash/paths.sh
}
```
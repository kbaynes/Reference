
##### BEGIN PROFILE DEFAULTS
#
# included file - Reference/Mac/Bash/profile-defaults.sh
#
# DO NOT Set default shell to bash in this script - requires a password
# chsh -s /usr/local/bin/bash
#
# Links to functions and paths
#
#
# Functions
# the string PATH_TO_... gets replaced during add-profile-defaults.sh
#
f() {
  bash PATH_TO_REFERENCE_MAC_BASH/functions.sh $1
}
#
# Locations
# Each script is executed in its own shell, so cd only works if the script is sourced
#
alias p='source PATH_TO_REFERENCE_MAC_BASH/paths.sh'

#
# turn off the bash deprecation warning in mac terminal
#
export BASH_SILENCE_DEPRECATION_WARNING=1
#
# Usage `jdk 11` or `jdk 15` to switch java versions
jdk() {
  version=$1
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version
}
P_REF_MAC_BASH="PATH_TO_REFERENCE_MAC_BASH"
P_GITHUB_HOME="PATH_TO_REFERENCE_MAC_BASH/../../.."
# setup nvm
mkdir ~/.nvm
export NVM_DIR="$HOME/.nvm"
if [ "$HOSTTYPE" = "x86_64" ];then
  # detected Intel Mac
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
else
  # assume Apple Silicon Mac
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

echo "Type 'f' to list functions"
echo "Type 'p' to list paths"
echo ""
##### END PROFILE DEFAULTS

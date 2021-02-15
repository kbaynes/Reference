# Bash Setup

Contains a number of defaults for my new Mac.

f() is a set of common actions
p() is a set of common paths

## Add Profile Defaults

1. Sets bash as the default shell
1. Disables the bash deprecation warning
1. Installs f for functions (type 'f')
1. Installs 'alias p' for paths (type 'p')
1. Installs jdk() to switch Java versions

This command can be run multiple times. Backups are kept.
```
cd [path_to]/Reference/Mac/Bash
bash add-profile-defaults.sh
```
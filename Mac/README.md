# New Mac Setup

### Add account to sudoers
Gist: [Add account to sudoers on Mac](https://gist.github.com/kbaynes/912b27ce355ad3bed2d9f69daccb155f)

### iTerm2
https://iterm2.com/
[Fix Operation Not Permitted in iTerm](https://osxdaily.com/2018/10/09/fix-operation-not-permitted-terminal-error-macos/)

### HomeBrew
https://brew.sh/
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
(Git is installed via XCode command line tools as part of HomeBrew)

### Git - Check for Git first using 'git --version'
(if not installed already. Will be installed as part of HomeBrew above.)
```
brew install git
git config --global user.name "Kevin *****"
git config --global user.email Kevin@*****.com
```

### Git Repos Dir
Create the dirs, then cd into Reference (so Bash profile step will work)
```
mkdir -p  ~/MyGitRepos/GitHub
mkdir -p  ~/MyGitRepos/CodeCommit
cd ~/MyGitRepos/GitHub
git clone git@github.com:kbaynes/Reference.git
cd Reference
```

### Bash
The Mac comes with 3.2 (2007), upgrade to latest (5.1+, 2020)
```
brew install bash
sudo cp /etc/shells /etc/shells_bak
printf "add line '/usr/local/bin/bash' and save/quit \n"
sudo vim /etc/shells
printf "chsh requires password \n"
chsh -s /usr/local/bin/bash
```

Once Bash is upgraded, then setup profile defaults: [Mac>Bash/README.md](Bash/README.md)

This command can be run multiple times. Backups are kept.
```
cd Mac/Bash #if in Reference project
# OR cd [path_to]/Reference/Mac/Bash
bash add-profile-defaults.sh
# quit Terminal/Shell to reload profile
```

### SSH Keys 
Download `kevin-at-k*****.private_key` from Google Drive `My Drive/Keys/MyKeyPairs/` then

```
mkdir ~/.ssh/
cp kevin-at-k*****.private_key ~/.ssh/
cp kevin-at-k*****.private_key ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/kevin-at-k*****.private_key
```

### HomeBrew Cask
`brew tap homebrew/cask`

### Java (OpenJDK)
Depends on Brew Cask
See [Installation README](https://github.com/AdoptOpenJDK/homebrew-openjdk)
```
brew update
# this installs the latest version
brew install --cask adoptopenjdk
brew tap AdoptOpenJDK/openjdk
brew install --cask adoptopenjdk11
```

### Maven
Depends on Java
```
brew install maven
```

### Node via NVM
https://formulae.brew.sh/formula/nvm
Setup for NVM is performed in .bash_profile. See the Bash setup section.
```
brew install nvm
nvm install --lts
```

### Yarn
https://formulae.brew.sh/formula/yarn#default
```
brew install yarn
```

### VS Code
https://code.visualstudio.com/docs?dv=osx
Extentions: 
- Java Extension Pack
- Spring Boot Tools
- Spring Boot Dashboard
- Lombok Annotations Support

### Atom
https://atom.io/
Immediately run Atom via Spotlight to add the atom command to terminal automatically
Run `atom ~/` and allow access via Mac security

### DBeaver
https://formulae.brew.sh/cask/dbeaver-community
```
brew install --cask dbeaver-community
```

### Shellcheck
See https://www.shellcheck.net/
```
brew install shellcheck
```

### My Mac Config: Reference
Depends on Git and SSH keys
```
cd ~/MyGitRepos/GitHub
git clone git@github.com:kbaynes/Reference.git
cd Reference
# create a new branch to add local changes
git branch -b <name of new org branch>
git checkout <name of new org branch>
```
Add Bash Functions: See [Add Bash Functions](./Bash/README.md)

### Add Profile Defaults - functions & paths
CD into the Reference/Mac/Bash dir and run `bash add-profile-defaults.sh`

## Kubernetes on Mac
https://gist.github.com/kevin-smets/b91a34cea662d0c523968472a81788f7

### Docker
`brew install --cask docker`
Then run 'docker' from Spotlight to finish Docker Desktop

### Docker Machine
`brew install docker-machine`
Keep an eye out for things not working, might need to start this on startup
```
To have launchd start docker-machine now and restart at login:
  brew services start docker-machine
Or, if you don't want/need a background service you can just run:
  docker-machine start
```

### VirtualBox
`brew install --cask virtualbox`

### Kubernetes Control
`brew install kubectl`

### MiniKube
`brew install minikube`
For MacOS Darwin and Docker use:
```
minikube start --driver=docker
# or --driver=hyperkit
# optional: minikube config set driver hyperkit (or docker)
# create a hello-node to test
kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4
# expose hello-node on 9080
kubectl expose deployment hello-node --type=LoadBalancer --port=8080
minikube service hello-node
# show IP
kubectl get node -o wide
# show the hello-node in browser

minikube delete
```
See: https://github.com/kubernetes/minikube/issues/9016
(To go back to docker use minikube start --driver=docker)

### Local Docker Registry Server
https://docs.docker.com/registry/deploying/
`docker run -d -p 5000:5000 --restart=always --name registry registry:2`

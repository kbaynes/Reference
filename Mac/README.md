# New Mac Setup

### iTerm2
https://iterm2.com/

### HomeBrew
https://brew.sh/
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
(Git was automatically installed, I think it happens here)

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

### Git (git --version)
(if not installed already)
```
brew install git
git config --global user.name "Kevin *****"
git config --global user.email Kevin@*****.com
```

### Git Repos Dir
```
mkdir -p  ~/MyGitRepos/GitHub
mkdir -p  ~/MyGitRepos/CodeCommit
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

### VS Code
https://code.visualstudio.com/docs?dv=osx
Extentions: Java Extension Pack, 

### Atom
https://atom.io/
Immediately run Atom via Spotlight to add the atom command to terminal automatically
Run `atom ~/` and allow access via Mac security

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
```To have launchd start docker-machine now and restart at login:
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

### Local Docker Registry Server
https://docs.docker.com/registry/deploying/
`docker run -d -p 5000:5000 --restart=always --name registry registry:2`

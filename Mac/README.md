# New Mac Setup

### iTerm2
https://iterm2.com/

### HomeBrew
https://brew.sh/
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
(Git was automatically installed, I think it happens here)

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

### VS Code
https://code.visualstudio.com/docs?dv=osx

### My Mac Config: Reference
```
cd ~/MyGitRepos/GitHub
git clone git@github.com:kbaynes/Reference.git
```

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

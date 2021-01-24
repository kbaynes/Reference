# New Mac Setup

### iTerm2
https://iterm2.com/

### HomeBrew
https://brew.sh/
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
(Git was automatically installed, I think it happens here)

### Git (git --version)
(if not installed already)
brew install git

### HomeBrew Cask
`brew tap homebrew/cask`

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
  docker-machine start```

### VirtualBox
`brew install --cask virtualbox`

### Kubernetes Control
`brew install kubectl`

### MiniKube
`brew install minikube`

### Local Docker Registry Server
https://docs.docker.com/registry/deploying/
`docker run -d -p 5000:5000 --restart=always --name registry registry:2`

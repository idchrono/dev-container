# Dev Containers

## Generate ssh keys to access ssh server inside container
```sh
ssh-keygen -b 4096 -t rsa -f dockerkey
```
don't forget to use passphrase

## Build dev containers image (ts-dev-container, cs-dev-container)
- comment unnecessary containers in docker-compose.dev.yml
- run command 
```sh
docker-compose -f docker-compose.dev.yml build
```
- directory to work "/workspace"

## run dev containers
- run command
```sh 
docker-compose -f docker-compose.dev.yml up -d
```
- directory to work "/workspace"

## clone your sources
```sh
git clone https://github.com/your/repository.git /workspace
```

## add preinstalled components to dev container
you can add all components you need to install in dev.dockerfile

## develop inside container with VS Code
- open "vs code"
- press "Ctrl+Shift+P"
- select "Attach to running container"
- select container with name "ts-dev-container" (by default, you can rename it, but don't forget to rename dependencies)
- select workspace directory "/workspace"
- clone your repository here and can start to work with it

## develop inside container with JetBrains (rider, webstorm etc.)
- open "rider"
- select "remote development"
- select "ssh" -> "new project"
- add "ssh connection" 
```
host: localhost
port: 9022 (check it in docker-compose.dev.yml file)
username: root
authentification type: key pair
private key: dockerkey (generated before build dev container)
```
- save new connection
- select you connection in "remote development" window
- press "Check connection and continue"
- "solution file" - select directory with your project
- press "Start IDE and Connect" (maybe "Download IDE and Continue" when first connect)
- input your "passphrase", used when ssh-key was generated

## generate ssh keys for github
- run to generate keys
```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
```
- run to see your public key 
```sh
cat ~/.ssh/id_ed25519.pub
```
- go to "https://github.com/settings/keys" and add your public key

# Extra containers
You can add to your dev-container environment some extra containers like nginx, mongo-db etc.

- [nginx](extra-containers/nginx/readme.md)
- [mongo-db](extra-containers/mongo-db/readme.md)

# Networks
- dev-container-net - network to connect related to your project "extra containers"

# Volumes
- "workspace-data" - your work directory, can be mounted to your file system
- "ssh-data" - mounted directory to store your ssh keys to not lost them after container recreated
- "root-cache" - mounted directory to store cache (at least jetbrains) to not lost them after container recreated

# TS Dev Container

## run dev container
- run command ```docker-compose -f .\docker-compose.dev.yml up -d```
- directory to work "/workspace"

## clone your sources
```sh
git clone https://github.com/your/repository.git /workspace
```

## add preinstalled components to dev container
you can add all conponents you need to install in dev.dockerfile

## develop inside container (vs code)
- open "vs code"
- press "Ctrl+Shift+P"
- select "Attach to running container"
- select container with name "app" (by default, you can rename it, but don't forget to rename dependencies)
- select workspace directory "/workspace"
- clone your repository here and can start to work with it

## generate ssh keys for github
- run 
```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
```
- run to see your public key 
```sh
cat ~/.ssh/id_ed25519.pub
```
- go to "https://github.com/settings/keys" and add your public key

# Nginx container

## run nginx container
- nginx/nginx.conf - edit to map ports and files/directory to necessary locations
```
    by default:
    - 3000 port of app container bind to "/" location
    - 3001 port of app container bind to "/api" location
```
- run command ```docker-compose -f .\docker-compose.nginx.yml up -d```

# Mongo container

## run mongo container
- run command ```docker-compose -f .\docker-compose.mongo.yml up -d```

# extra commands (for all containers at once)
- up all containers at the same time
```sh
docker-compose -f .\docker-compose.dev.yml -f .\docker-compose.mongo.yml -f .\docker-compose.nginx.yml up -d
```
- stop all containers at the same time 
```sh
docker-compose -f .\docker-compose.dev.yml -f .\docker-compose.mongo.yml -f .\docker-compose.nginx.yml stop
```
- drop all containers at the same time 
```sh
docker-compose -f .\docker-compose.dev.yml -f .\docker-compose.mongo.yml -f .\docker-compose.nginx.yml down
```


# Networks
- dev-container-net - network to connect related to your project containers

# Volumes
- "workspace-data" - your work directory, can be mounted to your file system
- "ssh-data" - mounted directory to store your ssh keys to not lost them after container recreated
- "db-data" - mounted directory to store mongodb data to not lost them after container recreated

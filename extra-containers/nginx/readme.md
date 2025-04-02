# Nginx container

## run nginx container
- copy ./nginx.conf.sample -> ./nginx.conf
```sh
cp ./nginx.conf.sample ./nginx.conf
```
- nginx.conf - edit to map ports and files/directory to necessary locations
```
    by default:
    - 8080 port of ts-dev-container container bind to "/" location
    - 3000 port of ts-dev-container container bind to "/api" location
```
- run command
```sh
docker-compose -f docker-compose.nginx.yml up -d
```

# Volumes
- "db-data" - mounted directory to store mongodb data to not lost them after container recreated
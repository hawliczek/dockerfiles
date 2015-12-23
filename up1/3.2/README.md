# docker-up1
dockerfiles for up1 installation

# Intallation
## Installation via docker hub
``docker pull arckosfr/up1``

# Usage
## Volume, port
### PORT
+ 80
+ 443

### Volume
+ /Up1/i
+ /Up1/certs

## Lancement simple
``docker run -d -p 80:80 arckosfr/up1``

## Lancement avec un volume
``docker run -d -p 80:80 -p 443:443 -v /mnt/data:/Up1/i -d /mnt/certs:/Up1/certs --name up1 arckosfr/up1``
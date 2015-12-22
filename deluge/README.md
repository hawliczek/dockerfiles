# Docker Deluge WebUI Container
_maintained by arckosfr_

[![](https://badge.imagelayers.io/arckosfr/deluge:latest.svg)](https://imagelayers.io/?images=arckosfr/deluge:latest 'Get your own badge on imagelayers.io')

## What is it

This Dockerfile (available as ___arckosfr/deluge___) will produce a docker container for the __deluge__ bittorrent client software.

View in Docker Registry [arckosfr/deluge](https://hub.docker.com/r/arckosfr/deluge/)

View in GitHub [*arckosfr/deluge*(https://github.com/arckosfr/deluge)

Deluge configuration is greatly copied from great work of https://github.com/xataz/dockerfiles/tree/master/deluge
thank to xataz !

## Envirronement

* __VER__ = with that you can change the version of deluge wanted (default 1.3-stable)
* __UID__ = You can change the UID (default 5000)
* __GID__ = You can change the GID (default 5000)


## Volumes

* __/config__
 * configuration files for deluge
* __/data__
 * download directory for torrents


## Running arckosfr/deluge Container

    docker run -d -v /docker/data:/data -v /docker/downloads:/downloads -p 8112:8112 -p 58846:58846 --name deluge arckosfr/deluge

## Running arckosfr/deluge Container with external config

    docker run -d -v /docker/data:/data -v /docker/config:/config -p 8112:8112 -p 58846:58846 --name deluge arckosfr/deluge

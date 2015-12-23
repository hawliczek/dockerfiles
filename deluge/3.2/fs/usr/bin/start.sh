#!/bin/sh

if [ -e /config/core.conf ]
then
  mkdir -p /config/state
  chown -R torrent:torrent /config
  echo"Config OK"
else
  cp /config-bkp/* /config/
  mkdir -p /config/state
  chown -R torrent:torrent /config
fi

mkdir -p /data/.torrents
mkdir -p /data/torrents/.in_progress
mkdir -p /data/watch
mkdir -p /home/torrent/.python-eggs

chown -R torrent:torrent /data
chown -R torrent:torrent /home/torrent

supervisord -c /etc/supervisord.conf

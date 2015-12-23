#!/bin/sh

cd /SickRage && git pull
sed -ri 's#torrent:x:5000:5000:Linux User,,,:/home/torrent:/bin/sh#torrent:x:${UID}:${GID}:Linux User,,,:/home/torrent:/bin/sh#' /etc/passwd
if [ ! -f /config/config.ini ]
then
	mv /tmp/config.ini /config/config.ini
	if [ ${TORRENT_METHOD} == "rtorrent" ]
	then
		sed -i "s/<method>/rtorrent/;s/<host>/scgi:\/\/torrent:5000/" /config/config.ini
	elif [ ${TORRENT_METHOD} == "transmission" ]
	then
		sed -i "s/<method>/transmission/;s/<host>/http:\/\/torrent\/torrent\/rpc/" /config/config.ini
	else
		sed -i "s/<method>/blackhole/" /config/config.ini
	fi
fi

chown -R torrent:torrent /SickRage
chown -R torrent:torrent /config
chown -R torrent:torrent /blackhole
chown -R torrent:torrent /torrents

su - torrent -c "/usr/bin/python /SickRage/SickBeard.py --datadir=/config"

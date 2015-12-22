FROM alpine:3.2
MAINTAINER xataz <xataz@mondedie.fr>

ADD start.sh /usr/bin/start.sh
ADD config.ini /tmp/config.ini

VOLUME [ "/config", "/blackhole", "/torrents"]
EXPOSE 8081
CMD ["/usr/bin/start.sh"]

ENV TORRENT_METHOD="rtorrent"
ENV UID=5000
ENV GID=5000

RUN addgroup -g ${GID} torrent && adduser -h /home/torrent -s /bin/sh -D -G torrent -u ${UID} torrent && \
	apk add --update python py-pip git && pip install cheetah && \
	git clone https://github.com/SickRage/SickRage.git && chown -R torrent:torrent /SickRage && \
	apk del py-pip && rm -rf /var/cache/apk/* && \
	chmod +x /usr/bin/start.sh
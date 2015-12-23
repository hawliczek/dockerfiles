FROM alpine:3.2
MAINTAINER arckosfr <contact@lemark.xyz>

ENV VER=1.3-stable UID=5000 GID=5000

ADD fs /
RUN mkdir -p /home/torrent && \
    addgroup -g ${GID} torrent && adduser -h /home/torrent -s /bin/sh -D -G torrent -u ${UID} torrent && \
    echo "@testing http://dl-3.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --update \
		gcc \
		git \
		librsvg \
		libtorrent-rasterbar@testing \
		python \
		py-gtk \
		py-pip \
		supervisor \
		xdg-utils && \
    pip install --upgrade pip && \
	pip install \
		cffi \
		chardet \
		cryptography \
		enum34 \
		mako \
		pyOpenSSL \
		service_identity \
		setuptools \
		six \
		pyxdg \
		twisted && \
    git clone -b ${VER} git://deluge-torrent.org/deluge.git && \
    apk del git py-pip && \
    cd deluge && python setup.py build && python setup.py install && \
    apk del gcc && rm /var/cache/apk/* && \
    rm -R /deluge && cp -R /config /config-bkp && \
    chmod a+x /usr/bin/start.sh && mkdir /data && chown torrent:torrent /data


    VOLUME ["/data", "/config"]

    EXPOSE 53160 53160/udp 8112 58846

    CMD ["/usr/bin/start.sh"]

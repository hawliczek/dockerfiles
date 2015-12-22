FROM xataz/alpine:3.3
MAINTAINER Bastien Schwartz <bschwartz@lemark.xyz>

ENV VER=1.3-stable
ENV UID=5000
ENV GID=5000

ADD fs /
RUN mkdir -p /home/torrent && \
    addgroup -g ${GID} torrent && adduser -h /home/torrent -s /bin/sh -D -G torrent -u ${UID} torrent && \
    echo "http://dl-3.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --update python py-setuptools py-six py-mako \
    py-chardet  xdg-utils py-xdg py-gtk libtorrent-rasterbar \
    py-openssl py-twisted py-enum34 py-pip librsvg git supervisor &&\
    pip install service_identity py-cffi py-cryptography && \
    git clone -b ${VER} git://deluge-torrent.org/deluge.git && \
    apk del git py-pip && \
    cd deluge && python setup.py build && python setup.py install && \
    rm /var/cache/apk/* && \
    rm -R /deluge && cp -R /config /config-bkp && \
    chmod a+x /usr/bin/start.sh && mkdir /data && chown torrent:torrent /data


    VOLUME ["/data"]
    VOLUME ["/config"]

    EXPOSE 53160
    EXPOSE 53160/udp
    EXPOSE 8112
    EXPOSE 58846

    CMD ["/usr/bin/start.sh"]

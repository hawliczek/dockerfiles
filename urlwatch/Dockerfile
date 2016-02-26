FROM xataz/alpine:3.3-tini
MAINTAINER arckosfr <contact@lemark.xyz>

ENTRYPOINT ["urlwatch"]
CMD ["usr/bin/tini","--","urlwatch"]

ENV TORRENT_METHOD="rtorrent" UID=5000 GID=5000

RUN	apk add --update \
		python3 \
		git \
		py-pip \
	&& pip install -U pip \
	&& pip install \
		pyyaml \
		minidb \
		requests \
		keyring \
	&& git clone https://github.com/thp/urlwatch.git \
	&& cd urlwatch && python setup.py install
	apk del py-pip git && rm -rf /var/cache/apk/* && \

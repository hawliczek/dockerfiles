FROM	eboraas/debian:jessie

MAINTAINER	arckosfr <bschwartz@lemark.xyz>

VOLUME	[ "/data" ]

WORKDIR	/usr/src

RUN apt-get update && apt-get install -y --no-install-recommends cpio ca-certificates wget tar libncurses-dev build-essential fakeroot kernel-package u-boot-tools zlib1g-dev libncurses5-dev liblz4-tool
ADD	build.sh /root/

CMD	/root/build.sh

ENV	VERSION=4.3

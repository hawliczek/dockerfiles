FROM alpine:3.2
MAINTAINER arckosfr <contact@lemark.xyz>


RUN apk add --update \
			go \
			git && \
        cd / && git clone https://github.com/Upload/Up1 && \
		cd /Up1 && \
		go build server.go && \
        mv /Up1/server /usr/bin/up1 && \
        apk del git go && rm -rf /var/cache/apk/*

ADD start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

EXPOSE 80 443
WORKDIR /Up1

CMD ["/usr/bin/start.sh"]

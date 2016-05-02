FROM xataz/alpine:3.3

RUN apk add --update unbound curl
RUN rm -rf /var/cache/apk/*

RUN mkdir -p /var/cache/unbound && \
    chown unbound:unbound /var/cache/unbound

COPY baddomains.sh /etc/periodic/daily/
RUN chmod +x /etc/periodic/daily/baddomains.sh

COPY entrypoint.sh start.sh /
RUN chmod +x /entrypoint.sh

ADD unbound.conf /usr/local/etc/unbound/unbound.conf
RUN chown -R unbound:unbound /usr/local/etc/unbound/

EXPOSE 53/udp
EXPOSE 53

CMD ["tini","--","start.sh"]

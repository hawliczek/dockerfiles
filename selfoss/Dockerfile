FROM xataz/nginx:latest
MAINTAINER Bastien Schwartz <bschwartz@lemark.xyz>

ENV UID=991 GID=991
EXPOSE 80
VOLUME /var/www/html/data

ADD https://github.com/SSilence/selfoss/releases/download/2.14/selfoss-2.14.zip /tmp/
ADD files/run.sh /
RUN apk add --update php-fpm php-json php-zlib php-xml php-dom php-curl \
    php-gd php-iconv php-mcrypt php-pdo php-pdo_sqlite\
	php-ctype unzip && \
	apk add -u musl && \
	rm -rf /var/cache/apk/* && \
  mkdir -p /var/www/html && \
	unzip /tmp/selfoss-*.zip -d /var/www/html && \
	cp -R /var/www/html/data /var/www/html/bkp &&\
	rm /tmp/selfoss-*.zip && \
	sed -ri 's#max_execution_time = 30#max_execution_time = 300#' /etc/php/php.ini && \
    chmod +x /run.sh
ADD files/selfoss.conf /sites-enabled/
ADD files/php-fpm.conf /etc/php/

CMD ["/run.sh"]

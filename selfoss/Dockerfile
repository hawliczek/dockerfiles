FROM xataz/nginx:latest
MAINTAINER arckosfr <contact@lemark.xyz>

ENV UID=991 GID=991 VER=2.15
EXPOSE 80
VOLUME /var/www/html/data

ADD https://github.com/SSilence/selfoss/releases/download/${VER}/selfoss-${VER}.zip /tmp/
ADD files/run.sh /
ADD files/cron /etc/periodic/15min/selfoss

RUN apk add --update \
		musl \
		php-fpm \
		php-json \
		php-zlib \
		php-xml \
		php-dom \
		php-curl \
		php-gd \
		php-iconv \
		php-mcrypt \
		php-pdo \
		php-pdo_sqlite\
		php-ctype \
		unzip && \
	rm -rf /var/cache/apk/* && \
	mkdir -p /var/www/html && \
	unzip /tmp/selfoss-*.zip -d /var/www/html && \
	cp -R /var/www/html/data /var/www/html/bkp &&\
	rm /tmp/selfoss-*.zip && \
	sed -ri 's#max_execution_time = 30#max_execution_time = 300#' /etc/php/php.ini && \
    chmod +x /run.sh /etc/periodic/15min/selfoss
	
COPY files/selfoss.conf /sites-enabled/
COPY files/php-fpm.conf /etc/php/

CMD ["tini","--","/run.sh"]

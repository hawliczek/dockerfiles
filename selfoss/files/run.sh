#!/bin/sh
addgroup -g ${GID} www-data && adduser -H -s /bin/sh -D -G www-data -u ${UID} www-data
chown www-data:www-data /tmp
if [ -e /var/www/html/data/config.ini ]
then
	ln -s /var/www/html/data/config.ini /var/www/html/config.ini
	chown -R www-data:www-data /var/www/html
else
	cp -R /var/www/html/bkp/* /var/www/html/data/
	mv /var/www/html/defaults.ini /var/www/html/data/config.ini
	ln -s /var/www/html/data/config.ini /var/www/html/config.ini
	sed -ri 's#base_url=#base_url=/#' /var/www/html/data/config.ini
	chown -R www-data:www-data /var/www/html
fi
php-fpm
nginx -g 'daemon off;'

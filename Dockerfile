FROM php:7.4-apache

RUN apt-get update && apt-get install -qy \
      git unzip zip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
	composer self-update 1.10.22 && \
	# docker-php-ext-enable zip && \
	rm -rf /var/lib/apt/lists/* /var/cache/apt/*

COPY custom.ini /usr/local/etc/php/conf.d/custom.ini

WORKDIR /var/www

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]

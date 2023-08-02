FROM	debian:buster

RUN	apt-get update -y && apt-get upgrade -y

RUN	apt install -y wget mariadb-client php7.3 php-mysql php-fpm netcat php-gd sendmail

RUN	mkdir -p /var/run/php /var/www /var/www/wordpress \
	&& chown -R www-data:www-data /var/www /var/www/wordpress /var/log /run/php

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp 

COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY	tools/setup.sh /tmp/setup.sh

WORKDIR	/tmp

USER	www-data

ENTRYPOINT	[ "sh" , "/tmp/setup.sh" ]

CMD	[ "php-fpm7.3" , "-F" ] 

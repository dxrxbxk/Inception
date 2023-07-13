FROM	debian:buster

RUN	apt update -y && apt upgrade -y && \
	apt install -y wget mariadb-client php7.3 php-mysql php-fpm && \
	wget https://fr.wordpress.org/latest-fr_FR.tar.gz -P /var/www && \
	cd /var/www && tar -xzf latest-fr_FR.tar.gz && rm latest-fr_FR.tar.gz && \
	chown -R root:root /var/www/wordpress

RUN	service php7.3-fpm start

#COPY	conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf

COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY	conf/wp-config.php /var/www/wordpress/wp-config.php

##CMD	["php", "-S", "0.0.0.0:9000", "-t", "/var/www/wordpress"]

#CMD	["/usr/sbin/php-fpm7.3", "-F" ]

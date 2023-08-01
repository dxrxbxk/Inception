FROM	debian:buster

RUN	apt update -y && apt upgrade -y && \
	apt install -y wget mariadb-client php7.3 php-mysql php-fpm sendmail netcat\
	&& wget https://fr.wordpress.org/latest-fr_FR.tar.gz -P /var/www \
	&& cd /var/www && tar -xzf latest-fr_FR.tar.gz && rm latest-fr_FR.tar.gz \
	&& chown -R root:root /var/www/wordpress \
	&& mkdir -p /var/run/php \
	&& chown -R root /var/www/wordpress \
	&& mkdir -p /root/utils

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp 

COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY	tools/setup.sh /root/utils/setup.sh

WORKDIR	/root/utils

ENTRYPOINT	[ "sh" , "/root/utils/setup.sh" ]


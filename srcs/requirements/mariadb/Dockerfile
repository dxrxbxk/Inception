FROM	debian:buster

RUN	apt-get update -y && apt-get upgrade -y && apt install mariadb-server wget -y \
        && mkdir -p /var/run/mysqld \
        && chown -R mysql:mysql /var/run/mysqld \
        && chown -R mysql:mysql /etc/mysql/ \
	&& mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld

COPY	conf/my.cnf /etc/mysql/
COPY	tools/setup.sh /tmp/setup.sh
COPY	tools/init.sql /tmp/init.sql

RUN     chown -R mysql:mysql /tmp/

USER	mysql

ENTRYPOINT	["sh", "/tmp/setup.sh"]


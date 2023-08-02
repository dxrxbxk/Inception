FROM	debian:buster

RUN	apt-get update -y && apt-get upgrade -y 

RUN	apt install mariadb-server wget gettext -y

RUN	mkdir -p /var/run/mysqld /run/mysqld \
        && chown -R mysql:mysql /var/run/mysqld /etc/mysql/ /run/mysqld

COPY	conf/my.cnf /etc/mysql/
COPY	tools/setup.sh /tmp/setup.sh
COPY	tools/init.sql /tmp/init.sql

RUN     chown -R mysql:mysql /tmp/

USER	mysql

ENTRYPOINT	[ "sh" , "/tmp/setup.sh" ]

